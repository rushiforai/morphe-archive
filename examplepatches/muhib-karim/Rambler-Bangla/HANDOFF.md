# Handoff — Rambler Bangla

**Date:** 2026-11-28  
**Repo:** `/root/workspace/rambler-work/Rambler-Bangla` (`origin/main`, tag `v32.4.0`)

## Current Objective
1. **Completed:** Shipped **`Rambler Bangla v32.4.0`** (60-patch unified Morphe suite for Gboard `18.5.4.993608717-release-arm64-v8a`), delivering:
   - **SwiftKey Mode (`Patches → Keyboard → SwiftKey Mode`):** In-place Shift-to-Capitalize word at cursor (Double-tap default / Single-tap selectable), smart space trim before punctuation, custom text-expansion shortcuts on the native strip, and reversible 1-tap SwiftKey Preset (Number Row, Long-Press Symbols, 200 ms long-press, Auto-space, Double-space period, Undo auto-correct, Swipe-dismiss, Shift+Delete, Extended Clipboard).
   - **Instant `@Mention`, Full-Email & 1-Digit Personalized Strip:** Typing `1` immediately suggests learned full emails/IDs like `11name@gmail.com` on Gboard's native strip, with strict password/PIN/OTP/incognito fail-closed protection.
   - **Systemic Bangla Loanword & Orthography Overhaul:** CMU phonetic cross-check purging 2,540 noisy Aksharantar homograph hijacks (`these→দিজ`, `those→দোজ`, `will→উইল`, `who→হু`, `whose→হুজ`), plus generalized trailing-`ো`, full-lexicon homophone (`পৌশ→পৌষ`), missing-hasanta (`ফালগুন→ফাল্গুন`), 12 Bengali months + `মাস`, `আগের চে→আগের চেয়ে`, and `কিবোর্ড এ→কিবোর্ডে`.
2. **Next (`v33.0.0`):** Offline AI Voice Mode (`sherpa-onnx` built-in engine + distinct offline mic icon + 1-tap on-demand downloads for NVIDIA Parakeet TDT v3 & AI4Bharat IndicConformer Bengali + optional Whisper Large-v3-Turbo).
2. **Awaiting user approval before applying:**
   - Proposed `AGENTS.md` cleanup and on-demand `.agents/skills/` split.
   - Recommended script/tool consolidation (`scripts/`, `.github/scripts/`) and concise log-file output modes.
   - Optional Firebase Test Lab Robo testing once `gcloud` + a Spark-plan Firebase project are configured.

