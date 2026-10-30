<a id="google-maps-microg"></a>

# Google Maps for MicroG-RE

Patch Google Maps with [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop) and use it with [MicroG-RE 7.2.2](https://github.com/MorpheApp/MicroG-RE/releases/tag/7.2.2). This is the only supported provider for the current patch.

This repository provides `.mpp` patch bundles. Supply a clean Google Maps APK to patch.

> **BYD head units:** New BYD features go to [Google Maps Automotive for MicroG-RE](https://github.com/fangkampanat/google-maps-automotive-patches) (Maps Car). This repository is in maintenance mode. We fix the default patches when a new Maps version breaks them.

## Patches list

<!-- PATCHES_START -->
[v1.4.4](https://github.com/fangkampanat/gmaps-patches/releases/tag/v1.4.4) · 6 patches

Eligible versions: Any version.

| Patch | Description | Options |
| --- | --- | --- |
| BYD native battery experiment | Experimental: sends this BYD's battery and road-load model to Google through Maps' native EV route requests. Starts from the car's own average consumption, learns slowly from BMS energy/distance, and adds in-app vehicle settings. Native hooks inspected on Maps 26.41 and 26.42. Targets BYD DiLink 3; DiLink 5 unverified. | • Arrival battery during navigation |
| BYD navigation audio routing | Routes navigation prompts to the BYD-specific audio stream when supported, retaining the original fallback. Not needed on phones. |  |
| Device certification fix | Skips the uncertified-device screen that closes Maps on devices Google does not certify. |  |
| Google Maps for MicroG-RE | Connects supported Google Maps builds to MicroG-RE 7.2.2 and avoids a crash when a location-settings dialog cannot open. |  |
| Navigation speech and TTS startup | Prefers synthesized navigation speech, keeping the existing audio fallback, and starts Google TTS when Maps opens. |  |
| Picture-in-picture setting | Adds a Picture-in-picture On/Off setting to Maps Settings. Turn it off so navigation does not open a small window when you leave Maps; it starts on, as in Maps. Hooks inspected on Maps 26.41 and 26.42. |  |

<!-- PATCHES_END -->

## Requirements

- A computer with Java 21 or newer
- [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop/releases/latest) 1.19.0 or newer
- A clean Google Maps APK for Android 10 or newer
- An ARM64 device with 4 KiB memory pages

The patch accepts any Google Maps version. It stops if required hooks cannot be identified safely. Compatibility with every Maps release is not guaranteed; the recorded runtime results below apply only to the listed versions and bundles.

## Tested devices

Bundle `1.4.4` with the default patches passed sign-in, online maps, location, routing, and voice guidance on an Android 16 phone with Maps `26.43.00.1002020710`, patched in Morphe Desktop `1.19.1`, with MicroG-RE `7.2.2`.

## Install MicroG-RE

Use the official MorpheApp release listed below. Older patch releases retain their original provider requirements.

1. Download `microg-7.2.2-icon-arm64-v8a.apk` from [MicroG-RE 7.2.2](https://github.com/MorpheApp/MicroG-RE/releases/tag/7.2.2). MicroG-RE 7.2.1 updates to it in place (same signing key).
2. If Android rejects an update from another provider because the signing key differs, uninstall that provider first. This removes its accounts and settings, so you will need to sign in again. **Keep official Google Play services installed.**
3. Install MicroG-RE, grant the requested permissions, allow background activity and sign in.
4. Check Maps and your Morphe media apps. Compatible existing YouTube and YouTube Music APKs do not need to be patched again just to switch providers.

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
3. After the APK loads, confirm the screen shows **Google Maps Morphe** with these default patches enabled: **Google Maps for MicroG-RE**, **Device certification fix** and **Navigation speech and TTS startup**. Other patches are optional.
4. Click **PATCH WITH DEFAULTS**.
5. When patching finishes, install the resulting APK on the target device.

## Navigation voice

1. Install the patched APK from [Google TTS for MicroG-RE](https://github.com/fangkampanat/google-tts-microg#download-and-install) separately from Maps.
2. Open **Google TTS** and download Thai and English (US) voices.
3. In Maps' navigation voice settings, select **Default (language)** for spoken street names.

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
