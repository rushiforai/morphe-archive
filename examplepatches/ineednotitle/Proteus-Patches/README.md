# Proteus Patches

> *One bundle, patches everywhere. A curated [Morphe](https://github.com/MorpheApp/Morphe) patch suite for Android.*

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](#license)
[![Patches](https://img.shields.io/badge/patches-157-blue.svg)](#whats-inside)
[![Universal patches](https://img.shields.io/badge/universal-24-purple.svg)](#universal-patches)
[![Apps](https://img.shields.io/badge/apps-23-orange.svg)](#supported-apps)

**Proteus Patches** is a Morphe patch bundle (`.mpp`) that removes tracking,
ads, annoyances and risky defaults from popular Android apps — plus a set of
**universal patches** that apply to any app.

- **v2.2.2** — curated release: **157 patches**, **24 universal**, across **28 app packages** (23 apps)
- Built and verified with the Morphe Manager v2.3.0 patcher (`patches-list.json` regenerated, zip integrity checked)

[![Add to Morphe](https://img.shields.io/badge/Add_to-Morphe-1f6feb?style=for-the-badge)](https://morphe.software/add-source?github=ineednotitle/Proteus-Patches)

> Tapping **Add to Morphe** on a device with
> [Morphe Manager](https://github.com/MorpheApp/Morphe) installed adds this repo
> as a patch source automatically.

Patch source URL (to add manually in Morphe Manager → Sources):

```text
https://github.com/ineednotitle/Proteus-Patches
```

---

## 📦 Install

1. Install **[Morphe Manager](https://github.com/MorpheApp/Morphe)**.
2. Easiest: tap the **Add to Morphe** button above, or add
   `https://github.com/ineednotitle/Proteus-Patches` as a patch source.
3. Or download the latest bundle from **[Releases](https://github.com/ineednotitle/Proteus-Patches/releases)**
   (`patches-2.2.2.mpp`) and use **Settings → Patches → Import patches** in the Manager.
4. Pick the apps you patch, choose your patches, and patch.

> ⚠️ v2.0.0 is a **breaking, curated** release — patches for apps outside the
> list below were removed from this bundle. Use `patches-1.19.0.mpp` (or earlier)
> if you need the full app set.

<!-- PATCHES_START EXPANDED -->
> **[v2.2.2](https://github.com/ineednotitle/Proteus-Patches/releases/tag/v2.2.2)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;157 patches total
<details open>
<summary>📦 Google Photos&nbsp;&nbsp;•&nbsp;&nbsp;7 patches</summary>
<br>

**🎯 Supported versions:**

| 7.97.0.997578476 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [AMOLED dark theme](#amoled-dark-theme) | Makes Google Photos dark surfaces true black. |  |
| [Change package name](#change-package-name) | Installs Google Photos beside the system Photos app by changing package, permissions, providers, and app name. | • Package name<br>• App name |
| [Custom branding](#custom-branding) | Adds an option to replace the Google Photos launcher icon. | • Custom icon |
| [Enable DCIM folders backup control](#enable-dcim-folders-backup-control) | Allows controlling Camera and other DCIM folder backup individually. |  |
| [Fix DCIM folder classification](#fix-dcim-folder-classification) | Prevents non-Camera DCIM folders from being grouped as Camera. |  |
| [GmsCore support](#gmscore-support) | Adds MicroG/GmsCore support metadata for Google Photos. |  |
| [Spoof features](#spoof-features) | Spoofs selectable Pixel Photos build and feature flags. | • Pixel profile<br>• Android version<br>• Override ROM feature levels |

</details>

<details open>
<summary>📦 Pinterest&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 14.41.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Ad-free feed (remove promoted Pins)](#ad-free-feed-remove-promoted-pins) | Removes promoted/sponsored Pins from every feed, search result, and board list during deserialization, so they never render. Organic pinning, boards and saving are unaffected. |  |
| [Block analytics and data collection](#block-analytics-and-data-collection) | No-ops Firebase screen/event tracking and AppsFlyer attribution + event logging (concrete SDK entry points, verified in 14.41.0). Push notifications keep working; Pinterest features are untouched. |  |
| [Enable media downloads](#enable-media-downloads) | Forces the pin-level download eligibility flag so the Download action is available on every Pin (images and videos). |  |

</details>

<details open>
<summary>📦 Mereframe&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**🎯 Supported versions:**

| 0.8.4 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Allow re-signed/sideloaded installs](#allow-re-signed-sideloaded-installs) | Neutralizes Mereframe's install-integrity checks so patched (re-signed) builds start normally instead of showing the installation-refused screen. Required for any other patch here to be usable. |  |
| [Bypass native integrity checks](#bypass-native-integrity-checks) | libunnamed_raw.so JNI-throws 'app integrity check failed' on re-signed builds, killing camera session start (preview) - observed via diagnostic crash log. This patch catches the throw at the session-opening wrapper and substitutes a valid session result. Required together with 'Allow re-signed/sideloaded installs'. |  |
| [Diagnostic crash log](#diagnostic-crash-log) | DIAGNOSTIC ONLY - writes the full stack trace to Downloads/mereframe-crash-*.txt when the app crashes, for remote diagnosis. Off by default; enable when asked to produce a crash log. Chain-forwards to the original crash handler. |  |
| [Unlock Pro features](#unlock-pro-features) | Includes every registered feature in the resolved feature set by dropping the ownership check at the entitlement resolver (nv.e). LOCAL client-side effect only. WARNING (kept off by default): on at least one device (realme/Android 16) enabling the single registered Pro feature crashes capture - the Pro pipeline path is gated by this flag and we cannot verify its safety side. Enable only if you specifically want the Pro toolset; the app works fully (RAW capture incl.) with just 'Allow re-signed installs'. |  |

</details>

<details open>
<summary>📦 Meesho&nbsp;&nbsp;•&nbsp;&nbsp;12 patches</summary>
<br>

**🎯 Supported versions:**

| 29.7 | 29.6 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Allow screenshots & screen recording](#allow-screenshots-screen-recording) | Removes FLAG_SECURE and secure-surface flags from Meesho's windows so screenshots and screen recording work. Payment screens may still capture black. |  |
| [Block analytics & tracking](#block-analytics-tracking) | No-ops AppsFlyer, Mixpanel, Facebook App Events, Firebase Analytics, GMS AppMeasurement and Crashlytics logging in Meesho. Push notifications and login/payments keep working. |  |
| [Bypass forced update](#bypass-forced-update) | Neutralizes Play Core's update-availability checks so Meesho does not block usage on a newer version. Running an outdated build may break. |  |
| [Change package name](#change-package-name) | Installs Meesho beside the official app by changing the package, permission names, provider authorities and launcher label. Payments (JusPay), Truecaller/Otpless login, Google sign-in and Shield anti-fraud may not work on the clone. | • Package name<br>• App name |
| [Disable in-app popup upsells](#disable-in-app-popup-upsells) | Disables Meesho's InAppPopupActivity so full-screen promo/upsell popups never render. May break a flow that legitimately routes through it — verify first. |  |
| [Disable reels autoplay](#disable-reels-autoplay) | Stops Meesho's reels from autoplaying muted previews. Opening a reel still plays normally. Heuristic — verify ExoPlayer anchors against the real APK. |  |
| [Hide sponsored listings & ad slots](#hide-sponsored-listings-ad-slots) | Hides 'Ad'-labelled sponsored products in Meesho's search and feed by forcing app-side boolean ad gates to false. Heuristic — verify anchors against the real APK. Server still serves ads; only client rendering is affected. |  |
| [Lock exported share-in / bank-link activities](#lock-exported-share-in-bank-link-activities) | Makes Meesho's exported SharedTextRedirectionActivity and MyBankActivity non-exported. Internal navigation still works; external apps/links can no longer start them. |  |
| [Packaging toolkit (signature, install source, MicroG)](#packaging-toolkit-signature-install-source-microg) | Applies the shared signature, install-source and GmsCore/MicroG patches to Meesho in one step. Does not bypass Play Integrity, Shield or fix payments. |  |
| [Prefer external browser over Custom Tabs](#prefer-external-browser-over-custom-tabs) | Removes Meesho's Custom Tabs service query so browser links can fall back to the normal external browser. No effect if Meesho launches Custom Tabs directly. |  |
| [Remove dangerous permissions (keep storage & SMS)](#remove-dangerous-permissions-keep-storage-sms) | Removes contacts, phone-state, microphone, location, screen-capture detection and advertising-ID permissions from Meesho's manifest. Storage and SMS permissions are kept. Truecaller login, support voice calls and location-based address entry may degrade. |  |
| [Stop pull-notification alarms (keep push)](#stop-pull-notification-alarms-keep-push) | Disables Meesho's alarm-based pull-notification receivers so the app is not periodically woken to fetch marketing notifications. FCM push keeps working. |  |

</details>

<details open>
<summary>📦 MUBI&nbsp;&nbsp;•&nbsp;&nbsp;16 patches</summary>
<br>

**🎯 Supported versions:**

| 100.0 | 99.1 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Allow screenshots & screen recording](#allow-screenshots-screen-recording) | Removes FLAG_SECURE and secure-surface flags from MUBI's players, so screenshots, screen recording and screen mirroring work. DRM-protected video may still render black on some devices. |  |
| [Block analytics & tracking](#block-analytics-tracking) | No-ops Braze, Firebase Analytics, AppsFlyer, Adjust, Facebook App Events and Segment logging in MUBI. Push notifications and account features keep working. |  |
| [Block upgrade & sale deep links](#block-upgrade-sale-deep-links) | Makes MUBI's upgrade screen non-exported and disables the upgrade-yearly / blackfriday / flash-sale deep links. Playback and entitlements are unchanged. |  |
| [Bypass forced update](#bypass-forced-update) | Neutralizes Play Core's update-availability checks so MUBI does not block startup on a newer version. Running an outdated build may break playback. |  |
| [Change package name](#change-package-name) | Installs MUBI beside the official app by changing the package, permission names, provider authorities and launcher label. Play Billing, Cast and Google sign-in may not work on the clone. | • Package name<br>• App name |
| [Disable autoplay previews](#disable-autoplay-previews) | Stops MUBI's home/browse screens from autoplaying muted trailers and previews. Opening a title still plays normally. |  |
| [Enable picture-in-picture](#enable-picture-in-picture) | Adds PiP support to MUBI's phone/tablet player: playback continues in a floating window when you press Home. |  |
| [Force TV (leanback) UI](#force-tv-leanback-ui) | Makes MUBI believe the device is a television, so Android TV boxes that misreport their form factor open the leanback UI. Do not enable on phones. |  |
| [Force highest video quality](#force-highest-video-quality) | Reports a 1 Gbps connection to ExoPlayer/Media3 so MUBI picks the highest available rendition instead of downshifting. May increase data use and buffering on slow connections; server-side caps still apply. |  |
| [Packaging toolkit (signature, install source, MicroG)](#packaging-toolkit-signature-install-source-microg) | Applies the shared signature, install-source and GmsCore/MicroG patches to MUBI in one step. Does not bypass Play Integrity or fix Play Billing. |  |
| [Prefer external browser over Custom Tabs](#prefer-external-browser-over-custom-tabs) | Removes MUBI's Custom Tabs service query so browser links can fall back to the normal external browser. No effect if MUBI launches Custom Tabs directly. |  |
| [Remove promo cards & upsell banners](#remove-promo-cards-upsell-banners) | Disables Braze Content Cards, the Braze feed and card refreshes in MUBI. Push notifications and the app's own screens are untouched. |  |
| [Skip TV confirmation dialog](#skip-tv-confirmation-dialog) | Closes MUBI's Android TV confirmation screen before it draws. Only useful on TV devices; a flow waiting on a dialog result may stall. |  |
| [Skip pre-roll promos](#skip-pre-roll-promos) | Disables MUBI's app-side pre-roll gate when it is a boolean check. Pre-roll injected by the server or embedded in the stream is unaffected. |  |
| [Spoof Widevine level for MUBI](#spoof-widevine-level-for-mubi) | Reports L1 / HDCP 2.2 to MUBI's local DRM checks. Server-side licensing still decides the resolution, so HD may remain unavailable. |  |
| [Suppress subscription paywall](#suppress-subscription-paywall) | Closes MUBI's upgrade screen immediately instead of showing it. Does not unlock playback or grant a subscription; only hides the upsell screen. |  |

</details>

<details open>
<summary>📦 Telegram&nbsp;&nbsp;•&nbsp;&nbsp;14 patches</summary>
<br>

**🎯 Supported versions:**

| 12.10.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Anti-delete messages](#anti-delete-messages) | Prevents messages deleted by other users from being removed locally. |  |
| [Anti-disappearing media](#anti-disappearing-media) | Keeps view-once photos, videos and voice messages viewable indefinitely. |  |
| [Anti-screenshot notification](#anti-screenshot-notification) | Blocks screenshot notifications from being sent to the other user. |  |
| [Bypass channel restrictions](#bypass-channel-restrictions) | Allows opening, viewing, saving and forwarding content from restricted, sensitive, and copyright-restricted channels. |  |
| [Bypass content restrictions](#bypass-content-restrictions) | Allows saving and forwarding content from restricted channels, chats, and users. |  |
| [Bypass integrity check](#bypass-integrity-check) | Spoofs certificate fingerprint and SafetyNet results so login works on patched APK. |  |
| [Disable auto-update](#disable-auto-update) | Disables automatic app update checks, the blocking update screen, and the proxy sponsor channel insertion. On Telegram Plus also disables the Plus-specific updater and update settings flag. |  |
| [Disable channel switching](#disable-channel-switching) | Disables the pull-down gesture that switches to the next unread channel. |  |
| [Download speed boost](#download-speed-boost) | Increases download chunk size to 1 MB and max concurrent requests to 12. |  |
| [Hide typing indicator](#hide-typing-indicator) | Hides your typing indicator from other users in all chats. On Telegram Plus also silences the controller-level sendTyping dispatcher. |  |
| [Remove ads](#remove-ads) | Removes sponsored messages and video ads from all chats and channels. On Telegram Plus also blocks native banner and inline ads. |  |
| [Unlock Premium](#unlock-premium) | Unlocks Telegram Premium features for the current account. |  |
| [Use normal paste](#use-normal-paste) | Skips Telegram's Rich HTML paste handler and falls back to the normal paste path. |  |
| [Voice to music](#voice-to-music) | Plays voice notes in the full music player with seek bar and background playback. |  |

</details>

<details open>
<summary>📦 Telegram Web&nbsp;&nbsp;•&nbsp;&nbsp;14 patches</summary>
<br>

**🎯 Supported versions:**

| 12.10.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Anti-delete messages](#anti-delete-messages) | Prevents messages deleted by other users from being removed locally. |  |
| [Anti-disappearing media](#anti-disappearing-media) | Keeps view-once photos, videos and voice messages viewable indefinitely. |  |
| [Anti-screenshot notification](#anti-screenshot-notification) | Blocks screenshot notifications from being sent to the other user. |  |
| [Bypass channel restrictions](#bypass-channel-restrictions) | Allows opening, viewing, saving and forwarding content from restricted, sensitive, and copyright-restricted channels. |  |
| [Bypass content restrictions](#bypass-content-restrictions) | Allows saving and forwarding content from restricted channels, chats, and users. |  |
| [Bypass integrity check](#bypass-integrity-check) | Spoofs certificate fingerprint and SafetyNet results so login works on patched APK. |  |
| [Disable auto-update](#disable-auto-update) | Disables automatic app update checks, the blocking update screen, and the proxy sponsor channel insertion. On Telegram Plus also disables the Plus-specific updater and update settings flag. |  |
| [Disable channel switching](#disable-channel-switching) | Disables the pull-down gesture that switches to the next unread channel. |  |
| [Download speed boost](#download-speed-boost) | Increases download chunk size to 1 MB and max concurrent requests to 12. |  |
| [Hide typing indicator](#hide-typing-indicator) | Hides your typing indicator from other users in all chats. On Telegram Plus also silences the controller-level sendTyping dispatcher. |  |
| [Remove ads](#remove-ads) | Removes sponsored messages and video ads from all chats and channels. On Telegram Plus also blocks native banner and inline ads. |  |
| [Unlock Premium](#unlock-premium) | Unlocks Telegram Premium features for the current account. |  |
| [Use normal paste](#use-normal-paste) | Skips Telegram's Rich HTML paste handler and falls back to the normal paste path. |  |
| [Voice to music](#voice-to-music) | Plays voice notes in the full music player with seek bar and background playback. |  |

</details>

<details open>
<summary>📦 Telegram Plus&nbsp;&nbsp;•&nbsp;&nbsp;15 patches</summary>
<br>

**🎯 Supported versions:**

| 12.10.1.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Anti-delete messages](#anti-delete-messages) | Prevents messages deleted by other users from being removed locally. |  |
| [Anti-disappearing media](#anti-disappearing-media) | Keeps view-once photos, videos and voice messages viewable indefinitely. |  |
| [Anti-screenshot notification](#anti-screenshot-notification) | Blocks screenshot notifications from being sent to the other user. |  |
| [Bypass channel restrictions](#bypass-channel-restrictions) | Allows opening, viewing, saving and forwarding content from restricted, sensitive, and copyright-restricted channels. |  |
| [Bypass content restrictions](#bypass-content-restrictions) | Allows saving and forwarding content from restricted channels, chats, and users. |  |
| [Bypass integrity check](#bypass-integrity-check) | Spoofs certificate fingerprint and SafetyNet results so login works on patched APK. |  |
| [Disable analytics](#disable-analytics) | Blocks Firebase analytics and event tracking in Telegram Plus. FirebaseApp.initializeApp() is preserved so push notifications keep working. |  |
| [Disable auto-update](#disable-auto-update) | Disables automatic app update checks, the blocking update screen, and the proxy sponsor channel insertion. On Telegram Plus also disables the Plus-specific updater and update settings flag. |  |
| [Disable channel switching](#disable-channel-switching) | Disables the pull-down gesture that switches to the next unread channel. |  |
| [Download speed boost](#download-speed-boost) | Increases download chunk size to 1 MB and max concurrent requests to 12. |  |
| [Hide typing indicator](#hide-typing-indicator) | Hides your typing indicator from other users in all chats. On Telegram Plus also silences the controller-level sendTyping dispatcher. |  |
| [Remove ads](#remove-ads) | Removes sponsored messages and video ads from all chats and channels. On Telegram Plus also blocks native banner and inline ads. |  |
| [Unlock Premium](#unlock-premium) | Unlocks Telegram Premium features for the current account. |  |
| [Use normal paste](#use-normal-paste) | Skips Telegram's Rich HTML paste handler and falls back to the normal paste path. |  |
| [Voice to music](#voice-to-music) | Plays voice notes in the full music player with seek bar and background playback. |  |

</details>

<details open>
<summary>📦 Reddit&nbsp;&nbsp;•&nbsp;&nbsp;7 patches</summary>
<br>

**🎯 Supported versions:**

| 2026.42.0 | 🧪&nbsp;2026.41.0 | 🧪&nbsp;2026.40.0 | 🧪&nbsp;2026.39.0 | 2026.24.0 | 2026.10.0 |
| :---: | :---: | :---: | :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Block AutoMod comments](#block-automod-comments) | Hides all comments from u/AutoModerator, including stickied bot comments. AutoModerator posts are kept. Client-side only; off by default. |  |
| [Content filters](#content-filters) | Adds patch-time keyword, community, author and flair filters for feed posts (optionally comments), and locally bypasses Reddit's NSFW/spoiler/quarantine gates and over-18 account flags. Server-side filtering still applies. Off by default. | • Keywords to hide<br>• Communities to hide<br>• Authors to hide<br>• Flairs to hide<br>• Match mode<br>• Bypass built-in content gates<br>• Also filter comments |
| [Disable Click Tracking](#disable-click-tracking) | Forces the outbound click-tracking account preference off at the Account deserialization choke point (local; server-side click analytics may still be recorded). Enabled by default. |  |
| [Employee Debug Flags](#employee-debug-flags) | Spoofs is_employee locally at the Account JSON adapter, exposing Reddit's internal employee/debug UI menus (mostly non-functional without the employee backend, and a few may misbehave — enable for exploration only). Off by default. |  |
| [Remove ads](#remove-ads) | Hides promoted posts in feeds and banner ads in comment threads. |  |
| [Unlock Account Entitlements](#unlock-account-entitlements) | Locally flips account-gating flags at the Account JSON adapter: can_create_subreddit, can_edit_name, password_set (kills the SSO 'set password' nag) and has_verified_email. Off by default; server entitlements still rule API actions. |  |
| [Unlock Premium](#unlock-premium) | Flips the local isGold/has_gold_subscription account flags at the JSON adapter to enable Reddit Premium UI (custom icons, premium screens). Server-side perks cannot be unlocked. |  |

</details>

<details open>
<summary>📦 Firefox&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 158.0.2 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Block Firefox telemetry](#block-firefox-telemetry) | IronFox-style hardening: never initializes Glean telemetry, Nimbus experiments, Sentry crash reporting, or Adjust attribution at startup; kills Mozilla-side server traffic during browsing (Firefox Suggest/Merino, sponsored shortcuts/Contile, Pocket feed + sponsored stories, search suggestion streaming incl. private tabs, studies previews); and makes the telemetry toggles in Settings read OFF. Browsing, Sync and add-ons keep working; local-only suggestions untouched. |  |
| [Improve startup performance](#improve-startup-performance) | Skips two launch-time routines whose only job is metrics/experiments upkeep: the 4k-line startup-metrics coroutine (pure telemetry writes, ~64 metric writes per launch) and the forced Nimbus experiment fetch right after first render. Less launch I/O = faster, smoother open/close. Browser features unchanged. |  |

</details>

<details open>
<summary>📦 Claude&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.261023.20 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Block Sentry telemetry](#block-sentry-telemetry) | Disables Sentry crash/error/performance telemetry entirely by neutralizing the configurator that writes the DSN - with no DSN set, Sentry self-disables. Fixes nothing to break: the configurator's return is void and unused. Verified against 1.261023.20. |  |

</details>

<details open>
<summary>📦 District&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 🧪&nbsp;2.76.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Block analytics & data collection](#block-analytics-data-collection) | Neutralizes Firebase Analytics, AppsFlyer, CleverTap event fan-out and the in-house crash-report enqueue of District by Zomato. |  |
| [Block location tracking](#block-location-tracking) | Stops District by Zomato from acquiring GPS fixes (continuous updates + one-shot fetch). Manual city selection still works. |  |

</details>

<details open>
<summary>📦 Strava&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 480.15 | 486.9 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Block analytics and data collection](#block-analytics-and-data-collection) | Stops Strava's Braze telemetry bootstrap (session + engagement tracking, endpoint sdk.iad-07.braze.com) before it is configured. Firebase Analytics collection and Facebook auto event logging are already off in Strava's own manifest; this removes the one tracker pipe that is actually live. Push, GPS, and recording keep working. |  |
| [Force password login (OTP bypass)](#force-password-login-otp-bypass) | Always shows the password login field instead of the OTP code flow. OFF by default: breaks log-in AND sign-up for OTP-only accounts. Enable only if your Strava account has an actual password. |  |
| [Unlock Premium](#unlock-premium) | Unlocks Strava Premium features. |  |

</details>

<details open>
<summary>📦 Amazon Shopping&nbsp;&nbsp;•&nbsp;&nbsp;8 patches</summary>
<br>

**🎯 Supported versions:**

| 32.18.0.100 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Dark mode](#dark-mode) | Force dark mode for Amazon Shopping. | • Dark mode |
| [Disable search suggestions tracking](#disable-search-suggestions-tracking) | Prevents search keypress and focus events from being sent with suggestion requests. |  |
| [Disable video autoplay](#disable-video-autoplay) | Prevents videos from autoplaying in Amazon's in-app WebView pages. |  |
| [Fix Amazon manifest conflicts](#fix-amazon-manifest-conflicts) | Updates shared Amazon permissions so other Amazon apps can coexist. |  |
| [Hide Rufus tab](#hide-rufus-tab) | Removes the Rufus AI assistant tab from Amazon's bottom navigation bar. |  |
| [Open links in browser](#open-links-in-browser) | Opens non-Amazon URLs in the default browser instead of the in-app WebView. |  |
| [Price history charts](#price-history-charts) | Injects Keepa and CamelCamelCamel price history charts on Amazon product pages. | • Chart period<br>• Show period toggle<br>• Toggle periods<br>• Keepa price lines<br>• CamelCamelCamel chart<br>• Hide zero-price gaps<br>• Chart size<br>• Start collapsed |
| [Remove ads](#remove-ads) | Hides sponsored and ad content in Amazon Shopping via CSS injection. |  |

</details>

<details open>
<summary>📦 Amazon India&nbsp;&nbsp;•&nbsp;&nbsp;8 patches</summary>
<br>

**🎯 Supported versions:**

| 32.18.0.300 | 32.19.0.300 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Dark mode](#dark-mode) | Force dark mode for Amazon Shopping. | • Dark mode |
| [Disable search suggestions tracking](#disable-search-suggestions-tracking) | Prevents search keypress and focus events from being sent with suggestion requests. |  |
| [Disable video autoplay](#disable-video-autoplay) | Prevents videos from autoplaying in Amazon's in-app WebView pages. |  |
| [Fix Amazon manifest conflicts](#fix-amazon-manifest-conflicts) | Updates shared Amazon permissions so other Amazon apps can coexist. |  |
| [Hide Rufus tab](#hide-rufus-tab) | Removes the Rufus AI assistant tab from Amazon's bottom navigation bar. |  |
| [Open links in browser](#open-links-in-browser) | Opens non-Amazon URLs in the default browser instead of the in-app WebView. |  |
| [Price history charts](#price-history-charts) | Injects Keepa and CamelCamelCamel price history charts on Amazon product pages. | • Chart period<br>• Show period toggle<br>• Toggle periods<br>• Keepa price lines<br>• CamelCamelCamel chart<br>• Hide zero-price gaps<br>• Chart size<br>• Start collapsed |
| [Remove ads](#remove-ads) | Hides sponsored and ad content in Amazon Shopping via CSS injection. |  |

</details>

<details open>
<summary>📦 Inure App Manager (GitHub)&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| build107.2.4 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Inure — Unlock Full Version (GitHub)](#inure-unlock-full-version-github) | Bypasses the 15-day trial gate and unlocks all premium features in Inure App Manager (GitHub). |  |

</details>

<details open>
<summary>📦 Gboard&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 18.5.4.993608717-release-arm64-v8a |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Offline-only voice typing & telemetry reduction](#offline-only-voice-typing-telemetry-reduction) | On Gboard 18.5.4.993608717 arm64, routes core voice typing only through the on-device<br>recognizers and returns no recognizer when a local provider/model is unavailable (no<br>online fallback). Disables Agentic Dictation's server/batch retry path, reduces selected<br>metrics/telemetry and disables app backup. INTERNET and unrelated network features are<br>retained; this is best-effort telemetry reduction, not a guarantee of zero Google traffic.<br><br>Requires the appropriate offline speech model/provider to be installed. Without one,<br>voice typing is unavailable by design. Agentic Dictation is disabled. |  |

</details>

<details open>
<summary>📦 ChatGPT&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 1.2026.293 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Privacy: block trackers & analytics](#privacy-block-trackers-analytics) | Suppresses ChatGPT product analytics, Statsig events/exposures, Segment event dispatch and Bitdrift crash/session-replay startup; disables Datadog RUM and removes ad-ID/install-referrer access. Chat, login, files and push notifications are preserved. Core service requests and server-side logging cannot be disabled by an APK patch. |  |
| [Privacy: no location, contacts or phone data](#privacy-no-location-contacts-or-phone-data) | Removes ChatGPT's location, contacts, phone-state and SMS-send permissions. Location-based answers, contact lookup, phone-state access and direct SMS sending are disabled. Call/voice-assistant framework permissions, chat, files and push notifications are preserved. |  |
| [Privacy: no mic or camera](#privacy-no-mic-or-camera) | Removes RECORD_AUDIO, CAMERA, FOREGROUND_SERVICE_MICROPHONE plus all camera/microphone uses-feature declarations from the manifest. Voice Mode and camera capture become impossible (not merely denied - the grant dialog itself is gone). File storage, notifications and everything else are untouched. |  |

</details>

<details open>
<summary>📦 Everything Widgets&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 🧪&nbsp;2.1.014 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Remove tracking & analytics](#remove-tracking-analytics) | Kills Facebook auto-init and OneSignal, and opts Firebase Crashlytics/Performance/Analytics out of collection at boot, in Everything Widgets. Widget functionality is unaffected; OneSignal push notifications stop. |  |
| [Spoof Play Store signature](#spoof-play-store-signature) | Forces the Google license (Pairip) verdict branch to LICENSED and neutralizes the license payload's signature verification, so the patched/re-signed Everything Widgets build always passes store validation. |  |
| [Unlock Premium](#unlock-premium) | Bypasses the Google license (Pairip) purchase check of the paid Everything Widgets app: the app runs fully without a Play purchase. Donation SKUs are cosmetic and untouched. |  |

</details>

<details open>
<summary>📦 Excel&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 16.0.20228.20090 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Excel](#unlock-excel) | Removes login requirement, unlocks premium, blocks ads, bypasses signature and code transparency checks. |  |

</details>

<details open>
<summary>📦 Inure App Manager&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| build107.2.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Full Version](#unlock-full-version) | Bypasses the 15-day trial gate and unlocks all premium features in Inure App Manager. |  |

</details>

<details open>
<summary>📦 Proxyman&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.21.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Lifetime](#unlock-lifetime) | Unlocks all Lifetime features in Proxyman. |  |

</details>

<details open>
<summary>📦 Malwarebytes Mobile Security&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 5.27.0+564 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Ultimate](#unlock-ultimate) | Unlocks all Malwarebytes Ultimate features via enum singleton and feature gate patches. |  |

</details>

<details open>
<summary>📦 Proton Pass&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.41.3 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Unlimited Plan](#unlock-unlimited-plan) | Forces Proton Pass Plus plan with all limits removed and paid features unlocked. |  |

</details>

<details open>
<summary>📦 trakt.TV Shows & Movies&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 3.26.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock VIP](#unlock-vip) | Unlocks VIP in trakt.TV Shows & Movies by forcing the parsed User.isVip flag to true (covers no-ads, advanced/saved filters, year-in-review and other local VIP gates). Methods delegating to the primary User constructor are covered automatically. |  |

</details>

<details open>
<summary>📦 Yatri&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 5.0.6 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock VIP](#unlock-vip) | Unlocks Yatri VIP by forcing active plan status and spoofing active plan DB query. |  |

</details>

<details open>
<summary>📦 Proton VPN&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 5.19.78.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock VPN Plus](#unlock-vpn-plus) | Injects max tier (3=PMTeam) into VpnUser at construction for all UI unlocks, while routing connections through free servers for server-side compatibility. Phone and TV |  |

</details>

<details open>
<summary>📦 Word&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 16.0.20228.20090 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Word](#unlock-word) | Removes login requirement, unlocks premium, blocks ads, bypasses signature and code transparency checks. |  |

</details>

<details open>
<summary>🌐 Universal&nbsp;&nbsp;•&nbsp;&nbsp;24 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Allow screenshots & screen recording](#allow-screenshots-screen-recording) | Removes FLAG_SECURE from the app's windows so screenshots and screen<br>recordings work. Payment/banking screens may still capture black.<br><br>Applies to any app. Inverse of "Block screenshots & screen recording". |  |
| [Block analytics & tracking SDKs](#block-analytics-tracking-sdks) | Disables common analytics/tracking SDKs (Firebase Analytics, AppsFlyer, Adjust,<br>Facebook AppEvents, Segment, Amplitude, Mixpanel and similar) by removing their<br>event-reporting calls.<br><br>Heuristic: obfuscated or reflection-based reporting is not covered. Applies to<br>any app. |  |
| [Block cleartext (HTTP) traffic](#block-cleartext-http-traffic) | Sets android:usesCleartextTraffic="false" so the app cannot send plaintext<br>HTTP requests. Breaks apps that still use legacy HTTP endpoints.<br><br>Applies to any app. |  |
| [Block screenshots & screen recording](#block-screenshots-screen-recording) | Sets FLAG_SECURE on all activity windows so screenshots, screen recorders,<br>overlay apps and accessibility services cannot capture the app's content<br>(they see a black surface).<br><br>Applies to any app. Does not remove existing protections - it adds them. |  |
| [Block user-added certificate authorities](#block-user-added-certificate-authorities) | Removes user-added certificate authorities from the app's network security<br>config (if it declares one), so the app does not trust certificates installed<br>on the device.<br><br>Applies to any app. No effect if the app has no network security config. |  |
| [Change package name (clone app)](#change-package-name-clone-app) | Installs a clone of any app beside the original by changing the package,<br>permission names, provider authorities and launcher label.<br><br>The clone is re-signed: payments, SDK logins, Google sign-in and anti-fraud<br>checks bound to the original signature may not work on the clone. | • Package name<br>• App name |
| [Disable PairIP license check](#disable-pairip-license-check) | Disables PairIP license verification: integrity/VM checks, the licensing<br>client and repeated background checks.<br><br>Applies to any app. No effect if the app does not use PairIP. |  |
| [Disable app backup (allowBackup=false)](#disable-app-backup-allowbackup-false) | Sets android:allowBackup="false" so the app's private data is excluded from<br>ADB backups, cloud backups and device-to-device transfers.<br><br>Applies to any app. You lose automatic backup/restore of this app's data. |  |
| [Empty telephony identifiers (IMEI, phone number, SIM)](#empty-telephony-identifiers-imei-phone-number-sim) | Makes TelephonyManager device-identifier getters (IMEI, device ID, phone<br>number, subscriber ID, SIM serial, software version) return an empty string<br>to the app.<br><br>Applies to any app. Features that need the real IMEI/number may degrade. |  |
| [Fix Firebase after re-signing](#fix-firebase-after-re-signing) | Fixes Firebase services (push notifications, Remote Config, Firebase Auth) that break after Morphe re-signs the app with a different certificate.<br><br>Apply with Original app certificate patch — no other config needed. |  |
| [Force not debuggable](#force-not-debuggable) | Sets android:debuggable="false" in the manifest so the patched app cannot be<br>inspected or modified over ADB/USB debugging.<br><br>Applies to any app. Safe for release builds. |  |
| [GmsCore support (MicroG)](#gmscore-support-microg) | Routes Google Play Services calls through MicroG instead of real GPS.<br><br>Works for: Google apps (YouTube, Maps, News, Photos) and third-party apps using classic Google Sign-In (Android 13 and below).<br><br>Does not work for: Android 14+ Credential Manager sign-in (most modern third-party apps), Play Integrity / SafetyNet checks, or apps with custom auth.<br><br>Requires MicroG RE installed. Apply with Original app certificate patch. | • MicroG package name<br>• Main activity class (optional)<br>• Custom package name (optional) |
| [Hide developer options & USB debugging](#hide-developer-options-usb-debugging) | Makes the app think Developer Options, USB (ADB) debugging and wireless<br>debugging are disabled, by forcing the settings reads apps use for these<br>checks to return "off" / "0".<br><br>Applies to any app. Only affects what the app itself sees. |  |
| [Lock down exported components](#lock-down-exported-components) | Sets android:exported="false" on activities, services and receivers that have no<br>intent filter, so other apps cannot start them directly. Deep links, share-in<br>targets and the launcher activity (all of them have intent filters) are never<br>touched.<br><br>Applies to any app. May break apps that rely on explicitly exported entry points. |  |
| [Prefer external browser over Custom Tabs](#prefer-external-browser-over-custom-tabs) | Opens links in the default external browser instead of an in-app Custom Tab,<br>by rewriting CustomTabsIntent.launchUrl call sites into ACTION_VIEW intents.<br><br>Applies to any app. Some apps rely on the Custom Tab session (shared cookies,<br>return results) and may misbehave. |  |
| [Provide Original app certificate](#provide-original-app-certificate) | Automatically reads the signing certificate from the APK you are patching — no original app installed or file provided needed. Only fill the options below if you are patching an APK that was already re-signed (e.g. a previously patched build): in that case point to the original APK file, or enter the certificate manually. | • Path to original APK (if uninstalled)<br>• Certificate SHA-1 (manual)<br>• Certificate SHA-256 (manual)<br>• Certificate Base64 DER (manual) |
| [Remove dangerous permissions](#remove-dangerous-permissions) | Removes privacy-invasive permissions from any app's manifest using simple<br>category switches. All categories are ON by default (aggressive): package<br>visibility, phone, accounts, location, contacts, microphone, camera,<br>storage, SMS, calendar, sensors, nearby devices, ad ID, AdServices,<br>notifications and screen-capture detection.<br><br>Use "Permissions to keep" to exempt a single permission, or "Advanced:<br>exact removal list" to replace the switches with your own list.<br><br>Removing a permission the app actually needs can break features (login,<br>calls, camera, file picker, notifications). Off by default. | • Package visibility<br>• Phone state & numbers<br>• Accounts<br>• Location<br>• Contacts<br>• Microphone<br>• Camera<br>• Storage & media<br>• SMS<br>• Calendar<br>• Sensors & activity<br>• Nearby devices<br>• Screen-capture detection<br>• Advertising ID<br>• AdServices permissions<br>• Notifications<br>• Permissions to keep<br>• Extra permissions to remove<br>• Advanced: exact removal list |
| [Spoof Widevine / DRM level](#spoof-widevine-drm-level) | Reports Widevine L1 (hardware DRM) to apps that check DRM level locally.<br><br>Useful for apps that refuse to play HD/4K content on L3 devices or after re-signing.<br><br>Does not bypass server-side DRM - Netflix, Disney+ and similar are not affected.<br>Applies to any app; no effect if the app does not query Widevine. | • Widevine security level to report<br>• HDCP level to report |
| [Spoof app signature](#spoof-app-signature) | Makes the app think its signing certificate is unchanged after Morphe re-signs it.<br><br>Useful when an app crashes or shows a tamper warning because it checks its own certificate.<br><br>Does not bypass Play Integrity / SafetyNet hardware attestation.<br><br>Apply with Original app certificate patch. | • Package name override (optional)<br>• Certificate Base64 override (optional) |
| [Spoof install source](#spoof-install-source) | Makes the app think it was installed from a specific store (default: Google Play).<br><br>Useful when an app blocks features or shows errors because it detects it was not installed from the Play Store.<br><br>Only affects what the app itself sees - does not change the real system install record. | • Store to impersonate |
| [Strip logging (android.util.Log)](#strip-logging-android-util-log) | Removes all android.util.Log calls from the app, so logcat cannot leak<br>URLs, tokens, PII or debug output produced by the app.<br><br>Applies to any app. Safe. |  |
| [WebView: block mixed content (HTTPS pages load HTTP subresources)](#webview-block-mixed-content-https-pages-load-http-subresources) | Forces WebSettings.setMixedContentMode to NEVER_ALLOW, so HTTPS pages in the<br>app's WebViews cannot load plaintext HTTP subresources.<br><br>Applies to any app. May break legacy web content inside the app. |  |
| [WebView: disable local file access](#webview-disable-local-file-access) | Disables WebView local file access (file://, content://, universal/file-URL<br>access) in every app, so web content cannot read the app's private files.<br><br>Applies to any app. Safe. |  |
| [WebView: remove JavaScript interface objects](#webview-remove-javascript-interface-objects) | Removes addJavascriptInterface bridges from the app's WebViews so loaded web<br>content cannot invoke injected Java objects.<br><br>Applies to any app. Web flows that depend on the bridge (some logins) may break. |  |

</details>

<!-- PATCHES_END -->

## 🛡️ Security & safety

Every patch follows a fail-safe design (details:
**[UNIVERSAL_PATCH_AUDIT.md](UNIVERSAL_PATCH_AUDIT.md)**):

- Fail-safe by default; heuristic patches default to **off**
- Bytecode edits only rewrite call sites that match known SDK shapes — unrecognised
  sites are skipped, never guessed at, and component class names are never renamed
- No payment, purchase or account bypasses. The PairIP and DRM patches only disable
  local client-side checks; they do not defeat server-side billing or attestation
- No network calls, no exec, no secrets in the bundle
- Meesho's patch set deliberately **keeps storage and SMS permissions**

Understand the risk classes before enabling signature/integrity-related
patches on apps you don't trust — see the audit for details.

## 🧾 Provenance

**Thanks For Doom's Morphe Patches to inspire this Project for reddit as premium is closed by Doom's
([rushiranpise/morphe-patches](https://github.com/rushiranpise/morphe-patches))
And Thanks to the Morphe Team for creating App and
The bundle *format* for creating patches
[morphe-patches-template](https://github.com/MorpheApp/morphe-patches-template).

## 🔨 Build from source

```bash
git clone https://github.com/ineednotitle/Proteus-Patches.git
cd Proteus-Patches
./gradlew buildAndroid        # produces patches/build/libs/patches-<version>.mpp
```

Releases are versioned by semantic-release (conventional commits); CI builds the
`.mpp` and publishes the GitHub Release automatically on pushes to `main`.

## 📄 Docs

- [UNIVERSAL_PATCH_AUDIT.md](UNIVERSAL_PATCH_AUDIT.md) — per-patch correctness & UX audit
- [CHANGELOG.md](CHANGELOG.md) — release history
- [docs/COMMUNITY-LISTING.md](docs/COMMUNITY-LISTING.md) — patch listing for community indexes

## Warning:
I have no intentions of stealing any of your data. So, Be chill about getting Hacked. You can Even check the code or give it to AI to check or put patched apps in the Virustotal.
The Project created becoz I am a big fan of Morphe Project & I Love my Privacy as it a right! for everyone.  

## ⚖️ License

[MIT](LICENSE). Patches modify third-party apps at your own risk — use only on
APKs whose signature you trust.
