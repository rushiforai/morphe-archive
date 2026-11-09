<div align="center">

# 🧩 Morphe Patches for Polish Apps

[Morphe](https://morphe.software) patches for Android apps popular in Poland.

[![Release](https://img.shields.io/github/v/release/RikoDEV/morphed-pl?style=flat-square)](https://github.com/RikoDEV/morphed-pl/releases/latest)
[![Build](https://img.shields.io/github/actions/workflow/status/RikoDEV/morphed-pl/release.yml?branch=main&style=flat-square)](https://github.com/RikoDEV/morphed-pl/actions)
[![License: GPL v3](https://img.shields.io/badge/license-GPLv3-blue?style=flat-square)](LICENSE)

**[➕ Add to Morphe](https://morphe.software/add-source?github=RikoDEV/morphed-pl)** · [Releases](https://github.com/RikoDEV/morphed-pl/releases) · [Issues](https://github.com/RikoDEV/morphed-pl/issues)

</div>

> [!WARNING]
> - **No affiliation.** This is an independent community project. It is not affiliated with, endorsed by any app developer, or the Morphe project.
> - **Trademarks.** Yanosik, Orange, InPost, Żabka, Android Auto and all other product names, logos and brands belong to their respective owners. They are used here only to say which apps the patches work with.
> - **No app files.** This repository contains only patch code. It **does not** host or distribute any original or modified APKs. You need to get the app yourself from an official source.
> - **Your responsibility.** Modifying an app may break its terms of service, and some patches, change how paid features are offered. You are responsible for making sure your use follows the app's terms. If you find the app useful, consider supporting its developer.
> - **Road safety.** Patched apps may behave differently from the original, including alerts and Android Auto behaviour. Don't rely on them alone, follow traffic rules, and don't handle your phone while driving.
> - **No warranty.** The patches are provided "as is", without any warranty, as described in sections 15 and 16 of the GPLv3. The authors are not liable for any damage, data loss, account bans or other consequences of using them.

## 🚀 Quick start

1. Install [Morphe](https://morphe.software).
2. Open **[this link](https://morphe.software/add-source?github=RikoDEV/morphed-pl)** to add the patch source.
3. Pick the app, select the patches you want and patch it.

## 💊 Patches

| App | Package |
| --- | --- |
| Yanosik | `pl.neptis.yanosik.mobi.android` |
| Mój Orange | `pl.orange.mojeorange` |
| InPost Mobile | `pl.inpost.inmobile` |
| Żappka | `pl.zabka.apb2c` |

All patches are enabled by default.

<!-- PATCHES_START EXPANDED -->
> **[v1.6.1](https://github.com/RikoDEV/morphed-pl/releases/tag/v1.6.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;17 patches total
<details open>
<summary>📦 Yanosik&nbsp;&nbsp;•&nbsp;&nbsp;6 patches</summary>
<br>

**🎯 Supported versions:**

| 26.9.0 | 26.10.0 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Block Yanosik telemetry](#block-yanosik-telemetry) | Blocks analytics, crash reporting, usage statistics, the notiOne SDK and Wi-Fi/cell tower data collection. Location reporting for POI alerts and traffic keeps working. |  |
| [Bypass Android Auto certificate checks](#bypass-android-auto-certificate-checks) | Bypasses the Car App Library host certificate validation so Yanosik works on Android Auto. |  |
| [Home screen dark mode](#home-screen-dark-mode) | Makes the home screen follow the system light or dark theme. |  |
| [Remove Yanosik ads](#remove-yanosik-ads) | Removes banner ads, splash/start adverts, voice adverts, advert-based navigation POIs and selects the ad-free map style. |  |
| [Remove Yanosik radio](#remove-yanosik-radio) | Removes the built-in Radio Yanosik from the main screen and the map button. |  |
| [Unlock Yanosik PRO](#unlock-yanosik-pro) | Reports an active premium entitlement and unlocks the PRO-only settings (view after launch, floating icon). |  |

</details>

<details open>
<summary>📦 eduVULCAN&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 26.08.00 (G) |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Block eduVULCAN telemetry](#block-eduvulcan-telemetry) | Blocks Firebase Analytics, Crashlytics, Performance and Sessions, plus the built-in Mnemos usage tracker. Push notifications and Firebase Remote Config keep working. |  |
| [Unlock premium](#unlock-premium) | Reports an active Premium capability on every student account and removes the premium lock overlays. Billing and the store stay available. |  |

</details>

<details open>
<summary>📦 InPost Mobile&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 4.23.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Block telemetry](#block-telemetry) | Blocks app analytics, Firebase Analytics, Crashlytics and Performance, Microsoft Clarity session recording, Adjust, Facebook app events and Synerise event tracking. |  |
| [Hide Von Halsky](#hide-von-halsky) | Removes Von Halsky shopping: the Kupuj tab, the home search box, and the banners and promotions in parcel lists, details, the cart and the More menu. |  |
| [Hide promotional banners](#hide-promotional-banners) | Removes the promotional banner carousel from the home screen. |  |

</details>

<details open>
<summary>📦 Mój Orange&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**🎯 Supported versions:**

| 5.153.0.87591 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Block telemetry](#block-telemetry) | Blocks Firebase Analytics and Crashlytics, Quantum Metric session replay, AppsFlyer, Synerise event tracking and sponsored offer reporting. |  |
| [Hide notification prompt](#hide-notification-prompt) | Stops the popup asking to turn on notifications. |  |
| [Hide offer carousels](#hide-offer-carousels) | Removes the offer carousels from the home screen. |  |
| [Hide stories](#hide-stories) | Removes the Instagram-style stories row at the top of the home screen. |  |

</details>

<details open>
<summary>📦 Żappka&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 4.50.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Block telemetry](#block-telemetry) | Blocks the Żabka CDP event pipeline (device, root, network and carrier data attached to every event), Sentry, AppsFlyer, Synerise event tracking, Firebase Analytics, Facebook app events and Google datatransport uploads. |  |
| [Spoof signing certificate](#spoof-signing-certificate) | Reports Żabka's original signing certificate to Firebase, so login works after the app is re-signed by patching. |  |

</details>

<!-- PATCHES_END -->

> [!NOTE]
> **Bypass Android Auto certificate checks** also needs [Android-Auto-XLauncher-Unlocked](https://github.com/Rikj000/Android-Auto-XLauncher-Unlocked) (root + LSPosed). See [#2](https://github.com/RikoDEV/morphed-pl/issues/2).

## 🛠️ Development

### Building

```sh
./gradlew buildAndroid
```

The patch bundle is written to `patches/build/libs/patches-*.mpp`. Apply it with [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop) or the Morphe CLI:

```sh
java -jar cli.jar patch --patches patches-*.mpp Yanosik_26.10.0.apkm
```

> [!IMPORTANT]
> The `app.morphe.patches` Gradle plugin comes from the Morphe GitHub Packages registry, so you need a personal access token with `read:packages`. Set it as the `gpr.user` / `gpr.key` Gradle properties or the `GITHUB_ACTOR` / `GITHUB_TOKEN` environment variables. See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation).

### Adding an app

1. Add a `Compatibility` constant for the app in [`shared/Constants.kt`](patches/src/main/kotlin/app/polishapps/patches/shared/Constants.kt).
2. Create `patches/src/main/kotlin/app/polishapps/patches/<app>/`.
3. Write the patches there, using the helpers in [`shared/Utils.kt`](patches/src/main/kotlin/app/polishapps/patches/shared/Utils.kt).

### Releases

Releases are automated from `main` with [semantic-release](https://semantic-release.gitbook.io/) and [Conventional Commits](https://www.conventionalcommits.org/):

| Commit type | Release |
| --- | --- |
| `feat:` | minor |
| `fix:`, `perf:`, `bump:` | patch |
| `chore:`, `docs:`, others | none (build check only) |

A releasing push runs [`release.yml`](.github/workflows/release.yml), which builds the `.mpp`, updates `patches-list.json`, `patches-bundle.json`, `CHANGELOG.md` and the patch list above, then publishes a GitHub release. Pull requests and other branches run [`build.yml`](.github/workflows/build.yml). CI authenticates to the Morphe registry with the built-in `GITHUB_TOKEN`.

## ⚖️ Legal

### License

Licensed under the [GNU General Public License v3.0](LICENSE), with the additional terms under section 7 in [NOTICE](NOTICE).

Built on the [Morphe patches template](https://github.com/MorpheApp/morphe-patches-template), with prior work from [crimera/piko](https://github.com/crimera/piko) and [ReVanced](https://github.com/ReVanced).

Takedown requests or legal concerns: please [open an issue](https://github.com/RikoDEV/morphed-pl/issues) or contact mail in my profile.
