---
name: morphe-create-patch
description: Implement or modify bytecode and resource patches in santodan-patches using proven target-app contracts and current Morphe APIs.
---

# Implement a Morphe patch

Work in `E:\Morphe\santodan-patches`. You need an evidence note for the latest
original (see `morphe-inspect-app`). Read only the target app's `AI_Guide.md`
section (`rg -n '^##' AI_Guide.md`) and its newest doc in `docs/`.

## Code map (verify quickly with `rg`; do not survey the tree)

- Java patches: `patches/src/main/java/santodan/patches/`. Kotlin resource and
  manifest patches: `patches/src/main/kotlin/santodan/patches/`.
- APIs: `app.morphe.patcher` 2.0.0 (`gradle/libs.versions.toml`), Gradle plugin
  `app.morphe.patches` 1.3.4, smali `4220ae75f7`. Copy patterns from repo code, not
  from ReVanced or `References/`.
- Public patches use static synchronized getters that cache one `BytecodePatch`.
  Shared dependencies are cached too. Always return the cached instance, or a patch
  depended on by several features runs more than once.
- **Nuvio contracts:** every native class, method and field reference lives in
  `contracts/nuvio/native.properties` (`REF_*`, `class.*`, `VERSION`), generated into
  `software.santodan.nuvio.NuvioNative` for patches *and* extensions. Add or change
  bindings there, then use the constant in both the matcher and the runtime. Do not
  hand-copy a descriptor or owner/name string.
- Nuvio targets come from `NuvioLayout.targets()` (1.1.1 only). Shared hidden
  dependency: `NuvioSettingsMenuPatch.getMenuPatch()`. Label/date features depend on
  `NuvioLabelCustomizationPatch.getNuvioLabelCustomizationPatch()`.
- Reuse existing helpers: `NuvioPlaybackButtonsPatch.fingerprint/reference`,
  `NuvioAiringSeriesPatch.instructions`, `NuvioAnchors.parameter`,
  `NuvioRemainingEpisodesPatch.parameterStart`, `NuvioIntroDbPatch.require`,
  and for Pillo the `Pillo627Contracts` validate-then-mutate pattern.

## Rules

- Declare exact compatibility and re-check package/version inside `execute`.
  Validate every contract (hash/structure, uniqueness, already-patched) **before the
  first mutation**. A failure partway through leaves partial edits in the output.
  Select by full signature; never `findFirst()` by name alone on new code.
- For bytecode, account for register types and wide pairs, invoke 35c/3rc limits,
  move-result adjacency, branch targets (insertions do not inherit labels), and try
  regions. Prefer redirecting to static wrappers over changing register counts.
  Verify through DEX write/reload.
- For manifest/resource changes, use structured XML edits. For side-by-side
  identity, cover app-owned permissions, provider authorities, task affinity,
  launcher labels and resources added by other patches.
- Create fixtures for the new target only; never rewrite historical fixtures or
  older-version branches. Preserve native auth, errors, navigation and unrelated flows.
- Runtime code: load `morphe-runtime-extension`. Update the feature doc and the
  app's guide section. Do not bump versions or hand-edit `patches-list.json`.

Then load `morphe-verify-patch`. A patch must never log success when its hook was
not applied. Never commit or push unless asked in the current message.
