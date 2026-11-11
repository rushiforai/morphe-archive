# nicoid Re v1.10.7-dev.19 — final backup compatibility and ambient efficiency fixes

Development-only successor of the user-confirmed v1.10.7-dev.18
(`41067f80a9755f3c2dd3ce1cf1500e30db51a98b`).

## Fixed

- Portable settings export/import now includes 17 direct-write keys:
  - Single-tap area rectangles/string, open-only boolean
  - Ambient enabled state and three independent playback mode booleans
  - Ambient side mask and ten integer settings, including custom values
- The registered keys are mirrored in shipped `SettingsBackupData.smali` as
  well as the Java source, so they survive an actual Morphe MPP build.
  Export retains its existing format version; existing backups remain valid.
- The ambient renderer no longer schedules TextureView/PixelCopy sampling
  if effective strength is zero or all four visual directions are off.
  The current playback-mode and global enabled switches are still respected.
  The renderer resumes immediately when a setting starts emitting light.
- Any older in-flight PixelCopy result is discarded on a settings change,
  detach or playback-mode transition. It cannot publish an obsolete glow
  or restart a stopped capture loop.

## Verification

- Dedicated JDK regression tests cover round-trip of non-default settings,
  schema/type rejection, old backup compatibility, and no-light state changes.
- Source, patched Smali and final assembled helper DEX are all checked for
  registration; the shipped MPP is also checked for the sampling helper.
- Existing comment, player, ranking, tab, touch, popup, background audio,
  and Android-compatible resource tests remain in CI.
- Actual GPU, thermal and battery performance still need device measurements.

No stable release or main merge. The proposed v1.11.0 release requires
explicit user approval, including its final release notes and assets.
