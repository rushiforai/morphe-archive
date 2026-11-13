---
name: patch-anatomy
description: How to write Morphe patches — bytecodePatch DSL, compatibility, extensions, options, finalization. Use when creating new patches or understanding patch structure.
---

> **When to use:** Writing patches — bytecodePatch DSL, compatibility declarations, extensions, options, finalization. Keep patches minimal — put complex logic in extensions.

# Morphe Patch Anatomy — Official Reference

> ⚠️ Pinned source: morphe-patcher `6f189f9`. Official docs may lag the source — the pinned
> source wins if anything contradicts this file.

## Patch Types

| Type | Use When | Performance |
|------|----------|-------------|
| `bytecodePatch` | Modifying Dalvik bytecode | Fast — no resource decoding |
| `rawResourcePatch` | Modifying raw files/assets | Medium |
| `resourcePatch` | Modifying decoded XML | Slow — decodes all resources |

Always prefer `bytecodePatch`.

## Complete Patch Example

```kotlin
val COMPATIBILITY_XYZ = Compatibility(
    packageName = "app.xyz.mobile",
    name = "XYZ App",
    apkFileType = ApkFileType.XAPK,
    appIconColor = 0xFF3300,   // 0xRRGGBB — six-digit hex, zero alpha byte
    targets = listOf(
        AppTarget(version = "2.0.0"),
        AppTarget(version = "1.0.42"),
    )
)

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Disables ads in the app.",
    default = true               // omit or set false for universal patches (enforced by builder)
) {
    compatibleWith(COMPATIBILITY_XYZ)
    dependsOn(disableAdsResourcePatch)
    extendWith("disable-ads.mpe")   // ← extension artifact is .mpe, not .mpp

    execute {
        showAdsFingerprint.method.addInstructions(0, """
            invoke-static {}, LDisableAdsPatch;->shouldDisableAds()Z
            move-result v0
            return v0
        """)
    }

    finalize {
        // Post-processing after all dependent patches execute
    }
}
```

## `addInstructions` — Deprecation Note

`addInstructions(String)` (no-index form) is **deprecated**. Always supply the index:

```kotlin
// ✅ Current
method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")

// ❌ Deprecated — will be deleted
method.addInstructions("const/4 v0, 0x1\nreturn v0")
```

## Patch Options

```kotlin
val patch = bytecodePatch(name = "Configurable") {
    val value by stringOption(name = "Color")
    val custom by option<String>(name = "Custom option")
    execute { println(value) }
}
```

Options can be shared across patches:
```kotlin
val sharedOption = stringOption(name = "Shared")
bytecodePatch(name = "A") { val v by sharedOption() }
bytecodePatch(name = "B") { val v by sharedOption() }
```

## Extensions (Runtime DEX Code)

Extensions are precompiled DEX files (`.mpe`) merged into the patched app before patch execution.

```java
public class ComplexPatch {
    public static void doSomething() { /* complex logic */ }
}
```

Referenced in patches:
```kotlin
val patch = bytecodePatch(name = "Complex") {
    extendWith("complex-patch.mpe")   // ← .mpe not .mpp
    execute {
        fingerprint.method.addInstructions(0, "invoke-static {}, LComplexPatch;->doSomething()V")
    }
}
```

### `extendWithAll` — variable extension count

When the set of extensions is not known until patch time (e.g., determined by a dependency):
```kotlin
extendWithAll(Supplier { listOf(stream1, stream2) })
```

## Finalization Order

```kotlin
val patch = bytecodePatch(name = "Main") {
    dependsOn(bytecodePatch(name = "Dep") {
        execute { print("1") }
        finalize { print("4") }
    })
    execute { print("2") }
    finalize { print("3") }
}
// Output: 1234 (execute in dependency order, finalize in reverse)
```

## Compatibility Declaration

```kotlin
val COMPAT = Compatibility(
    packageName = "com.example.app",  // must match Android package name regex
    name = "App Name",                // required when packageName is non-null, must be non-blank
    description = "Optional description.",
    apkFileType = ApkFileType.XAPK,   // see ApkFileType below
    appIconColor = 0x6200EE,          // 0xRRGGBB — alpha byte MUST be 0x00
    signatures = setOf(
        "a1b2c3...64hexchars"         // SHA-256 from apksigner verify --print-certs, 64 hex chars
    ),
    targets = listOf(                 // must be non-empty; newest first
        AppTarget(version = "2.0.0", minSdk = 28, isExperimental = true),
        AppTarget(version = "1.0.0", minSdk = 26),
    )
)
```

