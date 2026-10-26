---
name: morphe-patches
description: Author, edit, debug and validate Morphe patches for the apps in this repository (Steam Link VR, 4XVR), including exact-build guards and fresh-checkout test inputs.
---

# morphe-patches

Read repository-root `AGENTS.md` first. It owns the compatibility, isolation,
default, description, evidence and release rules. This file is the procedure for
doing the work.

## Patch types

| Need | Use |
|---|---|
| Copy or replace a raw APK file (`lib/`, `assets/`, `.so`) | `rawResourcePatch {}` |
| Edit `AndroidManifest.xml` or another XML | `resourcePatch {}` with `finalize {}` |
| Merge a DEX extension | `bytecodePatch {}` + `extendWith(...)` |

Never call `addInstructions(index, "smali string")`.

## Template

```kotlin
@Suppress("unused")
val myPatch = bytecodePatch(
    name = "Human readable name",
    description = "What it does.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_STEAM_LINK)
    dependsOn(someOtherPatch)
    extendWith("extensions/extension.mpe")

    execute {
        // Typed dexlib2 or raw resource work.
    }

    finalize {
        // XML/manifest edits after APK rebuild.
    }
}
```

## Adding an app

A new app is a new package, never a widening of an existing patch.

1. `shared/Constants.kt`: add a private `data class <App>Build(version, versionCode)`,
   that app's exact build list, an `is<App><Build>(version, versionCode)` helper,
   a `Compatibility` built with the primary `AppTarget` constructor, and
   `COMPATIBILITIES_<APP>`. Never touch another app's lists.
2. Layout: patches under `app/template/patches/<app>/`, payloads under
   `resources/<app>/<group>/`, extension smali under
   `resources/<app>/smali/<package path>/`, tests under `test/.../<app>/`.
3. Categories: reuse `shared/PatchCategories.kt`. A new category needs the matching
   `PatchCategoriesTest` group map and expected counts. `PatchCategoriesTest`
   enumerates patches by hand, so a new app's patches stay outside its assertions
   until listed explicitly. A new category also needs an entry in
   `CATEGORY_ORDER` in `.github/scripts/generate_patches_readme.py`. Update the
   group-size asserts, stable/experimental totals and per-category counts in the
   same change.
4. Extension payload: add a JavaExec task mirroring `assembleExtension` (that app's
   smali dir, args `a -a 33 -o <out>`), emit `<app>-extension.mpe`, and wire
   `resources.srcDir(...)` plus `processResources`/`sourcesJar` dependencies. Never
   merge two apps' classes into one `.mpe`.
5. Every patch declares `compatibleWith(*COMPATIBILITIES_<APP>.toTypedArray())` and
   re-checks the exact pair first:
   `if (!is<App><Build>(packageMetadata.versionName, packageMetadata.versionCode)) return@execute`.
6. Load payloads through one private loader per app
   (`object {}.javaClass.getResourceAsStream("/<app>/<path>")`) that errors with the
   missing path.
7. Native in-place edits: model each as `(offset, original, replacement)`, pin the
   library by exact size and stock SHA-256, accept original or replacement per site
   (idempotent), and fail closed otherwise. Keep an unpinned per-site applier so
   synthetic tests run without the decoded base.
8. Tests: tracked payload SHA-256 pins, synthetic apply/keep-patched/reject-foreign/
   wrong-size/wrong-hash cases, and the real-base audit behind
   `org.junit.Assume.assumeTrue("BLOCKED: ...")`. Report executed and skipped
   counts separately.
9. Worked example: the 4XVR set (`fourxvr/`, `resources/fourxvr/`,
   `fourxvr-extension.mpe`). Cross-check every app-member reference in extension
   smali against the stock decode before assembling; existing app classes are
   patched in place, never replaced.

## Native OpenXR layer pitfall

