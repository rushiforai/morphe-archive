# morphe-patches skill

Use when authoring, editing, or debugging patches in this project.

## Project facts
- Library: morphe-patcher 1.9.0-dev.1
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

### Why not `-a 35`?
API 35 makes smali emit DEX format 040/041 (multi-DEX container). morphe-patcher 1.7.0's
bundled dexlib2 cannot parse container-format headers and crashes:
```
Caused by: com.android.tools.smali.dexlib2.util.DexUtil$InvalidFile: Unexpected container offset in header
```
API 33 → DEX 039, no container, fully compatible.

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
```powershell
.\gradlew.bat build              # full build
.\gradlew.bat assembleExtension  # rebuild extension DEX only
.\gradlew.bat generatePatchesList # regenerate patches-list.json
```
