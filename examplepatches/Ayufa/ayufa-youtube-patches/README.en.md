<p align="center">
  <a href="https://morphe.software/add-source?github=Ayufa/ayufa-youtube-patches">
    <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
  </a>
</p>

# 🧩 Ayufa YouTube Patches

<p align="center">

![GitHub Release](https://img.shields.io/github/v/release/Ayufa/ayufa-youtube-patches?include_prereleases&style=for-the-badge)
![License](https://img.shields.io/github/license/Ayufa/ayufa-youtube-patches?style=for-the-badge)
![GitHub Stars](https://img.shields.io/github/stars/Ayufa/ayufa-youtube-patches?style=for-the-badge)
![GitHub Forks](https://img.shields.io/github/forks/Ayufa/ayufa-youtube-patches?style=for-the-badge)
![GitHub Issues](https://img.shields.io/github/issues/Ayufa/ayufa-youtube-patches?style=for-the-badge)

</p>

[日本語](README.md) | English

> [!NOTE]
>
> A personal collection of custom patches for YouTube, for Morphe. These are not official Morphe patches.
>
> They are meant to be used together with the official patches.

## Contents

- [About](#-about)
- [How to use](#how-to-use)
- [Patch details](#patch-details)
- [Patches list](#-patches-list)
- [Reporting bugs](#reporting-bugs)
- [FAQ](#faq)
- [Relationship with upstream](#relationship-with-upstream)
- [Building](#️-building)
- [License](#-license)

## ❓ About

<details>
<summary>Overview</summary>

This collection adds the small things the official patches ([MorpheApp/morphe-patches](https://github.com/MorpheApp/morphe-patches)) left unsatisfied, plus features I wanted myself.

| App | Supported versions | Patches |
|---|---|---|
| YouTube | 21.30.216 / 20.26.46 | 2 |

</details>

## ⚠️ Disclaimer

This is a personal hobby project. The patches are tested in my own environment, but there is no guarantee they work everywhere. Check carefully before using them on an important device.

## How to use

Use the button above to add this repository as a patch source in Morphe, then select the patches you want and apply them (select them together with the official patches).

⚠️ **Match the target versions exactly** (each patch is verified per version, and cannot be applied to other versions).

- YouTube "Hide live chat clutter" → **21.30.216**
- YouTube "Live latency keeper" → **20.26.46**

## Patch details

### 📺 YouTube

<details>
<summary>Live latency keeper</summary>

| | |
|---|---|
| Target | YouTube **20.26.46** only (the last YouTube that runs on Android 8.0) |
| What it does | When a live stream plays for a long time, the playback position gradually falls behind the live edge. At a fixed interval, this patch momentarily pauses and resumes playback. Resuming a live stream jumps to the newest position, so playback snaps back to the live edge no matter how far behind it has fallen (it does not measure the delay and fast-forward bit by bit) |
| Adjusting | After patching, you can change it in Morphe settings ("Ayufa patch settings") without re-patching: an on/off switch ("Keep live playback at the live edge") and the interval, typed directly as **0–120 minutes** (0 turns automatic resync off; changes apply immediately). The initial interval can also be set when applying the patch (default 10 minutes) |

Example use: an old Android 8.0 device (e.g. SOV34) left playing live streams all day, which ends up minutes behind without you noticing.

</details>

<details>
<summary>Hide live chat clutter</summary>

| | |
|---|---|
| Target | YouTube **21.30.216** (the latest stable version recommended upstream; for recent Android) |
| What it does | Hides visual clutter in live chat, such as the pinned message banner and poll cards, that gets in the way while reading chat |
| Adjusting | Each item can be selected individually when applying the patch. After patching, a dedicated "Ayufa patch settings" screen appears in Morphe settings, where "Hide pinned message banner" and "Hide live chat polls" can be toggled without re-patching (applied the next time you open chat) |

</details>

## 🩹 Patches list

See the patch list in the [Japanese README](README.md#-パッチ一覧) (auto-generated from the latest release).

## Reporting bugs

Please open an issue in this repository, with as much of the following as you can:

- The app version
- The patch source release you used (e.g. `v1.0.0`)
- The APK source and format (e.g. a single APK from APKMirror, an XAPK)
- Logs, if you can capture them

Bugs in the official patches themselves cannot be fixed here.

## FAQ

<details>
<summary>Can I apply the patches to other app versions?</summary>

No. Each patch is verified per version, so please use the exact target version's APK.

</details>

<details>
<summary>Do I use these together with the official patches?</summary>

Yes. These patches are meant to be used together with the official patches.

</details>

## Relationship with upstream

- No pull requests, issues or comments are ever sent to the upstream repository. It is used read-only
- Licensing and credits follow upstream (GPL-3.0)

### How upstream updates are tracked

- Dependabot periodically reports dependency updates (such as the patcher) from upstream
- When upstream changes its supported YouTube version, GitHub Actions (upstream-watch) detects it and opens an issue in this repository only. Nothing is ever written to upstream
- See [How upstream is tracked](docs/UPSTREAM.md) for details
- Releases are unsigned (no signing key is configured)

## 🛠️ Building

- Run `./gradlew buildAndroid` and the `.mpp` file is produced under `patches/build/libs/`
- The resulting file can be used with Morphe Desktop, like any other patch bundle
- Development happens on the `dev` branch; merging into `main` creates a stable release

## ❤️ Donate

Donations are completely optional. Using the patches and reporting bugs is already the best support.

If you would like to support development, you can do so through GitHub Sponsors.

- [GitHub Sponsors](https://github.com/sponsors/Ayufa)

## ❤️ Credits

- [Morphe](https://github.com/MorpheApp/)
- Based on the official [Morphe Patches template](https://github.com/MorpheApp/morphe-patches-template)

## 📜 License

GPL-3.0 ([LICENSE](LICENSE)). See also [NOTICE](NOTICE).
