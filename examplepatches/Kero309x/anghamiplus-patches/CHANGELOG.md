## [1.3.4](https://github.com/Kero309x/anghamiplus-patches/compare/v1.3.3...v1.3.4) (2026-10-06)

### 🐛 Bug Fixes

* match the fingerprints against the verified 8.0.28 signatures ([f90c5c0](https://github.com/Kero309x/anghamiplus-patches/commit/f90c5c04b293a49c6f779a49d7ca129891f3991f))

## [1.3.3](https://github.com/Kero309x/anghamiplus-patches/compare/v1.3.2...v1.3.3) (2026-10-06)

### 🐛 Bug Fixes

* credit the original Anghami patch set ([48de97c](https://github.com/Kero309x/anghamiplus-patches/commit/48de97c5a3b38bbdab5a67673bb7ec045f725555))

## [1.3.2](https://github.com/Kero309x/anghamiplus-patches/releases/tag/v1.3.2) (2026-10-05)

### ✨ New Features

* **lyrics:** unlock the full synced-lyrics view, drop the lyrics paywall banner and rewrite the
  lyrics request so it carries a valid session token, handled by the bundled `LyricsUrlHook` extension.
* **privacy:** neutralise the in-house Silo activity pipeline, the Braze, Adjust, Firebase and
  Google Analytics hooks, Bugsnag crash reporting and the share telemetry calls.
* **interface:** hide sponsored cards, in-app rating prompts and the remaining upgrade and Gold
  upsell surfaces.
* **playback:** remove the forced-shuffle behaviour, the client skip counter, the queue
  restrictions and the local offline download quotas.
* **entitlement:** activate the local Plus state and restore the Plus badge on the profile header.
* **system:** bypass `FLAG_SECURE` so the app can be captured, and emulate the official signature
  header so API authorisation keeps working after re-signing.

### 🐛 Bug Fixes

* **lyrics:** bundle the extension dex with `extendWith` so the injected URL hook resolves at
  runtime, and inject it with a register count that passes Dalvik verification.
* **banners:** point the upgrade-banner patch at the bytecode signature that is actually declared.

### 🔧 Improvements

* The supported Anghami build, its version codes and its ABIs are declared once in
  `core/AnghamiTarget`.
* Every feature now lives in a single file under a domain package, with its bytecode signatures
  next to the patch that consumes them.
* Bytecode edits are expressed through the shared `core/Bytecode` stubs instead of repeated smali.

---

# Changelog

All notable changes to **AnghamiPlus Patches** will be documented in this file.

Releases follow [Semantic Versioning](https://semver.org/spec/v2.0.0.html) and are generated from
[Conventional Commits](https://www.conventionalcommits.org/) by semantic-release. Do not edit the
generated sections by hand — see [CONTRIBUTING.md](CONTRIBUTING.md) for the workflow, and the
[README](README.md#-patch-catalogue) for the list of patches in the current bundle.
