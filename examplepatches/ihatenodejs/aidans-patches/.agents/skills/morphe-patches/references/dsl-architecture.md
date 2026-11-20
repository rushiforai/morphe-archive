# Morphe DSL & Cross-Layer Architecture Reference

This reference covers the Morphe patch declaration DSL, architectural layer boundaries, composite feature patches, options configuration, metadata conventions, and dependency graph (DAG) composition.

---

## 1. Patch Types and Execution Contexts

Morphe provides four primary declaration functions under `app.morphe.patcher.patch.*` and `app.aidan.patches.shared.*`:

| Declaration DSL | Receiver Context | Primary Scope & Responsibility |
|---|---|---|
| `bytecodePatch(...) { ... }` | `BytecodePatchContext` | Dalvik/DEX modifications using Dexlib2 AST and Smali injection. |
| `resourcePatch(...) { ... }` | `ResourcePatchContext` | Decoded Android XML resources (`res/**/*.xml`) and `AndroidManifest.xml` DOM edits. |
| `rawResourcePatch(...) { ... }` | `ResourcePatchContext` | Raw archive entries: Hermes bytecode (`index.android.bundle`), ELF shared libraries (`lib/**/*.so`), fonts, web assets. |
| `compositeFeaturePatch(...) { ... }` | `CompositePatchBuilder` | Unified 1-to-1 feature combining bytecode with internal companion XML and/or raw resource patches. |

### Canonical Patch Declaration Pattern

Patches are declared as top-level `val` properties ending in `Patch`:

```kotlin
package app.aidan.patches.geocaching.customization

import app.aidan.patches.geocaching.shared.Constants.COMPATIBILITY_GEOCACHING
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val customMapTilePatch = bytecodePatch(
    name = "Custom Map Tiles",
    description = "Enables custom OSM and satellite map tile providers.",
    default = true,
) {
    category("Customization")
    compatibleWith(COMPATIBILITY_GEOCACHING)

    // Option definition
    val enableSatellite = booleanOption(
        key = "enable_satellite",
        default = true,
        title = "Enable Satellite Layer",
        description = "Provides high-resolution satellite imagery tiles."
    )

    execute {
        // Transformations executed in BytecodePatchContext
        val classDef = mutableClassDefByOrNull("Lcom/groundspeak/map/TileManager;")
            ?: throw PatchException("Missing TileManager class")
    }
}
```

---

## 2. Composite Feature Patches (`compositeFeaturePatch`)

### Why Composite Patches Exist
A `bytecodePatch` operates strictly over Dalvik DEX bytecode. It cannot directly read or mutate APK asset files (`assets/`), raw resources, or `res/xml` documents. When a single logical feature requires Dalvik bytecode changes *and* companion XML or raw assets, declaring two separate public patches pollutes the UI and `patches-list.json`.

`compositeFeaturePatch` solves this by creating a user-facing bytecode patch and internal companion patches tagged with category `"Internal"`. Because companion patches are instantiated as local objects within the builder function rather than top-level class members, Morphe's reflective `PatchLoader` never exposes them in UI patch lists or `patches-list.json`.

### Composite DSL Structure & Invariants
Defined in `app.aidan.patches.shared.CompositePatch.kt`:

```kotlin
package app.aidan.patches.sezzle.ads

import app.aidan.patches.sezzle.shared.Constants.COMPATIBILITY_SEZZLE
import app.aidan.patches.shared.HermesBundleEditor
import app.aidan.patches.shared.compositeFeaturePatch
import app.morphe.patcher.patch.PatchException

@Suppress("unused")
val hideBannerAdsPatch = compositeFeaturePatch(
    name = "Hide Banner Ads",
    description = "Suppresses banner ads across checkout and storefront views.",
    default = true,
) {
    category("Ads")
    compatibleWith(COMPATIBILITY_SEZZLE)

    // 1. Companion raw resource layer (or resources { ... } for XML)
    rawResources {
        val bundleFile = get("assets/index.android.bundle")
        if (!bundleFile.exists()) throw PatchException("Missing Hermes bundle")

        val editor = HermesBundleEditor(bundleFile.readBytes())
        // Apply asset mutations...
        editor.updateFooterHash()
        bundleFile.writeBytes(editor.toByteArray())
    }

    // 2. Main bytecode layer (bytecode { ... } or execute { ... })
    bytecode {
        // Dexlib2 Dalvik mutations...
    }
}
```

### Invariants for Composite Patches
1. **Concurrent Layer Support**: A composite patch can declare `resources { ... }`, `rawResources { ... }`, or both alongside `bytecode { ... }`. Both companion patches are instantiated as private local objects inside `build()`, keeping them encapsulated from reflective discovery while automatically executing them when the parent feature is selected.
2. **Category Propagation**: The user-facing bytecode patch gets the specified `category(...)` (e.g. `"Ads"`). The companion patches automatically receive `category("Internal")`.
3. **Compatibility Propagation**: Declared `compatibleWith(...)` targets are propagated to both the bytecode patch and the internal companion patches.
4. **Dependency Linking**: The bytecode patch automatically declares `dependsOn(companion)` for all configured companion layers.

