# Workspace cleanup and artifact ownership

Scope: `D:\Angelo\Desktop\SteamLink-GalaxyXR-Windows-Toolkit-FULL`, including its separate repositories. Last audited: **2026-09-15**.

## Required completion rule

Cleanup is part of completing an experiment or finalizing/applying a patch. Record the outcome, exact base, evidence and runtime limits; remove disposable outputs and superseded local copies; verify retained inputs and tool references. Keep a dated failed/retired record so a failed experiment is not recommended again. Parent and repository `AGENTS.md` enforce this rule.

## Dropped Steam Link build removal, 2026-09-20

- **User-approved scope:** all compatibility, patch code, tests and catalogs now target exactly **2.0.20/5001712, 2.0.22/5002244, 2.0.23/5002363**. Dropped builds `5001740`, `5002296`, `5002313`, `5002318`, `5002322` were removed from `shared/Constants.kt`, every per-build layout table, the two `galaxyXrRecommended5002318/5002322Patch` bundles, patch descriptions, audit tools and tests. Shared code paths used by the 3 kept builds are preserved (e.g. the tongue-bridge byte arrays, now neutral `MODERN_TONGUE_ORIGINAL`/`MODERN_TONGUE_REPLACEMENT`).
- **Verification:** 106/106 JUnit via `diagnostics/steamlink-5002363/Compile-CachedAudit.ps1` (cached-Kotlin compile + JUnit; normal Gradle remains blocked resolving `app.morphe.patches:1.3.3`).
- **Catalogs regenerated locally** (the CI `generatePatchesList` task is unreachable while the plugin is blocked): the current source was compiled, packaged to `patches/build/libs/patches-1.18.0-dev.10-catalog-local.mpp` (manifest `Version: 1.18.0-dev.10`, same attributes as the last shipped MPP), and `util.PatchListGeneratorKt` was run with channel `experimental` from `patches/`. All 4 `patches-list*.json` went from 26 to 24 entries (the 2 dropped-build bundles removed); every `compatiblePackages` target is now one of the 3 kept builds. `TECHNICAL_REFERENCE.md`'s generated section was refreshed with the official `.github/scripts/generate_patches_readme.py AngelDark92/steamlink-patches dev patches-list-all.json TECHNICAL_REFERENCE.md`, and its hand-written compatibility prose, plus `.github/copilot-instructions.md`, now list only the 3 kept builds.
- **Removed:** 6 superseded compiler-output dirs under `build/audit-5002363/` (`compiled/`, `compiled-final/`, `compiled-v2/`, `compiled-3213058d…`, `compiled-785c2d5b…`, `compiled-795f9363…`, ~22 MB). Kept the current compile dir (`compiled-1dbb14…`) and the local MPP (only MPP matching the current source; the 3 older local experiment MPPs were already retained per prior records).
- **Intentionally retained dropped-build references:** Morphe patch names (`GXR face bridge (version 5002318 and below)`, `GXR tongue bridge (version 5002322 and above)`, `Startup permission requests (before 5002322)`, `Startup splash and XR launch mode (before 5002322)`); fail-closed test guards asserting dropped builds stay unsupported/unchanged; the retired-resource absence guards (`libgxr_surface_video_5002322_*.so`); the real-device evidence fixture `patches/src/test/resources/steamlink/identity/installed-5002322-hmd-config.json`; dated records in `CHANGELOG.md`, `WORKSPACE_CLEANUP.md`, `diagnostics/`, `XR_RESOLUTION_EXPERIMENT_LOGS/`, `extensions/decoder-input-buffering/` (retired-experiment reproducibility source) and `LEGACY_VS_MORPHE_PATCHES.md`.
- **Open for user decision:** `PATCH_CATALOG.md` still contains per-build guarded-layout tables and bundle descriptions for the dropped builds (engineering reference, mixed current/historical content).

## Samsung automatic USB retirement, 2026-09-19

- **Retired at the user's request.** The exact **2.0.23/5002363**, Galaxy XR SM-I610 / Android 14 experiment automated Samsung RNDIS, not the required Quest-equivalent NCM. Removed its patch/native mutation, Java/smali helper, tests/audit, build integration, probe, dedicated build/finalization scripts and trial instructions. No automatic USB patch is provided. [Consolidated historical feasibility and NCM failure](diagnostics/steamlink-usb/QUEST-PARITY-2026-09-16.md).
- Historical checks before retirement: 131 JUnit tests, D8 packaging and 5 pristine-APK cases passed; no installation or headset validation. The retired archive SHA-256 was `19889ea8e9481145a324029439070af2a9508b33254ea71845523d6ab8937e46`. The native status experiment changed 99 bytes at file ranges starting `0x238`, `0x102e71c`, `0x1b0e2f0` in the 28,372,424-byte shell: original SHA-256 `362d18db40808b40c598c4c73d227f1d7f138968bee03d0dd254567022b10f21`, patched `ecbf7e7902fb1300e4aa93fc0d60166017dae377307c5d28ed64c3b47032d31c`. These are retirement identifiers, not available artifacts or runtime proof.
- After source removal, cached Kotlin compilation and all **125 remaining JUnit tests** passed, 0 skipped/failed. Normal Gradle remains blocked resolving `app.morphe.patches:1.3.3`. All 4 catalogs were regenerated from the remaining source: experimental/all/current channels went from 30 to 29 entries, stable stayed at 26. Every other patch's metadata/defaults and recommended dependencies are unchanged.
- Retirement inventory: **151,126 files and 10 repositories**, excluding Git internals and skipping reparse paths. Removed **48 allowlisted targets, 7,964,037 bytes**, including 25 source/diagnostic files, the trial MPP, old probe/helper/compiler output, superseded report trees, and the retirement check's own temporary compiler/catalog artifacts. All targets are absent; all **75 protected files** retained their hashes and other repository states were unchanged. The USB diagnostics folder now contains 5 manual-transport/NCM evidence files. Explicit deletion lists, compact prior APK results, retained test XML, catalog checks and completion receipt are under `build/usb-retirement-20260919`. The earlier build-preparation cleanup removed 76 targets / 3,142,360,357 bytes; that historical total is separate from retirement.
- Preserve the independently working manual USB scripts, live transport/native findings, NCM failure evidence, pristine APKs/decoded bases, shared compiler/SDK/D8 tools, unrelated experiments and all USB-function/host-address/driver/signing rollback state. Previously blocked deletions remain excluded. No device permission, installation, driver, live network setting or SteamVR state was changed. The rejected patch is not a regeneration target; remaining-source verification uses `diagnostics/steamlink-5002363/Compile-CachedAudit.ps1`.

