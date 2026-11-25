# 👋🧩 Mben Morphe Patches

Personal Morphe patch bundle.

## ❓ About

Patches for apps I like — unlocking paid features, stripping ads and telemetry,
and adding a few things the stock apps don't do (local backup, local device sync,
an in-app QR scanner).

## 📱 Supported apps

| App | Package | Verified version | File type |
| --- | --- | --- | --- |
| AliExpress | `com.alibaba.aliexpresshd` | 8.162.8 | APKM (split bundle) |
| DeviceInfo | `com.ytheekshana.deviceinfo` | 3.4.4.0 | APK |
| Google Contacts | `com.google.android.contacts` | 4.90.16.998876676 | APK |
| Infinity for Reddit+ | `ml.docilealligator.infinityforreddit.plus` | 8.3.4 | APK |
| Infinity for Reddit (Patreon) | `ml.docilealligator.infinityforreddit.patreon` | 8.3.4 | APK |
| Masareef | `com.appsqueue.masareef` | 2.5.2 | APK |
| MT Capsule | `com.pryshedko.mtisland` | 17.3 (minSdk 32) | APK |
| Salaat First | `org.hicham.salaat` | 6.4.1 | APK |
| SigStick | `com.sigstick.myapp` | 5.25.0 | APK |
| Speedtest by Ookla | `org.zwanoo.android.speedtest` | 7.1.2, 7.1.1 | APK |
| StayFree | `com.burockgames.timeclocker` | 20.20.0 | XAPK |
| Windy | `com.windyty.android` | 51.3.2, 51.2.1, 51.0.1 | APK |

Any app not listed above is **not** supported by this bundle.

A few targets need the right APK:

- **StayFree:** give Morphe Manager the original `.xapk` and let it merge the
  splits. Don't pick a pre-merged APK: the Manager keeps the file you pick as the
  saved original and reuses it on every repatch. If you already patched from a
  merged APK, delete StayFree's saved original in the Manager's APK settings, then
  pick the `.xapk`.
