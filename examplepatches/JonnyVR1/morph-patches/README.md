# Morph Patches

## Overview
Custom Morphe bytecode patches for multiple Android apps. Patches are bundled as `.mpp` files and applied directly to an app's APK. Currently includes Tantan premium bypass patches; more apps can be added over time (see [Adding support for a new app](#adding-support-for-a-new-app) below).

## Installation (Morphe Manager)
Add this repo as a patch bundle source in Morphe Manager using:
```
https://raw.githubusercontent.com/JonnyVR1/morph-patches/main/patches-bundle.json
```

## Version Compatibility
| App | Package | Version |
|-----|---------|---------|
| Tantan | `com.p335p1.mobile.putong` | 7.2.9 |

## Patches (13 total)

### Settings Patches (4)
| Patch | Method | Effect |
|-------|--------|--------|
| SettingsSupremePartner | `Settings.isSupremePartner()` | Returns `true` |
| SettingsPlatinum | `Settings.isPlatinum()` | Returns `true` |
| SettingsODiamond | `Settings.userIsODiamond()` | Returns `true` |
| SettingsDisableAds | `Settings.personalizeAdsSuggest()` | Returns `false` |

### User Patches (9)
| Patch | Method | Effect |
|-------|--------|--------|
| UserIsVip | `User.isVIP()` | Returns `true` |
| UserIsSVIP | `User.isSVIP()` | Returns `true` |
| UserIsUltraPremium | `User.isUltraPremium()` | Returns `true` |
| UserIsSupremePartner | `User.isSupremePartner()` | Returns `true` |
| UserIsPlatinum | `User.isPlatinum()` | Returns `true` |
| UserIsODiamond | `User.isODiamond()` | Returns `true` |
| UserIsMembership | `User.isMembership()` | Returns `true` |
| UserIsMembershipUsed | `User.isMembershipUsed()` | Returns `true` |
| UserIsVipExpired | `User.isVIPExpired()` | Returns `false` |

> A full, authoritative patch listing is auto-generated in [`patches-list.json`](./patches-list.json).

## Adding support for a new app

Each app's patches should live under `patches/src/main/java/<app's actual obfuscated package name>/`, matching the real bytecode package of the target APK (do not rename it to something generic — it must match the classes being patched). Organize patches one file per feature area, e.g.:

```
patches/src/main/java/<app package>/
├── SettingsPatches.kt
├── UserPatches.kt
└── ...
```

Compatibility (target app package + version) should be declared via a shared `Compatibility` constant per app, referenced by each patch in that app's package. See the existing `com/p335p1/mobile/putong/data/` patches (Tantan) as a reference implementation.

## Building

### Prerequisites
- Java 17+
- Android SDK with build-tools

### Build Commands
```bash
# Build the patch bundle
./gradlew :patches:jar

# Run tests
./gradlew :patches:test

# Build and apply patches to APK
./gradlew :patches:patchApk
# Output: tantan-premium-unlocked.apk
```

### Apply Patches Manually
```bash
# After building the bundle
java -cp "patches/build/libs/patches-1.0.0.mpp:patches/build/libs/*" \
  app.morphe.PatcherMainKt <input.apk> <output.apk>
```

## Publishing to GitHub Packages

```bash
# Set credentials
export GITHUB_ACTOR=your-username
export GITHUB_TOKEN=your-token

# Publish
./gradlew :patches:publish
```

## Project Structure
```
morph-patches/
├── patches/
│   ├── src/main/java/
│   │   ├── app/morphe/
│   │   │   ├── PatcherMain.kt        # CLI entry point
│   │   │   └── PatchRegistry.kt      # Patch collection
│   │   └── com/p335p1/mobile/putong/data/   # Tantan patches
│   │       ├── SettingsPatches.kt    # 4 settings patches
│   │       └── UserPatches.kt        # 9 user patches
│   └── build.gradle.kts
├── patches-bundle.json
├── patches-list.json
└── README.md
```
