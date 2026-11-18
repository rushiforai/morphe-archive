# Gboard theming: what gboardwu ships, how it works, and how it fits 18.6.3

Date: 2026-11-13. Investigation only — no APK decompilation was performed for this
document. Target APK under consideration:
`com.google.android.inputmethod.latin_18.6.3.1002251336-release-arm64-v8a`.

## 0. Source identity

| Item | Value |
| --- | --- |
| Local checkout | `~/Scripts/gboardwu` |
| HEAD | `463269a feat: add Frosted Glass FAQ, adjust defaults, and fix navigation bar rendering` |
| Bundle version (`patches-list.json`) | `4.3.0` |
| Patches declared | 45 |
| Declared compatible Gboard | `18.5.4.993608717-release-arm64-v8a` |
| Upstream repo | `github.com/jasonwu1994/Gboard-patches` |

Note the version gap: upstream supports **18.5.4**, our library targets
**18.6.3**. Section 5 covers what that gap actually costs.

## 1. The theming surface (the decision list)

gboardwu has no single "theming" mega-patch; theming is five features across
three groups. Everything below is from `patches-list.json` and
`patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/registry/GboardPatchRegistry.kt`.

| # | Patch | Registry line | What it actually changes | Third-party assets | Network | Vendor-specific guards |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | **Custom Theme** | `GboardPatchRegistry.kt:482` | Adds ZIP theme import to Gboard's own theme screen and a browsable Rboard pack gallery (45 packs / 490 themes) | yes (catalog + preview bundle) | yes | yes (2 structural fingerprints) |
| 2 | **Frosted Glass** | `:431` | Real background blur behind the keyboard, custom background/key opacity, extend into the navigation bar | no | no | yes (register counts, nav prototype) |
| 3 | **Rounded Keyboard Panel** | `:415` | Corner selection (all/top/bottom) + independent top/bottom radii, 0–64 dp | no | no | minimal (bindings only) |
| 4 | **G Logo on Spacebar** | `:195` | Replaces the spacebar glyph with the G icon or a user image (PNG/WebP/JPEG), tinting + size | no | no | no (soft-key family) |
| 5 | **Key Shape Selection** | `:729` | Unlocks Gboard's *native* "Key shape" row in Theme details; not a built feature | no | no | no (flag patch) |

The three that answer "theming support" in the usual sense are **1, 2, 3**.
4 is visual customisation, 5 is a stock-feature unlock.

Adjacent but *not* theming (mentioned so the list is not reopened later):
Custom Symbols, Emojis/stickers/GIFs tab order, Top Toolbar Item Count,
Rounded/Split keyboard layout, Custom branding.

## 2. How each one works

### 2.1 Custom Theme — the big one

Patches (`.../features/customtheme/`):

- `GboardCustomThemeOfficialImportPatch.kt` — bytecode patch. Intercepts two
  stock methods and prepends a runtime guard:
  - the theme grid's "+" handler (`custom_theme_plus_handler`)
  - the fragment's activity-result handler (`custom_theme_result_handler`)
  Each guard returns early when the extension claims the event, otherwise falls
  through to stock. Before patching, both methods must match a 18.5.4 structural
  fingerprint, and four reflection targets are shape-checked (access flags,
  register count 5).
- `GboardCustomThemeAssetsPatch.kt` — copies
  `custom-theme-assets/catalog.json` into the APK at
  `assets/gboard-custom-themes/catalog.json`.
- `GboardCustomThemeManifestPatch.kt` — adds `INTERNET`.
- `GboardCustomThemeFeatureMarkerPatch.kt` — writes the feature marker string
  `dev.jason.gboardpatches.feature.custom_theme` so the settings UI knows the
  patch is present.

Runtime (`extensions/extension/src/main/java/.../customtheme/`, 12 files, 2 333 lines):

- `GboardCustomThemeOfficialImportRuntime` — when the user taps "+", shows a
  chooser: *photo/camera* (hands the tap back to stock Gboard) or *ZIP*. The ZIP
  branch launches `ACTION_OPEN_DOCUMENT` (`application/zip`) with request code
  `0x67`, consumes the result itself, and on success calls Gboard's own result
  handler with `intent_extra_key_new_theme_file_name`.
- `GboardCustomThemeZipImporter` — accepts either a **direct theme ZIP** (root
  `metadata.json` / `metadata.binarypb`) or a **pack** (ZIP containing inner
  `*.zip` themes, up to 128). Packs open a chooser dialog. Safety: bounded
  sizes, 128 entries, compression-ratio check, path-traversal rejection.
- `GboardCustomThemeInstaller` — copies to staging, inspects, and then calls
  **Gboard's own validator** (`custom_theme_validator`, static `(File)Z`)
  before committing. Installs as
  `files/user_theme_package_<15-digit-ms>_<nn>.zip`, deduplicates by SHA-256,
  then activates by writing two prefs into the device-protected
  `<pkg>_preferences` store: `additional_keyboard_theme = files:<name>` and
  `enable_key_border`.
