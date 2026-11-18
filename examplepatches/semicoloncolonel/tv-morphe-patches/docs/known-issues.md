# Known issues

These problems are already known. Each row gives the cause, or a workaround when there is one. If your problem is not listed, please [report it](https://github.com/semicoloncolonel/tv-morphe-patches/issues/new/choose).

Ad blockers and DNS filters, such as AdGuard, Control D, NextDNS, and Pi-hole, cause many playback and sign-in problems on their own. Before you report a problem, try again with them turned off.

| App | Issue | Cause or workaround |
|-----|-------|---------------------|
| Apple TV | With Block analytics & tracking on, the app still contacts Apple's metrics server, `xp.apple.com`, when it starts. | Apple's metrics code takes this address from Apple's servers when the app runs, and the request is made where the patch does not reach yet. Block `xp.apple.com` with a DNS filter to stop it. This is under review. |
| Hulu | The patched app closes as soon as it opens when you patch the Play Store copy with "Use installed app". | Hulu's native libraries live in the `armeabi_v7a` split, and a Play Store install patched this way drops them. Patch the full APKM bundle from APKMirror instead, the base plus the `armeabi_v7a` split. See [Installing Hulu on Android TV](apps.md#installing-hulu-on-android-tv). |
| Hulu | The installer refuses the patched file with an error about the package kind, and the app does not install. | The patched result is a single APK saved with a bundle extension such as `.apkm` or `.apks`, and a split installer expects several APKs inside it. Rename the patched file to end in `.apk`, then install it as an ordinary app. See [Installing Hulu on Android TV](apps.md#installing-hulu-on-android-tv). |
| NewsNation, Apple TV | On a TV, Morphe Manager may offer to update the app to the phone version (NewsNation 510.3.0, Apple TV 3.0.0). | The phone and Android TV apps share a package name, and Morphe Manager compares only version numbers. Ignore the update. The Android TV versions are NewsNation 4.94 and Apple TV 17.0.2. |
| YouTube TV | YT TV+ closes as soon as it opens. | The patched file had no native libraries, which are in the `armeabi_v7a` part of the YouTube for Android TV bundle. Patch the variant marked APK on APKMirror, or the whole bundle. The patches now refuse a file without the native libraries. See [Installing YT TV+ on Android TV](apps.md#installing-yt-tv-on-android-tv). |