An implicit API layer's `getInstanceProcAddr` is queried by the shipped loader with
`XR_NULL_HANDLE` for `xrInitializeLoaderKHR` before any `createApiLayerInstance`
chain exists. Forwarding that call through an unassigned next-chain pointer
branches to null and SIGSEGVs the app at every start. Guard every layer fallback:
return `XR_ERROR_FUNCTION_UNSUPPORTED` when the next chain is unassigned. A failed
call is the loader-tolerated "no forward" answer; `XR_SUCCESS` with a null output
pointer makes the loader abort the layer. Evidence:
`diagnostics/steamlink-foveal-canvas/2026-10-12-loader-crash-rca-and-fix.md`.

## Descriptions

Patch descriptions are copied verbatim into `patches-list*.json`.
Tests pin some wording; grep `patches/src/test` for `.description`,
`patchSource.contains` and name assertions before a text pass. Treat every hit as
locked verbatim. Known pinned fragments include `future RGB10_A2`, `needs Shizuku`,
`local to the grip pose`, `local to the streamed pose`, `in the base space`, `stand`,
and the premium patch name containing `experimental`.

House style: one short plain-words sentence plus `Builds: <exact codes>.`, then
`Needs: <requirement>.` only when a real requirement exists. Keep every build ID and
pair the old text named. Omit `Needs:` for a normal install. Keep credit appends
intact and excluded from the length budget. No jargon beyond app/tool names. Names
keep pinned suffixes such as `(experimental)` unchanged.

Generate the build line with `buildLabel(compatibilityList)` from
`shared/PatchBuilds.kt` and pass the same list to `compatibleWith`. Never hand-write
a line that can drift. `assertPatchDescriptionContract` enforces the code mapping
and the 150-character one-sentence budget.

Rewriting a description needs a matching test update or the pinned phrase kept,
then `:patches:generatePatchesList -PreleaseChannel=stable`, which rewrites all four
root catalogs. A bare run stamps `patches-list.json` as channel `all`; that is the
wrong shape. `generatePatchesList` no longer depends on `test`, so the local
`:patches:test` run is the only assertion check.

Option texts: `stringOption(...)`/`intSliderOption(...)` carry a user-facing `title`
and `description`, plus a `values` map whose left keys are display labels and right
keys the stored settings. Reword left keys only when clearly long, never the
right-side values, and keep the mapping 1:1.

For a repo-wide text pass, build the inventory from the root `patches` key of
`patches-list-all.json` (a recursive walk over-picks `compatiblePackages` rows that
also carry `name` fields), map patch names to source files by grepping `name = "`,
give each parallel child a directory batch plus locked phrases, run the reviewer
over the diff, then regenerate catalogs, technical reference and tests. Expect zero
old-phrase matches outside `CHANGELOG.md` and `diagnostics/`.

## Bytecode and native edits

- Prefer typed dexlib2 builders such as `BuilderInstruction21c` and the repository's
  `InstructionExtensions` helpers. Structural fingerprints or exact class/method
  lookups are allowed when validated against every declared base.
- Parameter register offsets count register WORDS, not parameter types: `J` and `D`
  occupy two words, so in `RenderFrame(ZJJ)V` p1 sits 5 words below the register
  count, not 3. Counting types mis-anchors every wide-parameter method and silently
  matches nothing.
- dexlib2 inserts before a branch target are skipped at runtime: the branch holds
  the target instruction object, so inserting before it leaves the jump on the
  original instruction. Insert after the label target or on a branch-free stretch,
  and confirm no label sits between the insert and the first read of what it defines.
- `Opcode.name` is a field holding the lowercase mnemonic (`"if-eqz"`, `"goto"`), not
  the enum constant. Match lowercase mnemonic prefixes or compare enum constants
  (`opcode == Opcode.IF_EQZ`).
- Never park a hook result in a stock scratch register across a merge point. Use only
  registers the stock code provably rewrites before their next read on the same
  straight-line path, or bump the register count and use a fresh local. A skipped or
  merged insert leaves a `Conflict` type and ART rejects the whole class.