## SDR10 shader assembly and GLSL checker, 2026-09-19

- **New tracked diagnostic artifacts for the SDR10 baseline slices** ([plan](diagnostics/steamlink-colour/VD-LIKE-SDR10-IMPLEMENTATION-PLAN.md), results section 10): `diagnostics/steamlink-colour/glsl_validate.py` (stdlib-only Python 3; fail-closed structural/semantic ESSL 3.00 checker — **not** a driver compile), `diagnostics/steamlink-colour/Test-Sdr10ShaderAssemble.ps1` (cached-Kotlin runner around the blocked `app.morphe.patches:1.3.3` resolution), `patches/src/main/kotlin/util/Sdr10ShaderAssembleAudit.kt` (audit main) and the `auditSdr10ShaderAssemble` task in `patches/build.gradle.kts`. Preserve with the other steamlink-colour diagnostics.
- **Retained output, compact results:** `build/sdr10-shader-assemble-5337d033135547da8ec01f3ee0d0eac4/` — 36 assembled `.glsl` files (1,116 B opaque / 1,383 B masked on every base and dither mode) plus `report.txt` (6 PASS, BLOCKED 5001740). The runner's sibling compile workspace `build/sdr10-shader-assemble-compile-74ef7e78688e4c159b919b2e91d1ed65/` (extracted helpers, `PatchException` shim, audit jar, result log) is regenerated on demand. Both directories are disposable **only after** results are recorded; **never delete `build` wholesale** — remove only an explicitly allowlisted `build/sdr10-shader-assemble-*` directory. Reproduce with `powershell -NoProfile -ExecutionPolicy Bypass -File diagnostics/steamlink-colour/Test-Sdr10ShaderAssemble.ps1` then `python diagnostics/steamlink-colour/glsl_validate.py <output-dir>`.
- Verification for this phase: 126/126 JUnit via `diagnostics/steamlink-5002363/Compile-CachedAudit.ps1`; OLED decoded audit 6 PASS + BLOCKED 5001740; 36/36 GLSL structural PASS; `Check-SteamLinkColour.ps1 -Mode SelfTest` 21 checks PASS. No disposable workspace APKs, decoded derivatives, bundles or compiler output were generated beyond the two build directories above; decoded inputs are the retained exact-base fixtures. No device permission, installation, driver, live network setting or SteamVR state was changed. No bytes reclaimed this phase.

## Streaming-control audit, 2026-09-18

- Retained [native findings and reproduction checks](diagnostics/steamlink-streaming/README.md) for 2.0.20/5001712, 2.0.22/5002244, 5002296, 5002313, 5002318, 5002322, and 2.0.23/5002363. Hash-pinned decoder checks passed on all 7 available inputs; 2.0.20/5001740 remains unavailable for this audit.
- No verified codec-negotiation override or 350 Mbps cap found in the inspected paths. Production implementation remains blocked; no APK patching, installation, runtime test or host configuration change was performed.
- Created only compact audit source, checks and documentation under `diagnostics/steamlink-streaming`. No disposable workspace APKs, decoded derivatives, bundles or compiler output were generated. Removed 0 files; reclaimed 0 bytes. Existing exact inputs and `build/oled-native-audit/python` tools remain required; unrelated USB changes preserved. Reproduce with `diagnostics/steamlink-streaming/Verify-StreamingAudit.ps1`.

## Canonical files and build ownership

| Files | Owner / policy |
|---|---|
| `patches/src/main/kotlin`, `patches/src/main/resources`, `extensions/*/src` | Authoritative source and packaged resources. Preserve. |
| `patches/src/main/resources/steamlink/androidxr/*.so` | Required checked-in native payloads. **CI/Gradle does not rebuild these C++ libraries.** Native rebuild/copy/hash-update instructions are in `extensions/resolution-trace-layer/README.md`. |
| `patches/build/{libs,classes,kotlin,resources,generated,morphe,tmp}` | Generated bundles/compiler output. Remove after recording results; retain a specifically needed unaccepted experiment separately until its acceptance/retirement decision. |
| `patches/bin` | Stale IDE source/resource copies, not a source tree. Removed and ignored. Audit found 36 counterparts: 11 identical, 25 divergent stale copies; another 1 file was generated DEX. |
| `extensions/resolution-trace-layer/build-*` | Disposable CMake output. Removed and ignored, including 21 accidentally tracked files. |
| `patches-list*.json`, `patches-bundle.json`, `TECHNICAL_REFERENCE.md` | Release metadata/docs intentionally generated and committed by `.releaserc`. Preserve; regenerate from source when needed. |
| `.github/workflows/release.yml` and `.releaserc` | CI compilation, release bundle generation and publication. Normal bundle consumers use the repository's GitHub Releases/Morphe feed. Local validation remains supported. |
| `decoded-apk-*`, `build/decoded-fixture-apks`, `build/decoded-fixture-sources` | Exact-base audit inputs, not disposable output. Some fixtures are reconstructions; retaining them does not make them pristine installable APKs. |
| Root `build/` | Mixed scratch, tools, fixture inputs and evidence. Never delete wholesale. |