- **AliExpress** and **StayFree** ship as Play split bundles. Patch the *merged
  universal* APK, never the bare base — StayFree's base alone fails to install on
  Android 14+ with `INSTALL_FAILED_NO_MATCHING_ABIS`. Merge with
  [APKEditor](https://github.com/REAndroid/APKEditor) (`java -jar APKEditor.jar m -i
  app.xapk -o merged.apk`), and make sure the **density** split is included, not only
  the ABI one: 149 of StayFree's drawables live only in `config.xxhdpi`, and a merge
  that drops them installs fine but then crashes with
  `Resources$NotFoundException: Resource ID #0x7f080237` as soon as a screen needs one.
  Online converters are the usual cause. Some mergers also drop `META-INF/services`,
  which crashes StayFree on launch with `Module with the Main dispatcher is missing`;
  every StayFree patch now restores those files automatically.
- **Salaat First** is often passed around as a merged APK that has lost its
  `META-INF/services` files. Without them the online city search (the only one that
  understands Arabic) and the official Moroccan timetable silently fail.
  `Neutralize Signature Check` restores those files, so a merged APK is fine.
- **MT Capsule** accepts versions newer than 17.3 as **experimental** targets. The
  patches are fingerprint based, so they may or may not resolve against a build they
  were not verified on; if one fails to apply, downgrade to 17.3.
- **Infinity for Reddit** is not pinned to a version at all — every anchor resolves
  from a stable literal rather than the version name — but only 8.3.4 is verified.

### Notable patches

The full, always-current list is [further down](#-patches-list) and is generated on
every release. Highlights:

| Patch | App | What it does |
| --- | --- | --- |
| Unlock Pro | MT Capsule | Unlocks all pro features without a purchase. |
| Unlock all premium features | StayFree | Every theme and custom app icon, without levels, pairing or sign-up. |
| Unlock Premium | Windy | Premium UI and features client-side (server-side data still needs a real subscription). |
| Unlock Premium | SigStick | Premium client-side: no ads, 60 stickers per pack, unlimited packs. Server-enforced limits may still apply. Enabled by default. |
| Remove Google Login | SigStick | Removes "Sign in with Google" everywhere; the app keeps its anonymous account. Disabled by default. |
| Remove Settings Links / Disable Send Logs to Developer | SigStick | Drop Follow Us, Email Us, Terms of Service, Privacy Policy and Send Logs from Settings; the log export and in-memory log buffer are stubbed too. Enabled by default. |
| Unlock Ad-Free | Speedtest | Removes ads and unlocks ad-free status. |
| Spoof client (Infinity) | Infinity for Reddit | Swaps in your own Reddit OAuth credentials so the app keeps working. Needs a client ID. |
| Modify login WebView (Infinity) | Infinity for Reddit | Gives Reddit's login page a Chrome user agent and JavaScript so in-app login stops failing (port of Patcheddit's). Enabled by default. |
| Local data backup | StayFree | Export/restore usage history, limits and settings to a local zip — no Google account. |
| Local device sync | StayFree | Pairs with the browser extension over your LAN, so nothing goes to StayFree/SensorTower. |
| In-app QR scanner | StayFree | Scans the extension's pairing QR inside the app, via ZXing (no Play Services). |
| AMOLED dark mode | AliExpress, Masareef, DeviceInfo, Google Contacts, SigStick | Pure-black backgrounds; on AliExpress it also unblacklists Xiaomi devices, on DeviceInfo and Google Contacts it covers both the default palette and "Use system colors". |
| Remove Donate Screen | DeviceInfo | Removes every entry into the Donate screen (Settings, overflow menu, About) and closes it if anything still opens it. |
| Bypass License Check | Masareef | Stubs the pairip signature/license check that otherwise rejects the re-signed APK. No-op on the verified 2.5.2 target (pairip was added in 2.6.1); kept for later pairip builds. |
| Neutralize Signature Check | Salaat First | Stubs the anti-tamper check that `System.exit(0)`s a re-signed build, and restores the `META-INF/services` files that merge tools strip. Required by every other Salaat patch. Enabled by default. |
| Fix Location Detection on microG | Salaat First | Asks for a quick high-accuracy fix so "locating" no longer hangs for 10 minutes on microG devices. Enabled by default. |
| Add microG support | Google Contacts | Signs in to your Google account through microG instead of Play services, so contacts sync, Phenotype and push work on a de-Googled phone. Enabled by default; needs microG installed, and cannot be used with a root (mount) install. |
| Change package name | All apps | Installs the patched app under a package name you choose (Clone app without the `.morphe` default). Disabled by default. |
| Disable All Telemetry | 7 apps | One switch per app that pulls in that app's full analytics/tracking removal. |

Most telemetry and ad-removal patches ship **disabled by default** — enable the ones
you want in Morphe Manager. Every DeviceInfo patch (including `AMOLED Dark Theme`,
`Hide Privacy Policy Link`, `Hide Remove Ads Button` and `Remove Donate Screen`) is
disabled by default, as is Google Contacts' `AMOLED Dark Theme` (its `Add microG
support` stays enabled). SigStick's `Unlock Premium`, `Disable All Telemetry`,
`Remove Settings Links` and `Disable Send Logs to Developer` are enabled by default;
its `AMOLED Dark Theme` and `Remove Google Login` are disabled.

### ⚠️ Patches that need setup

- **Spoof client (Infinity)** requires an OAuth **client ID** from
  [reddit.com/prefs/apps](https://www.reddit.com/prefs/apps) (create an *installed
  app*). Without it the patch fails rather than shipping stock credentials. The
  **redirect URI** defaults to `redreader://rr_oauth_redir` and the **user agent** to
  `org.quantumbadger.redreader/1.25.1`; the redirect URI must match what you entered on
  Reddit *exactly* or login fails at the callback, so change it there or here until the
  two agree. Blank the user agent to keep the app's own. Both Infinity patches here
  replace Patcheddit's (`Spoof client` and `Modify login WebView`), so leave the
  Patcheddit bundle unselected for Infinity: selecting both makes its patches rewrite
  the same literals and `loadUrl` calls first.
- **Local device sync** (StayFree) needs the patched browser extension on the other
  end; the app serves sync on port `8787`.
- **Add microG support** (Google Contacts) needs **microG** already installed —
  [MicroG-RE](https://github.com/WSTxda/MicroG-RE) or ReVanced GmsCore — and an account
  added inside it. It is **unavailable for root (mount) installs**: a mount install keeps
  stock Contacts' manifest, so microG never learns which app to vouch for. The patch
  spoofs Contacts' rotated signing certificate (`e4cf6254…`, the one Android 13+ reports);
  on an older device the platform uses the original `ee3e2b5d…` key instead and sign-in
  will not be granted.

- **Change package name** (all apps) requires the **package name** to install as
  (`com.example.app` form); it has no default and fails at apply time without one. The
  app then installs as a separate app beside any copy under the original name. Its
  custom permissions and provider authorities are renamed too (both toggles default on).

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=mben25/morphe-patches

## 🩹 Patches list

> Generated by semantic-release on every release — never edit this block by hand.

<!-- PATCHES_START EXPANDED -->
> **[v1.20.0](https://github.com/mben25/morphe-patches/releases/tag/v1.20.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;88 patches total
<details open>
<summary>📦 DeviceInfo&nbsp;&nbsp;•&nbsp;&nbsp;11 patches</summary>
<br>

**🎯 Supported versions:**

| 3.4.4.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [AMOLED Dark Theme](#amoled-dark-theme) | Makes the dark theme pure black for every theme color and for "Use system colors": window, cards and lists become #000000, while dialogs and menus stay near-black so they remain visible. |  |
| [Disable All Telemetry](#disable-all-telemetry) | Disables all analytics and telemetry: Firebase Analytics, Crashlytics, Sessions, Installations and Transport auto-registration, and the AdServices / Advertising ID attribution surface. |  |
| [Hide Privacy Policy Link](#hide-privacy-policy-link) | Removes the "Privacy Policy" link from the About section of the Settings screen. |  |
| [Hide Remove Ads Button](#hide-remove-ads-button) | Removes the "Remove Ads" entry from the main overflow menu and the "Remove Ads" / "Donate" button from the About screen. |  |
| [Hide Support Us Section](#hide-support-us-section) | Removes the "Support Us" preference category (Rate Us, Donate / Remove Ads) from the Settings screen. |  |
| [Remove AdServices Attribution](#remove-adservices-attribution) | Removes the ACCESS_ADSERVICES_ATTRIBUTION / ACCESS_ADSERVICES_AD_ID permissions and the android.ext.adservices uses-library entry, so the Privacy Sandbox AdServices APIs are never touched. |  |
| [Remove Advertising ID](#remove-advertising-id) | Removes the Google Play Services Advertising ID permission. |  |
| [Remove All Ads](#remove-all-ads) | Turns on the app's own ad-free flag so no native or interstitial ad is ever requested or shown on any screen (dashboard, Wi-Fi/app analyzer, sensors, battery, memory, tools, or automatic tests), which also hides the "Remove ads" promo cards, and removes the Facebook Audience Network mediation SDK's auto-initializing ContentProvider so it never starts. |  |
| [Remove Donate Screen](#remove-donate-screen) | Removes every way into the Donate screen (Settings "Donate (Remove Ads)", the overflow-menu and About-screen "Remove Ads" buttons) and makes the screen close itself immediately if anything still opens it. |  |
| [Remove Facebook Audience Network Initialization](#remove-facebook-audience-network-initialization) | Removes the manifest-declared ContentProvider that auto-initializes the Facebook Audience Network mediation SDK on every app start. |  |
| [Remove Firebase Component Discovery](#remove-firebase-component-discovery) | Removes the Firebase ComponentDiscoveryService, which is how Analytics, Crashlytics, Sessions, Installations, and Transport auto-register themselves on startup. |  |

</details>

<details open>
<summary>📦 Google Contacts&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 4.90.16.998876676 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [AMOLED Dark Theme](#amoled-dark-theme) | Makes the dark theme pure black: the window, contact lists and cards become #000000, while dialogs and menus stay near-black so they remain visible. Applies to both the default palette and "Use system colors". Turn on dark mode to see it. |  |
| [Add microG support](#add-microg-support) | Lets Google Contacts sign in to your Google account through microG instead of Play services, so contacts sync, Phenotype and push work on a de-Googled phone. Every Play services name the app uses is pointed at microG's, and microG is told to vouch for stock Contacts. Needs microG installed: MicroG-RE or ReVanced GmsCore. Not for root (mount) installs. |  |

</details>

<details open>
<summary>📦 Masareef&nbsp;&nbsp;•&nbsp;&nbsp;14 patches</summary>
<br>

**🎯 Supported versions:**

| 2.5.2 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [AMOLED Dark Theme](#amoled-dark-theme) | Flattens dark theme backgrounds (window, cards, dialogs, toolbar, navigation bar, search, calendar) to pure black instead of the stock dark-gray shades. |  |
| [Bypass License Check](#bypass-license-check) | Stubs the Google Play Automatic Integrity Protection (pairip) signature and license checks, which otherwise detect the re-signed APK on launch and send the user to the app's Play Store page instead of opening the app. |  |
| [Deactivate Firebase Analytics](#deactivate-firebase-analytics) | Deactivates Firebase Analytics and removes its associated broadcast receivers and services. |  |
| [Deactivate Firebase Crashlytics](#deactivate-firebase-crashlytics) | Deactivates Firebase Crashlytics crash reporting and removes associated services. |  |
| [Deactivate Firebase Performance Monitoring](#deactivate-firebase-performance-monitoring) | Deactivates the collection of performance data on app startup time, network requests, and other related metrics. |  |
| [Disable All Telemetry](#disable-all-telemetry) | Disables all analytics and telemetry including Firebase, Google Analytics, Facebook, and Google Ads tracking. This is a comprehensive privacy patch that removes all data collection. |  |
| [Disable Facebook Ads Tracking](#disable-facebook-ads-tracking) | Disables Facebook Audience Network ad tracking and telemetry. |  |
| [Disable Facebook Analytics](#disable-facebook-analytics) | Disables Facebook App Events tracking and analytics. |  |
| [Disable Firebase Messaging Analytics](#disable-firebase-messaging-analytics) | Disables Firebase Cloud Messaging analytics and notification tracking. |  |
| [Disable Firebase Sessions](#disable-firebase-sessions) | Disables Firebase Sessions tracking and telemetry. |  |
| [Disable Google Ads Tracking](#disable-google-ads-tracking) | Disables Google AdMob tracking and impression reporting. |  |
| [Fill Adaptive Icon](#fill-adaptive-icon) | Scales the launcher adaptive icon foreground to fill the whole icon shape, removing the empty padding around it. |  |
| [Remove Ads](#remove-ads) | Stubs out AdsManager so no banner/native ads or consent dialogs are ever loaded, requested, or shown, and the Mobile Ads SDK is never initialized. |  |
| [Unlock Pro (Masareef)](#unlock-pro-masareef) | Makes UserDataManager.isSubscribed() always return true, unlocking all Pro features. |  |

</details>

<details open>
<summary>📦 SigStick&nbsp;&nbsp;•&nbsp;&nbsp;6 patches</summary>
<br>

**🎯 Supported versions:**

| 5.25.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [AMOLED Dark Theme](#amoled-dark-theme) | Makes the dark theme pure black: background, cards and surfaces become #000000 instead of the stock #111111 / #222222 grays. |  |
| [Disable All Telemetry](#disable-all-telemetry) | Blocks Firebase / Google Analytics events, Crashlytics, Sessions, In-App Messaging and FCM delivery metrics, and removes the Advertising ID and AdServices attribution permissions. Sign-in, Remote Config and push keep working. |  |
| [Disable Send Logs to Developer](#disable-send-logs-to-developer) | Removes "Send Logs to Developer" from Settings, stops the app from collecting its in-memory log buffer, and makes the log export a no-op. |  |
| [Remove Google Login](#remove-google-login) | Removes the "Sign in with Google" button everywhere it appears. The app keeps working with its anonymous account; anything that needs a Google account (publishing under your name, synced collections) is no longer reachable. |  |
| [Remove Settings Links](#remove-settings-links) | Removes Follow Us, Email Us, Terms of Service and Privacy Policy from Settings. Community and Version stay. |  |
| [Unlock Premium](#unlock-premium) | Unlocks SigStick Premium client-side: no ads, 60 stickers per pack, unlimited pack creation and the premium editor features. |  |

</details>

<details open>
<summary>📦 AliExpress&nbsp;&nbsp;•&nbsp;&nbsp;10 patches</summary>
<br>

**🎯 Supported versions:**

| 8.162.8 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [AMOLED dark mode](#amoled-dark-mode) | Unlocks AliExpress' built-in dark mode on every device (Redmi/Xiaomi/POCO are blacklisted by the app), turns it on by default so the app follows the system theme (it can still be switched off in Settings > Dark mode), and makes dark backgrounds pure black. |  |
| [Disable analytics](#disable-analytics) | Stops the Alibaba UT analytics SDK from attaching global properties and your account identity (nick, user id, open id) to tracked events. |  |
| [Disable forced updates](#disable-forced-updates) | Stops the automatic "new version available" and forced update dialogs. |  |
| [Disable promotions notifications](#disable-promotions-notifications) | Drops promotional push notifications (deals, campaigns, wishlist price drops, trends). Order status and message notifications still come through. |  |
| [Disable splash screen](#disable-splash-screen) | Skips the full-screen splash advertisement shown on app launch. |  |
| [Enable image saving](#enable-image-saving) | Always shows the Save button in the full-screen product and review image viewer. |  |
| [Remove ads](#remove-ads) | Blocks the marketing pop-up layers (campaign interstitials, coupon and gift overlays) shown over the home page, product pages and search. |  |
| [Remove affiliate tracking](#remove-affiliate-tracking) | Disables the Firebase Analytics events AliExpress logs for attribution and affiliate/marketing tracking. |  |
| [Remove coupons popup](#remove-coupons-popup) | Hides the coupon floor/popup shown over search results. |  |
| [Remove sponsored items from search](#remove-sponsored-items-from-search) | Removes sponsored (AD) products from search results. |  |

</details>

<details open>
<summary>📦 StayFree&nbsp;&nbsp;•&nbsp;&nbsp;20 patches</summary>
<br>

**🎯 Supported versions:**

| 20.20.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Assume device is online](#assume-device-is-online) | Fixes "Something went wrong, please try again…" when pairing with the browser extension. StayFree gates all sync behind a precheck that must reach Google and that also refuses to sync while usage-data collection is opted out; local pairing is served from the phone itself and needs neither, so report the device as free to sync. |  |
| [Debug QR pairing path](#debug-qr-pairing-path) | Diagnostic only. Records why StayFree's QR pairing does or does not issue its pairing request — the two guards on the scanned code, and the device-group status the pairing coroutine checks before it reaches the network — to the same log as "Local device sync". Leave this off unless you are debugging a pairing failure. |  |
| [Disable All Telemetry](#disable-all-telemetry) | Removes and blocks all telemetry and analytics: SensorTower usage-data upload (app/web usage, browsing, shopping, AI prompts), Amplitude, Singular, Bugsnag, Firebase Analytics/Crashlytics/Performance/Sessions, Google App Measurement, Facebook app events and the advertising ID. Telemetry endpoints are also rewritten to localhost. |  |
| [Fix MIUI permission check crash](#fix-miui-permission-check-crash) | Stops the Xiaomi/Redmi/Poco "background pop-up" permission check from crashing on AOSP-based ROMs ("Bad operation #10021"), which otherwise aborts device pairing with "Something went wrong". |  |
| [Hide Google sign-in in Paired Devices](#hide-google-sign-in-in-paired-devices) | Hides the "Sign in with Google" button from the Paired Devices section in settings. Pairing with a code still works. |  |
| [Hide texts](#hide-texts) | Hides the instruction text on the "Pair with code" screen: "Select the app you want to pair your Android app with:". |  |
| [In-app QR scanner](#in-app-qr-scanner) | Scans the browser extension's pairing QR code inside StayFree, like Brave's built-in scanner, instead of asking you to open the camera app (whose link can't open a patched app). Opens on its own when you choose to pair with a browser extension or the desktop app, and from a "Scan QR code" shortcut on the app icon. Uses ZXing, so it works without Google Play Services. |  |
| [Local data backup](#local-data-backup) | Replaces the Google Drive "Usage Data Backup" in Settings > Storage with a local backup: export your usage history, limits and settings to a zip file you pick, and restore them from one. Needs no Google account and no longer asks you to opt in to data collection. |  |
| [Local device sync](#local-device-sync) | Pairs the phone with the StayFree browser extension over your local network without data collection. The app runs a small sync server on port 8787 and serves its usage straight from Android, so nothing goes to StayFree/SensorTower. Removes the "Anonymous data collection must be enabled to pair devices" prompt. Needs the patched browser extension. |  |
| [Refresh paired devices list](#refresh-paired-devices-list) | Fixes Settings > Paired Devices staying empty after a device pairs successfully. StayFree reloads the device list and announces it on a flow that nothing observes, while the screen waits on a flow that nothing ever updates, so it never recomposes. Announce the reload on the flow the screen actually watches. |  |
| [Remove App Info contents](#remove-app-info-contents) | Keeps the "App Info" row with the version number in Settings, but it no longer opens the App Info screen: Debug Usage Limit Problems, Data Privacy, StayFree Community, Support us, Credits & Open source libraries and the support App ID are gone. They are also removed from the settings search. |  |
| [Remove Follow us](#remove-follow-us) | Removes the "• Follow us!" link next to "StayFree" at the top of the side menu. Tapping the header no longer opens StayFree's social media page. |  |
| [Remove Get Help](#remove-get-help) | Removes the "Get Help" row (HelpScout support chat) from Settings and from the settings search. |  |
| [Remove Google login request](#remove-google-login-request) | Removes the "Sign in with Google" page from onboarding and the "Create StayFree profile" step from the home setup checklist. Signing in manually from the drawer/pairing screens still works. |  |
| [Remove Inbox Control](#remove-inbox-control) | Removes the Inbox Control (Gmail cleaner) feature: its drawer entry, its permissions section and every screen that opens it. The Neon theme and custom app icons that were locked behind signing up for it are unlocked, and the Gmail sign-in no longer keeps the permission setup reminder on the home screen. |  |
| [Remove My Friends](#remove-my-friends) | Removes "My Friends" (usage sharing with friends through StayFree's servers) from the side menu and from the settings search. |  |
| [Remove data collection opt-out](#remove-data-collection-opt-out) | Removes the "Opt-Out of Data Collection" switch from Settings > Data Privacy and locks data collection off: the opt-out can no longer be undone (the "Opt-In" buttons do nothing) and the opt-out status is never reported to StayFree. Includes "Disable All Telemetry". |  |
| [Remove drawer sign-in](#remove-drawer-sign-in) | Removes the "Sign into StayFree" account row from the bottom of the side menu. |  |
| [Remove pair devices banner](#remove-pair-devices-banner) | Removes the "Tap to pair your devices for the best StayFree experience!" banner from the dashboard and the "Cross Platform is here" sheet it opens (Google login on each device, "Share Download Links"). |  |
| [Unlock all premium features](#unlock-all-premium-features) | Unlocks every theme (gamification-level, Black and Neon themes) and all custom app icons without earning levels, pairing a device or signing up for Inbox Control. |  |

</details>

<details open>
<summary>📦 Salaat First&nbsp;&nbsp;•&nbsp;&nbsp;7 patches</summary>
<br>

**🎯 Supported versions:**

| 6.4.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Deactivate Firebase Telemetry](#deactivate-firebase-telemetry) | Disables Firebase/Google Analytics collection, Crashlytics crash reporting and session tracking via manifest flags, strips the App Measurement services and receiver, and removes the advertising-ID permission. App functionality (prayer times, push notifications) is unaffected. |  |
| [Disable All Telemetry](#disable-all-telemetry) | Comprehensive privacy patch: disables the OpenSignal and CellRebel data-collection SDKs and deactivates Firebase/Google Analytics, Crashlytics and session tracking. Does not affect app functionality. |  |
| [Disable App Rating Prompt](#disable-app-rating-prompt) | Removes the Play In-App Review ("rate this app") prompt launched from MainActivity.onCreate, so the review dialog is never requested. |  |
| [Disable Partner Data-Collection SDKs](#disable-partner-data-collection-sdks) | Disables the bundled OpenSignal and CellRebel network-measurement SDKs, which collect location, cell and network telemetry in the background. Forces each wrapper's eligibility check to return false so the SDKs never initialize. Also strips their background components from the manifest. |  |
| [Fix Location Detection on microG](#fix-location-detection-on-microg) | Makes the one-shot current-location request ask for a high-accuracy fix within seconds instead of the hourly balanced-power default. On microG the default never returns a fix, so the setup wizard and "use my location" stay stuck on "locating". No effect on how often the app refreshes location in the background. |  |
| [Ignore Remote-Config Overrides](#ignore-remote-config-overrides) | Severs the Flagsmith remote-override channel by forcing the remote-config delegate to always resolve to the Firebase provider (which uses the app's bundled defaults). Server-side flags can no longer be flipped on against a patched build. Config reads keep working normally. |  |
| [Neutralize Signature Check](#neutralize-signature-check) | Stubs the hidden anti-tamper check in LanguageCheckerKt that MD5-fingerprints the signing certificate and calls System.exit(0) when it does not match the bundled signature. A re-signed (patched) APK always mismatches, so without this the app kills itself on launch and no other patch can run. Also restores the META-INF/services files that APK merge tools strip, without which city search and official timetables fail. Required dependency of every other Salaat patch. |  |

</details>

<details open>
<summary>📦 MT Capsule&nbsp;&nbsp;•&nbsp;&nbsp;6 patches</summary>
<br>

**🎯 Supported versions:**

| 17.3 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable All Telemetry](#disable-all-telemetry) | Disables all analytics and telemetry: Firebase Analytics, Installations and Transport auto-registration, the Google Measurement and DataTransport upload services, and the AdServices / Advertising ID attribution surface. |  |
| [Remove AdServices Attribution](#remove-adservices-attribution) | Removes the ACCESS_ADSERVICES_ATTRIBUTION / ACCESS_ADSERVICES_AD_ID permissions and the android.ext.adservices uses-library entry, so the Privacy Sandbox AdServices APIs are never touched. |  |
| [Remove Advertising ID](#remove-advertising-id) | Removes the Google Play Services Advertising ID permission. |  |
| [Remove Analytics Services](#remove-analytics-services) | Removes the Google Measurement and DataTransport services and receivers that upload analytics events, so no scheduled job or alarm can wake the app to send telemetry. |  |
| [Remove Firebase Component Discovery](#remove-firebase-component-discovery) | Removes the Firebase ComponentDiscoveryService and FirebaseInitProvider, which is how Analytics and Installations auto-register themselves on startup. |  |
| [Unlock Pro](#unlock-pro) | Unlocks all pro features without a purchase. |  |

</details>

<details open>
<summary>📦 Speedtest&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 7.1.2 | 7.1.1 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable All Telemetry](#disable-all-telemetry) | Comprehensive privacy patch: silences the Ookla DevMetrics dispatcher so no event reaches Firebase Analytics, Crashlytics or Logcat. Does not affect speed-test functionality. |  |
| [Disable Logging (Analytics)](#disable-logging-analytics) | Stops Speedtest by Ookla's DevMetrics dispatcher (com.ookla.tools.logging) from forwarding info/watch/alarm events to Firebase Analytics, Crashlytics and Logcat. |  |
| [Unlock Ad-Free](#unlock-ad-free) | Removes ads and unlocks ad-free status in Speedtest by Ookla. |  |

</details>

<details open>
<summary>📦 Infinity for Reddit+&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Modify login WebView (Infinity)](#modify-login-webview-infinity) | Modifies the WebView used for logging into Reddit to prevent login issues. |  |
| [Spoof client (Infinity)](#spoof-client-infinity) | Replaces the bundled Reddit OAuth credentials with your own, so the app keeps working after Reddit's API changes. Requires a client ID from https://www.reddit.com/prefs/apps (create an 'installed app'). | • OAuth client ID<br>• Redirect URI<br>• User agent |

</details>

<details open>
<summary>📦 Infinity for Reddit (Patreon)&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Modify login WebView (Infinity)](#modify-login-webview-infinity) | Modifies the WebView used for logging into Reddit to prevent login issues. |  |
| [Spoof client (Infinity)](#spoof-client-infinity) | Replaces the bundled Reddit OAuth credentials with your own, so the app keeps working after Reddit's API changes. Requires a client ID from https://www.reddit.com/prefs/apps (create an 'installed app'). | • OAuth client ID<br>• Redirect URI<br>• User agent |

</details>

<details open>
<summary>📦 Windy&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 51.3.2 | 51.2.1 | 51.0.1 |
| :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium](#unlock-premium) | Unlocks Windy Premium UI and features client-side by patching the JS bundle (store default 'premium', hasAny()=true, clearTier() neutralised, subs-premium body class) and forces the widgets' native premium check to true. Server-side premium data still requires a real subscription. Note: the map needs WebGL — it stays gray on WebViews that block WebGL (e.g. Cromite SystemWebView). |  |

</details>

<details open>
<summary>🌐 Universal&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Change package name](#change-package-name) | Installs the patched app under the package name you specify instead of the original one. Not every app works under a new package name; some may crash or lose features that check their own package. | • Package name<br>• Update permissions<br>• Update providers |
| [Force hasSystemFeature true (narrow)](#force-hassystemfeature-true-narrow) | Return true from public static boolean methods calling PackageManager.hasSystemFeature with a String arg. Narrow-scoped to avoid lifecycle callbacks. |  |
| [Spoof Pixel model check (narrow)](#spoof-pixel-model-check-narrow) | In-APK utility methods checking Pixel model return true. Narrow-scoped to avoid lifecycle callbacks. |  |
| [Strip root detection (narrow)](#strip-root-detection-narrow) | Force public static boolean methods referencing "Magisk" to return false. Narrow-scoped. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

To verify a patch actually resolves against a real APK (there is no test suite —
this *is* the test):

```bash
./gradlew :patches:applyToApk --args "<path-to.apk> [outputDexDir] [--patches=<app>]"
```

Gradle pulls the patcher from GitHub Packages, so a GitHub PAT is required: set
`gpr.user` / `gpr.key` in `~/.gradle/gradle.properties`, or `GITHUB_ACTOR` /
`GITHUB_TOKEN` in the environment.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

Mben Morphe Patches are licensed under the [GNU General Public License v3.0](LICENSE)
