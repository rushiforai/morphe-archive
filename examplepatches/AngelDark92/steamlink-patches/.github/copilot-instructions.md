# steamlink-patches — Copilot context

Kotlin morphe-patcher 1.7.0 patch library targeting `com.valvesoftware.steamlinkvr` 2.0.22.

## Patch authoring rules

- No fingerprint objects (`Fingerprint(definingClass, name)`). Not used in this project.
- No inline smali injection (`addInstructions(index, "smali string")`). Crashes in morphe-patcher 1.7.0.
- `bytecodePatch` is used **only** to merge extension DEX via `extendWith("extensions/extension.mpe")`.
- Use `rawResourcePatch` for raw APK files (lib/, assets/, .so binaries).
- Use `resourcePatch` with `finalize {}` for AndroidManifest.xml / XML edits.
- Every top-level patch: `@Suppress("unused")`, `compatibleWith(COMPATIBILITY_STEAM_LINK)`.

## Extension DEX (smali)

- Sources: `patches/src/main/resources/steamlink/androidxr/smali/`
- Built by `assembleExtension` task; output: `patches/build/generated/extension-resources/extensions/extension.mpe`
- **Smali assembler flag: `-a 33`** — NEVER `-a 35` (produces DEX 040/041 container format; dexlib2 crashes).

## Build

```powershell
.\gradlew.bat build
.\gradlew.bat assembleExtension   # rebuild extension DEX only
```
