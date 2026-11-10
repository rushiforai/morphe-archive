# Fakh Patches

![Latest release](https://img.shields.io/github/v/release/amfakh/fakh-patches)
![Downloads](https://img.shields.io/github/downloads/amfakh/fakh-patches/total)
![Latest downloads](https://img.shields.io/github/downloads/amfakh/fakh-patches/latest/total)
![Last commit](https://img.shields.io/github/last-commit/amfakh/fakh-patches)
![Stars](https://img.shields.io/github/stars/amfakh/fakh-patches)
![License](https://img.shields.io/github/license/amfakh/fakh-patches)

Patches for use with [Morphe](https://github.com/MorpheApp). All apps ship in one patch bundle.
Each app has its own README with the full patch list.

| App | Package | Version | Format | Details |
|---|---|---|---|---|
| GitHub | `com.github.android` | `1.282.0`, `1.283.0` | APKM from APKMirror | [apps/github](apps/github/README.md) |
| Jira | `com.atlassian.android.jira.core` | `2026.21.2` | APKM from APKMirror | [apps/jira](apps/jira/README.md) |
| LinkedIn | `com.linkedin.android` | `4.1.1264`, `4.1.1267`, `4.1.1269`, `4.1.1270` | APKM from APKMirror | [apps/linkedin](apps/linkedin/README.md) |
| Radio Indonesia | `com.appmind.radios.id` | `4.2.30` | XAPK from APKPure | [apps/radio](apps/radio/README.md) |
| DoDo Music | `com.dundunstudio.autoplay` | `2.0.14`, `2.0.17` | XAPK from APKPure | [apps/dodo](apps/dodo/README.md) |
| Windy | `com.windyty.android` | `51.3.2` | APKM from APKMirror | [apps/windy](apps/windy/README.md) |
| Smart Life | `com.tuya.smartlife` | `7.12.3-877`, `7.12.6-880` | XAPK from APKPure, APKM from APKMirror | [apps/smartlife](apps/smartlife/README.md) |
| Tuya Smart | `com.tuya.smart` | `7.12.3-870`, `7.12.6-872` | APKM from APKMirror | [apps/smartlife](apps/smartlife/README.md) |
| BARDI Smart Home | `com.bardi.smart.home` | `1.5.3` | XAPK from APKPure | [apps/smartlife](apps/smartlife/README.md) |
| IDN | `com.idntimes.idntimes` | `6.69.1` | XAPK or APKS from APKPure or APKCube | [apps/idn](apps/idn/README.md) |
| KOMPAS.com | `com.ertanto.kompas.official` | `9.8.4` | XAPK from APKPure | [apps/kompas](apps/kompas/README.md) |
| detikcom | `org.detikcom.rss` | `7.14.1` | APK from APKMirror | [apps/detik](apps/detik/README.md) |
| CNN Indonesia | `com.cnn.indonesia` | `2.50.7` | APK from APKMirror | [apps/cnn](apps/cnn/README.md) |
| FlipSide | `com.dinoster.flipside` | `1.6` | APKS from APKCube | [apps/flipside](apps/flipside/README.md) |

## Use

Click the button on your phone to add this repo to Morphe Manager:

<a href="https://morphe.software/add-source?github=amfakh/fakh-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

Or add this URL as a patch source by hand:

```
https://github.com/amfakh/fakh-patches
```

Or download the `.mpp` from [releases](https://github.com/amfakh/fakh-patches/releases/latest) and
load it as a local patch file.

## Build

The Morphe Gradle plugin needs GitHub credentials for its package registry, even when building
offline from the Gradle cache. The extension module is an Android library, so it also needs an
Android SDK; the build installs any platform or build tools it is missing.

```bash
ANDROID_HOME=<android sdk> GITHUB_ACTOR=<github user> GITHUB_TOKEN=$(gh auth token) ./gradlew :patches:buildAndroid
```

The bundle lands in `patches/build/libs/patches-<version>.mpp`. Load it in Morphe Manager as a
local patch file.