## Cleanup performed on 2026-09-15

| Measurement | Result |
|---|---:|
| Workspace before | 17.551 GiB (18,845,345,130 bytes) |
| Workspace after, including cleanup records | 6.894 GiB (7,402,241,511 bytes at verification) |
| Deleted artifact contents | 10.672 GiB (11,459,142,704 bytes) |
| Reviewed deletion targets / files | 59 / 9,414 |
| Tracked generated files removed | 58 |
| Retained files verified by size/mtime, excluding Git internals | 57,790 |

The folder is approximately **61% smaller**. Sizes are logical file lengths, not a filesystem allocation/free-space measurement. The approximately 16 MB of cleanup records explain most of the difference between deleted bytes and net shrinkage. 3 small A/B manifests were archived separately, and the concurrent deletion noted below is excluded from this cleanup's deletion total.

Exact allowlist, deleted-file SHA-256/byte inventory, retained-file metadata, application results, and Git status snapshots are local files in `../cleanup-records/2026-09-15/` (relative to this repository). `verification.json` records the measurement snapshot; the report itself may add a few bytes afterward.

- Removed repeated APK audit derivatives in `build/audit-5002363`, `build/startup-boundary-audit`, and the retired `build/surface-video-apk-audit`. Original APKs/fixtures and top-level logs, comparisons, disassembly, and audit scripts remain.
- Removed superseded 5002244 A/B decoded trees/APKs, archiving each `manifest.txt` under `../cleanup-records/2026-09-15/a-b-manifests`. Removed the emptied A/B output directories because the generator requires its output directory to be absent. Fixed `generateVideoOutputAb` to read the existing canonical `decoded-apk-android-steamlinkvr-release-base-2.0.22-5002244` directory.
- Removed redundant raw `arsclib-inspect-*/root` extractions, generated bundle/compiler output, obsolete Surface-video native/test binaries, old retirement/checkbox assembly scratch, and the retired underside bundle. Dated tried/retired records remain.
- Removed `patches/bin` and generated resolution-layer CMake trees. No production Kotlin, native source, packaged payload, or compatibility entry was removed.
- Removed `../VirtualDesktop/split_data`, an Apktool-generated extraction. Its 8 original/archive files match the retained APK by SHA-256; the remaining 2 files are generated decode metadata. The retained `split_data.apk` SHA-256 is `d12ceff6ffed76c6bd25feafbea085acf1c93e3678ee1ee7abeffda46cf5d281`.

Historical reports can still mention deleted output paths/hashes. These identify the artifacts used at the time; they are not promises that old APKs/bundles remain available. Rebuild from the appropriate recorded source revision to reproduce historical behavior. Retired experiments remain retired.

## Retained exceptions and their completion conditions

| Retained location | Reason / when cleanup is allowed |
|---|---|
| `build/live-hitch-20260915`, `build/decoder-buffering` | Current capture and decoder experiment evidence/artifacts. Runtime acceptance remains unresolved; clean bulky generated outputs after acceptance or retirement and retain result records. |
| `build/banding-live-*`, `build/analysis`, `build/direct-surface-native-audit`, other compact reports | Unique capture/research evidence. Summarize before removing any irreplaceable measurements. |
| `.android-sdk` | Used by local native builds; CI presence is not a replacement for these local inputs. Remove only after callers have a verified replacement SDK. |
| `build/tooling` | `extensions/decoder-input-buffering/Build-Native.ps1` uses its CMake/Ninja; `Test-Native.ps1` uses its Zig. Remove only after those dependencies are replaced. |
| `build/startup-boundary-tools`, cached compiler dependencies | `diagnostics/steamlink-5002363/Compile-CachedAudit.ps1` uses these. Existing audit documentation reports the pinned `app.morphe.patches:1.3.3` resolution blocker; this cleanup did not repair or re-test that dependency. |
| `extensions/controller-velocity-layer/build-android/_deps/openxr_headers-src` | Resolution-layer build instructions consume these downloaded OpenXR headers. Do not delete the enclosing build tree until that reference has a replacement. |
| `../Best Apks` | Supplied source APKs; decoder build tooling directly references the 5002322 and 5002363 inputs. |
| `../Tools/install/platform-tools`, `../Tools/apk-tools` | Active diagnostics/build dependencies. |
| `../Tools/install/backups`, install state, signing/pairing material | Rollback/identity inputs. Preserve. The Tools repository has unrelated pre-existing changes. |
| `../CustomHeadsetOpenVrGxR` | Separate source repository, about 43 MiB at audit time. No significant disposable outputs identified. |
| Other `../VirtualDesktop` APKs/analysis, `../galaxyxr_resources.zip` | Original analysis inputs or unique resources. Full reproduction/equivalence was not established. |
| All `.git`, `.github`, `.codex`, `.agents` folders | Repository and agent infrastructure. Preserve. |

`Lingering_Issues.txt` disappeared in a concurrent change during preflight. This cleanup did not delete or restore it; it is recorded separately from the allowlist and reclaimed-byte total.

## Regeneration

Run these from the repository root when needed, then clean their output after recording validation. Standard Gradle commands require the pinned plugin to resolve:

```powershell
.\gradlew.bat :patches:buildAndroid
.\gradlew.bat :patches:generatePatchesList -PreleaseChannel=experimental
.\gradlew.bat test :patches:auditOledDecodedCompatibility :patches:auditSteamLink2363Native
.\gradlew.bat :patches:auditDecodedSteamLinkPatches
.\gradlew.bat :patches:generateVideoOutputAb
```

