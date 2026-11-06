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
> - **Trademarks.** Yanosik, Android Auto and all other product names, logos and brands belong to their respective owners. They are used here only to say which apps the patches work with.
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

All patches are enabled by default.

<!-- PATCHES_START EXPANDED -->
> **[v1.3.0](https://github.com/RikoDEV/morphed-pl/releases/tag/v1.3.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;6 patches total
<details open>
<summary>📦 Yanosik&nbsp;&nbsp;•&nbsp;&nbsp;6 patches</summary>
<br>

**🎯 Supported versions:**

| 26.9.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Block Yanosik telemetry](#block-yanosik-telemetry) | Blocks analytics, crash reporting, usage statistics, the notiOne SDK and Wi-Fi/cell tower data collection. Location reporting for POI alerts and traffic keeps working. |  |
| [Bypass Android Auto certificate checks](#bypass-android-auto-certificate-checks) | Bypasses the Car App Library host certificate validation so Yanosik works on Android Auto. |  |
| [Home screen dark mode](#home-screen-dark-mode) | Makes the home screen follow the system light or dark theme. |  |
| [Remove Yanosik ads](#remove-yanosik-ads) | Removes banner ads, splash/start adverts and advert-based navigation POIs. |  |
| [Remove Yanosik radio](#remove-yanosik-radio) | Removes the built-in Radio Yanosik from the main screen and the map button. |  |
| [Unlock Yanosik PRO](#unlock-yanosik-pro) | Reports an active premium entitlement and unlocks the PRO-only settings (view after launch, floating icon). |  |

</details>

<!-- PATCHES_END -->

> [!NOTE]
> **Bypass Android Auto certificate checks** also needs [Android-Auto-XLauncher-Unlocked](https://github.com/Rikj000/Android-Auto-XLauncher-Unlocked) (root + LSPosed). See [#2](https://github.com/RikoDEV/morphed-pl/issues/2).

## 🔍 What Yanosik collects

**Block Yanosik telemetry** stops the collectors below. Location reporting for POI alerts and traffic keeps working.

| Source | Data |
| --- | --- |
| Yanosik analytics (`AnalyticsManager`, `AnalyticsService`) | App events from native and Flutter screens, settings changes |
| Usage analytics (`UsageAnalyticsService`) | App activity, navigation state, GPS status and location |
| Wi-Fi and app statistics (`StatisticScanService`) | Nearby and connected Wi-Fi networks, app uninstall events |
| Cell tower samples (`BtsService`) | GSM, LTE, 5G and CDMA cell data, recorded with your location |
| Insurance analytics (`KioskAnalyticsService`) | Steps through the insurance purchase flow, including vehicle and offer data |
| Advert statistics (`AdvertStatisticsManager`) | Advert events with device and location details |
| Firebase Analytics and Sessions | App events and session starts |
| Crashlytics | Crash reports, logs, custom keys and your user ID |
| proxi.cloud SDK | Geofence and beacon events, Wi-Fi location, advertising ID |
| notiOne SDK | Bluetooth tag scans and location samples linked to your user ID, restarted after reboot |
| RevenueCat | Paywall and feature events |

Besides privacy, this saves battery: these collectors wake the Bluetooth, Wi-Fi and cellular radios, run background timers and uploads when you aren't using the app, and keep mobile data active with frequent small transfers.

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
