# v1.10.6-dev.2 — Gesture vertical reversals and npm release tooling

Development-only patch. Includes the v1.10.6-dev.1 account-history restoration fix.

Issue #113:
- New "上下の折り返し（↑↓・↓↑）を認識" setting under Gestures
- Description: "OFFの場合、上下スクロール中の方向転換をジェスチャーとして認識しません"
- Default OFF on both existing installations and clean installs
- OFF: UD/DU do not cancel or claim the native scrolling touch stream
- ON: preserve existing UD/DU recognition, including delayed vertical threshold
- Preserve UL/UR/DL/DR, other gestures, multi-tabs and scroll restoration
- Apply to ordinary ListView and native My Page ScrollView
- "Restore defaults" resets the new setting to OFF

Issue #110:
- Upgrade npm build/release dependency to 11.21.2, with bundled undici 6.29.1
- Retire the temporary bundled-undici replacement workaround
- Verify npm lockfile, Node 24 release CLI import, vulnerability inventory,
  source consistency, DEX assembly and final MPP output.

Android device/emulator test remains required before any official release.
No issue is closed and no release is published from this development branch.
