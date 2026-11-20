# Repository Guidelines

Scope: Morphe patch definitions and patch metadata generation under `patches/`.

## Architecture & Layout

- `src/main/kotlin/app/aidan/patches/<app>/<feature>/`: app-specific patch declarations.
- `src/main/kotlin/app/aidan/patches/<app>/shared/Constants.kt`: package, target, signer/type, and `Compatibility` metadata.
- `src/main/kotlin/util/PatchListGenerator.kt`: reflects compiled declarations into root `patches-list.json`.
- `build.gradle.kts`: bundle metadata, Apple Color Emoji resource preparation, `buildAndroid`, and `generatePatchesList` integration.
- If adding a new build input outside `patches/` or `extensions/` (e.g. asset files, generators, Gradle scripts), add its path to `.github/workflows/release.yml` `paths:` so release CI triggers.

Read `docs/<app>/architecture.md` and `docs/<app>/patches.md` before changing an app. Use generated `../patches-list.json` for the current public inventory; do not hard-code patch counts.

## Patch Types and Layer Boundaries

| DSL                                      | Context                | Use                                                                                                                                                                  |
| ---------------------------------------- | ---------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `compositeFeaturePatch`                  | composite context      | Unified 1-to-1 feature combining Dalvik bytecode with internal companion resource and/or raw resource patches. Filters internal companions from `patches-list.json`. |
| `bytecodePatch`                          | `BytecodePatchContext` | Dexlib2 class/method discovery and Smali instruction edits.                                                                                                          |
| `resourcePatch`                          | resource context       | Decoded Android XML resources and manifest DOM edits.                                                                                                                |
| `rawResourcePatch`                       | resource context       | Raw assets, Hermes bundles, fonts, ELF/native libraries, and web assets.                                                                                             |
| `extendWith("extensions/extension.mpe")` | packaging              | Merge Java runtime bridge classes into target DEX.                                                                                                                   |

A `bytecodePatch` cannot reliably stage raw APK asset changes. If a feature spans DEX plus XML/assets/native libraries:

1. **1-to-1 feature-private companions**: Use `compositeFeaturePatch` from `app.aidan.patches.shared.compositeFeaturePatch` with `resources { ... }`, `rawResources { ... }`, or both, alongside a `bytecode { ... }` block. This keeps internal resource layers encapsulated from reflective discovery in Morphe Manager and `patches-list.json`. See `adobescan/customization/LocalPremiumPatch.kt`, `nhl/ads/WebAdBlockerPatch.kt`, `geocaching/features/RemoveListsPatch.kt`, `geocaching/customization/OpenStreetMapPatch.kt`, `blackjack/customization/AddCustomChipStorePatch.kt`, or `fizz/customization/ReplaceEmojiFontWithIosPatch.kt`.
2. **Shared multi-feature prerequisites**: Define a standalone `resourcePatch` or `rawResourcePatch` and link each dependent patch via `dependsOn(...)` when multiple independent features share the same prerequisite layer. See `aftership/auth/RemoveLoginPatch.kt` (`bypassSignatureCheckResourcePatch`).
3. Use `extendWith(...)` separately when injected Java extension classes are called.

## Declaration Pattern

Export patches as lower-camel top-level values ending in `Patch`:

```kotlin
@Suppress("unused")
val samplePatch = bytecodePatch(
    name = "Stable user-facing name",
    description = "Concise behavior description.",
    default = true
) {
    category("Category")
    compatibleWith(COMPATIBILITY_APP)
    dependsOn(sampleResourcePatch) // only for a real cross-context dependency
    extendWith("extensions/extension.mpe") // only when calling injected Java

    execute {
        // fail-fast transformation
    }
}
```

Use `bytecodePatch`, `resourcePatch`, `rawResourcePatch`, or `compositeFeaturePatch`; never legacy `@Patch` or `@CompatiblePackage` annotations. Patch names, descriptions, categories, options, and compatibility are public API because metadata generation and UI consume them.

## Bytecode Patterns

- Locate targets by descriptor plus method name, parameters, return type, implementation presence, and an identifying instruction/reference where necessary. Do not anchor on a broad name alone.
- Required target absence must throw `PatchException` naming the missing class/method/signature or expected structure.
- A missing optional/version-variable target may return/continue only when the behavior is explicitly optional.
- Confirm `method.implementation != null` before editing. Preserve register widths, parameter registers, return types, try/catch regions, and reachable control flow.
- Prefer small local `BytecodePatchContext` helpers for repeated neutralization patterns. Do not create a shared abstraction until multiple app-local call sites need the same invariant.
- Use `addInstructions`/`replaceInstruction` from existing Morphe helpers. Validate unfamiliar Smali with `apk-lab validate-smali` before adding it.
- Early returns and fixed return values are preferred when they fully neutralize an entry point; avoid leaving side effects before the injected return.

## Resource, Hermes, and Binary Patterns

- XML: use `document(path).use { ... }`; match namespaces and required nodes explicitly. Throw `PatchException` when a required resource/node is absent.
- Raw files: use `get("asset/or/lib/path")`; verify existence and close streams with `use`.
- Binary/native edits: bounds-check, verify expected bytes before every write, accept an already-patched sequence idempotently, and throw on mismatch. Never write an offset inferred only from an older release.
- ARM64: obtain/verify encodings through `apk-lab asm`; keep expected and replacement bytes adjacent to the target description.
- Hermes: never grow/re-layout sections. Guard offsets/bytes, recycle an adequate donor string when changing strings, zero-pad remaining donor bytes, and call `updateFooterHash()` before export.
- Generated packaged assets belong in Gradle resources or a companion raw patch, not ad hoc filesystem locations.

## Compatibility Workflow

Never update a `shared/Constants.kt` target based only on version metadata or a successful single patch.

New patch:

```text
inspect → targeted analyze → fail-fast implementation → build .mpp → check --all → device smoke → docs
```

App update:

```text
compare → check --all --force failing baseline → targeted analyze/remap → build → check --all → device smoke → compatibility/docs
```

Use only managed APK Lab commands described in `../tools/apk-lab/AGENTS.md`. Do not unzip/decompile into arbitrary repository directories, and never delete `.apk-lab` workspaces manually.

## Commands & Verification

```bash
./gradlew :patches:compileKotlin :extensions:extension:compileReleaseJavaWithJavac --console=plain
./gradlew :patches:buildAndroid
./gradlew generatePatchesList

uv run --project tools/apk-lab apk-lab check path/to/app.apkm \
  --mpp patches/build/libs/patches-X.Y.Z.mpp \
  --package com.example.app \
  --all
```

For behavior changes, deploy and monitor the real target, then run root `bun run audit`. Compilation alone proves only source validity; `generatePatchesList` proves declarations instantiate; `check --all` proves patch-time compatibility; device smoke proves runtime behavior.

## Documentation and Generated Outputs

- Update `docs/<app>/patches.md` for user-visible behavior/options and `architecture.md` for discovered target architecture/invariants.
- Do not hand-edit root `patches-list.json`, `.mpp`, `.mpe`, generated font output, or the README patch table.
- New extension calls require matching updates under `extensions/` and exact class/method descriptors in both Java and Smali.