The decoded patch audit requires the retained exact fixture APKs. Native build recovery is documented in `extensions/resolution-trace-layer/README.md`; cached Kotlin validation is documented in `diagnostics/steamlink-5002363/README.md`. These commands generate new output and were not run merely to refill deleted build directories.

To reconstruct the removed Virtual Desktop decode using the retained tool/input, run from the workspace root:

```powershell
java -jar Tools/apk-tools/apktool.jar d VirtualDesktop/split_data.apk -o VirtualDesktop/split_data
```

## Verification scope

### Additional cleanup: decoder pipeline v2, 2026-09-15 19:51

- Experiment status: Buffered v1 ran on exact 2.0.23/5002363 but whole-view freezes persisted; [tried record and telemetry follow-up](diagnostics/steamlink-hitches/TELEMETRY-2026-09-15.md). V2 is diagnostic instrumentation, initially awaiting user installation.
- Retained evidence: [validation receipt](diagnostics/steamlink-hitches/decoder-pipeline-v2-validation.json), 113 Kotlin test results, native pool/24 bridge/6 wrapper scenarios, 26 pristine-APK cases and 10 reapplication/rollback cases, plus exact native guard/relocation audits and current live captures.
- Removed **63 allowlisted targets, 2,794,626,624 bytes**: unsigned audit APKs and decoded temporary copies, cached compiler output, native CMake output, and duplicate MPP/catalog-work copies. All 63 targets were verified absent; 7 protected current artifact/resource/capture hashes were verified unchanged.
- Preserved current `patches/build/libs/patches-1.18.0-dev.1-decoder-pipeline-v2-local.mpp`, all 4 canonical decoder helper resources (v1 comparison modes plus v2 telemetry), pristine inputs/decoded bases, SDK/tools, source, current traces and compact reports. Regenerate with `extensions/decoder-input-buffering/Build-Native.ps1 -CopyResources` (telemetry resources only), update validated pins, then `diagnostics/steamlink-hitches/Build-DecoderExperiment.ps1`.
- Exact inventory/result: `build/decoder-buffering/telemetry-cleanup/{allowlist,result}.json`. Cleanup source: `diagnostics/steamlink-hitches/Cleanup-PipelineTelemetry.ps1`; no wholesale build-tree deletion.
- External verification delta: `CustomHeadsetOpenVrGxR/ThirdParty/json` lost its pre-existing modified status during final Git verification. No deletion target was outside `steamlink-patches`; no attempt was made to restore concurrent work. Tools status remained unchanged.
- Deferred: `build/decoder-buffering/pipeline-review-test.exe` (448,512 bytes) and `.pdb` (3,665,920 bytes). Automatic approval review rejected that earlier deletion with only “blocked by policy”; no alternate deletion mechanism was used. Retire these 2 generated files when removal is permitted. Other current diagnostic captures remain intentionally retained until the investigation ends.

### Live Observe v2 evidence retention, 2026-09-15 20:09

- Exact 2.0.23/5002363 Observe + pipeline telemetry is runtime-verified; buffering disabled. [Current findings](diagnostics/steamlink-hitches/OBSERVE-RESULTS-2026-09-15.md) record app-socket overflow, decoder starvation/recovery, and the unimplemented receive-buffer candidate for both supported bases.
- Added reusable read-only host-console and UDP-counter collectors. No new compiler output, patched APK derivative, bundle or native payload was produced in this capture phase; 0 additional bytes reclaimed.
- Retain `build/live-hitch-20260915/observe-telemetry-v2` as current unresolved diagnostic evidence: 2 unique traces (517,709,309 and 242,071,107 bytes), the installed verification APK (41,686,773 bytes), counters, logs, offline analysis and native maps. Raw evidence remains ignored because it includes private session data. Remove bulky copies only after the investigation/acceptance decision is recorded; preserve compact findings and reproduction sources.
- All capture processes finished, remote traces were removed, and `adb-cleanup.json` records 0 ADB processes/listeners at 2026-09-15 18:09:49 UTC. The previously blocked review-test EXE/PDB remain deferred for the reason already recorded above.

### Android XR and cross-PC follow-up, 2026-09-15

- [Follow-up report](diagnostics/steamlink-hitches/XR-HOST-COMPARISON-2026-09-15.md) preserves exact 2.0.20/5001712 versus 2.0.22/5002322 and 2.0.23/5002363 findings, compositor continuity, route/counter snapshots, host evidence and unresolved causes. No patch or bundle changes in this phase.
- Retain `build/live-hitch-20260915/xr-host-comparison` as current private diagnostic evidence: fresh Android/host snapshots and logs, native comparisons, and small query outputs against the existing traces. No new APK derivatives, compiler outputs or Perfetto traces were generated; 0 additional bytes reclaimed. Existing traces and exact input bases remain required.
- Read-only device inspection finished and ADB was stopped. `xr-host-comparison/adb-cleanup.json` verifies 0 processes/listeners at 2026-09-15 18:23:46 UTC. Previously deferred cleanup remains documented above; no blocked deletion was retried.

### Supplied paired-PC archives, 2026-09-15

- Incorporated both user-supplied ZIPs and `Comparison Conclusion.txt` into the [current solution assessment](diagnostics/steamlink-hitches/XR-HOST-COMPARISON-2026-09-15.md). Found a session-scoped `asyncSend` override difference; retained UDP buffer increase as an independent experiment, not a proven fix.
- ZIPs read directly without extraction or execution. Original archives/conclusion preserved unchanged. Retain compact inventories, hashes, settings timelines and exact-session recounts under `build/live-hitch-20260915/supplied-pc-archives`; no temporary decoded/APK/compiler outputs were generated and 0 bytes reclaimed.
- No ADB process started, no device/settings/patch/bundle changes. Existing deferred cleanup is unchanged.

### UDP receive-buffer experiment completion, 2026-09-15

