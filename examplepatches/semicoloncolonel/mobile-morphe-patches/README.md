# Mobile Morphe Patches

Morphe patches that remove ads and block tracking in the phone versions of streaming, news, shopping, carrier, and government apps.

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
| JustWatch | Block ads, Hide sponsored titles, Block analytics & tracking (opt-in) | `26.43.10` | 11/01/26 |
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

### Government

| App | Patches | Tested version | Last updated |
|-----|---------|----------------|--------------|
| FEMA | Block analytics & tracking (opt-in) | `3.2.1` | 11/02/26 |
| MyTSA | Block analytics & tracking (opt-in) | `5.1.0` | 11/02/26 |
| National Forests & Grasslands | Disable Pairip license check, Block analytics & tracking (opt-in) | `1.3.0` | 11/02/26 |
| NPS | Block analytics & tracking (opt-in), Block Bluetooth scanning (opt-in) | `2.15.0` | 11/02/26 |
| Recreation.gov | Skip location on open, Hide rating prompt, Block analytics & tracking (opt-in), Show hidden details (opt-in) | `2.2.67` | 11/02/26 |
| White House | Disable Pairip license check, Remove microphone access, Hide social feeds (opt-in), Hide promotions (opt-in), Block analytics & tracking (opt-in), Route traffic through a proxy (opt-in) | `47.7.8` | 11/02/26 |

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

### Carriers

| App | Patches | Tested version | Last updated |
|-----|---------|----------------|--------------|
| Mint Mobile | Block analytics & tracking (opt-in) | `2.3.40` | 11/01/26 |
| myAT&T | Block session recording, Block background network reports, Block analytics & tracking (opt-in), Disable AI (opt-in) | `2026.10.1` | 11/01/26 |
| T-Life | Block location tracking, Block session recording, Block analytics & tracking (opt-in), Disable AI (opt-in) | `12.3.1` | 11/01/26 |
| T-Mobile Play | Block ads, Block analytics & tracking (opt-in), Block TV discovery (opt-in), Hide stories (opt-in) | `19.4.4` | 11/01/26 |
| Visible | Block ads, Block session recording, Block analytics & tracking (opt-in) | `3.0.5` | 11/01/26 |
| Xfinity | Block analytics & tracking (opt-in), Block Advanced Security telemetry (opt-in), Disable AI (opt-in) | `6.14.0-2` | 11/01/26 |

## How to install