## Completed Work
- **`v31.3.1`** ([PR #37](https://github.com/muhib-karim/Rambler-Bangla/pull/37), `be69f33`, 60 Morphe patches):
  - Fixed `v31.3.0` ART `VerifyError` in `Lrmt;-><init>(Context, Z)V` caused by R8 reusing `p1` (`Context`) as an `int` color return value (`move-result p1`) right before `return-void`, by switching the AMOLED dark toggle check in `NlMorpheGboardPatches.kt` to zero-arg `RamblerEnhancementsSettings.isAmoledDarkKeyboardEnabled()` (backed by `RamblerFlagRuntime.resolveContext()`).
  - Added a clobbered-`p1` Dexlib2 unit test (`314` `:patches:test` total), strict clean-decompile JADX verification on `rmt` and `fqi`, and real ART `cmd package compile -m verify -f` + live IME activation checks in `.github/workflows/android-smoke.yml`.
  - Confirmed loading cleanly on the maintainer's physical device after in-place upgrade over `v31.3.0`.
- **`v31.3.0`** ([PR #36](https://github.com/muhib-karim/Rambler-Bangla/pull/36), superseded by `v31.3.1`):
  - Introduced the live in-app **AMOLED Dark Keyboard** toggle (default `false`) and `gboardClipboardReorderPatch` (`Clipboard Drag-to-Reorder`) patching Gboard's clipboard `ItemTouchHelper.Callback` (`fqi`) via `RamblerClipboardReorderRuntime`.
  - Added **Keyboard appearance & clipboard** live toggles directly on the main **Rambler Enhancements** hub screen (`RamblerEnhancementsActivity.java`).
- **`v31.2.0`** ([PR #33](https://github.com/muhib-karim/Rambler-Bangla/pull/33), [PR #34](https://github.com/muhib-karim/Rambler-Bangla/pull/34), [PR #35](https://github.com/muhib-karim/Rambler-Bangla/pull/35)):
  - Native Gboard suggestion-strip `@Mention` integration (`pbh`/`pbo`/`owu`/`phr`), full GPL-3.0/MIT/MPL-2.0/BSD/§7c licensing sync, and production-grade GitHub homepage.
- **Colab cleanup:** Zero active Colab sessions (`colab sessions` verified empty).

## Verified Decisions
- **AMOLED Dark Keyboard default OFF + live toggle:** Prevents pitch-black surface flattening on stock Material You dark themes while keeping `#000000` OLED mode one tap away in Settings.
- **Clipboard drag-to-reorder on `fqi` (`ItemTouchHelper.Callback`):** Preserves stock swipe-to-delete (`48`), keeps card opacity (`0.94f`) during drag instead of horizontal swipe-fade, replays `performLongClick()` on stationary tap-and-hold release so Pin/Delete popup still works, locks headers & Edit Mode, and persists order by reassigning the section's existing sorted descending timestamps so recent TTLs stay intact.
- **Persistent maintainer signing (`679cfdec...`):** Always sign release APKs via `.github/workflows/private-test-build.yml` (`RAMBLER_KEYSTORE_BASE64`) so users upgrade in-place without uninstalling or losing learned `@mentions`/settings.
- **No binaries in git:** Zero `.apk`, `.apks`, `.dex`, `.mpp`, `.rve`, or `.keystore` files tracked in git.

## Relevant File Paths
- **Morphe patches:** `patches/src/main/kotlin/dev/abotmaker/ramblerenhancements/patches/{NlMorpheGboardPatches,RamblerBanglaPatches,RamblerSharedPatches,PatchCatalog}.kt`
- **Extensions / runtime:**
  - `extensions/rambler-enhancements/src/main/java/dev/abotmaker/ramblerenhancements/{RamblerClipboardReorderRuntime,RamblerEnhancementsSettings,RamblerEnhancementsActivity,RamblerAtMentionStore,RamblerAtMentionStripRuntime,RamblerFlagRuntime,RamblerHiddenFlagOverrideRuntime}.java`
  - `extensions/rambler-enhancements/src/main/java/com/akshaykadam/pixelboard/extension/rambler/{GboardRamblerScriptFix,GboardRamblerLayoutPair}.java`
  - `extensions/extension/src/main/java/dev/jason/gboardpatches/extension/rambler/GboardRamblerStockPolicy.java`
- **Docs & metadata:** `README.md`, `CHANGELOG.md`, `docs/index.html`, `docs/banner.svg`, `docs/feature-showcase.svg`, `docs/PROJECT_BRAIN.md`, `patches-bundle.json`, `patches-list.json`, `ATTRIBUTION.md`, `THIRD-PARTY-NOTICES.md`, `NOTICE`
- **Release artifacts (`v31.3.1`, maintainer-signed cert `679cfdec...`):**
  - `/sdcard/Download/RamblerBangla-v31.3.1-gboard-18.5.4-arm64-v8a.apk`
  - `patches-31.3.1.mpp` on GitHub Release

## Test Results (`v31.3.1`)
- **Python unit tests & selftests:** **88/88** passed (1 skipped), `ci_gate_selftest.sh` **PASS**, `url_allowlist_selftest.sh` **PASS**.
- **Colab Gradle, Morphe CLI & Strict JADX:** Full extension unit tests + Android Lint, `:patches:verifyGboardCapabilityWiring`, **314/314** `:patches:test`, **60/60** Morphe CLI patches on Gboard `18.5.4`, DEX markers & strict clean-decompile JADX checks on `rmt` & `fqi` — **PASS**.
- **GitHub CI, Maintainer Signing & Hardened Android 15 KVM ART+IME Smoke Test:** Verified on PR #37 (`#46009864068`, `#46009864123`, `#46009925295`, `#46010359878`) and `v31.3.1` release.
- **Physical device check:** Maintainer confirmed `v31.3.1` installed in-place cleanly and keyboard loads normally; ongoing real-world usage feedback pending.

## Unresolved Issues
- Awaiting maintainer's day-to-day phone feedback on `v31.3.1` (AMOLED toggle, clipboard drag-to-reorder, spoken Bangla ASR).
- `gcloud` / Firebase Test Lab is not configured in this container.

## Exact Next Steps
1. Address any real-device feedback reported by the maintainer on `v31.3.1`.
2. On approval, apply the proposed `AGENTS.md` rewrite, `.agents/skills/` split, and script cleanups in a dedicated PR.
