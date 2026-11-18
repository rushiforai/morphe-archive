# Native themes

The separately selectable **Theme Studio** patch includes all 30 presets, a custom editor,
saved library, JSON/XML theme import, JSON export, activation and reset. Native page gradients,
navigation/icon adapters and semantic foreground spans extend the original resource adapter.
**Typography**, **Glow** and **Seek bar** are separate named patches. See
[`theme-studio.md`](theme-studio.md) for their implementation, runtime evidence and remaining gaps.
Applying or resetting a theme restarts YouTube because native views cache resolved colors.

Native resources require **Android 14 (API 34) or newer**. Older devices retain YouTube's
colors and see the OS requirement in Theme Studio. The extension's existing minimum SDK
is unchanged. Shared palette/import behavior in Afterglow settings remains available.

## Native adapter

`ThemeResourcesPatch` isolates 74 style bindings in 55 new color aliases on YouTube 21.43.523,
then includes 38 existing semantic color resources. The resulting 93-resource map lives in
`assets/afterglow-theme-colors.txt`. Shared black, white and brand-red constants are not
overridden. Each alias retains its original resource reference when its role is unset.

The covered roles are base/elevated/navigation surfaces, primary/secondary text, accent,
selected navigation text, borders, and some style-based icons and overlay controls. This is
not full semantic coverage of every player element. A background-only import supplies readable
primary and secondary text from its foundation. Neutral foreground spans are recolored at their
text boundary. Native gradients attach to the activity content; verified page containers and
background drawables become transparent. Navigation surfaces retain their own role color.

Android resource backgrounds stay opaque even when a page gradient is active. Making them
transparent caused MediaRouteButton's contrast calculation to crash at launch. User alpha is
composited over the selected foundation for resources; transparency is applied only at the
view/drawable boundary. A JVM regression test and emulator cold launch cover this distinction.

`NativeTheme` attaches a self-targeting `FabricatedOverlay` through a `ResourcesLoader` to
the app's base contexts. All resources use the final runtime package name, including when
GmsCore renames it. Android 14 API references are isolated in `ThemeOverlay`. The runtime
palette is held constant until process restart, matching native view caches. Cold startup
with the system palette removes any previously registered Afterglow overlay.

28 `attachBaseContext(Context)` methods are hooked standalone, 29 with the GmsCore bundle. The overlay is also loaded into the
main activity before native view creation, because configuration wrappers can create fresh
Resources after the base-context hook. Modern `yt_sys_color_baseline_*` attributes are mapped
alongside the older attributes. The Litho hook matches
`Lvte;->onBoundsChange(Rect)V` in classes2.dex: v2 is the color passed to `Paint.setColor`,
v1 the Paint. Only this verified background drawable is hooked. Known neutral background
colors follow the active palette; unrelated colors and selected-chip foreground fills stay
native. YouTube's appearance resolver (`Lauoa;->A()Lkvg;`, verified LIGHT/DARK enum) follows
the palette's foundation. Accent-only palettes and reset preserve YouTube's saved preference.
Existing theme-observer hooks receive the effective enum before the resolver returns it.
Litho uses that same effective mode; a style attribute was insufficient for this decision.
No generic Paint interception or global recoloring is used.

The modern context/overlay/Litho mechanisms were adapted from official Morphe source under
GPLv3 with attribution. Afterglow's semantic resource aliases, role policy and preset UI use
its own palette. The iOS screen and catalog remain the product spec.

## Patcher 2.1 compatibility

Use canonical `res/values/colors.xml` and `res/values/overlayable.xml`, preserving existing
entries. Desktop 1.20.0's encoder allocates value IDs and recognizes overlay declarations by
these filenames. Arbitrary new filenames caused `Undefined entry name` and a full-table
rebuild fallback. Those superseded packaging attempts were stopped and their logs retained.
The corrected builds encode the changed resources directly.

Emulator testing also exposed the old restart helper returning to the launcher instead of
reopening YouTube. Removing `finishAffinity()` alone did not fix process/task teardown.
Restart now flushes pending preference writes and opens an unexported, separate-process
`RestartActivity`. That foreground helper terminates the old app process, launches YouTube,
and exits itself. It uses no alarms or background-start permission. Native overlay setup
skips the short-lived restart process.

## Gates and scope

- Theme Studio and Reset All Colors appear only when the named patch is installed.
- Search exposes the theme editor entries; native-only controls require their named patch.
- `tools/parity.json` records key-level completion and partial coverage without treating a
  functioning settings page as proof of every native surface.
- The engine suite has 438 checks, including documents, library transactions, glow and seek
  motion. Settings visibility has 83 checks.
- Current build/runtime evidence is under
  `/mnt/c/Users/Corey/ytag-scratch/android/port-completion-20261113/`.

## Original adapter verification — 2026-11-13

`build-08/YTAfterglow-0.1.0-local.mpp` passes archive integrity and strict Desktop 1.20.0
validation: `standalone-08` applies all 18 named patches; `combined-08` applies all 19 selected
patches including official GmsCore. The combined test APK verifies its signature and installs
on the Android 16 phone AVD `YTAG_Glow_Check`.

The settings row opens the actual Theme Studio. Preset selection, active identity/checkmark,
swatches and holiday grouping were exercised. Warm Sand selects a light native foundation
with readable text/icons; Midnight Blue selects dark. The measured main-page colors match
the catalog (`#FAF5E8` and `#0D0D26`, each covering over two million screenshot pixels).
The separate-process restart returns to YouTube automatically for both light and dark presets.
Theme Studio reset and Themes → Reset All Colors both remove
the overlay and restores the saved native dark appearance (`#0F0F0F` page, `#212121` card).
Captured runtime logs have no Afterglow errors or fatal exception; the crash buffer is empty.
The emulator was left with system colors restored and shut down after testing.

Key evidence: `verified-warm-home.png`, `verified-restart-dark.png`,
`verified-system-reset.png`, their UI XML dumps, `verified-pixel-colors.txt`,
`verified-runtime.log`, `verified-crash.log`, and the two strict patch result JSON files.
This is emulator evidence, not physical-device, playback, or complete iOS visual-parity proof.

The later editor/library, gradient, glow, typography and seek-bar work is documented in
[`theme-studio.md`](theme-studio.md); the results above preserve the original solid-color and
reset checkpoint.