- Built the standalone, default-off UDP receive-buffer experiment for exact 2.0.22/5002322 and 2.0.23/5002363; recommended bundles remain unchanged. Runtime effectiveness is pending. Recorded the user's unsuccessful `asyncSend=true` test in [the tried ledger](diagnostics/steamlink-hitches/TRIED-EXPERIMENTS.md) and the explicitly requested future-chat memory note.
- Validation passed: 118 Kotlin tests, 16 actual Morphe APK cases, and 4 catalog regression checks. [Canonical receipt](diagnostics/steamlink-hitches/udp-receive-buffer-validation.json) and [experiment record](diagnostics/steamlink-hitches/EXPERIMENT-2026-09-15-udp-receive-buffer.md) preserve native guards, exact inputs, hashes, limitations, and reproduction instructions.
- Removed **27 allowlisted targets, 672,229,542 bytes** at 18:50:07 UTC: unsigned audit APKs, compiler output, duplicate staged MPP and generated catalog scratch. Verified all 11 protected files unchanged. Earlier per-case temporary copies were already removed by the build script and are excluded from this measured total.
- Inventory covered 10 repositories and 150,470 files with 0 read errors; Git snapshots showed 0 repository-status differences across cleanup. Inventory, allowlist, cleanup result, test XML, case logs/receipts, and completion verification remain under `build/udp-receive-buffer/validation-20260915`.
- Retained `patches/build/libs/patches-1.18.0-dev.3-udp-receive-buffer-local.mpp`, canonical sources/resources, pristine APKs, exact decoded bases, required tooling, and current unresolved diagnostic captures. Regenerate using `diagnostics/steamlink-hitches/Build-UdpExperiment.ps1`; scoped cleanup is reproducible with `Cleanup-UdpExperiment.ps1`.
- No APK installation, ADB startup, or live host-setting change occurred. The previously blocked review-test EXE/PDB remain deferred unchanged; no blocked deletion was retried.

### UDP 8 MiB live trial failure and evidence retention, 2026-09-15 21:46

- Exact installed 2.0.23/5002363 UDP 8 MiB instruction and Observe v2 helper verified. The user reports worse and longer freezes; the 120 s trace measured 46 decoded gaps >50 ms, longest 3.065 s, and 300 codec flushes, despite 0 app-socket drops throughout the trace. [Failed-trial result](diagnostics/steamlink-hitches/UDP-RESULTS-2026-09-15.md) and [tried ledger](diagnostics/steamlink-hitches/TRIED-EXPERIMENTS.md) supersede the earlier pending-runtime status. No new patch binary or host change was made.
- Whole affected workspace inventory: **158,889 files, 10 repositories, 0 read errors**; reparse paths skipped and recorded. Inventory and Git snapshots remain in `build/live-hitch-20260915/udp-8m-live/cleanup`. Changes to canonical diagnostics documentation and the new offline socket parser belong to this task; preserve all other repository work.
- Retain the unique 512,764,729-byte trace, source socket/host/device logs, installed-verification hash/byte receipt, compact timing/XR/memory reports and reproducible analysis scripts while the transport/FEC recovery cause remains unresolved. Preserve exact original APKs, canonical source/resources and earlier baseline captures. The current MPP remains available for an original-APK rollback selection without UDP; remove the superseded delivery copy once replacement installation is confirmed.
- **Local deletion deferred: 3 files, 46,676,357 bytes; 0 local bytes reclaimed.** Automatic approval review rejected the explicit allowlisted deletion command with only “blocked by policy.” Targets were the temporary `installed.apk` verification pull and reproducible `xr-analysis/cadence-events.json` / `miss-events.json`. No alternative deletion mechanism was attempted. `cleanup/result.json` retains their exact hashes/sizes and the reason. Remove these copies when deletion is permitted; the APK verification is reproducible from a fresh installed-package pull, and `xr-analysis/analyze.py` regenerates the verbose extracts from the retained trace.
- The on-device trace was successfully removed after verified download. All collectors exited; `adb-cleanup.json` verifies **0 ADB processes/listeners at 19:38:35 UTC**. Earlier blocked review-test EXE/PDB cleanup remains unchanged. No APK installation, app/SteamVR restart, or host-setting mutation occurred during this trial.

### Continued recovery/PC investigation and patch proposal, 2026-09-15

- [New proposal](diagnostics/steamlink-hitches/RECOVERY-PATCH-PROPOSAL-2026-09-15.md): default-off, separate FEC duplicate reservation guard for exact 2.0.22/5002322 and 2.0.23/5002363. Compared native lifecycle with 2.0.20/5001712, revalidated the current host DLL, and traced a second legacy-transport candidate. This is a proposal, not an applied or deliverable patch; the failed UDP trial remains failed.
- Validation: 7 offline predicate/boundary checks and 2 actual pristine-native read-only audits pass. Previews modify exactly 4 bytes in memory and are idempotent; original files remain unchanged. No new APK, MPP, native compiler output, device command, host setting or process restart was produced.
- Fresh entire-workspace inventory recorded **159,028 files, 10 repositories, 0 read errors**, with reparse paths skipped. Retain compact maps, disassembly/caller exploration, model receipts, native hashes, APK comparison and trace replay evidence under `build/live-hitch-20260915/recovery-proposal/` while implementation is unresolved. Reproducible inspector caches and broad caller extracts remain with this active analysis until its focused implementation audit is finalized. **0 bytes reclaimed in this proposal phase.** Reproduction scripts and the canonical offline model are recorded in the proposal.
- Prior blocked local deletion targets remain unchanged; no rejected deletion was retried. ADB was not started in this phase. Original APKs, decoded bases, resources and all unrelated repository changes remain protected.

### FEC duplicate reservation guard completion, 2026-09-15

