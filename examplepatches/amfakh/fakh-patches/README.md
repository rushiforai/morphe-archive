# Fakh Patches

Patches for use with [Morphe](https://github.com/MorpheApp). All apps ship in one patch bundle.
Each app has its own README with the full patch list.

| App | Package | Version | Format | Details |
|---|---|---|---|---|
| GitHub | `com.github.android` | `1.282.0` | APKM from APKMirror | [apps/github](apps/github/README.md) |
| LinkedIn | `com.linkedin.android` | `4.1.1264` | APKM from APKMirror | [apps/linkedin](apps/linkedin/README.md) |
| Radio Indonesia | `com.appmind.radios.id` | `4.2.30` | XAPK from APKPure | [apps/radio](apps/radio/README.md) |
| DoDo Music | `com.dundunstudio.autoplay` | `2.0.14` | XAPK from APKPure | [apps/dodo](apps/dodo/README.md) |
| Windy | `com.windyty.android` | `51.3.2` | APKM from APKMirror | [apps/windy](apps/windy/README.md) |
| Smart Life | `com.tuya.smartlife` | `7.12.3` | XAPK from APKPure | [apps/smartlife](apps/smartlife/README.md) |
| Tuya Smart | `com.tuya.smart` | `7.12.3-870` | APKM from APKMirror | [apps/smartlife](apps/smartlife/README.md) |
| BARDI Smart Home | `com.bardi.smart.home` | `1.5.3` | XAPK from APKPure | [apps/smartlife](apps/smartlife/README.md) |

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
