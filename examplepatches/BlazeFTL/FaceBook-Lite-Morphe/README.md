<div align="center">

<picture>
  <source media="(prefers-color-scheme: dark)" srcset=".github/assets/fblite-banner-dark.svg">
  <img src=".github/assets/fblite-banner-light.svg" alt="Facebook Lite patches by BlazeFTL" width="800">
</picture>

[![Downloads badge](https://img.shields.io/github/downloads/BlazeFTL/FaceBook-Lite-Morphe/total?style=for-the-badge&label=Downloads&color=1877F2&logo=github&logoColor=white)](https://github.com/BlazeFTL/FaceBook-Lite-Morphe/releases)
[![Release badge](https://img.shields.io/github/v/release/BlazeFTL/FaceBook-Lite-Morphe?include_prereleases&style=for-the-badge&label=Release&color=FF5E5B&logo=github&logoColor=white)](https://github.com/BlazeFTL/FaceBook-Lite-Morphe/releases/latest)
[![Stars badge](https://img.shields.io/github/stars/BlazeFTL/FaceBook-Lite-Morphe?style=for-the-badge&label=Stars&color=1877F2&logo=github&logoColor=white)](https://github.com/BlazeFTL/FaceBook-Lite-Morphe/stargazers)

[![Facebook Lite badge](https://img.shields.io/badge/Facebook%20Lite-530.0.0.8.106-1877F2?style=for-the-badge&logo=facebook&logoColor=white)](#-patches-list)
[![License badge](https://img.shields.io/badge/License-GPLv3-FF5E5B?style=for-the-badge)](LICENSE)

<a href="https://morphe.software/add-source?github=BlazeFTL/FaceBook-Lite-Morphe" title="Add this source to Morphe">
  <img alt="Add to Morphe" src="https://img.shields.io/badge/Morphe-Add%20this%20source-1877F2?style=for-the-badge" height="38"/>
</a>

</div>

## 🔥 About

[Morphe](https://github.com/MorpheApp) patches for **Facebook Lite** (`com.facebook.lite`). Hides sponsored posts and ad reels, swaps Meta's downloaded fonts for your system font, saves videos and story photos in HD, and lets the patched app install right next to Facebook and Messenger.

## ✨ Highlights

| | Feature | What you get |
|:-:|---|---|
| 🚫 | **Hide sponsored posts** | Ads vanish from the feed with no gap, sponsored reels are skipped, in any language |
| 🔤 | **System font** | Feed, chats and menus all use your phone's own font |
| ⬇️ | **Video download** | One tap HD or SD download, plus auto next reel |
| 🎚️ | **Morphe settings** | Font size slider and switches, from the app icon's long-press menu |
| 🧩 | **Install beside Meta** | Patched Lite lives next to Facebook, Messenger and other Meta apps |

## ⚡ Usage

Click **[Add To Morphe↗️](https://morphe.software/add-source?github=BlazeFTL/FaceBook-Lite-Morphe)** with Morphe installed, or add `https://github.com/BlazeFTL/FaceBook-Lite-Morphe` as a patch source in Morphe. Pick Facebook Lite, select patches, patch.

> [!NOTE]
> Tested on Facebook Lite `530.0.0.8.106` (arm64-v8a, APKMirror APK). Use an untouched APK, not someone else's mod.

## 🐉 Patches list

<!-- PATCHES_START -->
> **[v1.6.4](https://github.com/BlazeFTL/FaceBook-Lite-Morphe/releases/tag/v1.6.4)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;7 patches total
<a id="facebook-lite"></a>
<details open>
<summary><img src=".github/assets/icons/com.facebook.lite.png" width="18" align="absmiddle">&nbsp;&nbsp;Facebook Lite&nbsp;&nbsp;•&nbsp;&nbsp;7 patches</summary>
<br>

**🎯 Supported versions:**

| 530.0.0.8.106 | 🧪&nbsp;Any version |
| :---: | :---: |

<sub>🧪 Experimental: other versions may work, untested.</sub>

| 🩹&nbsp;Patch | 🔥&nbsp;Description |
|----------|----------------|
| <a id="facebook-lite-disable-in-app-browser"></a>[Disable in-app browser](patches/src/main/kotlin/app/fblite/patches/browser/DisableInAppBrowserPatch.kt) | Opens links in the phone's default browser instead of Facebook Lite's built-in browser. |
| <a id="facebook-lite-hide-sponsored-posts"></a>[Hide sponsored posts](patches/src/main/kotlin/app/fblite/patches/ads/HideSponsoredPostsPatch.kt) | Hides sponsored posts in the news feed and removes sponsored reels as they load. |
| <a id="facebook-lite-install-beside-meta-s-apps"></a>[Install beside Meta's apps](patches/src/main/kotlin/app/fblite/patches/coexist/InstallBesideMetaAppsPatch.kt) | Lets the patched app install while Facebook, Messenger or other Meta apps are installed, by renaming the permissions it shares with them. |
| <a id="facebook-lite-morphe-settings"></a>[Morphe settings](patches/src/main/kotlin/app/fblite/patches/settings/MorpheSettingsPatch.kt) | Adds a settings screen to the app icon's long-press menu, with a font size slider. |
| <a id="facebook-lite-use-system-font"></a>[Use system font](patches/src/main/kotlin/app/fblite/patches/font/UseSystemFontPatch.kt) | Blocks the downloaded Meta fonts (Optimistic, Instagram Sans, emoji, ...) so the app falls back to the system font. |
| <a id="facebook-lite-use-system-font-in-feed"></a>[Use system font in feed](patches/src/main/kotlin/app/fblite/patches/font/UseSystemFontInFeedPatch.kt) | Draws feed text with the system font instead of the font the server sends. |
| <a id="facebook-lite-video-download-and-auto-next-reel"></a>[Video download and auto next reel](patches/src/main/kotlin/app/fblite/patches/video/VideoToolsPatch.kt) | Adds a button to download the playing video in HD or SD (you choose the quality), and moves to the next reel when one ends. These are switched in the Morphe settings screen. |

</details>

<!-- PATCHES_END -->

## 🧰 Settings

Long-press the app icon and choose **Morphe settings**:

- 🔠 **Font size**: 80% to 150%, Facebook lays the app out for it after a restart
- ⬇️ **Video download** and **auto next reel** switches
- ❓ Whether the download asks for a quality
- 🪵 **Debug logging** and **Save log to Downloads**

## 🔬 How it works

<details>
<summary><b>🔤 Use system font</b></summary>
<br>

Facebook Lite ships no fonts in the APK. At runtime it downloads them into `/data/data/com.facebook.lite/files/` and loads them with `Typeface.createFromFile()`. If loading fails, it falls back to `Typeface.create(name, 0)`, i.e. the system font.

The font loader lives in the secondary dex packed in `assets/secondary-program-dex-jars/store-0.dex.spo` (Facebook Superpack format), which the patcher cannot modify. So the patch hooks the primary dex instead:

1. `ClientApplicationSplittedShell.attachBaseContext()` calls `UseSystemFontPatch.blockDownloadedFonts(context)` at startup.
2. The extension replaces each font file with a non-empty directory of the same name. The download can no longer write the file, `Typeface.createFromFile()` fails, and the app uses the system font.

If Facebook adds a new font file name, add it to `FONT_FILES` in [UseSystemFontPatch.java](extensions/extension/src/main/java/app/fblite/extension/UseSystemFontPatch.java).

</details>

<details>
<summary><b>🅰️ Use system font in feed</b></summary>
<br>

The feed does not use Android fonts at all. The server sends each glyph as vector outlines (a Roboto lookalike), and the app rasterizes them into an atlas with `X.0eF`, a class in the secondary dex. The extension adds a class with the same name that fills the same glyph boxes with the system font, so line layout does not change. Icons and characters the system font lacks still go to the app's own rasterizer.

The obfuscated class names are hard-coded, so this patch supports only `530.0.0.8.106`. Findings and details are in [docs/HANDOFF.md](docs/HANDOFF.md) (Vietnamese).

</details>

<details>
<summary><b>🚫 Hide sponsored posts</b></summary>
<br>

Sponsored posts are inserted by the server into the feed's component tree. The extension replaces the app's props decoder (`X.1DY`) with a class that delegates to the original, then hides each sponsored post: it is marked hidden and gets height 0, so no gap is left, and nothing is removed from the tree the server updates by index. Sponsored reels are made unsnappable, so swiping skips them. Ad videos (feed, Marketplace, Reels) are also recognized by the `adid` in the tracking data of the video itself.

All of these are recognized by structure or data, not by the "Sponsored" label, so it works in any language. Supports `530.0.0.8.106` only.

</details>

<details>
<summary><b>⬇️ Video download and file names</b></summary>
<br>

The download button follows the video on screen. The quality list shows every step Facebook offers (usually AV1; H.264 when Facebook has it). AV1, VP9 and xHE-AAC cannot be written by Android's `MediaMuxer` before Android 14, so the extension joins the picture and sound tracks itself (`Mp4Remux`, no re-encoding); sound in xHE-AAC is replaced by the plain AAC sound of the SD file. Progress shows in a card at the top and in a notification.

Files are named `Page Name-Reel-22 Oct_2026` (Reel, Story or Video) and go to `Movies/Facebook Lite`; story photos go to `Pictures/Facebook Lite`.

</details>

<details>
<summary><b>🪵 Debug log</b></summary>
<br>

Morphe settings has a **Debug logging** switch and **Save log to Downloads**. The log records how Facebook loads ads and where videos come from, to write rules from facts. See [docs/DEBUG_LOG.md](docs/DEBUG_LOG.md) and the findings in [docs/RESEARCH.md](docs/RESEARCH.md).

</details>

## 🛠️ Build

Requires JDK 21 and a GitHub PAT with `read:packages` (see [Morphe patcher setup](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/2_1_setup.md#-prepare-the-environment)):

```
./gradlew buildAndroid
```

The bundle is written to `patches/build/libs/*.mpp`. Pushing to `main` or `dev` builds and publishes a release with GitHub Actions.

## 🤝 Credits

Based on [morphe-fb-lite](https://github.com/ToThangGTVT/morphe-fb-lite) by [ToThangGTVT](https://github.com/ToThangGTVT) and [morphe-patches-template](https://github.com/MorpheApp/morphe-patches-template). More patches by BlazeFTL: **[FTL-Patches](https://github.com/BlazeFTL/FTL-Patches)**.

## 📜 License

GPLv3, see [LICENSE](LICENSE). Not affiliated with Meta or Morphe.
