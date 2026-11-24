---
name: morphe-runtime-extension
description: Add or modify injected Java/Kotlin runtime modules, native UI hooks, and shared settings for Santodan Morphe patches.
---

# Extend native runtime behavior

Use only when the patch needs runtime code beyond direct bytecode/resource edits.
Requires latest-target DEX evidence (`morphe-inspect-app`). Repository:
`E:\Morphe\santodan-patches`.

## Layout

- Modules: `extensions/<feature>/` (Java in `src/main/java/software/santodan/extension/<pkg>/`),
  `build.gradle.kts` sets the namespace and `.mpe` name. A patch bundles a module
  only through its own `extendWith(...)` (e.g. `NuvioStreamPreloadPatch.extension("nuvio-introdb")`)
  or through a dependency patch that does. A new folder alone is not packaged.
- Nuvio's shared runtime is `extensions/nuvio-settings-menu` (`nuviomenu`), merged
  through `NuvioSettingsMenuPatch.getMenuPatch()`. It contains settings, backup,
  restart, and the label/date styling (`NuvioLabelStyles`, `NuvioDateLabelStyle`,
  `LabelCustomization`). Patches that do not depend on the menu patch
  (e.g. GitHub APK updates, startup track reselection) do not ship it, so runtime
  code must look it up reflectively and tolerate `ClassNotFoundException`.
- Native names: read `software.santodan.nuvio.NuvioNative` constants
  (`contracts/nuvio/native.properties`). Derive owner/name from the same full
  `REF_*` the patch validates. New hardcoded obfuscated names (`"d0.v"`, `"a2.j"`, ...)
  are drift risks: add them to the contracts file and to the APK audit instead.

## Rules

1. Validate every native method, field, constructor and continuation used. No
   speculative reflection fallbacks or older-version dispatch branches. Preserve
   existing dispatch in shared modules.
2. Reuse native repositories, sessions, navigation, profile state and controls.
   Optional features are opt-in with persisted settings. The disabled path does no
   work: no I/O, preference writes or heavy regex/hash work per render. Patches that
   can be selected independently must work alone and together.
3. Keep network, file and DB work off UI/composition. Bound queues, caches, retries
   and any persisted discovery lists, and avoid writing preferences from composition.
   Coalesce events, isolate per-profile data, and cancel observers with the native
   lifecycle. Await suspend completion and propagate errors.
4. Compose hooks follow the guide's composer/group, sizing, focus, modifier and
   style contracts. Do not guess packed Color/TextUnit values or R8-erased defaults.
   Close groups on early returns and use distinct group keys. ThreadLocal scopes
   (e.g. `begin*`/`end`) must be cleared on every exit path.
5. Add host-runtime checks for observable behavior: disabled work, profile switch,
   duplicates, cancellation, failure completion. Fixtures model the real ABI,
   including incompatible same-name helpers. For an editor crash, test opening the
   editor as well as editing.

Then use `morphe-verify-patch`. List the remaining device checks: focus,
lifecycle, persistence and native integration.
