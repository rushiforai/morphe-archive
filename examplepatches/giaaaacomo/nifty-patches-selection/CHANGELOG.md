## [0.5.0](https://github.com/giaaaacomo/nifty-patches-selection/compare/v0.3.3...v0.5.0) (2026-10-08)

Daily Board now has a minimal phone compatibility base and five independent optional patches.

- **Enable phone support** keeps device/launcher support, responsive onboarding, safe activation switching, and photo/calendar crash fixes.
- Select **Use Open-Meteo weather**, **Enable media controls**, **Use phone charging as dock**, **Customize orientation**, and **Customize screen saver** individually in Morphe. Each includes the base automatically.
- Rotation lock bypass, screen saver angle filtering and diagnostics are available through their respective optional patches.

When updating from 0.3.3, select the weather, media and charging patches to retain those features. Base-only keeps Samsung's integrations, which may be unavailable without Samsung privileges.

Validated with Daily Board 15.1.01.3: seven CLI selections and bytecode isolation checks; base onboarding and activation switching, combined installation/settings/diagnostics and Android dream startup on Samsung SM-G998B (Android 14) through Morphe Manager.

See [Daily Board setup and permissions](https://github.com/giaaaacomo/nifty-patches-selection/blob/main/docs/DAILY_BOARD.md). This release distributes only the patch bundle; obtain and patch the APK locally.

## [0.3.3](https://github.com/giaaaacomo/nifty-patches-selection/compare/v0.3.2...v0.3.3) (2026-10-07)

### 🐛 Bug Fixes

* **samsung:** fit Daily Board onboarding on phones ([#23](https://github.com/giaaaacomo/nifty-patches-selection/issues/23)) ([098ba0c](https://github.com/giaaaacomo/nifty-patches-selection/commit/098ba0cf6672199df573f964866d651b0dbd6b22))

## [0.3.3-dev.1](https://github.com/giaaaacomo/nifty-patches-selection/compare/v0.3.2...v0.3.3-dev.1) (2026-10-07)

### 🐛 Bug Fixes

* **samsung:** fit Daily Board onboarding on phones ([#23](https://github.com/giaaaacomo/nifty-patches-selection/issues/23)) ([098ba0c](https://github.com/giaaaacomo/nifty-patches-selection/commit/098ba0cf6672199df573f964866d651b0dbd6b22))

## [0.3.2](https://github.com/giaaaacomo/nifty-patches-selection/compare/v0.3.1...v0.3.2) (2026-10-07)

### 🐛 Bug Fixes

* **samsung:** use an explicit onboarding settings intent ([9fb226f](https://github.com/giaaaacomo/nifty-patches-selection/commit/9fb226f39f9789a4ee4ed7723dc688ec4d367edb))

## [0.3.2-dev.1](https://github.com/giaaaacomo/nifty-patches-selection/compare/v0.3.1...v0.3.2-dev.1) (2026-10-07)

### 🐛 Bug Fixes

* **samsung:** use an explicit onboarding settings intent ([9fb226f](https://github.com/giaaaacomo/nifty-patches-selection/commit/9fb226f39f9789a4ee4ed7723dc688ec4d367edb))

## [0.3.1](https://github.com/giaaaacomo/nifty-patches-selection/compare/v0.3.0...v0.3.1) (2026-10-05)

### 🐛 Bug Fixes

* **samsung:** load the packaged extension directly ([#18](https://github.com/giaaaacomo/nifty-patches-selection/issues/18)) ([e7d72ef](https://github.com/giaaaacomo/nifty-patches-selection/commit/e7d72ef95b21bdb41b8f65dcf5a00f2fe0da937c))

## [0.3.1-dev.1](https://github.com/giaaaacomo/nifty-patches-selection/compare/v0.3.0...v0.3.1-dev.1) (2026-10-05)

### 🐛 Bug Fixes

* **samsung:** load the packaged extension directly ([#18](https://github.com/giaaaacomo/nifty-patches-selection/issues/18)) ([e7d72ef](https://github.com/giaaaacomo/nifty-patches-selection/commit/e7d72ef95b21bdb41b8f65dcf5a00f2fe0da937c))

## [0.3.0](https://github.com/giaaaacomo/nifty-patches-selection/compare/v0.2.5...v0.3.0) (2026-06-29)

### ✨ New Features

* **build:** adopt standalone patch template ([263965a](https://github.com/giaaaacomo/nifty-patches-selection/commit/263965a186dbbacbacf2ced76aa13427a592599e))

## [0.3.0-dev.1](https://github.com/giaaaacomo/nifty-patches-selection/compare/v0.2.5...v0.3.0-dev.1) (2026-06-29)

### ✨ New Features

* **build:** adopt standalone patch template ([263965a](https://github.com/giaaaacomo/nifty-patches-selection/commit/263965a186dbbacbacf2ced76aa13427a592599e))

# Changelog

## 0.2.5 - 2026-06-26

- Hardened Instagram notification grouping.

## 0.2.4 - 2026-06-22

- Exposed the Instagram extension context hook.

## 0.2.3 - 2026-06-22

- Added an Instagram notification test broadcast.

## 0.2.2 - 2026-06-22

- Forced Instagram notification summary creation.

## 0.2.1 - 2026-06-22

- Corrected the Android bundle release format.

## 0.2.0 - 2026-06-22

- Published the first standalone patch source.

## 0.2 - 2026-06-22

- Added Instagram notification grouping.
