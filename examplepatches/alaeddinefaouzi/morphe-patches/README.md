# ⚡ @alaeddinefaouzi Patches

<img src="patches-bundle.png" width="96" height="96" alt="@alaeddinefaouzi" align="right" />

A curated suite of patches and quality-of-life enhancements for Android **apps and games**, maintained by **@alaeddinefaouzi** for the [Morphe](https://morphe.software) patching ecosystem.

[![Morphe Compatible](https://img.shields.io/badge/Morphe-Compatible-6C5CE7?style=flat-square)](https://morphe.software)
[![License: GPL-3.0](https://img.shields.io/badge/License-GPLv3-blue.svg?style=flat-square)](LICENSE)
[![Latest Release](https://img.shields.io/github/v/release/alaeddinefaouzi/morphe-patches?style=flat-square)](https://github.com/alaeddinefaouzi/morphe-patches/releases)

---

## 📲 Add to Morphe Manager

### ⚡ Option 1: One-Click Integration (Recommended)
On your Android device with **Morphe Manager** installed, click the badge below to add this repository directly as a remote patch source:

[![Add to Morphe](https://img.shields.io/badge/Add%20to-Morphe%20Manager-4CAF50?style=for-the-badge&logo=android)](https://morphe.software/add-source?github=alaeddinefaouzi/morphe-patches)

---

### 🛠 Option 2: Add Manually in Morphe Manager
1. Open **Morphe Manager** on your Android device.
2. Tap the **Sources** tab at the bottom.
3. Tap the **`+` (Add)** button.
4. Under the **Remote** tab, enter:
   ```text
   github.com/alaeddinefaouzi/morphe-patches
   ```
5. Tap **Add**. Morphe Manager will automatically fetch the latest patches and notify you when updates are released!

---

### 📦 Option 3: Manual `.mpp` Import
If you prefer offline or manual patching:
1. Go to the [Releases](https://github.com/alaeddinefaouzi/morphe-patches/releases) page.
2. Download `patches-1.0.0.mpp`.
3. In Morphe Manager or Morphe Desktop, select the downloaded `.mpp` bundle to apply patches.

---

## 📱 Supported Apps & Games

### 🥊 BroBuddy (`com.brobuddy.game`) — Version 1.0.3

| Patch | Description | Default |
|---|---|:---:|
| **Free Store & Unlimited Currency** | Unlocks all in-game store purchases (Gold, Cash bundles, VIP, double resources) instantly without Google Play payment sheets or account requirements. Fully functional offline. | ✅ Yes |
| **No Ads** | Completely eliminates bottom banner ads, interstitial screens between heist/stages, and forced ads. Results screens appear immediately without delay. | ✅ Yes |
| **Instant Ad Rewards** | Converts every "Watch Ad for 2x Rewards" button into an instant payout with 0 waiting time. Claimable repeatedly. | ✅ Yes |
| **Native IAP Verification Bypass** | Engine-level IL2CPP bypass for `ValidatePurchaseIfPossible`, `CanCrossPlatformValidate`, and `OnConfirmationFailed`. Bypasses server receipt verification so purchases confirm immediately. | ✅ Yes |

---

## 🧩 Adding New Patches (Apps & Games)

This repository follows the official Morphe patches modular architecture, making it easy to add patches for both regular Android applications and native/Unity games:

### 1. Register App Compatibility
Add the target package name, version, and metadata to `patches/src/main/kotlin/app/morphe/patches/shared/Constants.kt`:
```kotlin
const val APP_PACKAGE_NAME = "com.example.app"
const val APP_TARGET_VERSION = "1.0.0"

val COMPATIBILITY_EXAMPLE = Compatibility(
    name = "Example App",
    packageName = APP_PACKAGE_NAME,
    apkFileType = ApkFileType.APK, // or ApkFileType.APKM / XAPK
    appIconColor = 0x123456,
    targets = listOf(
        AppTarget(
            version = APP_TARGET_VERSION,
            description = "Download Example App v$APP_TARGET_VERSION from APKMirror",
        )
    )
)
```

### 2. Implement the Patches
Create a package for the target application under `patches/src/main/kotlin/app/morphe/patches/<app_name>/`:

* **Standard Android Apps (Smali / Bytecode)**:
  Use `bytecodePatch` to hook methods, neutralize ads, unlock premium features, or bypass paywalls:
  ```kotlin
  val exampleAppUnlockPatch = bytecodePatch(
      name = "Unlock Premium",
      description = "Unlocks premium subscription features.",
  ) {
      compatibleWith(Constants.COMPATIBILITY_EXAMPLE)
      execute {
          targetFingerprint.method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
      }
  }
  ```

* **Native / Unity Games (IL2CPP / Native Libraries)**:
  Use `rawResourcePatch` to patch functions directly in `lib/arm64-v8a/libil2cpp.so` or other shared libraries.

### 3. Build & Test
```bash
./gradlew :patches:buildAndroid
./gradlew generatePatchesList
```
The compiled `.mpp` package is output to `patches/build/libs/`.

---

## 🚀 Automated CI / Releases

This repository includes a fully automated GitHub Actions pipeline (`.github/workflows/release.yml`):
* Pushing a Git tag (e.g. `v1.1.0`) triggers an automated Gradle build in Ubuntu CI.
* Compiles the `.mpp` package, generates the manifests, and publishes a new release on GitHub Releases.

---

## ⚖️ License
Distributed under the GNU General Public License v3.0 (GPLv3). See `LICENSE` for details.
