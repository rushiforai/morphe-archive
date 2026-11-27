# WORKLOG

## Phase 1: inventory and classification (2026-11-25)

### Environment
- OS: Windows 11, Git Bash.
- System JDK: 1.8.0_401, too old. Installed a portable **Temurin 21.0.13.1+2** under `~/.jdks/jdk-21.0.13.1+2` (zip from api.adoptium.net), without touching the system.
- Python 3.12. `gh` not installed.
- `GITHUB_ACTOR`/`GITHUB_TOKEN` set in the environment (never written to files).
- APKM: moved and renamed to `input/PixelCamera_11.1.040.982810059.19.apkm` (1,614,182,404 bytes, outside this repository).

### Upstream (read-only, cloned next to this repository)
| Repository | Commit | Date |
|---|---|---|
| https://github.com/Akshayykadam/Pixel-Camera | `10b75fab7c4036a836061d3619aea1a9c0845bec` | 2026-11-23 |
| https://github.com/Gamer92000/pixelcamera-patches | `8d4507460484f3cd070d7f9f0c724ed429f62486` | 2026-07-26 |

Notes on Akshayykadam:
- `patches-list.json` says `"version": "1.1.3"` and lists 11 patches; `morphe-patches/gradle.properties` says `version=1.1.4`.
- The source that actually builds (`morphe-patches/patches/src`) contains **13** patches. The two extra ones are "4K 60 FPS 10-bit HDR & Log Video" and "Seamless Video Lens Switching".
- `morphe-patches/src/` is an older copy that is not built: its `ProControlsPatch.kt` lacks the Auto Night Sight section `a2`.
- "True 50MP Pro Capture" and "Pro Settings & Sharpness" are sections of "Pro Manual Controls", not separate patches.
- Versions: `app.morphe.patches` plugin 1.3.4, `morphe-patcher` 1.8.0. Gamer92000 uses plugin 1.3.3 and patcher 1.7.0, and warns that 1.8.0-dev deprecated parts of the fingerprint API.

### Result
See `CLASSIFICATION.md`.

## Phase 2: repository layout (2026-11-25)

- Layout taken from Gamer92000: `patches/`, `extensions/pixelcamera/`, `tools/`, `gradle/`, Gradle 9.6.1 wrapper, `.github/workflows/`.
- **Versions**: `app.morphe.patches` plugin **1.3.4** + `morphe-patcher` **1.8.0**. This is the newest combination used by either code base (Akshayykadam), and Gamer92000's code compiles on 1.8.0 unchanged.
  - GitHub Packages also has plugin 2.1.x and patcher 2.4/2.5, which the official morphe-patches use (`c4818af`).
  - 2.x changes the build layout (patches-library, stubs), so porting to it is separate work. Morphe CLI 2.3.0 loads the 1.8.0 bundle fine (Phase 5).
- `shared/Constants.kt` holds a single `Compatibility` for `com.google.android.GoogleCamera` 11.1.040.982810059.19 with Google's signature `f0fd6c5b…db83`, checked against the 11.1 base.apk with `tools/apksigcert.py`.
- **Android SDK** was missing. With the user's explicit consent, installed in `%LOCALAPPDATA%\Android\Sdk`, accepting the SDK licenses:
  - the official command-line tools (`commandlinetools-win-15859902`);
  - `platforms;android-36` and `build-tools;36.0.0`.

  `local.properties` is gitignored.
- **Windows build issue**: `java.io.IOException: Unable to establish loopback connection`.
  - Cause: the system TEMP is an 8.3 short path (`<USER>~1`), and Java's Unix-domain-socket selector cannot handle it.
  - Local fix: point `TMP`/`TEMP` and `-Djdk.net.unixdomain.tmpdir` at a folder with a normal path (e.g. `C:\Users\<user>\.gradle-tmp`).
  - CI (Linux) does not need this.
- `.gitignore`: only the `.dex` files under `patches/src/main/resources/` are allowed.

## Phase 3: porting the Pixel 11 patches (2026-11-25)

Patches ported from Akshayykadam (`10b75fa`, `morphe-patches/patches` module):

