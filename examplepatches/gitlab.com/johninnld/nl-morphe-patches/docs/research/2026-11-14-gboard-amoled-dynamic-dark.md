# Gboard dynamic dark theme: AMOLED black instead of Google grey

Date: 2026-11-14. Request: an option that makes Gboard's dynamic dark theme use AMOLED black
instead of Google grey, while light mode keeps the light theme.

Target: `com.google.android.inputmethod.latin` `18.6.3.1002251336-release-arm64-v8a`
(versionCode 176071766), the build the bundle declares compatible.

## 1. Is it already there?

No. The Gboard patches in this bundle cover five theming features, none of which changes the dark
palette:

| Patch | What it does |
| --- | --- |
| Rounded Keyboard Panel | panel corner radii, theme independent |
| Frosted Glass | background blur and alpha |
| Custom Theme | ZIP theme import plus a pack gallery |
| G Logo on Spacebar | spacebar glyph |
| Key Shape Selection | unlocks Gboard's own key-shape row |

Two near-misses already ship in Gboard itself:

- The built-in *Black* color theme (`assets/theme/style_sheet_color_black.binarypb`) is already
  `#FF000000` for `default_keyboard_background_primary_color` (0x4278190080), but it is a fixed
  theme: it does not follow the system light/dark switch.
- Custom Theme import can install a black theme pack, but again as a fixed selection.

So the request is not covered, and it is doable.

## 2. Where the grey comes from

Gboard renders the keyboard from protobuf style sheets in `assets/theme/`, resolved against a
palette. The palette has a single implementation, `Lrgr;` (release 18.6.3; `Laihr;` in the beta
build), whose `a()` builds a `color_gm3_*` token map and passes the boolean
`Lrgr;->a:Z` through `b()` to pick the `gm3-dark-…` or `gm3-light-…` variant name.

The dynamic theme's rules (`style_sheet_dynamic_color_rules.binarypb`) resolve the panel colours
from Material 3 surface tokens:

| Selector | Token |
| --- | --- |
| `default_keyboard_background_primary_color` / `_secondary_` / `_header_` | `color_gm3_surface_container` |
| `.keyboard-body-area.for-non-prime-body`, `.keyboard-title-frame` | `color_gm3_surface_container_low` |
| `.keyboard-header-area.panel` | `color_gm3_surface_container_lowest` |
| `.keyboard-title-frame` (dark sheet) | `color_gm3_surface_dim` |

Those tokens are read from the dark Material theme overlay (`colorSurfaceContainer` →
`@color/…` → `@android:color/system_surface_container_dark` on Android 14+, the wallpaper neutral
ramp on Android 12–13). That ramp is a grey, which is the colour in the request.

Keys are opaque-free on purpose: `style_sheet_default.binarypb` sets `default_bordered_key_color`
to `0x4CFFFFFF`, so keys follow whatever the panel does and need no separate change.

## 3. What was added

- `patches/.../gboard/features/amoleddark/GboardAmoledDynamicDarkBytecodePatch.kt` — appends a
  guarded override to the palette constructor. The skip target is the stock `RETURN_VOID`,
  supplied as an `ExternalLabel`: a `:label` written inside an `addInstructions` snippet is
  compiled against the snippet's own method and lands on a stale address once moved
  (`VerifyError: ... target dex pc is not at instruction start`).

  ```
  iget-boolean v10, v11, Lrgr;.a:Z           # 0x2ba
  if-nez v10, <stock RETURN_VOID>            # a != 0 is the light palette
  const/high16 v10, 0xff000000
  iput v10, v11, Lrgr;.P:I                   # surface_dim
  iput v10, v11, Lrgr;.Q:I                   # surface_container
  iput v10, v11, Lrgr;.R:I                   # surface_container_low
  iput v10, v11, Lrgr;.S:I                   # surface_container_lowest
  return-void
  ```

- `patches/.../gboard/ThemingPatches.kt` — public opt-in patch **AMOLED dark keyboard**
  (`default = false`), depending on the bytecode patch.
- `patches/.../gboard/shared/generated/GboardVersionBindings.kt` — `dynamicDarkPalette*` bindings
  (`Lrgr;`, `<init>(Landroid/content/Context;Z)V`, fields `a`, `P`, `Q`, `R`, `S`).
- `patches/src/test/kotlin/patches/gboard/AmoledDynamicDarkPatchTest.kt` — assembles the patched
  constructor through a `DexPool` and asserts the guard, the register choice and idempotency.

Only the dark palette is touched: light mode, the light palette, accent colours and the elevated
surfaces (bright / container_high / container_highest, used for chips, pressed keys and dialogs)
keep Google's values.

## 4. Verification

Static and end-to-end:

- `:patches:test --tests 'patches.gboard.*'` with `GBOARD_ORIGINAL_APK` pointing at the release
  base APK (minAPI32) and at the APKCube/apkmirror minAPI26 nodpi build: 26 tests, 0 failures,
  including the two new AMOLED tests. The tests assert the branch target is the stock
  `RETURN_VOID`, which is what the first implementation got wrong.
- `morphe patch -e "AMOLED dark keyboard" --exclusive` reports
  `Changed 1 of 22508 classes to mutable`, one rebuilt dex, signed output; `dexdump` of the new
  `classes5.dex` shows the block above at `02ba`–`02c8` of `Lrgr;.<init>`.

Device acceptance (AOSP arm64 API 36 emulator, 1080x2400, `gboard_ocr_aosp`):

- Installed the patched `18.6.3.1002251336-release-arm64-v8a` (versionCode 176071766) over the
  AVD's existing debug-signed copy. A re-signed Gboard only starts with the bundle's
  **Add Gboard Signature Bypass** patch; without it Gboard dies with
  `IllegalStateException: APK is signed by unrecognized certificates`.
- Opened Settings search to raise the keyboard, then toggled `cmd uimode night` and sampled the
  same pixels. Frames are in `.analysis/gboard-amoled/`.

  | Sample | Stock palette, dark | Patched, dark | Patched, light |
  | --- | --- | --- | --- |
  | panel padding `(1068, 1557)` | `#1E1F25` | `#000000` | `#EEEDF4` |
  | most common colour below y=1450 | `#1E1F25` (491 164 px) | `#000000` (488 301 px) | `#EEEDF4` (555 323 px) |
  | key faces | `#38393F` | `#38393F` (unchanged) | `#FFFFFF` |

  Switching the system back to light restores the light keyboard (`#EEEDF4` panel, white keys),
  so the guard changes the dark palette only.

## 5. Limits

- The **beta** build (`18.6.3.1002251336-beta-arm64-v8a`, versionCode 176071774) that APKCube
  serves is not a supported target: it has a different versionCode and a different obfuscation map
  (`Laihr;` instead of `Lrgr;`). Patch the release build. The minAPI26 and minAPI32 release
  variants (both versionCode 176071766) share the `Lrgr;` palette and constructor shape.
- The armeabi-v7a release (176071765) is assumed to share the arm64 obfuscation, like every other
  Gboard binding in this bundle; it was not checked against a v7a APK.
- This is a build-time option (a patch toggle), not an in-app switch. A runtime toggle would need
  an extension setting and a palette delegate, following the Frosted Glass pattern.
