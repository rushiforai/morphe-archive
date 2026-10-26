# 🧩 sqz patches

[![Release](https://img.shields.io/github/v/release/sqzass/patches?logo=github&color=blue)](https://github.com/sqzass/patches/releases)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](LICENSE)
[![Add to Morphe](https://img.shields.io/badge/Morphe-Add_Source-7C4DFF?logo=android&logoColor=white)](https://morphe.software/add-source?github=sqzass/patches)

Universal and customized patches for Android apps, compatible with [Morphe](https://morphe.software).

## ❓ About

sqz patches is a custom patches bundle for use with the Morphe patcher. It includes universal patches such as permission stripping for enhanced privacy.

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=sqzass/patches

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.8.2](https://github.com/sqzass/patches/releases/tag/v1.8.2)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;37 patches total
<details open>
<summary>🌐 Universal&nbsp;&nbsp;•&nbsp;&nbsp;37 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [AMOLED dark theme force](#amoled-dark-theme-force) | Forces AMOLED theme preference keys to their enabled state and can recolor dark theme values to pure black. | • Force AMOLED Preference<br>• Extra Preference Keys<br>• Recolor To Pure Black<br>• Source Color<br>• Target Color |
| [Ads-free rewards](#ads-free-rewards) | Experimental: reports rewarded ads as loaded and suppresses ad load failure callbacks so reward flows proceed. Granting rewards with no ad shown needs an extension and is not covered. | • Force Ad Ready<br>• Suppress Load Failures |
| [Allow screenshots and screen recording](#allow-screenshots-and-screen-recording) | Removes preview hiding, capture restrictions, FLAG_SECURE flags, and detection callbacks. | • Enable Recent App Previews<br>• Remove Capture Restrictions<br>• Remove FLAG_SECURE<br>• Bypass Screenshot Detection |
| [Bypass PairIP protection](#bypass-pairip-protection) | Defeats Google Play's PairIP guard: restores the original application class so the protection gate never starts, deletes libpairipcore.so, and strips PairIP components. | • Restore Application Class<br>• Delete Native Core<br>• Strip PairIP Components |
| [Bypass Play Integrity](#bypass-play-integrity) | Experimental: forces client-side Play Integrity verdict checks to report success. Integrity tokens validated on a server cannot be forged offline, so server-gated features stay gated. | • Force Verdict Reads<br>• Force Verdict Methods |
| [Bypass Play licensing](#bypass-play-licensing) | Makes licensing checks report success: forces licensing policy responses to licensed and suppresses denial callbacks. Server-side license verification cannot be bypassed this way. | • Force Licensed Response<br>• Suppress Denial Callbacks |
| [Bypass anti-tamper checks](#bypass-anti-tamper-checks) | Defeats common anti-tamper checks: reports the Play Store as installer, forces signature comparisons to report a match, and can make signature digest methods report an intact app. | • Spoof Installer Package<br>• Force Signature Checks<br>• Force Digest Checks Valid |
| [Bypass root and debugger checks](#bypass-root-and-debugger-checks) | Reports the debugger as disconnected, hides root indicator files from existence checks. Works only on common detection methods. | • Bypass Debugger Checks<br>• Bypass Root File Checks |
| [Change package name](#change-package-name) | Renames the app package: rewrites the manifest package, components, and authorities plus matching dex strings, and can report the original package to the app. Permissions are stripped, never renamed. Binary assets referencing the package are left untouched. | • New Package Name<br>• Rewrite Manifest<br>• Strip Permissions |
| [Change package name (dex)](#change-package-name-dex) | Rewrites matching package string constants in dex code and can report the original package to the app. | • Original Package Name<br>• New Package Name<br>• Rewrite Dex Strings<br>• Hook getPackageName |
| [Cross-signal location consistency](#cross-signal-location-consistency) | Returns no Wi-Fi scan or cell tower data so location cross-checks against Wi-Fi fingerprints and cell IDs cannot contradict the spoofed position. | • Suppress Wi-Fi Scans<br>• Suppress Cell Info |
| [Custom app name](#custom-app-name) | Replaces the application label shown in the launcher with a custom name. | • App Name<br>• Override Activity Labels |
| [Custom font](#custom-font) | Injects a custom TTF/OTF/WOFF2 font file into the app and rewrites every android:fontFamily and app:fontFamily attribute across resource XMLs to use it. Requested in https://github.com/sqzass/patches/issues/5. | • Font File Path<br>• Rewrite Font Attributes<br>• Set Application-level Font |
| [DexGuard string decrypt hook](#dexguard-string-decrypt-hook) | Experimental, apply last: detects likely string decryptor methods and forces their results to empty so obfuscated string flows stay non-null. Server-driven or native decryptors are not covered. | • Log Only<br>• Force Empty Strings |
| [Disable Play Protect hooks](#disable-play-protect-hooks) | Strips APK-side verify hooks: removes package verification intent filters and verifier roles. Play Protect verdicts computed inside Google Play services cannot be changed from the app. | • Strip Verification Filters<br>• Strip Verifier Roles |
| [Disable analytics collection](#disable-analytics-collection) | Disables Firebase Analytics, Crashlytics, and Performance Monitoring data collection. | • Disable Firebase Analytics<br>• Disable Crashlytics<br>• Disable Performance Monitoring |
| [Disable boot start-up](#disable-boot-start-up) | Removes boot intent filters so the app cannot start itself when the device boots. | • Remove Boot Intent Filters |
| [Enable app backups](#enable-app-backups) | Allows the app to back up its data. | • Enable Backups<br>• Remove Backup Rules |
| [Enable debugging and inspection](#enable-debugging-and-inspection) | Enables debugging flags, trusts user CA certificates, permits cleartext traffic for proxy inspection, and strips test-only restrictions in the application manifest. | • Enable Debugging<br>• Trust User Certificates<br>• Allow Cleartext Traffic<br>• Remove Test-Only Flag |
| [Free in-app purchases](#free-in-app-purchases) | Grants device-local purchases: forces purchase state to purchased, acknowledgements to true, and owned-item preference reads to true. Network-verified purchases stay gated. | • Force Purchased State<br>• Force Acknowledged<br>• Force Owned Keys |
| [GMS check strip](#gms-check-strip) | Makes the app run without Google Play services: forces availability checks to succeed, suppresses error dialogs, and strips GMS package visibility. A lighter alternative to MicroG, which is heavier but more stable. | • Force Availability Success<br>• Suppress Error Dialogs<br>• Strip GMS Package Visibility |
| [Hide app icon](#hide-app-icon) | Removes MAIN/LAUNCHER intent filters so the app no longer appears in launcher app lists. | • Remove Launcher Entry |
| [Mask developer options and ADB state](#mask-developer-options-and-adb-state) | Hides developer state: reports adb_enabled and development settings as off and forces debug-revealing system properties to production values. | • Mask ADB State<br>• Mask Developer Settings<br>• Mask Debug System Properties |
| [MicroG support](#microg-support) | Adapts the app for MicroG: forces Play services availability checks to succeed, suppresses error dialogs, and drops the GMS client version check. MicroG is heavier than stripping GMS checks alone but more stable. | • Force Availability Success<br>• Suppress Error Dialogs<br>• Remove GMS Version Meta |
| [Mock Play Billing client](#mock-play-billing-client) | Mocks Play Billing client state: reports the client ready, feature checks as supported, and suppresses acknowledge, consume, and disconnect calls. Purchase query results cannot be fabricated without an extension. | • Force Billing Ready<br>• Force Feature Supported<br>• Suppress Consume Calls |
| [Open links in browser](#open-links-in-browser) | Stops http and https links from opening inside the app. | • Remove App Link Verification<br>• Remove Link Intent Filters |
| [Spoof GPS](#spoof-gps) | Reports fixed coordinates: forces Location latitude, longitude, and related getter results to the configured position. | • Latitude<br>• Longitude<br>• Spoof Accuracy<br>• Accuracy (meters)<br>• Spoof Altitude<br>• Altitude (meters)<br>• Spoof Provider Name |
| [Spoof device information](#spoof-device-information) | Presents a different device entirely: rewrites Build identity field reads, forces matching system property reads, and overrides telephony operator and SIM identity getters using device and SIM presets. | • Device Preset<br>• SIM Preset<br>• Spoof Build Identity<br>• Spoof SIM Identity<br>• Spoof Device IDs |
| [Spoof install location](#spoof-install-location) | Reports internal storage as the install location, matching the Play Store default. | • Set Manifest Install Location<br>• Spoof Install Location Reads |
| [Spoof network transport type](#spoof-network-transport-type) | Reports a Wi-Fi connection: forces transport capability flags, hides the VPN transport, and overrides NetworkInfo type readings. | • Force Wi-Fi Transport<br>• Force Cellular Transport<br>• Hide VPN Transport |
| [Strip VPN checks](#strip-vpn-checks) | Defeats VPN detection: reports VpnService.prepare as no consent required, the VPN transport flag as unset, and VPN string tests as false. | • Bypass VpnService.prepare<br>• Bypass VPN Transport Flag<br>• Bypass VPN String Checks |
| [Strip mock location flags](#strip-mock-location-flags) | Reports Location.isMock and isFromMockProvider as false and forces mock location settings reads to report disabled. | • Bypass Location Mock APIs<br>• Bypass Mock Location Settings |
| [Strip sensitive permissions](#strip-sensitive-permissions) | Removes sensitive Android permissions from the application. | • Strip Camera<br>• Strip Microphone<br>• Strip Location<br>• Strip Sensors<br>• Strip Contacts<br>• Strip Phone & SMS<br>• Strip Calendar<br>• Strip Storage & Media<br>• Strip Nearby Wi-Fi<br>• Strip Overlay Access<br>• Strip Special Access<br>• Remove Queries Declarations<br>• Remove QUERY_ALL_PACKAGES Permission |
| [Strip trackers and telemetry](#strip-trackers-and-telemetry) | Strips tracking, analytics, and advertising SDK components from the manifest, and their runtime calls. | • Google & Firebase Analytics<br>• Facebook SDK<br>• Attribution SDKs<br>• Crash Reporting SDKs<br>• Advertising ID & AdServices<br>• Tracker SDK Calls |
| [Universal cleanup](#universal-cleanup) | Debloats the app: removes debug and tracking components, extra locales, and stale install files. ABI splits, density filtering, and asset size filtering are not covered. | • Strip Debug Components<br>• Strip GMS Components<br>• Strip Extra Locales<br>• Keep Locales |
| [Unlock premium](#unlock-premium) | Enables premium features locally: forces premium status getters to report true and premium preference reads to report enabled. Server-side entitlements stay gated. | • Force Premium Getters<br>• Force Premium Preferences<br>• Extra Premium Keys |
| [Unlock screen orientation](#unlock-screen-orientation) | Forces orientation unlock on apps that force an orientation. | • Remove Orientation Locks |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop) like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

sqz patches are licensed under the [GNU General Public License v3.0](LICENSE)
