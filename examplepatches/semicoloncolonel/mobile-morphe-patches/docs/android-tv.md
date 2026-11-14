# Android TV

These apps have patches for their Android TV builds. On a TV, patch the Android TV build, not the phone build. [Supported apps](apps.md) lists the tested versions and the patches for each app.

| App | Notes |
|-----|-------|
| Apple TV (Android TV) | A separate app from the phone build, with its own patches. It needs the full bundle; see [Apps that need the full bundle](#apps-that-need-the-full-bundle). |
| Disney+ | The phone and Android TV builds share the version name, `26.20.0+rc3-2026.11.02`. The Android TV build's version code is `1793662190`, and the phone build's is `179366219`. |
| HBO Max | |
| JustWatch | |
| NewsNation (Android TV) | A separate app from the phone build, with its own patches. |
| Plex | |
| Pluto TV | The phone and Android TV builds have the same version. The Android TV build's version code is `520000991`, and the phone build's is `420000991`. |
| Starz | The phone and Android TV builds share the version, `6.12.0`. The Android TV build's version code is `9510`, and the phone build's is `4518`. Skip launch video does not apply to the Android TV build, which opens straight to its landing screen. |
| Tubi | The Android TV build has its own version, `10.44.5001`. The phone build is `10.44.3`. |
| YouTube TV (Android TV) | Not the YouTube TV app itself, which runs on an engine that cannot be patched. This patches **YouTube for Android TV** (`com.google.android.youtube.tv`, version `7.32.300`) and turns it into a separate, ad-free YouTube TV app named "YT TV+". It installs alongside the original, loads the YouTube TV live and DVR service, and removes the ads YouTube injects into it. Sign in with an activation code at tv.youtube.com/start. Live broadcast commercials are part of the broadcast and still play. |

[Known issues](known-issues.md) includes the problems that happen only on a TV.

## Getting the Android TV build

APKMirror lists the Android TV build separately, with "Android TV" in its name. Morphe Manager's download link searches by package name and version, so it can lead to the phone build instead. When the phone and Android TV builds share a version, as Pluto TV's do, check the version code on the download page.

To download the Android TV build directly, use [Aurora Store](https://auroraoss.com/) with a spoofed Android TV device. Aurora's [config generator](https://auroraoss.com/config-generator) creates the device config for spoofing.

## Apps that need the full bundle

Some apps keep their native libraries in a separate split, not in the base APK. Patch the full bundle, with every split, not a single base APK and not Morphe Manager's "Use installed app" on a Play Store copy. Either of those drops the split that holds the native library, and the patched app closes the moment it opens, with a missing-library error. Apple TV (Android TV) needs the full bundle. On APKMirror, download the bundle, which it offers as an APKM. On APKPure or Aurora Store, keep every split.
