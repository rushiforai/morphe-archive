# Johnnyboy’s Morphe Patches

[![Add to Morphe](https://img.shields.io/badge/Add%20to-Morphe%20Manager-4285f4?logo=android)](https://morphe.software/add-source?github=0xJohnnyboy/morphe-patches)

This source contains two independent patches:

- **Replace Google Photos with Immich** for Pixel Camera.
- **Browse artist albums in Android Auto** for Apple Music.

Select only the patch for the app you are patching.

## Pixel Camera

Open the last photo from the Pixel Camera thumbnail in [Immich](https://github.com/immich-app/immich).

The **Replace Google Photos with Immich** switch is at the end of **Settings → General**. It is off by default and translated into English and French. When enabled, tapping the thumbnail sends the media directly to Immich. Pixel Camera uses its original review flow when the switch is off, on the lock screen, or when Immich cannot open the media. Immich may briefly show its home screen before its viewer opens.

## Compatibility

- Morphe Manager `2.6.0` or later (bundle built with Morphe Patcher `2.4.0` stable).
- Target build: Pixel Camera `11.1.040.982810059.19` (version code `69703284`).
- The Immich patch keeps Pixel Camera’s name and package ID (`com.google.android.GoogleCamera`). It adds a package-visibility entry for Immich so Android can find its viewer.
- Tested in a cloned build on a Pixel 10 Pro with Immich 3.4.2.

## Use with Morphe

1. On your phone, tap [**Add to Morphe**](https://morphe.software/add-source?github=0xJohnnyboy/morphe-patches) and confirm the source in [Morphe Manager](https://github.com/MorpheApp/morphe-manager).
2. In Morphe, enable **Expert mode**, select **Pixel Camera**, and choose an original APK or APKM for version `11.1.040.982810059.19`.
3. Enable **Replace Google Photos with Immich**. If you want to install it alongside the Google-signed Pixel Camera, also enable the clone patch described below.
4. Apply the selected patches and install the resulting app. In Pixel Camera, open **Settings → General** and turn on **Replace Google Photos with Immich**.

### Pixel 10 photo saving and optional cloning

[Add Akshayykadam’s Pixel Camera patches to Morphe](https://morphe.software/add-source?github=Akshayykadam/Pixel-Camera)

**Pixel 10 Photo Saving Fix** is a separate upstream patch from [Akshayykadam/Pixel-Camera](https://github.com/Akshayykadam/Pixel-Camera/releases). Select it from that source if this Pixel Camera build fails to save captures on your Pixel 10 or 10 Pro. The Immich patch works independently and does not bundle the fix.

On the Pixel 10 Pro used for testing, photos failed to save with only the clone patch applied. Captures saved successfully with **Pixel 10 Photo Saving Fix** and the Immich patch enabled.

**Pixel Camera Clone (Non-Root)** is another optional patch from the upstream source. It changes the package to `com.google.android.GoogleCamera.morphe` so the patched APK can be installed alongside the Google-signed app. Enable it only for a side-by-side install.

To reproduce the tested setup in Morphe Manager, enable [Expert mode](https://github.com/MorpheApp/morphe-manager/blob/main/docs/patching-expert-mode.md), add both sources, and select **Replace Google Photos with Immich**, **Pixel 10 Photo Saving Fix**, and **Pixel Camera Clone (Non-Root)**. The tested upstream bundle version was `1.1.3`.

## Apple Music

**Browse artist albums in Android Auto** opens the artist’s library albums from **Library → Artists**. Open an album to see its tracks in a list. Select **Play album** to play the album or tap a track to start there. The album action is localized in English and French.

Compatible Apple Music builds:

- `7.0.1` (version code `1622`)
- `7.0.2` (version code `1624`)

In Morphe Manager, add this source, choose **Apple Music**, select an original APK or APKM matching one of the compatible builds, and apply **Browse artist albums in Android Auto**. The patch was tested with Apple Music `7.0.2` on Android 17 using the Android Auto Desktop Head Unit.

## Development

Use JDK 21. Gradle resolves Morphe dependencies from GitHub Packages. Set `GITHUB_ACTOR` and `GITHUB_TOKEN`, or configure `gpr.user` and `gpr.key` in your user-level Gradle properties.

```sh
./gradlew :patches:build
```

The build produces the Morphe patch bundle in `patches/build/libs/`.

## Credits

- [Akshayykadam/Pixel-Camera](https://github.com/Akshayykadam/Pixel-Camera) provided a reference for settings injection and the optional patches used on the test device.
- [Paresh-Maheshwari/morphe-ai](https://github.com/Paresh-Maheshwari/morphe-ai) provided the APK analysis and patch development workflow.
- [Morphe Patcher](https://github.com/MorpheApp/morphe-patcher), [Morphe Manager](https://github.com/MorpheApp/morphe-manager), and [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop) provide the patching toolchain.
- [google-pixel-camera-to-immich](https://github.com/skyracer2012/google-pixel-camera-to-immich) documented the Pixel Camera review intent and the Immich viewer entry point.