- Unit tests do not run ART verification. Every new or changed bytecode edit needs a
  device run. A rejected class appears in logcat as
  `java.lang.VerifyError: Verifier rejected class ...`; treat it as a hard patch
  failure, not app flakiness.
- Index-0 insertion is safe only when the method's first instruction is not a branch
  or switch target and no try range starts there. Both are cheap to read from decoded
  smali and belong in a decoded-tree audit test that skips without the tree.
- Method-receiver helpers need `MutableMethod` from
  `app.morphe.patcher.util.proxy.mutableTypes.MutableMethod`, the patcher fork's
  package. Guard each `addInstruction` with a check on `instructions.first()` so
  re-running `execute` cannot inject a second call.
- Byte-hashed text payloads need `.gitattributes` `text eol=lf`. Without it a Windows
  checkout fails the SHA-256 payload test while Linux CI passes. Add the pin and
  re-checkout; never accept multiple hashes.
- A new `diagnostics/<app>/` record directory is ignored by `diagnostics/*`. Add the
  whitelist block (`!diagnostics/<dir>/`, `diagnostics/<dir>/*`,
  `!diagnostics/<dir>/*.md`) in the same change, or `git add` silently drops records
  cited by docs and release notes.
- A lowercase-drive argument (`d:/...`) reaching a native tool or Java resolves as
  relative on this host and creates a literal `d/` tree hidden by ignore rules. Check
  for it, delete it, and keep `D:/` spellings in wrapper arguments.

## Extension DEX

- Sources: `patches/src/main/resources/steamlink/androidxr/smali/` (Steam Link) and
  `patches/src/main/resources/fourxvr/smali/` (4XVR).
- Tasks: `assembleExtension` (plus `assembleMinimalExtension`,
  `assembleBatteryExtension`) and `assembleFourXvrExtension`. Each emits its own
  payload: `extension.mpe`, `minimal-extension.mpe`, `battery-extension.mpe`,
  `fourxvr-extension.mpe`.
- Only brand-new helper classes are assembled. Edits to an app's existing classes
  stay in build-aware Kotlin (typed dexlib2, no raw smali strings). A new app adds its
  own task and output directory; it does not rewire an existing task.
- The Steam Link output is
  `../builds/steamlink-patches/gradle/patches/generated/extension-resources/extensions/extension.mpe`.
  Delete a cached `.mpe` before rebuilding it.
- Smali API level is `-a 33`; never 35 or higher. The current smali pin emits
  standard DEX 040 at API 33. Patcher 1.13.0 parses it. Do not change DEX headers
  manually or raise the API level to fix a format mismatch. Keep the fresh-helper
  parsing checks in `NativeXrTrackingConfigTest` mandatory. Historical Morphe 1.7.0
  builds failed on container-format output with
  `Unexpected container offset in header`; that failure does not make every DEX 040
  file a multi-DEX container.

## On-device APK sources

Morphe Manager keeps the pristine original and patched output under
`/data/data/app.morphe.manager/app_original-apks/` and `app_patched-apps/`; that is
where a missing stock base can be recovered. `/sdcard/Download` copies are
`media_rw`-owned, so `adb pull` as shell fails. Stage with
`su -c 'cp <src> /data/local/tmp/<name>; chmod 644 <name>'`, pull, verify SHA-256,
then delete the stage copy.

## Manager app tile icon

Morphe Manager renders a stored APK's tile from its manifest icon
(`packageManager.getResourcesForApplication` + `ResourcesCompat.getDrawable`). A
custom icon name or an adaptive XML in `mipmap-anydpi` without `-v26` can resolve to
nothing and show a blank tile. Expose artwork under the canonical `ic_launcher` /
`ic_launcher_round` names (adaptive XML in `res/mipmap-anydpi-v26/` plus density
PNGs) and point the manifest `android:icon`/`android:roundIcon` at them.

## Build, test and audits

All local output follows `AGENTS.md` rule 12: external `gradle/`, `build/` and
native `build-*` roots; never create a local build tree.

