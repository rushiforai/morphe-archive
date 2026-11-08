# Mobile Morphe Patches

[![Latest release](https://img.shields.io/github/v/release/semicoloncolonel/mobile-morphe-patches?label=release&color=4f46e5)](https://github.com/semicoloncolonel/mobile-morphe-patches/releases/latest) [![Apps](https://img.shields.io/badge/apps-69-0ea5e9)](#apps) [![Android TV](https://img.shields.io/badge/Android_TV-5_apps-14b8a6)](#android-tv) [![License](https://img.shields.io/github/license/semicoloncolonel/mobile-morphe-patches?color=64748b)](LICENSE)

Morphe patches that remove ads and block tracking in the phone versions of streaming, news, shopping, carrier, and government apps.

<p align="center">
  <a href="https://morphe.software/add-source?github=semicoloncolonel/mobile-morphe-patches"><img alt="Add to Morphe Manager" src="https://img.shields.io/badge/%2B_Add_to-Morphe_Manager-4f46e5?style=for-the-badge"></a>
  <br>
  <sub>Open this link on your phone with Morphe Manager installed.</sub>
</p>

<p align="center">
  <a href="#install">Install</a> ·
  <a href="#apps">Apps</a> ·
  <a href="#what-the-patches-do">What the patches do</a> ·
  <a href="#known-issues">Known issues</a> ·
  <a href="https://github.com/semicoloncolonel/mobile-morphe-patches/issues/new/choose">Report a problem</a>
</p>

> [!NOTE]
> Some patches are phone ports of [ajstrick81's Android TV patches](https://github.com/ajstrick81/morphe-androidtv-patches), and the original hook designs are their work. For the Android TV apps, use the original project.
>
> This project focuses on phone apps that no other patch source covers. The [Morphe patches site](https://morphe-patches.software/) lists the patches from every source, so search it to see what else exists before you request an app. If another source already patches the app you want, please ask its author for updates or new patches.

## Install

1. Download the app from APKMirror in the version listed below. Use the `.apkm` bundle, or the `.apk` for CBS News, ESPN, Fandango at Home, Hulu, MyTSA, Prime Video, The Wall Street Journal, and T-Mobile Play. For Fox One, T-Life, NPS, National Forests & Grasslands, and Recreation.gov, install the app from the Play Store and patch the installed copy.
2. Add this project in Morphe Manager with the link above, or go to Sources, tap +, choose Remote, and paste `https://raw.githubusercontent.com/semicoloncolonel/mobile-morphe-patches/main/patches-bundle.json`.
3. Select the file and apply the patches.

> [!NOTE]
> YouTube TV and Moviebase sign in with Google through MicroG RE, so install it first. The patched YouTube TV installs beside the official app and asks to see MicroG RE's accounts, which Android lists under Contacts. It cannot read your contacts. The patched Moviebase replaces the official app unless you turn on the Clone app option.

### Android TV

> [!IMPORTANT]
> Pluto TV, Plex, JustWatch, and HBO Max also work on Android TV. On a TV, patch the Android TV build, which APKMirror lists separately with "Android TV" in its name. Morphe Manager's download link searches by package name and version, so it can lead to the phone build instead. Pluto TV's phone and Android TV builds are both version 17.3.0, so check the version code: the Android TV build is 520000991, and the phone build is 420000991. Starz and Disney+ also have Android TV builds with the same version names as their phone builds, but their patches support only the phone builds. The Play Store installs the HBO Max phone app as `com.wbd.stream`, and APKMirror lists it as `com.wbd.hbomax`. The patches support both package names for the phone build.

> [!TIP]
> To download the Android TV build directly, use [Aurora Store](https://auroraoss.com/) with a spoofed Android TV device. Aurora's [config generator](https://auroraoss.com/config-generator) creates the device config for spoofing.

## Apps

| | Meaning |
|---|---|
| 🧪 | Experimental: still in testing and may not always work. If you run into an error, please leave a detailed report in [Issues](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/new/choose). |
| ⚙️ | Off by default: this patch is not applied unless you select it in Morphe Manager when patching. |
| 📺 | Also works on the Android TV app. |

<details open>
<summary><b>🎬 Streaming</b> · 27 apps</summary>

| App | Patches | Tested version | Last updated |
|-----|---------|----------------|--------------|
| AMC+ | Skip launch video, Skip ads 🧪, Block analytics & tracking 🧪⚙️ | `1.8.62.1` | 10/31/26 |
| Apple TV | Skip ads 🧪, Block analytics & tracking 🧪⚙️ | `3.0.0` | 10/30/26 |
| Apple TV (Android TV) 📺 | Auto-skip (Android TV) 🧪, Hide rating prompt (Android TV) 🧪 | `17.0.2` | 11/07/26 |
| Disney+ | Skip launch video, Skip ads, Block analytics & tracking 🧪⚙️ | `26.20.0+rc2-2026.10.28` | 11/02/26 |
| ESPN | Skip ads 🧪, Block analytics & tracking 🧪⚙️ | `8.29.0` | 11/04/26 |
| Fandango at Home | Mask ads, Block analytics & tracking ⚙️ | `10.24.r009.179279954` | 11/02/26 |
| Fox One | Skip ads 🧪, Disable Pairip license check, Block analytics & tracking 🧪⚙️ | `1.25.1` | 11/06/26 |
| HBO Max 📺 | Skip ads, Remove social sign-in (phone), Block analytics & tracking 🧪⚙️ | `22.0.0.321`, Android TV `22.0.0.36` | 11/07/26 |
| Hulu | Skip ads 🧪, Block analytics & tracking 🧪⚙️ | `6.34.0+18552420-google` | 10/31/26 |
| JustWatch 📺 | Block ads, Hide sponsored titles, Block analytics & tracking ⚙️ | `26.44.2`, Android TV `26.43.8` | 11/04/26 |
| MGM+ | Skip ads 🧪, Skip pre-roll promo 🧪, Skip lion intro, Disable MGM+ AI ⚙️, Remove social sign-in, Block analytics & tracking 🧪⚙️ | `240.0.2026240000` | 10/30/26 |
| Moviebase | GmsCore support, Disable Pairip license check, Block ads, Hide Premium upsell, Block analytics & tracking ⚙️ | `7.7.0` | 11/02/26 |
| MLB | GmsCore support ⚙️, Skip ads, Hide surveys and rating prompt, Mask live ad breaks 🧪⚙️, Hide betting odds ⚙️, Block analytics & tracking ⚙️ | `26.21.0.49` | 11/05/26 |
| NBA | Skip ads 🧪, Disable Ask NBA AI 🧪⚙️, Block analytics & tracking 🧪⚙️ | `1.2.0` | 10/31/26 |
| NFL | Skip ads 🧪, Block analytics & tracking 🧪⚙️ | `61.0.19` | 11/07/26 |
| Paramount+ | Skip launch video, Skip ads, Block analytics & tracking 🧪⚙️ | `17.3.0` | 11/04/26 |
| PBS | Skip ads 🧪, Block analytics & tracking 🧪⚙️ | `5.27.0` | 10/30/26 |
| Peacock | Skip ads 🧪, Disable Xfinity auto sign-in, Block analytics & tracking 🧪⚙️ | `7.10.30` | 11/06/26 |
| Plex 📺 | Skip ads, Hide sponsored content, Block analytics & tracking ⚙️ | `2026.22.0`, Android TV `2026.22.0` | 11/05/26 |
| Pluto TV 📺 | Skip launch video, Skip ads, Mask live ad breaks, Block analytics & tracking 🧪⚙️ | `17.3.0`, Android TV `17.3.0` | 11/06/26 |
| Prime Video | Skip ads, Rename shared permissions, Disable AI 🧪⚙️, Block analytics & tracking 🧪⚙️ | `3.0.480.457` | 11/04/26 |
| Shudder | Block analytics & tracking ⚙️ | `10.1.1` | 11/05/26 |
| Starz | Skip launch video, Skip pre-roll promo 🧪, Remove social sign-in, Block analytics & tracking 🧪⚙️ | `6.11.0` | 10/31/26 |
| Sundance Now | Block analytics & tracking ⚙️ | `5.0.25.2` | 11/05/26 |
| Tubi | Skip ads, Highest quality 🧪, Remove social sign-in, Hide sign-in prompts, Block analytics & tracking 🧪⚙️ | `10.44.2` | 11/07/26 |
| Xumo Play | Skip ads, Mask live ad breaks 🧪, Block analytics & tracking 🧪⚙️ | `4.6.21` | 11/04/26 |
| YouTube TV | GmsCore support, Skip ads 🧪, Mask live ad breaks 🧪⚙️, Start at high quality 🧪⚙️, Fix picture-in-picture 🧪, Change app name, Block telemetry ⚙️, Hide prompts and promos ⚙️, Hide membership upsell ⚙️ | `10.45.0`, `10.44.0` | 11/07/26 |

</details>

<details>
<summary><b>📰 News</b> · 21 apps</summary>

| App | Patches | Tested version | Last updated |
|-----|---------|----------------|--------------|
| ABC News | Skip ads 🧪, Mask live ad breaks, Block analytics & tracking ⚙️ | `8.98.2` | 11/02/26 |
| AP News | GmsCore support ⚙️, Skip ads, Hide donate button, Block analytics & tracking ⚙️, Route traffic through a proxy ⚙️ | `6.31.2` | 11/05/26 |
| CBS News | Disable signature check, Skip ads, Hide surveys, Opt out of data sale & sharing, Block analytics & tracking ⚙️ | `5.20` | 11/02/26 |
| CNN | Skip ads 🧪, Faster launch, Opt out of data sale & sharing, Remove social sign-in, Block analytics & tracking 🧪⚙️ | `26.21.0` | 11/05/26 |
| C-SPAN Now | Skip ads 🧪, Hide promo banners, Block analytics & tracking ⚙️ | `1.25.0` | 11/05/26 |
| Fox Local | Skip ads 🧪, Hide pop-ups and rating prompts, Opt out of data sale & sharing, Block analytics & tracking ⚙️ | `7.22.0` | 11/02/26 |
| Fox News | Skip ads 🧪, Opt out of data sale & sharing, Block analytics & tracking 🧪⚙️, Enable developer menu ⚙️ | `5.49.2` | 10/31/26 |
| MS NOW | Opt out of data sale & sharing, Block analytics & tracking 🧪⚙️ | `14.6.0` | 10/31/26 |
| NBC News | Skip ads, Hide surveys and rating prompt, Opt out of data sale & sharing, Block analytics & tracking ⚙️ | `15.0.1` | 11/02/26 |
| NewsBreak | GmsCore support ⚙️, Skip ads, Hide rating prompt, Hide Premium upsells, Hide My Town intro, Block installed-app scan, Disable NewsBreak AI, Hide AI summaries ⚙️, Block analytics & tracking ⚙️, Route traffic through a proxy ⚙️ | `26.44.1` | 11/05/26 |
| NewsNation | Skip ads (phone), Block analytics & tracking ⚙️ | `510.3.0` | 11/05/26 |
| NewsNation (Android TV) 📺 | Skip ads (Android TV), Hide rating prompt (Android TV), Block analytics & tracking ⚙️ | `4.94` | 11/06/26 |
| NPR | Fix media connection crash, Skip ads, Hide Waze bar, Hide donate buttons, Opt out of data sale & sharing, Block analytics & tracking ⚙️, Route traffic through a proxy ⚙️ | `7.10.0` | 11/05/26 |
| Substack | Block analytics & tracking ⚙️, Disable screenshot detection, Hide follow upsell | `3.12.0` | 11/05/26 |
| The Daily Wire | GmsCore support ⚙️, Skip ads, Block analytics & tracking ⚙️ | `3.5.21` | 11/05/26 |
| The New York Times | Skip ads 🧪, Hide upsell pop-ups 🧪, Remove social sign-in, Block analytics & tracking 🧪⚙️ | `11.98.0` | 10/30/26 |
| The Wall Street Journal | Skip ads 🧪, Hide marketing pop-ups 🧪, Block analytics & tracking 🧪⚙️ | `15.12.0.42675` | 10/30/26 |
| The Washington Post | Skip ads 🧪, Hide marketing pop-ups 🧪, Disable AI 🧪⚙️, Block analytics & tracking 🧪⚙️ | `7.18.1` | 10/30/26 |
| theScore | Block analytics & tracking ⚙️ | `26.16.0` | 11/05/26 |
| Truth Social | Skip ads, Hide Truth+, Hide crypto and prediction markets, Disable update and review prompts, Disable forced updates, Disable AI, Save videos, Fix pictures shown as videos, Show poll results ⚙️, Show sensitive media ⚙️, Block analytics & tracking ⚙️, Route traffic through a proxy ⚙️ | `1.28.3` | 11/06/26 |
| USA TODAY | Skip ads, Hide subscription prompts, Hide rating prompt, Block analytics & tracking ⚙️ | `8.15.0` | 11/06/26 |

</details>

<details>
<summary><b>🏛️ Government</b> · 6 apps</summary>

| App | Patches | Tested version | Last updated |
|-----|---------|----------------|--------------|
| FEMA | Save content for offline use, Block analytics & tracking ⚙️ | `3.2.1` | 11/02/26 |
| MyTSA | Block analytics & tracking ⚙️ | `5.1.0` | 11/02/26 |
| National Forests & Grasslands | Disable Pairip license check, Block analytics & tracking ⚙️ | `1.3.0` | 11/02/26 |
| NPS | Block analytics & tracking ⚙️, Block Bluetooth scanning ⚙️ | `2.15.0` | 11/02/26 |
| Recreation.gov | Skip location on open, Hide rating prompt, Block analytics & tracking ⚙️, Show hidden details ⚙️ | `2.2.67.1` | 11/07/26 |
| White House | Skip launch video, Disable Pairip license check, Remove microphone access, Hide social feeds ⚙️, Hide promotions ⚙️, Block analytics & tracking ⚙️, Route traffic through a proxy ⚙️ | `47.7.8` | 11/05/26 |

</details>

<details>
<summary><b>🛒 Shopping</b> · 8 apps</summary>

| App | Patches | Tested version | Last updated |
|-----|---------|----------------|--------------|
| Amazon Shopping | Hide sponsored listings 🧪, Disable AI 🧪⚙️ | `32.19.0.100` | 11/01/26 |
| Best Buy | Hide sponsored listings 🧪, Disable AI 🧪⚙️ | `26.10.10` | 11/01/26 |
| CVS | Disable AI 🧪⚙️ | `26.10.50` | 11/01/26 |
| DealSeek | Strip affiliate links, Hide pop-ups, Disable Pairip license check, Block analytics & tracking 🧪⚙️ | `1.64.0` | 11/05/26 |
| Target | Hide sponsored listings 🧪, Disable AI 🧪⚙️ | `2026.43.0` | 11/01/26 |
| The Home Depot | Disable AI 🧪⚙️ | `8.2.5` | 11/01/26 |
| Walgreens | The shared privacy patches only | `118.0` | 11/01/26 |
| Walmart | Disable AI 🧪⚙️ | `26.42.1` | 11/06/26 |

</details>

<details>
<summary><b>📶 Carriers</b> · 7 apps</summary>

| App | Patches | Tested version | Last updated |
|-----|---------|----------------|--------------|
| Mint Mobile | Block analytics & tracking ⚙️ | `2.3.42` | 11/06/26 |
| My Verizon | Block session recording, Block analytics & tracking ⚙️, Disable AI 🧪⚙️ | `22.2.5` | 11/02/26 |
| myAT&T | Block session recording, Block background network reports 🧪, Block analytics & tracking ⚙️, Disable AI ⚙️ | `2026.10.2` | 11/07/26 |
| T-Life | Block location tracking, Block session recording, Block analytics & tracking ⚙️, Disable AI ⚙️ | `12.3.1` | 11/01/26 |
| T-Mobile Play | Block ads, Block analytics & tracking ⚙️, Block TV discovery ⚙️, Hide stories ⚙️ | `19.4.4` | 11/01/26 |
| Visible | Block ads, Block session recording, Block analytics & tracking ⚙️ | `3.0.5` | 11/01/26 |
| Xfinity | Block analytics & tracking ⚙️, Block Advanced Security telemetry ⚙️, Disable AI ⚙️ | `6.14.0-2` | 11/01/26 |

</details>

## What the patches do

Everything runs on the phone, inside the patched app. The patches do not send data anywhere.

### 🚫 Ads

**Skip ads** removes the ads in videos and in the app. Ads that are part of a live broadcast still play, except on NBA.

<details>
<summary>What Skip ads removes in each app</summary>

- ABC News: ads in on-demand videos and the feeds, and the Taboola banner in articles.
- AMC+: stitched-in breaks, including the interactive true[X] and Brightline ads.
- AP News: ad and sponsored rows in the feed and articles, the sticky banner, "Sponsored by" rows, and ads before videos.
- Apple TV: ad interstitials in on-demand videos, and promos delivered the same way.
- CBS News: banner ads, ads in videos and recordings, and Taboola recommendations under articles.
- CNN: banner and sponsored-content ads, and ads in videos and clips. All Access streaming is not changed.
- C-SPAN Now: the pre-roll before archive and on-demand videos. Ads in the live channels are stitched into the stream and still play.
- ESPN: scheduled breaks and on-demand mid-rolls.
- Fox Local: ads in on-demand videos, articles, and live blogs, the splash ad, and Taboola recommendations.
- Fox News: banner, feed, sponsored, and full-screen ads, and ad breaks in videos.
- Fox One: ads in on-demand videos. On live TV, the ad tracking and the limits on skipping ahead during breaks.
- Hulu: ads in on-demand videos. Live TV is not changed.
- MLB: ads before on-demand videos (highlights and classic games). Live-game ads are covered by Mask live ad breaks.
- NBA: ads in videos, games, NBA TV, and article videos.
- NBC News: ads in videos, and display ads on the home and section pages.
- NewsBreak: ads in the feed, the app-open and full-screen ads, and the ads in articles and local-alert pages.
- NewsNation: the banner, native, and full-screen ads, Teads video ads in articles, Taboola recommendations, Nativo sponsored cards, and the pre-roll before videos. Ads in the live channels are not affected.
- NewsNation (Android TV): the video ads before clips. Ads in the live channels are not affected.
- NPR: sponsor banners in the feed, the ad spaces in stories that open as web pages, and ads before videos. Sponsor credits read in podcasts and the live stream are part of the audio and still play.
- The Daily Wire: the banner ads and their "Advertisement" slots, including the one pinned to the top of articles, and the pre-roll before videos. Members-only content stays locked.
- NFL: ads in clips and highlights, including the clips on article pages. The banner ads on article pages are not affected.
- Paramount+: ads in videos. Live sports breaks show Paramount's "Commercial in Progress" card.
- PBS: sponsor messages before and during videos.
- Plex: ads in on-demand titles, and pause ads. Live TV is not changed.
- Pluto TV: on-demand ads. Live breaks are covered by Mask live ad breaks.
- Prime Video: every ad break. Titles play in the older player, so features of the newer one, such as X-Ray, are not available.
- Truth Social: sponsored Truths, boosted posts (paid promotions marked "Boosted"), the other ads placed in the feeds, Google ads, the top banner ad, and the ad on a post's detail page.
- USA TODAY: the ads in the section fronts, articles, galleries, and videos, Taboola recommendations, and the ad-free upsells. It turns on the app's own ad-free mode, so premium articles stay locked and Settings may show you as ad-free.
- Xumo Play: pre-roll and mid-roll ads in on-demand videos. Live breaks are covered by Mask live ad breaks.
- YouTube TV: ads inserted into on-demand videos and DVR recordings, and overlay and pause ads. With Mask live ad breaks, the ads YouTube TV inserts into live breaks are covered instead.

</details>

**Block ads** (JustWatch, Moviebase, T-Mobile Play, and Visible) removes the ads and stops the ad networks from starting. The JustWatch Android TV app shows only video ads, before and during free streams, and those are removed. On Visible, it also stops Madme, which shows ads over other apps, after calls, when you unlock the phone, and as notifications.

**Mask live ad breaks** (ABC News, Pluto TV, Xumo Play, and YouTube TV) and **Mask ads** (Fandango at Home) cover ads that cannot be removed with a "We'll be right back!" screen and mute them until the break ends. Live ads are part of the broadcast, and Fandango streams a free title only after its ads play. On ABC News, the cover counts down the break. On YouTube TV, it covers only the ads YouTube TV inserts into a live break. The commercials built into the channel's own broadcast are not covered and still play.

> [!TIP]
> To turn off Mask live ad breaks on Pluto TV without patching again, create a file named `slate_off` in `Android/data/tv.pluto.android/files`. A file named `pluto_slate_mode` that contains `black` or `mute` keeps only the cover or only the muting.

<details>
<summary>Sponsored content patches · 4</summary>

| Patch | App | What it does |
|-------|-----|--------------|
| Hide sponsored listings | Amazon Shopping, Best Buy, Target | Removes sponsored products from search results, and on Amazon, from product pages. Best Buy's "Featured products" row still shows. |
| Hide sponsored content | Plex | Removes sponsored titles from the rows on Home and Discover, the large sponsored card at the top of each screen, and promoted "Watch Now on" cards. The items are removed from the feed, so no empty space is left behind. |
| Hide sponsored titles | JustWatch | Removes sponsored title cards and the sponsored trailers before videos. |
| Strip affiliate links | DealSeek | Opens each deal at the store's own page, without DealSeek's click tracker or affiliate tags. Covers Amazon, Walmart, Best Buy, eBay, Wayfair, and Target. |

</details>

### 🔕 Pop-ups and prompts

<details>
<summary>All pop-up and prompt patches · 30</summary>

| Patch | App | What it hides |
|-------|-----|---------------|
| Hide Premium upsell | Moviebase | The Premium screen that opens on its own at launch and after sign-in. Premium still opens from Settings and the app's buttons. |
| Hide upsell pop-ups | The New York Times | The full-screen subscription takeover and the promo banner at the top. |
| Hide marketing pop-ups | The Washington Post, The Wall Street Journal | In-app marketing messages, such as subscription offers, and the subscribe banner on The Washington Post's home page. |
| Hide pop-ups and rating prompts | Fox Local | The rate-the-app prompt, the rating card in the feeds, and marketing pop-ups. |
| Hide promo banners | C-SPAN Now | C-SPAN's own program promos, such as the "America's Book Club" banner, above the video player and on the Watch tab. |
| Hide follow upsell | Substack | The "Follow" upsell card shown under notes in the Notes feed. |
| Hide Truth+ | Truth Social | The Truth+ button at the top of the home feeds, the Watch tab, the strip of live Truth+ streams, the live shows row, and the Truth+ banners in the feeds and the side menu. The "+" badges on subscribers' names stay. |
| Hide crypto and prediction markets | Truth Social | Truth Predict, the prediction market run with Crypto.com's US derivatives exchange, and Gems, the rewards that convert to Crypto.com's CRO token. |
| Disable update and review prompts | Truth Social | The Play Store update prompt and the rate-the-app prompt. A patched app cannot update from the Play Store. |
| Hide betting odds | MLB | The betting-odds section on the scores sheet, its toggle, and its legal disclaimer. |
| Hide pop-ups | DealSeek | The Trustpilot and Play Store review requests, the daily spin-the-wheel pop-up, and the survey that appears when you return from a deal. The app also stops downloading updates to its screens, so it stays on the version you patched. |
| Hide prompts and promos | YouTube TV | The rate-the-app dialog, promo banners, the app tour, the highlights autoplay prompt, and the "Watch on YouTube" dialog. The last three are hidden only on a fresh install or after you clear the app's data. |
| Hide membership upsell | YouTube TV | The "Add to membership" shelf on the home screen and in search results, which promotes paid add-on networks. The shelf is removed from the feed, so no empty space is left behind. |
| Hide surveys | CBS News | Qualtrics surveys and the rate-the-app prompt they can lead to. |
| Hide surveys and rating prompt | NBC News | Iterate surveys and the rate-the-app prompt. |
| Hide Waze bar | NPR | Turns off the "Drive with Waze" bar by default. You can turn it back on in the app's settings. |
| Hide donate button | AP News | The Donate link on Top Stories and the "Donate now" card on the account screen. Your account is not changed. |
| Hide donate buttons | NPR | The Donate buttons in the top bar, on the live-station module on Home, on station pages, and on a live stream's detail sheet. |
| Hide Premium upsells | NewsBreak | The "Ad-free Reading" banner and Upgrade button on the Me tab, the Premium button on profiles, the promo on Home, the bottom-bar badge, and the Premium offers in pop-ups and ad dialogs. If you pay for NewsBreak Premium, leave it off: the app stops refreshing your subscription status. |
| Hide My Town intro | NewsBreak | The "Meet My Town" pop-up, the My Town tooltip, and the "new" badge on the tab. |
| Hide surveys and rating prompt | MLB | The Qualtrics surveys and the Play Store rating pop-up they lead to. |
| Hide rating prompt | NewsBreak | The "How are we doing?" pop-up on the home screen and the Play Store rating request. |
| Hide rating prompt (Android TV) | NewsNation (Android TV) | The "rate this app" dialog. Rating from Settings still works. |
| Hide rating prompt (Android TV) | Apple TV (Android TV) | The Google Play review prompt. |
| Hide rating prompt | Recreation.gov | The rate-the-app prompt after checkout. |
| Hide rating prompt | USA TODAY | The Play Store rating request. |
| Hide subscription prompts | USA TODAY | The "Sale" bar pinned to the bottom of articles, the Subscribe links above Top Stories and in the article toolbar, and the subscription offers that pop up on launch, such as the $1 trial. Sign In stays. |
| Hide sign-in prompts | Tubi | The request to sign in when you pause or leave a title. |
| Hide promotions | White House | The buttons you choose: "Text President Trump" and "Get in Touch". |
| Hide social feeds | White House | The feeds you choose: Truth Social, X, Instagram, Facebook, LinkedIn, TikTok, YouTube, or the Wire. A hidden feed's tab shows that it could not load. Hiding YouTube also empties the Live tab. |
| Hide stories | T-Mobile Play | The Storyteller stories and video clips in the feeds. |

</details>

> [!NOTE]
> Push notifications and breaking-news alerts still arrive.
>
> The White House patches let you remove only the parts of the app you do not want. With every option turned on, almost nothing of the app is left.

### 🤖 AI features

**Disable AI** turns off the app's AI assistant and AI features.

<details>
<summary>What Disable AI turns off in each app</summary>

- Amazon Shopping: the shopping assistant (Rufus, now "Alexa for shopping") in the tabs, search, and camera lens, and the assistant in Amazon Pay. Prompts on Amazon's web pages inside the app can still appear.
- Best Buy: the AI-written review summaries. Ask Blue, Best Buy's assistant, is not covered.
- CVS: AI search in the help center, which also stops the download of Google's on-device AI model, AI insights, AI summaries of visits, lab results, and claims, and proactive AI on pharmacy orders.
- MGM+ (Disable MGM+ AI): the "MGM+ AI" assistant, its "Get Personalized Pick" and "Not sure what to watch?" prompts, and the AI-picks rows on Home.
- My Verizon: the assistant, its voice mode, and its floating button.
- myAT&T: Andi, the assistant, and its Fusion AI features: chat history, voice to text, AI search suggestions, citations, and AI cards. The round Andi button and the "Ask Andi" card on Home are removed, and in-app chat with an agent stops too. Phone support is not affected.
- NBA (Disable Ask NBA AI): the Ask NBA button on every screen and its tile on the Discover tab.
- NewsBreak (Disable NewsBreak AI): Nia, the AI chat in the toolbar, home channel, profile, and search, and Scout, the reading assistant in articles. Hide AI summaries, which is off by default, also hides the AI-written summary card on crime and local-alert pages. That card is the incident description, so the page keeps only its title and transcript.
- Prime Video: Alexa+, its chat button, and its companion mode.
- T-Life: the T-Life AI assistant.
- Target: Ask Target, AI mode in search, the AI gift finder, the AI shopping list scanner, and AI replies in support chat. AI review summaries still show.
- The Home Depot: the Magic Apron assistant and its chat button on the store's web pages.
- The Washington Post: Ask The Post AI, its Ask tab, AI article summaries, and the questions under articles.
- Truth Social: the Ask Perplexity AI button on Discover.
- Walmart: the Sparky assistant and the AI features on item and search pages. Customer care chat falls back to the regular help pages.
- Xfinity: the Xfinity Assistant. Support steps that open it can stop working.

</details>

### 🛡️ Privacy

**Block analytics & tracking** stops each app's analytics, ad measurement, and marketing services. Sign-in and playback are left alone, and so is crash reporting, except on Recreation.gov and T-Life. In every app except Apple TV, it also stops Firebase and Google Analytics, Meta app events and the Meta Pixel, Google Ads conversion tracking, Optimizely events, Bitmovin player analytics, and Mixpanel. Facebook sign-in and sharing keep working.

<details>
<summary>What else it stops in each app</summary>

- ABC News: mParticle, comScore, Braze, and Datadog.
- AMC+: AppsFlyer, Braze, mParticle, Nielsen, New Relic, and NPAW/Youbora.
- AP News: Adjust, Branch, Amplitude, Segment, comScore, Parse.ly, LiveRamp, Iterable, Permutive, Quantcast, and AP's BlueConic customer-data platform.
- Apple TV: Apple's usage metrics, such as the pages you view and what you tap, play, and search for.
- CBS News: Adobe Analytics, comScore, Nielsen, Mux, New Relic, Flurry, Kochava, and Moat.
- CNN: Adobe, AppsFlyer, Chartbeat, comScore, and CNN's own data collection.
- C-SPAN Now: the Facebook SDK, Firebase/Google Analytics, and the Privacy Sandbox on-device ad-retargeting call. OneSignal push is left alone.
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
- MLB: comScore, Conviva, Adobe Analytics, and Branch.
- MS NOW: Adobe, Kochava, Nielsen, comScore, Amplitude, Parse.ly, and Iterate.
- My Verizon: Adobe and its in-app marketing messages, New Relic, and Qualtrics surveys.
- myAT&T: Dynatrace, Adobe and its in-app marketing messages, and Medallia surveys.
- NBA: Braze, New Relic, Amplitude, Datadog, comScore, and Kochava.
- NBC News: Adobe, mParticle, Nielsen, comScore, Conviva, Moat, and Iterate.
- NewsBreak: AppsFlyer, Adjust, Branch, Amplitude, mParticle, Segment, Singular, Iterable, LiveRamp, and Amazon ad analytics. NewsBreak's own event log shares servers with its stories, so it is not blocked.
- NewsNation: on phones, comScore, Nielsen, Segment, and Adjust. On Android TV, Kochava, including its rotating failover domains, and Intercom's event endpoint. Intercom chat and push are left working.
- NFL: Kochava, Adobe Analytics, Nielsen, Partnerize, and Amplitude. Analytics sent from the app's JavaScript are not covered.
- NPR: AppsFlyer, Adjust, Branch, mParticle, Segment, comScore, Iterable, Permutive, Quantcast, and Amazon ad analytics.
- NPS: Mapbox map usage reports.
- Paramount+: Braze, Conviva, Nielsen, comScore, Kochava, Adobe Analytics, New Relic, Tealium, and Branch.
- PBS: AppsFlyer and Mux.
- Peacock: Braze, Conviva, Nielsen, comScore, Adobe Analytics, New Relic, mParticle, and Branch.
- Plex: Kochava, Plex's own analytics, Plex's ad measurement, and Statsig event logging.
- Pluto TV: Kochava, comScore, Nielsen, Adobe Analytics, Conviva, New Relic, and Salesforce Marketing Cloud. The Blocking level option chooses what happens to Pluto's own playback tracking, which also saves your place. Relaxed, the default, leaves it on, so Continue Watching keeps working. Aggressive blocks it too, so Pluto TV does not remember where you stopped.
- Prime Video: Amazon's Minerva metrics.
- Recreation.gov: the Firebase events that carry your reservation numbers and payment type, Crashlytics and Firebase Sessions, and Mapbox usage reports. It also keeps your account ID from LaunchDarkly, the app's feature-flag service.
- Shudder: mParticle, Braze, AppsFlyer, Amplitude, Conviva, and Google and Firebase Analytics.
- Starz: AppsFlyer, CleverTap, Leanplum, Braze, and Ethnio surveys.
- Sundance Now: AppsFlyer, Braze, New Relic, and Firebase Analytics.
- T-Life: Adobe, MoEngage and its marketing messages, Amplitude, Splunk, Luciq, and Branch.
- T-Mobile Play: the app's usage events and Apptentive surveys.
- Substack: Sentry, the Facebook SDK, and AppsFlyer. It also removes the Facebook Privacy Sandbox "Fledge" module that enrolls the device in on-device ad-retargeting audiences. Substack's own product analytics share servers with its content, so they are not blocked.
- The Daily Wire: Segment, comScore, Adjust, the Facebook SDK, and Firebase/Google Analytics. The app's ad-blocker report to Segment has nowhere to go.
- The New York Times: AppsFlyer, Chartbeat, comScore, Datadog, and Iterate surveys.
- The Wall Street Journal: Adobe Analytics, AppsFlyer, Braze, comScore, LiveRamp, Parse.ly, Permutive, and Snowplow.
- The Washington Post: AppsFlyer, Chartbeat, comScore, Permutive, Iterable, and Airship analytics.
- theScore: theScore's own event tracking, Amplitude, AppsFlyer, Branch, comScore, Datadog, Segment, Airship analytics, and LiveRamp. Airship push notifications are left alone.
- Tubi: Adjust, Branch, Braze, Nielsen, Conviva, NPAW/Youbora, Mux, and Tubi's own analytics. Recommendations may be less personalized.
- Truth Social: Mixpanel, Adjust, and Firebase/Google Analytics. Truth Social's own requests are left alone.
- USA TODAY: mParticle, Adjust, comScore, Parse.ly, and LiveRamp. Airship, which delivers breaking-news alerts, is left alone.
- Visible: Tealium and Swrve, with its marketing notifications and in-app promotions.
- White House: the Firebase events that record what you read, watch, and search for, and the app's access to your advertising ID.
- Xfinity: Comcast's own event tracking, Datadog, Medallia surveys, and Branch.
- Xumo Play: Xumo's own viewing and impression beacons, Adobe Analytics, Braze, and Kochava.

</details>

<details>
<summary>App-specific privacy patches · 11</summary>

| Patch | App | What it does |
|-------|-----|--------------|
| Block telemetry | YouTube TV | Stops quality reports, interaction logging, view tracking, and ad measurement. Watch history, resume points, location checks, and DRM licenses are left alone. |
| Block installed-app scan | NewsBreak | Stops the app from checking which of about 500 other apps you have, including sportsbooks, prediction markets, period trackers, and payment apps, and sending that list to NewsBreak. |
| Block session recording | myAT&T, My Verizon, T-Life, Visible | Stops Quantum Metric, which records what you do in the app with details such as your phone number, email, or login ID. |
| Block location tracking | T-Life | Stops Radar, which sends your location every 30 seconds while the app runs. Store check-in and location-based offers can be affected. |
| Block background network reports | myAT&T | Stops Ookla's background reports of your signal and location. The speed test you start still works. |
| Block Advanced Security telemetry | Xfinity | Stops the uploads of the websites Advanced Security checked and your network changes. Threat filtering keeps working. |
| Block TV discovery | T-Mobile Play | Stops Vizbee, which scans your home network for TVs. Sending video to a TV from the app stops working. |
| Opt out of data sale & sharing | CBS News, CNN, Fox Local, Fox News, MS NOW, NBC News, NPR | Sets the privacy choice to "do not sell or share" and sends ad partners the US Privacy opt-out signal. On Fox News, it also opts out of Nielsen measurement. On NPR, it chooses Reject All on the cookie banner of the npr.org pages inside the app and hides the banner. You can change it in the app's privacy settings, except on CBS News and CNN. |
| Remove microphone access | White House | Removes the microphone permission, which no feature uses. |
| Skip location on open | Recreation.gov | Stops the precise location check at every launch. Nearby search and permit check-in still use location. |
| Route traffic through a proxy | AP News, NewsBreak, NPR, Truth Social, White House | Sends the app's traffic through the proxy you set, such as Orbot for Tor or a SOCKS5 server from a VPN service. A SOCKS5 proxy that needs a login is entered as `socks5://user:password@host:port`, and the login is stored in the patched app. The app cannot connect while the proxy is off, and web pages inside the app do not use it. |

</details>

<details>
<summary>Shared privacy patches, off by default · 9</summary>

| Patch | Works on | What it does |
|-------|----------|--------------|
| Hide device identifiers | Every app except YouTube TV, MyTSA, and National Forests & Grasslands | Gives the app a random Android ID and a zeroed advertising ID. The DRM ID is left alone, so playback works. On Truth Social, the Adjust ID the app sends to Truth Social's own server is also replaced with a random one. |
| Spoof carrier | Every app except YouTube TV, theScore, the carrier apps, MyTSA, and FEMA | Hides your carrier, or shows a name you type. Carrier deals, such as League Pass with a phone plan, stop working. |
| Report Wi-Fi connection | Streaming and news apps, except Apple TV, JustWatch, theScore, and YouTube TV | Shows mobile data as Wi-Fi, so Wi-Fi-only downloads and mobile quality limits do not apply. This can use a lot of data. |
| Hide VPN connection | Streaming and news apps, except Apple TV, JustWatch, theScore, and YouTube TV | Hides an active VPN from the app's checks on the phone. The app's servers can still detect a VPN from your IP address. |
| Hide Wi-Fi networks | Shopping apps and T-Life | Hides nearby Wi-Fi networks and the name of yours. Store detection, smart-home setup, and checkout fraud checks can be affected. On T-Life, leave it off if you use Secure Wi-Fi or T-Mobile Home Internet. |
| Block Bluetooth scanning | Shopping apps, T-Life, and NPS | Stops scans for devices and beacons. In-store maps, CVS kiosk check-in, Amazon smart-home setup, park beacon content, and accessory pairing stop working. |
| Hide cell tower info | Shopping apps | Hides the cell towers your phone sees, which can place you within a few blocks. |
| Block background location | Shopping apps and T-Life | Removes background location access. Store-arrival features and pickup check-in can stop working. |
| Disable auto-updates | Every app except The Washington Post, White House, Mint Mobile, T-Mobile Play, and YouTube TV | Stops the Play Store from replacing the patched app with the official one. To update, patch the newer version. It is always on with Tubi's Skip ads. |

</details>

### 🔑 Sign-in and startup

<details>
<summary>Sign-in and startup patches · 12</summary>

| Patch | App | What it does |
|-------|-----|--------------|
| GmsCore support | AP News, MLB, Moviebase, NewsBreak, The Daily Wire, YouTube TV | Signs in with Google through MicroG RE instead of Google Play services. On AP News, MLB, NewsBreak, and The Daily Wire it is off by default, because those apps also offer other sign-ins; with it on, push notifications come through MicroG RE too. |
| Change app name | YouTube TV | Names the app "YT TV+" by default, so it is easy to tell apart from the official app. |
| Remove social sign-in | CNN, HBO Max (phone), MGM+, Starz, The New York Times, Tubi | Removes Google, Facebook, and Apple sign-in. Email, TV-provider, and subscriber sign-in keep working. An account created with Google or Facebook needs a password reset to sign in by email. |
| Faster launch | CNN | Opens the app without waiting to download its feature settings from Optimizely. When a DNS blocker blocks that download, the app otherwise waits about 14 seconds on its splash screen. The app starts with the settings it saved last time, and updates them in the background. |
| Disable Xfinity auto sign-in | Peacock | Stops automatic sign-in on an Xfinity home network. |
| Fix picture-in-picture | YouTube TV | Keeps the picture-in-picture window at the video's shape. Without it, the window can flicker between two sizes for several seconds after it shrinks. Needs Android 13 or later. |
| Skip launch video | AMC+, Disney+, Paramount+, Pluto TV, Starz, White House | Opens the app without the intro video. |
| Start at high quality | YouTube TV | Starts recordings and on-demand videos at high quality, without the flicker of stepping up from a low one. They start at 1080p, or at the resolution you choose in the patch options. Live channels still start low, because the player picks their quality itself. A slow connection can take longer to start. The patch cannot go above what your plan includes. Choose 2160p only if you have the 4K Plus add-on: without it, videos start low and step up as if the patch were off. |
| Highest quality | Tubi | Plays the highest-resolution version of each title and live channel, and keeps it at the highest bitrate Tubi sends. Most titles stop at 720p, and a few have 1080p. Tubi sends the app fewer renditions than its website, so some titles play below the resolution the website offers. Turn it off if videos buffer. |
| Skip lion intro | MGM+ | Opens the app without the lion video. |
| Skip pre-roll promo | MGM+, Starz | Skips the app's own promo before a title. |
| Disable forced updates | Truth Social | Keeps the app open when Truth Social's server asks for a newer version. A patched app cannot update from the Play Store. |

</details>

### 🔧 Needed for the app to run

| Patch | App | Why |
|-------|-----|-----|
| Disable Pairip license check | DealSeek, Fox One, Moviebase, National Forests & Grasslands, White House | Google's Pairip check blocks any copy not installed from the Play Store, which includes every patched app. |
| Disable signature check | CBS News | CBS News erases its data and closes when it is not signed by CBS. This also skips its block on rooted phones. |
| Fix media connection crash | NPR | NPR closes when Android Auto, the Google app, or another approved player connects with a signature the app does not expect. The connection is refused or allowed instead. |
| Rename shared permissions | Prime Video | Lets Amazon Shopping and other Amazon apps install beside the patched Prime Video. |

### ✨ Extra features

**Auto-skip** (Apple TV on Android TV) presses Skip for you on the parts you choose in its options: Apple's promos for other titles, which are on by default, and recaps and intros, which are off by default. Other buttons, such as Add, are left alone.

**Save content for offline use** (FEMA) keeps the Prepare guides, disaster declarations, FAQ, and the images you have viewed readable without a connection. Long-press the app icon for **Save all**, which downloads every guide in English and Spanish (about 150 MB), or **Refresh**, which updates the saved pages. Saved content is replaced only after the new copy downloads completely.

**Show hidden details** (Recreation.gov) shows details the app receives but does not display: the ticket-lottery application and award counts and the per-account limit (in a dialog you dismiss, since that screen has no text to add them to), when each ticket time slot stops selling, booking window rules, the deadline to confirm a lottery win, and when venue booking opens or closes. The lottery's results date is left out because the app already shows it.

**Enable developer menu** (Fox News) opens the hidden developer menu with a long-press on the Fox logo at the bottom of Settings. Reopen the app after you change a feature flag. Some of its settings point the app at test servers.

**Save videos** (Truth Social) adds a "Save video" row to the full-screen player's Playback Controls, and names the Save button "Save video" for a video in the media viewer. The video is saved at its original quality to Movies/Truth Social.

**Fix pictures shown as videos** (Truth Social) shows a post's picture as a picture. The app sometimes draws a picture in its video player, with a play button that does nothing, when a related post has a video. With this on, the picture opens in the image viewer.

**Show poll results** (Truth Social) adds each option's share of the votes to its label before you vote, such as "Yes · 62%". The server sends the counts, but the app shows them only after you vote. You can still vote.

**Show sensitive media** (Truth Social) shows the media in posts marked sensitive without blurring it first. Content warnings written by the author still show.

**Disable screenshot detection** (Substack) stops the app from reacting when you take a screenshot. Substack registers Android's screenshot callback on its reader and other screens and then runs its own handler; with this on, a screenshot does nothing.

## Known issues

| App | Issue | Cause or workaround |
|-----|-------|---------------------|
| NewsNation (Android TV), Apple TV (Android TV) | On a TV, Morphe Manager may offer to update the app to the phone version (NewsNation 510.3.0, Apple TV 3.0.0). | The phone and Android TV apps share a package name, and Morphe Manager compares only version numbers. Ignore the update. The Android TV versions are NewsNation 4.94 and Apple TV 17.0.2. |
| HBO Max | On TV, a resumed episode can show "Couldn't Play Content" (error 39999) when it reaches a mid-roll ad break. | Start the episode from the beginning. |
| Best Buy | On some phones, every screen has a white tint and the app can take a minute to start. | The official app does the same on these phones, so the patches do not cause it. This is under review. |
| Moviebase | The Activity and Members tabs do not load. | Moviebase's community server accepts only requests that pass Google's Play Integrity check, which a patched app cannot pass. |
| Walmart | Sign-in codes are not sent by text. | A DNS filter such as Control D is blocking `drfdisvc.walmart.com`. Allow it and `h-walmart.online-metrix.net`, which Walmart uses for fraud checks at sign-in. |
| YouTube TV | The location check can take a while indoors, or fail with a VPN on. | MicroG RE falls back to GPS when its Wi-Fi location service has no data for your area. Turn off the VPN if YouTube TV cannot determine your location. |

## Disclaimer

This project is not affiliated with, endorsed by, or sponsored by any of the companies whose apps it patches. All app names and trademarks belong to their owners and are used here only to identify the apps.

This project does not distribute any app, APK, or app code. The patches modify a copy of the app that you supply yourself. Use them on your own devices and accounts, and at your own risk.

## License

GPL-3.0. See [LICENSE](LICENSE) and [NOTICE](NOTICE) for credits.
