# Google Maps without Google Play services

Patches for use with [Morphe](https://morphe.software) that let Google Maps run on Android without
Google Play services, for example on LineageOS without GApps. Maps talks to
[MicroG-RE](https://github.com/MorpheApp/MicroG-RE) instead, the same way patched YouTube does.

Without these patches, Maps on such a phone starts, but the map stays blank and icons are missing.

## What the patch does

**GmsCore support** (required) installs Maps under its own package name, `app.morphe.android.apps.maps`,
next to any original Maps, and:

- points Maps at MicroG-RE for location, sign-in, push messages, fonts and its other Google services
- skips the Google Play services availability check and the "update Google Play services" notifications
- skips the "Your device isn't Play Protect certified" screen
- prevents the crash when "My location" or directions from the current location need a location
  setting that MicroG-RE cannot show
- reports the original Maps package name and signature to Google, so tiles, search and place details
  work without signing in
- checks at startup that MicroG-RE is installed and allowed to run in the background

The package name is a patch option.

## Setup

1. Install [MicroG-RE](https://github.com/MorpheApp/MicroG-RE/releases/latest), 7.2.1 or newer.
   Open it and grant its permissions, location in particular. Signing in to a Google account in
   MicroG-RE is optional.
2. In Morphe Manager, add this patch source: `https://github.com/hyperstown/maps-patches`
3. Patch Google Maps with **GmsCore support** and install it. Morphe Manager links to the
   recommended Maps version on APKMirror. Choose the universal (`nodpi`) APK.
4. On first start, allow MicroG-RE to run in the background when asked.

The patch needs the original APK signed by Google, because it reports that signature to Google.

## Tested

With Google Maps 26.42.02 and MicroG-RE 7.2.2 on Android 16, without any Google apps and without a
Google account: the map, search, place details, current location, directions and turn-by-turn
navigation. Signing in, push notifications and Timeline are not tested yet.

Other Maps versions are accepted as experimental. Patching stops with an error instead of producing a
broken app if a hook cannot be found.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/hyperstown/maps-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 Google Maps&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 26.42.02.997557324 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [GmsCore support](#gmscore-support) | Allows Google Maps to run without root and without Google Play services, by using MicroG-RE under a different package name. | • Package name |

</details>

<!-- PATCHES_END -->

## Building

The build needs JDK 21, the Android SDK and the Morphe patcher with its Gradle plugin. Morphe
publishes the last two only to GitHub Packages, which requires a GitHub token even to read.

`container/gradlew.sh` builds all of it in a podman image instead, from source, without a token,
and runs Gradle in it:

```sh
container/gradlew.sh buildAndroid
```

The bundle is written to `patches/build/libs/patches-<version>.mpp`. Apply it with Morphe Manager as a
local file, or with [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop):

```sh
java -jar morphe-desktop-*-all.jar patch -p patches/build/libs/patches-*.mpp google-maps.apk
```

To build without the container, add a classic GitHub token with `read:packages` to
`~/.gradle/gradle.properties` as `gpr.user` and `gpr.key`, then run `./gradlew buildAndroid`.

### Releases

Releases are made by `.github/workflows/release.yml` with semantic-release. Commit with
[semantic commit](https://www.conventionalcommits.org) messages: `fix:` and `feat:` commits on `dev`
publish pre-releases, merging `dev` into `main` publishes a release, and `chore:` commits publish
nothing. The workflow updates `patches-bundle.json`, `patches-list.json`, `CHANGELOG.md` and the patch
list above, so do not edit them by hand.

## Credits

- [Morphe](https://github.com/MorpheApp), for the patcher, the patches template and the GmsCore support
  patch this one is based on
- [gmaps-patches](https://github.com/fangkampanat/gmaps-patches) by fangkampanat, for the device
  compliance, location resolution and identity fixes for Maps, adapted here
- [MicroG-RE](https://github.com/MorpheApp/MicroG-RE) and [microG](https://github.com/microg/GmsCore)

This project is not affiliated with or endorsed by Google, Morphe or ReVanced.

## License

[GPLv3](LICENSE), with the additional terms in [NOTICE](NOTICE).
