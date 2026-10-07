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
