# `patches/` — Morphe Patch Module Guide

This directory contains the Kotlin Morphe patches, version-binding compiler, runtime ABI verifier, and metadata generators targeting Gboard `18.5.4.993608717-release-arm64-v8a`.

---

## 1. Module Structure

```text
patches/
├── src/main/kotlin/dev/srwi/gintype/patches/
│   ├── shared/Constants.kt                          # Package IDs, COMPATIBILITY_GBOARD
│   └── gboard/
│       ├── features/
│       │   ├── thicctopbar/                   # Thicc Top Bar hook & feature marker
│       │   ├── multiglide/                    # MultiGlide gesture hooks & feature marker
│       │   └── packagerename/                       # Side-by-side manifest/label rename
│       ├── registry/
│       │   ├── GboardPatchRegistry.kt               # Public patch definitions & catalog
│       │   ├── GboardContributionWiring.kt          # Multi-contribution ordering rules
│       │   └── GboardCapabilityWiringVerifier.kt    # Build-time wiring gate
│       └── shared/
│           ├── GboardPatchesExtensionCarrierPatch.kt# Merges extensions/gintype.rve
│           ├── GboardPatchesSettingsPatch.kt        # Injects SettingsActivity/Provider & entry
│           ├── GboardTargetBinding.kt               # Binding resolution from generated map
│           ├── GboardStructuralFingerprint.kt       # Resilient method/field matchers
│           └── runtimeabi/                          # RuntimeCallId + RuntimeAbiVerifier
├── src/main/resources/gboard/
│   ├── gboard-port-product-catalog.json             # Feature / contribution catalog
│   ├── gboard-port-product-catalog.sha256           # Catalog checksum
│   └── gboard-version-bindings.json                 # Reviewed 18.5.4 symbol/method bindings
├── src/bindingCompiler/kotlin/                      # Generates GboardVersionBindings & GboardTargetAdmission
└── src/patchMetadata/kotlin/                        # PatchListGenerator -> patches-list.json
```

---

## 2. Architecture & Invariants

### Target Bindings Compiler (`bindingCompiler`)
- Gradle task `:patches:generateGboardVersionBindings` compiles `gboard-version-bindings.json` + `gboard-port-product-catalog.json` into generated sources `GboardVersionBindings.kt` and `GboardTargetAdmission.kt`.
- Packaging (`:patches:jar`) depends on `:patches:verifyGboardCapabilityWiring`, which fails the build if:
  - Any admitted `feature_id` in the catalog does not match `GboardPublishedPatchCatalog.morpheRegistrations` by `public_patch_name`.
  - Any multi-contribution feature's `GboardContributionWiring.registeredContributionIdsByFeature` disagrees with admitted catalog contributions.

### Runtime ABI Safety (`runtimeabi`)
- All Smali calls injected by bytecode patches MUST be declared in `RuntimeCallId` (`RuntimeAbi.kt`) and emitted via `RuntimeCallEmitter`.
- `:patches:test` inspects compiled `.class` bytecode (`CompiledPatchRuntimeCallInventory`) alongside the built `patches/build/libs/patches-*.mpp` DEX runtime (`DexRuntimeArtifactInventory`) and verifies every emitted signature exists with exact parameter and return types in `extensions/gintype.rve`.

### Namespace & Settings Isolation
- `GboardPatchesSettingsPatch.kt` registers:
  - Activity: `dev.srwi.gintype.extension.settings.GboardPatchesSettingsActivity`
  - Provider: `dev.srwi.gintype.extension.settings.GboardPatchesSettingsProvider`
  - Provider authority suffix: `.gintype`
  - Gboard settings preference key: `gintype_entry` (`"MultiGlide & Thicc Top Bar"`)
- `GboardPackageRenameResourcePatch.kt`:
  - Rewrites `package` + 15 permission/provider/meta-data/deep-link attributes from `com.google.android.inputmethod.latin` to `dev.srwi.com.google.android.inputmethod.latin`.
  - Strips `android:requiredSplitTypes`, `android:splitTypes`, and `com.android.vending.splits.required` for standalone APK installs.
  - Updates `SettingsProvider` authority and settings `<intent>` `targetPackage` cleanly regardless of finalize execution order with `GboardPatchesSettingsPatch`.
  - Uses resource `@string/gintype_app_display_name` (non-translatable) so combining with other bundles remains collision-free.

---

## 3. Common Tasks & Verification

```bash
# Build MPP bundle (compiles bindings + extension + wiring check)
./gradlew :patches:buildAndroid

# Run patch contracts, ABI checks, Smali compilation tests, and package-rename tests
./gradlew :patches:test

# Regenerate patches-list.json whenever patch metadata or options change
./gradlew :patches:generatePatchesList
```
