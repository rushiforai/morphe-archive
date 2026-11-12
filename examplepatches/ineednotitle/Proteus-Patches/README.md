# Proteus Patches

[![Release](https://img.shields.io/github/v/release/ineednotitle/Proteus-Patches?include_prereleases&label=release&color=2563eb)](https://github.com/ineednotitle/Proteus-Patches/releases)
[![Build](https://github.com/ineednotitle/Proteus-Patches/actions/workflows/build.yml/badge.svg?branch=main)](https://github.com/ineednotitle/Proteus-Patches/actions/workflows/build.yml)
[![Patches](https://img.shields.io/badge/patches-177-2563eb)](patches-list.json)
[![Universal](https://img.shields.io/badge/universal-23-7c3aed)](#universal-patches)
[![Apps](https://img.shields.io/badge/apps-31-f59e0b)](#whats-inside)
[![License](https://img.shields.io/badge/license-GPL--3.0--only-16a34a)](LICENSE)

**Proteus Patches** is a curated [Morphe](https://github.com/MorpheApp/Morphe)
patch bundle for Android. It removes ads, trackers and privacy-hostile defaults
from **31 popular apps**, and ships **23 universal patches** that work on almost
any APK.

> **Current pre-release:** [v2.2.10](https://github.com/ineednotitle/Proteus-Patches/releases/tag/v2.2.10) —
> Reddit listing filters, autoplay and external-browser controls, deleted-content
> restore, and a rewritten Mereframe Pro unlock. Build and patch-application
> verified; on-device testing is community-driven.

[![Add to Morphe](https://img.shields.io/badge/Add_to-Morphe-1f6feb?style=for-the-badge)](https://morphe.software/add-source?github=ineednotitle/Proteus-Patches)
[![Releases](https://img.shields.io/badge/Download-Releases-0f172a?style=for-the-badge)](https://github.com/ineednotitle/Proteus-Patches/releases)

**Patch source**

```text
https://github.com/ineednotitle/Proteus-Patches
```

## Contents

- [Support](#support)
- [Install](#install)
- [What's inside](#whats-inside)
- [Safety](#safety)
- [Documentation](#documentation)
- [Build from source](#build-from-source)
- [Contributing](#contributing)
- [License](#license)

## Support

If these patches save you time or make an app more usable, you can support
ongoing development:

<p align="center">
  <a href="https://liberapay.com/ineednotitle"><img alt="Donate via Liberapay" src="https://img.shields.io/badge/Liberapay-Donate-F6C915?style=for-the-badge&logo=liberapay&logoColor=black"></a>
  <a href="https://ko-fi.com/A1A62AJ2Q8"><img alt="Support me on Ko-fi" src="https://img.shields.io/badge/Ko--fi-Support%20me-72A4F2?style=for-the-badge&logo=kofi&logoColor=white"></a>
  <a href="https://coindrop.to/ineednotitle"><img alt="Donate via CoinDrop" src="https://img.shields.io/badge/CoinDrop-Donate-3D5A98?style=for-the-badge&logo=bitcoin&logoColor=white"></a>
</p>

Donations are optional. Bug reports, testing and focused pull requests help just
as much.

## Install

1. Install **[Morphe Manager](https://github.com/MorpheApp/Morphe)**.
2. Tap **Add to Morphe** above, or add the patch source URL manually in
   **Morphe Manager → Sources**.
3. Select an app, review its compatible versions and patch options, then patch.
4. To import manually, download the newest `.mpp` from
   **[Releases](https://github.com/ineednotitle/Proteus-Patches/releases)** and use
   **Settings → Patches → Import patches**.

Use the remote source for automatic updates. Imported `.mpp` files must be
updated manually.

## What's inside

The catalog below is generated from `patches-list.json`. Expand an app to see its
compatible versions, patches and options.

<!-- PATCHES_START -->
> **[v2.3.0](https://github.com/ineednotitle/Proteus-Patches/releases/tag/v2.3.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;187 patches total

### Supported apps

| App | Compatible versions | Patches |
| :--- | :--- | ---: |
| [Amazon India](#app-in-amazon-mshop-android-shopping) | 32.18.0.300 · 32.19.0.300 | 9 |
| [Amazon Shopping](#app-com-amazon-mshop-android-shopping) | 32.18.0.100 | 9 |
| [Brave Browser](#app-com-brave-browser) | 1.98.63 | 14 |
| [ChatGPT](#app-com-openai-chatgpt) | 1.2026.293 | 3 |
| [Claude](#app-com-anthropic-claude) | 1.261023.20 | 1 |
| [District](#app-com-application-zomato-district) | 2.76.0 | 2 |
| [Everything Widgets](#app-com-jndapp-nothing-widgets-pack) | 2.1.014 | 3 |
| [Excel](#app-com-microsoft-office-excel) | 16.0.20228.20090 | 1 |
| [Firefox](#app-org-mozilla-firefox) | 158.0.2 | 2 |
| [Gboard](#app-com-google-android-inputmethod-latin) | 18.5.4.993608717-release-arm64-v8a · 18.5.4.993608717-release-armeabi-v7a | 2 |
| [Google Photos](#app-com-google-android-apps-photos) | 7.97.0.997578476 | 7 |
| [Hindustan Times](#app-com-ht-news) | 4.9.16 | 3 |
| [Inure App Manager](#app-app-simple-inure-play) | build107.2.1 | 1 |
| [Inure App Manager (GitHub)](#app-app-simple-inure) | build107.2.4 | 1 |
| [Malwarebytes Mobile Security](#app-org-malwarebytes-antimalware) | 5.27.0+564 | 1 |
| [Meesho](#app-com-meesho-shopping) | 29.9 · 29.8 · 29.7 · +2 more | 3 |
| [Mereframe](#app-app-unnamed-rawrecording) | 0.8.4 | 4 |
| [Mint](#app-com-htmedia-mint) | 5.7.5 · 5.8.4 | 3 |
| [MUBI](#app-com-mubi) | 100.0 · 99.1 | 16 |
| [Pinterest](#app-com-pinterest) | 14.41.0 | 4 |
| [Proton Pass](#app-proton-android-pass) | 1.41.3 | 5 |
| [Proton Pass (F-Droid)](#app-proton-android-pass-fdroid) | 1.41.3 | 5 |
| [Proton VPN](#app-ch-protonvpn-android) | 5.19.78.0 | 1 |
| [Proxyman](#app-com-proxyman-proxymanandroid) | 1.21.0 | 1 |
| [Reddit](#app-com-reddit-frontpage) | 2026.42.0 · 2026.41.0 · 2026.40.0 · +3 more | 14 |
| [Strava](#app-com-strava) | 480.15 · 486.9 | 3 |
| [Telegram](#app-org-telegram-messenger) | 12.10.1 | 14 |
| [Telegram Plus](#app-org-telegram-plus) | 12.10.1.1 | 15 |
| [Telegram Web](#app-org-telegram-messenger-web) | 12.10.1 | 14 |
| [trakt.TV Shows & Movies](#app-tv-trakt-trakt) | 3.26.1 | 1 |
| [Word](#app-com-microsoft-office-word) | 16.0.20228.20090 | 1 |
| [Yatri](#app-com-yatrirailways-yatri) | 5.0.6 | 1 |
| [Universal patches](#universal-patches) | Any app | 23 |

<a id="app-in-amazon-mshop-android-shopping"></a>
<details>
<summary><strong>Amazon India</strong> · 9 patches</summary>
<br>

**Compatible versions**

| 32.18.0.300 | 32.19.0.300 |
| :---: | :---: |

| Patch | Description | Options |
| :--- | :--- | :--- |
| [Amazon: Stop feed video autoplay](#amazon-stop-feed-video-autoplay) | Stops Amazon's home-feed native video units (live promotional videos,<br>review carousels, sponsored reels) from starting on their own, using<br>the same setPlayWhenReady(true) → false heuristic as the universal<br>'Disable video autoplay (ExoPlayer/Media3)' patch.<br><br>Covers native ExoPlayer/Media3 players only — NOT the in-app WebView<br>pages (use the default-on 'Disable video autoplay' patch for those),<br>and NOT WebView CSS-injected ad blocks (use 'Remove ads'). Heuristic:<br>reflection or obfuscated player setup is not covered. Can stop playback<br>entirely in apps whose only play path is a flipped literal call — turn<br>it off if videos never start. Unverified on device. |  |
| [Dark mode](#dark-mode) | Force dark mode for Amazon Shopping. | • Dark mode |
| [Disable search suggestions tracking](#disable-search-suggestions-tracking) | Prevents search keypress and focus events from being sent with suggestion requests. |  |
| [Disable video autoplay](#disable-video-autoplay) | Prevents videos from autoplaying in Amazon's in-app WebView pages. |  |
| [Fix Amazon manifest conflicts](#fix-amazon-manifest-conflicts) | Updates shared Amazon permissions so other Amazon apps can coexist. |  |
| [Hide Rufus tab](#hide-rufus-tab) | Removes the Rufus AI assistant tab from Amazon's bottom navigation bar. |  |
| [Open links in browser](#open-links-in-browser) | Opens non-Amazon URLs in the default browser instead of the in-app WebView. |  |
| [Price history charts](#price-history-charts) | Injects Keepa and CamelCamelCamel price history charts on Amazon product pages. | • Chart period<br>• Show period toggle<br>• Toggle periods<br>• Keepa price lines<br>• CamelCamelCamel chart<br>• Hide zero-price gaps<br>• Chart size<br>• Start collapsed |
| [Remove ads](#remove-ads) | Hides sponsored and ad content in Amazon Shopping via CSS injection. |  |

</details>

<a id="app-com-amazon-mshop-android-shopping"></a>
<details>
<summary><strong>Amazon Shopping</strong> · 9 patches</summary>
<br>

**Compatible versions**

| 32.18.0.100 |
| :---: |

| Patch | Description | Options |
| :--- | :--- | :--- |
| [Amazon: Stop feed video autoplay](#amazon-stop-feed-video-autoplay) | Stops Amazon's home-feed native video units (live promotional videos,<br>review carousels, sponsored reels) from starting on their own, using<br>the same setPlayWhenReady(true) → false heuristic as the universal<br>'Disable video autoplay (ExoPlayer/Media3)' patch.<br><br>Covers native ExoPlayer/Media3 players only — NOT the in-app WebView<br>pages (use the default-on 'Disable video autoplay' patch for those),<br>and NOT WebView CSS-injected ad blocks (use 'Remove ads'). Heuristic:<br>reflection or obfuscated player setup is not covered. Can stop playback<br>entirely in apps whose only play path is a flipped literal call — turn<br>it off if videos never start. Unverified on device. |  |
| [Dark mode](#dark-mode) | Force dark mode for Amazon Shopping. | • Dark mode |
| [Disable search suggestions tracking](#disable-search-suggestions-tracking) | Prevents search keypress and focus events from being sent with suggestion requests. |  |
| [Disable video autoplay](#disable-video-autoplay) | Prevents videos from autoplaying in Amazon's in-app WebView pages. |  |
| [Fix Amazon manifest conflicts](#fix-amazon-manifest-conflicts) | Updates shared Amazon permissions so other Amazon apps can coexist. |  |
| [Hide Rufus tab](#hide-rufus-tab) | Removes the Rufus AI assistant tab from Amazon's bottom navigation bar. |  |
| [Open links in browser](#open-links-in-browser) | Opens non-Amazon URLs in the default browser instead of the in-app WebView. |  |
| [Price history charts](#price-history-charts) | Injects Keepa and CamelCamelCamel price history charts on Amazon product pages. | • Chart period<br>• Show period toggle<br>• Toggle periods<br>• Keepa price lines<br>• CamelCamelCamel chart<br>• Hide zero-price gaps<br>• Chart size<br>• Start collapsed |
| [Remove ads](#remove-ads) | Hides sponsored and ad content in Amazon Shopping via CSS injection. |  |

</details>

<a id="app-com-brave-browser"></a>
<details>
<summary><strong>Brave Browser</strong> · 14 patches</summary>
<br>

**Compatible versions**

| 1.98.63 (experimental) |
| :---: |

| Patch | Description | Options |
| :--- | :--- | :--- |
| [Block Motion Sensors](#block-motion-sensors) | Attempts to disable Chromium's Android sensor provider; may also block ambient sensors. Requires device validation. |  |
| [Block Popups & Ratings](#block-popups-ratings) | Disables the identified rating and Brave Ads signup eligibility checks; other dialogs can still appear. |  |
| [Block Telemetry](#block-telemetry) | Blocks usage analytics, crash uploads and experiment downloads. | • Block offers server |
| [Brave Origin](#brave-origin) | Unlocks Brave Origin feature switches across Rewards, News, Wallet, and VPN. |  |
| [Clean New Tab](#clean-new-tab) | Removes sponsored wallpapers, news feed and promo cards. | • Hide shortcut tiles |
| [Close Tab In Group Order](#close-tab-in-group-order) | Selects the previous tab in the tab group when closing a tab. |  |
| [Custom Brave theme](#custom-brave-theme) | Applies custom colors to Brave dark mode chrome, defaulting to pure OLED black for battery saving on OLED screens. | • Background color<br>• Surfaces use background color<br>• Surface / container color<br>• Text ink color<br>• Accent highlight color<br>• Disable Material You dynamic colors<br>• Window background color<br>• Preference card color<br>• Style preference rows as cards<br>• Modulate text tiers by luminance<br>• Patch Material You system color roles<br>• Patch color state list lStar selectors<br>• Patch vector drawable surface fills |
| [Preserve last active tab](#preserve-last-active-tab) | Disables the identified new-tab opening-screen override after inactivity. Does not prevent tab unloading under memory pressure. |  |
| [Remove Extra Languages](#remove-extra-languages) | Replaces larger unselected Chromium locale PAKs with the English fallback; gender variants and Android resources are not removed. | • Languages to keep |
| [Remove Unused AI & VPN](#remove-unused-ai-vpn) | Deletes unused AR and XR files to shrink the app. | • Remove VPN library |
| [Skip Welcome Screens](#skip-welcome-screens) | Reports the first-run flow complete; may skip essential consent, search or setup screens. |  |
| [Stop Background Wakeups](#stop-background-wakeups) | Disables the identified Chromium background-sync scheduler gate; other wakeups remain and site background sync can break. |  |
| [Stop Promo Notifications](#stop-promo-notifications) | Disables identified Chromium tips and retention notification entry points; other notifications may remain. |  |
| [Stop Text Sharing with System](#stop-text-sharing-with-system) | Disables Chromium's OnscreenContentProvider content-capture gate, not every possible text-sharing mechanism. |  |

</details>

<a id="app-com-openai-chatgpt"></a>
<details>
<summary><strong>ChatGPT</strong> · 3 patches</summary>
<br>

**Compatible versions**

| 1.2026.293 |
| :---: |

| Patch | Description | Options |
| :--- | :--- | :--- |
| [Privacy: block trackers & analytics](#privacy-block-trackers-analytics) | Suppresses ChatGPT product analytics, Statsig events/exposures, Segment event dispatch and Bitdrift crash/session-replay startup; disables Datadog RUM and removes ad-ID/install-referrer access. Chat, login, files and push notifications are preserved. Core service requests and server-side logging cannot be disabled by an APK patch. |  |
| [Privacy: no location, contacts or phone data](#privacy-no-location-contacts-or-phone-data) | Removes ChatGPT's location, contacts, phone-state and SMS-send permissions. Location-based answers, contact lookup, phone-state access and direct SMS sending are disabled. Call/voice-assistant framework permissions, chat, files and push notifications are preserved. |  |
| [Privacy: no mic or camera](#privacy-no-mic-or-camera) | Removes RECORD_AUDIO, CAMERA, FOREGROUND_SERVICE_MICROPHONE plus all camera/microphone uses-feature declarations from the manifest. Voice Mode and camera capture become impossible (not merely denied - the grant dialog itself is gone). File storage, notifications and everything else are untouched. |  |

</details>

<a id="app-com-anthropic-claude"></a>
<details>
<summary><strong>Claude</strong> · 1 patch</summary>
<br>

**Compatible versions**

| 1.261023.20 |
| :---: |

| Patch | Description | Options |
| :--- | :--- | :--- |
| [Block Sentry telemetry](#block-sentry-telemetry) | Disables Sentry crash/error/performance telemetry entirely by neutralizing the configurator that writes the DSN - with no DSN set, Sentry self-disables. Fixes nothing to break: the configurator's return is void and unused. Verified against 1.261023.20. |  |

</details>

<a id="app-com-application-zomato-district"></a>
<details>
<summary><strong>District</strong> · 2 patches</summary>
<br>

**Compatible versions**

| 2.76.0 (experimental) |
| :---: |

| Patch | Description | Options |
| :--- | :--- | :--- |
| [Block analytics & data collection](#block-analytics-data-collection) | Neutralizes Firebase Analytics, AppsFlyer, CleverTap event fan-out and the in-house crash-report enqueue of District by Zomato. |  |
| [Block location tracking](#block-location-tracking) | Stops District by Zomato from acquiring GPS fixes (continuous updates + one-shot fetch). Manual city selection still works. |  |

</details>

<a id="app-com-jndapp-nothing-widgets-pack"></a>
<details>
<summary><strong>Everything Widgets</strong> · 3 patches</summary>
<br>

**Compatible versions**

| 2.1.014 (experimental) |
| :---: |

| Patch | Description | Options |
| :--- | :--- | :--- |
| [Remove tracking & analytics](#remove-tracking-analytics) | Kills Facebook auto-init and OneSignal, and opts Firebase Crashlytics/Performance/Analytics out of collection at boot, in Everything Widgets. Widget functionality is unaffected; OneSignal push notifications stop. |  |
| [Spoof Play Store signature](#spoof-play-store-signature) | Forces the Google license (Pairip) verdict branch to LICENSED and neutralizes the license payload's signature verification, so the patched/re-signed Everything Widgets build always passes store validation. |  |
| [Unlock Premium](#unlock-premium) | Bypasses the Google license (Pairip) purchase check of the paid Everything Widgets app: the app runs fully without a Play purchase. Donation SKUs are cosmetic and untouched. |  |

</details>

<a id="app-com-microsoft-office-excel"></a>
<details>
<summary><strong>Excel</strong> · 1 patch</summary>
<br>

**Compatible versions**

| 16.0.20228.20090 |
| :---: |

| Patch | Description | Options |
| :--- | :--- | :--- |
| [Unlock Excel](#unlock-excel) | Removes login requirement, unlocks premium, blocks ads, bypasses signature and code transparency checks. |  |

</details>

<a id="app-org-mozilla-firefox"></a>
<details>
<summary><strong>Firefox</strong> · 2 patches</summary>
<br>

**Compatible versions**

| 158.0.2 |
| :---: |

| Patch | Description | Options |
| :--- | :--- | :--- |
| [Block Firefox telemetry](#block-firefox-telemetry) | IronFox-style hardening: never initializes Glean telemetry, Nimbus experiments, Sentry crash reporting, or Adjust attribution at startup; kills Mozilla-side server traffic during browsing (Firefox Suggest/Merino, sponsored shortcuts/Contile, Pocket feed + sponsored stories, search suggestion streaming incl. private tabs, studies previews); and makes the telemetry toggles in Settings read OFF. Browsing, Sync and add-ons keep working; local-only suggestions untouched. |  |
| [Improve startup performance](#improve-startup-performance) | Skips two launch-time routines whose only job is metrics/experiments upkeep: the 4k-line startup-metrics coroutine (pure telemetry writes, ~64 metric writes per launch) and the forced Nimbus experiment fetch right after first render. Less launch I/O = faster, smoother open/close. Browser features unchanged. |  |

</details>

<a id="app-com-google-android-inputmethod-latin"></a>
<details>
<summary><strong>Gboard</strong> · 2 patches</summary>
<br>

**Compatible versions**

| 18.5.4.993608717-release-arm64-v8a | 18.5.4.993608717-release-armeabi-v7a |
| :---: | :---: |

| Patch | Description | Options |
| :--- | :--- | :--- |
| [Disable Bluetooth voice routing](#disable-bluetooth-voice-routing) | Treats every Bluetooth audio device as an unusable car device so Gboard voice typing keeps using the built-in microphone. |  |
| [Offline-only voice typing & telemetry reduction](#offline-only-voice-typing-telemetry-reduction) | On Gboard 18.5.4.993608717 arm/arm64, routes core voice typing only through the on-device<br>recognizers and returns no recognizer when a local provider/model is unavailable (no<br>online fallback). Disables Agentic Dictation's server/batch retry path, reduces selected<br>metrics/telemetry and disables app backup. INTERNET and unrelated network features are<br>retained; this is best-effort telemetry reduction, not a guarantee of zero Google traffic.<br><br>Requires the appropriate offline speech model/provider to be installed. Without one,<br>voice typing is unavailable by design. Agentic Dictation is disabled. |  |

</details>

<a id="app-com-google-android-apps-photos"></a>
<details>
<summary><strong>Google Photos</strong> · 7 patches</summary>
<br>

**Compatible versions**

| 7.97.0.997578476 |
| :---: |

| Patch | Description | Options |
| :--- | :--- | :--- |
| [AMOLED dark theme](#amoled-dark-theme) | Makes Google Photos dark surfaces true black. |  |
| [Change package name](#change-package-name) | Installs Google Photos beside the system Photos app by changing package, permissions, providers, and app name. | • Package name<br>• App name |
| [Custom branding](#custom-branding) | Adds an option to replace the Google Photos launcher icon. | • Custom icon |
| [Enable DCIM folders backup control](#enable-dcim-folders-backup-control) | Allows controlling Camera and other DCIM folder backup individually. |  |
| [Fix DCIM folder classification](#fix-dcim-folder-classification) | Prevents non-Camera DCIM folders from being grouped as Camera. |  |
| [GmsCore support](#gmscore-support) | Adds MicroG/GmsCore support metadata for Google Photos. |  |
| [Spoof features](#spoof-features) | Spoofs selectable Pixel Photos build and feature flags. | • Pixel profile<br>• Android version<br>• Override ROM feature levels |

</details>

<a id="app-com-ht-news"></a>
<details>
<summary><strong>Hindustan Times</strong> · 3 patches</summary>
<br>

**Compatible versions**

| 4.9.16 |
| :---: |

| Patch | Description | Options |
| :--- | :--- | :--- |
| [Hindustan Times: Block analytics & tracking SDKs](#hindustan-times-block-analytics-tracking-sdks) | Blocks Hindustan Times' analytics & tracking SDKs (Firebase Analytics,<br>AppsFlyer, Adjust, WebEngage, CleverTap and similar) using the same universal<br>heuristic as 'Block analytics & tracking SDKs'.<br><br>Applies to com.ht.news only. Heuristic; obfuscated or reflection-based<br>reporting is not covered. Unverified on device. |  |
| [Hindustan Times: Disable video autoplay (ExoPlayer)](#hindustan-times-disable-video-autoplay-exoplayer) | Stops video autoplay in the Hindustan Times feed/article bodies<br>(ExoPlayer/Media3) using the same heuristic as 'Disable video autoplay<br>(ExoPlayer/Media3)'.<br><br>Applies to com.ht.news only. Heuristic; see the universal entry for<br>limitations. Unverified on device. |  |
| [Hindustan Times: Prefer external browser over Custom Tabs](#hindustan-times-prefer-external-browser-over-custom-tabs) | Opens links in the default external browser instead of an in-app Custom<br>Tab, using the same rewrite as the universal 'Prefer external browser<br>over Custom Tabs' patch.<br><br>Applies to com.ht.news only. Some article WebViews are not affected —<br>this covers Custom Tabs / CustomTabsIntent call sites only.<br>Unverified on device. |  |

</details>

<a id="app-app-simple-inure-play"></a>
<details>
<summary><strong>Inure App Manager</strong> · 1 patch</summary>
<br>

**Compatible versions**

| build107.2.1 |
| :---: |

| Patch | Description | Options |
| :--- | :--- | :--- |
| [Unlock Full Version](#unlock-full-version) | Bypasses the 15-day trial gate and unlocks all premium features in Inure App Manager. |  |

</details>

<a id="app-app-simple-inure"></a>
<details>
<summary><strong>Inure App Manager (GitHub)</strong> · 1 patch</summary>
<br>

**Compatible versions**

| build107.2.4 |
| :---: |

| Patch | Description | Options |
| :--- | :--- | :--- |
| [Inure — Unlock Full Version (GitHub)](#inure-unlock-full-version-github) | Bypasses the 15-day trial gate and unlocks all premium features in Inure App Manager (GitHub). |  |

</details>

<a id="app-org-malwarebytes-antimalware"></a>
<details>
<summary><strong>Malwarebytes Mobile Security</strong> · 1 patch</summary>
<br>

**Compatible versions**

| 5.27.0+564 |
| :---: |

| Patch | Description | Options |
| :--- | :--- | :--- |
| [Unlock Ultimate](#unlock-ultimate) | Unlocks all Malwarebytes Ultimate features via enum singleton and feature gate patches. |  |

</details>

<a id="app-com-meesho-shopping"></a>
<details>
<summary><strong>Meesho</strong> · 3 patches</summary>
<br>

**Compatible versions**

| 29.9 | 29.8 | 29.7 | 29.6 | 29.5 |
| :---: | :---: | :---: | :---: | :---: |

| Patch | Description | Options |
| :--- | :--- | :--- |
| [Meesho: Block analytics & tracking SDKs](#meesho-block-analytics-tracking-sdks) | Blocks Meesho's analytics & tracking SDKs (Firebase Analytics, AppsFlyer,<br>Adjust, Facebook AppEvents, WebEngage, CleverTap and similar) using the<br>same universal heuristic as 'Block analytics & tracking SDKs'.<br><br>Applies to com.meesho.shopping only. Heuristic; obfuscated or<br>reflection-based reporting is not covered. Unverified on device. |  |
| [Meesho: Disable video autoplay (ExoPlayer)](#meesho-disable-video-autoplay-exoplayer) | Stops video autoplay in the Meesho feed and product videos (ExoPlayer/Media3)<br>using the same heuristic as 'Disable video autoplay (ExoPlayer/Media3)'.<br><br>Applies to com.meesho.shopping only. Heuristic; see the universal entry<br>for limitations. Unverified on device. |  |
| [Meesho: Prefer external browser over Custom Tabs](#meesho-prefer-external-browser-over-custom-tabs) | Opens links in the default external browser instead of an in-app Custom<br>Tab, using the same rewrite as the universal 'Prefer external browser<br>over Custom Tabs' patch.<br><br>Applies to com.meesho.shopping only. Covers Custom Tabs /<br>CustomTabsIntent call sites only. Unverified on device. |  |

</details>

<a id="app-app-unnamed-rawrecording"></a>
<details>
<summary><strong>Mereframe</strong> · 4 patches</summary>
<br>

**Compatible versions**

| 0.8.4 |
| :---: |

| Patch | Description | Options |
| :--- | :--- | :--- |
| [Allow re-signed/sideloaded installs](#allow-re-signed-sideloaded-installs) | Neutralizes Mereframe's install-integrity checks so patched (re-signed) builds start normally instead of showing the installation-refused screen. Required for any other patch here to be usable. |  |
| [Bypass native integrity checks](#bypass-native-integrity-checks) | libunnamed_raw.so JNI-throws 'app integrity check failed' on re-signed builds, killing camera session start (preview) - observed via diagnostic crash log. This patch calls the session-opening wrapper inside a real JVM try/catch (extension) and substitutes a well-formed session result on failure. Required together with 'Allow re-signed/sideloaded installs'. |  |
| [Diagnostic crash log](#diagnostic-crash-log) | DIAGNOSTIC ONLY - writes the full stack trace to Downloads/mereframe-crash-*.txt when the app crashes, for remote diagnosis. Off by default; enable when asked to produce a crash log. Chain-forwards to the original crash handler. |  |
| [Unlock Pro features](#unlock-pro-features) | Returns every registered feature from the entitlement accessor (Qu.k) so all Pro gates resolve unlocked. LOCAL client-side effect only. WARNING (kept off by default): on at least one device (realme/Android 16) enabling the single registered Pro feature crashes capture - the Pro pipeline path is gated by this flag and we cannot verify its safety side. Enable only if you specifically want the Pro toolset; the app works fully (RAW capture incl.) with just 'Allow re-signed installs'. |  |

</details>

<a id="app-com-htmedia-mint"></a>
<details>
<summary><strong>Mint</strong> · 3 patches</summary>
<br>

**Compatible versions**

| 5.7.5 | 5.8.4 |
| :---: | :---: |

| Patch | Description | Options |
| :--- | :--- | :--- |
| [Mint: Block analytics & tracking SDKs](#mint-block-analytics-tracking-sdks) | Blocks Mint's analytics & tracking SDKs (Firebase Analytics, AppsFlyer, Adjust,<br>WebEngage, CleverTap and similar) using the same universal heuristic as<br>'Block analytics & tracking SDKs'.<br><br>Applies to com.htmedia.mint only. Heuristic; obfuscated or reflection-based<br>reporting is not covered. Unverified on device. |  |
| [Mint: Disable video autoplay (ExoPlayer)](#mint-disable-video-autoplay-exoplayer) | Stops video autoplay in the Mint feed/article bodies (ExoPlayer/Media3)<br>using the same heuristic as 'Disable video autoplay (ExoPlayer/Media3)'.<br><br>Applies to com.htmedia.mint only. Heuristic; see the universal entry for<br>limitations. Unverified on device. |  |
| [Mint: Prefer external browser over Custom Tabs](#mint-prefer-external-browser-over-custom-tabs) | Opens links in the default external browser instead of an in-app Custom<br>Tab, using the same rewrite as the universal 'Prefer external browser<br>over Custom Tabs' patch.<br><br>Applies to com.htmedia.mint only. Some article WebViews are not affected<br>— this covers Custom Tabs / CustomTabsIntent call sites only.<br>Unverified on device. |  |

</details>

<a id="app-com-mubi"></a>
<details>
<summary><strong>MUBI</strong> · 16 patches</summary>
<br>

**Compatible versions**

| 100.0 | 99.1 |
| :---: | :---: |

| Patch | Description | Options |
| :--- | :--- | :--- |
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

<a id="app-com-pinterest"></a>
<details>
<summary><strong>Pinterest</strong> · 4 patches</summary>
<br>

**Compatible versions**

| 14.41.0 |
| :---: |

| Patch | Description | Options |
| :--- | :--- | :--- |
| [Ad-free feed (remove promoted Pins)](#ad-free-feed-remove-promoted-pins) | Removes promoted/sponsored Pins from every feed, search result, and board list during deserialization, so they never render. Organic pinning, boards and saving are unaffected. |  |
| [Block analytics and data collection](#block-analytics-and-data-collection) | No-ops Firebase screen/event tracking and AppsFlyer attribution + event logging (concrete SDK entry points, verified in 14.41.0). Push notifications keep working; Pinterest features are untouched. |  |
| [Enable media downloads](#enable-media-downloads) | Enables the pin-level image download eligibility flag. Use the separate experimental video download patch for supported video Pins. |  |
| [Enable video download](#enable-video-download) | Experimental: enables the download row on video Pins and saves an available MP4. Streaming-only or unavailable videos are reported instead of saved as images. |  |

</details>

<a id="app-proton-android-pass"></a>
<details>
<summary><strong>Proton Pass</strong> · 5 patches</summary>
<br>

**Compatible versions**

| 1.41.3 |
| :---: |

| Patch | Description | Options |
| :--- | :--- | :--- |
| [Allow screenshots](#allow-screenshots) | Removes FLAG_SECURE from Proton Pass activities, allowing screenshots and screen recording. |  |
| [Disable app lock](#disable-app-lock) | Forces Proton Pass app lock and biometric authentication into the disabled/authenticated state and prevents auto-lock timeouts. |  |
| [Disable clipboard auto-clear](#disable-clipboard-auto-clear) | Forces the clipboard clear delay to Never so copied passwords and aliases are not removed automatically. |  |
| [Suppress telemetry](#suppress-telemetry) | Disables Proton Pass telemetry event dispatch, listeners and repository upload entry points. |  |
| [Unlock Unlimited Plan](#unlock-unlimited-plan) | Forces Proton Pass Plus plan with all limits removed and paid features unlocked. |  |

</details>

<a id="app-proton-android-pass-fdroid"></a>
<details>
<summary><strong>Proton Pass (F-Droid)</strong> · 5 patches</summary>
<br>

**Compatible versions**

| 1.41.3 |
| :---: |

| Patch | Description | Options |
| :--- | :--- | :--- |
| [Allow screenshots](#allow-screenshots) | Removes FLAG_SECURE from Proton Pass activities, allowing screenshots and screen recording. |  |
| [Disable app lock](#disable-app-lock) | Forces Proton Pass app lock and biometric authentication into the disabled/authenticated state and prevents auto-lock timeouts. |  |
| [Disable clipboard auto-clear](#disable-clipboard-auto-clear) | Forces the clipboard clear delay to Never so copied passwords and aliases are not removed automatically. |  |
| [Suppress telemetry](#suppress-telemetry) | Disables Proton Pass telemetry event dispatch, listeners and repository upload entry points. |  |
| [Unlock Unlimited Plan](#unlock-unlimited-plan) | Forces Proton Pass Plus plan with all limits removed and paid features unlocked. |  |

</details>

<a id="app-ch-protonvpn-android"></a>
<details>
<summary><strong>Proton VPN</strong> · 1 patch</summary>
<br>

**Compatible versions**

| 5.19.78.0 |
| :---: |

| Patch | Description | Options |
| :--- | :--- | :--- |
| [Unlock VPN Plus](#unlock-vpn-plus) | Injects max tier (3=PMTeam) into VpnUser at construction for all UI unlocks, while routing connections through free servers for server-side compatibility. Phone and TV |  |

</details>

<a id="app-com-proxyman-proxymanandroid"></a>
<details>
<summary><strong>Proxyman</strong> · 1 patch</summary>
<br>

**Compatible versions**

| 1.21.0 |
| :---: |

| Patch | Description | Options |
| :--- | :--- | :--- |
| [Unlock Lifetime](#unlock-lifetime) | Unlocks all Lifetime features in Proxyman. |  |

</details>

<a id="app-com-reddit-frontpage"></a>
<details>
<summary><strong>Reddit</strong> · 14 patches</summary>
<br>

**Compatible versions**

| 2026.42.0 | 2026.41.0 (experimental) | 2026.40.0 (experimental) | 2026.39.0 (experimental) | 2026.24.0 | 2026.10.0 |
| :---: | :---: | :---: | :---: | :---: | :---: |

| Patch | Description | Options |
| :--- | :--- | :--- |
| [Block AutoMod comments](#block-automod-comments) | Hides all comments from u/AutoModerator, including stickied bot comments. AutoModerator posts are kept. Client-side only; off by default. |  |
| [Content filters](#content-filters) | Adds patch-time keyword, community, author and flair filters for feed posts (optionally comments), and locally bypasses Reddit's NSFW/spoiler/quarantine gates and over-18 account flags. Server-side filtering still applies. Off by default. | • Keywords to hide<br>• Communities to hide<br>• Authors to hide<br>• Flairs to hide<br>• Match mode<br>• Bypass built-in content gates<br>• Also filter comments |
| [Disable Click Tracking](#disable-click-tracking) | Forces the outbound click-tracking account preference off at the Account deserialization choke point (local; server-side click analytics may still be recorded). Enabled by default. |  |
| [Disable Reddit video autoplay](#disable-reddit-video-autoplay) | Forces Reddit's video autoplay preference to 'Never' so videos only play after a tap. Scoped to Reddit; off by default. |  |
| [Employee Debug Flags](#employee-debug-flags) | Spoofs is_employee locally at the Account JSON adapter, exposing Reddit's internal employee/debug UI menus (mostly non-functional without the employee backend, and a few may misbehave — enable for exploration only). Off by default. |  |
| [Hide crossposts](#hide-crossposts) | Hides crossposts in feeds and listings, keeping ordinary posts and comments. Client-side only; off by default. |  |
| [Hide live streams](#hide-live-streams) | Hides live streams and broadcasts in feeds and listings. Client-side only; off by default. |  |
| [Hide read posts](#hide-read-posts) | Hides posts Reddit has marked as read/visited in feeds and listings. Client-side only; off by default. |  |
| [Open Reddit links in external browser](#open-reddit-links-in-external-browser) | Opens outbound Reddit links in the default external browser instead of Reddit's in-app Custom Tab. Falls back to the in-app tab if launching fails. Off by default. |  |
| [Reddit: Diagnostic crash log](#reddit-diagnostic-crash-log) | DIAGNOSTIC ONLY - writes the full stack trace to Downloads/reddit-crash-*.txt when the app crashes, for remote diagnosis. Off by default; enable when asked to produce a crash log. Installs on the first account sync after launch; crashes before that are not captured. Chain-forwards to the original crash handler. |  |
| [Remove ads](#remove-ads) | Hides promoted posts in feeds and banner ads in comment threads. |  |
| [Show deleted posts and comments](#show-deleted-posts-and-comments) | Shows the original text of posts and comments deleted or removed on Reddit, restored at render time from the free Arctic Shift archive (no API key; falls back to PullPush). Only the ids of deleted rows in the listings you open are sent, and restored text is prefixed with [archived]. Coverage depends on the archive; needs network. Off by default. |  |
| [Unlock Account Entitlements](#unlock-account-entitlements) | Locally flips account-gating flags at the Account JSON adapter: can_create_subreddit, can_edit_name, password_set (kills the SSO 'set password' nag) and has_verified_email. Off by default; server entitlements still rule API actions. |  |
| [Unlock Premium](#unlock-premium) | Flips the local isGold/has_gold_subscription account flags at the JSON adapter to enable Reddit Premium UI (custom icons, premium screens). Server-side perks cannot be unlocked. |  |

</details>

<a id="app-com-strava"></a>
<details>
<summary><strong>Strava</strong> · 3 patches</summary>
<br>

**Compatible versions**

| 480.15 | 486.9 |
| :---: | :---: |

| Patch | Description | Options |
| :--- | :--- | :--- |
| [Block analytics and data collection](#block-analytics-and-data-collection) | Stops Strava's Braze telemetry bootstrap (session + engagement tracking, endpoint sdk.iad-07.braze.com) before it is configured. Firebase Analytics collection and Facebook auto event logging are already off in Strava's own manifest; this removes the one tracker pipe that is actually live. Push, GPS, and recording keep working. |  |
| [Force password login (OTP bypass)](#force-password-login-otp-bypass) | Always shows the password login field instead of the OTP code flow. OFF by default: breaks log-in AND sign-up for OTP-only accounts. Enable only if your Strava account has an actual password. |  |
| [Unlock Premium](#unlock-premium) | Unlocks Strava Premium features. |  |

</details>

<a id="app-org-telegram-messenger"></a>
<details>
<summary><strong>Telegram</strong> · 14 patches</summary>
<br>

**Compatible versions**

| 12.10.1 |
| :---: |

| Patch | Description | Options |
| :--- | :--- | :--- |
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

<a id="app-org-telegram-plus"></a>
<details>
<summary><strong>Telegram Plus</strong> · 15 patches</summary>
<br>

**Compatible versions**

| 12.10.1.1 |
| :---: |

| Patch | Description | Options |
| :--- | :--- | :--- |
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

<a id="app-org-telegram-messenger-web"></a>
<details>
<summary><strong>Telegram Web</strong> · 14 patches</summary>
<br>

**Compatible versions**

| 12.10.1 |
| :---: |

| Patch | Description | Options |
| :--- | :--- | :--- |
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

<a id="app-tv-trakt-trakt"></a>
<details>
<summary><strong>trakt.TV Shows &amp; Movies</strong> · 1 patch</summary>
<br>

**Compatible versions**

| 3.26.1 |
| :---: |

| Patch | Description | Options |
| :--- | :--- | :--- |
| [Unlock VIP](#unlock-vip) | Unlocks VIP in trakt.TV Shows & Movies by forcing the parsed User.isVip flag to true (covers no-ads, advanced/saved filters, year-in-review and other local VIP gates). Methods delegating to the primary User constructor are covered automatically. |  |

</details>

<a id="app-com-microsoft-office-word"></a>
<details>
<summary><strong>Word</strong> · 1 patch</summary>
<br>

**Compatible versions**

| 16.0.20228.20090 |
| :---: |

| Patch | Description | Options |
| :--- | :--- | :--- |
| [Unlock Word](#unlock-word) | Removes login requirement, unlocks premium, blocks ads, bypasses signature and code transparency checks. |  |

</details>

<a id="app-com-yatrirailways-yatri"></a>
<details>
<summary><strong>Yatri</strong> · 1 patch</summary>
<br>

**Compatible versions**

| 5.0.6 |
| :---: |

| Patch | Description | Options |
| :--- | :--- | :--- |
| [Unlock VIP](#unlock-vip) | Unlocks Yatri VIP by forcing active plan status and spoofing active plan DB query. |  |

</details>

<a id="universal-patches"></a>
<details>
<summary><strong>Universal patches</strong> · 23 patches</summary>
<br>

| Patch | Description | Options |
| :--- | :--- | :--- |
| [Allow screenshots & screen recording](#allow-screenshots-screen-recording) | Attempts to remove recognizable FLAG_SECURE and secure SurfaceView settings<br>so screenshots and screen recordings can work. Some screens or protection<br>methods may still block capture, including payment or banking screens.<br><br>Applies to any app. Do not combine with "Block screenshots & screen recording". |  |
| [Block Play Billing purchase prompts](#block-play-billing-purchase-prompts) | Removes Google Play Billing purchase-flow calls whose return value is unused,<br>so the purchase sheet does not open.<br><br>Applies to any app using Play Billing. This does not unlock paid features or<br>fake purchases. Best effort: flows that consume the returned BillingResult<br>are skipped. | • Block purchase flows |
| [Block advertising & device IDs](#block-advertising-device-ids) | Makes the Google advertising ID empty, marks ad tracking as limited, and<br>blanks Android ID reads.<br><br>Applies to any app. Features that rely on a stable device identifier may<br>degrade or reset. | • Block advertising ID<br>• Block Android ID |
| [Block analytics & tracking SDKs](#block-analytics-tracking-sdks) | Disables common analytics/tracking SDKs (Firebase Analytics, AppsFlyer, Adjust,<br>Facebook AppEvents, Segment, Amplitude, Mixpanel and similar) by removing their<br>event-reporting calls.<br><br>Heuristic: obfuscated or reflection-based reporting is not covered. Applies to<br>any app. |  |
| [Block cleartext (HTTP) traffic](#block-cleartext-http-traffic) | Sets android:usesCleartextTraffic="false" so the app cannot send plaintext<br>HTTP requests. Breaks apps that still use legacy HTTP endpoints.<br><br>Applies to any app. |  |
| [Block crash-reporting SDKs](#block-crash-reporting-sdks) | Removes reporting calls to Sentry, Firebase Crashlytics, Bugsnag, Datadog,<br>New Relic and AppCenter.<br><br>Applies to any app. Best effort: obfuscated SDKs and calls whose return value<br>is consumed are skipped. Crash reports will no longer reach the developer. | • Block crash reporting |
| [Block in-app update & review prompts](#block-in-app-update-review-prompts) | Stops the app from offering Play Core in-app updates and review prompts.<br>Update availability is reported as unavailable, update flows and completion<br>calls are removed when safe, and review flows are removed when their return<br>value is unused.<br><br>Applies to any app using Google Play Core. Best effort: obfuscated Play Core<br>integrations or review flows that consume the returned Task are not covered. | • Block in-app update prompts<br>• Block in-app review prompts |
| [Block screenshots & screen recording](#block-screenshots-screen-recording) | Attempts to add FLAG_SECURE to activity windows and secure SurfaceViews.<br>This can make screenshots and screen recordings show a black surface.<br>Only recognizable code with available registers can be changed, so this<br>is not a guarantee that all screens or capture methods are protected.<br><br>Applies to any app. Do not combine with "Allow screenshots & screen recording". |  |
| [Block user-added certificate authorities](#block-user-added-certificate-authorities) | Removes user-added certificate authorities from the app's network security<br>config (if it declares one), so the app does not trust certificates installed<br>on the device.<br><br>Applies to any app. No effect if the app has no network security config. |  |
| [Disable PairIP license check](#disable-pairip-license-check) | Disables PairIP license verification: integrity/VM checks, the licensing<br>client and repeated background checks.<br><br>Applies to any app. No effect if the app does not use PairIP. |  |
| [Disable app backup (allowBackup=false)](#disable-app-backup-allowbackup-false) | Sets android:allowBackup="false" so the app's private data is excluded from<br>ADB backups, cloud backups and device-to-device transfers.<br><br>Applies to any app. You lose automatic backup/restore of this app's data. |  |
| [Disable video autoplay (ExoPlayer/Media3)](#disable-video-autoplay-exoplayer-media3) | Stops ExoPlayer/Media3 players from starting on their own by flipping<br>literal 'setPlayWhenReady(true)' call sites to false.<br><br>Applies to any app bundling ExoPlayer/Media3. Heuristic: reflection or<br>obfuscated player setup is not covered. Can stop playback entirely in<br>apps whose only play path is a flipped literal call — turn it off if<br>videos never start. Applies best alongside the per-app Mint/HT entries.<br>Unverified on device. |  |
| [Empty telephony identifiers (IMEI, phone number, SIM)](#empty-telephony-identifiers-imei-phone-number-sim) | Makes TelephonyManager device-identifier getters (IMEI, device ID, phone<br>number, subscriber ID, SIM serial, software version) return an empty string<br>to the app.<br><br>Applies to any app. Features that need the real IMEI/number may degrade. |  |
| [Fix Firebase after re-signing](#fix-firebase-after-re-signing) | Fixes Firebase services (push notifications, Remote Config, Firebase Auth) that break after Morphe re-signs the app with a different certificate.<br><br>Apply with Original app certificate patch — no other config needed. |  |
| [Force offline mode (simulate no network)](#force-offline-mode-simulate-no-network) | Makes connectivity APIs report no active network, no network capabilities and<br>disconnected network info, so apps that check connectivity behave as if the<br>device is offline.<br><br>Applies to any app. This is a best-effort simulation, not a firewall: sockets,<br>HTTP clients and code that ignores connectivity state can still reach the<br>network. | • Simulate offline device |
| [GmsCore support (MicroG)](#gmscore-support-microg) | Routes Google Play Services calls through MicroG instead of real GPS.<br><br>Works for: Google apps (YouTube, Maps, News, Photos) and third-party apps using classic Google Sign-In (Android 13 and below).<br><br>Does not work for: Android 14+ Credential Manager sign-in (most modern third-party apps), Play Integrity / SafetyNet checks, or apps with custom auth.<br><br>Requires MicroG RE installed. Apply with Original app certificate patch. | • MicroG package name<br>• Main activity class (optional)<br>• Custom package name (optional) |
| [Hide developer options & USB debugging](#hide-developer-options-usb-debugging) | Makes the app think Developer Options, USB (ADB) debugging and wireless<br>debugging are disabled, by forcing the settings reads apps use for these<br>checks to return "off" / "0".<br><br>Applies to any app. Only affects what the app itself sees. |  |
| [Prefer external browser over Custom Tabs](#prefer-external-browser-over-custom-tabs) | Opens links in the default external browser instead of an in-app Custom Tab,<br>by rewriting CustomTabsIntent.launchUrl call sites into ACTION_VIEW intents.<br><br>Applies to any app. Some apps rely on the Custom Tab session (shared cookies,<br>return results) and may misbehave. |  |
| [Provide Original app certificate](#provide-original-app-certificate) | Automatically reads the signing certificate from the APK you are patching — no original app installed or file provided needed. Only fill the options below if you are patching an APK that was already re-signed (e.g. a previously patched build): in that case point to the original APK file, or enter the certificate manually. | • Path to original APK (if uninstalled)<br>• Certificate SHA-1 (manual)<br>• Certificate SHA-256 (manual)<br>• Certificate Base64 DER (manual) |
| [Remove dangerous permissions](#remove-dangerous-permissions) | Removes selected permission declarations from an app's manifest. The patch<br>is off by default. When enabled, all category switches start ON, including<br>camera, storage, SMS and notifications. Turn off categories the app needs.<br><br>Permissions to keep always wins. Extra permissions are added to the selected<br>categories. A non-empty advanced list replaces the category selections,<br>except that AdServices remains controlled by its own switch.<br><br>Removing permissions can break features or prevent an app from starting.<br>This does not block every way an app may collect data. | • Package visibility<br>• Phone state & numbers<br>• Accounts<br>• Location<br>• Contacts<br>• Microphone<br>• Camera<br>• Storage & media<br>• SMS<br>• Calendar<br>• Sensors & activity<br>• Nearby devices<br>• Screen-capture detection<br>• Advertising ID<br>• AdServices permissions<br>• Notifications<br>• Permissions to keep<br>• Extra permissions to remove<br>• Advanced: exact removal list |
| [Spoof Widevine / DRM level](#spoof-widevine-drm-level) | Reports Widevine L1 (hardware DRM) to apps that check DRM level locally.<br><br>Useful for apps that refuse to play HD/4K content on L3 devices or after re-signing.<br><br>Does not bypass server-side DRM - Netflix, Disney+ and similar are not affected.<br>Applies to any app; no effect if the app does not query Widevine. | • Widevine security level to report<br>• HDCP level to report |
| [Strip logging (android.util.Log)](#strip-logging-android-util-log) | Removes all android.util.Log calls from the app, so logcat cannot leak<br>URLs, tokens, PII or debug output produced by the app.<br><br>Applies to any app. Safe. |  |
| [WebView hardening](#webview-hardening) | Hardens every WebView in the app with selectable protections: block mixed<br>content, disable local file access, remove JavaScript bridges, block media<br>autoplay, disable geolocation, block third-party cookies and stop JavaScript<br>popups.<br><br>Applies to any app. Web logins or legacy web content may break when bridges,<br>popups or third-party cookies are disabled. Turn off individual switches if<br>a web flow stops working. | • Block mixed content<br>• Disable local file access<br>• Remove JavaScript bridges<br>• Block media autoplay<br>• Disable WebView geolocation<br>• Block third-party cookies<br>• Block JavaScript popups |

</details>

<!-- PATCHES_END -->

## Safety

Every patch is designed to fail safe. The full design and per-patch review are
documented in the **[universal patch audit](UNIVERSAL_PATCH_AUDIT.md)**.

- Heuristic patches default to **off**; unsupported bytecode is skipped, never
  guessed at.
- Patches do not bypass server-side billing, Play Integrity or hardware
  attestation. Premium/unlock patches only change documented client-side checks.
- The bundle contains no secrets and performs no background network activity.
  Network-dependent features are opt-in and described in the relevant docs.
- Review signature, integrity and permission patches before applying them to
  apps you do not trust.

Patches modify third-party applications. Use them only on APKs you are permitted
to modify, and respect each app's terms of service and the laws that apply to you.

## Documentation

| Document | Description |
| :--- | :--- |
| [Documentation index](docs/README.md) | All guides, status notes and triage docs |
| [Universal patches guide](docs/UNIVERSAL-PATCHES.md) | Configuration and permission-patch examples |
| [Universal patch audit](UNIVERSAL_PATCH_AUDIT.md) | Per-patch correctness and UX review |
| [Reddit deleted comments](docs/REDDIT-DELETED-COMMENTS.md) | How archive restore works, limits and privacy |
| [Mereframe](docs/MEREFRAME.md) | Patch status, verification and crash triage |
| [Changelog](CHANGELOG.md) | Release history and notable changes |
| [Community listing](docs/COMMUNITY-LISTING.md) | Using Proteus in community patch indexes |

## Build from source

Requirements: JDK 21 and the Android SDK (platform 36).

```bash
git clone https://github.com/ineednotitle/Proteus-Patches.git
cd Proteus-Patches
./gradlew buildAndroid        # patches/build/libs/patches-<version>.mpp
```

Releases follow [Conventional Commits](https://www.conventionalcommits.org/) and
are published by semantic-release from `main`. Run the verification scripts in
`.github/scripts/` before opening a release-related pull request.

## Contributing

Bug reports and focused pull requests are welcome. Please read
[CONTRIBUTING.md](CONTRIBUTING.md) before opening an issue or PR. Report security
problems privately using [SECURITY.md](SECURITY.md), not in a public issue.

## Acknowledgements

Proteus began as an extension of the Reddit work in
[rushiranpise/morphe-patches](https://github.com/rushiranpise/morphe-patches).
The project is built on the Morphe bundle format and
[morphe-patches-template](https://github.com/MorpheApp/morphe-patches-template).
Thanks to the Morphe team and the patch authors whose work made this possible.

## License

Proteus Patches is licensed under [GPL-3.0-only](LICENSE). The full license is
included in the patch bundle. Third-party GPL-derived work remains subject to its
original attribution notices; see [Brave](docs/BRAVE.md) and
[Pinterest](docs/PINTEREST-VIDEO.md).

Proteus is not affiliated with Morphe, Google, or any application vendor. The
bundle is provided as-is, without warranty. You are responsible for how you use it.
