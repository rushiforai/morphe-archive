# 🧩 Morphe Patches for Polish Apps

Morphe patches for Polish Android apps.

## ❓ About

A collection of [Morphe](https://morphe.software) patches for apps popular in Poland.
Patches are grouped by app under `patches/src/main/kotlin/app/polishapps/patches/<app>/`.

### Supported apps

#### Yanosik (`pl.neptis.yanosik.mobi.android`)

| Patch | Description | Default |
| --- | --- | --- |
| **Remove Yanosik ads** | Removes banner ads, splash/start adverts and advert-based navigation POIs. | ✅ |
| **Unlock Yanosik PRO** | Reports an active premium entitlement and unlocks the PRO-only settings (view after launch / "Widok po uruchomieniu", floating icon / "Pływająca ikona"). | ✅ |
| **Remove Yanosik radio** | Removes the built-in Radio Yanosik from the main screen and the map button. | ✅ |
| **Bypass Android Auto certificate checks** | Bypasses the Car App Library host certificate validation so Yanosik works on Android Auto. Requires [Android-Auto-XLauncher-Unlocked app (root + lsposed)](https://github.com/Rikj000/Android-Auto-XLauncher-Unlocked), see [#2](https://github.com/RikoDEV/morphed-pl/issues/2) | ✅ |
| **Block Yanosik telemetry** | Blocks analytics, crash reporting, usage statistics, the notiOne SDK and Wi-Fi/cell tower data collection. Location reporting for POI alerts and traffic keeps working. | ✅ |
| **Home screen dark mode** | Makes the home screen follow the system light or dark theme. | ✅ |

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=RikoDEV/morphed-pl

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.3.1](https://github.com/RikoDEV/morphed-pl/releases/tag/v1.3.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;6 patches total
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

<!-- PATCHES_END -->

## 🔍 What Yanosik collects

### Data collected, and blocked by **Block Yanosik telemetry**

| Source | Data |
| --- | --- |
| **Yanosik analytics** (`AnalyticsManager`, `AnalyticsService`) | App events from native and Flutter screens, and changes to your settings |
| **Usage analytics** (`UsageAnalyticsService`) | Usage packages built from app activity, navigation state, GPS status and location |
| **Wi-Fi and app statistics** (`StatisticScanService`) | Nearby Wi-Fi networks, connected networks and app uninstall events |
| **Cell tower samples** (`BtsService`) | GSM, LTE, 5G and CDMA cell data, recorded alongside your location |
| **Insurance analytics** (`KioskAnalyticsService`) | Your steps through the insurance purchase flow, including vehicle and offer data |
| **Advert statistics** (`AdvertStatisticsManager`) | Advert events with device and location details |
| **Firebase Analytics and Sessions** (Google) | App events and session starts |
| **Crashlytics** (Google) | Crash reports, logs, custom keys and your user ID |
| **proxi.cloud SDK** | Geofence and beacon events, Wi-Fi location and advertising ID handling |
| **notiOne SDK** | Bluetooth tag scans and location samples, linked to your user ID, with a restart after reboot |
| **RevenueCat events** | Paywall and feature events |

### Effect on battery

These collectors wake the phone's radios and processor for work that doesn't help with navigation:

- **Scanning:** Bluetooth tag scans and Wi-Fi and cell readings use radios that could otherwise stay idle.
- **Background work:** timers, batched uploads and SDK restarts after a reboot can run when you aren't using the app.
- **Mobile data:** frequent small uploads keep the cellular radio active for longer than the transfer itself takes.

## 🚀 Releases & CI

Everything is automated from the **`main`** branch:

- Use [Conventional Commits](https://www.conventionalcommits.org/): `feat:` → minor, `fix:` / `perf:` → patch, `chore:` / `docs:` → no release.
- A `feat`/`fix` push to `main` runs [`.github/workflows/release.yml`](.github/workflows/release.yml),
  which builds the `.mpp`, updates `patches-list.json`, `patches-bundle.json`, `CHANGELOG.md` and the
  patches list in this README, then publishes a GitHub release with the `.mpp` attached.
- Commits that don't trigger a release just verify the project compiles.
- Pull requests and non-`main` branches run [`.github/workflows/build.yml`](.github/workflows/build.yml)
  to verify the patches build.

The Gradle build resolves the `app.morphe.patches` plugin from the Morphe registry, so CI passes
`GITHUB_TOKEN` (with `packages: read`) automatically.

## 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches `.mpp` file is found in `patches/build/libs/patches-*.mpp`
- Patch an app with [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop) or the Morphe CLI:

```
java -jar cli.jar patch --patches patches-*.mpp Yanosik_26.10.0.apkm
```

> Building requires a GitHub personal access token with `read:packages` for the Morphe registry
> (`gpr.user` / `gpr.key` Gradle properties or `GITHUB_ACTOR` / `GITHUB_TOKEN` environment variables).
> See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation).

## ➕ Adding another app

1. Add a `Compatibility` constant for the app in
   `patches/src/main/kotlin/app/polishapps/patches/shared/Constants.kt`.
2. Create a package `patches/src/main/kotlin/app/polishapps/patches/<app>/`.
3. Add the patch(es) there using the shared helpers in `.../shared/Utils.kt`.

## 📜 License

Morphe Patches for Polish Apps are licensed under the [GNU General Public License v3.0](LICENSE).

They are built on the [Morphe patches template](https://github.com/MorpheApp/morphe-patches-template),
[crimera/piko](https://github.com/crimera/piko) and the [ReVanced](https://github.com/ReVanced) prior work.
