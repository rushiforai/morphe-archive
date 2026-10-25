# Immich patch investigation

Target: `app.alextran.immich` **3.3.5**, version code **3032599**, arm64.
Matching upstream source: `immich-app/immich`, tag `v3.3.5`, commit
`8303cb117e197c700332b33b61b45314c9cc5bb4`.

Both patches are included in release **0.8.0**. The isolated test identity is
excluded unless `CATPPUCCIN_IMMICH_TEST=1` is explicitly set.

## Fonts

The custom font patch validates the supplied TTF and replaces all eight text
font assets in the GoogleSans and GoogleSansCode families. It preserves the
Flutter FontManifest mappings, native libraries, and MaterialIcons icon font.
Repatch the original APK to change or remove a font.

## Themes

The main interface is Flutter. Android XML styles do not theme it. The app's
theme presets and Material ColorScheme generation are compiled into
`lib/arm64-v8a/libapp.so` using Dart **3.13.2**, snapshot hash
`0451907c2eaa8467e848c0067bfe8ed4`. This snapshot uses the merged
`_kDartSnapshotData` / `_kDartSnapshotText` format. Theme work requires analysis
of that exact binary, rather than changing a seed color and calling the result
Catppuccin.

The patch replaces Material palette generation with exact Latte/Macchiato
semantic colors. It replaces the existing palettes, rather than adding named
picker entries. The original Color allocations and GC safepoints remain in place;
a 432-byte leaf lookup reuses the bypassed scheme generator's code region. The
entire input native library must match the recorded SHA256, and every edited
range also has an expected-byte check. Other architectures and modified native
builds are rejected. App networking and authentication code remain unchanged.

## Validation

* Font-only APK: all eight text assets match the chosen TTF; icon font,
  FontManifest and all native libraries remain identical to the original.
* Offline arm64 emulation: all 49 lookup call sites in both brightness modes
  return and spill the expected colors. Primary, background and text values
  checked against Latte and Macchiato.
* Combined APK: exactly the recipe's 58 native edits, isolated package/provider
  authorities, no Android account authenticator, valid archive.
* Separate `app.alextran.immich.catppuccin.test` installed with user approval.
  Startup reaches the server endpoint screen with Macchiato surfaces, mauve
  controls and JetBrains Mono. No startup exception observed. Post-login screens,
  light mode and extended navigation still need visual verification.

Selected-tab label follow-up: remove Immich's all-states label override, retain
the exact original 14px/medium/ellipsis style in Material's state resolver, and
use primary (mauve) for selected labels. Unselected/disabled paths are preserved.
Confirmed on-device: Photos label and icon both mauve; other labels keep text color.

Dark dock uses Mantle (`#1e2030`) through `surfaceContainerLow`; raised
surfaces retain their palette roles. Light-mode dock is unchanged.
