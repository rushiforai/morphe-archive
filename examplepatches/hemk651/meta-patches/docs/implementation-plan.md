# Implementation plan

> **Origin:** This project is a fork of [InstaFL](https://github.com/mamiiblt/instafel)
> by [mamiiblt](https://github.com/mamiiblt) (Muhammed Ali Bulut). The patch
> ideas, the embedded menu and the developer-options approach originate from
> InstaFL; credit belongs to its author. Meta Patches is an independent fork
> and is not affiliated with InstaFL, Meta, or Instagram.

## Scope

Exactly two apps are in scope: Instagram (`com.instagram.android`) and Instagram Instants (`com.instagram.moonshot`). The configuration payload is shared; package compatibility, startup hooks, and storage access are app-specific.

## Completed

- [x] Canonical JSON payload (`config/mc_overrides.json`) and repository validator (`scripts/validate_config.py`).
- [x] Morphe patch set ported from InstaFL for Instagram.
- [x] Runtime payload writer (`MCOverrides.install`) injected after `InstagramAppShell.onCreate`; writes `<filesDir>/mobileconfig/mc_overrides.json` atomically and idempotently.
- [x] Payload embedded into the extension at build time as a `BuildConfig` string from the canonical config file (the patcher merges only the extension's dex, so no asset is shipped).
- [x] Employee options gate forced true (bytecode), unlocking the shake-gesture developer options entry.
- [x] Verified against Instagram 457.0.0.0.26 in the build harness (`:patches:instagramApkBuild`): all patches apply, all DEX files pass dexdump, cross-DEX hierarchy issue set identical to the stock APK.
- [x] Confirmed working on device (v1.1.0-dev.5): payload installed and developer options unlocked without the optional Mods menu.
- [x] Full ad-removal override payload embedded into the extension (v1.1.0-dev.7).
- [x] Release bundle carries the on-device patcher dex (`classes.dex`) since v1.1.0-dev.8; a workflow-side guard that fails the release without it is prepared but pending a push token with the `workflow` scope.
- [x] Fixed the Mods menu crash on a home long press (v1.1.0-dev.9): the replaced `onLongClick` listener and `openDeveloperOptions` body now use InstaFL's fixed register layouts (`.registers 6` / `.registers 7`, dismiss through `p0`) instead of hardcoded registers on an uninitialized one; verified by dex inspection of the harness output APK.
- [x] Home sheet handler degrades gracefully: `try/catch(Throwable)` reports into the in-app crash reports (`<external files dir>/mp_update_files/mp_crashlogs.json`) and toasts `Menu error: <Exception>` instead of crashing the app.
- [x] `ModsInit.init` injection is guarded per call site (not "any extension reference"), so "Unlock developer options" and "Add Mods menu" no longer suppress each other's hook.
- [x] Outside-tap closing and graceful menu actions (v1.1.0-dev.10): tapping the dimmed background (or an empty spot) closes the quick sheet and the Mods menu activity like a back gesture; sheet items, menu tiles and both `onCreate` bodies are wrapped so failures are reported (`Menu error: <Exception>` toast + crash report) instead of crashing. The final APK's manifest was verified to declare all eight menu activities (`aapt2 dump xmltree`).
- [x] Root-caused the "Open Meta menu" crash with the on-device log (v1.1.0-dev.11): the injected activities declared no theme, so they inherited the app's splash theme chain (`Theme.Instagram.Splash`), whose `textAppearance` attributes fail to resolve — `new TextView()` threw `Failed to resolve attribute at index 7`. All eight menu activities now declare the self-contained framework theme `@android:style/Theme.Material.NoActionBar` in the manifest; the reference was verified in the output APK (`@0x0103022e`).
- [x] Fixed the "Developer options" crash from the Mods menu (v1.1.0-dev.12, on-device log): the menu activity sits in front of the feed, which is stopped with its fragment state saved — the sheet's navigator commit on it threw `IllegalStateException: Can not perform this action after onSaveInstanceState`. The menu now finishes itself first and the feed is navigated once it has window focus again (retry loop, guarded).
- [x] Fixed "Failed to read the applied patches" (v1.1.0-dev.12): the patch built the applied-patches JSON without escaping, so the "Remove snooze warning" description's literal quotes broke every `JSONArray` parse. The list is JSON-escaped at patch time now.
- [x] Real patch version everywhere (v1.1.0-dev.12): the extension generates `BuildConfig.PATCH_VERSION` from the Gradle project version (which the release flow sets to the release version before the bundle build), replacing the stale "1.0.0" constant shown in Build info, Misc and written into crash reports (`appData.patch_ver`).
- [x] System bar insets for all menu pages (v1.1.0-dev.12): Android 15+ enforces edge-to-edge, which pushed every page title under the status bar. A shared `ModsUi.applySystemBarInsets` helper pads the page root by the status/navigation/cutout insets on API 30+ and fits system windows below.
- [x] Import backup ported from InstaFL (v1.1.0-dev.12): Misc → Backup → Import backup opens the system file picker — full replace or merge into `<filesDir>/mobileconfig/mc_overrides.json` (same path `MCOverrides.install` writes; the optional `"backup"` wrapper of InstaFL backups is unwrapped, merge keeps current values and only adds missing entries). A marker file makes the bundled installer stand down so imports survive restarts; "Restore bundled overrides" undoes an import. The old-backup and mapping-file flows of InstaFL were not ported (no export/mapping feature here yet).
- [x] Fork-of-InstaFL attribution (v1.1.0-dev.12): README carries the explicit "This project is a fork of InstaFL" credit next to the release-flow-regenerated patches section (which only rewrites the `PATCHES_START`/`END` block), and the in-app About credits text states the same.
- [x] Ported the Instants Mod from Wagg13 (v1.2.0-dev.1): the functional parts of Wagg13Patch_Morphe's "Instants Mod" (https://github.com/WaggBR/Wagg13Patch_Morphe, GPL-3) for Instagram Instants (`com.instagram.moonshot`) — the gallery button on the camera screen (posts a picked photo or a short video through the camera pipeline, Home-route visibility detection) and the "Save to gallery" row in the friends' Instant overflow menu (photos and videos via MediaStore, needs Android 10+). Upstream's branding parts (launcher icon, wordmark, "Mod by Wagg13" About row) were not ported; name and description kept. Helper classes merged into the shared extension as `app.hemk651.meta.extension.instants`; patch package `app.hemk651.patches.instants`; compatibility declares every version (upstream pinned 451.0.0.53.106). Fingerprint verification against 455.0.0.55.95 awaits the user's APK (helpers are self-contained: framework + reflection only).
- [x] Harness selects the patch set by APK (v1.2.0-dev.1): the AndroidManifest bytes of the input APK are sniffed for the exact package name `com.instagram.moonshot` (NUL-stripped, so UTF-16LE string pools match; the Instagram manifest mentions "moonshot" only as a share target, which the exact-name search rejects), and the Instants patch (with its unnamed dependency parts) is selected for moonshot builds.
- [x] Ported the Instants upload from gallery for main Instagram (v1.2.0-dev.2): the "Upload instants from gallary" patch from Wagg13's reverse-engineered patch payload (https://github.com/WaggBR/Wagg13Patch_Morphe, GPL-3) — adds a gallery button to post photos and videos from your device's gallery using QuickSnapCameraViewModel lifecycle hooks, injects routing signals via the shared helper classes (InstantsGalleryHelper.onCameraOpened/onCameraClosed), and runs on Instagram 457.0.0.0.26 compatibility. Name and description kept exactly as requested ("Upload instants from gallary"). Fingerprint verification uses structural anchors (class names, parameter shapes) since Compose trace strings are stripped vs moonshot. APK built at /tmp/opencode/ig-upload.apk awaiting device verification.

## Removed (dead machinery)

The original SAF/Storage Access Framework installer design was removed because it was architecturally dead: the patcher merges only the extension's dex into the target APK, so the extension's asset never reached the target app — and the SAF installer read `mc_overrides.json` from the *host* app's assets. The working path is the runtime writer above.

Removed: the four per-app packaging patch declarations (Instagram/Threads/Edits/Instants "Developer Options Unlocker (Employee Options)"), `MetaConfigInstaller`, `MetaConfigSetupActivity`, the extension asset copy, and the SAF-related documentation. The "Unlock developer options" patch (runtime writer + gate) is the supported path and stays.

## Still open

- [ ] Extend "Remove ads" to cover stories ads, promotional videos, and reels ads (currently a bytecode-only port of the InstaFL ad-pod patch).
- [ ] Confirm the v1.1.0-dev.12 menu changes on device (developer options from the menu, applied-patches list, version display, insets, import backup).
- [ ] Export (write-back) of the current overrides as a backup file, completing the InstaFL backup round trip.
- [ ] Push the prepared release workflow guard (`classes.dex` presence check); requires `gh auth refresh -h github.com -s workflow`.
- [ ] Verify the moonshot Instants Mod on device against 455.0.0.55.95 (APK awaited from the user; harness run done, fingerprint adaptation if any part fails).
- [ ] Verify the main-Instagram upload-from-gallery patch on device against 456.0.0.24.78 (APK already built and pushed; user's device runs 456.0.0.24.78, harness verified for 457.0.0.0.26).
- [ ] DM screen status-bar report (v1.1.0-dev.12): stock-vs-patched APK comparison shows the bundle changes nothing that can affect layout (manifest diff = only the nine menu activities; resources.arsc diff = only the four AMOLED color values plus runtime-invisible placeholder renames of already-obfuscated names; no window/insets code touched). Awaiting a screenshot and a stock-build comparison before any change; an inset shim on the DM window would risk double padding since Instagram drives edge-to-edge itself (`enableEdgeToEdge=true` in its own theme).
