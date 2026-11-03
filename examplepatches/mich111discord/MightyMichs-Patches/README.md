# MightyMich's Patches 🩹
[![build](https://img.shields.io/badge/build-passing-brightgreen)](https://github.com)
[![License](https://img.shields.io/badge/License-GPL_v3-yellow.svg)](https://opensource.org/licenses/GPL-3.0)
[![GitHub All Releases](https://img.shields.io/github/downloads/mich111discord/MightyMichs-Patches/total)](https://github.com/mich111discordMightyMichs-Patches/releases)

[![Latest Release](https://img.shields.io/github/v/release/mich111discord/Mightymichs-Patches?style=for-the-badge&color=blueviolet&logo=github)](https://github.com/mich111discord/Mightymichs-Patches/releases/latest)
[![Kotlin](https://img.shields.io/badge/Kotlin-0095D5?style=for-the-badge&logo=kotlin&logoColor=white)](https://kotlinlang.org)
[![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)](https://www.oracle.com/java/)

## ❓ About

Patches for the best apps from Playstore🛍️

<!-- TODO: Update this about section with a brief introduction/summary about this repo and what it offers. -->

### How to use these patches 🤔
Click The image below.

<a href="https://morphe.software/add-source?github=mich111discord/MightyMichs-Patches"><img src="https://mightymich.web1337.net/src/img/MightyMichs-Patches/Add-to-Morphe-badge-1.png" alt="Add to Morphe" height="300"></a>


Or

[Download MPP](https://mightymich.web1337.net/Projekty/MightyMichs-Patches/download/latest/mpp?from=github)

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.13.0](https://github.com/mich111discord/MightyMichs-Patches/releases/tag/v1.13.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;58 patches total
<details open>
<summary>📦 SofaScore&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 26.09.21 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Bypass Login Requirements](#bypass-login-requirements) | Skips SofaScore login requirement by forcing isLoggedIn to true. |  |
| [Unlock Premium & Remove Ads](#unlock-premium-remove-ads) | Unlocks SofaScore premium and disables ads. |  |

</details>

<details open>
<summary>📦 MiXplorer&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**🎯 Supported versions:**

| 6.71.15 | 6.71.14 | 6.71.12 | 6.71.10 |
| :---: | :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable signature verification](#disable-signature-verification) | Allows re-signed MiXplorer builds by adding the installed signing cert fingerprint to the internal allow-list. |  |
| [Hide browser Download component](#hide-browser-download-component) | Removes DownloadActivity intent-filters so MiXplorer is not offered in browser/Firefox download choosers. |  |
| [Limit Copy to share menu](#limit-copy-to-share-menu) | Removes CopyActivity VIEW filters (open-with) while keeping SEND filters so Copy remains in the system share menu. |  |
| [Remove HTTP/HTTPS intent filters](#remove-http-https-intent-filters) | Strips http/https schemes from VIEW/BROWSABLE intent-filters so MiXplorer is not offered for web links. |  |

</details>

<details open>
<summary>📦 ESET Mobile Security&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 🧪&nbsp;12.0.17.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Enable premium license](#enable-premium-license) | Best-effort unlock of ESET premium UI / client-side license flags. Native libems + server checks may still limit some features. |  |

</details>

<details open>
<summary>📦 InShot&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 2.214.1539 | 2.243.1555 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Fix video engine on re-sign](#fix-video-engine-on-re-sign) | Stops the bundled video engine library from terminating the process when the APK is re-signed. Covers arm64-v8a and armeabi-v7a copies of libisvideoengine.so so the editor can load after a custom signature. |  |
| [Unlock Premium](#unlock-premium) | Enables InShot Pro entitlements offline: export without watermark, no interstitial ads, and access to paid effects, transitions, stickers and HD. Built-in AI features that validate the store signature in native code may still refuse a re-signed package. |  |

</details>

<details open>
<summary>📦 TikTok&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 47.4.3 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Force region](#force-region) | Forces TikTok store_region-related getters to a chosen ISO country code. | • Region (ISO country) |
| [Remove ads](#remove-ads) | Disables common TikTok ad load/show methods (best-effort). |  |

</details>

<details open>
<summary>📦 Nova Launcher&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 7.0.58 | 8.0.8 | 8.8.8 |
| :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Remove Internet permission (Nova)](#remove-internet-permission-nova) | Removes INTERNET permission from Nova Launcher and disables network-only entry points so Nova does not crash. |  |
| [Unlock Prime](#unlock-prime) | Unlocks Nova Launcher Prime by bypassing the static (isPrime) gate. WARNING: May cause crashes. |  |

</details>

<details open>
<summary>📦 SideMe&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 1.19.5 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlimited Energy](#unlimited-energy) | Bypasses energy limits so lessons can be started freely (bonus QoL). |  |
| [Unlock Premium](#unlock-premium) | Unlocks SideMe Super / Premium subscription features. |  |

</details>

<details open>
<summary>📦 Pou&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 1.4.139 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlimited coins](#unlimited-coins) | Forces Pou's coin balance getter to a very large value so shop and unlock checks always pass (local save). |  |
| [Unlock everything](#unlock-everything) | Sets shop item prices to zero and relaxes lock UI gates so items can be obtained freely (works best with Unlimited coins). |  |

</details>

<details open>
<summary>📦 Adobe Lightroom&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 9.1.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Lightroom Premium](#unlock-lightroom-premium) | Unlocks Adobe Lightroom Premium by forcing the subscription check to return true. |  |

</details>

<details open>
<summary>📦 MX Player Pro&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 🧪&nbsp;1.93.4 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock MX Player Pro](#unlock-mx-player-pro) | Unlocks MX Player Pro by disabling ads and forcing pro status. |  |

</details>

<details open>
<summary>📦 Adobe Photoshop&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.7.0.2322 | 🧪&nbsp;1.7.0 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Photoshop Premium](#unlock-photoshop-premium) | Forces local Adobe Photoshop entitlement checks to paid/ENTITLED. Cloud-only features may still require a server-side Adobe subscription. |  |

</details>

<details open>
<summary>📦 Call Filter&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.50.2 | 🧪&nbsp;1.50.1 | 🧪&nbsp;1.50.0 |
| :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium](#unlock-premium) | Forces Call Filter local subscription flag isSubscribed to true (SharedPreferences reads + persist on app start). |  |

</details>

<details open>
<summary>📦 VivaCut&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 3.9.9 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium](#unlock-premium) | Unlocks VivaCut Pro by forcing IapService.F()Z to return true. WARNING: May cause crashes. |  |

</details>

<details open>
<summary>📦 MagoVideo&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 5.7.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium](#unlock-premium) | Unlocks MagoVideo premium / VIP (no watermark, pro features). |  |

</details>

<details open>
<summary>📦 PhotoApp&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 2.8.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium ](#unlock-premium) | Unlocks PhotoApp Premium by forcing UserViewModel.isPremium to true. WARNING: May cause crashes. |  |

</details>

<details open>
<summary>📦 Remini&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium (Experimental)](#unlock-premium-experimental) | Unlocks Remini premium by forcing 'isFreeUser' to true. WARNING: May cause crashes or unexpected behavior. |  |

</details>

<details open>
<summary>📦 Polarr&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 6.12.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium (Experimental)](#unlock-premium-experimental) | Unlocks Polarr Premium by forcing isPremium to true. WARNING: May cause crashes. |  |

</details>

<details open>
<summary>📦 Camera Opus Companion&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 🧪&nbsp;1.2.21 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium (Experimental)](#unlock-premium-experimental) | Unlocks Camera Opus Companion premium by forcing the license check to return true. WARNING: May cause crashes. |  |
| [Wear Engine Scope Fix (Experimental)](#wear-engine-scope-fix-experimental) | Fixes Wear Engine scope authorization errors by forcing the error code check to succeed. WARNING: May cause crashes. |  |

</details>

<details open>
<summary>📦 Photex Companion&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium (Experimental)](#unlock-premium-experimental) | Unlocks Photex Companion premium by forcing the license check to return true. WARNING: May cause crashes. |  |
| [Wear Engine Scope Fix (Experimental)](#wear-engine-scope-fix-experimental) | Fixes Wear Engine scope authorization errors in Photex Companion by forcing the error code check to succeed. WARNING: May cause crashes. |  |

</details>

<details open>
<summary>📦 Audio Editor&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 2.01.64.0916 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium Features](#unlock-premium-features) | Forces the purchase verification method to always return true, unlocking premium features in Audio Editor. |  |

</details>

<details open>
<summary>📦 Calendar&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 2.07.34.0918 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium Features](#unlock-premium-features) | Forces the purchase verification method to always return true, unlocking premium features in Calendar. |  |

</details>

<details open>
<summary>📦 记账助手&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 3.16.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium Features](#unlock-premium-features) | Unlocks permanent VIP in the accounting app. |  |

</details>

<details open>
<summary>📦 ReelShort&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 4.2.20 | 🧪&nbsp;4.2.00 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium Features](#unlock-premium-features) | Forces local VIP membership (status, type, expire) and unlocks ad/paywall episode flags. Server-side purchases are not forged. |  |

</details>

<details open>
<summary>📦 Screen Translate&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 7.5.00112 | v7.5.00112 | 7.3.10123 | v7.3.10123 |
| :---: | :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium Features](#unlock-premium-features) | Unlocks Screen Translate Premium. |  |

</details>

<details open>
<summary>📦 TrebEdit&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 3.6.7 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium Features](#unlock-premium-features) | Unlocks TrebEdit premium by forcing the premium check to return true.  |  |

</details>

<details open>
<summary>📦 Arc Player&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.3.4 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium Features](#unlock-premium-features) | Unlocks Arc Player premium by forcing isPremiumUser to return true. |  |

</details>

<details open>
<summary>📦 My Diary&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.04.16.0813 | 1.04.17.0918 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium Features](#unlock-premium-features) | Forces the purchase verification method to always return true, unlocking premium features in My Diary. |  |

</details>

<details open>
<summary>📦 Music Player&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.02.165.0923 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium Features](#unlock-premium-features) | Forces the purchase verification method to always return true, unlocking premium features in Music Player. |  |

</details>

<details open>
<summary>📦 Ringtone Maker: Music Cutter&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.01.99.0909 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium Features](#unlock-premium-features) | Forces the purchase verification method to always return true, unlocking premium features in Ringtone Maker. |  |

</details>

<details open>
<summary>📦 To-Do List&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.02.94.0925 | 1.03.38.0924 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium Features](#unlock-premium-features) | Forces the purchase verification method to always return true, unlocking premium features in To-Do List. |  |

</details>

<details open>
<summary>📦 Voice Changer&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.02.111.0915 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium Features](#unlock-premium-features) | Forces the purchase verification method to always return true, unlocking premium features in Voice Changer.  |  |

</details>

<details open>
<summary>📦 Days Matter&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 2.0.57 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Pro Features](#unlock-pro-features) | Unlocks Days Matter Pro by forcing the pro flag to true. |  |

</details>

<details open>
<summary>📦 Device Info&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| v3.2.3.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Pro Features](#unlock-pro-features) | Forces the 'is_pro_user' check to always return true, unlocking Pro features in Device Info. |  |

</details>

<details open>
<summary>📦 Music Pitcher Radio&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.43 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Pro Features](#unlock-pro-features) | Forces 'proActivated' and 'subscriptionActivated' to true, unlocking Pro features in Music Pitcher Radio. |  |

</details>

<details open>
<summary>📦 Video Guru&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 🧪&nbsp;1.371.93 | 🧪&nbsp;1.621.196 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Pro Features](#unlock-pro-features) | Unlocks Pro features in Video Guru by forcing the premium check method a()Z to return true. |  |

</details>

<details open>
<summary>📦 Huanxiu Sleep&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 3.14.8 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock SVIP Features](#unlock-svip-features) | Unlocks Huanxiu SVIP by forcing getSvipStatus to return 3 (SVIP). |  |

</details>

<details open>
<summary>📦 Telegram&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 12.10.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Telegram Premium](#unlock-telegram-premium) | Unlocks Telegram Premium features by forcing isPremium() to return true. |  |

</details>

<details open>
<summary>📦 Wearfit Pro&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 5.5.83 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock VIP Features](#unlock-vip-features) | Unlocks VIP features in Wearfit Pro by forcing getIsVip() to return 1. |  |

</details>

<details open>
<summary>🌐 Universal&nbsp;&nbsp;•&nbsp;&nbsp;9 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Bypass in-app purchase](#bypass-in-app-purchase) | Best-effort local Play Billing bypass for offline games (Purchase state = PURCHASED, acknowledged = true). Does not defeat server-side validation. |  |
| [Change app name](#change-app-name) | Sets a custom application / launcher display name (strings.xml + manifest labels). | • App name |
| [Change package name](#change-package-name) | Appends ".mightymich" to the package name by default. Changing the package name of the app can lead to unexpected issues. | • Package name<br>• Update permissions<br>• Update providers |
| [Change version code](#change-version-code) | Overrides android:versionCode (and optional versionName). | • Version code<br>• Version name |
| [Disable ads (basic)](#disable-ads-basic) | Best-effort no-op of common ad SDK load/show methods. |  |
| [Disable all telemetry](#disable-all-telemetry) | Best-effort disable of Firebase/AppsFlyer/Mixpanel/Segment style track methods. |  |
| [Disable screenshot restriction](#disable-screenshot-restriction) | Best-effort bypass of FLAG_SECURE screenshot blocks. |  |
| [Remove INTERNET permission](#remove-internet-permission) | Removes INTERNET / ACCESS_NETWORK_STATE permissions from the manifest. |  |
| [Spoof device & network](#spoof-device-network) | Spoofs device model/manufacturer, hides common root/emulator signals, and can force simple in-app network type checks. | • Device model<br>• Manufacturer<br>• Hide root<br>• Hide emulator<br>• Connection type |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License
MightyMich (mich111discord) Patches are licensed under the [GNU General Public License v3.0](LICENSE)