---

## 3. Cross-Layer Dependencies & DAGs

When feature requirements exceed a 1-to-1 composite patch, use explicit DAG relationships:

### Scenario 1: Shared Resource Prerequisite Across Multiple Patches
If multiple bytecode patches depend on the same underlying resource patch, declare the resource patch as a standalone top-level `val` and link it using `dependsOn(...)`:

```kotlin
// Standalone resource patch (shared prerequisite)
val bypassSignatureCheckResourcePatch = rawResourcePatch(
    name = "Bypass Signature Check",
    description = "Patches native libandroidsig-lib.so signature check.",
    default = true,
) {
    category("Security")
    compatibleWith(COMPATIBILITY_AFTERSHIP)
    execute { /* native ARM64 edits */ }
}

// Dependent bytecode patch
val removeLoginPatch = bytecodePatch(
    name = "Remove Mandatory Login",
    description = "Removes forced login screen.",
    default = true,
) {
    category("Auth")
    compatibleWith(COMPATIBILITY_AFTERSHIP)
    dependsOn(bypassSignatureCheckResourcePatch) // Explicit dependency
    execute { /* Dalvik edits */ }
}
```

### Scenario 2: Multi-Layer Requirements (XML + Raw Assets + Bytecode)
When a single logical feature requires both Android XML edits and raw asset edits alongside Dalvik bytecode:
Use a single `compositeFeaturePatch` declaring both `resources { ... }` and `rawResources { ... }`. Standalone `resourcePatch` or `rawResourcePatch` declarations should only be used if the resource layer is a shared prerequisite needed by multiple independent features (as in Scenario 1).

### Scenario 3: Linking Java Extension Bridges (`extendWith`)
Whenever Dalvik Smali invokes code compiled from `extensions/extension/src/main/java/`:
```kotlin
val consentGatePatch = bytecodePatch(
    name = "Consent Gate",
    description = "Displays custom consent dialog.",
    default = true,
) {
    category("Privacy")
    compatibleWith(COMPATIBILITY_SEZZLE)
    extendWith("extensions/extension.mpe") // Injects extension classes into target DEX

    execute {
        // Injected Smali calls Lapp/aidan/extension/sezzle/ConsentGate;
    }
}
```
*Note*: `extendWith(...)` packages runtime Java code into target DEX. It does not replace resource patching.

---

## 4. Options and Configuration Metadata

Patches can define typed configuration options that users configure via the Morphe UI or CLI:

### Boolean Option
```kotlin
val suppressForceUpdates = booleanOption(
    key = "suppress_force_updates",
    default = true,
    title = "Suppress Force Updates",
    description = "Bypasses mandatory app version update prompts."
)
```
In execution blocks, read the value using `suppressForceUpdates.value`.

### String Option
```kotlin
val customApiEndpoint = stringOption(
    key = "custom_endpoint",
    default = "https://api.example.com",
    title = "Custom API Host",
    description = "Target hostname for reverse proxy requests."
)
```

### Standard Category Taxonomy
All user-facing patches should use one of the standard category names:
- `"Ads"`: Ad removal, banner suppression, sponsor hiding.
- `"Tracking"`: Analytics, crash reporter stubs, telemetry suppression.
- `"Customization"`: UI themes, icon replacement, font changes, map tile swapping.
- `"Features"`: Unlocking premium capabilities, additional utilities, custom stores.
- `"Security"`: Signature verification bypass, integrity check neutralization, SSL pinning bypass.
- `"Navigation"`: Bottom bar item reordering, shortcut replacement, tab removal.
- `"Dev"`: Developer settings, internal debug menus, logging bridges.
- `"Internal"`: Reserved exclusively for companion patches (filtered from public metadata).

---

## 5. Compatibility Constants

Compatibility metadata is centralized per application under `patches/src/main/kotlin/app/aidan/patches/<app>/shared/Constants.kt`:

```kotlin
package app.aidan.patches.sezzle.shared

import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PackageName

object Constants {
    const val PACKAGE_NAME = "com.sezzle.sezzlemobile"

    val COMPATIBILITY_SEZZLE = Compatibility(
        PackageName(
            name = PACKAGE_NAME,
            versions = arrayOf("14.50.0", "14.51.1", "14.52.0"),
        )
    )
}
```

Patches bind to these constants via `compatibleWith(COMPATIBILITY_<APP>)`. Never hardcode raw package names or version arrays inside individual patch files.
