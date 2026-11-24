<div align="center">

<h1>
  <img src="https://avatars.githubusercontent.com/u/178358868?v=4"
       alt="Aidan"
       width="40"
       height="40"
       align="absmiddle"
       style="border-radius:50%;">
  &nbsp;
  <i>Aidan's Morphe Patches</i>
</h1>

My [Morphe](https://morphe.software) patches

[![License: WTFPL](https://img.shields.io/badge/License-WTFPL-white.svg)](http://www.wtfpl.net/about/)
![Kotlin](https://img.shields.io/badge/Kotlin-%237F52FF.svg?logo=kotlin&logoColor=white)
![Rust](https://img.shields.io/badge/Rust-%23000000.svg?logo=rust&logoColor=white)
![Java](https://img.shields.io/badge/Java-%23ED8B00.svg?logo=openjdk&logoColor=white)
[![AI Generated](https://img.shields.io/badge/AI%20Generated-orange?logo=googlegemini&logoColor=white)](https://img.shields.io/badge/AI%20Generated-orange?logo=googlegemini&logoColor=white)

[![APK Lab Tests](https://github.com/ihatenodejs/aidans-patches/actions/workflows/apk-lab-tests.yml/badge.svg)](https://github.com/ihatenodejs/aidans-patches/actions/workflows/apk-lab-tests.yml)
[![Tests Passing](https://worker.patch.p0ntus.com/badges/tests.svg)](https://patch.p0ntus.com/status)

[![Add to Morphe badge](https://github.com/ihatenodejs/aidans-patches/blob/main/assets/add-to-morphe.png?raw=true)](https://morphe.software/add-source?github=ihatenodejs/aidans-patches)

<h2>DISCLAIMERS</h2>

> These patches are provided for educational, research, and personal-use purposes and are not affiliated with, endorsed by, or supported by Morphe or any third-party application, service, financial institution, brokerage, exchange, or other entity affected by them.

> This project is developed primarily using AI-assisted coding agents. AI is responsible for generating much of the code, while I direct development, make design decisions, and guide the implementation of patches.
>
> AI-generated code may contain mistakes, unexpected behavior, or security vulnerabilities. Please review the source code and use these patches at your own risk.

> Use of these patches is entirely at your own risk. Patches may modify the behavior, appearance, functionality, security characteristics, or data displayed by third-party applications. They may stop working at any time or cause unintended behavior.

> **Do not rely on these patches for financial, investment, trading, banking, accounting, or other financial decisions.** The author makes no representation regarding the accuracy, completeness, reliability, availability, or correctness of any information displayed or affected by these patches.

> TO THE MAXIMUM EXTENT PERMITTED BY APPLICABLE LAW, THE SOFTWARE AND PATCHES ARE PROVIDED **“AS IS” AND “AS AVAILABLE,” WITHOUT WARRANTY OF ANY KIND**, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, NONINFRINGEMENT, ACCURACY, RELIABILITY, OR SECURITY.

> TO THE MAXIMUM EXTENT PERMITTED BY APPLICABLE LAW, IN NO EVENT SHALL THE AUTHOR OR COPYRIGHT HOLDER BE LIABLE FOR ANY CLAIM, LOSS, DAMAGE, OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT, NEGLIGENCE, OR OTHERWISE, ARISING FROM OR RELATED TO THE SOFTWARE, INCLUDING WITHOUT LIMITATION **FINANCIAL LOSSES, TRADING LOSSES, LOSS OF FUNDS, LOSS OF DATA, ACCOUNT RESTRICTIONS OR TERMINATION, FAILED OR UNINTENDED TRANSACTIONS, OR OTHER DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES.**

</div>

## 📱 Supported Applications & Patches

<!-- PATCHES_START EXPANDED -->

> **[v1.10.0-dev.12](https://github.com/ihatenodejs/aidans-patches/releases/tag/v1.10.0-dev.12)**&nbsp;&nbsp;•&nbsp;&nbsp;`dev`&nbsp;&nbsp;•&nbsp;&nbsp;80 patches total

<details open>
<summary>📦 SidelineSwap&nbsp;&nbsp;•&nbsp;&nbsp;4 patches&nbsp;&nbsp;<a href="https://patch.p0ntus.com/status"><img src="https://worker.patch.p0ntus.com/badges/tests/com.sidelineswap.android.svg" alt="Tests Passing" align="absmiddle"></a></summary>
<br>

**🎯 Supported versions:**

| 2.3.2 |
| :---: |

| 💊&nbsp;Patch                    | 📜&nbsp;Description                                                                                                                                                                                                                                                                              | ⚙️&nbsp;Options                                                                                                                                                                                                                                                                                           |
| -------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **AMOLED Theme**                 | Applies a pure-black AMOLED palette to SidelineSwap's Compose theme: black surfaces and container tokens, readable light text and icons, a black launch window, light system-bar icons, and force-dark embedded WebViews.                                                                        |                                                                                                                                                                                                                                                                                                           |
| **Block Tracking and Telemetry** | Neutralizes first-party analytics (SidelineSwap backend), behavioral tracking (Amplitude, Firebase Analytics, Iterable), diagnostic telemetry (Firebase Crashlytics), payment gateway telemetry (Braintree FPTI), Google Play Install Referrer, and zeros the Google Play Advertising ID (AAID). | • Disable First-Party Analytics<br>• Disable Amplitude Analytics<br>• Disable Firebase & GMS Analytics<br>• Disable Crashlytics & Diagnostic Logging<br>• Disable Iterable Telemetry<br>• Disable Braintree Gateway Telemetry<br>• Zero Google Play Advertising ID<br>• Disable Install Referrer Tracking |
| **Change Brand Color**           | Customizes the primary brand accent color across SidelineSwap buttons, navigation highlights, badges, and accents.                                                                                                                                                                               | • Primary Brand Color<br>• Primary Dark Color                                                                                                                                                                                                                                                             |
| **Remove Invite Friends**        | Removes the Invite Friends entry from the Account screen and blocks direct and deep-link navigation to the referral screen.                                                                                                                                                                      |                                                                                                                                                                                                                                                                                                           |

</details>

<details open>
<summary>📦 AfterShip&nbsp;&nbsp;•&nbsp;&nbsp;11 patches&nbsp;&nbsp;<a href="https://patch.p0ntus.com/status"><img src="https://worker.patch.p0ntus.com/badges/tests/com.aftership.AfterShip.svg" alt="Tests Passing" align="absmiddle"></a></summary>
<br>

**🎯 Supported versions:**

| 5.25.8 |
| :----: |

| 💊&nbsp;Patch                           | 📜&nbsp;Description                                                                                                                                                                                                                                                                                                                                                                                                         | ⚙️&nbsp;Options       |
| --------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------- |
| **Add Copy Tracking Number Option**     | Adds an option to copy tracking numbers in the multi-shipment selection menu.                                                                                                                                                                                                                                                                                                                                               |                       |
| **Bypass Native Signature Check**       | Neutralizes APK signature verification in libandroidsig-lib.so so API requests succeed when signed with custom keys.                                                                                                                                                                                                                                                                                                        |                       |
| **Custom Google Maps API Key**          | Replaces the embedded Google Maps API key with a personal Google Cloud API key so native Google Maps renders on re-signed builds. Note: To use native Google Maps, disable the OpenStreetMap Drop-in Replacement patch.                                                                                                                                                                                                     | • Google Maps API Key |
| **Full AMOLED Theme**                   | Themes AfterShip in pure AMOLED black by removing dark gray backgrounds from the bottom navigation bar, account items, cards, and windows.                                                                                                                                                                                                                                                                                  |                       |
| **Hide Broken Tracking Map**            | Suppresses the unauthenticated blank white Google Maps view when neither a custom Google Maps API key nor OpenStreetMap is used.                                                                                                                                                                                                                                                                                            |                       |
| **OpenStreetMap Drop-in Replacement**   | Replaces the broken Google Maps view with a free, self-contained OpenStreetMap (Leaflet) engine that renders routes, checkpoints, and dark/light styled tiles without requiring an API key.                                                                                                                                                                                                                                 | • Add Zoom Buttons    |
| **Remove Ads and Tracking**             | Neutralizes in-app advertisements (Disco Network SDK shopping/cashback ads and list placements), removes the 'Leave us a 5-star review' in-app rating prompt dialogs, zeros the Google Play Advertising ID (AAID), disables first-party behavioral and impression analytics (StatisticsCenter, AbsListImpEventHelper, AutoUploadManager), and blocks diagnostic telemetry (Firebase Analytics, Crashlytics, Logan logging). |                       |
| **Remove AfterShip Account Page Links** | Removes the About the app, Share the app, and Feedback links from the Account screen.                                                                                                                                                                                                                                                                                                                                       |                       |
| **Remove Feedback**                     | Removes prompting for feedback on shipments.                                                                                                                                                                                                                                                                                                                                                                                |                       |
| **Remove Login**                        | Forces guest mode always on first install, removes login buttons and carousels, strips account/login controls from the Account tab, and suppresses login prompts.                                                                                                                                                                                                                                                           |                       |
| **Remove Shipment Sync**                | Removes email shipment synchronization features, including prompts, banners, dialogs, empty state sync cards, and account settings.                                                                                                                                                                                                                                                                                         |                       |

</details>

<details open>
<summary>📦 Blackjack&nbsp;&nbsp;•&nbsp;&nbsp;6 patches&nbsp;&nbsp;<a href="https://patch.p0ntus.com/status"><img src="https://worker.patch.p0ntus.com/badges/tests/com.tripledot.blackjack.svg" alt="Tests Passing" align="absmiddle"></a></summary>
<br>

**🎯 Supported versions:**

| 2.23.01 |
| :-----: |

| 💊&nbsp;Patch                     | 📜&nbsp;Description                                                                                                                                            | ⚙️&nbsp;Options         |
| --------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------- |
| **Add Custom Chip Store**         | Replaces the unavailable store with a dialog to view and set your exact chip balance.                                                                          |                         |
| **Remove Ads**                    | Removes banner, interstitial, and rewarded advertising and removes ad-based chip offers.                                                                       |                         |
| **Remove Internet Permissions**   | Removes Internet permissions from AndroidManifest.xml to prevent network access.                                                                               | • Remove Broken Screens |
| **Remove Notifications**          | Removes notification permissions from AndroidManifest.xml to eliminate push notifications entirely.                                                            |                         |
| **Remove Tracking and Analytics** | Neutralizes active advertising telemetry, analytics, attribution, and crash reporting.                                                                         |                         |
| **Skip to Next Level**            | Allows tapping the next level indicator on the top bar to show a confirmation dialog and skip to the next level. REQUIRES Add Custom Chip Store to be enabled. |                         |

</details>

<details open>
<summary>📦 Fizz&nbsp;&nbsp;•&nbsp;&nbsp;5 patches&nbsp;&nbsp;<a href="https://patch.p0ntus.com/status"><img src="https://worker.patch.p0ntus.com/badges/tests/com.ashtoncofer.Buzz.svg" alt="Tests Passing" align="absmiddle"></a></summary>
<br>

**🎯 Supported versions:**

| 1.54.0 | 1.72.0 |
| :----: | :----: |

| 💊&nbsp;Patch                     | 📜&nbsp;Description                                                                                                                                                                                                                                                      | ⚙️&nbsp;Options                                   |
| --------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------- |
| **Block Update Prompts**          | Blocks forced app update prompts, allowing older versions of the app to continue running.                                                                                                                                                                                |                                                   |
| **Enable Developer Settings**     | Adds an in-app developer mod menu accessible via a top-bar header button, with controls for Mobile Studio.                                                                                                                                                               | • Mobile Studio                                   |
| **Remove Ads**                    | Removes sponsored feed advertisements and optional marketplace listing advertisements from the feed.                                                                                                                                                                     | • Remove Marketplace Ads                          |
| **Remove Tracking and Analytics** | Neutralizes first-party client event tracking, Mixpanel analytics, Airbridge and Adjust attribution SDKs, Google Advertising ID (AAID) collection, and bypasses PairIP Play Integrity verification, with options for silent DM screenshots and Sentry telemetry removal. | • Silent Screenshots<br>• Disable Crash Reporting |
| **Replace Emoji Font with iOS**   | Replaces Android system emoji with iOS Apple Color Emoji across Compose UI, posts, comments, and direct messages (effective on Android 10+ / API 29+).                                                                                                                   |                                                   |

</details>

<details open>
<summary>📦 Canvas Student&nbsp;&nbsp;•&nbsp;&nbsp;8 patches&nbsp;&nbsp;<a href="https://patch.p0ntus.com/status"><img src="https://worker.patch.p0ntus.com/badges/tests/com.instructure.candroid.svg" alt="Tests Passing" align="absmiddle"></a></summary>
<br>

**🎯 Supported versions:**

| 8.12.0 |
| :----: |

| 💊&nbsp;Patch                           | 📜&nbsp;Description                                                                                                                                                                                                                                                                                                                                                 | ⚙️&nbsp;Options                                                                                                                                        |
| --------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Change App Icon**                     | Recolors the Canvas launcher icon and optionally replaces its foreground with a custom PNG. The colors also theme the launch splash screen and the signed-out Canvas logo when changed. The image is an adaptive-icon foreground, so launchers mask it to their icon shape; keep artwork inside the central safe area of a 432x432 PNG.                             | • Foreground Color<br>• Background Color<br>• Splash Background Color<br>• Theme Splash Screen<br>• Theme Signed-Out Logo<br>• Custom Foreground Image |
| **Change App Name**                     | Replaces the launcher label shown under the app icon. In-app text is unchanged.                                                                                                                                                                                                                                                                                     | • App Name                                                                                                                                             |
| **Clone App**                           | Changes the package name so this build installs alongside the original Canvas Student. The clone has separate app data. Re-signed or cloned App Links, push notifications, and package/certificate-bound services may not work; verify login, sharing, and document viewing.                                                                                        | • Clone Package Name                                                                                                                                   |
| **Disable AI Study Tools**              | Hides Study Tools and stops page content from being sent to Instructure's AI study-assist endpoint.                                                                                                                                                                                                                                                                 |                                                                                                                                                        |
| **Fix PDF Viewer Crash**                | Stops the document viewer from aborting when opening any PDF. Nutrient's license grants form viewing and filling but not form editing, yet the native library applies its editing-only license assertion to view-path calls such as form field loading, so the process is killed.                                                                                   | • Remove Evaluation Watermark                                                                                                                          |
| **Remove Tracking and Analytics**       | Neutralizes behavioral tracking (Pendo SDK session recordings, guides, and click tracking), student surveillance telemetry (Pandata pageview recording, time-spent counters, and background upload worker), first-party app analytics (ScreenView processors, offline analytics, token logging), crash reporting (Firebase Crashlytics), and in-app rating prompts. | • Disable Crashlytics Collection                                                                                                                       |
| **Show Remote Config Editor**           | Adds the hidden Remote Config editor to Settings, allowing Firebase remote-config overrides and experimental flags to be inspected and changed.                                                                                                                                                                                                                     |                                                                                                                                                        |
| **Unlock Notebook and Offline Content** | Forces the client-side Notebook and Offline Content environment feature flags on, regardless of the institution's rollout. Server support is still required for content sync.                                                                                                                                                                                       | • Enable Notebook<br>• Enable Offline Content                                                                                                          |

</details>

<details open>
<summary>📦 Sezzle&nbsp;&nbsp;•&nbsp;&nbsp;16 patches&nbsp;&nbsp;<a href="https://patch.p0ntus.com/status"><img src="https://worker.patch.p0ntus.com/badges/tests/com.sezzle.sezzlemobile.svg" alt="Tests Passing" align="absmiddle"></a></summary>
<br>

**🎯 Supported versions:**

| 5.3.24 |
| :----: |

| 💊&nbsp;Patch                                  | 📜&nbsp;Description                                                                                                                                                                                                                | ⚙️&nbsp;Options                                                                                                                                                                                                            |
| ---------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Clean Authentication**                       | Removes the unavailable phone sign-in controls while keeping Google and Apple sign-in.                                                                                                                                             | • Inject patch warning                                                                                                                                                                                                     |
| **Clean Home**                                 | Removes store/brand carousels and promotional banners from the Home tab, with an optional shortcut-row cleanup.                                                                                                                    | • Remove Shortcuts<br>• Remove Store and Brand Carousels<br>• Remove Promotional Banners<br>• Remove Sezzle Spend Balance Banner                                                                                           |
| **Configure Shortcuts**                        | Customizes items displayed in the Your Shortcuts carousel.                                                                                                                                                                         | • Hide Refer a Friend<br>• Hide Giveaway<br>• Hide Offers<br>• Hide Rewards<br>• Hide Sezzle Mobile<br>• Hide Amazon Deals<br>• Hide Pay Later Anywhere<br>• Hide Sezzle Points<br>• Hide Sezzle Spend<br>• Hide Sezzle Up |
| **Enable App Debugging**                       | Marks the app debuggable so patch developers can use ADB run-as after reinstalling.                                                                                                                                                |                                                                                                                                                                                                                            |
| **Hide Sezzle Mobile**                         | Hides Sezzle Mobile offers and account entry points.                                                                                                                                                                               |                                                                                                                                                                                                                            |
| **Patch Consent Screen**                       | Requires consent to a patched-app warning before opening Sezzle authentication.                                                                                                                                                    |                                                                                                                                                                                                                            |
| **Remove Ads and Tracking**                    | Removes all ads (AppLovin MAX, Google Mobile Ads, Rokt, Thanks network, Playtime, InBrain Surveys) and disables analytics and tracking SDKs (AppsFlyer, FullStory, Braze, Firebase Analytics, mParticle, Facebook SDK, AppCenter). |                                                                                                                                                                                                                            |
| **Remove Promos & Giveaways**                  | Blocks in-app deal popups, giveaway screens, Knot card-linking dialogs, and marketing banners across the app.                                                                                                                      | • Block Merchant Deal Popovers<br>• Block Knot Account Linking Promos<br>• Block Wallet Marketing<br>• Block Playtime Marketing<br>• Block Referrals & Social<br>• Block Trivia<br>• Block Notification Prompts            |
| **Remove Rewards**                             | Removes the Rewards bottom navigation tab while keeping Account's Sezzle Points item accessible.                                                                                                                                   |                                                                                                                                                                                                                            |
| **Remove Sezzle Subscriptions**                | Removes references to Sezzle Anywhere and Sezzle Premium subscriptions in Account benefits, the Home gift card carousel, Wallet, and Orders help.                                                                                  | • Remove Gift Cards from Home                                                                                                                                                                                              |
| **Rename Shop to Home**                        | Renames the Shop bottom navigation tab to Home.                                                                                                                                                                                    |                                                                                                                                                                                                                            |
| **Replace AI Discover with Products**          | Replaces the AI Discover navigation tab with Sezzle's original non-AI Products tab and removes the Sezzle AI callout in search. Includes an option to remove the Products tab completely.                                          | • Remove Products Tab                                                                                                                                                                                                      |
| **Suppress In-App Updates and Rating Prompts** | Neutralizes Hermes Redux update sagas, UpdateAppModal dialogs, Play Store URL redirects, trustFall tamper detection, and in-app rating prompts.                                                                                    | • Suppress Force Updates<br>• Bypass Hermes Tamper Checks<br>• Suppress Store Rating Prompts                                                                                                                               |
| **Unlock Custom App Icons**                    | Enables custom launcher app icons (Arctic, Peach, Glass, Rainbow, Sand, Classic) without requiring a Sezzle Premium subscription.                                                                                                  |                                                                                                                                                                                                                            |
| **Unlock Developer Settings**                  | Makes the internal Development Settings menu visible to every signed-in account.                                                                                                                                                   |                                                                                                                                                                                                                            |
| **Unlock Receipt Scanner**                     | Makes the receipt scanner available from Development Settings and forces its V2 flow to render. REQUIRES Unlock Developer Settings to be enabled.                                                                                  |                                                                                                                                                                                                                            |

</details>

<details open>
<summary>📦 365 Pay&nbsp;&nbsp;•&nbsp;&nbsp;4 patches&nbsp;&nbsp;<a href="https://patch.p0ntus.com/status"><img src="https://worker.patch.p0ntus.com/badges/tests/com.avinside.svg" alt="Tests Passing" align="absmiddle"></a></summary>
<br>

**🎯 Supported versions:**

| 10.2605.0 | 10.2606.1 |
| :-------: | :-------: |

| 💊&nbsp;Patch                 | 📜&nbsp;Description                                                                                                                                                                       | ⚙️&nbsp;Options                                                                                                                                      |
| ----------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Display Cutout Adaptation** | Dynamically adjusts header height and top padding on devices with camera cutouts or tall status bars so location selectors and action icons clear the camera hole.                        |                                                                                                                                                      |
| **Remove Ads**                | Removes in-app promotional message campaigns and popups (OneSignal In-App Messages), neutralizes in-app review and rating prompts, and zeroes Google Play and Huawei Advertising IDs.     | • Remove In-App Messages<br>• Remove Review Prompts<br>• Zero Advertising ID                                                                         |
| **Remove Tracking**           | Neutralizes diagnostic telemetry, event logging, and user tracking (Firebase Analytics, Crashlytics, Instana APM, Branch Metrics, and OneSignal session and outcome tracking).            | • Disable Firebase Analytics<br>• Disable Firebase Crashlytics<br>• Disable Instana APM<br>• Disable Branch Metrics<br>• Disable OneSignal Telemetry |
| **Unlock Developer Tools**    | Exposes the internal developer and diagnostics screen (Environment Settings) with a single Welcome Screen logo tap, and allows booting directly with Debug Messages or Demo Mode enabled. | • Start with Debug Messages<br>• Start in Demo Mode                                                                                                  |

</details>

<details open>
<summary>📦 Geocaching&nbsp;&nbsp;•&nbsp;&nbsp;9 patches&nbsp;&nbsp;<a href="https://patch.p0ntus.com/status"><img src="https://worker.patch.p0ntus.com/badges/tests/com.groundspeak.geocaching.intro.svg" alt="Tests Passing" align="absmiddle"></a></summary>
<br>

**🎯 Supported versions:**

| 10.24.0 |
| :-----: |

| 💊&nbsp;Patch                                | 📜&nbsp;Description                                                                                                                                                                                                                                                                   | ⚙️&nbsp;Options                                                                                                                                                                                                                                                                                                                                |
| -------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Enable Developer Tools and Feature Flags** | Exposes the internal Debug Menu in Settings and provides selectors for LaunchDarkly feature flags, Remote Config controls, and remaining membership gates.                                                                                                                            | • Expose Debug Menu in Settings<br>• Unlock Trails Map Types<br>• Unlock Newsletter Language Settings<br>• Unlock Hide Cache Premium Controls<br>• Enable Shareables<br>• Enable Collaborative Lists<br>• Enable Lodestones<br>• Enable Edit Log Date<br>• Force Map Tray Enabled<br>• Force Hide Last Log DNF<br>• Force Show Downtime Banner |
| **Local Premium**                            | Enables local Premium membership status across profile and account screens, removes upgrade promotions, banners, icons, and server-dependent profile statistics, and enriches public cache details (description, hints, owner) when server blocks basic accounts.                     | • Show Local Premium Warnings                                                                                                                                                                                                                                                                                                                  |
| **OpenStreetMap Drop-in Replacement**        | Replaces Google Maps with OpenStreetMap (MapLibre vector engine) and adds in-app OpenStreetMap style switching and custom URL configuration to Map settings.                                                                                                                          |                                                                                                                                                                                                                                                                                                                                                |
| **Remove Lists**                             | Removes the Lists option from the bottom navigation bar.                                                                                                                                                                                                                              |                                                                                                                                                                                                                                                                                                                                                |
| **Remove Shop**                              | Removes the Shop Geocaching promotional section and link from the Profile screen.                                                                                                                                                                                                     |                                                                                                                                                                                                                                                                                                                                                |
| **Remove Tracking and Analytics**            | Neutralizes first-party analytics (AnalyticsRepo), Google Analytics / Firebase (Analytics, Crashlytics, Performance, In-App Messaging), Facebook App Events dispatch, Iterable marketing telemetry, Usercentrics consent collection, and zeros the Google Play Advertising ID (AAID). | • Disable Firebase Crashlytics<br>• Disable Facebook Telemetry<br>• Disable Iterable Marketing Telemetry<br>• Disable Usercentrics Consent Telemetry                                                                                                                                                                                           |
| **Unlock Cache Filter and Sorting Tools**    | Unlocks advanced cache search filters and sorting options without prompting for Geocaching Premium.                                                                                                                                                                                   |                                                                                                                                                                                                                                                                                                                                                |
| **Unlock Experimental Features**             | Unlocks beta and experimental features in Settings without Geocaching Premium.                                                                                                                                                                                                        | • Unlock All Beta Projects<br>• Enable Hidden Experimental Toggles<br>• Bypass Experimental Server Sync                                                                                                                                                                                                                                        |
| **Unlock Templates**                         | Unlocks geocache log templates, allowing creating, editing, and applying custom log templates without Geocaching Premium.                                                                                                                                                             |                                                                                                                                                                                                                                                                                                                                                |

</details>

<details open>
<summary>📦 NHL&nbsp;&nbsp;•&nbsp;&nbsp;5 patches&nbsp;&nbsp;<a href="https://patch.p0ntus.com/status"><img src="https://worker.patch.p0ntus.com/badges/tests/com.nhl.gc1112.free.svg" alt="Tests Passing" align="absmiddle"></a></summary>
<br>

**🎯 Supported versions:**

| 17.2.0 |
| :----: |

| 💊&nbsp;Patch                                | 📜&nbsp;Description                                                                                                                                                                                                                                                                                                                                                                                                               | ⚙️&nbsp;Options                                                                                                                                                                                                                                                                                                                                                                            |
| -------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Enable Notifications and Live Activities** | Enables Firebase Cloud Messaging (FCM) push notifications and Live Activities (live game score lockscreen and notification drawer updates) by spoofing the release certificate SHA-1, bypassing Play Services signature checks for MicroG, and activating the live score tracker gate.                                                                                                                                            | • Spoof Certificate SHA-1<br>• Support MicroG & Unverified Play Services<br>• Force Live Activities Enabled                                                                                                                                                                                                                                                                                |
| **Remove Ads**                               | Removes Google Ad Manager banner and native advertisements, disables Blaze story/moment sponsored placements, blocks Google Interactive Media Ads (IMA) video ad requests, and neutralizes Brightcove IMA mid-roll and pre-roll ad playback.                                                                                                                                                                                      | • Remove Promotions Carousel                                                                                                                                                                                                                                                                                                                                                               |
| **Remove Tracking**                          | Removes the OneTrust CMP tracking consent popup, zeros Google Play Advertising ID (AAID), blocks host application analytics, disables Firebase Analytics, AppMeasurement, Firebase Performance Monitoring, Crashlytics, and Sessions telemetry, neutralizes UrbanAirship and Blaze tracking, user activity, and logging, suppresses Brightcove video metrics reporting and backlog processing, and blocks Ticketmaster telemetry. | • Disable OneTrust CMP<br>• Remove Broken Privacy Settings<br>• Zero Advertising ID<br>• Disable Host App Analytics<br>• Disable Firebase Analytics<br>• Disable Firebase Performance Monitoring<br>• Disable UrbanAirship Telemetry<br>• Disable Blaze Tracking & Logging<br>• Disable Brightcove Video Analytics<br>• Disable Ticketmaster Telemetry<br>• Disable Crashlytics & Sessions |
| **Unlock Hidden Features**                   | Unlocks the internal Developer Settings menu, Draft Mini Tracker, and NHL GameZone on the Home surface, with independent options for each feature.                                                                                                                                                                                                                                                                                | • Enable Developer Tools & Settings<br>• Enable Draft Mini Tracker<br>• Show GameZone on Home                                                                                                                                                                                                                                                                                              |
| **Web Ad Blocker**                           | Blocks advertisements, sponsored banners, and analytics tracking in NHL article views and embedded web content using bundled NHL rules and optional downloadable filter list subscriptions (EasyList, EasyPrivacy).                                                                                                                                                                                                               |                                                                                                                                                                                                                                                                                                                                                                                            |

</details>

<details open>
<summary>📦 Adobe Scan&nbsp;&nbsp;•&nbsp;&nbsp;6 patches&nbsp;&nbsp;<a href="https://patch.p0ntus.com/status"><img src="https://worker.patch.p0ntus.com/badges/tests/com.adobe.scan.android.svg" alt="Tests Passing" align="absmiddle"></a></summary>
<br>

**🎯 Supported versions:**

| 26.09.25 |
| :------: |

| 💊&nbsp;Patch                        | 📜&nbsp;Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | ⚙️&nbsp;Options                                                                                                                                                                                         |
| ------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Local Premium**                    | Enables locally executable premium OCR, editing, compression, and password protection tools without cloud or GenAI access.                                                                                                                                                                                                                                                                                                                                                                   | • Local PDF Compression<br>• Local PDF Password Protection<br>• Local PDF Export<br>• Local PDF Combine                                                                                                 |
| **Remove Ads and Tracking**          | Disables Adobe Experience Platform MobileCore, EventHub, Adobe Growth SDK (DGP/MAU and Dunamis), Adobe Journey Optimizer (AJO), Creative SDK, Branch attribution, Facebook App Events and Audience Network, Firebase Performance, Firebase Sessions, and Crashlytics telemetry; suppresses Google Mobile Ads (AdMob), interstitials, banner preloaders, and in-app reviews; removes telemetry preferences; zeroes the Google Play Advertising ID; and blocks hardware android_id collection. | • Disable In-App Ads<br>• Disable Adobe Telemetry & Growth<br>• Disable Firebase Telemetry<br>• Disable Facebook Tracking<br>• Zero Device Identifiers<br>• Disable Review Prompts<br>• Remove Settings |
| **Remove Attribution**               | Names new scans 'Scan on [date]' instead of 'Adobe Scan [date]' and removes the attribution text from shared files.                                                                                                                                                                                                                                                                                                                                                                          | • Remove Scan Name Attribution<br>• Remove Share Attribution Text                                                                                                                                       |
| **Remove Login**                     | Starts Adobe Scan in its existing account-free local workspace and removes account sign-in gates; Adobe cloud features are unavailable.                                                                                                                                                                                                                                                                                                                                                      | • Clean Up Auth Components<br>• Remove Link Sharing<br>• Remove Edit Text<br>• Remove Move<br>• Remove Save as Word Doc                                                                                 |
| **Remove Useless/Promotional Items** | Removes promotional, feedback, and broken cloud items from Settings and file menus.                                                                                                                                                                                                                                                                                                                                                                                                          | • About Adobe Scan<br>• Help<br>• Rate App<br>• Online Support Forum<br>• Share This App<br>• Fill & Sign<br>• Open in Adobe Acrobat<br>• Generative Summary<br>• Edit Text<br>• Move<br>• Compress PDF |
| **Use System Font**                  | Overrides Adobe Clean fonts across XML layouts, dialogs, and Jetpack Compose screens with the device's system font.                                                                                                                                                                                                                                                                                                                                                                          |                                                                                                                                                                                                         |

</details>

<details open>
<summary>📦 Adobe Reader&nbsp;&nbsp;•&nbsp;&nbsp;1 patch&nbsp;&nbsp;<a href="https://patch.p0ntus.com/status"><img src="https://worker.patch.p0ntus.com/badges/tests/com.adobe.reader.svg" alt="Tests Passing" align="absmiddle"></a></summary>
<br>

**🎯 Supported versions:**

| 26.9.2.50367 |
| :----------: |

| 💊&nbsp;Patch               | 📜&nbsp;Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | ⚙️&nbsp;Options                                                                        |
| --------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- |
| **Remove Ads and Tracking** | Disables Adobe MobileCore, EventHub, Document Cloud Analytics (DCMAnalytics and ARDCMAnalytics), Adobe Growth Platform (DGP/MAU), Adobe Journey Optimizer (AJO), Branch deep-link attribution, Creative SDK, Next Best Action (NBA) tools profiling, Facebook App Events, Firebase Performance, Firebase Sessions, and Crashlytics telemetry; suppresses Google Mobile Ads (AdMob), interstitials, rewarded ads, banner pools, paywalls, and in-app reviews; removes telemetry preferences; and zeroes the Google Play Advertising ID. | • Disable Telemetry & Tracking<br>• Disable In-App Ads & Paywalls<br>• Remove Settings |

</details>

<details open>
<summary>📦 Credit Karma&nbsp;&nbsp;•&nbsp;&nbsp;1 patch&nbsp;&nbsp;<a href="https://patch.p0ntus.com/status"><img src="https://worker.patch.p0ntus.com/badges/tests/com.creditkarma.mobile.svg" alt="Tests Passing" align="absmiddle"></a></summary>
<br>

**🎯 Supported versions:**

| 26.47 |
| :---: |

| 💊&nbsp;Patch       | 📜&nbsp;Description                                                                                                                                                                                       | ⚙️&nbsp;Options                                                                                                                                                                                                                                                                                                                                                                       |
| ------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Remove Tracking** | Neutralizes Google Play Advertising ID tracking, Firebase Analytics, Crashlytics, Datadog telemetry, Kochava attribution, New Relic, Segment, Qualtrics, root/emulator checks, and integrity attestation. | • Zero Advertising ID<br>• Disable Firebase Analytics<br>• Disable Crashlytics<br>• Disable Datadog Telemetry<br>• Disable Kochava Tracker<br>• Disable Scribe & Diagnostic Uploads<br>• Disable New Relic Telemetry<br>• Disable Segment Analytics<br>• Disable Qualtrics Feedback Tracking<br>• Neutralize Root & Emulator Detection<br>• Neutralize Integrity & Attestation Checks |

</details>

<details open>
<summary>📦 Pro Metronome&nbsp;&nbsp;•&nbsp;&nbsp;2 patches&nbsp;&nbsp;<a href="https://patch.p0ntus.com/status"><img src="https://worker.patch.p0ntus.com/badges/tests/com.eumlab.android.prometronome.svg" alt="Tests Passing" align="absmiddle"></a></summary>
<br>

**🎯 Supported versions:**

| 1.14 |
| :--: |

| 💊&nbsp;Patch       | 📜&nbsp;Description                                                                                                                                               | ⚙️&nbsp;Options                                                                                                                                             |
| ------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Remove Tracking** | Neutralizes Umeng Analytics, Facebook App Events, Advertising ID harvesting, device fingerprinting, Bolts measurement events, and Google DataTransport telemetry. | • Disable Facebook App Events<br>• Zero Advertising ID<br>• Disable Background Telemetry<br>• Disable Umeng Analytics<br>• Neutralize Device Fingerprinting |
| **Unlock Pro**      | Unlocks all Pro features including polyrhythms, advanced subdivisions, visual beat modes, practice modes, and unlimited presets.                                  |                                                                                                                                                             |

</details>

<details open>
<summary>📦 Navigate360 Student&nbsp;&nbsp;•&nbsp;&nbsp;2 patches&nbsp;&nbsp;<a href="https://patch.p0ntus.com/status"><img src="https://worker.patch.p0ntus.com/badges/tests/com.eab.se.svg" alt="Tests Passing" align="absmiddle"></a></summary>
<br>

**🎯 Supported versions:**

| 26.23.8 |
| :-----: |

| 💊&nbsp;Patch                     | 📜&nbsp;Description                                                                                                                                                  | ⚙️&nbsp;Options |
| --------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------- |
| **Remove Tracking and Telemetry** | Neutralizes Gainsight PX behavioral analytics (session tracking, screen views, custom events, user identification) and disables the Cordova Gainsight native plugin. |                 |
| **Remove Web Telemetry**          | Removes Sentry error/performance reporting, CSP telemetry endpoints, and Gainsight web bootstrap scripts from the embedded Cordova web bundle.                       |                 |

</details>

<!-- PATCHES_END -->

## 🛠️ Building

### Prerequisites

- JDK 21+ (Eclipse Temurin baseline)
- Android SDK (set `sdk.dir` in `local.properties` or export `ANDROID_HOME`)
- Android NDK (matching `REQUIRED_NDK_VERSION = "28.2.13676358"` [r28c] in `patches/build.gradle.kts`; set `ndk.dir` in `local.properties`, export `ANDROID_NDK_HOME`, or install under `$ANDROID_HOME/ndk/`)
- CMake 3.24+ and Ninja
- Rust 1.89+ and a C compiler (CI uses Rust 1.97.1)

### Build Command

```bash
./gradlew buildAndroid
```

The compiled patch bundle will be generated at `patches/build/libs/patches-*.mpp`.

To update `patches-list.json`:

```bash
./gradlew generatePatchesList
```

### Native Build Assets

Gradle's `buildAssetPrep` task builds `tools/asset-prep` for the host reported by
`rustc -vV`, explicitly overriding an inherited Android Cargo target. Font, OCR
and PDFBox preparation keep their generated resource paths and verified Gradle
caches. The host binary lives under `tools/asset-prep/target/<host>/release/`, or
`CARGO_TARGET_DIR/<host>/release/`; relative overrides resolve from the repository
root. Manifests, lockfile, Rust sources and the pinned codec wrapper invalidate the
build task.

The Bun launcher uses the same host-target/bootstrap rules for automation:

```bash
bun scripts/asset-prep.ts --help
bun run --cwd site check:icons
```

Icon discovery remains offline and nonfatal when files are missing. Mutating
`icons --download-missing` / `icons --sync-all` modes contact Play; equal decoded
pixels preserve existing PNG bytes and mtime. No repository build or test path
invokes Python.

The first native codec build downloads SHA-256-pinned libjpeg-turbo 3.1.1;
subsequent builds verify its cached source. ZIP uses Rust Deflate/Bzip2/LZMA
decoders to preserve the legacy AAR reader formats. HTTP is blocking `ureq`
(MIT/Apache-2.0); ZIP is `zip` (MIT). Cargo lockfiles own resolved versions.
Pillow-compatible resampling attribution is in
[`PILLOW-LICENSE.txt`](tools/asset-prep/PILLOW-LICENSE.txt).

### Analysis & Compatibility Testing (`apk-lab`)

Reverse engineering workflows, multi-split artifact inspection, ARM64 assembly, IL2CPP metadata querying, and isolated patch compatibility checks use `tools/apk-lab`:

```bash
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- doctor
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- check path/to/app.apkm --mpp patches/build/libs/patches-1.0.0.mpp --package com.example.app --all
```

See [`docs/apk-lab.md`](docs/apk-lab.md) for complete CLI documentation and workflows.

### Developer Hooks

With Bun installed, `bun run prepare` installs repository-owned pre-commit/pre-push
wrappers. Installation errors are visible; existing custom hooks are never replaced.

```bash
bun scripts/install-hooks.ts --check
# Explicit migration of recognized Python pre-commit wrappers:
bun scripts/install-hooks.ts --migrate-pre-commit
# Manual stage execution:
bun scripts/hooks.ts pre-commit
bun scripts/hooks.ts pre-push
```

Shared/external hooks directories require `--allow-external-hooks-path`.
An active `.legacy` hook additionally requires `--accept-legacy-loss`; keep it if its
behavior is still needed. Inspect conflicts before opting in. `/dev/null` hooks
configuration remains deliberately disabled.

Hooks inspect Git blobs, not unrelated unstaged edits, and run all audit stages in
isolated snapshots. Pre-commit runs format/lint; pre-push runs typecheck/tests.
Whitespace/EOF hygiene is check-only: fix reported files and stage the intended
changes yourself. No hook rewrites or stages your files.
Frozen renderer fixtures retain their original whitespace/EOF bytes and are excluded
from those two hygiene checks, formatting, and documentation lint/link discovery.

## 📲 Applying Patches

Using [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop):

```bash
java -jar morphe-desktop.jar patch \
  --patches patches/build/libs/patches-1.0.0.mpp \
  --out sezzle-patched.apk \
  base.apk
```

## 📊 Statistics

![Total Downloads](https://worker.patch.p0ntus.com/charts/total-downloads.svg)
![Release Downloads](https://worker.patch.p0ntus.com/charts/release-downloads.svg)

## 📜 License

Licensed under the [WTFPL](LICENSE) with warranty addendum.