| Patch | File | Resources |
|---|---|---|
| Camera Looks Backport | `looks/CameraLooksPatch.kt` | `TomteInitHelper.dex`, `PortraitControllers.dex` |
| Viewfinder Quick Access Controls | `quickaccess/QuickAccessPatch.kt` | `QuickAccessControllers.dex` |
| Pixel Camera Creator Suite | `creator/CreatorSuitePatch.kt` | — |
| Pixel 10 Photo Saving Fix | `photosaving/PhotoSavingFixPatch.kt` | `TomteInitHelper.dex` |
| Permanent Portrait Mode Fix | `portrait/PortraitModeFixPatch.kt` | `TomteInitHelper.dex`, `PortraitControllers.dex` |
| Pixel Camera Clone (Non-Root) | `clone/PixelCameraClonePatch.kt` | — |
| (shared helper) | `PixelCameraPatchUtils.kt` | — |

Not ported: Pro Manual Controls, 10x Viewfinder Quick Zoom (`ZoomControllers.dex` left out), AV1, 4K60 10-bit HDR & Log, Seamless Video Lens Switching, Max Display Brightness, Pro Image Quality. Utils functions used only by those (e.g. `unblockAeCompensationDispatch`) remain in the file, unused.

Static checks against the 11.1 base.apk (with a throwaway DEX indexer, not versioned):
- all 65 obfuscated classes referenced by the ported patches exist in 11.1;
- the 20 classes replaced by `PortraitControllers.dex` and `QuickAccessControllers.dex` (and the 5 in `ZoomControllers.dex`) have **exactly** the same methods (name + signature) as the 11.1 originals, so they were built for this version;
- all 28 obfuscated types referenced by `TomteInitHelper.dex` exist in 11.1.

Changes compared to upstream (internal logic unchanged):
1. Compatibility narrowed to `Constants.COMPATIBILITY_PIXEL_CAMERA` (11.1.040 only).
2. **Fail-loud lookups** (decision 1):
   - `mutableClassDefByOrNull(X)?.let` → `requireClass(X).let` (59 sites);
   - `methods.firstOrNull{…}?.let` → `firstOrFail(…)` (43 sites);
   - `catch (_: Throwable) {}` around smali compilation → rethrown as `PatchException` (33 sites);
   - the helpers `replaceMethodBody`, `forceReturn*`, `hookKlmFlag*` and `patchWstTolerance` throw instead of returning `false`.

   When a patch applies, the output is identical to upstream. When a hook does not find its target, the patch fails with a clear message instead of being reported as "applied".

   Still not fail-loud: the `indexOfFirst … if (idx != -1)` checks inside methods. If an expected instruction is missing, that single insertion is still skipped. The version is pinned, so the risk is low.
3. Removed the 11.0 fallbacks (`Lmuh;`, `Lmia;`): dead code for the pinned version, trivial removal.
4. **Looks §11 removed** (the `configureGalleryIntent` gallery redirect, 7 lines), together with the now unused `hookGalleryReviewIntent` in Utils. See decision 2.
5. Provenance and modification headers (GPL §5a) added to every ported file.

Reference smali sources of `TomteInitHelper.dex` copied to `reference/smali/`.

**Clone**: Akshayykadam's patch was chosen over the official "Change package name":
- Looks hard-codes the `com.google.android.GoogleCamera.morphe.specialtypes.SpecialTypesProvider` authority, and Clone sets exactly that value.
- Clone renames permissions and providers, which is the same job as updatePermissions+updateProviders.
- "Change package name" would leave `com.google.android.apps.camera.specialtypes.SpecialTypesProvider` (no package prefix) in place, which conflicts with the stock camera at install time.

**Do not change** Clone's `packageName` option: Looks expects `.morphe`.

## Phase 4: gallery and Morphe-patched Google Photos (2026-11-25)

### Gamer92000 gallery patches (imported, **off by default**)
- Copied:
  - `gallery/{Fingerprints,Extension,UseThirdPartyGalleryPatch,UseThirdPartyGalleryOnLockScreenPatch}.kt`;
  - `GalleryRedirect.java`;
  - `tools/{verify_fingerprints,dexscan,apksigcert}.py`.