- `GboardCustomThemeGalleryView` (609 lines) — the in-app gallery: pack tabs,
  two-column preview grid, progress, per-pack cache delete.
- `GboardCustomThemeRepository` — on-demand HTTPS download of a pack, pinned
  SHA-256 and byte length, atomic cache commit, bounded redirects/timeouts.
- `GboardCustomThemePreviewRepository` — downloads a versioned preview bundle
  (`custom-theme-previews-v1.zip`, 7.6 MB, sha256 `368af506…`) from
  **jasonwu1994's GitHub releases**, expands it into app assets and indexes it.

Catalog content (`patches/src/main/resources/custom-theme-assets/catalog.json`,
225 548 bytes): `schemaVersion 1`, source `GboardThemes/PackRepoBeta` pinned at
commit `4a8187dbe6b530c012e5996089c6a6246f42c65b` (2024-12-27), **45 packs,
490 themes**, 50 KB – 8 MB per pack. Authors include RKBDI, Leese, Fakefams,
MLZ, Nitanmarcel, Google ("Stock themes from Gboard", "Landscapes"), Xiaomi/Oppo
brand packs.

Settings surface: one toggle ("enabled") plus a *Browse themes* row that opens
the gallery. Import works whether or not the toggle is on? No — the "+"
interception is gated on `pref_custom_theme_enabled` (default off).

### 2.2 Frosted Glass

Patch (`.../features/frostedglass/GboardFrostedGlassLifecyclePatch.kt`, 121 lines):

