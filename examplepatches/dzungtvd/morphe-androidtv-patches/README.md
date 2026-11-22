# 👋🧩 TV Morphe Patches

> [!NOTE]
> This is a set of Morphe patches targeting TikTok TV app on Android (and hopefully will open to more TV apps). This is for personal use but I thought it would be great to share. Everything here is AI-generated. 
>
> This project has no connection to ByteDance or to the Morphe project. 

## ❓ About

TikTok TV Patches that revive the apps by using TikTok Lite endpoint.

### How to use these patches


1. Install [Morphe Manager](https://github.com/MorpheApp/morphe-manager) 2.3.0 or newer.
2. Add this repo as a patch source: https://morphe.software/add-source?github=dzungtvd%2Fmorphe-androidtv-patches
3. Download TikTok TV from [ApkMirror](https://www.apkmirror.com/apk/tiktok-pte-ltd/tiktok-for-android-tv-android-tv/). Take the bundle labelled (arm64-v8a + armeabi-v7a) (320dpi) (Android 5+), build 1203071. It should be an .apkm file.
4. In Morphe Manager, tap **Select other apps**, then **Open APK file**, and pick that file. Android may ask for file access the first time.
5. Patch with the default selection and install.


<a href="https://morphe.software/add-source?github=dzungtvd%2Fmorphe-androidtv-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/dzungtvd/morphe-androidtv-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;13 patches total
<details open>
<summary>📺 TikTok TV (Android TV)&nbsp;&nbsp;•&nbsp;&nbsp;13 patches</summary>
<br>

**Package name:** `com.tiktok.tv`

**🎯 Supported versions:**

| 🧪&nbsp;12.3.7.1 | 12.3.4.1 |
| :---: | :---: |
| The newest TikTok TV build served by APKMirror. Every committed patch matches the stock 12.3.7.1 .apkm and has run on a 32-bit TV device. Experimental while the login work is unfinished. | The armv7 build these patches were developed and runtime-verified on. |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Debug search logging](#debug-search-logging) | Temporary diagnostic patch: logs search responses and failures to logcat. |  |
| [Enable search landing recommendations](#enable-search-landing-recommendations) | Turns on the "You may like" trending panel on the search landing screen. |  |
| [Fix TikTok TV identity](#fix-tiktok-tv-identity) | Re-tags the search and profile requests with the TikTok TV app id, which those backends require, while the feed keeps the TikTok Lite id that it is only served under; empty risk-engine answers are retried. |  |
| [Fix TikTok TV profiles](#fix-tiktok-tv-profiles) | Sends profile-head and video-grid requests to the live TikTok Lite endpoints instead of the retired TV profile backend. |  |
| [Nested comment replies](#nested-comment-replies) | Shows a comment's reply count in the row and opens its replies in a SmartTube-style sub-pane on CENTER, with BACK returning to the comment list. Fully D-pad operable. |  |
| [Play in background](#play-in-background) | Adds a More-pane Off / Only audio choice that keeps the current post playing when the TV app is backgrounded. |  |
| [Playback speed](#playback-speed) | Adds 2x, 1.5x, 1x and 0.5x playback to the player's More pane, applied with the same TTVideoEngine.setPlaybackParams call TikTok Lite uses. |  |
| [Remove TV sidebar categories](#remove-tv-sidebar-categories) | Empties the TV category lists so the sidebar only shows Search, For You, and Following, like TikTok Lite. |  |
| [Remove feed ads](#remove-feed-ads) | Drops the ad posts TikTok Lite puts in the feed, search, category and profile responses, which the TV app otherwise plays as ordinary videos. |  |
| [Render Lite image posts](#render-lite-image-posts) | Shows the pictures of a TikTok Lite image post instead of a black player, which the TV app cannot render at all. |  |
| [Render Lite subtitles](#render-lite-subtitles) | Adds the subtitles button to the player's floating row and draws the post's captions over the video, with SmartTube-style presets, size and position settings in the More pane. |  |
| [Show TikTok Lite content](#show-tiktok-lite-content) | Reports the TikTok Lite app id on the wire and targets the live feed endpoint, so the server serves TikTok content instead of the retired TV feed. | • Wire app id<br>• Wire app name<br>• Feed endpoint |
| [Translate comments and captions](#translate-comments-and-captions) | Adds TikTok's Aa translation panel to More — always translate comments, a do-not-translate list, the target language and also-translate-caption — and renders a dimmed "Translated from …" line under translated comments and above translated captions. |  |

</details>

<!-- PATCHES_END -->

## 📬 Issues / requests

Found something broken? Have a new patch idea?
Open an issue — I might get to it when I'm bored.

Before requesting a patch:

- Check whether the feature depends on server-side validation.
- Do not request region-lock bypasses.

Bug reports must include:

- Logs
- App version
- Patch source release used to create the patched APK, for example `stable v0.1.0` or `dev v0.0.1-dev.1`
- APK source/type, for example `APKMirror APK arm64-v8a` or `APKPure XAPK`

Please get in touch with me or submit a takedown request if you're an app developer and have questions regarding a patch.

I'm happy to discuss issues and will consider reasonable requests in good faith.


## Disclaimer

> **⚠️ Legal Notice**
>
> This project is provided for **educational and research purposes only**. The patches in this repository modify third-party applications and may violate the terms of service of those applications.
>
> - This project is **not affiliated** with any of the app developers listed above.
> - Use these patches **at your own risk**. The author is not responsible for any consequences.
> - If you are a developer or rights holder and believe this project infringes on your rights, please [submit a takedown request](https://github.com/dzungtvd/morphe-androidtv-patches/issues/new) and the relevant patches will be **promptly removed**.

## ❤️ Credits

Thanks to:

- [Morphe](https://github.com/MorpheApp/)
- [Revanced](https://github.com/revanced)

## 📜 License

TV Morphe Patches are licensed under the [GNU General Public License v3.0](LICENSE)