Tests importing a production `compileOnly` library declare it in
`testImplementation`; do not promote it to production `implementation`.

`:patches:test` is local-only. Run it at the end of every task and report counts.
Reproduce the release graph with:

```powershell
.\gradlew.bat :patches:test
.\gradlew.bat :patches:buildAndroid :patches:generatePatchesList -PreleaseChannel=stable
```

For dependency, plugin, generator or test changes, run that graph plus
`:patches:test` in an isolated checkout. Run
`node .github/scripts/test_release_artifact_paths.cjs` after `npm ci`. GitHub
Packages setup and token rules are in `AGENTS.md` rule 11.

Real apply audits (`util.*MorpheAudit` runners such as `VdSdrMorpheAudit`
and `PremiumUnlockMorpheAudit`) execute the patcher end-to-end on a retained
original APK and package an unsigned output. Their classpath is a cached-compiler
snapshot built by `build-classpath.py`; after any patch-source change, re-run that
script or the JVM loads stale classes (tell: a stack frame at pre-edit line
positions). Verify output with
`Tools/apk-tools/build-tools-35.0.1/android-15/dexdump.exe`; dexdump renders
references as `Lpkg/Class;.method:(args)ret`, not smali's `->`. Under `STRIP_FAST`
packaging, modified classes move to the new output `classes.dex`, originals shift one
slot, and the stripped original keeps its size with a different SHA-256. Check its
class list holds no leftover class_defs for the moved classes.

For fixture-dependent tests, run once with retained inputs and once from a fresh or
isolated checkout where they are absent. Check JUnit executed/skipped/failure counts.
A skipped audit is not compatibility proof. Synthetic invalid bytes can prove
rejection, never real-base compatibility.

When another task's uncommitted refactor breaks `:patches:test` compilation, do not
revert or stash their files. Use a throwaway worktree:
`git worktree add --detach <external>/build/<name> HEAD`, copy only your changed
files, run the test, then remove the worktree. A worktree nested under the external
root creates a second derived build tree; delete that tree and the worktree.
Read counts from that tree's `gradle/patches/test-results/test/*.xml`.

## Credits

Credit text lives in one `internal const val <APP>_CREDIT` per app (4XVR:
`FOUR_XVR_UPSTREAM_CREDIT` in `FourXvrDexKit.kt`; Steam Link:
`STEAM_LINK_CONTROLLER_CREDIT` in
`steamlink/androidxr/ControllerAngularVelocityFrame.kt`) and is appended to every
patch description the credit covers. Option descriptions never get it. Keep appended
text free of phrases tests pin as sentinels, then regenerate catalogs, technical
reference and tests.

## Official Morphe references

- Multi-version `AppTarget`:
  https://github.com/MorpheApp/morphe-patcher/blob/v1.9.0-dev.1/docs/2_2_patch_anatomy.md#L12-L37
- `AppTarget` and `versionCodes`:
  https://github.com/MorpheApp/morphe-patcher/blob/v1.9.0-dev.1/src/main/kotlin/app/morphe/patcher/patch/Compatibility.kt#L55-L101
- Duplicate-version validation:
  https://github.com/MorpheApp/morphe-patcher/blob/v1.9.0-dev.1/src/main/kotlin/app/morphe/patcher/patch/Compatibility.kt#L299-L359
- `compatibleWith`:
  https://github.com/MorpheApp/morphe-patcher/blob/v1.9.0-dev.1/src/main/kotlin/app/morphe/patcher/patch/Patch.kt#L480-L523
- Global patch metadata:
  https://github.com/MorpheApp/morphe-patcher/blob/v1.9.0-dev.1/src/main/kotlin/app/morphe/patcher/patch/Patch.kt#L27-L51
- Recursive dependency execution:
  https://github.com/MorpheApp/morphe-patcher/blob/v1.9.0-dev.1/src/main/kotlin/app/morphe/patcher/Patcher.kt#L71-L103
