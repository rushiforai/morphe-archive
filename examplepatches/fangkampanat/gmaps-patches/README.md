<a id="google-maps-microg"></a>

# Google Maps for MicroG-RE

Patch Google Maps with [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop) and use it with [MicroG-RE 7.2.1](https://github.com/MorpheApp/MicroG-RE/releases/tag/7.2.1). This is the only supported provider for the current patch.

Our Maps sign-in and location fixes were merged upstream in [MicroG-RE PR #272](https://github.com/MorpheApp/MicroG-RE/pull/272) and are included in 7.2.1. We now use the official provider; the separate BYD fork is no longer maintained.

This repository provides `.mpp` patch bundles. Supply a clean Google Maps APK to patch.

## Patches list

<!-- PATCHES_START -->
[v1.2.2](https://github.com/fangkampanat/gmaps-patches/releases/tag/v1.2.2) · 1 patch

Eligible versions: Any version.

| Patch | Description |
| --- | --- |
| Google Maps for MicroG-RE | Connects supported Google Maps builds to MicroG-RE 7.2.1 and prefers synthesized navigation speech with the existing audio fallback. |

<!-- PATCHES_END -->

## Requirements

- A computer with Java 21 or newer
- The latest [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop/releases/latest)
- A clean Google Maps APK for Android 9 or newer
- An ARM64 device with 4 KiB memory pages

The patch accepts any Google Maps version. It stops if required hooks cannot be identified safely. Compatibility with every Maps release is not guaranteed; the recorded runtime results below apply only to the listed versions and bundles.

## Tested devices and apps

The latest tested Maps version is `26.39.06.984891338`, patched with bundle `1.2.2`, using official MicroG-RE `7.2.1` and patched Google TTS `20260817.01_p0.966249458`.

| Device | Results |
|---|---|
| BYD Dolphin, DiLink 3.0 / Android 10 / 4 KiB pages | Static checks passed; the user reported normal use and TTS working. |

Phone use with this provider, 16 KiB devices, English-script street-name maneuvers, automatic voice timing while driving, and Timeline recording and backup are outside the verified scope.

## Install MicroG-RE

Use the official MorpheApp release listed below. Older patch releases retain their original provider requirements.

1. Download `microg-7.2.1-icon-arm64-v8a.apk` from [MicroG-RE 7.2.1](https://github.com/MorpheApp/MicroG-RE/releases/tag/7.2.1).
2. If Android rejects an update from another provider because the signing key differs, uninstall that provider first. This removes its accounts and settings, so you will need to sign in again. **Keep official Google Play services installed.**
3. Install MicroG-RE. On BYD, complete the setup below before signing in. On other devices, grant the requested permissions, allow background activity and sign in.
4. Check Maps and your Morphe media apps. Compatible existing YouTube and YouTube Music APKs do not need to be patched again just to switch providers.

### BYD setup after installation

1. Connect ADB to the head unit and add MicroG-RE to the Doze whitelist:

   ```bash
   adb shell dumpsys deviceidle whitelist +app.revanced.android.gms
   ```

2. Turn OFF **MicroG RE** in BYD's **Disable Autostart** screen (unchecked, gray/left) to allow automatic startup.
3. Open **MicroG RE** and grant all requested app permissions.
4. Sign in to your Google account and select **Huawei**.

## Add the patch source

1. Open Morphe Desktop.
2. Click the patch source button at the top center of the window. It shows the current source name and Stable bundle version.
3. Click **Add Source** and select **Remote**.
4. Enter:

   | Field | Value |
   |---|---|
   | Name | `Google Maps for MicroG-RE` |
   | Repository URL | `https://github.com/fangkampanat/gmaps-patches` |

5. Click **Add**.
6. In **Patch Sources**, select the circle on the right side of this source to make it the active source.
7. Click **Done** and confirm the source name and Stable bundle version appear at the top center of the Home screen.

## Patch Google Maps

1. Confirm this repository's name and Stable bundle version appear at the top center of the Home screen.
2. Drop a clean, supported Google Maps APK onto **Drop APK here**, or click that area to browse for the file.
3. After the APK loads, confirm the screen shows **Google Maps Morphe** and **PATCHES 1 enabled**.
4. Click **PATCH WITH DEFAULTS**.
5. When patching finishes, install the resulting APK on the target device.

## Navigation voice

1. Install the patched APK from [Google TTS for MicroG-RE](https://github.com/fangkampanat/google-tts-microg#download-and-install) separately from Maps.
2. On BYD, turn OFF **Speech Recognition and Synthesis from Google** in **Disable Autostart** to allow automatic startup.
3. On BYD, add Google TTS to the Doze whitelist:

   ```bash
   adb shell dumpsys deviceidle whitelist +com.google.android.tts
   ```

4. Open **Google TTS** and download Thai and English (US) voices.
5. In Maps' navigation voice settings, select **Default (language)** for spoken street names.

Explicit language selections can use prerecorded prompts.

## Troubleshooting

### `VerifyException` at Rebuilding APK (Windows)

Some Windows date settings cause Java to write an invalid ZIP timestamp. If rebuilding fails with `com.google.common.base.VerifyException`:

1. Download [`_Start-Morphe.cmd`](./_Start-Morphe.cmd).
2. Put the script in the same folder as `morphe-desktop-*-all.jar`.
3. Double-click the script and patch the APK again.

The script finds the Morphe Desktop JAR automatically and applies the `en-US` locale only to that process. It does not change the Windows system locale.

## Credits

- [Morphe](https://github.com/MorpheApp) for Morphe Desktop, patching tools, and the upstream patch code this project builds upon.
- [Harvey843](https://github.com/Harvey843) for the generic Maps hook lookup introduced in [PR #7](https://github.com/fangkampanat/gmaps-patches/pull/7).
- [rananga](https://github.com/rananga) for the navigation TTS provider and speech-cache approach proposed in [PR #8](https://github.com/fangkampanat/gmaps-patches/pull/8).

## Notes

- The patched app uses package name `app.morphe.android.apps.maps`.
- The project is unofficial and is not supported or endorsed by Google, BYD, ReVanced, or Morphe.
- Source code is licensed under [GPL-3.0](LICENSE). Preserve [NOTICE](NOTICE) in source and derivative distributions.
