# Theme color engine takeover

**Follow-up (2026-11-13):** The first native adapter and Theme Studio preset screen are now
implemented. See [`native-themes.md`](native-themes.md) for the current scope and verification.
The remainder of this document records the first foundation batch.

The first theme batch ports the shared color foundation. It does **not** mark Theme Studio,
Glow, Typography, or native YouTube theming as implemented. The named patch count and parity
totals remain 17 patches and 55 done / 4 not applicable / 140 todo.

## Implemented

- `ThemeRole` carries the 20 semantic roles and 14 legacy color keys from iOS `YTAGTheme.m`.
- `ThemePalette` resolves the explicit palette, derived roles and light/dark foundation.
  An unset role remains unset unless iOS derives it. In particular, the live scrubber
  fallback reads explicit scrubber, live and played colors in that order, without accidentally
  preferring a derived scrubber over an explicit live color.
- `ThemeCatalog` contains the 30 master presets extracted from iOS `YTAGThemeCatalog.m`,
  including identity, summaries, foundation and glow preference. The JSON snapshot records
  the source SHA-256; generation never samples screenshot colors. RGB channels are rounded
  once to Android's eight-bit ARGB representation.
- `ThemeStore` publishes immutable snapshots. Reads in drawing code reuse the cached palette;
  preference writes, import and reset invalidate it. Equivalent colors retain their revision.
  Reads before preferences are available return an uncached system palette.
- `AfterglowPrefs.update` writes a preset in one editor transaction and emits one notification,
  preserving unrelated keys. A preference revision is published before listeners run, so
  even a listener registered before the store sees the completed transaction.
- Reset removes every legacy color (including glow), the enabled-glow preference and stale
  semantic identity. Typography, glow tuning, saved themes and playback settings survive,
  following iOS `YTAGThemeStore.resetToSystemTheme`.
- Existing Afterglow settings consume the shared palette. Custom foundation now uses iOS's
  Rec.601 perceived brightness, threshold 0.55 and averaged gradient endpoints, rather than
  WCAG luminance. WCAG luminance remains the contrast calculation for readable foregrounds.

## Boundaries

The persistent store currently reads legacy ARGB integers/longs and `#RRGGBB` / `#AARRGGBB`
strings. It does not decode iOS archived UIColor blobs or persist custom semantic-only roles.
`ThemePalette.fromColors` resolves all semantic roles in memory; the saved semantic record,
custom-theme library and cross-platform theme-file workflow still need their own port.

Preset application and reset are engine APIs, not a new user-facing picker. Theme Studio
remains hidden, as do its unfinished controls. Scalar glow/typography behavior, YouTube color
resources, Litho rendering and app-wide gradient attachment remain unimplemented.

The wordmark was not recolored: the current iOS `Settings.x` uses fixed wordmark constants,
which the existing `AfterglowWordmarkView` documents. This is distinct from theme-controlled
app surfaces and control glow. The earlier handoff's statement that every wordmark color
comes from theme keys was too broad.

## Verification

Run without writing Python bytecode (the old checkout tracks two `__pycache__` files):

```sh
python3 -B -I tools/check_theme_engine.py
python3 -B -I tools/check_parity.py
python3 -B -I tools/check_tweaks.py
python3 -B -I tools/check_settings_ui.py
```

To compare the pinned catalog with the actual iOS source:

```sh
python3 -B -I tools/generate_theme_catalog.py --check \
  --ios-source /home/corey/projects/xuninc/YTAfterglow/.worktrees/yt-21.43-hook-repair
```

The theme suite tests native fallback, explicit/derived precedence, transparent and malformed
colors, preset identity, foundation, immutable snapshots, transaction boundaries, listener
ordering, cache reuse, switching between gradient and solid presets, import and reset.
JDK or Android SDK absence fails the check instead of reporting a skipped success.

Strict Morphe Desktop validation (`--validate`) additionally exposed the existing player-status
fingerprint matching both `Lascj;` and Afterglow's own `PlayerStatus` enum. Its match now excludes
the extension namespace while retaining the original enum strings. This fixes an ambiguous
match without changing the selected YouTube method.

The installed official `patches-2.0.0.mpp` has a GmsCore dependency on its overlay-button patch
(confirmed in the bundle bytecode, not inferred from newer source). It inserts two instructions
between a Cast-button cast and `View.setVisibility`. Our fingerprint allows that bounded gap
for both Cast-button types and retains its identifying literal. The match is captured before
our own insertions. Verify both standalone and combined bundles:

```sh
python3 -B -I tools/verify_bundle.py <afterglow.mpp> <youtube-21.43.523.apk> \
  --desktop-jar <morphe-desktop-1.20.0-all.jar> --out <new-run-directory>
python3 -B -I tools/verify_bundle.py <afterglow.mpp> <youtube-21.43.523.apk> \
  --desktop-jar <morphe-desktop-1.20.0-all.jar> --gms-bundle <patches-2.0.0.mpp> \
  --out <another-new-run-directory>
```

The runner enables only our named patches and optional GmsCore (plus their required
dependencies), keeps fingerprint validation enabled, saves the command and JSON result, and
fails if any selected patch is missing. It never overwrites an earlier run's evidence.

## Next implementation boundary

1. Adapt the official Android context/resource-overlay and modern Litho color hooks to consume
   `ThemeStore.snapshot().palette`, gating them on an installed named tweak. Preserve native
   colors for undefined roles and confirm fingerprints against YouTube 21.43.523.
2. Verify backgrounds, text, navigation and gradient behavior on Android, including reset and
   light/dark transitions. Treat source tests and patch application separately from runtime proof.
3. Port Theme Studio from `UI/YTAGThemesViewController.m` and `YTAGThemeEditorViewController.m`,
   including semantic persistence, saved themes and import/export. Expose only working controls.
4. Add glow and typography adapters and update parity only when the associated behavior works.

## Verified takeover results (2026-11-12)

- 252 theme-engine checks and 65 settings-visibility checks passed; parity and tweak ownership passed.
- Catalog compared with the live iOS source; the generated Java is current.
- Offline `.mpp` build and archive integrity passed.
- Desktop 1.20.0, `--validate`: 17/17 standalone; 18/18 with official GmsCore support.
- Signed combined APK verified and installed in Windows phone AVD `YTAG_Glow_Check`, Android 16,
  serial `emulator-5600`. Cold launch of Afterglow settings passed.
- Imported `theme_background=#909090` through About → Import preferences. The screen refreshed
  to the correct light foundation with dark text. Restore default settings followed by a cold
  settings launch returned to the original dark appearance.
- Captured crash buffer was empty; runtime log contained no Afterglow errors. Emulator stopped.

Evidence is under `/mnt/c/Users/Corey/ytag-scratch/android/theme-engine-20261112-01/`: build log,
combined and standalone patch JSON/logs, test APK, import fixture, UI dumps, screenshots and
runtime logs. The failed validation attempts are preserved separately. Physical-device runtime,
video playback behavior and app-wide theme appearance were not tested in this batch.