- `verify_fingerprints.py` on the 11.1 base.apk, before adapting: `ThumbnailReviewLauncherFingerprint` **OK** (1 match, `Llys;->e`); `PhotosAvailabilityGateFingerprint` **0 matches**.
- Cause: in 11.1 the three Photos probes (PackageInfo, enabled, suspended) moved out of the gate (`Llys;->b(Optional)V`) into a helper class (`Ltel;->a()/c()/d()`). The gate no longer contains the package string or direct `PackageManager` calls. Found with `dexscan.py strings/xref/dump`.
- New fingerprint, structural filters only, in this order:
  1. `methodCall(returnType=PackageInfo, parameters=[])`
  2. `string("Cannot find Photos package info. Canceling.")`
  3. `methodCall(returnType=Z, parameters=[])`
  4. `string("Photos is disabled. Canceling.")`
  5. `methodCall(returnType=Z, parameters=[])`
  6. `string("Photos is suspended. Canceling.")`

  The replacements are now single-register calls, so `GalleryRedirect.isGalleryEnabled(Object)` and `isGallerySuspended(Object)` were added. The Python verifier was updated to match.
- Result: **`RESULT: PASS`**, one match per fingerprint, register preconditions OK.
- `Use third-party gallery` set to `default = false` (the lock-screen variant was already false). These two are the alternative for people who do not use Photos.

### New patch "Use Morphe Google Photos" (on by default)
User goal: open Morphe-patched Google Photos. Found on the phone (adb, read-only):
- package `app.morphe.android.apps.photos` v7.98.0.1001971222, installed by Morphe Manager;
- `HostPhotoPagerActivity` handles `android.provider.action.REVIEW[_SECURE]`;
- `MarsGatewayActivity` handles **`app.morphe.android.apps.photos.mars.api.ACTION_REVIEW[_SECURE]`** (renamed);
- the provider is `app.morphe.android.apps.photos.api.mars`;
- stock Photos is uninstalled for user 0.

The renaming on the Photos side comes from the GmsCore patch in Akash-Sriram/morphe-google-photos (`059419c675379a6a4e94f1592c66f4072aa881c2`, `googlephotos/misc/gms/GmsCoreSupportPatch.kt`, `finalize` block):
- `com.google.android.apps.photos.mars.*` → `<pkg>.mars.*`;
- `com.google.android.libraries.photos.api.mars` → `<pkg>.api.mars`;
- the `…photos.api.secure_mode[_ids]` extras are **not** renamed.

The new patch applies the same mapping to the camera's strings:
- `com.google.android.apps.photos` (exact) → chosen package. Affects `hwb.w` (review intent), `tel.a/c/d` (Photos probes), Creator, and service bindings.
- `package:com.google.android.apps.photos` → `package:<pkg>`.
- prefix `com.google.android.apps.photos.mars.` → `<pkg>.mars.` (the two review actions).
- `[content://]com.google.android.libraries.photos.api.mars` → `<pkg>.api.mars`.
- Manifest: `<queries><package com.google.android.apps.photos>` → `<pkg>`. Without it, Android 11+ cannot see the package.
- Options: `photosPackageName` (default `app.morphe.android.apps.photos`), `photosMarsAuthority` (empty = `<pkg>.api.mars`).
- Fail-loud: the patch fails if the package or either review action is not found.
- Unit tests: `RetargetPhotosStringTest` (6 tests, PASS).