1. Download the phone build of the app from APKMirror, matching the version in the tables above. Use the `.apkm` bundle, except for ESPN, Hulu, Prime Video, The Wall Street Journal, Walmart, and T-Mobile Play, which ship as a single `.apk`. For Fox One, T-Life, NPS, National Forests & Grasslands, and Recreation.gov, install the app from the Play Store and patch the installed copy.
2. In Morphe Manager, add this project as a patch source. On your phone, open [this link](https://morphe.software/add-source?github=semicoloncolonel/mobile-morphe-patches). You can also go to Sources, tap +, choose Remote, and paste `https://raw.githubusercontent.com/semicoloncolonel/mobile-morphe-patches/main/patches-bundle.json`.
3. Select the `.apkm` file and apply the patches.

## What the patches do

**Skip ads** stops ad breaks, server-stitched ads, and pause-screen ads. Ads that are part of a live broadcast still play.

- Pluto TV: on-demand ads only.
- Paramount+: live sports breaks show Paramount's "Commercial in Progress" card.
- AMC+: no stitched-in breaks, including the interactive true[X] and Brightline ads.
- Apple TV: no ad interstitials in on-demand videos, or promos delivered the same way.
- PBS: no sponsor messages before or during videos.
- Fox News: no banner, feed, sponsored, or full-screen ads, and no ad breaks in videos.
- CNN: no banner or sponsored-content ads, and no ads in videos and clips.
- Hulu: no ads in on-demand videos. Live TV is not changed.
- Prime Video: every title plays in the older player, which schedules no ad breaks. The newer player's features, such as X-Ray, are not available. All Access is not changed.
- ESPN: no scheduled breaks or on-demand mid-rolls.
- NBA: no ads before or during videos, games, NBA TV, and article videos.
- NFL: no ads in clips and highlights.

**Block ads** removes the ads and stops the ad networks from loading. On T-Mobile Play, it covers the ads in the feeds. On Visible, it stops Madme, which shows ads over other apps, after calls, when you unlock the phone, and as notifications. On JustWatch, it covers banner, native, full-screen, and video ads, including the ones before and during free streams.

**Hide social feeds** (White House) is off by default. In the patch options, choose which feeds to hide: Truth Social, X, Instagram, Facebook, LinkedIn, TikTok, YouTube, or the Wire (White House posts that link to articles). A hidden feed is never requested. Its tab stays in the app and shows that the feed could not load. Hiding YouTube also empties the Live tab, since its live streams and videos come from the same feed.

**Hide promotions** (White House) is off by default. In the patch options, choose which buttons to hide: "Text President Trump" and "Get in Touch".

**Remove microphone access** (White House) removes the microphone permission, which no feature in the app uses.

**Skip location on open** (Recreation.gov) stops the app from reading your precise location every time you open it. Nearby search and permit check-in still use location when you use them.

**Hide rating prompt** (Recreation.gov) stops the "rate this app" prompt after checkout.

**Show hidden details** (Recreation.gov) is off by default. It shows details the app already receives from Recreation.gov but does not display:

- Ticket lotteries: the number of applications, tickets requested and awarded, the limit per account, and when results come out, shown as a message when you open the lottery.
- Ticket time slots: when sales for each slot close, after the number of tickets available.
- Ticket facilities: the exact booking window rules, after the booking information.
- Your lotteries in My Reservations: the deadline to confirm a win, after the results date.
- Venue time slots: when booking opens or closes.

Nothing extra is requested from Recreation.gov, and booking works as before.

**Route traffic through a proxy** (White House) is off by default. It sends the app's traffic through a proxy you set in the patch option, such as Orbot for Tor. If the proxy is not running, the app cannot connect. Web pages shown inside the app do not use the proxy. To encrypt DNS for every app, use Private DNS in Android's network settings.

**Hide sponsored titles** (JustWatch) removes JustWatch's own sponsored title cards and the sponsored trailers before videos.

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
- On T-Life, it stops Adobe, MoEngage, Amplitude, Splunk, Luciq, Branch, and Firebase/Google Analytics. MoEngage's marketing notifications and in-app promotions stop too. ThreatMetrix fraud checks are left alone, since sign-in and payments use them.
- On T-Mobile Play, it stops the app's usage events, Apptentive surveys, and Firebase/Google Analytics.
- On myAT&T, it stops Dynatrace, Adobe (including its in-app marketing messages), Medallia surveys, and Firebase/Google Analytics. Akamai and Arkose, which sign-in uses, are left alone.
- On Visible, it stops Tealium, Swrve (including its marketing notifications and in-app promotions), and Firebase/Google Analytics. The support chat is left alone.
- On Mint Mobile, it stops Amplitude, Braze, Branch, Optimizely events, and Firebase/Google Analytics. Marketing notifications, in-app promotions, and referral links stop too. ThreatMetrix fraud checks are left alone.
- On Xfinity, it stops Comcast's own event tracking, Datadog, Medallia surveys, Branch, and Firebase/Google Analytics.
- On NPS, MyTSA, FEMA, and National Forests & Grasslands, it stops Firebase Analytics, and on NPS, Mapbox's map usage reports.
- On Recreation.gov, it stops Firebase Analytics, which receives your reservation numbers and payment details, the advertising ID, crash and session reporting, and Mapbox usage reports. It also keeps your account ID from LaunchDarkly, the app's feature-flag service. Booking, permits, and notifications are left alone.
- On White House, it stops Firebase Analytics, which records what you read, how far you scroll, what you watch, and what you search for, and stops the app from reading your advertising ID. Push notifications and polls are left alone.
- On JustWatch, it blocks JustWatch's own event tracking, AppsFlyer, Adjust, Singular, Meta app events, and Firebase/Google Analytics.

**Disable Pairip license check** (Fox One, DealSeek, White House, and National Forests & Grasslands) lets the patched app start. Google's Pairip license check blocks any copy that was not installed from the Play Store, and every patched app counts as one.

**Strip affiliate links** (DealSeek) opens each deal at the store's own product page. The app normally sends a deal through its own click tracker, which also receives your analytics ID, and then through an affiliate network such as Impact or Sovrn. With this patch, the deal opens directly at the store, and affiliate tags such as Amazon's are removed. It covers Amazon, Walmart, Best Buy, eBay, Wayfair, and Target. DealSeek does not earn a commission on purchases made this way.

**Rename shared permissions** (Prime Video) is applied with every Prime Video patch. Without it, the patched Prime Video blocks installing Amazon Shopping and other Amazon apps with a "conflicting package" error, because they declare the same sign-in permissions. The patch adds a `mobilestream.` prefix to those permissions.

**Block location tracking** (T-Life) stops Radar, which sends your location to Radar's servers every 30 seconds while T-Life runs. Store check-in and location-based offers can be affected.

**Block session recording** (T-Life, myAT&T, and Visible) stops Quantum Metric, which records what you do in the app. T-Life sends it your phone number, email, and billing account number, myAT&T your login ID and API traffic, and Visible your phone number and network calls.

**Block background network reports** (myAT&T) stops the Ookla background reports, which measure your signal and network with your location while you are not using the app. The speed test you start still works.

**Block Advanced Security telemetry** (Xfinity) is off by default. It stops Advanced Security from uploading the websites it checked and your network changes. Threat filtering on the phone keeps working.

**Block TV discovery** (T-Mobile Play) is off by default. It stops Vizbee, which scans your home network for TVs and reports them with your device ID. Sending video to a TV from the app stops working.

**Hide stories** (T-Mobile Play) is off by default. It removes the Storyteller stories and video clips from the feeds.

**Disable Ask NBA AI** (NBA) hides the Ask NBA chat button on every screen and removes the Ask NBA tile from the Discover tab.

**Hide upsell pop-ups** (The New York Times) stops the full-screen subscription takeover and the promo banner at the top of the app.

**Hide marketing pop-ups** (The Washington Post and The Wall Street Journal) stops in-app marketing messages, such as subscription offers. Push notifications still arrive.

**Disable AI** is off by default. On The Washington Post, it turns off Ask The Post AI, AI article summaries, and the Ask The Post questions shown under articles. On the other apps, it turns off the app's AI assistant and AI features:

- On Amazon Shopping, it turns off Rufus in the tabs, search, and camera lens, and the AI assistant in Amazon Pay. Rufus prompts that Amazon's web pages show inside the app may still appear.
- On Walmart, it turns off the Sparky assistant and the AI features on item and search pages. Customer care chat, which Walmart routes through Sparky, falls back to the regular help pages.
- On Target, it turns off Ask Target, AI mode in search, the AI gift finder, the AI shopping list scanner, and AI replies in support chat. AI review summaries still show.
- On The Home Depot, it turns off the Magic Apron assistant in the app and hides its chat button on the store's web pages.
- On CVS, it turns off AI search in the help center, which also stops the app from downloading Google's on-device AI model, AI insights, AI summaries of visits, lab results, and claims, and proactive AI on pharmacy orders.
- On Best Buy, it hides the AI-written review summaries. Ask Blue, Best Buy's AI assistant, is not covered.
- On T-Life, it turns off the T-Life AI assistant.
- On myAT&T, it stops Andi, the AI assistant, from answering, and turns off its Fusion AI features: chat history, voice to text, AI search suggestions, citations, and AI cards. The Andi button still opens the chat, which shows an error. In-app chat with an agent stops too, since it goes through Andi. Phone support is not affected.
- On Xfinity, it turns off the Xfinity Assistant. Support and troubleshooting steps that open the Assistant can stop working.

**Hide sponsored listings** removes paid placements from search results. On Amazon Shopping, it hides sponsored products in search results and on product pages. On Target, it asks Target's search for results without sponsored products. On Best Buy, it turns on Best Buy's own option for searches without sponsored listings. Best Buy's "Featured products" row still shows.

**Opt out of data sale & sharing** (Fox News, MS NOW, and CNN) sets the app's privacy choice to "do not sell or share" and opts out of targeted advertising, as a second layer behind Block analytics & tracking. Ad and measurement partners receive the US Privacy opt-out signal. On Fox News and MS NOW, this is the starting choice and you can change it in the app's privacy settings. On MS NOW, it replaces the "Allow All" that the app saves for you after onboarding. On CNN, the opt-out stays on.

**Enable developer menu** (Fox News) is off by default. The hidden developer menu opens with a normal long-press on the Fox logo at the bottom of Settings, and its feature-flag toggles take effect after you reopen the app. Some of its settings point the app at test servers, so change only what you understand.

**Hide device identifiers** is off by default and works on every app here. It gives the app a random Android ID, generated once per install, instead of your device's. It also reports a zeroed advertising ID with ad tracking limited, the same as deleting your ad ID in Android settings. The video DRM ID is left alone so playback keeps working.

**Report Wi-Fi connection** is off by default and works on the streaming and news apps. When the phone is on mobile data, the app sees an unmetered Wi-Fi connection instead, so settings such as "download over Wi-Fi only" and lower streaming quality on mobile data do not apply. Wi-Fi-only download jobs that the app hands to Android also run on mobile data. This can use a lot of mobile data.

**Hide VPN connection** is off by default and works on the streaming and news apps. It hides an active VPN from the app's checks on the phone, so the app sees the Wi-Fi or mobile connection that the VPN runs over. The app can still recognize a VPN from your IP address on its servers, and checks built into an app's native code are not covered.

**Spoof carrier** is off by default and works on every app here. It hides your mobile carrier from the app and from the ad, analytics, and crash-reporting SDKs inside it. The carrier name is blank unless you type a different name in the patch option, in which case the app sees that name. The carrier's network code is always hidden. Carrier deals that an app detects from your carrier, such as League Pass included with a phone plan, do not work while this is on.

**Hide Wi-Fi networks** is off by default and works on the shopping apps and T-Life. The app sees no nearby Wi-Fi networks and cannot read the name of the network you are on, so it cannot tell which store's Wi-Fi is around you. Store detection, Wi-Fi setup for smart-home devices, and fraud checks at checkout can be affected. On T-Life, do not enable it if you use Secure Wi-Fi or manage T-Mobile Home Internet in the app.

**Block Bluetooth scanning** is off by default and works on the shopping apps, T-Life, and NPS. On NPS, it stops the scan for beacons in parks, so content tied to a beacon at a park site does not show. The app cannot scan for Bluetooth devices or the beacons in a store, and it cannot see your paired devices. Beacon libraries no longer wake the app when the phone starts or charges. In-store maps and their location dot (Target and The Home Depot), pharmacy kiosk check-in (CVS), smart-home device setup (Amazon), and pairing with accessories inside the app stop working.

**Hide cell tower info** is off by default and works on the shopping apps. The app cannot see the cell towers your phone sees, which can place you within a few blocks even without location access. Use Spoof carrier to hide the carrier itself.

**Block background location** is off by default and works on the shopping apps and T-Life. It removes the app's ability to ask for location while it is closed or in the background, so it cannot notice you arriving at a store, even if you tap Allow all the time. Location while you use the app still works if you allow it. Automatic store mode, store-arrival notifications, pickup check-in, and T-Life store check-in can stop working.

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
