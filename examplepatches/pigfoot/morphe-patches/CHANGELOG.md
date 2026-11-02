## [0.5.0](https://github.com/pigfoot/morphe-patches/compare/v0.4.1...v0.5.0) (2026-11-01)

### ✨ New Features

* **windy:** add premium features for 51.3.2 ([#9](https://github.com/pigfoot/morphe-patches/issues/9)) ([09e18c1](https://github.com/pigfoot/morphe-patches/commit/09e18c150466fc2b5da378ef72ac7e434a098f00))

## [0.4.1](https://github.com/pigfoot/morphe-patches/compare/v0.4.0...v0.4.1) (2026-10-29)

### 🐛 Bug Fixes

* **pitt:** improve Google account sign-in defaults and MicroG guidance ([#7](https://github.com/pigfoot/morphe-patches/issues/7)) ([5a1c210](https://github.com/pigfoot/morphe-patches/commit/5a1c210570f5a8fd7fb3d5d49ccf0cc5ce964a1d))

## [0.4.1](https://github.com/pigfoot/morphe-patches/compare/v0.4.0...v0.4.1) (2026-10-29)

### 🐛 Bug Fixes

* **pitt:** improve Google account sign-in defaults and MicroG guidance ([#7](https://github.com/pigfoot/morphe-patches/issues/7)) ([5a1c210](https://github.com/pigfoot/morphe-patches/commit/5a1c210570f5a8fd7fb3d5d49ccf0cc5ce964a1d))

## [0.4.0](https://github.com/pigfoot/morphe-patches/compare/v0.3.0...v0.4.0) (2026-10-29)

### ✨ New Features

* **pitt:** add local sponsored features and GmsCore sign-in ([#6](https://github.com/pigfoot/morphe-patches/issues/6)) ([ab02ec1](https://github.com/pigfoot/morphe-patches/commit/ab02ec1adbf33bb06edf7c583da1c4696f388342))

## [0.3.0](https://github.com/pigfoot/morphe-patches/compare/v0.2.1...v0.3.0) (2026-10-27)

### ✨ New Features

* **fing:** add guarded premium and telemetry patches for 12.13.5 ([262700e](https://github.com/pigfoot/morphe-patches/commit/262700ec4727293c50205e3fd8c7b3f902c41eb1))

## [0.2.1](https://github.com/pigfoot/morphe-patches/compare/v0.2.0...v0.2.1) (2026-10-25)

### 🐛 Bug Fixes

* **camscanner:** offer qualified targets without experimental opt-in ([#3](https://github.com/pigfoot/morphe-patches/issues/3)) ([9153280](https://github.com/pigfoot/morphe-patches/commit/9153280915d03e74eaa06707ec454bc2bada398b))

## [0.2.0](https://github.com/pigfoot/morphe-patches/compare/v0.1.0...v0.2.0) (2026-10-25)

### ✨ New Features

* **camscanner:** add guarded granular patches and lottery support ([#2](https://github.com/pigfoot/morphe-patches/issues/2)) ([4b58ee7](https://github.com/pigfoot/morphe-patches/commit/4b58ee70d25cb0a8cbc06c9f4f97ed4a938433b1))

## [0.1.0](https://github.com/pigfoot/morphe-patches/releases/tag/v0.1.0) (2026-10-06)

### Changed

- Package renaming is optional and unselected by default. Without it RailsGo retains its original package, provider authorities, permissions and link scheme.
- Selecting Change package name uses the default .morphe or a custom package and applies complete parallel isolation without changing the app display name.
- Sideload startup compatibility is required for supported standard and Shizuku installs; the bus patch depends on it, not package renaming. Root mount remains unqualified and unavailable.
- Preserve the helper-only extension, loaded reward metadata, original fallback and callback deduplication.
- Publish readable dependency names and clean preflight bundle outputs before future versioned releases.

### Migration

Existing .morphe or custom-package installs must select Change package name, keep the same package value and use the same local signing key to update. This release replaces the earlier 1.0.0 numbering; patch behavior is unchanged. Device startup and live bus updates still require phone validation.

## Pigfoot Patches v0.0.1

Initial release of the rebuilt repository using the official Morphe Gradle layout.

- RailsGo 1.25.2 (156), arm64-v8a APKS only.
- Change package name: configurable package with provider, permission and link isolation. The original app display name is preserved.
- Sideload startup compatibility remains a required dependency.
- Scoped bus-update completion retains loaded reward metadata, fallback behavior and duplicate-callback protection.
- Java extension with compile-only declarations excluded from the shipped bundle.
- English documentation and semantic-release automation for subsequent releases.

Keep the default package name and the same local signing key to update an existing patched installation. Device startup and live bus updates require phone validation after the Java extension migration.
