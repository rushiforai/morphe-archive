# Patch classification (Phase 1)

Target: **Pixel 10 Pro (`blazer`, Tensor G5)**, Pixel Camera **11.1.040.982810059.19** (versionCode 69703284).

Sources analysed (read-only):

| Repository | Commit | Notes |
|---|---|---|
| Akshayykadam/Pixel-Camera | `10b75fab7c4036a836061d3619aea1a9c0845bec` (2026-11-23) | GPL-3.0. The module that actually builds is `morphe-patches/patches/` (version 1.1.4). An older copy in `morphe-patches/src/` is not built. |
| Gamer92000/pixelcamera-patches | `8d4507460484f3cd070d7f9f0c724ed429f62486` (2026-07-26) | GPL-3.0-or-later. |

Line references (`r.` below) point into the **upstream** files at those commits. Path abbreviations:

- `AK/` = `Pixel-Camera/morphe-patches/patches/src/main/kotlin/app/morphe/patches/pixelcamera/`
- `TIH` = `Pixel-Camera/smali_patches/TomteInitHelper.smali` (source of the bundled `TomteInitHelper.dex`, also copied to `reference/smali/`)
- `GM/` = `pixelcamera-patches/`

## How the upstream code is built (read this before the table)

1. **"Camera Looks Backport" does almost everything by itself.** `AK/looks/CameraLooksPatch.kt` (1059 lines) is much more than the Looks. It also contains:
   - a gallery redirect (§11, r. 443-449);
   - a hard-coded `SpecialTypesProvider` authority `com.google.android.GoogleCamera.morphe.…` (§7b, r. 384-402);
   - the portrait class replacement (r. 430);
   - the brightness, JPEG, noise-reduction, video ISP and bitrate hooks (§12-35).
2. **Flag overrides apply to the whole app.** `hookKlmFlags/A/H/R` (`AK/PixelCameraPatchUtils.kt` r. 298-531) send *every* feature flag to a single table, `TIH getFlagOverride` (r. 5706-6646). Among other things, that table forces:
   - Looks: `camera.sauce`, r. 5964;
   - Creator: `enable_biotite/mica/slate`, r. 5899-5925;
   - AV1: `camcorder.jellybean_setting`, r. 6315;
   - HDR/Log video: `glimmerix/halifax/amethyst`, r. 6471 and following;
   - flare removal and eclipse off: r. 6185 and 6211;
   - TPU off: `use_tpu`, r. 6276.

   The hooks are installed only once (`if (… "original_q") return`, r. 300). So **the "thin" patches that only call `hookKlmFlags` do nothing extra when Looks is enabled**. Leaving them out does not turn their flags off.
3. **Hard-coded obfuscated names everywhere** (`Lksf;`, `Lvku;`, `Lqxg;` …), used as `mutableClassDefByOrNull(...)?.let {}`. When a class is missing, that hook is **skipped silently** and the patch is still reported as "applied".
4. **Three precompiled `.dex` files replace whole Google classes**:
   - `PortraitControllers.dex`: `jex kov qfr qfz qge qgh`;
   - `QuickAccessControllers.dex`: 14 classes;
   - `ZoomControllers.dex`: `guh kmd kmo knk knq`.

   This is modified Google code, not the upstream author's own code.
5. `TomteInitHelper` tries to load `libpropatcher.so` (TIH r. 140 and following, `TomteProPatcherLoader`), but the Morphe patches **do not ship the `.so`**. Native calls are guarded by `catchall` (TIH r. 366-372). Nothing crashes, but the native features (grain, front backlight, raster processing) stay off.
6. The code treats the re-signed build as having no EdgeTPU: `isEdgeTpuBlocked()` always returns `true` (TIH r. 2988). This matches `GM/FINDINGS.md` §6 (r. 306-360): a renamed, re-signed package does not pass the EdgeTPU allowlist.

