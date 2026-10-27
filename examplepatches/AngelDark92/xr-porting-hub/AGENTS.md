# XR Porting Hub - agent contract

The parent workspace `AGENTS.md` also applies. This file owns the repository rules.
Read it, then the matching skill. Host adapters point here and must not keep their
own app registry or compatibility table.

This repository patches Android apps for the Samsung Galaxy XR (SM-I610) with
Morphe. Every app keeps its own package, exact bases, sources, resources,
extension payload and compatibility list.

## Apps

| App | Package | Exact bases (versionName/versionCode) | Kotlin | Resources | Extension |
|---|---|---|---|---|---|
| Steam Link VR | `com.valvesoftware.steamlinkvr` | 2.0.20/5001712, 2.0.20/5001812, 2.0.21/5001968, 2.0.22/5002244, 2.0.23/5002363, 2.0.24/5002395 | `patches/src/main/kotlin/app/template/patches/steamlink/` | `patches/src/main/resources/steamlink/` plus `patches/src/main/resources/extensions/` | `assembleExtension` -> `extension.mpe`; also `assembleMinimalExtension`, `assembleBatteryExtension` |
| 4XVR | `cn.vr4p.oculus4xvrplayerov` | 2.0.22/20022 | `patches/src/main/kotlin/app/template/patches/fourxvr/` | `patches/src/main/resources/fourxvr/` | `assembleFourXvrExtension` -> `fourxvr-extension.mpe` |

Per-app registries are in `shared/Constants.kt`; categories are shared in
`shared/PatchCategories.kt`. A verified base is the exact pair for its own
package. Never infer it from the version name, a neighboring build or another app.

## Rules

1. **App isolation.** A patch declares `compatibleWith` only its own app's
   `Compatibility`. Never widen a patch onto another package. Shared helpers take
   the target app's layout or package as a parameter. `extendWith` never references
   another app's `.mpe`, classes or resource paths. Adding an app must not change
   another app's catalogs, bundles, defaults, tests or native payloads. App-specific
   naming stays in that app's sources, descriptions and diagnostics; repository-wide
   text describes all apps. A new app's experiments stay isolated until it
   demonstrates guarded layouts, idempotent reapplication, option transitions and
   portable tests.
2. **Add, never widen.** Preserve every verified adaptation. Add a base or app
   with its own guarded layouts; do not replace or broaden an older one.
   For every new or changed Steam Link patch, implement and validate exact base
   `2.0.24/5002395` alongside the existing supported bases unless the user
   explicitly excludes it. Compatibility metadata alone is not implementation.
   If exact-base evidence is missing, report the blocker instead of silently
   omitting this base or borrowing another build's offsets. Retired experiments
   remain retired under rule 13.
3. **Compatibility shape.** Use the primary `AppTarget` constructor so the
   `description` is retained. Builds that share a version name but differ by code
   stay in separate `Compatibility` objects and are passed together with
   `compatibleWith(*items.toTypedArray())`; Morphe rejects duplicate version
   strings inside one object. `versionCodes = null` only when every code for that
   version is intentionally supported.
4. **Defaults.** `Patch.default` is one global flag. Recommended patches set
   `default = true` and declare only the exact bases where they are recommended.
   Prefer one patch object per feature with a per-build table. Duplicate an object
   only when the global default scope genuinely differs, and say why in a source
   comment. Never duplicate a shared patch name to express per-build defaults.
5. **Dependencies.** Morphe runs dependencies recursively without re-checking
   compatibility. Every dependency and mutation body must return unchanged on
   excluded builds and packages before reading or writing. An app patch must also
   be inert on every other app's package.
6. **Descriptions.** One short plain-words sentence plus `Builds: <exact codes>.`,
   then `Needs:` only when a real requirement exists. Generate the build line with
   `buildLabel(...)` from `shared/PatchBuilds.kt` using the same list passed to
   `compatibleWith`. `assertPatchDescriptionContract` enforces the mapping and
   sentence length. Adding a base updates the registry, per-build tables, tests,
   catalogs and generated build line together.
