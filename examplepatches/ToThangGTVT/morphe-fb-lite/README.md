# morphe-fb-lite

[Morphe](https://github.com/MorpheApp) patches for **Facebook Lite** (`com.facebook.lite`).

Add these patches to Morphe: https://morphe.software/add-source?github=ToThangGTVT/morphe-fb-lite

## Patches

<!-- PATCHES_START EXPANDED -->
> **[v1.4.0](https://github.com/ToThangGTVT/morphe-fb-lite/releases/tag/v1.4.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;6 patches total
<details open>
<summary>📦 Facebook Lite&nbsp;&nbsp;•&nbsp;&nbsp;6 patches</summary>
<br>

**🎯 Supported versions:**

| 530.0.0.8.106 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Hide sponsored posts](#hide-sponsored-posts) | Hides sponsored posts in the news feed and skips sponsored reels. |  |
| [Install beside Meta's apps](#install-beside-meta-s-apps) | Lets the patched app install while Facebook, Messenger or other Meta apps are installed, by renaming the permissions it shares with them. |  |
| [Morphe settings](#morphe-settings) | Adds a settings screen to the app icon's long-press menu, with a font size slider. |  |
| [Use system font](#use-system-font) | Blocks the downloaded Meta fonts (Optimistic, Instagram Sans, emoji, ...) so the app falls back to the system font. |  |
| [Use system font in feed](#use-system-font-in-feed) | Draws feed text with the system font instead of the font the server sends. |  |
| [Video download and auto next reel](#video-download-and-auto-next-reel) | Adds a button to download the playing video, and moves to the next reel when one ends. Both are switched in the Morphe settings screen. |  |

</details>

<!-- PATCHES_END -->

Tested on Facebook Lite `530.0.0.8.106` (arm64-v8a, APKMirror APK).

## How "Use system font in feed" works

The feed does not use Android fonts at all. The server sends each glyph as vector outlines (a Roboto
lookalike), and the app rasterizes them into an atlas with `X.0eF`, a class in the secondary dex.
The extension adds a class with the same name that fills the same glyph boxes with the system font,
so line layout does not change. Icons and characters the system font lacks still go to the app's
own rasterizer. The obfuscated class names are hard-coded, so this patch supports only
`530.0.0.8.106`. Findings and details are in [docs/HANDOFF.md](docs/HANDOFF.md) (Vietnamese).

## How "Hide sponsored posts" works

Sponsored posts are inserted by the server into the feed's component tree. The extension replaces
the app's props decoder (`X.1DY`) with a class that delegates to the original, then hides each
sponsored post: it is marked hidden and gets height 0, so no gap is left, and nothing is removed
from the tree the server updates by index. Sponsored reels are made unsnappable, so swiping skips
them. Both are recognized by their structure, not by the "Sponsored" label, so it works in any
language. Supports `530.0.0.8.106` only.

## Settings

Long-press the app icon and choose **Morphe settings** for the font size (80% to 150%, Facebook lays the
app out for it after a restart) and the video download and auto next reel switches.

## How "Use system font" works

Facebook Lite ships no fonts in the APK. At runtime it downloads them into
`/data/data/com.facebook.lite/files/` and loads them with `Typeface.createFromFile()`.
If loading fails, it falls back to `Typeface.create(name, 0)`, i.e. the system font.

The font loader lives in the secondary dex packed in
`assets/secondary-program-dex-jars/store-0.dex.spo` (Facebook Superpack format),
which the patcher cannot modify. So the patch hooks the primary dex instead:

1. `ClientApplicationSplittedShell.attachBaseContext()` calls
   `UseSystemFontPatch.blockDownloadedFonts(context)` at startup.
2. The extension replaces each font file with a non-empty directory of the same name.
   The download can no longer write the file, `Typeface.createFromFile()` fails,
   and the app uses the system font.

If Facebook adds a new font file name, add it to `FONT_FILES` in
[UseSystemFontPatch.java](extensions/extension/src/main/java/app/fblite/extension/UseSystemFontPatch.java).

## Build

Requires JDK 21 and a GitHub PAT with `read:packages`
(see [Morphe patcher setup](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/2_1_setup.md#-prepare-the-environment)):

```
./gradlew buildAndroid
```

The bundle is written to `patches/build/libs/*.mpp`.
Pushing to `main` builds and publishes a release with GitHub Actions.

## License

GPLv3, based on [morphe-patches-template](https://github.com/MorpheApp/morphe-patches-template).
