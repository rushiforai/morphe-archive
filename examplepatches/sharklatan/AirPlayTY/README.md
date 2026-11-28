# SharkLatan AirPlay

Native AirPlay integration for **YouTube 21.30.216**, compatible with **Morphe**. Stream video and audio to an AirPlay receiver while using YouTube's native playback controls and gestures.

<!-- ADD_SOURCE_START -->
[Añadir a Morphe](https://morphe.software/add-source?github=sharklatan/AirPlayTY)
<!-- ADD_SOURCE_END -->

## Supported version

| Component | Support |
| --- | --- |
| Input application | Original, unmodified YouTube APK |
| Input package | `com.google.android.youtube` |
| YouTube version | **21.30.216** |
| Patch engine | Morphe Patcher **2.4.0** |
| Patch bundle | `.mpp` |
| Tested receiver | Hisense 50A6NU / VIDAA |

Apply AirPlay **in the same patching run** as the official Morphe YouTube patches, including **Spoof video streams**. Do not use an already patched APK as input.

Support for additional YouTube versions will be added as their integrations and required patches are completed and tested. Version 21.45.83 is not supported by this release. This project is independent and is not certified by Apple.

## Install the patch source

1. Install Morphe and open the **Add to Morphe** link above, or open **Sources → + → Remote** and enter `https://github.com/sharklatan/AirPlayTY`.
2. Enable **Expert mode** to select patches from multiple sources.
3. Select the original YouTube **21.30.216** APK, then select the official Morphe YouTube patches and **SharkLatan AirPlay** for the same run. Keep **Spoof video streams** enabled.
4. Patch and install the result. Import your existing APK signing keystore in Morphe first if the result must update an existing installation. Keep the same output package name as that installation.

The patch does not change the YouTube launcher icon. If you want to keep the original icon, leave the official **Custom branding** patch disabled.

For a previously added source showing **Unnamed**, open its card in **Sources** and press **Update**. Release 0.1.0 fixes the timestamp format that prevented Morphe from downloading the original source metadata.

## Features

- AirPlay button in YouTube's native player controls, independent of Cast button visibility.
- Device picker using the application's resources and active theme.
- Video and audio streaming, native play/pause and seek controls, receiver volume control.
- Local thumbnail during streaming, automatic next-video playback and local playback recovery after the receiver session ends.
- Long-press a receiver to choose video with audio or audio only.

Seek operations may reopen the receiver session when direct seeking is not confirmed, causing a visible interruption. Other AirPlay receivers still require interoperability testing; support for AirPlay on a TV does not certify this sender implementation.

## Releases and updates

GitHub Actions builds and publishes the `.mpp`, its checksum and the source metadata. Users do not compile anything: **Add to Morphe** registers this repository so Morphe can download the published bundle and check for updates.

Use the current bundle linked by `patches-bundle.json`.

To list the source in the community directory, submit this public repository through [Submit a bundle](https://morphe-patches.software/). Creating the repository does not automatically add it to the directory.

## Build from source

Requirements: Python 3.10+, JDK 21+ for the patch compiler, JDK 17 for the Android tools, Android SDK platform 33 and Build Tools 34.0.0.

```sh
# JAVA_HOME: JDK 21 or newer
# AIRPLAY_JAVA_HOME: JDK 17
# ANDROID_HOME: Android SDK
python tools/build.py --version 0.1.0
```

Dependencies are downloaded from public repositories and verified against pinned SHA-256 checksums. Output is written to `dist/`. The build loads the generated artifact with Morphe to verify patch registration. No YouTube APK, private signing key or Google account is needed to build the bundle.

The Gradle project layout comes from the official template. Gradle plugin resolution may require GitHub Packages access. The verified public build path is `tools/build.py`, also used by the release workflow.

## License and origin

GPL-3.0 with the original template notices preserved. See `LICENSE`, `NOTICE`, `THIRD_PARTY_NOTICES.md` and `licenses/`. References to Morphe, YouTube and AirPlay describe compatibility and do not imply sponsorship, endorsement or certification.