7. **Base adaptation is a real mutation.** "Make compatible" means implement and
   verify the actual edit for every requested exact base. Inspect that base's
   decoded APK before choosing offsets, methods, dex or shader targets; never
   transplant a neighboring build's layout without evidence. Exercise the
   production helpers on that artifact: native libraries, decoded DEX, manifest
   and assets. Verify all intended sites change, no unrelated bytes change,
   boundaries and interfaces survive, reapplication is idempotent, and option
   transitions work. Trace native callers and references to prove the edited path
   is active. Compare manifests, DEX classes/methods, config assets, renderer
   topology and native symbols before declaring compatibility. Record metadata,
   hashes, offsets, code-path evidence and remaining runtime gaps.
8. **Fail closed and pin.** Pin layouts by exact size, SHA-256 where available,
   symbol- or dex-derived targets, and original/already-patched byte
   preconditions. Unknown layouts fail closed or stay unchanged. Never use global
   replacement counts when a supported binary can contain a legitimate duplicate.
   Validate edits atomically and idempotently.
9. **Evidence classes.** Report source/static inspection, fixtures/unit tests,
   compilation/packaging, CI and fresh headset/runtime proof separately. A static
   or synthetic pass is not runtime proof. Reconstructed or hybrid APKs are
   evidence, not installable pristine bases. Do not claim end-to-end patching
   without a pristine source APK.
10. **Tests and CI inputs.** `:patches:test` does not run in CI. Run it locally at
    the end of every task and report executed/skipped counts. Declare test-only
    libraries in `testImplementation`; production `compileOnly` dependencies do
    not populate test classpaths. Check every new input with `git ls-files` and CI
    provisioning. Keep compatibility metadata, tracked payload checks and
    malformed-input rejection portable and mandatory. Use
    `org.junit.Assume.assumeTrue` only when the exact decoded input is absent,
    never for a present invalid input. New fixture-dependent tests must pass on a
    fresh checkout without local decoded trees. Report executed and skipped counts
    separately; a skipped audit is not compatibility proof. Byte-hashed text needs
    an explicit `.gitattributes` line ending; validate the working-tree bytes after
    checkout and never change the expected hash to hide CRLF. The manual `Release`
    dispatch `run_tests` input exists for explicit CI test evidence. Keep
    generator-only and test-only libraries out of the shipped bundle.
11. **Release graph.** The release builds exactly once and ends at
    `:patches:buildAndroid` and `:patches:generatePatchesList`; tests are never part
    of it. Semantic release bumps `gradle.properties` and runs
    `clean generatePatchesList -PreleaseChannel=...` before tagging. A push that
    publishes no release gates on
    `:patches:buildAndroid :patches:generatePatchesList`. Every app's extension
    assembly task stays in that graph. For dependency, plugin, generator or test
    changes, validate that graph plus `:patches:test` in an isolated checkout.
    Release preparation cleans only external Gradle output before rebuilding, so a
    preflight bundle is never uploaded. Run
    `node .github/scripts/test_release_artifact_paths.cjs` after `npm ci` for release
    path changes. Manual fat-JAR or hand-built classpaths are diagnostic only. For a
    failure, identify the exact commit, run, job and first failed task before
    editing, check both test compilation and Android packaging, then confirm that
    corrected commit. Never validate a new change by rerunning an old commit or by
    weakening tests or dependencies. Attestation uses the canonical absolute path
    from `.github/scripts/resolve_release_artifact.cjs`; `..` segments are invalid.
    Use `tools/Configure-GitHubPackages.ps1` with a classic `read:packages` token and
    keep it outside source, logs and chat.
