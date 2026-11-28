# Changelog

Rolling bundle — this repository is a patch *overlay* on top of upstream
[southstar21-patches](https://github.com/southstar21dev/southstar21-patches). The bundle tracks the
upstream `main` branch: when upstream releases (new version), the next CI publish of `bundle-latest`
includes it and `patches-bundle.json` is regenerated automatically. The version below is the
upstream base of the current build, not a release of this repository.

## [1.5.0](https://github.com/RoToR003/lyrics-blur-spotify/releases/tag/bundle-latest) (2026-11-27)

### ✨ New Features

* **Spotify:** Lyrics blur — blurs the lyrics lines that aren't being sung and keeps the current line sharp (Android 12+), on top of the upstream bundle (upstream base: v1.5.0, i.e. upstream `main` at build time). Supports Spotify 9.2.4.2644 (APKM).
* Not an official upstream release; **not verified on-device** (see docs/verification.md).