### Rules
- `packageName` + `name` go together — if `packageName` is set, `name` must also be non-blank.
- `appIconColor` is `0xRRGGBB` (six-digit). The alpha byte must be `0x00` (zero) or the
  constructor throws. E.g. `0x6200EE` ✅, `0xFF6200EE` ❌.
- `signatures` — each string must be exactly 64 hex characters (SHA-256).
- `targets` — must be non-empty. Use `AppTarget(version = null)` for "any version".
- Duplicate versions in `targets` throw `IllegalArgumentException`.

### `including` / `excluding`

```kotlin
val COMPAT_PLUS = COMPAT.including(AppTarget(version = "3.0.0"))
val COMPAT_MINUS = COMPAT.excluding("1.0.0", "1.0.42")
```

## ApkFileType Values

```kotlin
enum class ApkFileType {
    APK,           // single APK (recommended)
    APK_REQUIRED,  // single APK (required — other formats rejected)
    APKM,          // APKMirror bundle (recommended)
    APKM_REQUIRED, // APKMirror bundle (required)
    APKS,          // bundletool APKS (recommended)
    APKS_REQUIRED, // bundletool APKS (required)
    XAPK,          // APKPure XAPK (recommended)
    XAPK_REQUIRED, // APKPure XAPK (required)
}
```

Non-`_REQUIRED` variants are recommendations; `_REQUIRED` variants enforce the format.

## AppTarget

```kotlin
data class AppTarget(
    val version: String?,                         // null = any version
    val versionCodes: Map<SupportedAbi, Int>? = null,
    val isExperimental: Boolean = false,
    val minSdk: Int? = null,
    val description: String? = null,
)

enum class SupportedAbi { ARM64_V8A, ARMEABI_V7A, X86_64, X86 }
```

`versionCodes` is only needed for apps that ship multiple releases per user-visible version
(e.g., Meta apps). Pass a single `Int` overload to use the same code for all ABIs:

```kotlin
AppTarget(version = "2.0.0", versionCode = 20000)
// expands to Map<SupportedAbi, Int> for all entries
```

## Patch Availability API

Declare how a patch behaves for a given install target (Manager / CLI evaluates before selection):

```kotlin
import app.morphe.patcher.patch.InstallerType      // STANDARD, MOUNT, SHIZUKU
import app.morphe.patcher.patch.ApkArchitecture    // ARM64_V8A, ARMEABI_V7A, X86_64, X86, UNIVERSAL
import app.morphe.patcher.patch.PatchAvailability  // ENABLED, DISABLED, REQUIRED, UNAVAILABLE
import app.morphe.patcher.patch.AvailabilityResolver

val patch = bytecodePatch(name = "Root Only Feature") {
    availability { installer, arch ->
        if (installer == InstallerType.MOUNT) PatchAvailability.ENABLED
        else PatchAvailability.UNAVAILABLE
    }
    execute { /* … */ }
}
```

Patches without an `availability` block fall back to their `default` flag.

## `category`

Optional free-form group for UI display:

```kotlin
val patch = bytecodePatch(name = "Remove Banner Ads") {
    category("Ads")
    execute { /* … */ }
}
```

## `default` Flag Warning

Universal patches (no `compatibleWith`) with `default = true` are overridden to `false` with a
console warning at build time. Always set `default = false` for universal patches.

## Project Structure

```
patches/src/main/kotlin/app/<group>/patches/
├── shared/              # Shared across all apps
├── <app>/
│   ├── shared/Constants.kt
│   └── <category>/
│       ├── Fingerprints.kt
│       └── SomePatch.kt
extensions/<name>/src/main/java/   # Extension code (produces .mpe)
```

## Conventions

- Name patches after what they do: "Disable ads", "Remove watermark"
- Description in third person, present tense, ending with period
- Name fingerprints with best guess of target method purpose
- Keep patches minimal — put complex logic in extensions
- Add `@Suppress("unused")` on top-level patch vals
- Document non-obvious code

## Key Imports

```kotlin
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import app.morphe.patcher.methodCall
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.newInstance
import app.morphe.patcher.instanceOf
import app.morphe.patcher.checkCast
import app.morphe.patcher.opcode
import app.morphe.patcher.literal
import app.morphe.patcher.resourceLiteral
import app.morphe.patcher.anyInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.InstallerType
import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
```
