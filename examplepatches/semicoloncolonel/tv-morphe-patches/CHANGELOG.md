## [1.2.0](https://github.com/semicoloncolonel/tv-morphe-patches/compare/v1.1.2...v1.2.0) (2026-11-28)

### New apps

- **ABC News**: Skip ads removes the ads in on-demand videos and the ads shown when a video is paused. Hide update prompt stops the app from asking for, or requiring, an update.
- **CBS News**: Skip ads, off by default, removes the ads before on-demand videos and local station streams. Hide "Are you still watching?" and Opt out of data sale & sharing are also included.
- **CNBC** and **NBC News**: Skip ads removes the ads in on-demand clips. Ads in the live stream still play.
- **CNN**: Allow screenshots, off by default, lets you take screenshots and screen recordings of the app.
- **Fandango at Home**: Mask ads covers the ads in free titles with a "We'll be right back!" screen and mutes them.
- **Fox Local**: Opt out of data sale & sharing starts the app opted out of the sale and sharing of your data.
- **Fox News**: Skip ads removes the video ads and pause ads in on-demand videos and the targeted ads on live channels. Opt out of data sale & sharing is also included.
- **Movies Anywhere**: The app is supported with the shared patches listed below.
- **MS NOW**: Skip ads removes the ads in on-demand clips, and Use the public web app loads the public MS NOW web app instead of the test version this build loads. The supported version, 7.10.2, is a beta, so it is marked experimental.
- **The Roku Channel**: Skip ads removes the Roku bumper, pre-roll, and mid-roll ads from on-demand videos. Disable Pairip license check lets the patched app start. Its Block analytics & tracking and Hide device identifiers are experimental and have not been tested on a device yet.

Every new app also has Block analytics & tracking and Hide device identifiers, and every one except The Roku Channel has Disable auto-updates. ABC News, CBS News, Fandango at Home, Fox Local, Fox News, and Movies Anywhere also have Force highest quality. All of these are off by default.

### New patches

- **Fox One**: Skip splash sound opens 1.21.0 with its silent splash animation. Without it, the patched app plays a few seconds of static at launch.

### Supported versions

- Apple TV 17.0.4, Disney+ 26.21.0+rc3-2026.11.17, Fox One 1.21.0, HBO Max 22.1.0.82, JustWatch 26.45.4, NBA 1.2.0.20261103221954 and 1.4.0.20261113201204, NFL 18.28.0 and 18.29.0, Peacock 7.11.200, Starz 6.12.2, Tubi 10.46.5000, and YT TV+ 8.02.300 and 8.03.300. The earlier versions are still supported.

### Changes

- **MLB** and **Pluto TV**: Translate ad break screen is now the Show it in your language option of Mask live ad breaks, off by default. If you used Translate ad break screen, turn on that option when you patch.

### Bug fixes

- **Apple TV**: Show release times now shows the time for evening releases in the Americas. Before, a release that fell on the next day in UTC kept its label without a time.
- **JustWatch**: GmsCore support no longer crashes the app when it starts Firebase In-App Messaging.


## [1.1.2](https://github.com/semicoloncolonel/tv-morphe-patches/compare/v1.1.1...v1.1.2) (2026-11-18)

### Bug fixes

- **MLB**: Skip ads no longer breaks a playlist that starts with an ad. Removing that ad also removed the lines that begin the playlist, so the video could not play. An encryption or map change right before an ad break is now kept as well.
- **YouTube TV**: Block tracking now answers each blocked request with an empty response, as intended. Before, the blocked request returned nothing, which could cause errors in the page.


## [1.1.1](https://github.com/semicoloncolonel/tv-morphe-patches/compare/v1.1.0...v1.1.1) (2026-11-18)

### Supported apps

- **Starz**: the Android TV build of 6.12.1 (version code 9511) is now supported. Before, 6.12.1 was listed with the phone build's version code (4519), so Morphe Manager refused the Android TV build and offered the phone build instead. 6.12.0 is still supported.
- **Starz**: 6.11.0 is no longer supported. It was a phone version and was never tested on an Android TV build.
