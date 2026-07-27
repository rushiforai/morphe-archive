<p align="center">
  <img src="assets/readme-header.png" alt="TikTok Patches for Morphe" width="290"/>
</p>

<p align="center">
  <a href="LICENSE"><img alt="license" src="https://img.shields.io/badge/license-GPLv3-blue.svg" /></a>
  <a href="https://github.com/MorpheApp/morphe-cli"><img alt="source" src="https://img.shields.io/badge/source-Morphe-00b894.svg" /></a>
  <a href="https://www.android.com/"><img alt="platform" src="https://img.shields.io/badge/platform-Android-3ddc84.svg" /></a>
  <a href="https://www.apkmirror.com/apk/tiktok-pte-ltd/tik-tok-including-musical-ly/tiktok-43-8-3-release/tiktok-43-8-3-2-android-apk-download/"><img alt="TikTok 43.8.3" src="https://img.shields.io/badge/TikTok-43.8.3-ff0050.svg" /></a>
</p>

<p align="center">
  <a href="https://ko-fi.com/P5P5YOUU7">
    <img height="42" src="https://storage.ko-fi.com/cdn/kofi2.png?v=3" alt="Support my work on Ko-fi" />
  </a>
</p>

<p align="center">
  <sub><em>If you are using these patches and want to support the work, it helps me keep testing, improving, and keeping the patches maintained.</em></sub>
</p>

# TikTok Patches for Morphe

<br>

**This repository is a Morphe patch source for TikTok.**

**It continues the work from earlier community TikTok patch sets, including ReVanced, with the patches adapted for Morphe and tested against newer TikTok builds. The current target is the global TikTok package, `com.zhiliaoapp.musically`, on [TikTok `43.8.3`](https://www.apkmirror.com/apk/tiktok-pte-ltd/tik-tok-including-musical-ly/tiktok-43-8-3-release/tiktok-43-8-3-2-android-apk-download/).**

The goal is to keep the existing patch set usable while adding more TikTok-focused features over time. Some features are small fixes, some are quality-of-life changes, and some need deeper testing because TikTok changes its internals often.

<br>

## Available Patches

| Patch | Description |
|---|---|
| `Always show publish date` | Keeps the video's publish date visible in its author information. |
| `Copy comments without username` | Copies only the comment text without including the creator's username. |
| `Custom offline videos limit` | Adds a custom entry to TikTok's offline videos menu with a configurable limit of up to 500 videos. |
| `Disable login requirement` | Removes TikTok's mandatory login gate from supported flows. |
| `Disable screen capture detection` | Prevents TikTok from detecting screenshots and screen recordings. |
| `Downloads` | Adds watermark-free video and photo downloads, comment sticker saving, and configurable download-folder controls. |
| `Enable Open Debug` | Repurposes TikTok's hidden Open Debug row as the entry point for Morphe settings. Required for the settings menu to appear. |
| `Feature Gate Lab` | Adds a searchable menu for viewing and overriding supported TikTok feature flags and configuration values. Client-side overrides cannot bypass server enforcement. |
| `Feed filter` | Hides feed ads, TikTok Shop items, livestreams, stories, photo posts, and videos outside configured view or like ranges. |
| `Feed tab navigation` | Controls which loaded top and bottom navigation tabs remain visible, blocks newly added tabs when requested, and can hide the Tako AI bubble. |
| `Fix Google login` | Restores Google account sign-in after patching. |
| `Hide CAPTCHA popups` | Prevents client-side verification puzzle dialogs from opening, including those shown while browsing LIVE. It does not bypass server-side checks. |
| `Hide floating promotions` | Removes floating promotional badges, coin icons, and timer banners from the Home feed. |
| `Hold-and-slide 2x lock` | Enables TikTok's native hold, slide down, and release gesture for locking playback at 2x speed. |
| `Open external links directly` | Opens profile and story website links in the system browser instead of TikTok's in-app browser. |
| `Playback speed` | Enables playback-speed controls for all videos and remembers the selected speed between videos. |
| `Remember clear display` | Remembers TikTok's clear-display state between videos. |
| `SIM spoof` | Replaces SIM country and operator values reported to TikTok and provides country presets. TikTok may still use IP address, account history, language, and other region signals. |
| `Sanitize sharing links` | Removes tracking parameters from TikTok links before they are shared. |
| `Settings` | Adds the Morphe settings screen inside TikTok. |
| `Show seekbar` | Shows TikTok's native video seekbar where it would normally be hidden. |
| `Translate comments` | Adds comment translation controls using TikTok's translation system, with selectable language exclusions. |

<br>

## Add Source

Open this link on the Android device where Morphe is installed:

[Add TikTok Patches for Morphe](https://morphe.software/add-source?github=icysymmetra/tiktok-patches-for-morphe)

You can also copy this repository URL and paste it into Morphe's add source field:

[https://github.com/icysymmetra/tiktok-patches-for-morphe](https://github.com/icysymmetra/tiktok-patches-for-morphe)

<br>

## Planned Work

### In Progress

- [~] Update patch compatibility and bytecode hooks for a newer TikTok version.

<br>

## Supported Target

- App: TikTok
- Version: [`43.8.3`](https://www.apkmirror.com/apk/tiktok-pte-ltd/tik-tok/tiktok-43-8-3-2-release/tiktok-43-8-3-4-android-apk-download/)
- Package: `com.zhiliaoapp.musically`

Only the global package is declared in Morphe compatibility metadata. The JP package may share some internals, but it is not advertised as supported unless it gets its own proof pass again.

## Building

Build the Morphe patch bundle and metadata:

```bash
./gradlew :patches:buildAndroid :patches:generatePatchesList
```

The generated bundle is written to:

```text
patches/build/libs/patches-<version>.mpp
```

Morphe reads `patches-bundle.json` from this repository, downloads the `.mpp` release asset listed there, and loads the patch metadata from that bundle.

<br>

## Project Structure

- `patches/`: Kotlin patch definitions, fingerprints, and shared patch utilities.
- `extensions/`: Java extension code injected into TikTok by the patches.
- `patches-list.json`: Generated patch metadata.
- `patches-bundle.json`: Morphe source metadata for the published release bundle.

## Credits

- Thanks to [@lyyako](https://github.com/lyyako) for the original contributions behind the simplified sanitize sharing links hook, show seekbar patch, anti-recording patch, `Open external links directly`, and `Always show publish date`.

## Notes

- The source is based on [RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced) and the [Morphe patches template](https://github.com/MorpheApp/morphe-patches-template).
- It is not affiliated with TikTok, ByteDance, or Morphe.
- TikTok changes often, so compatibility is intentionally tied to the exact version and packages listed above.

<br>

## License

This project reuses the GPLv3 licensing from the projects it was built on.

See [LICENSE](LICENSE) and [NOTICE](NOTICE).
