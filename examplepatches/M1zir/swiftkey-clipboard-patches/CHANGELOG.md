# 0.3.1 — Correct Arabic legacy variant (2026-11-11)

- Fix the restored variant: SwiftKey has two layouts with the same Arabic 123 - Legacy label.
- Select the arrangement ending the middle row with ط, with و as the third bottom-row letter and no dedicated ؤ key.
- Keep ؤ available on long-press and preserve the native key maps.
- Add binary key-map assertions for standard, compact and PC modes to distinguish primary keys from alternatives.
- When updating from v0.3.0, reselect Arabic 123 - Legacy in Languages.

# 0.3.0 — Arabic 123 legacy layout (2026-11-11)

- Add the separately selectable Restore Arabic 123 legacy layout patch.
- Expose the built-in legacy choice when Arabic 123 is available; preserve defaults and modern layouts.
- Add emitted-DEX tests for Arabic packs, repeated reads, existing legacy selections and other languages.
- Retain clipboard history and all three upstream patches.
- Experimental: Android device validation pending.

# 0.2.0 — Custom clipboard fork (2026-11-10)

- Add Keep clipboard history forever for SwiftKey 9.13.19.3.
- Fix clipboard timestamp comparison overflow for long-lived history.
- Add emitted-DEX verification and own-source publishing configuration.
- Retain the three existing patches and upstream licensing.
- Experimental: Android device validation pending.

# Changelog

## [0.1.1](https://github.com/murilosimao/swiftkey-patch/releases/tag/v0.1.1) (2026-11-09)

- Route the keyboard's native Reorder items button to the variable-count editor.
- Clarify the shortcut count and removal instructions in the editor.
- Regression checks for reducing six shortcuts to two and for the emitted native entry hook.

## [0.1.0](https://github.com/murilosimao/swiftkey-patch/releases/tag/v0.1.0) (2026-11-09)

Initial experimental release for SwiftKey 9.13.19.3.

- Local toolbar editor with shortcut selection, ordering and native layout.
- Adapted Hooman's automatic cloud sign-in prompt and telemetry patches.
- JVM tests, emitted DEX checks and local APK packaging validation.

The keyboard has not yet been validated on a physical Android device.
