# Theme Studio, Glow, Typography and Seek bar

Target: YouTube **21.43.523**, patcher 2.1 / Desktop 1.20.0. These are four separately
selectable Afterglow patches. Native resource overlays require Android 14 or newer.

## Theme files and library

`ThemeDocument` uses the iOS `YTAfterglowTheme` version 1 schema: identity, name, summary,
foundation, 20 semantic RGBA color roles, optional typography/glow groups and seek-bar rainbow.
Import accepts JSON or XML property lists through Android's document picker. Export writes
JSON. Binary Apple property lists and archived UIColor blobs are not decoded.

JSON and theme imports are bounded to 4 MiB and 32 nesting levels. Unknown fields, duplicate
JSON keys, invalid numbers, invalid roles and half-defined gradients are rejected. The saved
library is stored in `theme_savedThemes`. Save and activation write one preference transaction;
direct legacy-color edits keep valid semantic overrides but discard stale identity/foundation.
Corrupt identity snapshots do not erase valid nonlegacy colors.

Built-ins are immutable. Duplicate/Create/Edit work on a private draft; Back asks to discard
only when changed. Save stores a custom theme and restarts YouTube. Names are normalized and
made unique. Rename preserves identity; deleting an active custom theme keeps its current look
as Custom. Reset clears active colors and glow, preserving the library and typography, as on iOS.

The editor includes foundation, hex/alpha colors, derived defaults, gradients, contrast values
and black/white contrast suggestions. Glow/typography editors require their installed patch.
Portable theme files retain all roles even where a specific native Android adapter is pending.

## Native drawing

- Resource/Litho foundation: see [`native-themes.md`](native-themes.md). Page gradients use the
  iOS vertical orientation. Known page containers become transparent; navigation retains its
  own color. Neutral server text spans use the primary/secondary role policy.
- Typography: native TextViews, StaticLayout builders, BoringLayout/legacy measurements,
  styled-span returns and the 21.43 font registry. Size/weight/style are relative to originals;
  repeated use of a Paint does not compound changes. Span copies receive font changes only,
  avoiding a second size adjustment. Draft previews never change global preferences.
- 43 unchanged iOS font assets are bundled for the corresponding picker families. Apple
  system-only faces use Android counterparts. [`font-assets.json`](font-assets.json) records
  source commit, sizes and SHA-256 values. This is not exact Apple system-font fidelity.
- Glow: one `GlowStyle` policy supplies presets, custom strength, opacity, radius, 1–12 layers,
  per-surface toggles and optional global color. Icons use cached alpha-mask blur in a parent
  overlay; native fades and selection remain effective. Player icons are selected by verified
  resource IDs so fullscreen thumbnails and artwork are excluded. Unsupported drawables are
  skipped after their first mask failure. Canvas controls use cached continuous
  falloff gradients. The original icon and scrubber stay sharp above the bloom.
- Seek bar: verified `Ljsb.onDraw` final scrubber draw, geometry `V`/`w`, separate played/live
  resources, both Shorts resource branches, and `Lavdz.a` gradient factory. Timed-marker circles
  are not replaced. Optional 200 ms scrubber motion, 0–100 percent added size, aspect-fit custom
  PNG and glow preserve native alpha. Track bloom is drawn before the custom scrubber.

Image input is bounded to 8 MiB / 64 megapixels, sampled before decoding and normalized to at
most 256 pixels. Preference export/import preserves PNG data; clearing the image restores the
native circle. A malformed image fails open.

## Validation

Evidence root: `/mnt/c/Users/Corey/ytag-scratch/android/port-completion-20261113/`.

- 438 JVM theme/document/library/glow/motion checks and 83 visibility checks pass.
- Strict build 15 validation completed with exit code 0: 21/21 standalone, 22/22 with official
  GmsCore. The combined APK signature verified and installation on Android 16 succeeded.
- Emulator: custom save/restart/persistence, theme JSON export/import and XML import, imported typography and
  glow settings, custom image picker and size selection, native feed gradient, tab glow, and
  video playback were exercised. Build 12 also verifies the selected font in feed titles, watch metadata and comments, and
  preserves the full custom scrubber above the track glow in portrait and fullscreen. Seeking
  advances playback correctly. Draft discard, rename and deletion
  preserve the active theme. Typography, seek-bar and color resets restore defaults; saved
  themes survive. These flows were verified in the signed build 12 APK. Build 15 excludes
  anonymous thumbnails from icon masks, keeps the verified fullscreen icon eligible, and
  remembers unsupported drawables to avoid repeated mask failures. The portrait/fullscreen
  retest preserves the fullscreen icon glow and thumbnail colors; the YTAfterglow error log
  and crash buffer are clean.
- Useful evidence: `exported-theme.json`, `gradient-native-09.png`, `glow-mono-home-09.png`,
  `glow-lab-09.png`, `scrubber-image-saved.png`, `native-home-12.png`,
  `native-player-12.png`, `native-seek-middle-12.png`, `fullscreen-controls-12.png`,
  `glow-disabled-12.png`, `fullscreen-controls-15.png`, `runtime-fullscreen-15.log`,
  `crash-fullscreen-15.log`, and each strict run's `command.json`, `result.json`, `patch.log`.

## Remaining coverage

The full Android port is not complete. Theme roles for buffered progress and live-specific
scrubbers still need verified native adapters. Some server-rendered and custom controls may
keep native styling. Shorts, live streams and promo scrubbers require separate runtime
coverage. Exact iOS blur/font rasterization and physical-device behavior are not
established by these emulator results. Pending adapters and unrelated feature groups remain
tracked in `tools/parity.json` and `HANDOFF.md`.
