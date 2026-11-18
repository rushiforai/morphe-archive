# What the patches do

Each row is a patch, the Android TV apps it is for, and what it does. Morphe Manager shows the same descriptions. Some patches have options, which you set in Morphe Manager before patching. [Supported apps](apps.md) lists the versions each app was tested on, and [Known issues](known-issues.md) lists the problems already known.

| Patch | Apps | What it does |
|-------|------|--------------|
| Auto-skip | Apple TV | Presses Skip for you on the parts you choose: Apple's promos for other titles, recaps, and intros. |
| Block ads | JustWatch | Removes the banner, native, full-screen, and video ads. |
| Block analytics & tracking | Apple TV (off by default) | Reduces Apple's usage metrics and stops playback reports. The app also stops downloading updates to its screens between app updates. |
| Block analytics & tracking | Disney+ (off by default), ESPN (off by default), Fox One (off by default), HBO Max (off by default), JustWatch (off by default), MGM+ (off by default), NBA (off by default), NFL (off by default), PBS (off by default), Peacock (off by default), Plex (off by default), Pluto TV (off by default), Starz (off by default), Tubi (off by default) | Stops the app's analytics, ad measurement, and marketing services. |
| Block analytics & tracking | MLB (off by default) | Stops the app's analytics and audience-measurement services. |
| Block analytics & tracking | NewsNation (off by default) | Stops the apps' analytics, attribution, and audience-measurement services. |
| Block analytics & tracking (experimental) | Hulu (off by default) | Blocks the app's analytics and tracking requests (Hulu telemetry, Conviva, and Adobe) through an in-process native hook, with no root. Functional traffic is untouched. |
| Disable auto-updates | Disney+ (off by default), ESPN (off by default), Fox One (off by default), HBO Max (off by default), JustWatch (off by default), MGM+ (off by default), MLB (off by default), NBA (off by default), NewsNation (off by default), NFL (off by default), PBS (off by default), Peacock (off by default), Pluto TV (off by default), Starz (off by default), Tubi (off by default) | Stops the Play Store from replacing the patched app with the official version. |
| Disable MGM+ AI | MGM+ (off by default) | Turns off the MGM+ AI chat assistant, its prompts, and the AI-picks rows. |
| Disable Pairip license check | Fox One | Lets the patched app start by skipping Google's Pairip license check. |
| Force highest quality | Prime Video (off by default) | Reports every video quality as fully supported, so the app streams the highest available. Experimental: can stutter or fail on a device that cannot decode the top quality. |
| GmsCore support | JustWatch (off by default) | Signs in with Google through GmsCore instead of Google Play services. |
| Hide betting odds | MLB (off by default) | Removes the betting-odds banner from the scores screen. |
| Hide device identifiers | Disney+ (off by default), ESPN (off by default), Fox One (off by default), HBO Max (off by default), JustWatch (off by default), MGM+ (off by default), MLB (off by default), NBA (off by default), NewsNation (off by default), NFL (off by default), PBS (off by default), Peacock (off by default), Pluto TV (off by default), Starz (off by default), Tubi (off by default) | Hides details about your device from the app. Choose which ones in the patch options. |
| Hide rating prompt | Apple TV | Stops the review prompt from Google Play. |
| Hide rating prompt | Disney+, ESPN, Fox One, HBO Max, JustWatch, MGM+, MLB, NBA, NFL, PBS, Peacock, Plex, Pluto TV, Starz, Tubi | Stops Google Play's rate-this-app sheet. |
| Hide rating prompt | NewsNation | Stops the "rate this app" dialog. |
| Hide sign-in prompts | Tubi | Stops the app from asking you to sign in when you pause or leave a title. |
| Hide sponsored content | Plex | Removes sponsored titles and promotion cards from the home screen and rows. |
| Hide sponsored titles | JustWatch | Removes JustWatch's own sponsored title cards and sponsored trailers before videos. |
| Hide unavailable titles | JustWatch (off by default) | Hides Watchlist titles that are not on the services you picked. With All picked, hides titles that no service offers, except unreleased titles. |
| Hide update prompts | Tubi | Stops the app from asking you to update. A patched app cannot be updated through Google Play. |
| Hide watched titles | JustWatch (off by default) | Hides movies you marked as seen and shows you are caught up on from the Watchlist. |
| Highest quality | Tubi | Plays the highest-resolution version of each title and live channel, at its highest bitrate. Turn it off if videos buffer. |
| Mask live ad breaks | MLB (off by default) | Covers live gambling-ad breaks with a notice. |
| Mask live ad breaks | Pluto TV | Covers live ad breaks with a "We'll be right back!" screen and mutes them. |
| Reject tracking consent | NBA, NFL | Answers the app's tracking consent prompt with Reject All, so the prompt does not appear and the optional trackers stay off. |
| Remove social sign-in | Tubi | Removes the Continue with Google sign-in option. |
| Show release times | Apple TV | Shows the day and time in your time zone when an upcoming episode or title is released. |
| Skip ads | Disney+, ESPN | Removes pre-roll, mid-roll, and pause ads. |
| Skip ads | Fox One | Removes the ads in on-demand videos and the limits on skipping live TV breaks. |
| Skip ads | HBO Max | Blocks HBO Max's ad servers, so videos play without ads. |
| Skip ads | MLB | Removes the ads before on-demand videos. |
| Skip ads | NBA | Removes the ads the app plays before and during videos. Ads that are part of a live broadcast still play. |
| Skip ads | NewsNation | Removes the video ads before clips. |
| Skip ads | NFL | Stops the video ads before and during clips and highlights. |
| Skip ads | PBS | Stops the sponsor messages before and during videos. |
| Skip ads | Peacock | Turns off the ads inserted into Peacock streams. |
| Skip ads | Plex | Stops on-demand titles from requesting video ads and pause ads. |
| Skip ads | Pluto TV | Removes the ads, ad markers, and pause ads from on-demand videos. |
| Skip ads | Prime Video | Removes the ads in Android TV titles. Ads in live channels still play. |
| Skip ads | Tubi | Removes the ads in videos, including ad breaks and image pause ads. |
| Skip ads | YouTube TV | Removes the ads YouTube adds to on-demand videos and recordings in the official YouTube TV app, along with ad and analytics tracking. Experimental and not yet tested on a device. It needs version 4.01.03, for Android TV devices on Android 12 or later. Commercials that are part of a live broadcast still play. |
| Skip ads (experimental) | Hulu | Removes the ads Hulu stitches into its on-demand videos, through an in-process native hook, with no root. It removed the ad breaks from an on-demand episode in testing, but it has not been tested widely and may not remove every ad. It only removes explicit ad periods, so it does not affect ad-free content. Live broadcast commercials are part of the broadcast and still play. Sign in with the activation code at hulu.com/activate. |
| Skip launch video | Disney+ | Opens the app without the branded intro animation. |
| Skip launch video | Pluto TV | Opens the app with the static logo instead of the branded intro video. |
| Skip lion intro | MGM+ | Opens the app after the MGM+ logo, without the lion intro video. |
| Skip pre-roll promo | Starz | Starts titles without the promo for other Starz shows that plays first. |
| Streaming titles only | JustWatch (off by default) | Shows only titles you can stream on a subscription or for free on the Watchlist. Titles you can only rent or buy are hidden. Picking a Types filter in the app overrides this. |
| Translate ad break screen | MLB, Pluto TV | Experimental. Shows the "We'll be right back!" screen in your device's language when it is Arabic, Chinese, French, German, Greek, Italian, Korean, Portuguese, Russian, Spanish, Tagalog, or Vietnamese. Other languages show English. The translations come from a translation service. Please submit corrections or rewrites through GitHub issues. |
| Video quality | HBO Max (off by default) | Plays the video resolution you choose instead of letting the app pick one. Videos can buffer if your connection is too slow for it. |
| YT TV+ (ad-free YouTube TV) | YouTube TV | Makes this app into YT TV+, an ad-free YouTube TV app that installs beside your other apps. It loads the YouTube TV live guide, library, and DVR, and removes the ads YouTube adds to on-demand videos and recordings, along with ad and analytics tracking. It does not give you regular YouTube. Commercials that are part of a live broadcast still play. Sign in with the code at tv.youtube.com/start. |
