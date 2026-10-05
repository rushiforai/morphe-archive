---
name: morphe-patches
description: Author, edit, debug and validate Steam Link Morphe patches in this repository, including exact-build guards and fresh-checkout test inputs.
---

# morphe-patches skill

Use when authoring, editing, or debugging patches in this project.

## Project facts
- Library: morphe-patcher 1.13.0; Morphe Manager 1.30.0 or newer
- Target app: `com.valvesoftware.steamlinkvr`; exact `(versionName, versionCode)` pairs are defined in `shared/Constants.kt`
- Required compatibility rules: read the repository-root `AGENTS.md` before editing
- Kotlin source root: `patches/src/main/kotlin/app/template/patches/steamlink/`
- Resources root: `patches/src/main/resources/steamlink/`

## Patch type selection

| Need | Use |
|------|-----|
| Copy/replace raw APK file (lib, assets, .so) | `rawResourcePatch {}` |
| Edit AndroidManifest.xml or other XML | `resourcePatch {}` |
| Merge a DEX extension into the app | `bytecodePatch {}` + `extendWith(...)` |

## Patch structure template

```kotlin
@Suppress("unused")
val myPatch = bytecodePatch(          // or rawResourcePatch / resourcePatch
    name = "Human readable name",
    description = "What it does.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_STEAM_LINK)   // always required
    dependsOn(someOtherPatch)                  // if ordering matters

    extendWith("extensions/extension.mpe")     // bytecodePatch only, when needed

    execute {
        // patch logic here
        // rawResourcePatch: get("lib/arm64-v8a/libfoo.so").writeBytes(...)
        // bytecodePatch:    (no fingerprint injection — see FORBIDDEN below)
    }

    finalize {
        // runs after APK rebuild; use for XML/manifest edits via document(...)
    }
}
```

## Extension DEX (smali)

- Sources: `patches/src/main/resources/steamlink/androidxr/smali/`
- Built by `assembleExtension` Gradle task
- Output: `build/generated/extension-resources/extensions/extension.mpe`
- Delete cached `.mpe` before rebuilding: `Remove-Item patches/build/generated/extension-resources/extensions/extension.mpe`
- **Smali API level: `-a 33`** — never use 35 or higher

### DEX format follows the pinned toolchain
The current smali `d856bad65f` emits standard DEX 040 with a `0x70` header at API 33.
Patcher 1.13.0 parses this format; keep the fresh-helper parsing checks in
`NativeXrTrackingConfigTest` mandatory. The earlier smali pin emitted DEX 039 at
API 33. Do not change DEX headers manually or raise the API level to fix a format mismatch.

Historical Morphe 1.7.0 builds could not parse container-format output from higher
API-level assembly and crashed:
```
Caused by: com.android.tools.smali.dexlib2.util.DexUtil$InvalidFile: Unexpected container offset in header
```
This historical failure does not make every DEX 040 file a multi-DEX container.

## Bytecode editing

- Prefer typed dexlib2 builders such as `BuilderInstruction21c` and the repository's
  `InstructionExtensions` helpers for exact bytecode edits.
- Do **not** call `addInstructions(index, "smali string")`. Historical Morphe Manager 1.7
  builds can crash in `InlineSmaliCompiler` with:
```
Caused by: java.util.NoSuchElementException: Collection is empty.
    at app.morphe.patcher.util.smali.InlineSmaliCompiler$Companion.compile
```
- Structural fingerprints or exact class/method lookups are allowed when validated against every
  declared base. Keep mutation preconditions build-aware and fail closed.

## Constants
Use the exact `(versionName, versionCode)` model and primary `AppTarget` constructor documented in
the repository-root `AGENTS.md`. Never replace the existing compatibility list when adding a base.

## Helpers available
- `loadResource(name: String): ByteArray` — loads from `/steamlink/androidxr/` classpath resources
- `BinaryPatchHelper.findUniqueAndReplace(bytes, search, replace)` — AArch64 .so patching
- `BinaryPatchHelper.vaddrToFileOffset(...)` — virtual address → file offset in ELF

## Build commands

### Dependency scopes and release preflight

Tests importing a production `compileOnly` library must declare their own
`testImplementation` dependency. Gson belongs in `compileOnly(libs.gson)`,
`testImplementation(libs.gson)` and the separate catalog generator configuration;
do not promote it to production `implementation` or `runtimeOnly` to fix tests.

Run the workflow's complete Gradle gate in a fresh checkout before accepting
dependency/plugin, generator or test changes:

```powershell
.\gradlew.bat clean :patches:test :patches:buildAndroid :patches:generatePatchesList -PreleaseChannel=experimental --no-daemon
```

Use `stable` on main. The workflow must run this gate before semantic-release,
including commits that do not produce a release. Preserve generated extensions
and mandatory portable tests in this graph.
Use an isolated checkout for this clean command; the working repository's root
`build/` contains protected fixtures/tools/evidence. Use `Verify-Build.ps1` for
scoped local test/Android checks rather than cleaning that mixed directory.

Manual compiler classpaths and desktop fat JARs can hide missing declarations and
use a different compiler. Never call their output a Gradle or CI pass. When local
plugin resolution blocks the gate, report that limitation and use the corrected
commit's GitHub run for authoritative build verification.

For workflow failures, identify the exact SHA/run/job and first failed task before
editing; verify that same corrected SHA afterward. Run `37129119119` failed in
`:patches:compileTestKotlin`: `PatchCategoriesTest` imported Gson without a test
dependency, while manual validation supplied `gson.jar`. Production compilation
and Android packaging passed, so changing the patcher/smali pins or skipping tests
would not fix that failure.

Before accepting new tests, check whether each file input is tracked (`git ls-files -- <path>`) or explicitly provisioned by `.github/workflows/release.yml`. The workflow's ordinary `:patches:test` has no decoded APK provisioning. A local cached-compiler pass with ignored inputs present does not test that environment.

Keep tracked resource/hash checks, metadata tests and malformed-input rejection runnable without proprietary decoded APKs. For real-byte audits, use `org.junit.Assume.assumeTrue` with an explicit `BLOCKED` reason only when the exact decoded input is absent. Do not skip missing canonical payloads, invalid present inputs or assertion failures. Synthetic invalid bytes can prove rejection, never real-base compatibility.

Run fixture-dependent tests once with retained inputs and once from a fresh/isolated working directory where they are absent, using only tracked runtime resources and explicit classpaths. Check JUnit executed/skipped/failure counts. The 2026-10-01 failure in run `36907870366` was 5 `FovealCanvasPatchTest` failures caused by an ignored 5001812 scene; `buildAndroid` had already passed. Fix that input boundary rather than changing production guards or disabling the test task.

Report cached compilation, full Gradle/Android packaging, real APK audits and GitHub CI separately. Confirm the corrected commit's workflow result before claiming CI success.

Byte-pinned JSON/text resources need deterministic checkout bytes. Set an explicit `.gitattributes` rule (the foveal canvas manifest uses `text eol=lf`) and check `git ls-files --eol` plus the resource SHA-256 after checkout. Windows `core.autocrlf` can otherwise invalidate a correct Linux manifest pin. Preserve the canonical hash and installer guard; do not accept multiple line-ending hashes to hide the mismatch.

```powershell
.\gradlew.bat build              # full build
.\gradlew.bat assembleExtension  # rebuild extension DEX only
.\gradlew.bat generatePatchesList # regenerate patches-list.json
```
