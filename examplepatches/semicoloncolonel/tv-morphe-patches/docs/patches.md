# What the patches do

Each row is a patch, the Android TV apps it is for, and what it does. Morphe Manager shows the same descriptions. Some patches have options, which you set in Morphe Manager before patching. [Supported apps](apps.md) lists the versions each app was tested on, and [Known issues](known-issues.md) lists the problems already known.

| Patch | Apps | What it does |
|-------|------|--------------|
| Allow screenshots | CNN (off by default) | Lets you take screenshots and screen recordings of the app. |
| Auto-skip | Apple TV | Presses Skip for you on the parts you choose: Apple's promos for other titles, recaps, and intros. |
| Block ads | JustWatch | Removes the banner, native, full-screen, and video ads. |
| Block analytics & tracking | Apple TV (off by default) | Reduces Apple's usage metrics and stops playback reports. The app also stops downloading updates to its screens between app updates. |
| Block analytics & tracking | ABC News (off by default), CBS News (off by default), Disney+ (off by default), ESPN (off by default), Fandango at Home (off by default), Fox Local (off by default), Fox News (off by default), Fox One (off by default), HBO Max (off by default), JustWatch (off by default), MGM+ (off by default), Movies Anywhere (off by default), NBA (off by default), NFL (off by default), PBS (off by default), Peacock (off by default), Plex (off by default), Pluto TV (off by default), Starz (off by default), Tubi (off by default) | Stops the app's analytics, ad measurement, and marketing services. |
| Block analytics & tracking | MLB (off by default) | Stops the app's analytics and audience-measurement services. |
| Block analytics & tracking | NewsNation (off by default) | Stops the apps' analytics, attribution, and audience-measurement services. |
| Block analytics & tracking | CNBC (off by default), MS NOW (off by default), NBC News (off by default) | Stops the analytics, audience-measurement, and attribution services in the app and in the web pages it shows. A blocked request gets an empty answer, so the pages keep working. |
| Block analytics & tracking | CNN (off by default), The Roku Channel (experimental, off by default) | Stops the analytics and audience-measurement services in the app's web pages. |
| Block analytics & tracking (experimental) | Hulu (off by default) | Blocks the app's analytics and tracking requests (Hulu telemetry, Conviva, and Adobe) through an in-process native hook, with no root. Functional traffic is untouched. |
| Disable auto-updates | ABC News (off by default), CBS News (off by default), CNBC (off by default), CNN (off by default), Disney+ (off by default), ESPN (off by default), Fandango at Home (off by default), Fox Local (off by default), Fox News (off by default), Fox One (off by default), HBO Max (off by default), JustWatch (off by default), MGM+ (off by default), MLB (off by default), Movies Anywhere (off by default), MS NOW (off by default), NBA (off by default), NBC News (off by default), NewsNation (off by default), NFL (off by default), PBS (off by default), Peacock (off by default), Pluto TV (off by default), Starz (off by default), Tubi (off by default) | Stops the Play Store from replacing the patched app with the official version. |
| Disable MGM+ AI | MGM+ (off by default) | Turns off the MGM+ AI chat assistant, its prompts, and the AI-picks rows. |
| Disable Pairip license check | Fox One, The Roku Channel | Lets the patched app start by skipping Google's Pairip license check. |
| Force highest quality | Fandango at Home (off by default), Movies Anywhere (off by default) | Plays the highest quality your device and plan allow, instead of lowering it to match the measured connection speed. Its options: **Highest bitrate**, on by default, keeps each title at its highest bitrate. **4K on any display**, off by default, offers the 4K editions when the TV output is set below 4K. The device still needs Widevine L1 and HDCP 2.2, and the app's server can still limit the quality for a title or plan. Experimental: turn it off if videos buffer. |
| Force highest quality | Prime Video (off by default) | Reports every video quality as fully supported, so the app streams the highest available. Experimental: can stutter or fail on a device that cannot decode the top quality. |
| Force highest quality | ABC News (off by default), CBS News (off by default), Fox Local (off by default), Fox News (off by default) | Plays the highest quality the stream offers, instead of lowering it to match the measured connection speed. On CBS News, its Ignore device limits option, on by default, also ignores the bitrate and resolution limits CBS can set for a device model. Experimental: turn it off if videos buffer. |
| GmsCore support | JustWatch (off by default) | Signs in with Google through GmsCore instead of Google Play services. |
| Hide "Are you still watching?" | CBS News | Stops the "Are you still watching?" prompt from pausing long viewing sessions. |
| Hide betting odds | MLB (off by default) | Removes the betting-odds banner from the scores screen. |
| Hide developer menu | MS NOW | Removes the developer menu, which a long press of Back opens, and the hint about it that appears when the app starts. |
| Hide device identifiers | ABC News (off by default), CBS News (off by default), CNBC (off by default), Disney+ (off by default), ESPN (off by default), Fandango at Home (off by default), Fox Local (off by default), Fox News (off by default), Fox One (off by default), HBO Max (off by default), JustWatch (off by default), MGM+ (off by default), MLB (off by default), Movies Anywhere (off by default), MS NOW (off by default), NBA (off by default), NBC News (off by default), NewsNation (off by default), NFL (off by default), PBS (off by default), Peacock (off by default), Pluto TV (off by default), Starz (off by default), The Roku Channel (experimental, off by default), Tubi (off by default) | Hides details about your device from the app. Choose which ones in the patch options. |
| Hide device identifiers | CNN (off by default) | Gives the app's web pages a zeroed advertising ID with ad tracking limited. CNN has its own version of this patch, because the shared one would stop the app's advertising ID lookup with an error. |
| Hide rating prompt | Apple TV | Stops the review prompt from Google Play. |
| Hide rating prompt | Disney+, ESPN, Fox One, HBO Max, JustWatch, MGM+, MLB, NBA, NFL, PBS, Peacock, Plex, Pluto TV, Starz, Tubi | Stops Google Play's rate-this-app sheet. |
| Hide rating prompt | NewsNation | Stops the "rate this app" dialog. |
| Hide sign-in prompts | Tubi | Stops the app from asking you to sign in when you pause or leave a title. |
| Hide sponsored content | Plex | Removes sponsored titles and promotion cards from the home screen and rows. |
| Hide sponsored titles | JustWatch | Removes JustWatch's own sponsored title cards and sponsored trailers before videos. |
| Hide unavailable titles | JustWatch (off by default) | Hides Watchlist titles that are not on the services you picked. With All picked, hides titles that no service offers, except unreleased titles. |
| Hide update prompt | ABC News | Stops the app from asking for, or requiring, an update from Google Play. A required update would otherwise lock out the patched version. |
| Hide update prompts | Tubi | Stops the app from asking you to update. A patched app cannot be updated through Google Play. |
| Hide watched titles | JustWatch (off by default) | Hides movies you marked as seen and shows you are caught up on from the Watchlist. |
| Highest quality | Tubi | Plays the highest-resolution version of each title and live channel, at its highest bitrate. Turn it off if videos buffer. |
| Mask ads | Fandango at Home | Covers the ads in free titles with a "We'll be right back!" screen and mutes them. Fandango streams a free title only after its ads play, so the ads cannot be removed. Its Show it in your language option, experimental and off by default, shows the cover in your device's language when it is Arabic, Chinese, French, German, Greek, Italian, Korean, Portuguese, Russian, Spanish, Tagalog, or Vietnamese; other languages show English. |
| Mask live ad breaks | MLB (off by default) | Covers live gambling-ad breaks with a notice. Its Show it in your language option, experimental and off by default, shows the cover in your device's language when it is Arabic, Chinese, French, German, Greek, Italian, Korean, Portuguese, Russian, Spanish, Tagalog, or Vietnamese; other languages show English. |
| Mask live ad breaks | Pluto TV | Covers live ad breaks with a "We'll be right back!" screen and mutes them. Its Show it in your language option, experimental and off by default, shows the cover in your device's language when it is Arabic, Chinese, French, German, Greek, Italian, Korean, Portuguese, Russian, Spanish, Tagalog, or Vietnamese; other languages show English. |
| Opt out of data sale & sharing | CBS News, Fox Local, Fox News | Starts the app opted out of the sale and sharing of your data. |
| Reject tracking consent | NBA, NFL | Answers the app's tracking consent prompt with Reject All, so the prompt does not appear and the optional trackers stay off. |
| Remove social sign-in | Tubi | Removes the Continue with Google sign-in option. |
| Show release times | Apple TV | Shows the day and time in your time zone when an upcoming episode or title is released. |
| Skip ads | Disney+, ESPN | Removes pre-roll, mid-roll, and pause ads. |
| Skip ads (experimental) | ABC News | Removes the ads in on-demand videos and the ads shown when a video is paused. Its Mask live ad breaks option, on by default, covers live ad breaks with a "We'll be right back!" screen and mutes them. |
| Skip ads (experimental) | CBS News (off by default) | Removes the ads before on-demand videos and local station streams. Its Mask live ad breaks option, on by default, covers the ad breaks Google inserts into CBS News 24/7 and mutes them. |
| Skip ads | Fox One | Removes the ads in on-demand videos and the limits on skipping live TV breaks. |
| Skip ads (experimental) | Fox News | Removes the video ads and pause ads in on-demand videos, and the targeted ads that replace part of a live channel's breaks. The commercials in the channel's own broadcast still play. |
| Skip ads | HBO Max | Blocks HBO Max's ad servers, so videos play without ads. |
| Skip ads | MLB | Removes the ads before on-demand videos. |
| Skip ads | CNBC, MS NOW, NBC News | Removes the ads in on-demand clips. On CNBC and MS NOW, clips play from the network's own video server instead of the ad server's copy. On NBC News, the preroll request gets an empty answer. Ads in the live stream still play. |
| Skip ads | NBA | Removes the ads the app plays before and during videos. Ads that are part of a live broadcast still play. |
| Skip ads | NewsNation | Removes the video ads before clips. |
| Skip ads | NFL | Stops the video ads before and during clips and highlights. |
| Skip ads | PBS | Stops the sponsor messages before and during videos. |
| Skip ads | Peacock | Turns off the ads inserted into Peacock streams. |
| Skip ads | Plex | Stops on-demand titles from requesting video ads and pause ads. |
| Skip ads | Pluto TV | Removes the ads, ad markers, and pause ads from on-demand videos. |
| Skip ads | Prime Video | Removes the ads in Android TV titles. Ads in live channels still play. |
| Skip ads | The Roku Channel | Removes the bumper, pre-roll, and mid-roll ads from on-demand videos. |
| Skip ads | Tubi | Removes the ads in videos, including ad breaks and image pause ads. |
| Skip ads | YouTube TV | Removes the ads YouTube adds to on-demand videos and recordings in the official YouTube TV app, along with ad and analytics tracking. Experimental and not yet tested on a device. It needs version 4.01.03, for Android TV devices on Android 12 or later. Commercials that are part of a live broadcast still play. |
| Skip ads (experimental) | Hulu | Removes the ads Hulu stitches into its on-demand videos, through an in-process native hook, with no root. It removed the ad breaks from an on-demand episode in testing, but it has not been tested widely and may not remove every ad. It only removes explicit ad periods, so it does not affect ad-free content. Live broadcast commercials are part of the broadcast and still play. Sign in with the activation code at hulu.com/activate. |
| Skip launch video | Disney+ | Opens the app without the branded intro animation. |
| Skip launch video | Pluto TV | Opens the app with the static logo instead of the branded intro video. |
| Skip lion intro | MGM+ | Opens the app after the MGM+ logo, without the lion intro video. |
| Skip pre-roll promo | Starz | Starts titles without the promo for other Starz shows that plays first. |
| Skip splash sound | Fox One | Opens the app with the silent splash animation. Without it, a re-signed Fox One 1.21.0 plays a few seconds of static at launch. |
| Streaming titles only | JustWatch (off by default) | Shows only titles you can stream on a subscription or for free on the Watchlist. Titles you can only rent or buy are hidden. Picking a Types filter in the app overrides this. |
| Use the public web app | MS NOW | Loads the public MS NOW web app. The 7.10.2 build loads a test version of it by default. |
| Video quality | HBO Max (off by default) | Plays the video resolution you choose instead of letting the app pick one. Videos can buffer if your connection is too slow for it. |
| YT TV+ (ad-free YouTube TV) | YouTube TV | Makes this app into YT TV+, an ad-free YouTube TV app that installs beside your other apps. It loads the YouTube TV live guide, library, and DVR, and removes the ads YouTube adds to on-demand videos and recordings, along with ad and analytics tracking. It does not give you regular YouTube. Commercials that are part of a live broadcast still play. Sign in with the code at tv.youtube.com/start. |