Expected effect: the thumbnail opens patched Photos. On the lock screen, `ACTION_REVIEW_SECURE` goes to Photos, which honours the secure contract (only the current session's shots). The "Photos disabled" gate is left alone: it now checks patched Photos, which is installed and enabled.

### Conflicts between patches
- The gallery patch changes `lys.e` (insertion at index 0) and `lys.b` (3 calls). The Photos patch only changes `const-string`s in other classes (`hwb`, `tel`, …) and one `<queries>` node. Looks, QuickAccess, Creator, PhotoSaving and Portrait do not touch `lys`. No method is shared, so the order of application does not matter.
- The only logical conflict is gallery + Photos enabled together. The gallery patch turns the intent into an implicit `ACTION_VIEW` and drops the Photos package. That is why the gallery patch is off by default, and the README says not to combine them.
- Looks §11, the third redirect, was already removed in Phase 3.
- The Photos strings inside `TomteInitHelper.dex` (in `configureGalleryIntent`, no longer hooked) are rewritten too, which is harmless.

### Add Me
"Run Add Me without the EdgeTPU" was not imported. Whether Add Me crashes in the renamed 11.1 build cannot be decided statically:
- Gamer92000 documented that the EdgeTPU allowlist rejects re-signed packages;
- Looks globally forces `use_tpu`/`darwinn` to false (TIH line 6276 and following), which *might* avoid the EdgeTPU path.

**Needs testing on the phone.**

## Phase 5: build and patch run (2026-11-25)

- `./gradlew build` OK; `./gradlew :patches:buildAndroid` OK. `patches/build/libs/patches-0.1.0.mpp` contains `classes.dex`, `extensions/pixelcamera.mpe`, `TomteInitHelper.dex`, `PortraitControllers.dex`, `QuickAccessControllers.dex`.
- CLI: the official `MorpheApp/morphe-cli` releases now live in **`MorpheApp/morphe-desktop`**. Used stable **v2.3.0** (`morphe-desktop-2.3.0-all.jar`); it loads the patcher-1.8.0 bundle without problems.
- Full run on the APKM with the default patches. The CLI merges the splits itself.

### Failures caught by the fail-loud lookups, and fixed
Every failure was a hook that upstream **silently skipped** on 11.1: an 11.0 name that is a different class in 11.1. In each case the hook was removed, so the effective behaviour stays the same as upstream on 11.1:
1. Looks §7b: `Lklh;` held the SpecialTypes authorities in 11.0; in 11.1 it has no `<clinit>`. In 11.1 those strings exist only in `Lksa;`, which stays.
2. Looks §8: onboarding `Lizl;` and `Lqvw;`, whose `a()` is not `void` in 11.1. `Lrxh;` stays.
3. QuickAccess §6: `Lppn;`, an 11.0 controller that is an enum in 11.1. `Lpzj;` stays.
4. QuickAccess §1e: `Lqdi;`, a Dagger factory in 11.1. No `Set`-returning method in 11.1 calls `Ltbp;->f()Z`, so the hook has no target.

Items 2-4 were found by a static check (not versioned script) that compares every method referenced by the patches with the 11.1 base.apk method index. After the fixes the check is clean.

### Final result (defaults)
```
Applied: Camera Looks Backport
Applied: Permanent Portrait Mode Fix
Applied: Pixel 10 Photo Saving Fix
Applied: Pixel Camera Clone (Non-Root)
Applied: Pixel Camera Creator Suite
Applied: Use Morphe Google Photos
Applied: Viewfinder Quick Access Controls
EXIT=0, success=true, failedPatches=[]
```
Output APK (~2.0 GB, not versioned):
- manifest:
  - `package="com.google.android.GoogleCamera.morphe"`, minSdk 37;
  - `<queries><package android:name="app.morphe.android.apps.photos"/>`;
  - every authority prefixed with `.morphe`, including `…morphe.specialtypes.SpecialTypesProvider`.
- dex:
  - Photos strings rewritten: package ×19, `mars.api.ACTION_REVIEW` ×3, `…_SECURE` ×3, mars authority ×3 plus 1 `content://`, `package:` ×1;
  - `secure_mode[_ids]`, `jetty.*` and service class names unchanged.
- signature: the CLI-generated key (`CN=Morphe`). **On the phone, patch with Morphe Manager**, so that the camera and Photos share the same key (patched Photos is signed `d549f05d…`).

### Second run: gallery patches enabled (not default)
With `-e "Use third-party gallery" -e "Use third-party gallery on lock screen" -d "Use Morphe Google Photos"`: everything applied, `Targets resolved: launcher=Llys;->e, gate=Llys;->b`. The fingerprints pass in the real patcher too, not only in `verify_fingerprints.py`.

### Not verified
Nothing installed on a device.

## Phase 6: metadata, documentation, CI (2026-11-25)

- `Constants.kt`: added `versionCode = 69703284` to the target.
- `patches-list.json` generated with `:patches:generatePatchesList` (version 0.1.0, 9 patches). The generator now writes dependencies by patch name (e.g. "Camera Looks Backport") instead of by class name, as Akshayykadam's repository does. Unnamed sub-patches stay `ResourcePatch`/`BytecodePatch`.
- `patches-bundle.json` generated with `.github/scripts/write_bundle_json.py`; the release workflow rewrites it.
- `README.md`, `COMPATIBILITY.md`, `CREDITS.md` written; `CLASSIFICATION.md` has been in the repository since Phase 1. Later translated from Italian to English before publishing.
- CI (from Gamer92000):
  - `build.yml` (push/PR): Python tool checks and bundle build;
  - `release.yml` (`v*` tag): `generatePatchesList` + `buildAndroid`, bundle name and `classes.dex` check, release asset, metadata commit.

  Only the default description in `write_bundle_json.py` was changed.
- Final build: `build` + `buildAndroid` OK.