12. **Output and cleanup.** All build output, scratch, caches and native CMake
    output stay under `../builds/steamlink-patches/` (`gradle/root`,
    `gradle/patches`, `extensions/<name>/build-*`). Never create a local `build`,
    `patches/build`, `.gradle`, `.kotlin`, nested `builds/` or lowercase `d/`
    tree. Use `python -B`. Before reporting done, run
    `tools/Clean-BuildResidue.ps1`, review the plan, then run it with `-Apply`;
    keep the receipt and confirm protected inputs and hashes. The cleaner is
    repository-wide: do not apply it while another experiment is actively writing
    output. Canonical code lives only in `patches/src/main`; never create
    `patches/bin`. Release workflows do not rebuild native payloads; preserve
    source binaries, fixture APKs, exact decoded bases and audit tools. Pass this
    output and cleanup contract to every delegated writer.
13. **Retired experiments stay retired.** The Steam Link hitch experiments below
    were tested on a headset and failed. Do not re-add, re-import or re-derive any
    of them, including partial variants, without new evidence and a new mechanism.
    Read `diagnostics/steamlink-hitches/TRIED-EXPERIMENTS.md` first.

    | Retired experiment | Outcome | Record |
    |---|---|---|
    | Decoder input buffering | Whole-view freezes persisted. | `diagnostics/steamlink-hitches/` |
    | FEC duplicate reservation guard | Hitching not resolved. | `diagnostics/steamlink-hitches/` |
    | UDP receive buffer | Freezes worse and longer. | `diagnostics/steamlink-hitches/` |
    | Uber link rescan disable | Hitches unchanged. | `diagnostics/steamlink-hitches/` |

    The Full-FOV foveal canvas is also retired: it did not solve the
    high-resolution problem, and its patch and layer are removed. Read
    `SteamLink-GalaxyXR-Python-Patches-Already-Tried-for_Resolution_issue/README.md`
    before resolution work.

14. **4XVR gates.** The adaptation targets exact base 2.0.22/20022 only. The
    pristine stock APK is retained at
    `../builds/steamlink-patches/build/4xvr-2.0.22/` with SHA-256
    `24b83ab584675e02570e5318a35c7fa9b8da7eabb1f0763711c74c1bad3a84a8`.
    `Meta platform decoupling (4XVR)` is launch-critical and default-on. `Premium
    unlock (4XVR, experimental)` is default-off and not release-proven. The reference
    build's modified `libplacebo.so` has no corresponding source; its `NOTICE.txt`
    claim of a source ZIP is unverified and must not be repeated as compliance. The
    owner recommends the full 4XVR set for on-device iteration. Host-side apply
    audits passed; headset validation is pending, so no release note may claim
    runtime-verified 4XVR support until that evidence exists. Details:
    `diagnostics/4xvr-galaxyxr/`.

## Commands

```powershell
.\gradlew.bat build
.\gradlew.bat :patches:test
.\Verify-Build.ps1 -Tasks ':patches:test',':patches:buildAndroid'
.\gradlew.bat :patches:buildAndroid :patches:generatePatchesList -PreleaseChannel=stable

.\tools\Clean-BuildResidue.ps1          # preview
.\tools\Clean-BuildResidue.ps1 -Apply   # delete generated residue
python -B .github/scripts/check_agent_docs.py
node .github/scripts/test_release_artifact_paths.cjs
```

`Verify-Build.ps1` keeps its reports and cleans its own scratch. The residue
cleaner removes generated APKs, rebuildable scratch and repository-local output;
it keeps decoded trees, stock originals, tooling and evidence. See
`WORKSPACE_CLEANUP.md`.

## Read next

| Task | Read |
|---|---|
| Author, edit, debug or validate a patch | `.opencode/skills/morphe-patches/SKILL.md` |
| Delegate a bounded search, edit or review | `.opencode/skills/cavecrew/SKILL.md` |
| Build layout, cleanup policy, retained inputs | `WORKSPACE_CLEANUP.md` |
| Per-app evidence and open items | `diagnostics/steamlink-*/`, `diagnostics/4xvr-galaxyxr/` |
| Regenerated patch list | `TECHNICAL_REFERENCE.md` |
