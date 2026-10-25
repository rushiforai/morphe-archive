# XR Porting Hub — Galaxy XR Morphe patch guidance

The parent workspace `AGENTS.md` also applies. These rules are mandatory for every change under this repository.

This repository patches several Android apps for the Samsung Galaxy XR (SM-I610) headset with [Morphe](https://morphe.software). It is not a single-app patch set: every app keeps its own package name, exact-base registry, patch sources, resource payloads, extension DEX and compatibility lists.

## Supported apps

| App | Package | Exact verified bases (versionName/versionCode) | Kotlin patches | Resources | Extension task → payload |
|---|---|---|---|---|---|
| Steam Link VR | `com.valvesoftware.steamlinkvr` | 2.0.20/5001712, 2.0.20/5001812, 2.0.21/5001968, 2.0.22/5002244, 2.0.23/5002363, 2.0.24/5002395 | `patches/src/main/kotlin/app/template/patches/steamlink/` | `patches/src/main/resources/steamlink/` plus the pre-built layer payloads `patches/src/main/resources/extensions/` (`controller-grip-haptics.mpe`, `controller-hal-pose.mpe`, `shizuku-bridge.mpe`) | `assembleExtension` → `extension.mpe`; also `assembleMinimalExtension`, `assembleBatteryExtension` |
| 4XVR | `cn.vr4p.oculus4xvrplayerov` | 2.0.22/20022 | `patches/src/main/kotlin/app/template/patches/fourxvr/` | `patches/src/main/resources/fourxvr/` | `assembleFourXvrExtension` → `fourxvr-extension.mpe` |

- Per-app compatibility registries live in `shared/Constants.kt` (`COMPATIBILITIES_STEAM_LINK*`, `COMPATIBILITIES_FOUR_XVR`); `shared/PatchCategories.kt` categories are app-neutral and shared.
- `patches/build.gradle.kts` assembles every app's extension payload and includes it in the patches JAR. A new app adds its own task, output directory and `processResources`/`sourcesJar` dependency; it does not rewire an existing app's task.
- App analysis and validation records: `diagnostics/steamlink-*/` for Steam Link, `diagnostics/4xvr-galaxyxr/` for 4XVR. Read the app's record before touching its offsets, layouts or payloads.

## Multi-app and multi-version compatibility

- Preserve every verified adaptation. Adding a new app or a new base must extend compatibility and guarded layouts; it must not replace or broaden an older app's or base's adaptation implicitly.
- Model a verified base as the exact pair `(versionName, versionCode)` of its own package. Never assume the version name from the build code, and never carry a base, offset or layout across packages.
- Use the primary `AppTarget` constructor so the description is retained:

```kotlin
AppTarget(
    version = versionName,
    versionCodes = SupportedAbi.entries.associateWith { versionCode },
    description = description,
)
```

- A `Compatibility` may contain several `AppTarget`s when their `version` strings differ. Morphe rejects duplicate version strings inside one `Compatibility`, so builds that share a version name must remain separate `Compatibility` objects and be passed together with `compatibleWith(*items.toTypedArray())`.
- `versionCodes = null` means every build code for that version. Use it only when every such build is intentionally supported. Use an explicit experimental target for warning-only unknown-version work; exact compatibility does not weaken patch preconditions.
- `Patch.default` is one global flag per patch object. Recommended defaults live on the individual patches: each recommended patch sets `default = true` and declares only the exact bases where it is recommended, so Morphe Manager auto-selects the recommended set per detected `versionName` and `versionCode` in both Simple and Expert mode. Prefer a single patch whose guarded body selects the per-build behavior; declare one patch object per exact-build scope with distinct names only when a single global `default` flag cannot honestly describe the scopes. Do not duplicate a shared patch name to express per-build defaults.
- Morphe executes dependencies recursively without re-checking their compatibility. Every build-specific dependency or mutation body must independently return unchanged on excluded builds before reading or writing target files. An app-specific patch must also be inert on every other app's package.
- Prefer one patch object per feature with a build-aware body and a per-build layout table. Do not create a second patch object for the same feature on another base. The only valid duplication is a separate object whose global `default` flag must differ (for example a recommended legacy patch and an optional native patch); name the reason in the source.
- Every public patch description follows one short plain-words sentence plus `Builds: <exact codes>.` generated from the same compatibility list passed to `compatibleWith`, then `Needs:` only when a real requirement exists. The `assertPatchDescriptionContract` test helper enforces this mapping and the sentence length. When adding a base, update the registry, per-build tables, tests, catalogs and the generated build line together.

## App isolation

- A patch declares `compatibleWith` only its own app's `Compatibility` objects. Never widen a patch onto a second package to reuse it; write that app's patch separately.
- Shared helpers must not write across apps: a helper takes the target app's layout or package as a parameter instead of assuming one app. The per-app registries in `shared/Constants.kt` and the shared categories in `shared/PatchCategories.kt` are shared on purpose; the audits under `util/` stay bound to the app they audit (most are Steam Link-only). Per-app DexKit/hook helpers stay in that app's package.
- Extension payloads stay per app: an app's `extendWith` merge must not reference another app's `.mpe`, helper classes or resource paths.
- Adding an app must not change another app's catalogs, bundles, defaults, tests or native payloads. A new app's experiments stay isolated until that app demonstrates the same contract: guarded layouts, idempotent reapplication, option transitions and mandatory portable tests.
- App-specific naming stays in the app's own sources, descriptions and diagnostics. Repository-wide text (this file, the skills, Copilot instructions, release metadata) describes all supported apps; the user-visible `patches { about { ... } }` block in `patches/build.gradle.kts` now names the hub and both apps.

## Base adaptation safety

- A request to "make compatible" means implementing and verifying the actual mutation and reachable code path for every requested exact base of that app, not merely adding compatibility labels. Inspect that base's decoded APK before choosing offsets, methods, dex targets or shader targets; never transplant a neighboring build's offsets without evidence.
- Exercise the production patch helpers against the actual decoded artifacts for every newly supported option: native libraries, decoded DEX classes/methods, manifest and asset payloads for every app (Steam Link VR and 4XVR both edit native libraries). Verify all intended sites change, no unrelated bytes change, shader/class boundaries and interfaces survive, reapplication is idempotent, and supported option transitions work. Synthetic fixtures supplement this evidence; they do not replace it. Trace native callers/references to establish that the edited shader and format fields belong to the active rendering path.
- Record per-base metadata, hashes, offsets, code-path evidence, checks performed, and remaining runtime gaps. Distinguish byte/code-path compatibility from runtime acceptance of an experimental format and from physical panel precision. If a requested base is unavailable or reconstructed, state the limitation explicitly.

- Pin layouts by exact file size, SHA-256 where available, symbol- or dex-derived targets, and original/already-patched byte preconditions. Unknown layouts must fail closed or remain unchanged; never infer targets from a neighboring build.
- Validate all edits atomically and idempotently. Do not use global replacement counts when a supported binary can contain a legitimate duplicate.
- Compare manifests, DEX classes/methods, config assets, renderer topology, and native symbols before declaring a patch compatible. Build-specific experiments stay isolated unless the new base demonstrates the same contract.
- Keep generated catalogs and tests synchronized with source compatibility for every app. Report Gradle/static validation separately from actual Morphe APK patching, installation, ADB, headset and on-device runtime proof (for Steam Link VR that includes SteamVR streaming checks).
- Analysis reconstructions and malformed/hybrid APK extractions are evidence sources, not installable or byte-for-byte pristine APKs. Do not claim an end-to-end patching result without a pristine source APK.

## CI test inputs

- `:patches:test` does not run in CI. Run it locally at the end of every task in this repository and report the executed/skipped counts (`./gradlew :patches:test`; on Windows `.\gradlew.bat :patches:test`, add `--offline` when dependencies are cached). The manual `Release` dispatch input `run_tests` exists for explicit CI-side test evidence.
- Check every new test input with `git ls-files` and workflow provisioning; ignored decoded APKs, local captures and compiler caches are not available on GitHub by default.
- Keep compatibility metadata, tracked payload validation and malformed-input rejection checks portable and mandatory for every app. Real decoded-byte audits may use an explicit JUnit assumption only when their retained exact input is absent; present but invalid bytes must still fail. Synthetic rejection fixtures do not establish compatibility for any app.
- Untracked decoded trees at the repository root (for example the Steam Link `decoded-apk-*` bases and the 4XVR `4xvr-orig/` and `4XVR-GalaxyXR/` trees) are local evidence only. New app tests must pass on a fresh checkout without them.
- Byte-hashed text payloads must declare a deterministic checkout encoding/line ending in `.gitattributes` (for the foveal canvas manifest: UTF-8 with LF). Validate the actual resource bytes after checkout; do not change the expected hash to accept Windows CRLF conversion or weaken production validation.
- Verify new fixture-dependent tests both with retained real inputs and from an isolated working directory without those inputs. Report executed and skipped counts separately; a skipped audit is not compatibility proof.
- Follow `.opencode\skills\morphe-patches\SKILL.md` for the fresh-checkout check. Cached local compilation does not establish that GitHub CI passed; confirm the workflow for the corrected commit before claiming CI success.

## Build dependency and release gates

- Declare libraries imported by tests in `testImplementation` (or the appropriate test configuration). Production `compileOnly` dependencies do not populate the test compile/runtime classpaths. Keep generator-only and test-only libraries out of the shipped patch bundle.
- The release workflow builds the Gradle graph exactly once. The graph ends at `:patches:buildAndroid` and `:patches:generatePatchesList` (`patches/build.gradle.kts`); tests are never part of it. `gradle-semantic-release-plugin` bumps `gradle.properties`, `@semantic-release/exec` then runs `./gradlew clean generatePatchesList -PreleaseChannel=...` before any git tag exists, and a push that publishes no release runs `./gradlew :patches:buildAndroid :patches:generatePatchesList -PreleaseChannel=... clean` as its gate. For dependency, plugin, generator or test changes, validate that same graph plus `:patches:test` in an isolated checkout locally and report both results; every app's extension assembly task stays in that graph.
- A desktop fat JAR or hand-built compiler classpath can supply undeclared dependencies. Such fallback checks are diagnostic evidence only, even when every test passes; they do not validate Gradle dependency scopes, the pinned compiler or the release build. If Gradle is blocked locally, state the blocker and verify the corrected commit in GitHub Actions before reporting the workflow fixed.
- Investigate the exact failed commit, run, job and first failed task before editing. Retain a compact failure receipt and check both test compilation and Android packaging; a production compile or documentation pass alone is insufficient. Do not rerun an old commit to validate new changes, skip or weaken the local `:patches:test` run, or widen production dependencies to hide missing test declarations.
- Attestation must use the canonical absolute path of the exact released version,
  resolved by `.github/scripts/resolve_release_artifact.cjs`. `actions/attest`
  rejects `..` segments even in absolute patterns. Release preparation must clean
  only external Gradle output before rebuilding so preflight bundles are not
  uploaded as assets of a newer release. Run the release path regression check.
- Local GitHub Packages access uses a classic token with `read:packages`, kept
  in user Gradle properties outside the repository. Use
  `tools/Configure-GitHubPackages.ps1`; never request tokens in chat or commit them.

## Local artifact lifecycle

- All build output and project-local Gradle/Kotlin caches belong under
  `../builds/steamlink-patches/`, outside this repository. Gradle uses
  `gradle/root` and `gradle/patches`; retained fixtures/tools/evidence use `build/`.
  Keep `clean` confined to Gradle output, independently of retained inputs.
  Native CMake output belongs under `extensions/<name>/build-*` in that external root.
  Update scripts, release asset consumers, and current reproduction commands together.
  This includes new experiments, temporary checkouts, diagnostic logs, compiler
  scratch and Zig/Python caches. Pass this requirement to every delegated agent;
  build-related skills and agent presets must follow it. On the Hermes host, Cavecrew children are spawned via `delegate_task` with the role contracts from `.agents/skills/cavecrew/references/hermes-roles.md` pasted into each child's `context`; the main thread runs all checks and owns verification claims. OpenCode uses `.opencode/skills/` and `.opencode/agents/`; Cursor uses `.cursor/rules/project.mdc`; Codex keeps `.codex/agents/*.toml` when present. On this workspace the
  absolute root is `D:/Angelo/Desktop/SteamLink-GalaxyXR-Windows-Toolkit-FULL/builds/steamlink-patches`.
  Invoke repository Python helpers with `python -B` or configure an external
  `sys.pycache_prefix`; do not leave `__pycache__` directories in source folders.

- Apply the parent workspace's required cleanup rule whenever an experiment ends or a patch is finalized/applied. Keep a dated tried/retired record and validation evidence, then delete obsolete experiment APKs, bundles, decoded derivatives, compiler output, and stale source/resource copies.
- Canonical patch code and payloads are under `patches/src/main` for every app; do not create or use `patches/bin` as another source tree. Keep generated CMake build trees out of Git.
- GitHub release workflows build Morphe bundles and catalogs; they do not currently regenerate the native `.so` payloads. Preserve source resource binaries, tracked release catalogs/docs, exact decoded bases, fixture APKs, and tools required by local audit scripts.
- External `../builds/steamlink-patches/build/` mixes disposable output with required `decoded-fixture-apks`, tool dependencies, and unique diagnostic evidence. Classify children individually; retain current captures and compact historical reports. Never delete it wholesale. Older records refer to its former repository-root `build/` path; see the 2026-10-08 relocation map.
- See `WORKSPACE_CLEANUP.md` for audited ownership, recovery commands, retained exceptions, and the dated cleanup record.

## Retired hitch experiments — Steam Link only, tested, did not work, removed from source (2026-09-19; Uber rescan 2026-10-11)

The standalone experiments below targeted exact Steam Link **2.0.22/5002322** and **2.0.23/5002363** to fix the streaming hitching / whole-view-freeze regression. The user tested them on the headset and **they did not solve the problem**. The three below were removed from `patches/src/main` on 2026-09-19 (patch code, tests, standalone audit runners, and the bundled `libgxr_dbuf*` helper payloads); **Uber link rescan disable** was built and tested on exact **2.0.23/5002363** on 2026-10-11 (also ineffective) and removed the same day. The committed catalogs no longer list any of them. **Do not re-add, re-import, or re-derive any of them — including partial variants such as telemetry-only mode, the duplicate check alone, or the rescan sites individually — when trying to solve this problem.**

| Retired patch name | What it exactly did | Headset outcome |
|---|---|---|
| `Decoder input buffering (experimental)` | Rewrote the scene ELF `DT_NEEDED` entry `libmediandk.so` → `libgxr_dbuf.so` (file offset `0x69656` @5002322 / `0x69925` @5002363) and installed a bundled `lib/arm64-v8a/libgxr_dbuf.so` decoder-input helper (per-build payloads, plain and telemetry variants) hooked through guarded vtable/GOT pointers. **Buffered** staged incomplete compressed frames in bounded memory (24 lazy 4 MiB allocations per codec, 96 MiB cap) before synchronous codec submission; **Observe** only counted on the stock input path. No executable instructions, shaders, output images, or OpenXR layers changed. | Tested on 2.0.23/5002363: whole-view freezes persisted. Not a fix. |
| `FEC duplicate reservation guard (experimental)` | NOP'd the verified duplicate-check bypass in `libvrlink_scene.so` (4 instruction bytes at `0x167094` / `0x167f60`, full-function identity and executable-mapping guarded) so the existing accepted/submitted-frame duplicate checks run before packet-driven decoder input acquisition, including after a stream reset. | Tested: did not resolve the hitching problem. |
| `UDP receive buffer (experimental)` | Raised the active VR UDP receive socket buffer request from 1 MiB to 8 MiB in `libvrlink_scene.so` (instruction `08 02 a0 52` → `08 10 a0 52` at `0x1745a8` @5002322 / `0x1757a8` @5002363; actual byte difference at offset +1). | Live trial on 2.0.23/5002363 failed: freezes worse and longer — decoded gaps >50 ms 12→46, longest 1.804→3.065 s, codec flushes 10→300, host resets 29→133 per 180 s, with 0 app-socket drops. |
| `Uber link rescan disable (experimental)` | NOP'd the two post-startup `ScanForLinkChanges` call sites of the `SVLDataLinkUber` transport in `libvrlink_scene.so` (4 bytes each at `0x174c74`, hidden NETLINK thread, and `0x16fdf8`, 2.000001 s `Uber::Tick` fallback; window/region/build-id guarded). Initial link creation and the periodic address-list send unchanged. | Tested on 2.0.23/5002363: hitches unchanged. Not a fix. |

Evidence, exact byte/function guards, and the tried ledger remain under `diagnostics/steamlink-hitches/` (`TRIED-EXPERIMENTS.md`, experiment records, validation receipts). Any future attempt at this regression must target a different mechanism with new evidence and must read `diagnostics/steamlink-hitches/TRIED-EXPERIMENTS.md` first. This retirement covers Steam Link only; it neither blocks nor authorizes equivalent work for another app.

## 4XVR status (2026-10-11)

- The 4XVR adaptation targets exact base `cn.vr4p.oculus4xvrplayerov` 2.0.22/20022 only. The decoded stock and reference trees (`4xvr-orig/`, `4XVR-GalaxyXR/`) and the distributed reference APK are untracked local evidence.
- The [diff and patch plan](diagnostics/4xvr-galaxyxr/2026-10-11-4xvr-galaxyxr-diff-and-plan.md) records the cross-build evidence, the per-group patch plan and the carried unknowns. It is static-only evidence: nothing has been executed on a headset.
- Open items gating a release claim: the pristine stock 2.0.22/20022 source APK is now recovered — Morphe Manager's original copy (`app_original-apks/`, byte-identical to `/sdcard/Download/4xvr.apk`), 390,601,516 B, sha256 `24b83ab584675e02570e5318a35c7fa9b8da7eabb1f0763711c74c1bad3a84a8`, pulled together with the currently installed patched build (`c596a54643f8af09633b93db7b83488414ca2c1704a2c2550846a805dbf75b7f`) to `../builds/steamlink-patches/build/4xvr-2.0.22/`; end-to-end patch application against it still has to be re-run and recorded. The reference build's modified `libplacebo.so` (LGPL-2.1-or-later) has no corresponding source. The bundled `fourxvr/licenses/NOTICE.txt` asserts that the source ships as `libplacebo-source.zip`, but no such archive exists in the reference APK or the workspace: treat that line as the reference build's unverified claim, not as compliance. As of 2026-10-11 the owner recommends the full 4XVR set by default for on-device iteration; no release note may claim runtime-verified 4XVR support until headset validation is recorded.
- First on-device run (2026-10-11, Galaxy XR `R3GYB09JA5E`): the launch set loads and the XR session runs, but clicking a video froze playback — the HDR hook's `MyVideoRunnable.run()` edit failed ART verification (`VerifyError ... register v2 has type Conflict`). Repaired in `HdrPipelinePatches.kt`; device re-test pending. Evidence: [video-freeze fix record](diagnostics/4xvr-galaxyxr/2026-10-11-4xvr-video-freeze-verifyerror-fix.md).
- Launch hang root cause found and fixed (2026-10-12, same device). The 15:54 re-patch (`8d75cedd…`) hung on splash: the engine blocks in `libvr4p-oculus.so` `pthread_cond_wait` inside `NativeActivity.onStartNative` and never reaches its first presented frame, although the OpenXR session is created (`SessionStateChanged to 1` in every run). A/B against the 10-11 build (`c596a546…`): all APK entries byte-identical except `libovrplatformloader.so` (stock, 0/11 stubs vs stubbed, 11/11) and the `Vr4pMediaPlayer$MyVideoRunnable.run` hook code item (10-11 = pre-fix placement, today = the repaired one) — only the stubs can affect launch, since the video path is not entered before the UI is up. `Meta platform decoupling (4XVR)` is therefore launch-critical for the exact base: it is now `default = true` and no longer marked experimental. Evidence: [launch-hang record](diagnostics/4xvr-galaxyxr/2026-10-12-4xvr-launch-hang-platform-decoupling.md). Playback re-test of the HDR hook and the premium-unlock behaviour remain unverified.

- Premium requirement removed (2026-10-12, owner correction): the ask is an outright unlock, not a
  purchase check - Android XR has no path to the Meta store, so verification cannot work. The
  earlier `Meta Premium restore (4XVR, experimental)` (the reference build's MetaPremium verifier
  port, never released) is superseded. `Premium unlock (4XVR, experimental)` ships instead - default
  off; one helper class in `fourxvr-extension.mpe` forcing the app's own VIP state at every start
  (`ChangeCurVIPStateClear(true)`, the state transition a store purchase applies - `IsMP()` true,
  trial playback limiter off), plus the same seven typed-dexlib2 hook sites (four checkout retargets
  re-assert the unlock, three additive inserts). `FourXvrPayloadResourceTest` requires the new
  helper source. The unlock patch also passed a host-side Morphe apply-audit against the exact
  stock APK (2026-10-12) with the packaged dex verified hook-by-hook (receipt:
  `../builds/steamlink-patches/build/4xvr-premium-20261012/morphe-audit-premium/run-3-verification.md`).
  Headset validation (VIP state at start and across restart, playback past the trial
  boundary) is pending. Plan, decode evidence and rework record:
  [premium unlock record](diagnostics/4xvr-galaxyxr/2026-10-12-4xvr-premium-restore-plan.md).

- Reference-vs-Morphe parity audit and fixes (2026-10-12): a three-way diff of the reference build
  against the dev.20 Morphe output (`4XVR_Video_Player-Patched/`) found five behavioural gaps the
  patch set still had vs the reference - the dead `RenderDispatch.drain()` call in
  `Main4XActivity.RenderFrame` (the `:cond_0` branch skipped it), the skippable
  `SubtitlePositionControls.attach()` on the `:cond_a` path of `V4SubtitlesUI`, the missing
  `SubtitleStyleListener` instantiation in `Main4XActivity` (making the shipped `refresh()` call a
  no-op), the missing `GxrAudioOutput.bind()` hook in `Vr4pMediaPlayer.access$7702`, and
  `routeResumeSurface` sitting outside the stock try (no codec recovery on a routing failure).
  All five are fixed in `RenderDispatchPatches.kt` / `SubtitleSuitePatches.kt` /
  `AudioBridgePatches.kt` / `HdrPipelinePatches.kt` (branch-join label rebuilds plus `addCatch`
  try coverage). Host-side Morphe apply-audit PASS on the retained stock APK with the packaged dex
  verified hook-by-hook (`util.FourXvrParityMorpheAudit`; receipt:
  `../builds/steamlink-patches/build/4xvr-parity-20261012/morphe-audit-parity/run/`) and
  `:patches:test` 173/0/13. Known toolchain artifact: the dev.20 Manager-side build loses two
  string resource names per locale (ids `0x7f0f0149`/`0x7f0f0193`; values and IDs intact, desktop
  output checked with `aapt2`). Headset validation pending; a commit + push publishes the next
  `-dev` release for Morphe Manager. Record and open items:
  [parity fixes record](diagnostics/4xvr-galaxyxr/2026-10-12-ref-vs-morphe-parity-fixes.md).

## Official Morphe references

- Multi-version `AppTarget` example: https://github.com/MorpheApp/morphe-patcher/blob/v1.9.0-dev.1/docs/2_2_patch_anatomy.md#L12-L37
- `AppTarget` and `versionCodes`: https://github.com/MorpheApp/morphe-patcher/blob/v1.9.0-dev.1/src/main/kotlin/app/morphe/patcher/patch/Compatibility.kt#L55-L101
- Duplicate-version validation and compatibility helpers: https://github.com/MorpheApp/morphe-patcher/blob/v1.9.0-dev.1/src/main/kotlin/app/morphe/patcher/patch/Compatibility.kt#L299-L359
- `compatibleWith` behavior: https://github.com/MorpheApp/morphe-patcher/blob/v1.9.0-dev.1/src/main/kotlin/app/morphe/patcher/patch/Patch.kt#L480-L523
- Global patch metadata: https://github.com/MorpheApp/morphe-patcher/blob/v1.9.0-dev.1/src/main/kotlin/app/morphe/patcher/patch/Patch.kt#L27-L51
- Recursive dependency execution: https://github.com/MorpheApp/morphe-patcher/blob/v1.9.0-dev.1/src/main/kotlin/app/morphe/patcher/Patcher.kt#L71-L103
