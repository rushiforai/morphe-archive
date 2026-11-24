## [0.4.2](https://github.com/stivencop414-bot/PatchLab/compare/v0.4.1...v0.4.2) (2026-11-24)

### 🐛 Bug Fixes

* **meitu:** use instructions.size instead of -1 for <clinit> insertion (fixes IndexOutOfBoundsException) ([6d400b8](https://github.com/stivencop414-bot/PatchLab/commit/6d400b8a08ed46852237c11493397b3bf1cef3a6))

## [0.4.1](https://github.com/stivencop414-bot/PatchLab/compare/v0.4.0...v0.4.1) (2026-11-24)

### 🐛 Bug Fixes

* **meitu:** initialize static VIP fields E=1 F=1 in <clinit> to prevent startup override ([a46c54f](https://github.com/stivencop414-bot/PatchLab/commit/a46c54f131af3e8cd84536e83aabd2d2bd059b89))

## [0.4.0](https://github.com/stivencop414-bot/PatchLab/compare/v0.3.1...v0.4.0) (2026-11-24)

### ✨ New Features

* **meitu:** add Unlock VIP patch for Meitu 12.23.3 ([33c9ecc](https://github.com/stivencop414-bot/PatchLab/commit/33c9ecc6d5f0eb0bed0efffdace6152d4724cbd3))

## [0.3.1](https://github.com/stivencop414-bot/PatchLab/compare/v0.3.0...v0.3.1) (2026-11-23)

### 🐛 Bug Fixes

* **meitu:** stop the Meitu patches from breaking startup and the editor ([88085ed](https://github.com/stivencop414-bot/PatchLab/commit/88085ed808040c4c2ee8a882335c8dce28eb3869))

## [0.3.0](https://github.com/stivencop414-bot/PatchLab/compare/v0.2.1...v0.3.0) (2026-11-23)

### ✨ New Features

* **meitu:** add Meitu patches marked experimental ([3ad9f7e](https://github.com/stivencop414-bot/PatchLab/commit/3ad9f7e48876a400621eb9b2a39ae65437586af8))

## [0.2.1](https://github.com/stivencop414-bot/PatchLab/compare/v0.2.0...v0.2.1) (2026-11-22)

### 🐛 Bug Fixes

* update PatchLab branding and source links ([7303643](https://github.com/stivencop414-bot/PatchLab/commit/7303643e7eb5e213fb8ae6fe21581d879d43057c))

## [0.2.0](https://github.com/stivencop414-bot/Morphe-Vix-Patches/compare/v0.1.1...v0.2.0) (2026-11-22)

### ✨ New Features

* combine ViX, Ditu, and TV Colombia Play patches ([5297af7](https://github.com/stivencop414-bot/Morphe-Vix-Patches/commit/5297af77c8812f912dd597e3ee0eb29f4bd0d9d7))

# Changelog

## v0.1.1 (2026-11-21)

### Fixed

- `Disable telemetry and tracking`: preserve `appInstance` (`tracking/b;->c`) initialization while skipping `Permutive` construction and disabling Permutive event tracking (`e()`, `g()`, `a()`, `c()`, `f()`), fixing a startup `UninitializedPropertyAccessException` in `UiPageScreenFragment`.

## v0.1.0 (2026-11-21)

Initial standalone Morphe patch bundle for **ViX `4.52.1_mobile`** (`com.univision.prendetv`, versionCode `7902`).

### Added

- `Block player ads` (Lura prerolls, pause ads, GAM `pod-serve`, clip ad configs, Google IMA).
- `Auto-skip server-side ads` (`LuraPlayer.skipAd()` guarded by `!isLive()`).
- `Hide promotional popups` (`BrazeInAppMessageManager.displayInAppMessage`).
- `Disable telemetry and tracking` (NewRelic, Permutive, AppsFlyer, Conviva, PAL, AAID collector, `AD_ID` permission removal).
- `Bypass OneTrust consent delay` (optional, disabled by default).
- `Allow screenshots and screen recording` (`FLAG_SECURE` + `LuraVideoView`/`LuraPlayerView` secure flag).
- `Bypass forced app update` (`SplashScreenFragment` + `REQUIRE_UPGRADE` state).
- `Unlock Developer Tools` (`SettingsScreenFragment` + passcode verifier bypass).
