# DanielTheManiel's Morphe Patches

Made for me, with the help of AI

## ❓ About

Patches for apps I like.

<!-- TODO: Update this about section with a brief introduction/summary about this repo and what it offers. -->

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=Dan1elTheMan1el/Morphe-Patches

## 🩹 Patches list

<!-- PATCHES_START -->
> **[v1.3.0](https://github.com/Dan1elTheMan1el/Morphe-Patches/releases/tag/v1.3.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;14 patches total
<details open>
<summary>📦 PokeRaid - for Pokémon GO Raid&nbsp;&nbsp;•&nbsp;&nbsp;7 patches</summary>
<br>

**🎯 Supported versions:**

| 0.48.9 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Bounty Daily Reward Shortcut](#bounty-daily-reward-shortcut) | Tap Bounty to open Daily Reward; long press it to open Bounty. |  |
| [Daily Reward Background Status & Auto-Claim](#daily-reward-background-status-auto-claim) | Checks daily reward eligibility and automatically claims it (bypassing ads) if available. Invoke by sending intent as broadcast, with action app.danielthemaniel.pokeraid.CHECK_DAILY_REWARD, and package me.pokeraid. |  |
| [Disable Ads](#disable-ads) | Disables ads locally using PokeRaid's built-in Disabled ad strategy. |  |
| [Disable Analytics](#disable-analytics) | Disables Firebase Analytics, Crashlytics, Performance Monitoring, and Advertising ID collection while preserving app functionality. |  |
| [Hide News Banners](#hide-news-banners) | Hides PokeRaid announcement carousels without breaking Data Binding. |  |
| [Material You Theme](#material-you-theme) | Uses Android 12+ wallpaper-derived Material You colors throughout PokeRaid while preserving semantic status and raid-type colors. |  |
| [Quick Join Button](#quick-join-button) | Adds an optimistic JOIN button to room cards using PokeRaid's stock authenticated join request. |  |

</details>

<details open>
<summary>📦 DeFit&nbsp;&nbsp;•&nbsp;&nbsp;5 patches</summary>
<br>

**🎯 Supported versions:**

| 0.8.2a |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Custom Branding](#custom-branding) | Changes DeFit's app name, header title, and displayed version. | • App name<br>• Top bar text<br>• Version |
| [Login Fix Tutorial](#login-fix-tutorial) | Adds an in-app Google Fit login setup guide and a button to copy the installed APK's signing SHA-1. |  |
| [Material You Theme](#material-you-theme) | Uses Android 12+ wallpaper-derived colors and enables safe system Force Dark without changing DeFit's AppCompat theme parent. |  |
| [Remove Bottom Banner Ad](#remove-bottom-banner-ad) | Removes DeFit's bottom banner-ad container from the main layout. |  |
| [Unlimited Time Bypass](#unlimited-time-bypass) | Removes the ad requirement and grants maximum active time when the button is pressed. |  |

</details>

<details open>
<summary>📦 Custom Keyboard Designer&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 5.B8.8 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Start with PokeGenie keyboard](#start-with-pokegenie-keyboard) | Adds my PokeGenie-inspired keyboard design on fresh setup and makes it the portrait text-input default. |  |
| [Unlock Premium](#unlock-premium) | Unlocks all premium features, extended design package, and extended keyboard package. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

DanielTheManiel's Morphe Patches are licensed under the [GNU General Public License v3.0](LICENSE)
