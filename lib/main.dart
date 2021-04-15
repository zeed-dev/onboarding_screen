import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'On Boarding Screen',
      theme: ThemeData(
        primaryColor: '6686DB'.toColor(),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: OnBoardingScreen(),
    );
  }
}

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // NOTE: CONTENT STATE
  int contentState = 0;

  // NOTE: LIST OF TITLE
  List<String> titles = [
    'Let us take care of you',
    'Always use a mask',
    'Work from home',
  ];

  // NOTE: LIST OF DESCRIPTION
  List<String> descriptions = [
    'We are here to take care of you \nwith pleasure. besides that we will \nmonitor your condition 24/Day',
    'always use a mask when you want\nto travel and keep your\nbody immunity',
    'to avoid the spread of covid 19. \nyou can do office work from home and\nalways be close to your family',
  ];

  // NOTE: LIST OF IMAGES ASSETS
  List<String> images = [
    'assets/illustration1.png',
    'assets/illustration2.png',
    'assets/illustration3.png',
  ];

  // NOTE: Get Title
  String getTitle(int contentState) {
    if (contentState == 0) {
      return titles[0];
    } else if (contentState == 1) {
      return titles[1];
    } else {
      return titles[2];
    }
  }

  // NOTE: Get description
  String getDescriptions(int contentState) {
    if (contentState == 0) {
      return descriptions[0];
    } else if (contentState == 1) {
      return descriptions[1];
    } else {
      return descriptions[2];
    }
  }

  // NOTE: Get description
  String getImages(int contentState) {
    if (contentState == 0) {
      return images[0];
    } else if (contentState == 1) {
      return images[1];
    } else {
      return images[2];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: 'ECF8FF'.toColor(),
      body: SafeArea(
        child: Stack(
          children: [
            // NOTE: Image Ilustration
            Container(
              margin: EdgeInsets.only(top: 24),
              child: Image(
                height: 640,
                image: AssetImage(getImages(contentState)),
              ),
            ),
            // NOTE: Top Components
            Container(
              padding: EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  contentState != 0
                      ? GestureDetector(
                          onTap: () {
                            print("back");
                            setState(() {
                              if (contentState >= 0) {
                                contentState--;
                              }
                              print(contentState);
                            });
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 18,
                          ),
                        )
                      : SizedBox(),
                  contentState != 2
                      ? GestureDetector(
                          onTap: () {
                            print("skip");
                          },
                          child: Text(
                            'Skip',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      : SizedBox()
                ],
              ),
            ),
            // NOTE: Contents
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: Container(
                  color: 'FBFDFF'.toColor(),
                  width: double.infinity,
                  padding: EdgeInsets.all(32),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // NOTE: title
                      Text(
                        getTitle(contentState),
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        getDescriptions(contentState),
                        style: GoogleFonts.poppins(
                          color: '878F95'.toColor(),
                          letterSpacing: 2,
                          height: 2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      // NOTE: Botom Component
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // NOTE: Indicator
                          Row(
                            children: [
                              // NOTE: 0
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Container(
                                  height: 4,
                                  width: contentState == 0 ? 18 : 12,
                                  color: contentState == 0
                                      ? '6686d8'.toColor()
                                      : 'CBD6F3'.toColor(),
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              // NOTE: 1
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Container(
                                  height: 4,
                                  width: contentState == 1 ? 18 : 12,
                                  color: contentState == 1
                                      ? '6686d8'.toColor()
                                      : 'CBD6F3'.toColor(),
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              // NOTE: 2
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Container(
                                  height: 4,
                                  width: contentState == 2 ? 18 : 12,
                                  color: contentState == 2
                                      ? '6686d8'.toColor()
                                      : 'CBD6F3'.toColor(),
                                ),
                              ),
                              // NOTE: Button Next
                            ],
                          ),
                          contentState != 2
                              ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (contentState <= 2) {
                                        contentState++;
                                      }
                                      print(contentState);
                                    });
                                  },
                                  child: Container(
                                    child: Image(
                                      height: 40,
                                      image: AssetImage('assets/next.png'),
                                    ),
                                  ),
                                )
                              : SizedBox(
                                  height: 40,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text("Get Started"),
                                    style: ElevatedButton.styleFrom(
                                        primary: '6686D8'.toColor(),
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        )),
                                  ),
                                )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
