# steamlink-patches — Copilot context

Kotlin morphe-patcher patch library targeting exact `(versionName, versionCode)` Steam Link bases,
including 2.0.20 builds 5001712 and 5001740 plus the preserved 2.0.22 builds. Read repository-root `AGENTS.md` first.

## Patch authoring rules

- No inline smali injection (`addInstructions(index, "smali string")`). Crashes in morphe-patcher 1.7.0.
- Typed dexlib2 bytecode edits and exact class/method lookups are allowed when validated against every declared base.
- Use `rawResourcePatch` for raw APK files (lib/, assets/, .so binaries).
- Use `resourcePatch` with `finalize {}` for AndroidManifest.xml / XML edits.
- Every top-level patch: `@Suppress("unused")` plus the appropriate exact compatibility list from `shared/Constants.kt`.
- Preserve every existing version adaptation, global default, and build-aware dependency guard when adding a base.

## Extension DEX (smali)

- Sources: `patches/src/main/resources/steamlink/androidxr/smali/`
- Built by `assembleExtension` task; output: `patches/build/generated/extension-resources/extensions/extension.mpe`
- **Smali assembler flag: `-a 33`** — NEVER `-a 35` (produces DEX 040/041 container format; dexlib2 crashes).

## Build

```powershell
.\gradlew.bat build
.\gradlew.bat assembleExtension   # rebuild extension DEX only
```
