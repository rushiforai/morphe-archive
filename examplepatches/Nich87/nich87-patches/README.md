<div align="center">

# Nich87 Patches


<details>
  <summary><b>Read this in other languages</b></summary>
  <br>
  <a href="README.md">English</a>&nbsp;&nbsp;•&nbsp;&nbsp;<a href="README.ja.md">日本語</a>
</details>

<br>

<p align="center">
  <a href="https://github.com/Nich87/nich87-patches/releases/latest"><img src="https://img.shields.io/github/v/release/Nich87/nich87-patches?style=flat-square&color=blue" alt="GitHub Release"></a>
  <a href="https://github.com/Nich87/nich87-patches/releases"><img src="https://img.shields.io/github/v/release/Nich87/nich87-patches?include_prereleases&sort=semver&style=flat-square&label=pre-release&color=orange" alt="GitHub Pre-release"></a>
  <a href="https://github.com/Nich87/nich87-patches/actions"><img src="https://img.shields.io/github/actions/workflow/status/Nich87/nich87-patches/release.yml?branch=main&style=flat-square&label=CI" alt="CI"></a>
  <a href="LICENSE"><img src="https://img.shields.io/github/license/Nich87/nich87-patches?style=flat-square" alt="License"></a>
  <a href="https://morphe.software"><img src="https://img.shields.io/badge/Morphe-compatible-00D26A?style=flat-square" alt="Morphe Compatibility"></a>
  <a href="https://play.google.com/store/apps/details?id=com.apple.android.music"><img src="https://img.shields.io/badge/Apple%20Music-v7.0.0--7.0.3-FA243C?logo=apple-music&logoColor=white&style=flat-square" alt="Apple Music 7.0.0-7.0.3"></a>
  <a href="https://play.google.com/store/apps/details?id=com.twitter.android"><img src="https://img.shields.io/badge/X-v12.19.1-000000?logo=x&logoColor=white&style=flat-square" alt="X (Twitter) 12.19.1-release.0"></a>
</p>

<p align="center">
  <strong>Custom patches by Nich87 for use with <a href="https://morphe.software">Morphe</a>.</strong><br>
  This is an independent project based on the <a href="https://github.com/MorpheApp/morphe-patches-template">Morphe patches template</a>.<br>
  Provides Apple Music patches (Liquid Glass bottom bar, custom fonts, LRCLIB &amp; local lyrics, on-device pronunciation guides, a full-song lyrics editor, on-device stereo &amp; Dolby Atmos vocal separation, library backup/downloads, and Japanese metadata repair) and Twitter/X Spaces local mute. Each patch can be selected independently.
</p>

</div>

## Using the patches

Add this source in Morphe Manager:
<https://github.com/Nich87/nich87-patches>.

<a href="https://morphe.software/add-source?github=Nich87/nich87-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

Enable pre-releases for development builds from `dev`.

## Patches

<!-- PATCHES_START EXPANDED -->
> **[v1.9.0](https://github.com/Nich87/nich87-patches/releases/tag/v1.9.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;9 patches total
<details open>
<summary>📦 Apple Music&nbsp;&nbsp;•&nbsp;&nbsp;8 patches</summary>
<br>

**Package name:** `com.apple.android.music`

**🎯 Supported versions:**

| 7.0.0 | 7.0.1 | 7.0.2 | 7.0.3 |
| :---: | :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Custom font](#custom-font) | Replaces Apple Music's font across views, Compose screens, and lyrics using imported .ttf/.otf/.ttc files or system fonts, with optional SF Pro Latin preservation and per-scope settings. |  |
| [LRCLIB lyrics](#lrclib-lyrics) | Loads synced and unsynced local LRC files (per-song or auto-matched folder), pasted plain-text/LRC lyrics, and LRCLIB lyrics with per-song overrides, timing offsets, LRC export, and a source indicator. |  |
| [Library import, export and downloads](#library-import-export-and-downloads) | Adds JSON library and playlist backups, additive import, and a native download action for the entire library. |  |
| [Liquid Glass bottom bar](#liquid-glass-bottom-bar) | Adds live refractive glass to Apple Music's mini-player and bottom tabs, an animated selection lens, and a glass transition between the mini-player and Now Playing. Refraction requires Android 13 or newer. |  |
| [Lyrics editor](#lyrics-editor) | Adds an Apple Music-style full-song lyrics editor (accessed by long-pressing any lyric line) with batch editing, timing adjustments, interlude insertion with native three-dot indicators, LRC export, and edit restore controls. |  |
| [On-device pronunciation guides](#on-device-pronunciation-guides) | Generates on-device pronunciation guides for Apple Music, custom, and external lyrics (offline Japanese Kuromoji dictionary and Android ICU) with word-synced karaoke and unsynced lyrics support. |  |
| [On-device vocal separation](#on-device-vocal-separation) | Adds a vocal and accompaniment mix slider to the lyrics screen. Supports stereo and Dolby Atmos PCM after a one-time model download. |  |
| [Repair Japanese library metadata](#repair-japanese-library-metadata) | Finds romanized library metadata and repairs selected songs using Japanese catalog data, preserving library entries and syncing changes to the account. |  |

</details>

<details open>
<summary>📦 Twitter&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `com.twitter.android`

**🎯 Supported versions:**

| 12.19.1-release.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Spaces local mute](#spaces-local-mute) | Locally mute specific speakers on the listener side in Twitter/X Spaces and replays (via Space profile popups or header mute sheet) without affecting other listeners. Compatible standalone or alongside Piko. |  |

</details>

<!-- PATCHES_END -->

## Development

Use JDK 21 and Android SDK Platform 36. Authenticate GitHub CLI with the
`read:packages` scope, then build on `dev`:

```sh
gh auth refresh --hostname github.com --scopes read:packages
./scripts/gradle.sh buildAndroid
```

The Android bundle is written to `patches/build/libs/patches-*.mpp`.
The local launcher reads credentials from GitHub CLI and uses a separate
temporary Gradle cache. It does not store the token in this repository.

See [DEVELOPMENT.md](DEVELOPMENT.md) for setup, validation and release rules,
and [CONTRIBUTING.md](CONTRIBUTING.md) for contributions. Coding agents must
also read [AGENTS.md](AGENTS.md) and the repository's development skill.

## License

Licensed under [GPLv3](LICENSE), with the name restrictions in [NOTICE](NOTICE).