- Created the separate default-off guard for exact 2.0.22/5002322 and 2.0.23/5002363, with current pipeline telemetry compatibility and observations. Existing bundles, exact older adaptations and v1 helper resources remain unchanged. [Experiment/trial record](diagnostics/steamlink-hitches/EXPERIMENT-2026-09-15-fec-duplicate-reservation.md); [125-test/16-APK receipt](diagnostics/steamlink-hitches/fec-duplicate-reservation-validation.json); [native validation](diagnostics/steamlink-hitches/fec-duplicate-reservation-native-validation.json). Headset effectiveness remains pending.
- Entire-workspace cleanup inventory covered **158,992 files, 10 repositories, 0 read errors**, skipping/rejecting reparse paths. Inventory and Git status snapshots remain under `build/fec-duplicate-reservation/workspace-inventory-cleanup`. The only new status entry during cleanup was this task's canonical native validation receipt; no prior tracked changes were removed.
- Removed **27 allowlisted generated targets, 672,446,774 bytes** at 20:15:48 UTC: unsigned audit APKs, compiled classes/resources, staged archive and catalog scratch. All 11 protected files passed unchanged-hash checks. Build-script per-case temporary copies and native test runner cleanup are excluded from this measured total.
- Preserved `patches/build/libs/patches-1.18.0-dev.4-fec-duplicate-reservation-local.mpp`, source payloads, pristine APKs and decoded fixtures, compact receipts/test XML/disassembly, required tools and unresolved diagnostic captures. Regenerate with `Build-FecDuplicateExperiment.ps1 -JavaHome F:/Runtimes/Java21`; its scoped cleanup companion is `Cleanup-FecDuplicateExperiment.ps1`. Native resources regenerate with `extensions/decoder-input-buffering/Build-Native.ps1 -CopyResources`, followed by exact hash-pin update and audits.
- **Deletion deferred by automatic approval review:** `build/fec-duplicate-reservation/native-20260915` (**23 files, 2,297,538 bytes**) and `build/decoder-buffering/fec-telemetry-bridge-agent/bridge-5002322.exe` / `.pdb` (**4,609,536 bytes**). Both deletion commands were rejected with “blocked by policy”; neither executed and neither was retried. Receipts: `native-evidence/cleanup.json` under the FEC build root and `validation.json` under the agent test directory. Remove when deletion is permitted. Earlier blocked targets remain untouched.
- No installation, host setting, driver mutation or device command. Final read-only process/listener check found 0 ADB processes and 0 listeners on port 5037.

### Galaxy XR USB streaming setup completion, 2026-09-16

- Exact installed Steam Link **2.0.23/5002363** successfully continued streaming over USB during a 12 s Wi-Fi-off trial; USB received 188,743,876 bytes while Wi-Fi received 0, and the user confirmed continuous image updates and head tracking. [Live record](diagnostics/steamlink-usb/LIVE-2026-09-16.md) and [native audit](diagnostics/steamlink-usb/NATIVE-5002363.md) preserve evidence and limits. No additional APK/native patch was necessary; long-session stability and cold discovery without Wi-Fi remain untested.
- Added reusable USB-function, exact-child Windows RNDIS driver, and temporary host-address helpers with [setup and rollback instructions](Install/USB-STREAMING.md). PowerShell syntax/offline checks, real driver Preview/Apply, USB Enable/Restore/Enable, address Preview/Apply, and live streaming checks passed. Host-address Restore was not run because the working session remains active. Wi-Fi was restored and independently verified enabled.
- Whole affected workspace inventory covered **150,960 files**, with 0 read errors. Repository statuses were inspected and unrelated dirty work preserved. Retain `build/usb-streaming/workspace-inventory.json` as compact completion evidence.
- Temporary helper-test files totaling **17,706 bytes** were removed earlier. No new APK, MPP, decoded derivative or native compiler output was generated. Native reproduction details are in the audit.
- **Empty-directory cleanup deferred:** automatic approval review rejected the final command containing removal of empty helper-test directories under `build/usb-streaming/script-check` with only “blocked by policy.” The command did not run and no alternate deletion was attempted. These directories contain 0 file bytes; remove when permitted.
- Retain the USB-function restore record, host-address restore record, and original driver information under `build/usb-streaming/`: they belong to the active setup and are required for rollback. Preserve exact input APKs/decoded bases, canonical resources, tools, current diagnostics and all unrelated artifacts. Earlier deferred cleanup remains unchanged; no previously blocked deletion was retried.

### Quest-style USB feasibility follow-up, 2026-09-16

- Clarified that the prior manual RNDIS trial does not fulfill automatic Quest-style setup. [Feasibility decision](diagnostics/steamlink-usb/QUEST-PARITY-2026-09-16.md) records the exact 2.0.23/5002363 app path, connected Samsung firmware, permissions, and bounded NCM trial: function state switched, but no USB network appeared and Tethering reported an IpServer failure. Samsung-specific app-authorized tethering remains a conditional candidate, not an implemented patch.
- The NCM trial automatically and explicitly restored the initial `mtp,adb` state. Steam Link stayed closed; Wi-Fi, Windows configuration, installed APK and firmware were unchanged. Corrected the Status helper's exact package/UID lookup; read-only UID verification, PowerShell parsing and `git diff --check` passed.
- Fresh whole-workspace inventory: **150,961 files, 10 repositories, 0 read errors, 0 Git query errors**. Preserve unrelated dirty work; compact inventory/status snapshot is `build/usb-streaming/quest-parity-inventory.json`.
- Retain only new compact reports and `quest-parity-readonly.json` / `ncm-feasibility-trial.json` as current feasibility evidence. Source/hidden-API downloads were inspected in memory. No APK, decoded derivative, compiler output or payload was generated; **0 bytes reclaimed** in this follow-up. Earlier rollback records and deferred deletion targets remain untouched. No new deletion was attempted.

