# PetalMaps Android Auto

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Target: Petal Maps](https://img.shields.io/badge/target-Petal%20Maps%204.7.0.322-orange)](https://www.apkpure.com/petal-maps/com.huawei.maps.app)

A [Morphe](https://github.com/MorpheApp)/[ReVanced](https://github.com/ReVanced)-style patch bundle that injects **Android Auto** support into **Petal Maps** (`com.huawei.maps.app`). The patch reuses the existing HiCar automotive UI already shipped inside the app and projects it onto the Android Auto head unit surface — no reimplementation of the map UI needed.

> **Disclaimer:** This project does **not** contain, distribute, or host any Huawei code, assets, or binaries. You must obtain the original Petal Maps APK yourself (e.g. from APKPure). This project is not affiliated with, endorsed by, or connected to Huawei, Google, or the Android Auto team. Use at your own risk. Patching and running modified APKs on public roads may violate local regulations — you are solely responsible for compliance.

## How it works

- **Extension dex (in-process):** `PetalCarAppService` extends `androidx.car.app.CarAppService` and runs inside the Petal Maps process. No separate APK, no IPC overhead.
- **Surface projection via VirtualDisplay:** `PetalSession` receives the head-unit `Surface` from Android Auto and creates a `VirtualDisplay` with `VIRTUAL_DISPLAY_FLAG_OWN_CONTENT_ONLY | VIRTUAL_DISPLAY_FLAG_PRESENTATION`. The Petal Maps automotive activity is launched directly onto this display.
- **AutoPetalMapsActivity (reused):** The patch launches `com.huawei.maps.auto.activity.AutoPetalMapsActivity` — the same full-featured automotive UI originally built for HiCar — so navigation, search, favourites, and offline maps all work without rewriting a single screen.
- **Synthetic touch gestures:** Since we cannot use `InputManager.injectInputEvent()` (requires signature-level permission), touch events are synthesised as `MotionEvent` objects dispatched directly to the projected activity's decor view. Pan, fling, pinch-to-zoom, and click are all supported.
- **Anti-repack bypass:** Neutralises `SecurityDetect.irpj()` in `libaegissec.so` — the native integrity check that calls `Process.killProcess()` when it detects APK re-signing.
- **Manufacturer-check bypass:** Forces `up2.g(Context)` to always return `true`, removing the Huawei/Honor-only device gate in `SplashActivity`.

## Requirements

| Requirement | Details |
|---|---|
| **Original APK** | Petal Maps `4.7.0.322` from [APKPure](https://www.apkpure.com/petal-maps/com.huawei.maps.app) (universal `arm64-v8a` + `armeabi-v7a`) |
| **JDK** | JDK 21 (`JAVA_HOME` must be set) |
| **Android SDK** | Build-tools 36.0.0 (`ANDROID_SDK_ROOT` or default `%LOCALAPPDATA%\Android\Sdk`) |
| **Morphe CLI** | `morphe-desktop-1.12.0-all.jar` placed at `tools/morphe-cli/` |
| **Target device** | Android Auto in **developer mode** with **unknown sources** enabled |
| **Root (recommended)** | KernelSU or Magisk — simplifies installation and avoids signature conflicts |
| **HMS Core** | Required for full functionality (login, location kit, Map Kit rendering) |

## Usage

### Quickstart (recommended)

```bash
# 1. Place the original Petal Maps APK at tools/apk/petal-maps.apk
# 2. Generate a keystore (one-time):
keytool -genkey -v \
  -keystore keystore/petalaa.keystore \
  -alias petalaa \
  -keyalg RSA -keysize 2048 -validity 36500 \
  -storepass petalaa-dev -keypass petalaa-dev

# 3. Run the pipeline:
./scripts/patch.sh
```

The script builds the patches and extension dex, applies them with Morphe CLI, zipaligns, and signs the output. The patched APK is written to `build/petal-maps-aa-patched.apk`.

### Manual patching (Morphe CLI / Manager)

```bash
java -jar morphe-cli.jar patch \
    --unsigned \
    -p patches/build/libs/patches-1.0.0.mpp \
    -o petal-maps-aa-unsigned.apk \
    petal-maps.apk

zipalign -f 4 petal-maps-aa-unsigned.apk petal-maps-aa-aligned.apk

apksigner sign \
    --ks keystore/petalaa.keystore \
    --ks-key-alias petalaa \
    --out petal-maps-aa-patched.apk \
    petal-maps-aa-aligned.apk
```

### Installation

```bash
# Uninstall the original Petal Maps first (signature mismatch):
adb uninstall com.huawei.maps.app

# Install the patched APK:
adb install petal-maps-aa-patched.apk
```

> With root (Magisk/KernelSU) you can bypass the signature conflict entirely — install the patched APK over the original without uninstalling.

## Testing with Desktop Head Unit (DHU)

Android SDK ships with `desktop-head-unit.exe` under `extras/google/auto/`. It emulates an Android Auto head unit on your PC.

1. Enable **Developer Mode** in Android Auto on the phone (tap the version header 10×).
2. Start the head unit server from the three-dot menu.
3. Connect the phone via USB, then run:

```bash
adb forward tcp:5277 tcp:5277
desktop-head-unit.exe
```

Select the patched Petal Maps from the app list in DHU.

## Known limitations

- **No turn-by-turn in the AA template (MVP).** The current `MapScreen` returns a `NavigationTemplate` with only an action strip (zoom/re-center). Full navigation template support (lane guidance, ETA, next-turn card) is planned for a future release.
- **Permissive `HostValidator`.** `PetalCarAppService` uses `ALLOW_ALL_HOSTS_VALIDATOR` for development convenience. This should be restricted to known AA host packages in production.
- **Version-sensitive patches.** The bytecode patches target Petal Maps `4.7.0.322`. Other versions may have different method signatures or obfuscation mappings — YMMV.
- **Play Store distribution.** Google does not distribute unapproved navigation apps on the Play Store. This patched APK is sideload-only.

## Credits

- [Morphe](https://github.com/MorpheApp) / [ReVanced](https://github.com/ReVanced) — patching framework and ecosystem
- The Petal Maps automotive UI (`AutoPetalMapsActivity`) was built by Huawei for HiCar; this project merely projects it onto a different surface

## License

[GNU General Public License v3.0](https://www.gnu.org/licenses/gpl-3.0)

---

*PetalAA — bringing Petal Maps to your car display.*