- Hooks the IME window lifecycle: `onWindowShown` → runtime
  `onInputViewStarted`, `onWindowHidden` → `onInputWindowHidden`,
  `onConfigureWindow` → `afterConfigureWindow` (this last one requires expanding
  the method's register file from 11 to 17 and copying parameters first).
- Delegates `onApplyNavBar` entry/exit, replacing the applied navigation model and
  restoring the window at exit, with 6 field/prototype shape checks.

Runtime (`.../frostedglass/`, 7 files, 2 622 lines):

- Android **12+ (S)** only for the blur itself: `Window.setBackgroundBlurRadius`
  plus `FLAG_BLUR_BEHIND`, via public API; `HiddenApiBypass` is used for access
  to a few internals. Below S it degrades to the theme.
- Settings (`GboardFrostedGlassSettings`): enabled (default **off**), blur
  strength 1–100 (default 20, mapped to 1–160 px), background transparency mode
  *theme* or *custom* 0–100 %, separate **key** transparency mode/opacity,
  and **Extend to navigation bar** (default **on**).
- Nav bar: follows the keyboard transparency on Android 15 and below, blur
  included where supported; recolours the nav buttons for a seamless look.
- Explicitly designed around failure: `MAX_BLUR_DRAW_FAILURES = 3` then falls
  back to the stock theme (this fixed the
  "`Software rendering doesn't support drawRenderNode`" keyboard-close crash),
  Direct-Boot safe, and an energy pass that de-duplicates layout/draw work.
- **The theme ZIP supplies the palette and alpha**; Frosted Glass supplies the
  blur and the transparency policy. It looks near-pointless on stock themes.

### 2.3 Rounded Keyboard Panel

`.../features/roundedkeyboard/GboardRoundedKeyboardBytecodePatch.kt` (325 lines):

- Pure binding-driven rewrite, no fingerprints. Injects two delegates into
  Gboard's theme-style resolver (`(String, List) -> List`) and converts a
  rejected theme admission (`(Context) -> Z`) into an admitted one.
- Adds three helper methods to stock obfuscated classes (`Radii` type and its
  `RadiiWrapper`): read the largest radius, and copy a wrapper with new radii.
  The wrapper's existing radii are normalised against the reference radius
  (dividing by 32f) so the user's dp values scale the theme proportionally
  instead of replacing it.
- Settings (`GboardRoundedKeyboardConfig`): enabled (default off), mode
  `all`/`top`/`bottom`, top radius and bottom radius 0–64 dp (default 32).

### 2.4 G Logo on Spacebar

Soft-key family patch (`.../features/spacebarlogo/`) delegating the spacebar
bind before/after. Runtime is 2 042 lines including an `image-payload`
directory. Offers the built-in G icon (mono or full colour) or a user-selected
PNG/WebP/JPEG, size control, single-colour tint, and the image is included in
the settings backup. Visual, not a theme system.

### 2.5 Key Shape Selection

A flag-family patch (`.../features/featureflags/GboardFeatureFlagsBytecodePatch.kt:21`)
that forces only the `KEY_SHAPE_SELECTION` rollout gate, so the stock
*Theme details → Key shape* row appears without forcing rounded keys. No custom
code. Cheapest possible win.

## 3. What the theming ecosystem gives the user

- 490 ready themes in one gallery, no external app, no account, no manual file
  juggling — tap pack → previews → install → keyboard restyles immediately.
- Arbitrary ZIP import for anything not in the catalog (Rboard packs or a
  single theme ZIP), validated by Gboard's own validator, so a bad file is
  rejected instead of half-applied.
- Because installation is *stock* (`additional_keyboard_theme =
  files:user_theme_package_…`), themes survive app updates and appear in
  Gboard's normal theme list.
- Key border toggle per theme (`preferKeyBorder` in the catalog) — the
  difference between flat and outlined keys.
- Frosted Glass then layers blur + opacity on top of those themes, which is the
  combination the upstream screenshots show.

## 4. Fit against our 18.6.3 APK — the important finding

This is **not** a from-scratch port. Per
`commit cb6e0aee` ("feat(Gboard): support Gboard 18.6.3 …") we already vendored
the entire gboardwu feature tree and extension runtime, including
`customtheme/`, `frostedglass/`, `roundedkeyboard/`, `spacebarlogo/`.

Evidence, `.tools/artifacts/gboard-port-18.6.3/`:

- `resolved.txt` (238 lines = the full binding table) maps **all 29 theming
  bindings** (8 custom-theme, 10 frosted-glass, 11 rounded-keyboard) into 18.6.3 classes, e.g.

  ```
  M Lksz; f (Lkst;Lktc;I)V customThemePlusHandler        => Lkbl;->f(Lkbf;Lkbo;I)V
  M …ThemeListingFragment; X (IILandroid/content/Intent;)V customThemeResultHandler => …ThemeListingFragment;->W(IILandroid/content/Intent;)V
  M Lrzb; h (Ljava/io/File;)Z customThemeValidator       => Lrhw;->h(Ljava/io/File;)Z
  M Lpsx; onConfigureWindow (Landroid/view/Window;ZZ)V frostedConfigure => Lpbk;->onConfigureWindow(Landroid/view/Window;ZZ)V
  M Lscf; f (Landroid/view/Window;Lsce;)V frostedNavApply => Lrlc;->g(Landroid/view/Window;Lrlb;)V
  M Lrxr; b (Landroid/content/Context;)Z roundedKeyboardAdmission => Lrgl;->b(Landroid/content/Context;)Z
  M Lryg; b (Ljava/lang/String;Ljava/util/List;)Ljava/util/List; roundedKeyboardStyleResolver => Lrgz;->b(…)
  ```

- `patches/src/main/kotlin/.../shared/generated/GboardVersionBindings.kt` already
  declares `targetVersion = "18.6.3"` and carries all the
  `frosted*` / `roundedKeyboard*` / `customTheme*` targets.
- The port script touched the theming code exactly **twice** (one line each) —
  see `git show --stat cb6e0aee` and `port.diff:1191,1247`:
  - custom theme version gate `18.5.4` → `18.6.3`
  - frosted-glass descriptor `Lphr;-` → `Lpbk;`
- Our extension copies are present, but their freshness differs
  (`diff -rq` against the gboardwu checkout):

  | Runtime | State in our tree |
  | --- | --- |
  | `customtheme` (12 files, 2 333 lines) | byte-identical to upstream |
  | `roundedkeyboard` (4 files, 586 lines) | byte-identical to upstream |
  | `spacebarlogo` | differs only in two 18.6.3 class names (`qae`→`qlk`, `qbc`→`qmg`), i.e. already adapted |
  | `frostedglass` (7 files, 2 622 lines) | **older snapshot**: `GboardFrostedGlassRuntime`, `GboardFrostedGlassSettingsFeature`, `GboardSeamlessNavBarRuntime` differ (273 / 79 diff lines) and `GboardFrostedGlassLayerDrawable.java` is absent |

  The frosted-glass gap is the 4.3.0 hardening: our copy has no
  `MAX_BLUR_DRAW_FAILURES` counter and no `drawRenderNode` fallback
  (`grep -c` = 0 locally, 2 upstream), no `ThemeBlurBackground` layer drawable,
  no Android-15 nav-bar fix and no settings FAQ. Shipping our snapshot as-is
  would ship the version that could close the keyboard on software rendering,
  so a re-sync from upstream is a prerequisite for that patch.

So the *reverse engineering* (mapping obfuscated 18.6.3 classes, confirming the
theme contract still exists) is already done and recorded.

### What is still missing (that is the real work)

| Gap | Evidence | Applies to |
| --- | --- | --- |
| Not declared as Morphe patches | `GboardPortRegistry.kt` declares six gboardwu features; `patches-list.json` shows 17 Gboard patches, none of them theming | all 5 |
| No contribution wiring units | `GboardContributionWiring.kt` has units for `rounded_keyboard_panel` (:134) and `g_logo_on_spacebar` (:112) but **not** `custom_theme` / `frosted_glass` | 1, 2 |
| Catalog asset absent | `patches/src/main/resources/custom-theme-assets/` does not exist in our tree (upstream: 225 548 B catalog) | 1 |
| Preview bundle is someone else's release asset | `GboardCustomThemePreviewRepository.URL` points at `github.com/jasonwu1994/Gboard-patches/releases/download/custom-theme-previews-v1/...` | 1 |
| 18.5.4 structural fingerprints | `GboardCustomThemeOfficialImportPatch.kt:100-103` — `CUSTOM_THEME_PLUS_1853_FINGERPRINT`, `CUSTOM_THEME_RESULT_1853_FINGERPRINT`, plus `registerCount == 5` guard | 1 |
| Frosted-glass stock-shape guards | `GboardFrostedGlassLifecyclePatch.kt:107-110` — `FROSTED_CONFIGURE_STOCK_REGISTERS = 11` / `PATCHED = 17` for `Lpbk.onConfigureWindow` | 2 |
| Rounded-keyboard prototypes | `GboardRoundedKeyboardBytecodePatch.kt` checks `Lrgl.b(Context)Z` and `Lrgz.b(String,List)List` — already matched by bindings, no rewrite expected | 3 |
| Frosted-glass runtime is stale | our copy predates the 4.3.0 draw-failure fallback / nav-bar fixes (see table above) | 2 |

Statistics from `verification.json` of the 18.6.3 port: 230/238 bindings
resolved, **8 unresolved are unshipped features** (signature bypass, AI writing
tools, OCR, settings homepage, Rambler reset header) — none of them theming.
Patch apply on 18.6.3: `success: true`, `failed: []`. Runtime: **not verified on
a device**.

## 5. Risks and policy questions to settle before building

1. **Theme pack licensing.** The catalog redistributes 45 third-party packs
   (Rboard / PackRepoBeta authors, plus Google-stock-derived packs). Our
   repository publishes GPLv3 and mirrors to Codeberg with a five-release
   window. Shipping the catalog JSON is only metadata, but the *previews* and
   any cached packs are other people's artwork. Options: ship catalog + download
   from upstream URLs (current design), host our own preview bundle, or drop the
   gallery and keep ZIP import only.
2. **Network permission.** Custom Theme adds `INTERNET` to a keyboard package
   that had none. That is a user-visible security posture change for a Gboard
   patch and should be called out in the release note.
3. **Hidden API and Android version.** Frosted Glass uses `HiddenApiBypass` and
   `setBackgroundBlurRadius` (API 31+), with SDK 36-specific handling for
   Gboard's own nav strip. It needs real-device verification on at least one
   Android 12–15 and one 16 device.
4. **Fingerprint maintenance.** Both Custom Theme and Frosted Glass fail closed
   with structural hashes/register counts. Every future Gboard bump re-opens
   them, unlike Rounded Keyboard Panel which is binding-driven.
5. **Failure modes are user-visible.** Theme import writes Gboard preferences
   and swaps the active theme; a bad commit leaves the user on a broken theme.
   The upstream code rolls back and falls back, but this is the highest
   regression risk of the five.

## 6. Recommendation

Effort/risk ordering, cheapest first:

| Order | Patch | Why | Estimated work |
| --- | --- | --- | --- |
| 1 | **Key Shape Selection** | flag only, no assets, no runtime code | declare + wire, minutes |
| 2 | **Rounded Keyboard Panel** | binding-driven, wiring unit already exists, no fingerprints, fully offline | declare + wire, then verify `Lrgl`/`Lrgz` shapes on the real APK |
| 3 | **Frosted Glass** | wiring unit missing; runtime must be re-synced from upstream 4.3.0 first; then only `Lpbk` register counts to confirm | re-sync 4 files + add unit + declare, verify 11→17 register expansion |
| 4 | **G Logo on Spacebar** | wiring unit already exists, visual only | declare + wire |
| 5 | **Custom Theme** | biggest surface: catalog asset, preview hosting decision, fingerprints, `INTERNET`, licensing | asset import + hosting decision + two fingerprint recomputations + gallery verification |

If the goal is "theming support users keep asking for", the highest
value-per-risk bundle is **Rounded Keyboard Panel + Frosted Glass** (both apply
to any installed theme, no assets, no network), with **Custom Theme** as a
separate follow-up once the catalog/preview hosting and licensing question is
answered.

## 7. Open questions for the owner

1. Which of the five do you want?
2. For Custom Theme: ship the upstream catalog and its GitHub-hosted preview
   bundle as-is, host our own preview bundle, or ship ZIP import only without a
   gallery?
3. Is adding `INTERNET` to the patched Gboard acceptable?