### Retired hitch experiments removed from source, 2026-09-19

- The user tested **Decoder input buffering (experimental)**, **FEC duplicate reservation guard (experimental)**, and **UDP receive buffer (experimental)** against the Steam Link hitching regression on the newer builds (exact 2.0.22/5002322 / 2.0.23/5002363): **none solved it; the UDP trial made freezes worse and longer.** Per the cleanup rule, the retired experiments were removed from source while the tried/retired record and validation evidence were retained.
- Deleted (13 files): patch sources `patches/src/main/kotlin/app/template/patches/steamlink/binary/DecoderInputBufferingPatch.kt`, `FecDuplicateReservationGuardPatch.kt`, `UdpReceiveBufferPatch.kt`; standalone audit runners `patches/src/main/kotlin/util/DecoderInputBufferingApkAudit.kt`, `FecDuplicateReservationApkAudit.kt`, `UdpReceiveBufferApkAudit.kt`; tests `patches/src/test/kotlin/app/template/patches/steamlink/binary/DecoderInputBufferingPatchTest.kt`, `FecDuplicateReservationGuardPatchTest.kt`, `UdpReceiveBufferPatchTest.kt`; bundled helper payloads `patches/src/main/resources/steamlink/decoder/libgxr_dbuf_5002322.so`, `libgxr_dbuf_5002322_telemetry.so`, `libgxr_dbuf_5002363.so`, `libgxr_dbuf_5002363_telemetry.so`. Also removed the now-unused `apksig` compile-only dependency from `patches/build.gradle.kts` (only the deleted audit runners imported `com.android.apksig`). `gradle/libs.versions.toml` was reverted to its committed state by an external process after the catalog entry was removed; the retained entry is inert (no configuration references `libs.apksig` anymore) and matches the historical CI pin record.
- Retained evidence: all `diagnostics/steamlink-hitches/` records (tried ledger, experiment MDs, validation JSONs, `Build-*-Experiment.ps1` scripts, telemetry and live-trial results) and the dated records above. `PatchCompatibilityMatrixTest` now asserts 7 individual patches for the modern bases (the 14 excluded legacy patches count is unchanged). `PatchListGeneratorTest`/`ConstantsTest` only use the shared `COMPATIBILITIES_STEAM_LINK_EXPERIMENTAL` constant, which remains for future exact-build experiments.
- Catalogs kept in sync: `patches-list.json`, `patches-list-experimental.json`, and `patches-list-all.json` no longer list the three retired patches (26 patches each, matching `patches-list-stable.json`, which never listed them). `TECHNICAL_REFERENCE.md` regenerated from the updated list with the repo's own script (26 patches). `patches-bundle.json` and all recommended bundles are unchanged — they never included the retired patches.
- **Gradle gate status:** the local `gradlew :patches:generatePatchesList -PreleaseChannel=experimental` (build + tests + DEX + catalog) could not run in this environment — GitHub Packages (Morphe plugin `app.morphe.patches:1.3.3`) returns 401 without credentials and the local module cache was empty. Code-level verification instead: no surviving reference to any retired symbol in `patches/src` (grep-verified across patch names, helper functions, and resource names), and all remaining patches, bundles, audits, and tests are untouched. Re-run the Gradle build with a valid `GITHUB_TOKEN`/`gpr.key` before release to confirm compilation, tests, DEX packaging, and catalog regeneration.

### Original workspace cleanup verification record

Cleanup verification checks path containment/reparse points, an explicit allowlist, preserved files and input dependencies, Git changes, and ignore rules. No APK installation, ADB command, headset test, SteamVR mutation, driver deployment, or GitHub publication is part of this cleanup.

Results: all 59 targets absent; 0 missing or altered retained files (with archived manifests accounted for); 0 unexpected tracked deletions; Tools and CustomHeadsetOpenVrGxR Git status unchanged. The original Virtual Desktop APK hash still matches. All protected infrastructure directories remain. `git diff --check`, ignore-rule probes, and PowerShell syntax checks passed. The A/B input exists with the generator's pinned native-library hash, and its output directory is absent as required. Independent cavecrew review found no remaining issues. Full Gradle compilation/APK regeneration was not run for this cleanup.
### Separate foveal blue-noise validation cleanup, 2026-09-22

- The separate default-off experiment supports exact **2.0.20/5001712**,
  **2.0.22/5002244**, **2.0.23/5002363**. Existing OLED/VD-like behavior is preserved;
  descriptions were corrected after the independent Virtual Desktop comparison.
- Retain canonical `patches/src/main/cpp/blue_noise/` source, original tile/header and
  tests; `patches/src/main/resources/steamlink/blue-noise/libgxd.so`; current catalogs;
  and compact `diagnostics/steamlink-blue-noise-ditering/` receipts. Release CI does not
  rebuild the required native resource. Reproduction commands are in that folder's README.
- Passed: 109 Kotlin/JUnit tests, 13 native mock-GL/EGL groups, 3 decoded-base audits,
  12 Morphe fixture packaging cases, local bundle/D8/catalogs and bounded syntax checks.
  `diagnostics/steamlink-blue-noise-ditering/VALIDATION.md` records the strict stock-GLSL
  dialect, reconstruction, Gradle-plugin and runtime limitations.
- **Cleanup deferred by automatic approval review:** both containment-checked recursive
  removal and inspected non-recursive file/empty-directory removal were rejected with
  the reason **blocked by policy**. Neither deletion command ran. **0 bytes reclaimed;
  5,838 temporary files / 4,191,411,166 bytes remain** across 11 task-created build
  directories and 12 superseded raw fixture receipts. `morphe-validation.json` is the
  current authoritative fixture receipt; older `morphe-500*.txt` receipts await removal.
