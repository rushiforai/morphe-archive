# Petal Maps Non-Huawei Patch

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Target: Petal Maps](https://img.shields.io/badge/target-Petal%20Maps%204.7.0.322-orange)](https://www.apkpure.com/petal-maps/com.huawei.maps.app)

A [Morphe](https://github.com/MorpheApp)/[ReVanced](https://github.com/ReVanced)-style patch bundle that removes device restrictions from **Petal Maps** (`com.huawei.maps.app`), allowing it to run on non-Huawei devices.

> **Disclaimer:** This project does **not** contain, distribute, or host any Huawei code, assets, or binaries. You must obtain the original Petal Maps APK yourself (e.g. from APKPure). This project is not affiliated with, endorsed by, or connected to Huawei. Use at your own risk. Patching and running modified APKs may violate local regulations or terms of service — you are solely responsible for compliance.

## Patches included

| Patch | Description |
|---|---|
| **Manufacturer Check Bypass** | Forces `up2.g(Context)` to always return `true`, removing the Huawei/Honor-only device gate in `SplashActivity` |
| **Anti-Repack Bypass** | Neutralises `SecurityDetect.irpj()` in `libaegissec.so` — the native integrity check that calls `Process.killProcess()` when it detects APK re-signing |
| **Huawei Login Fix** | Fixes Huawei account login issues on non-Huawei devices |
| **Change Package Name** | (Optional) Changes the app's package name to avoid conflicts with the original |

## Requirements

| Requirement | Details |
|---|---|
| **Original APK** | Petal Maps `4.7.0.322` from [APKPure](https://www.apkpure.com/petal-maps/com.huawei.maps.app) (universal `arm64-v8a` + `armeabi-v7a`) |
| **JDK** | JDK 21 (`JAVA_HOME` must be set) |
| **Android SDK** | Build-tools 36.0.0 (`ANDROID_SDK_ROOT` or default `%LOCALAPPDATA%\Android\Sdk`) |
| **Morphe CLI** | `morphe-desktop-1.12.0-all.jar` placed at `tools/morphe-cli/` |
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

The script builds the patches, applies them with Morphe CLI, zipaligns, and signs the output. The patched APK is written to `build/petal-maps-nh-patched.apk`.

### Manual patching (Morphe CLI / Manager)

```bash
java -jar morphe-cli.jar patch \
    --unsigned \
    -p patches/build/libs/patches-1.0.0.mpp \
    -o petal-maps-nh-unsigned.apk \
    petal-maps.apk

zipalign -f 4 petal-maps-nh-unsigned.apk petal-maps-nh-aligned.apk

apksigner sign \
    --ks keystore/petalaa.keystore \
    --ks-key-alias petalaa \
    --out petal-maps-nh-patched.apk \
    petal-maps-nh-aligned.apk
```

### Installation

```bash
# Uninstall the original Petal Maps first (signature mismatch):
adb uninstall com.huawei.maps.app

# Install the patched APK:
adb install petal-maps-nh-patched.apk
```

> With root (Magisk/KernelSU) you can bypass the signature conflict entirely — install the patched APK over the original without uninstalling.

## Known limitations

- **Version-sensitive patches.** The bytecode patches target Petal Maps `4.7.0.322`. Other versions may have different method signatures or obfuscation mappings — YMMV.
- **HMS Core dependency.** Some features (login, certain map services) require HMS Core to be installed and working on your device.

## Credits

- [Morphe](https://github.com/MorpheApp) / [ReVanced](https://github.com/ReVanced) — patching framework and ecosystem

## License

[GNU General Public License v3.0](https://www.gnu.org/licenses/gpl-3.0)

---

*Petal Maps Non-Huawei Patch — running Petal Maps anywhere.*