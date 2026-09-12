# BlueIT Service — TikTok Patches

**BlueIT Service is a Morphe patch source for TikTok.**

It targets the global TikTok package `com.zhiliaoapp.musically` on **TikTok 46.4.3** and combines the maintained patch catalog with additional BlueIT features.

## Available patches

| Patch | Description |
|---|---|
| `Always show publish date` | Keeps the video's publish date visible in its author information. |
| `BlueIT Service` | Adds the BlueIT Service settings screen inside TikTok. |
| `Copy comments without username` | Copies only the comment text without including the creator's username. |
| `Custom offline videos limit` | Adds a custom entry to TikTok's offline videos menu with a configurable limit of up to 500 videos. |
| `Disable login requirement` | Removes TikTok's mandatory login gate from supported flows. |
| `Disable long-press quick share` | Keeps long-pressing Share from opening TikTok's quick-share interaction. |
| `Disable screen capture detection` | Prevents TikTok from detecting screenshots and screen recordings. |
| `Diagnostic tools` | Adds optional structured diagnostic logs, Java crash capture, and clipboard or file report export. |
| `Downloads` | Adds watermark-free downloads, filename templates, and comment sticker saving with animated-media preservation. |
| `Enable Live search` | Shows TikTok's search entry in the Live drawer where supported. |
| `Enable non-personalized search` | Uses TikTok's non-personalized search mode instead of its saved account choice. |
| `Feature Gate Lab` | Adds a searchable menu for viewing and overriding supported TikTok feature flags and configuration values. |
| `Feed filter` | Hides feed ads, TikTok Shop items, livestreams, stories, photo posts, and videos outside configured view or like ranges. |
| `Feed tab navigation` | Controls which loaded top and bottom navigation tabs remain visible and can hide the Tako AI bubble. |
| `Fix Google login` | Restores Google account sign-in after patching. |
| `Hide already seen videos` | Keeps a local BlueIT watch-history and filters repeated videos from newly loaded feed batches. |
| `Hide CAPTCHA popups` | Hides non-account verification puzzle dialogs while preserving account verification flows. |
| `Hide floating promotions` | Removes floating promotional badges, coin icons, and timer banners from the Home feed. |
| `Hide quick comment reactions` | Hides TikTok's exposed quick emoji row in supported comment inputs. |
| `Hold-and-slide 2x lock` | Enables TikTok's native hold, slide down, and release gesture for locking playback at 2x speed. |
| `Open external links directly` | Opens profile and story website links in the system browser instead of TikTok's in-app browser. |
| `Playback speed` | Enables playback-speed controls for all videos and remembers the selected speed between videos. |
| `Remember clear display` | Remembers TikTok's clear-display state between videos. |
| `Resume videos after scrolling` | Restores a video's prior playback position when returning to it in the feed. |
| `SIM spoof` | Replaces SIM country and operator values reported to TikTok and provides country presets. |
| `Sanitize sharing links` | Removes tracking parameters from TikTok links before they are shared. |
| `Show seekbar` | Shows TikTok's native video seekbar where it would normally be hidden. |
| `Show seekbar thumbnail` | Shows TikTok's video preview thumbnail while dragging the seekbar. |
| `Stop video looping` | Stops a completed video instead of automatically replaying it. |
| `Translate comments` | Adds comment translation controls using TikTok's translation system. |

## Add source

Open the repository as a custom source in Morphe:

`https://github.com/BlueDragon4251/tiktok-patches-for-morphe`

## Supported target

- App: TikTok
- Version: `46.4.3`
- Package: `com.zhiliaoapp.musically`
- Exact acceptance APK SHA-256: `79062fb88d2eef8d6e11bbf766b4b40ee08d89cdc594ff26b549ccce7b50c4b2`

## Building

```bash
./gradlew :patches:buildAndroid :patches:generatePatchesList
```

The bundle is written to `patches/build/libs/patches-<version>.mpp`.

## Project structure

- `patches/`: Kotlin patch definitions, fingerprints, and patch utilities.
- `extensions/`: Java extension code injected into TikTok.
- `patches-list.json`: generated patch metadata.
- `patches-bundle.json`: published source bundle metadata.

## Credits

BlueIT Service keeps attribution for the projects and contributors it builds on:

- Original project and continued Morphe port work: [@icysymmetra](https://github.com/icysymmetra).
- ReVanced TikTok patch work and contributors.
- RookieEnough/De-Vanced.
- [@lyyako](https://github.com/lyyako) for contributions behind several sharing, seekbar, recording, external-link, and publish-date hooks.
- Morphe for the patching framework/runtime.

This project is not affiliated with TikTok or ByteDance.

## License

GPLv3. See `LICENSE` and `NOTICE`.
