# Mobile Morphe Patches

Morphe patches that remove ads and block tracking in the phone versions of streaming, news, and shopping apps.

Some of these patches are ports of [ajstrick81's Android TV patches](https://github.com/ajstrick81/morphe-androidtv-patches). The original hook designs are their work. This project adapts them to the phone builds of the same apps. For the Android TV apps, use the original project.

## Patch status

### Streaming

| App | Patches | Tested version | Last updated |
|-----|---------|----------------|--------------|
| AMC+ | Skip launch video, Skip ads (experimental), Block analytics & tracking (opt-in) | `1.8.62.1` | 10/31/26 |
| Apple TV | Skip ads (experimental) | `3.0.0` | 10/30/26 |
| Disney+ | Skip launch video, Skip ads, Block analytics & tracking (opt-in) | `26.20.0+rc1-2026.10.22` | 10/31/26 |
| ESPN | Skip ads (experimental), Block analytics & tracking (opt-in) | `8.27.0` | 10/31/26 |
| Fox One | Skip ads (experimental), Disable Pairip license check, Block analytics & tracking (opt-in) | `1.24.0` | 10/30/26 |
| HBO Max | Skip ads, Remove social sign-in, Block analytics & tracking (opt-in) | `7.14.0.530` | 10/30/26 |
| Hulu | Skip ads (experimental), Block analytics & tracking (opt-in) | `6.34.0` | 10/31/26 |
| MGM+ | Skip ads (experimental), Skip pre-roll promo (experimental), Skip lion intro, Disable MGM+ AI (opt-in), Remove social sign-in, Block analytics & tracking (opt-in) | `240.0.2026240000` | 10/30/26 |
| NBA | Skip ads (experimental), Disable Ask NBA AI (opt-in), Block analytics & tracking (opt-in) | `1.2.0` | 10/31/26 |
| NFL | Skip ads (experimental), Block analytics & tracking (opt-in) | `61.0.18` | 10/31/26 |
| Paramount+ | Skip launch video, Skip ads, Block analytics & tracking (opt-in) | `17.2.0` | 10/31/26 |
| PBS | Skip ads (experimental), Block analytics & tracking (opt-in) | `5.27.0` | 10/30/26 |
| Peacock | Skip ads (experimental), Disable Xfinity auto sign-in, Block analytics & tracking (opt-in) | `7.10.20` | 10/30/26 |
| Pluto TV | Skip launch video, Skip ads, Mask live ad breaks, Block analytics & tracking (opt-in) | `17.2.0` | 10/31/26 |
| Prime Video | Skip ads, Rename shared permissions, Block analytics & tracking (opt-in) | `3.0.477.1447` | 11/01/26 |
| Starz | Skip launch video, Skip pre-roll promo (experimental), Remove social sign-in, Block analytics & tracking (opt-in) | `6.11.0` | 10/31/26 |
| Tubi | Skip ads, Remove social sign-in, Hide sign-in prompts, Block analytics & tracking (opt-in) | `10.43.1` | 10/30/26 |

### News

| App | Patches | Tested version | Last updated |
|-----|---------|----------------|--------------|
| CNN | Skip ads (experimental), Opt out of data sale & sharing, Remove social sign-in, Block analytics & tracking (opt-in) | `26.21.0` | 10/30/26 |
| Fox News | Skip ads (experimental), Opt out of data sale & sharing, Block analytics & tracking (opt-in), Enable developer menu | `5.49.2` | 10/31/26 |
| MS NOW | Opt out of data sale & sharing, Block analytics & tracking (opt-in) | `14.6.0` | 10/31/26 |
| The New York Times | Skip ads (experimental), Hide upsell pop-ups (experimental), Remove social sign-in, Block analytics & tracking (opt-in) | `11.98.0` | 10/30/26 |
| The Wall Street Journal | Skip ads (experimental), Hide marketing pop-ups (experimental), Block analytics & tracking (opt-in) | `15.12.0.42675` | 10/30/26 |
| The Washington Post | Skip ads (experimental), Hide marketing pop-ups (experimental), Disable AI (opt-in), Block analytics & tracking (opt-in) | `7.18.1` | 10/30/26 |

### Shopping

| App | Patches | Tested version | Last updated |
|-----|---------|----------------|--------------|
| Amazon Shopping | Hide sponsored listings, Disable AI (opt-in) | `32.19.0.100` | 11/01/26 |
| Best Buy | Hide sponsored listings, Disable AI (opt-in) | `26.10.10` | 11/01/26 |
| CVS | Disable AI (opt-in) | `26.10.50` | 11/01/26 |
| DealSeek | Strip affiliate links, Disable Pairip license check, Block analytics & tracking (opt-in) | `1.64.0` | 11/01/26 |
| Target | Hide sponsored listings, Disable AI (opt-in) | `2026.43.0` | 11/01/26 |
| The Home Depot | Disable AI (opt-in) | `8.2.5` | 11/01/26 |
| Walgreens | The shared privacy patches only | `118.0` | 11/01/26 |
| Walmart | Disable AI (opt-in) | `26.38` | 11/01/26 |

## How to install

1. Download the phone build of the app from APKMirror. Match the exact version in the tables above, and download the `.apkm` bundle (ESPN, Hulu, Prime Video, The Wall Street Journal, and Walmart ship as a single `.apk`). Fox One is not on APKMirror. Install it from the Play Store on your phone and use the installed copy. The same works for the news and shopping apps.
2. In Morphe Manager, add this project as a patch source. On your phone, open [this link](https://morphe.software/add-source?github=semicoloncolonel/mobile-morphe-patches). You can also go to Sources, tap +, choose Remote, and paste `https://raw.githubusercontent.com/semicoloncolonel/mobile-morphe-patches/main/patches-bundle.json`.
3. Select the `.apkm` file and apply the patches.

## What the patches do

**Skip ads** stops the app from loading ad breaks, server-stitched ad streams, and pause-screen ads. On Pluto TV, it removes on-demand ads only. Live TV ads are part of the broadcast. On Paramount+, live sports breaks are replaced with Paramount's "Commercial in Progress" card. On AMC+, it plays videos without the stitched-in ad breaks, which also removes the interactive true[X] and Brightline ads. On Apple TV, it stops the ad interstitials in on-demand videos, along with any promos delivered the same way. On PBS, it stops the sponsor messages before and during videos. On Fox News, it removes banner, feed, sponsored, and full-screen ads, and plays videos without inserted ad breaks. On CNN, it removes banner and sponsored-content ads and plays article videos and clips without ads. On Hulu, it removes the ads stitched into on-demand videos, so titles play without ad breaks, and leaves Live TV as it is. On Prime Video, it plays every title in the app's older player, which then schedules no ad breaks. Features of the newer player, such as its X-Ray views, are not available. All Access streaming is not changed. On ESPN, it stops scheduled ad breaks and on-demand mid-rolls. Commercials in live broadcasts are part of the stream and still play. On NBA, it removes the ads before and during videos, games, and NBA TV, including the videos inside news articles. On NFL, it removes the ads the app adds to clips and highlights. Ads stitched into a live stream still play.

**Mask live ad breaks** (Pluto TV) covers live ads with a black screen and mutes them, then restores the show when the break ends. Live ads are part of the broadcast, so they cannot be cut out.

**Block analytics & tracking** is off by default. Crash reporting, sign-in, and playback are left alone. In every app, it also blocks Meta app events and the Meta Pixel, Google Ads conversion tracking, Google Analytics, Optimizely event logging, Bitmovin player analytics, and Mixpanel. Facebook sign-in and sharing keep working.

- On Tubi, it blocks Adjust, Branch, Braze, Nielsen, Conviva, NPAW/Youbora, Mux, Firebase/Google Analytics, Meta app events, and Tubi's own analytics endpoint.
- On NBA, it blocks Braze, New Relic, Amplitude, Datadog, comScore, Kochava, and Bitmovin player analytics.
- On NFL, it blocks Kochava, Adobe Analytics, Nielsen, Partnerize, Amplitude, and Firebase/Google Analytics. Analytics sent from the app's JavaScript are not covered.
- On ESPN, it blocks Braze, New Relic, Conviva, Nielsen, comScore, Kochava, Adobe Analytics, and Firebase/Google Analytics. TV-provider sign-in through Adobe Pass is left alone.
- On Disney+, it blocks Braze, Conviva, Nielsen, and Firebase/Google Analytics. Disney's own analytics use the same servers as sign-in and playback, so they are not blocked.
- On Paramount+, it blocks Braze, Conviva, Nielsen, comScore, Kochava, Adobe Analytics, New Relic, Tealium, and Branch.
- On HBO Max, it blocks Branch, Braze, comScore, Firebase/Google Analytics, AppsFlyer, and MediaMelon.
- On Peacock, it blocks Braze, Conviva, Nielsen, comScore, Adobe Analytics, New Relic, Firebase/Google Analytics, mParticle, and Branch.
- On Hulu, it blocks AppsFlyer, Adobe Analytics, Conviva, Nielsen, and Firebase/Google Analytics.
- On Prime Video, it stops Amazon's Minerva metrics uploads and Firebase/Google Analytics.
- On Pluto TV, it blocks Kochava, comScore, Nielsen, Adobe Analytics, Conviva, New Relic, Salesforce Marketing Cloud, and Pluto's Tealium tag config.
- On MGM+, it blocks Braze, Kochava, Segment, Nielsen, and Firebase/Google Analytics.
- On Fox One, it blocks AppsFlyer, Braze, Conviva, comScore, Adobe Analytics, Nielsen, Mux, Datadog, Segment, Contentsquare session replay, and Firebase/Google Analytics.
- On The New York Times, it blocks AppsFlyer, Chartbeat, comScore, Datadog, Iterate surveys, and Firebase/Google Analytics. Statsig, which runs the app's feature settings, is left alone.
- On The Washington Post, it blocks AppsFlyer, Chartbeat, comScore, Permutive, Iterable, Airship analytics, and Firebase/Google Analytics. Push notifications are left alone.
- On Starz, it blocks AppsFlyer, CleverTap, Leanplum, Braze, Ethnio surveys, and Firebase/Google Analytics.
- On PBS, it blocks AppsFlyer, Mux playback analytics, and Firebase/Google Analytics.
- On Fox News, it blocks Adobe, AppsFlyer, Chartbeat, comScore, Nielsen, Firebase/Google Analytics, and Fox's own ad telemetry and ad-ID graph. Push notifications are left alone.
- On MS NOW, it blocks Adobe, Kochava, Nielsen, comScore, Amplitude, Parse.ly, Iterate, and Firebase/Google Analytics.
- On CNN, it blocks Adobe, AppsFlyer, Chartbeat, comScore, Firebase/Google Analytics, and CNN's own data collection. Push notifications are left alone.
- On AMC+, it blocks AppsFlyer, Braze, mParticle, Nielsen, New Relic, NPAW/Youbora, and Firebase/Google Analytics. TV-provider sign-in through Adobe Pass is left alone.
- On DealSeek, it blocks AppsFlyer, Meta app events, TikTok, PostHog, and Firebase/Google Analytics. PostHog feature flags, which the app reads, are left alone.
- On The Wall Street Journal, it blocks Adobe Analytics, AppsFlyer, Braze, comScore, LiveRamp, Parse.ly, Permutive, Snowplow, and Firebase/Google Analytics. Podcasts are left alone.

**Disable Pairip license check** (Fox One and DealSeek) lets the patched app start. Google's Pairip license check blocks any copy that was not installed from the Play Store, and every patched app counts as one.

**Strip affiliate links** (DealSeek) opens each deal at the store's own product page. The app normally sends a deal through its own click tracker, which also receives your analytics ID, and then through an affiliate network such as Impact or Sovrn. With this patch, the deal opens directly at the store, and affiliate tags such as Amazon's are removed. It covers Amazon, Walmart, Best Buy, eBay, Wayfair, and Target. DealSeek does not earn a commission on purchases made this way.

**Rename shared permissions** (Prime Video) is applied with every Prime Video patch. Prime Video declares sign-in permissions that other Amazon apps also declare, and Android refuses to install an app that declares the same permission as an installed app signed with a different key. Without this patch, the patched Prime Video blocks installing Amazon Shopping and other Amazon apps from the Play Store with a "conflicting package" error. The patch adds a `mobilestream.` prefix to those permission names.

**Disable Ask NBA AI** (NBA) hides the Ask NBA chat button on every screen and removes the Ask NBA tile from the Discover tab.

**Hide upsell pop-ups** (The New York Times) stops the full-screen subscription takeover and the promo banner at the top of the app.

**Hide marketing pop-ups** (The Washington Post and The Wall Street Journal) stops in-app marketing messages, such as subscription offers. Push notifications still arrive.

**Disable AI** is off by default. On The Washington Post, it turns off Ask The Post AI, AI article summaries, and the Ask The Post questions shown under articles. On the shopping apps, it turns off the store's AI assistant and AI features:

- On Amazon Shopping, it turns off Rufus in the tabs, search, and camera lens, and the AI assistant in Amazon Pay. Rufus prompts that Amazon's web pages show inside the app may still appear.
- On Walmart, it turns off the Sparky assistant and the AI features on item and search pages. Customer care chat, which Walmart routes through Sparky, falls back to the regular help pages.
- On Target, it turns off Ask Target, AI mode in search, the AI gift finder, the AI shopping list scanner, and AI replies in support chat. AI review summaries still show.
- On The Home Depot, it turns off the Magic Apron assistant in the app and hides its chat button on the store's web pages.
- On CVS, it turns off AI search in the help center, which also stops the app from downloading Google's on-device AI model, AI insights, AI summaries of visits, lab results, and claims, and proactive AI on pharmacy orders.
- On Best Buy, it hides the AI-written review summaries. Ask Blue, Best Buy's AI assistant, is not covered.

**Hide sponsored listings** removes paid placements from search results. On Amazon Shopping, it hides sponsored products in search results and on product pages. On Target, it asks Target's search for results without sponsored products. On Best Buy, it turns on Best Buy's own option for searches without sponsored listings. Best Buy's "Featured products" row still shows.

**Opt out of data sale & sharing** (Fox News, MS NOW, and CNN) sets the app's privacy choice to "do not sell or share" and opts out of targeted advertising, as a second layer behind Block analytics & tracking. Ad and measurement partners receive the US Privacy opt-out signal. On Fox News and MS NOW, this is the starting choice and you can change it in the app's privacy settings. On MS NOW, it replaces the "Allow All" that the app saves for you after onboarding. On CNN, the opt-out stays on.

**Enable developer menu** is off by default and applies to Fox News only. It makes the Fox News app's hidden developer menu open with a normal long-press on the Fox logo at the bottom of Settings, instead of a ten-second hold, and it makes the menu's feature-flag toggles take effect after you reopen the app. The menu ships in the released app and is meant for the app's developers. It can include environment or server switches that repoint the app at non-production servers, so do not change settings inside it unless you know what they do.

**Hide device identifiers** is off by default and works on every app here. It gives the app a random Android ID, generated once per install, instead of your device's. It also reports a zeroed advertising ID with ad tracking limited, the same as deleting your ad ID in Android settings. The video DRM ID is left alone so playback keeps working.

**Report Wi-Fi connection** is off by default and works on the streaming and news apps. When the phone is on mobile data, the app sees an unmetered Wi-Fi connection instead, so settings such as "download over Wi-Fi only" and lower streaming quality on mobile data do not apply. Wi-Fi-only download jobs that the app hands to Android also run on mobile data. This can use a lot of mobile data.

**Hide VPN connection** is off by default and works on the streaming and news apps. It hides an active VPN from the app's checks on the phone, so the app sees the Wi-Fi or mobile connection that the VPN runs over. The app can still recognize a VPN from your IP address on its servers, and checks built into an app's native code are not covered.

**Spoof carrier** is off by default and works on every app here. It hides your mobile carrier from the app and from the ad, analytics, and crash-reporting SDKs inside it. The carrier name is blank unless you type a different name in the patch option, in which case the app sees that name. The carrier's network code is always hidden. Carrier deals that an app detects from your carrier, such as League Pass included with a phone plan, do not work while this is on.

**Hide Wi-Fi networks** is off by default and works on the shopping apps. The app sees no nearby Wi-Fi networks and cannot read the name of the network you are on, so it cannot tell which store's Wi-Fi is around you. Walmart, for example, looks for its store network to tell that you are inside a store. Store detection, Wi-Fi setup for smart-home devices, and fraud checks at checkout can be affected.

**Block Bluetooth scanning** is off by default and works on the shopping apps. The app cannot scan for Bluetooth devices or the beacons in a store, and it cannot see your paired devices. Beacon libraries no longer wake the app when the phone starts or charges. In-store maps and their location dot (Target and The Home Depot), pharmacy kiosk check-in (CVS), smart-home device setup (Amazon), and pairing with accessories inside the app stop working.

**Hide cell tower info** is off by default and works on the shopping apps. The app cannot see the cell towers your phone sees, which can place you within a few blocks even without location access. Use Spoof carrier to hide the carrier itself.

**Block background location** is off by default and works on the shopping apps. It removes the app's ability to ask for location while it is closed or in the background, so it cannot notice you arriving at a store, even if you tap Allow all the time. Location while you use the app still works if you allow it. Automatic store mode, store-arrival notifications, and pickup check-in that tracks your drive after you close the app stop working.

**Disable auto-updates** is off by default and works on every app here except The Washington Post, whose resources the patcher cannot rebuild. It stops the Play Store from silently replacing the patched app with the official version. On Tubi, it is always applied with Skip ads.

**Skip pre-roll promo** removes the app's own promo that plays before a title. On MGM+, it jumps past the 20-30 second self-promo to the start of the main content, and only while that promo is playing, so normal titles and next-episode binge are left alone. On Starz, titles start without the promo for other Starz shows, so there is nothing to skip.

**Skip lion intro** (MGM+ only) opens the app straight after the MGM+ logo, without the lion video.

**Skip launch video** opens the app without the branded intro video or animation that plays on launch, so it reaches the home screen sooner. It covers Starz, AMC+, Paramount+, Pluto TV, and Disney+. On MGM+ the same idea is the separate **Skip lion intro** patch.

**Remove social sign-in** removes the options to sign in with a Google, Facebook, or Apple account, so the app cannot link to one. Email sign-in, TV-provider sign-in (including YouTube TV as your provider), and subscriber sign-in keep working. It covers Tubi, Starz, MGM+, CNN, HBO Max, and The New York Times. On MGM+, it also stops Google's sign-in sheet from opening on its own at startup, and Login with Amazon stays for Amazon-billed subscribers. An account that was created with Google or Facebook needs a password reset to sign in by email. PBS, Fox News, The Wall Street Journal, and The Washington Post show their social options on their own sign-in web pages, which a patch cannot change.

**Hide sign-in prompts** (Tubi only) stops the request to sign in to save your progress when you pause or leave a title. You can still sign in from the account screen.

**Disable Xfinity auto sign-in** (Peacock only) stops the app from signing you in on its own when it detects an Xfinity home network. Signing in with your own Peacock account still works.

**Disable MGM+ AI** (MGM+ only) is off by default. It turns off the "MGM+ AI" chat assistant: the "Get Personalized Pick" and "Not sure what to watch?" prompts, the AI chat itself, and the AI-picks rows on the Home screen. It forces the feature's flags off whatever the server sends, and changes nothing else.

Everything runs on the device, inside the patched app. The patches do not send data anywhere.

## Known issues

- **Best Buy:** on some phones, the app looks washed out, with a white tint over every screen, and it can take a minute to start. The official app does the same on these phones, so the patches do not cause it. This is an irregular issue that is being reviewed.
- **Walmart:** if a DNS filter such as Control D blocks `drfdisvc.walmart.com`, Walmart does not send sign-in codes by text. Allow that host and `h-walmart.online-metrix.net`, which Walmart uses for fraud checks at sign-in.

## Disclaimer

This project is not affiliated with, endorsed by, or sponsored by any of the companies whose apps it patches. All app names and trademarks belong to their owners and are used here only to identify the apps.

This project does not distribute any app, APK, or app code. The patches modify a copy of the app that you supply yourself. Use them on your own devices and accounts, and at your own risk.

## License

GPL-3.0. See [LICENSE](LICENSE) and [NOTICE](NOTICE) for credits.
