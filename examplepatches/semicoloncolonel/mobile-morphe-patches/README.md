# Mobile Morphe Patches

Morphe patches that remove ads and block tracking in the phone versions of streaming, news, shopping, carrier, and government apps.

Some patches are phone ports of [ajstrick81's Android TV patches](https://github.com/ajstrick81/morphe-androidtv-patches), and the original hook designs are their work. For the Android TV apps, use the original project.

**[Add to Morphe Manager](https://morphe.software/add-source?github=semicoloncolonel/mobile-morphe-patches)**: open this link on your phone with Morphe Manager installed.

## Install

1. Download the app from APKMirror in the version listed below. Use the `.apkm` bundle, or the `.apk` for CBS News, ESPN, Fandango at Home, Hulu, MyTSA, Prime Video, The Wall Street Journal, and T-Mobile Play. For Fox One, T-Life, NPS, National Forests & Grasslands, and Recreation.gov, install the app from the Play Store and patch the installed copy.
2. Add this project in Morphe Manager with the link above, or go to Sources, tap +, choose Remote, and paste `https://raw.githubusercontent.com/semicoloncolonel/mobile-morphe-patches/main/patches-bundle.json`.
3. Select the file and apply the patches.

YouTube TV and Moviebase sign in with Google through MicroG RE, so install it first. The patched YouTube TV installs beside the official app and asks to see MicroG RE's accounts, which Android lists under Contacts. It cannot read your contacts. The patched Moviebase replaces the official app unless you turn on the Clone app option.

## Apps

¹ Experimental: still in testing and may not always work. If you run into an error, please leave a detailed report in [Issues](https://github.com/semicoloncolonel/mobile-morphe-patches/issues).<br>
² Off by default: this patch is not applied unless you select it in Morphe Manager when patching.

### Streaming

| App | Patches | Tested version | Last updated |
|-----|---------|----------------|--------------|
| AMC+ | Skip launch video, Skip ads¹, Block analytics & tracking¹ ² | `1.8.62.1` | 10/31/26 |
| Apple TV | Skip ads¹, Block analytics & tracking¹ ² | `3.0.0` | 10/30/26 |
| Disney+ | Skip launch video, Skip ads, Block analytics & tracking¹ ² | `26.20.0+rc2-2026.10.28` | 11/02/26 |
| ESPN | Skip ads¹, Block analytics & tracking¹ ² | `8.27.0` | 10/31/26 |
| Fandango at Home | Mask ads, Block analytics & tracking² | `10.24.r009.179279954` | 11/02/26 |
| Fox One | Skip ads¹, Disable Pairip license check, Block analytics & tracking¹ ² | `1.24.0` | 10/30/26 |
| HBO Max | Skip ads, Remove social sign-in, Block analytics & tracking¹ ² | `7.14.0.530` | 10/30/26 |
| Hulu | Skip ads¹, Block analytics & tracking¹ ² | `6.34.0+18552420-google` | 10/31/26 |
| JustWatch | Block ads, Hide sponsored titles, Block analytics & tracking² | `26.43.10` | 11/01/26 |
| MGM+ | Skip ads¹, Skip pre-roll promo¹, Skip lion intro, Disable MGM+ AI², Remove social sign-in, Block analytics & tracking¹ ² | `240.0.2026240000` | 10/30/26 |
| Moviebase | GmsCore support, Disable Pairip license check, Block ads, Hide Premium upsell, Block analytics & tracking² | `7.7.0` | 11/02/26 |
| NBA | Skip ads¹, Disable Ask NBA AI¹ ², Block analytics & tracking¹ ² | `1.2.0` | 10/31/26 |
| NFL | Skip ads¹, Block analytics & tracking¹ ² | `61.0.18` | 10/31/26 |
| Paramount+ | Skip launch video, Skip ads, Block analytics & tracking¹ ² | `17.2.0` | 10/31/26 |
| PBS | Skip ads¹, Block analytics & tracking¹ ² | `5.27.0` | 10/30/26 |
| Peacock | Skip ads¹, Disable Xfinity auto sign-in, Block analytics & tracking¹ ² | `7.10.20` | 10/30/26 |
| Pluto TV | Skip launch video, Skip ads, Mask live ad breaks, Block analytics & tracking¹ ² | `17.3.0` | 11/02/26 |
| Prime Video | Skip ads, Rename shared permissions, Disable AI¹ ², Block analytics & tracking¹ ² | `3.0.477.1447` | 11/01/26 |
| Starz | Skip launch video, Skip pre-roll promo¹, Remove social sign-in, Block analytics & tracking¹ ² | `6.11.0` | 10/31/26 |
| Tubi | Skip ads, Remove social sign-in, Hide sign-in prompts, Block analytics & tracking¹ ² | `10.43.1` | 10/30/26 |
| YouTube TV | GmsCore support, Skip ads¹, Change app name, Block telemetry², Hide prompts and promos² | `10.44.0` | 11/02/26 |

### News

| App | Patches | Tested version | Last updated |
|-----|---------|----------------|--------------|
| ABC News | Skip ads¹, Mask live ad breaks, Block analytics & tracking² | `8.98.2` | 11/02/26 |
| CBS News | Disable signature check, Skip ads, Hide surveys, Opt out of data sale & sharing, Block analytics & tracking² | `5.20` | 11/02/26 |
| CNN | Skip ads¹, Opt out of data sale & sharing, Remove social sign-in, Block analytics & tracking¹ ² | `26.21.0` | 10/30/26 |
| Fox Local | Skip ads¹, Hide pop-ups and rating prompts, Opt out of data sale & sharing, Block analytics & tracking² | `7.22.0` | 11/02/26 |
| Fox News | Skip ads¹, Opt out of data sale & sharing, Block analytics & tracking¹ ², Enable developer menu² | `5.49.2` | 10/31/26 |
| MS NOW | Opt out of data sale & sharing, Block analytics & tracking¹ ² | `14.6.0` | 10/31/26 |
| NBC News | Skip ads, Hide surveys and rating prompt, Opt out of data sale & sharing, Block analytics & tracking² | `15.0.1` | 11/02/26 |
| The New York Times | Skip ads¹, Hide upsell pop-ups¹, Remove social sign-in, Block analytics & tracking¹ ² | `11.98.0` | 10/30/26 |
| The Wall Street Journal | Skip ads¹, Hide marketing pop-ups¹, Block analytics & tracking¹ ² | `15.12.0.42675` | 10/30/26 |
| The Washington Post | Skip ads¹, Hide marketing pop-ups¹, Disable AI¹ ², Block analytics & tracking¹ ² | `7.18.1` | 10/30/26 |

### Government

| App | Patches | Tested version | Last updated |
|-----|---------|----------------|--------------|
| FEMA | Save content for offline use, Block analytics & tracking² | `3.2.1` | 11/02/26 |
| MyTSA | Block analytics & tracking² | `5.1.0` | 11/02/26 |
| National Forests & Grasslands | Disable Pairip license check, Block analytics & tracking² | `1.3.0` | 11/02/26 |
| NPS | Block analytics & tracking², Block Bluetooth scanning² | `2.15.0` | 11/02/26 |
| Recreation.gov | Skip location on open, Hide rating prompt, Block analytics & tracking², Show hidden details² | `2.2.67` | 11/02/26 |
| White House | Disable Pairip license check, Remove microphone access, Hide social feeds², Hide promotions², Block analytics & tracking², Route traffic through a proxy² | `47.7.8` | 11/02/26 |

### Shopping

| App | Patches | Tested version | Last updated |
|-----|---------|----------------|--------------|
| Amazon Shopping | Hide sponsored listings¹, Disable AI¹ ² | `32.19.0.100` | 11/01/26 |
| Best Buy | Hide sponsored listings¹, Disable AI¹ ² | `26.10.10` | 11/01/26 |
| CVS | Disable AI¹ ² | `26.10.50` | 11/01/26 |
| DealSeek | Strip affiliate links, Disable Pairip license check, Block analytics & tracking¹ ² | `1.64.0` | 11/01/26 |
| Target | Hide sponsored listings¹, Disable AI¹ ² | `2026.43.0` | 11/01/26 |
| The Home Depot | Disable AI¹ ² | `8.2.5` | 11/01/26 |
| Walgreens | The shared privacy patches only | `118.0` | 11/01/26 |
| Walmart | Disable AI¹ ² | `26.42` | 11/02/26 |

### Carriers

| App | Patches | Tested version | Last updated |
|-----|---------|----------------|--------------|
| Mint Mobile | Block analytics & tracking² | `2.3.40` | 11/01/26 |
| My Verizon | Block session recording, Block analytics & tracking², Disable AI¹ ² | `22.2.5` | 11/02/26 |
| myAT&T | Block session recording, Block background network reports¹, Block analytics & tracking², Disable AI² | `2026.10.1` | 11/01/26 |
| T-Life | Block location tracking, Block session recording, Block analytics & tracking², Disable AI² | `12.3.1` | 11/01/26 |
| T-Mobile Play | Block ads, Block analytics & tracking², Block TV discovery², Hide stories² | `19.4.4` | 11/01/26 |
| Visible | Block ads, Block session recording, Block analytics & tracking² | `3.0.5` | 11/01/26 |
| Xfinity | Block analytics & tracking², Block Advanced Security telemetry², Disable AI² | `6.14.0-2` | 11/01/26 |

## What the patches do

Everything runs on the phone, inside the patched app. The patches do not send data anywhere.

### Ads

**Skip ads** removes the ads in videos and in the app. Ads that are part of a live broadcast still play, except on NBA.

<details>
<summary>What Skip ads removes in each app</summary>

- ABC News: ads in on-demand videos and the feeds, and the Taboola banner in articles.
- AMC+: stitched-in breaks, including the interactive true[X] and Brightline ads.
- Apple TV: ad interstitials in on-demand videos, and promos delivered the same way.
- CBS News: banner ads, ads in videos and recordings, and Taboola recommendations under articles.
- CNN: banner and sponsored-content ads, and ads in videos and clips. All Access streaming is not changed.
- ESPN: scheduled breaks and on-demand mid-rolls.
- Fox Local: ads in on-demand videos, articles, and live blogs, the splash ad, and Taboola recommendations.
- Fox News: banner, feed, sponsored, and full-screen ads, and ad breaks in videos.
- Fox One: ads in on-demand videos. On live TV, the ad tracking and the limits on skipping ahead during breaks.
- Hulu: ads in on-demand videos. Live TV is not changed.
- NBA: ads in videos, games, NBA TV, and article videos.
- NBC News: ads in videos, and display ads on the home and section pages.
- NFL: ads in clips and highlights.
- Paramount+: ads in videos. Live sports breaks show Paramount's "Commercial in Progress" card.
- PBS: sponsor messages before and during videos.
- Pluto TV: on-demand ads. Live breaks are covered by Mask live ad breaks.
- Prime Video: every ad break. Titles play in the older player, so features of the newer one, such as X-Ray, are not available.
- YouTube TV: ads inserted into on-demand videos and DVR recordings, and overlay and pause ads.

</details>

**Block ads** (JustWatch, Moviebase, T-Mobile Play, and Visible) removes the ads and stops the ad networks from starting. On Visible, it also stops Madme, which shows ads over other apps, after calls, when you unlock the phone, and as notifications.

**Mask live ad breaks** (ABC News and Pluto TV) and **Mask ads** (Fandango at Home) cover ads that cannot be removed with a "We'll be right back!" screen and mute them until the break ends. Live ads are part of the broadcast, and Fandango streams a free title only after its ads play. On ABC News, the cover counts down the break.

| Patch | App | What it does |
|-------|-----|--------------|
| Hide sponsored listings | Amazon Shopping, Best Buy, Target | Removes sponsored products from search results, and on Amazon, from product pages. Best Buy's "Featured products" row still shows. |
| Hide sponsored titles | JustWatch | Removes sponsored title cards and the sponsored trailers before videos. |
| Strip affiliate links | DealSeek | Opens each deal at the store's own page, without DealSeek's click tracker or affiliate tags. Covers Amazon, Walmart, Best Buy, eBay, Wayfair, and Target. |

### Pop-ups and prompts

| Patch | App | What it hides |
|-------|-----|---------------|
| Hide Premium upsell | Moviebase | The Premium screen that opens on its own at launch and after sign-in. Premium still opens from Settings and the app's buttons. |
| Hide upsell pop-ups | The New York Times | The full-screen subscription takeover and the promo banner at the top. |
| Hide marketing pop-ups | The Washington Post, The Wall Street Journal | In-app marketing messages, such as subscription offers, and the subscribe banner on The Washington Post's home page. |
| Hide pop-ups and rating prompts | Fox Local | The rate-the-app prompt, the rating card in the feeds, and marketing pop-ups. |
| Hide prompts and promos | YouTube TV | The rate-the-app dialog, promo banners, the app tour, the highlights autoplay prompt, and the "Watch on YouTube" dialog. The last three are hidden only on a fresh install or after you clear the app's data. |
| Hide surveys | CBS News | Qualtrics surveys and the rate-the-app prompt they can lead to. |
| Hide surveys and rating prompt | NBC News | Iterate surveys and the rate-the-app prompt. |
| Hide rating prompt | Recreation.gov | The rate-the-app prompt after checkout. |
| Hide sign-in prompts | Tubi | The request to sign in when you pause or leave a title. |
| Hide promotions | White House | The buttons you choose: "Text President Trump" and "Get in Touch". |
| Hide social feeds | White House | The feeds you choose: Truth Social, X, Instagram, Facebook, LinkedIn, TikTok, YouTube, or the Wire. A hidden feed's tab shows that it could not load. Hiding YouTube also empties the Live tab. |
| Hide stories | T-Mobile Play | The Storyteller stories and video clips in the feeds. |

Push notifications and breaking-news alerts still arrive.

The White House patches let you remove only the parts of the app you do not want. With every option turned on, almost nothing of the app is left.

### AI features

**Disable AI** turns off the app's AI assistant and AI features.

<details>
<summary>What Disable AI turns off in each app</summary>

- Amazon Shopping: the shopping assistant (Rufus, now "Alexa for shopping") in the tabs, search, and camera lens, and the assistant in Amazon Pay. Prompts on Amazon's web pages inside the app can still appear.
- Best Buy: the AI-written review summaries. Ask Blue, Best Buy's assistant, is not covered.
- CVS: AI search in the help center, which also stops the download of Google's on-device AI model, AI insights, AI summaries of visits, lab results, and claims, and proactive AI on pharmacy orders.
- MGM+ (Disable MGM+ AI): the "MGM+ AI" assistant, its "Get Personalized Pick" and "Not sure what to watch?" prompts, and the AI-picks rows on Home.
- My Verizon: the assistant, its voice mode, and its floating button.
- myAT&T: Andi, the assistant, and its Fusion AI features: chat history, voice to text, AI search suggestions, citations, and AI cards. The Andi button opens a chat that shows an error, and in-app chat with an agent stops too. Phone support is not affected.
- NBA (Disable Ask NBA AI): the Ask NBA button on every screen and its tile on the Discover tab.
- Prime Video: Alexa+, its chat button, and its companion mode.
- T-Life: the T-Life AI assistant.
- Target: Ask Target, AI mode in search, the AI gift finder, the AI shopping list scanner, and AI replies in support chat. AI review summaries still show.
- The Home Depot: the Magic Apron assistant and its chat button on the store's web pages.
- The Washington Post: Ask The Post AI, its Ask tab, AI article summaries, and the questions under articles.
- Walmart: the Sparky assistant and the AI features on item and search pages. Customer care chat falls back to the regular help pages.
- Xfinity: the Xfinity Assistant. Support steps that open it can stop working.

</details>

### Privacy

**Block analytics & tracking** stops each app's analytics, ad measurement, and marketing services. Sign-in and playback are left alone, and so is crash reporting, except on Recreation.gov and T-Life. In every app except Apple TV, it also stops Firebase and Google Analytics, Meta app events and the Meta Pixel, Google Ads conversion tracking, Optimizely events, Bitmovin player analytics, and Mixpanel. Facebook sign-in and sharing keep working.

<details>
<summary>What else it stops in each app</summary>

- ABC News: mParticle, comScore, Braze, and Datadog.
- AMC+: AppsFlyer, Braze, mParticle, Nielsen, New Relic, and NPAW/Youbora.
- Apple TV: Apple's usage metrics, such as the pages you view and what you tap, play, and search for.
- CBS News: Adobe Analytics, comScore, Nielsen, Mux, New Relic, Flurry, Kochava, and Moat.
- CNN: Adobe, AppsFlyer, Chartbeat, comScore, and CNN's own data collection.
- DealSeek: AppsFlyer, TikTok, and PostHog. The PostHog feature flags the app reads are left alone.
- Disney+: Braze, Conviva, and Nielsen. Disney's own analytics share servers with sign-in and playback, so they are not blocked.
- ESPN: Braze, New Relic, Conviva, Nielsen, comScore, Kochava, and Adobe Analytics.
- Fandango at Home: comScore, Kochava, Mux, and Adobe Analytics.
- Fox Local: AppsFlyer, comScore, Conviva, Mux, Nielsen, Datadog, LiveRamp, and Fox's own ad and app analytics. Braze, which sends the breaking-news alerts, is left alone.
- Fox News: Adobe, AppsFlyer, Chartbeat, comScore, Nielsen, and Fox's own ad telemetry and ad-ID graph.
- Fox One: AppsFlyer, Braze, Conviva, comScore, Adobe Analytics, Nielsen, Mux, Datadog, Segment, and Contentsquare session replay.
- HBO Max: Branch, Braze, comScore, AppsFlyer, and MediaMelon.
- Hulu: AppsFlyer, Adobe Analytics, Conviva, and Nielsen.
- JustWatch: JustWatch's own event tracking, AppsFlyer, Adjust, and Singular.
- MGM+: Braze, Kochava, Segment, and Nielsen.
- Mint Mobile: Amplitude, Braze, Branch, and Optimizely, along with marketing notifications, in-app promotions, and referral links.
- Moviebase: RevenueCat diagnostics. Purchases and list sync are left alone.
- MS NOW: Adobe, Kochava, Nielsen, comScore, Amplitude, Parse.ly, and Iterate.
- My Verizon: Adobe and its in-app marketing messages, New Relic, and Qualtrics surveys.
- myAT&T: Dynatrace, Adobe and its in-app marketing messages, and Medallia surveys.
- NBA: Braze, New Relic, Amplitude, Datadog, comScore, and Kochava.
- NBC News: Adobe, mParticle, Nielsen, comScore, Conviva, Moat, and Iterate.
- NFL: Kochava, Adobe Analytics, Nielsen, Partnerize, and Amplitude. Analytics sent from the app's JavaScript are not covered.
- NPS: Mapbox map usage reports.
- Paramount+: Braze, Conviva, Nielsen, comScore, Kochava, Adobe Analytics, New Relic, Tealium, and Branch.
- PBS: AppsFlyer and Mux.
- Peacock: Braze, Conviva, Nielsen, comScore, Adobe Analytics, New Relic, mParticle, and Branch.
- Pluto TV: Kochava, comScore, Nielsen, Adobe Analytics, Conviva, New Relic, Salesforce Marketing Cloud, and Pluto's Tealium tag config.
- Prime Video: Amazon's Minerva metrics.
- Recreation.gov: the Firebase events that carry your reservation numbers and payment type, Crashlytics and Firebase Sessions, and Mapbox usage reports. It also keeps your account ID from LaunchDarkly, the app's feature-flag service.
- Starz: AppsFlyer, CleverTap, Leanplum, Braze, and Ethnio surveys.
- T-Life: Adobe, MoEngage and its marketing messages, Amplitude, Splunk, Luciq, and Branch.
- T-Mobile Play: the app's usage events and Apptentive surveys.
- The New York Times: AppsFlyer, Chartbeat, comScore, Datadog, and Iterate surveys.
- The Wall Street Journal: Adobe Analytics, AppsFlyer, Braze, comScore, LiveRamp, Parse.ly, Permutive, and Snowplow.
- The Washington Post: AppsFlyer, Chartbeat, comScore, Permutive, Iterable, and Airship analytics.
- Tubi: Adjust, Branch, Braze, Nielsen, Conviva, NPAW/Youbora, Mux, and Tubi's own analytics.
- Visible: Tealium and Swrve, with its marketing notifications and in-app promotions.
- White House: the Firebase events that record what you read, watch, and search for, and the app's access to your advertising ID.
- Xfinity: Comcast's own event tracking, Datadog, Medallia surveys, and Branch.

</details>

| Patch | App | What it does |
|-------|-----|--------------|
| Block telemetry | YouTube TV | Stops quality reports, interaction logging, view tracking, and ad measurement. Watch history, resume points, location checks, and DRM licenses are left alone. |
| Block session recording | myAT&T, My Verizon, T-Life, Visible | Stops Quantum Metric, which records what you do in the app with details such as your phone number, email, or login ID. |
| Block location tracking | T-Life | Stops Radar, which sends your location every 30 seconds while the app runs. Store check-in and location-based offers can be affected. |
| Block background network reports | myAT&T | Stops Ookla's background reports of your signal and location. The speed test you start still works. |
| Block Advanced Security telemetry | Xfinity | Stops the uploads of the websites Advanced Security checked and your network changes. Threat filtering keeps working. |
| Block TV discovery | T-Mobile Play | Stops Vizbee, which scans your home network for TVs. Sending video to a TV from the app stops working. |
| Opt out of data sale & sharing | CBS News, CNN, Fox Local, Fox News, MS NOW, NBC News | Sets the privacy choice to "do not sell or share" and sends ad partners the US Privacy opt-out signal. You can change it in the app's privacy settings, except on CBS News and CNN. |
| Remove microphone access | White House | Removes the microphone permission, which no feature uses. |
| Skip location on open | Recreation.gov | Stops the precise location check at every launch. Nearby search and permit check-in still use location. |
| Route traffic through a proxy | White House | Sends the app's traffic through the proxy you set, such as Orbot for Tor. The app cannot connect while the proxy is off, and web pages inside the app do not use it. |

These are off by default and shared across apps:

| Patch | Works on | What it does |
|-------|----------|--------------|
| Hide device identifiers | Every app except YouTube TV, MyTSA, and National Forests & Grasslands | Gives the app a random Android ID and a zeroed advertising ID. The DRM ID is left alone, so playback works. |
| Spoof carrier | Every app except YouTube TV, the carrier apps, MyTSA, and FEMA | Hides your carrier, or shows a name you type. Carrier deals, such as League Pass with a phone plan, stop working. |
| Report Wi-Fi connection | Streaming and news apps, except Apple TV, JustWatch, and YouTube TV | Shows mobile data as Wi-Fi, so Wi-Fi-only downloads and mobile quality limits do not apply. This can use a lot of data. |
| Hide VPN connection | Streaming and news apps, except Apple TV, JustWatch, and YouTube TV | Hides an active VPN from the app's checks on the phone. The app's servers can still detect a VPN from your IP address. |
| Hide Wi-Fi networks | Shopping apps and T-Life | Hides nearby Wi-Fi networks and the name of yours. Store detection, smart-home setup, and checkout fraud checks can be affected. On T-Life, leave it off if you use Secure Wi-Fi or T-Mobile Home Internet. |
| Block Bluetooth scanning | Shopping apps, T-Life, and NPS | Stops scans for devices and beacons. In-store maps, CVS kiosk check-in, Amazon smart-home setup, park beacon content, and accessory pairing stop working. |
| Hide cell tower info | Shopping apps | Hides the cell towers your phone sees, which can place you within a few blocks. |
| Block background location | Shopping apps and T-Life | Removes background location access. Store-arrival features and pickup check-in can stop working. |
| Disable auto-updates | Every app except The Washington Post, White House, Mint Mobile, T-Mobile Play, and YouTube TV | Stops the Play Store from replacing the patched app with the official one. It is always on with Tubi's Skip ads. |

### Sign-in and startup

| Patch | App | What it does |
|-------|-----|--------------|
| GmsCore support | Moviebase, YouTube TV | Signs in with Google through MicroG RE instead of Google Play services. |
| Change app name | YouTube TV | Names the app "YT TV+" by default, so it is easy to tell apart from the official app. |
| Remove social sign-in | CNN, HBO Max, MGM+, Starz, The New York Times, Tubi | Removes Google, Facebook, and Apple sign-in. Email, TV-provider, and subscriber sign-in keep working. An account created with Google or Facebook needs a password reset to sign in by email. |
| Disable Xfinity auto sign-in | Peacock | Stops automatic sign-in on an Xfinity home network. |
| Skip launch video | AMC+, Disney+, Paramount+, Pluto TV, Starz | Opens the app without the intro video. |
| Skip lion intro | MGM+ | Opens the app without the lion video. |
| Skip pre-roll promo | MGM+, Starz | Skips the app's own promo before a title. |

### Needed for the app to run

| Patch | App | Why |
|-------|-----|-----|
| Disable Pairip license check | DealSeek, Fox One, Moviebase, National Forests & Grasslands, White House | Google's Pairip check blocks any copy not installed from the Play Store, which includes every patched app. |
| Disable signature check | CBS News | CBS News erases its data and closes when it is not signed by CBS. This also skips its block on rooted phones. |
| Rename shared permissions | Prime Video | Lets Amazon Shopping and other Amazon apps install beside the patched Prime Video. |

### Extra features

**Save content for offline use** (FEMA) keeps the Prepare guides, disaster declarations, FAQ, and the images you have viewed readable without a connection. Long-press the app icon for **Save all**, which downloads every guide in English and Spanish (about 150 MB), or **Refresh**, which updates the saved pages. Saved content is replaced only after the new copy downloads completely.

**Show hidden details** (Recreation.gov) shows details the app receives but does not display: lottery application and award counts, the per-account limit, and result dates, when each ticket time slot stops selling, booking window rules, the deadline to confirm a lottery win, and when venue booking opens or closes.

**Enable developer menu** (Fox News) opens the hidden developer menu with a long-press on the Fox logo at the bottom of Settings. Some of its settings point the app at test servers.

## Known issues

| App | Issue | Cause or workaround |
|-----|-------|---------------------|
| Best Buy | On some phones, every screen has a white tint and the app can take a minute to start. | The official app does the same on these phones, so the patches do not cause it. This is under review. |
| Moviebase | The Activity and Members tabs do not load. | Moviebase's community server accepts only requests that pass Google's Play Integrity check, which a patched app cannot pass. |
| Walmart | Sign-in codes are not sent by text. | A DNS filter such as Control D is blocking `drfdisvc.walmart.com`. Allow it and `h-walmart.online-metrix.net`, which Walmart uses for fraud checks at sign-in. |
| YouTube TV | The location check can take a while indoors, or fail with a VPN on. | MicroG RE falls back to GPS when its Wi-Fi location service has no data for your area. Turn off the VPN if YouTube TV cannot determine your location. |

## Disclaimer

This project is not affiliated with, endorsed by, or sponsored by any of the companies whose apps it patches. All app names and trademarks belong to their owners and are used here only to identify the apps.

This project does not distribute any app, APK, or app code. The patches modify a copy of the app that you supply yourself. Use them on your own devices and accounts, and at your own risk.

## License

GPL-3.0. See [LICENSE](LICENSE) and [NOTICE](NOTICE) for credits.