Categories:
- **A**: Pixel 11 feature missing on Pixel 10 Pro → include.
- **B**: fix needed for 11.1 on Pixel 10 Pro → include.
- **C**: already stock on Pixel 10 Pro → exclude.
- **D**: not relevant to Pixel 10 Pro / Tensor G5 → exclude.

## Table

| # | Patch (upstream name) | Cat. | Rationale | Dependencies | Confidence |
|---|---|---|---|---|---|
| 1 | **Camera Looks Backport** | **A** | This is the Pixel 11 feature. Unlocks device eligibility (`vku.l`→true, r. 26-28), the Looks pipeline (`izk.a`, r. 31-33), the real managers (r. 36-79), adds the Flat/Buffalo/Dijon Looks (r. 82-133) and the Sauce metadata (r. 136-202). Looks are not enabled on a stock 10 Pro. **Caveats**: it also carries its own gallery redirect (r. 443-449, which conflicts with Gamer92000's patch, see below) and the hard-coded `.morphe` authority (r. 384-402), so it **requires Clone with exactly `com.google.android.GoogleCamera.morphe`**. | `TomteInitHelper.dex` extension; Clone in practice | High |
| 2 | **Viewfinder Quick Access Controls** | **A** | Left/right shortcut slots, brightness/shadow slider, viewfinder fine-tuning (`AK/quickaccess/QuickAccessPatch.kt` r. 29-808). Replaces 14 classes from `QuickAccessControllers.dex` (r. 30). Pixel 11 UI, not present on the 10 Pro. | Looks (`dependsOn`, r. 24) | High |
| 3 | **Pixel Camera Creator Suite** | **A** | Teleprompter (Biotite), VU meter (Mica), social guides (Slate): forces the `kow.a…g` getters (r. 20-24). It also **neutralises "Save to a project"** (`kww.q/u/l/k`, r. 27-32), which otherwise crashes. Looks already forces the Creator flags (TIH r. 5899-5925). Leaving this patch out while keeping Looks would give you Creator **without** the crash guard, so it must be included. | Looks (r. 14) | High |
| 4 | **10x Viewfinder Quick Zoom** | **C** (exclude, to be confirmed) | Replaces `knq` (**husky**/Pixel 8 Pro config) and `knk` (**cheetah**/Pixel 7 Pro config), plus `kmd/kmo/guh` (zoom row and click handling), with classes from another build (`AK/portrait/TelephotoPortraitAndZoomPatch.kt` r. 15-21). The 10 Pro (`blazer`) config is not one of them. The 1x→1.2x→1.5x focal-length cycle is already stock on recent Pros. Replacing `kmo/guh` for every device risks regressions with no clear gain on blazer. | none (`ZoomControllers.dex`) | Medium-low: check on the phone whether stock already shows a 10x button |
| 5 | **Pixel 10 Photo Saving Fix** | **B** | Fixes 12MP photos not being saved on Pixel 10/10 Pro. Syncs `CLOCK_BOOTTIME`/`MONOTONIC` with an 8.33 ms tolerance (`vfa`, `PixelCameraPatchUtils.kt` r. 85-160; `wst`, r. 164-184). Looks turns off the `ceftazidime`/`use_eclipse` flags (TIH r. 6185, 6211). The code explicitly targets Pixel 10 (patch description r. 8; `hookKlmFlagA` r. 356-358 "Pixel 10 Pro 12MP"). | `TomteInitHelper.dex` | Medium-high |
| 6 | **Permanent Portrait Mode Fix** | **B** | Needed on G5 because the re-signed build loses the EdgeTPU (point 6). Routes Portrait to TFLite (midasnet) and turns off the Gouda TPU flags (`AK/portrait/PortraitModeFixPatch.kt` r. 17-31). Looks already does the same `PortraitControllers.dex` replacement (Looks r. 430) and the same hooks (r. 433-441), so as a separate patch it adds nothing. Included for clarity; it is harmless. | `TomteInitHelper.dex` | Medium (test Portrait on the phone) |
| 7 | **Pixel Camera Clone (Non-Root)** | **B** | Required. The system camera is Google-signed and cannot be updated by a re-signed build, so a different package name is needed. Looks also hard-codes the `…GoogleCamera.morphe.specialtypes.SpecialTypesProvider` authority (Looks r. 384-402), and Clone sets exactly that one (`AK/clone/PixelCameraClonePatch.kt` r. 70-71). The official "Change package name" does **not** rename `com.google.android.apps.camera.specialtypes.SpecialTypesProvider`, because that authority has no package prefix (`GM/FINDINGS.md` r. 259-263). It would therefore cause `INSTALL_FAILED_CONFLICTING_PROVIDER` and an authority that does not match what Looks expects. Clone also renames `permission`/`uses-permission` (r. 33-46) and every authority (r. 58-77), which is the same job as `updatePermissions`+`updateProviders`. → **Akshayykadam's Clone was chosen.** | none | High |
| 8 | **Pro Manual Controls** (also contains "True 50MP Pro Capture" and "Pro Settings & Sharpness") | **C** | Built for non-Pro models (description r. 13). "True 50MP" (§6-8, r. 107-174) and "Pro Settings & Sharpness" (`TomteProSettingsPanel`, §9-11, r. 176-241) **are not separate patches**: they are sections of this one. The 10 Pro already has Pro controls and 50MP. On blazer, sections 6-8 make `isProDevice()` (TIH r. 8348, which includes `blazer`) return the stock behaviour. Without the patch the stock 50MP path stays untouched. | Looks | Medium: if 50MP fails in testing, reconsider §6-8 as B |
| 9 | **AV1 Video Hardware Encoding** | **D** | The description targets "Pixel 8 and Pixel 9 series", i.e. Tensor G3/G4 (r. 9). It does nothing by itself (it only calls `hookKlmFlags`, r. 19-21): **Looks forces the AV1 flag `camcorder.jellybean_setting` anyway** (TIH r. 6315). Excluding it does not remove the AV1 option. | Looks | High that it is a no-op; really removing AV1 would require changing TIH |
| 10 | 4K 60 FPS 10-bit HDR & Log Video *(in the source, not in the manifest)* | **C** | 4K60 10-bit HDR is already stock on the 10 Pro. Its only extra effect is `vku.f`→`is60FpsHdrSupported()` (r. 22-33), which returns true on Pixel 10 (TIH r. 2759+). Looks already forces the `glimmerix/halifax/amethyst` flags. | Looks | Medium |
| 11 | Seamless Video Lens Switching & Zoom Smoothing *(in the source, not in the manifest)* | **C** (redundant) | Only calls `hookKlmFlags/A/R` (r. 19-23), which Looks already does. Its flags (`video_prewarm`, `smooth_zoom_*`, TIH r. 6340-6390) are already on with Looks. | Looks | High (no-op) |
| 12 | Max Display Brightness | **D** (extra, not a Pixel 11 feature) | Resource-only patch that adds the toggle (`AK/brightness/MaxBrightnessPatch.kt` r. 18-20). The runtime hooks are already in Looks (§12-15, r. 452-531), and **Clone adds the same preferences anyway** (Clone r. 163). Off by default (`isMaxBrightnessEnabled` → `checkPrefValue(…, false)`, TIH r. 2836). The option stays available without this patch. | Looks | High |
| 13 | Pro Image Quality & Denoise Tuning | **D** (extra) | Same as 12: adds the JPEG/NR menus (r. 18-20). The hooks live in Looks (§20-22, r. 628-728), and **Clone already adds these too** (r. 164). | Looks | High |

### From Gamer92000

| # | Patch | Cat. | Rationale | Confidence |
|---|---|---|---|---|
| G1 | **Use third-party gallery** | requested | Structural fingerprints (`GM/…/gallery/Fingerprints.kt`), re-verified on 11.1 in Phase 4. **Conflict**: Looks §11 already hooks a different method (the review-intent factory, `(ZZZ[J)Intent`) with `TomteInitHelper.configureGalleryIntent`, which has its own redirect based on `pref_gallery_package_key`. That makes two redirects in a row on the same intent. | — |
| G2 | **Use third-party gallery on lock screen** | requested, **default off** | Changes only one method of the extension. | — |
| G3 | Run Add Me without the EdgeTPU | not imported | As instructed. Only check whether Add Me crashes in the renamed 11.1 build (Phase 4/5). Looks already forces `use_tpu`=false globally, so the crash may not happen. | — |

## Summary

- **Include (A)**: Camera Looks Backport, Viewfinder Quick Access Controls, Pixel Camera Creator Suite.
- **Include (B)**: Pixel 10 Photo Saving Fix, Permanent Portrait Mode Fix, Pixel Camera Clone.
- **Exclude (C)**: 10x Viewfinder Quick Zoom (to be confirmed), Pro Manual Controls (with True 50MP and Pro Settings & Sharpness), 4K60 10-bit HDR & Log, Seamless Video Lens Switching.
- **Exclude (D)**: AV1, Max Display Brightness, Pro Image Quality. The last two stay available through Clone and Looks anyway.
- **Gallery** (Gamer92000): both imported but **off by default**. The new "Use Morphe Google Photos" (on by default) replaces them. See the decisions below.

## Decisions taken at Checkpoint 1 (2026-11-25)

The goal stated by the user: the camera must open **Morphe-patched Google Photos**. On the phone (read over adb, read-only) its package is `app.morphe.android.apps.photos` (v7.98.0.1001971222). The original `com.google.android.apps.photos` is uninstalled for user 0.

1. **Obfuscated names**: Akshayykadam's patches are ported as they are, plus a safety check: when an expected class or method is missing, the patch fails instead of skipping it silently. New patches use structural filters only.
2. **Gallery**: Looks §11 (the `configureGalleryIntent` redirect) is removed. A new patch, **"Use Morphe Google Photos"** (on by default, configurable package), rewrites in the bytecode:
   - every `const-string` equal to `com.google.android.apps.photos`;
   - the mars authority `com.google.android.libraries.photos.api.mars`.

   Both get the patched Photos values, and the patch also updates the manifest (`<queries>`). Normal and `REVIEW_SECURE` (lock screen) reviews then go to patched Photos, which honours the secure contract. Gamer92000's "Use third-party gallery" and "… on lock screen" are imported but **off by default**, as the alternative for non-Google galleries.
3. **AV1/HDR/Log flags forced by Looks**: documented; `TomteInitHelper` is not modified.
4. **License**: GPL-3.0. The repository is published publicly at the user's explicit choice, despite the two `.dex` files that contain modified Google classes.

## Questions open at Checkpoint 1 (archive)

1. **Obfuscated names.** Gamer92000's patches and the new code follow the "structural filters only" rule. Akshayykadam's patches rely on about 100 obfuscated hook points plus 25 classes replaced from `.dex` files. Rewriting all of them as fingerprints is a project of its own, and replacing a whole class cannot be expressed as a fingerprint. Proposal: port them as they are (the version is pinned to 11.1.040, so the names are stable) and add a safety check that fails the patch when an expected class is missing, instead of skipping it silently.
2. **Double gallery redirect.** Proposal: remove only Looks §11 (r. 443-449, 7 lines), so only Gamer92000's mechanism remains, which deliberately leaves the "secure" intent alone. Alternative: keep both and test.
3. **AV1, HDR and video flags always on through Looks.** Options: (a) accept and document it; (b) change `TomteInitHelper.smali` and rebuild the `.dex` to drop those flags.
4. **Licensing.** Akshayykadam is GPL-3.0 ("version 3", no "or later"), which is compatible with GPL-3.0 for the new repository. But the `.dex` files with modified Google classes contain Google proprietary code. Upstream distributes them anyway; republishing them in a public repository is a legal risk.