- Explicit targets, sizes, root inventory and nested repository inventory are in
  `diagnostics/steamlink-blue-noise-ditering/cleanup.json`. Individual file paths and
  inspected metadata are in `build/blue-noise-cleanup-manifest.json`. No reparse points
  were found. Complete cleanup only against this reviewed list when tool execution is
  allowed or the user removes it; do not infer additional targets or delete root `build/`.
- All 10 protected file hashes/sizes remain unchanged: exact native inputs, fixture APKs,
  VD assembly store, canonical helper/tile, and the retained official compiler
  `build/tooling/bin/glslang.exe` needed for reproducible syntax checks. SDKs, cached tools,
  unrelated captures and all other build children remain untouched.

### 2026-09-22 — Installed VD Streamer HEVC10/AV110 follow-up

- Read-only audit of Windows Streamer **1.34.22.0**, compared with the earlier
  Android **1.34.18.0/10683** and 3 exact Steam Link bases. No additional production
  patch or installed application change; no runtime banding result claimed.
- Retained compact source hashes, selected IL/native disassembly and reproduction
  scripts in `diagnostics/steamlink-vd-streamer/`. The 76 shader disassemblies in
  `build/vd-streamer-shaders/` total **260,760 bytes** and remain active evidence for
  the reports; regenerate with its `disassemble_shaders.py` against the pinned
  installation. No copied DLL/APK, decoded derivative or compiler output created.
- Removed **0 bytes**. Earlier deferred validation-output cleanup remains deferred
  for the recorded automatic-review block; no alternate deletion route attempted.
  All 50 protected blue-noise files and all 7 installed audit inputs rechecked
  unchanged in `preservation-validation.json`.

### 2026-09-22 — Existing VD-like OLED options revised after HEVC10 PCVR trace

- Retained evidence: `diagnostics/steamlink-vd-hevc10/` records the supplied VD
  1.34.18.0/10683 path, installed SteamVR 2.17.10 beta/build 25330290 shader override
  gate, exact Steam Link 2.0.20/5001712, 2.0.22/5002244 and 2.0.23/5002363 native
  guards, 115 passing tests, 6 successful Morphe fixture cases, D8/catalog checks,
  shader syntax limitations and unchanged blue-noise hashes.
- The existing 2 OLED options now bypass added gamma/saturation/noise only in the
  masked foveal program, retain Valve decoder correction/fade/alpha and sRGB8 output,
  and use identical processing for either declared input depth. No runtime banding
  fix, pristine APK installation, or exact VD encoder/import reproduction is claimed.
- **Cleanup deferred:** the earlier automatic approval review rejected recursive and
  individually inspected deletion with **blocked by policy**. No alternate deletion
  route was attempted. New temporary outputs total **1,173,911,723 bytes / 1,072 files**
  in `build/vd-sdr-kotlin`, `vd-sdr-morphe`, `vd-sdr-glsl`, `vd-sdr-glsl-check`,
  `vd-sdr-package`, `vd-sdr-blue-regression`, and `vd-sdr-fovea-helper-test-investigator`.
  The exact directory inventory is in `diagnostics/steamlink-vd-hevc10/cleanup.json`;
  0 bytes reclaimed. These targets are separate from the prior blue-noise allowlist.
- Preserve all 50 blue-noise source/resource/test/diagnostic files unchanged, all
  exact decoded bases/fixture APKs, VD source/extracted audit evidence, SDKs, cached
  compilers, GLSL/R8 tools, and unrelated build children. Reproduction commands are
  in the new diagnostic README. Remove only the listed generated outputs once
  deletion is permitted, after preserving the compact receipts.

### 2026-09-25 — Separate background blue-noise counterpart

- Added a separately selectable background-only blue-noise patch alongside the
  existing foveal-only patch for exact 2.0.20/5001712, 2.0.22/5002244 and
  2.0.23/5002363. Both support declared 8-/10-bit input with 8-bit sRGB output.
  The shared helper was extended; the original quantizer/tile and VD-like OLED
  options are unchanged. The earlier 50-file preservation requirement describes
  the prior VD investigation, not this explicitly requested blue-noise extension.
- Retained compact evidence and reproduction scripts in
  `diagnostics/steamlink-background-blue-noise/`: 119 Kotlin tests, 16 native
  double-based tests, 3 exact decoded audits, 13 Morphe fixture cases, diagnostic
  GLSL and Release/API26 D8 checks passed. Normal Gradle remains blocked by
  unresolved `app.morphe.patches:1.3.3`. No pristine APK, deployment or runtime
  visual-quality result is claimed; 5001712 remains an analysis reconstruction.
- Removed and verified **3,842 files / 2,281,534,590 bytes** from 11 explicit targets:
  `build/background-blue-noise-{glsl,kotlin,morphe,native}`, the 2 task-specific
  Zig caches, staging `dex.zip` and 4 staging catalogs. Resolved containment,
  ancestor/descendant reparse checks and unchanged inventories passed before
  native PowerShell removal. Exact paths and workspace/nested repository inventory
  are in `diagnostics/steamlink-background-blue-noise/cleanup.json`.
- Retained the current local validation MPP at
  `build/background-blue-noise-package/patches/build/libs/patches-1.18.0-background-blue-noise-local.mpp`,
  canonical source/payloads, exact decoded inputs/fixture APKs, SDKs, compilers and
  tool dependencies. The pre-existing native test build and all earlier deferred
  cleanup targets were outside this new allowlist and remain untouched by cleanup.
  Inventory could not read unrelated `build/collector-safety-g4f21yh4`; it was
  excluded and left untouched. No blanket build-tree removal was performed.
- Regeneration commands are in the new diagnostic README. The retained local MPP
  is a delivery artifact, not a published Gradle release or signed application.
