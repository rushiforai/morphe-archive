# Android TV

These apps have patches for their Android TV builds. On a TV, patch the Android TV build, not the phone build. The table lists each app's own patches and the versions they were tested on. Disable auto-updates, Hide device identifiers, and Hide rating prompt also cover most of these apps, as [What the patches do](patches.md) explains.

The Android TV patches have moved to their own source, [TV Morphe Patches](https://github.com/semicoloncolonel/tv-morphe-patches). Add it in Morphe Manager with the link in its README. The pre-releases of mobile-morphe-patches no longer include the Android TV apps. Its 1.1.0 release is the last stable release that does: from 1.2.0, the Android TV patches are only in the TV source.

| App | Patches | Tested version | Notes |
|-----|---------|----------------|-------|
| Apple TV | Auto-skip (experimental)<br>Hide rating prompt (experimental)<br>Show release times (experimental)<br>Block analytics & tracking (experimental, off by default) | `17.0.3`<br>`17.0.2` | A separate app from the phone build, with its own patches. |
| Disney+ | Skip ads<br>Skip launch video<br>Block analytics & tracking (experimental, off by default) | `26.20.0+rc3-2026.11.02` | The phone and Android TV builds share the version name, `26.20.0+rc3-2026.11.02`. The Android TV build's version code is `1793662190`, and the phone build's is `179366219`. |
| ESPN | Skip ads (experimental)<br>Block analytics & tracking (experimental, off by default) | `6.13.2` | A separate app from the phone build. It runs on the same Disney streaming platform as Disney+, so its Skip ads works the same way. |
| Fox One | Disable Pairip license check<br>Skip ads (experimental)<br>Block analytics & tracking (experimental, off by default) | `1.20.0` | The Android TV build has its own version, `1.20.0`. The phone build is `1.25.1`. |
| HBO Max | Skip ads<br>Block analytics & tracking (experimental, off by default)<br>Video quality (experimental, off by default) | `22.0.0.36` |  |
| Hulu | Skip ads (experimental)<br>Block analytics & tracking (experimental, off by default) | `C59F39CFP3.10.33` (experimental) | A separate app from the phone build (`com.hulu.livingroomplus`, version `C59F39CFP3.10.33`), on a native WebKit engine that cannot be dex-patched. See [Installing Hulu on Android TV](#installing-hulu-on-android-tv) for the download, patch, and install steps. Skip ads is **experimental**: it bundles a native library that hooks `inflate` inside `libwkf_support.so` and strips the stitched ad periods from the DASH manifest in-process, with no root. On an NVIDIA Shield it removed every ad break from an on-demand episode, but it has not been tested widely and may not remove every ad. It does not affect ad-free content. |
| JustWatch | Block ads<br>Hide sponsored titles<br>Block analytics & tracking (off by default)<br>GmsCore support (experimental, off by default)<br>Hide unavailable titles (experimental, off by default)<br>Hide watched titles (experimental, off by default)<br>Streaming titles only (experimental, off by default) | `26.44.5`<br>`26.43.8` |  |
| MGM+ | Skip lion intro<br>Block analytics & tracking (experimental, off by default)<br>Disable MGM+ AI (off by default) | `241.0.2026241001` | The Android TV build plays without Amazon's player, so Skip ads, Skip pre-roll promo, and Remove social sign-in apply only to the phone build. |
| MLB | Skip ads<br>Translate ad break screen (experimental)<br>Hide betting odds (off by default)<br>Block analytics & tracking (off by default)<br>Mask live ad breaks (experimental, off by default) | `26.21.0.76` | GmsCore support and Hide surveys and rating prompt apply only to the phone build. |
| NBA | Reject tracking consent<br>Skip ads (experimental)<br>Block analytics & tracking (experimental, off by default) | `1.1.0.20261026155843` | A separate app from the phone build. Its Skip ads removes the ads the app plays itself. Ads that are part of a live broadcast still play. |
| NewsNation | Hide rating prompt<br>Skip ads<br>Block analytics & tracking (off by default) | `4.94`<br>`4.71` | A separate app from the phone build, with its own patches. |
| NFL | Reject tracking consent<br>Skip ads (experimental)<br>Block analytics & tracking (experimental, off by default) | `18.27.0` | The Android TV build has its own version line. The phone build is `61.0.19`. |
| PBS | Skip ads (experimental)<br>Block analytics & tracking (experimental, off by default) | `5.27.0` | One build serves phones and Android TV. |
| Peacock | Skip ads (experimental)<br>Block analytics & tracking (experimental, off by default) | `7.10.200` | Disable Xfinity auto sign-in applies only to the phone build. |
| Plex | Hide sponsored content<br>Skip ads<br>Block analytics & tracking (off by default) | `2026.22.0` |  |
| Pluto TV | Mask live ad breaks<br>Skip ads<br>Skip launch video<br>Translate ad break screen (experimental)<br>Block analytics & tracking (experimental, off by default) | `17.4.0`<br>`17.3.0` | The phone and Android TV builds have the same version. The Android TV build's version code is `520000991`, and the phone build's is `420000991`. |
| Prime Video | Skip ads (experimental)<br>Force highest quality (experimental, off by default) | `6.24.13+v16.0.1.93` | A separate app from the phone build, on the native Ignite engine, which cannot be dex-patched. Skip ads is **experimental**: it bundles a native library that hooks `libignite`'s memory copies and empties the ad-decision response in-process, with no root. On an NVIDIA Shield it removed the ad breaks from a TV episode and the show played straight through. Ads in live channels are server-stitched into the stream and still play. Force highest quality reports every video quality as supported, so the app streams the highest; it can stutter or fail on a device that cannot decode the top quality. |
| Starz | Skip pre-roll promo (experimental)<br>Block analytics & tracking (experimental, off by default) | `6.12.0`<br>`6.11.0` | The phone and Android TV builds share the version, `6.12.0`. The Android TV build's version code is `9510`, and the phone build's is `4518`. |
| Tubi | Hide sign-in prompts<br>Hide update prompts<br>Highest quality (experimental)<br>Remove social sign-in<br>Skip ads<br>Block analytics & tracking (experimental, off by default) | `10.44.5001` | The Android TV build has its own version, `10.44.5001`. The phone build is `10.44.3`. |
| YouTube TV | YT TV+ (ad-free YouTube TV)<br>Skip ads (experimental, official app 4.01.03 only) | `7.32.300` (YT TV+)<br>`4.01.03` (official app, experimental) | Gives you **YT TV+**, an ad-free YouTube TV app. See [Installing YT TV+ on Android TV](#installing-yt-tv-on-android-tv) for the steps. On devices with Android 12 or later, the official YouTube TV app, version `4.01.03`, can be patched directly with Skip ads instead. That version needs Android 12, so the NVIDIA Shield, on Android 11, cannot run it and uses YT TV+. Skip ads on the official app has not been tested on a device yet. Patch the whole `4.01.03` bundle from APKMirror. Live broadcast commercials are part of the broadcast and still play. |

[Known issues](known-issues.md) includes the problems that happen only on a TV.

## Getting the Android TV build

APKMirror lists the Android TV build separately, with "Android TV" in its name. Morphe Manager's download link searches by package name and version, so it can lead to the phone build instead. When the phone and Android TV builds share a version, as Pluto TV's do, check the version code on the download page.

To download the Android TV build directly, use [Aurora Store](https://auroraoss.com/) with a spoofed Android TV device. Aurora's [config generator](https://auroraoss.com/config-generator) creates the device config for spoofing.

## Installing Hulu on Android TV

Hulu on Android TV takes a few extra steps, because its app is a split bundle and the patched result installs as a single file. Follow these in order.

1. **Download the full app bundle, not a single APK.** You need the Android TV build: `com.hulu.livingroomplus`, version `C59F39CFP3.10.33`, including the `armeabi_v7a` split. Hulu's native libraries live in that split, so a base-only APK, or Morphe Manager's "Use installed app" on a Play Store copy, leaves them out and the patched app closes at launch. The simplest source is APKMirror. In the APK Download Helper, select Hulu (Android TV), set the source to APKMirror, and download the bundle.

2. **Patch the downloaded bundle in Morphe Manager.** Patch the file you downloaded, not an installed copy, and select the Hulu (Android TV) patches. Morphe Manager merges the splits and the patch into one APK.

3. **Install the patched file as a single APK.** The patched result is one complete APK, even though it keeps a bundle extension such as `.apkm` or `.apks`. A split installer expects several APKs inside the file and refuses the single file with an error about the package kind. Rename the patched file to end in `.apk`, and install it as an ordinary app.

4. **Sign in** with the activation code at hulu.com/activate. Live broadcast commercials are part of the broadcast and still play.

## Installing YT TV+ on Android TV

YT TV+ is YouTube TV without the ads that YouTube adds to it. YouTube TV's own app runs on an engine that cannot be patched, so YT TV+ is made from a different app, **YouTube for Android TV**, which runs the YouTube TV service once it is patched. Follow these steps in order.

1. **Add the patch source.** In Morphe Manager, add [TV Morphe Patches](https://github.com/semicoloncolonel/tv-morphe-patches) with the link in its README.

2. **Download YouTube for Android TV, version `7.32.300`.** Get it from APKMirror, where it is listed as "YouTube for Android TV (Android TV)". Choose the variant marked **APK**, with version code `732300320`. If you take a **BUNDLE** variant instead, patch the whole bundle: its native libraries are in the `armeabi_v7a` split, and YT TV+ closes at launch without them. Three things to avoid:
   - Do not use "Use installed app". The YouTube app already on your TV is usually a newer version, and the patch works only on `7.32.300`.
   - Do not download the YouTube TV app (`com.google.android.youtube.tvunplugged`). That is the app that cannot be patched.
   - Do not download the phone version of YouTube.

3. **Patch the downloaded file in Morphe Manager.** Select **YouTube TV (Android TV)** and the **YT TV+ (ad-free YouTube TV)** patch.

4. **Install the patched file.** If it still ends in `.apkm` or `.apks`, rename it to end in `.apk` first, as with Hulu. It installs as a new app called **YT TV+**. Your YouTube and YouTube TV apps stay installed and unchanged.

5. **Sign in.** Open YT TV+ and choose to sign in. It shows a code. On your phone or computer, go to [tv.youtube.com/start](https://tv.youtube.com/start), enter the code, and sign in with the Google account that has your YouTube TV membership.

YT TV+ shows the YouTube TV live guide, library, and DVR recordings. The ads that YouTube adds to them are removed. Commercials that are part of a live broadcast still play. Google Play does not update YT TV+, so it stays on the patched version.
