# Mini Games Patches

Morphe patches for various casual / mini games on Android.

## Patches

<!-- PATCHES_START -->
> **[v1.4.2](https://github.com/totto357/mini-games-patches/releases/tag/v1.4.2)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;14 patches total
<details open>
<summary>📦 Cell Survivor&nbsp;&nbsp;•&nbsp;&nbsp;9 patches</summary>
<br>

**🎯 Supported versions:**

| 2.23 | 2.20 | 2.15 |
| :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Bypass Force Update](#bypass-force-update) | Bypasses in-game force update check, treating app always as up-to-date. |  |
| [Bypass Native Signature & Package Verification](#bypass-native-signature-package-verification) | Patches libappJni.so so that CheckPackageName and CheckApkSign always return 1 (success). |  |
| [Bypass PairIP License Check](#bypass-pairip-license-check) | Bypasses Google Play Integrity / PairIP license check. |  |
| [Cleanup Dexopt Profiles](#cleanup-dexopt-profiles) | Removes baseline.prof to prevent ART installation checksum mismatch warnings. |  |
| [Disable Analytics, Crashlytics & Error Toasts](#disable-analytics-crashlytics-error-toasts) | Completely disables AppsFlyer, Bugly, OnlineConfig and annoying Google Play Games network toasts. |  |
| [Fix Native Libs, Debuggable & Cleanup](#fix-native-libs-debuggable-cleanup) | Sets extractNativeLibs and debuggable to true, and removes PairIP LicenseActivity if present. |  |
| [Free In-App Purchases](#free-in-app-purchases) | Bypasses Google Play billing and immediately grants purchased diamonds/packs. |  |
| [Instant Rewarded Ads](#instant-rewarded-ads) | Makes rewarded videos always ready and immediately grants rewards without playing ads. |  |
| [Save Data Backup & Restore](#save-data-backup-restore) | Automatically backs up and restores save data from Android/media directory across installs. |  |

</details>

<details open>
<summary>📦 Colony Flow&nbsp;&nbsp;•&nbsp;&nbsp;5 patches</summary>
<br>

**🎯 Supported versions:**

| 1.0.76 | 1.0.78 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Bypass License Check & Auto-Restore Save Data](#bypass-license-check-auto-restore-save-data) | Bypasses pairip license check and automatically restores backup save data from external storage. |  |
| [Disable Interstitial, App Open & Banner Ads](#disable-interstitial-app-open-banner-ads) | Bypasses interstitial, app-open and banner ads by intercepting readiness and show calls. |  |
| [Fix Native Libs & Disable Analytics](#fix-native-libs-disable-analytics) | Sets extractNativeLibs to true and adds metadata to disable Firebase/Google analytics. |  |
| [Free In-App Purchases (IAP Bypass)](#free-in-app-purchases-iap-bypass) | Bypasses Google Play billing dialog and immediately simulates a successful purchase. |  |
| [Instant Rewarded Ads](#instant-rewarded-ads) | Bypasses rewarded video ads and immediately grants the reward. |  |

</details>

<!-- PATCHES_END -->

## Usage with Morphe Manager

1. Add this repository (`totto357/mini-games-patches`) to your Morphe Manager sources.
2. Select target APK (e.g., Colony Flow).
3. Apply patches and install!
