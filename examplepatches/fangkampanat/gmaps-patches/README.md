<a id="google-maps-microg"></a>

# Google Maps for MicroG-RE

Patch Google Maps with [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop) and use it with [MicroG-RE 7.3.0](https://github.com/MorpheApp/MicroG-RE/releases/tag/7.3.0). This is the only supported provider.

> **BYD head units:** Use [Google Maps Automotive for MicroG-RE](https://github.com/fangkampanat/google-maps-automotive-patches) (Maps Car). This repository only gets fixes for new Maps versions.

## Patches list

<!-- PATCHES_START -->
[v1.5.0](https://github.com/fangkampanat/gmaps-patches/releases/tag/v1.5.0) · 5 patches

Eligible versions: Any version.

| Patch | Description |
| --- | --- |
| BYD navigation audio routing | Routes navigation prompts to the BYD-specific audio stream when supported, retaining the original fallback. Not needed on phones. |
| Device certification fix | Skips the uncertified-device screen that closes Maps on devices Google does not certify. |
| Google Maps for MicroG-RE | Connects supported Google Maps builds to MicroG-RE 7.3.0 and avoids a crash when a location-settings dialog cannot open. |
| Navigation speech and TTS startup | Prefers synthesized navigation speech, keeping the existing audio fallback, and starts Google TTS when Maps opens. |
| Picture-in-picture setting | Adds a Picture-in-picture On/Off setting to Maps Settings. Turn it off so navigation does not open a small window when you leave Maps; it starts on, as in Maps. Hooks inspected on Maps 26.41 and 26.42. |

<!-- PATCHES_END -->

## Requirements

- A computer with Java 21 or newer
- [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop/releases/latest) 1.19.0 or newer
- A clean Google Maps APK for Android 10 or newer

The patch accepts any Maps version and stops if a required hook is missing. Only the version below is tested.

## Tested devices

Bundle `1.5.0` with the default patches passed sign-in, online maps, location, routing, and voice guidance on an Android 16 phone with Maps `26.43.05.1002020710`, patched in Morphe Desktop `1.20.0`, with MicroG-RE `7.3.0`.

## Install MicroG-RE

1. Download `microg-7.3.0-icon-arm64-v8a.apk` from [MicroG-RE 7.3.0](https://github.com/MorpheApp/MicroG-RE/releases/tag/7.3.0).
2. If Android refuses to install MicroG-RE because another provider uses a different signing key, uninstall that provider first. **Keep official Google Play services installed.**
3. Install MicroG-RE, grant the requested permissions, allow background activity and sign in.

## Add the patch source

1. Open Morphe Desktop.
2. Click the patch source button at the top center of the window.
3. Click **Add Source** and select **Remote**.
4. Enter:

   | Field | Value |
   |---|---|
   | Name | `Google Maps for MicroG-RE` |
   | Repository URL | `https://github.com/fangkampanat/gmaps-patches` |

5. Click **Add**.
6. In **Patch Sources**, select the circle on the right of this source to make it active, then click **Done**.

## Patch Google Maps

1. Drop a clean Google Maps APK onto **Drop APK here**, or click that area to browse for it.
2. Check that the default patches are enabled: **Google Maps for MicroG-RE**, **Device certification fix** and **Navigation speech and TTS startup**. The other patches are optional.
3. Click **PATCH WITH DEFAULTS** and install the patched APK.

## Navigation voice

1. Install the patched APK from [Google TTS for MicroG-RE](https://github.com/fangkampanat/google-tts-microg#download-and-install) separately from Maps.
2. Open **Google TTS** and download Thai and English (US) voices.
3. In Maps' navigation voice settings, select **Default (language)**. Other selections can use prerecorded prompts without street names.

## Troubleshooting

### `VerifyException` at Rebuilding APK (Windows)

Some Windows date settings cause Java to write an invalid ZIP timestamp. If rebuilding fails with `com.google.common.base.VerifyException`:

1. Download [`_Start-Morphe.cmd`](./_Start-Morphe.cmd).
2. Put the script in the same folder as `morphe-desktop-*-all.jar`.
3. Double-click the script and patch the APK again.

The script runs Morphe Desktop with the `en-US` locale without changing the Windows locale.

## Credits

- [Morphe](https://github.com/MorpheApp) for Morphe Desktop, patching tools, and the upstream patch code this project builds upon.
- [Harvey843](https://github.com/Harvey843) for the generic Maps hook lookup introduced in [PR #7](https://github.com/fangkampanat/gmaps-patches/pull/7).
- [rananga](https://github.com/rananga) for the navigation TTS provider and speech-cache approach proposed in [PR #8](https://github.com/fangkampanat/gmaps-patches/pull/8).

## Notes

- The patched app uses package name `app.morphe.android.apps.maps`.
- The project is unofficial and is not supported or endorsed by Google, BYD, ReVanced, or Morphe.
- Source code is licensed under [GPL-3.0](LICENSE). Preserve [NOTICE](NOTICE) in source and derivative distributions.
