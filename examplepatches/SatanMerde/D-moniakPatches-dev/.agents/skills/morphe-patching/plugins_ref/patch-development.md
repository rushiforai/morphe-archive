# Morphe Patch Development (Patcher 1.14.1 baseline)

Read `upstream-baseline.md` first, then inspect the configured repository. Its actual dependency
versions and working examples take precedence over this reference.

## Patch types and lifecycle

- `bytecodePatch`: Dalvik bytecode; prefer when resources need no decoding.
- `rawResourcePatch`: arbitrary raw files/assets without resource decoding.
- `resourcePatch`: decoded resources/manifest; highest overhead.

Dependencies execute first. `finalize` blocks execute in reverse patch order.

```kotlin
@Suppress("unused")
val featurePatch = bytecodePatch(
    name = "Feature",
    description = "Enables the feature.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_APP)
    dependsOn(resourceDependency)
    extendWith("extensions/extension.mpe")
    execute {
        FeatureFingerprint.method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
    }
    finalize { /* post-processing */ }
}
```

`addInstructions(String)` without an index is deprecated. Use
`addInstructions(index, smali)`. `.mpe` is an extension DEX artifact; `.mpp` is a patch bundle.

For extension counts known only after dependencies execute:

```kotlin
extendWithAll(Supplier { derivedExtensionStreams })
```

The legacy extension stream getter/setter are deprecated; use `extendWith(Supplier)` or
`extendWithAll(Supplier)`.

## Compatibility

```kotlin
val COMPATIBILITY_APP = Compatibility(
    packageName = "com.example.app",
    name = "Example App",
    description = "Optional app description.",
    apkFileType = ApkFileType.XAPK,
    appIconColor = 0x6200EE, // optional 0xRRGGBB; high alpha byte must be zero
    signatures = setOf(
        "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef",
    ),
    targets = listOf(
        AppTarget(
            version = "2.0.0",
            versionCodes = mapOf(SupportedAbi.ARM64_V8A to 20000),
            isExperimental = true,
            minSdk = 28,
            description = "Optional target note.",
        ),
        AppTarget(version = "1.0.0", minSdk = 26),
    ),
)
```

Rules:

- A non-null `packageName` requires a nonblank `name`.
- `appIconColor` is optional and uses a six-digit `0xRRGGBB` integer (or `"#RRGGBB"`
  constructor); `0xFF6200EE` is invalid.
- Every signature is a 64-hex SHA-256 digest from `apksigner verify --print-certs`.
- Targets are nonempty. Omit them for the constructor default `AppTarget(version = null)`, or
  declare that explicitly for any version. Duplicate target versions are rejected.
- `versionCodes` is for apps with multiple releases under one visible version.
- `SupportedAbi`: `ARM64_V8A`, `ARMEABI_V7A`, `X86_64`, `X86`.
- `COMPATIBILITY_APP.including(...)` and `.excluding(version...)` derive variants.

`ApkFileType` values:

```text
APK  APK_REQUIRED  APKM  APKM_REQUIRED
APKS APKS_REQUIRED XAPK  XAPK_REQUIRED
```

Non-required values are recommendations; `_REQUIRED` enforces the format.

## Availability, category, and defaults

```kotlin
val rootFeaturePatch = bytecodePatch(name = "Root feature", default = false) {
    category("Features")
    availability { installer, _ ->
        if (installer == InstallerType.MOUNT) PatchAvailability.ENABLED
        else PatchAvailability.UNAVAILABLE
    }
}
```

`InstallerType`: `STANDARD`, `MOUNT`, `SHIZUKU`. `ApkArchitecture`: `ARM64_V8A`,
`ARMEABI_V7A`, `X86_64`, `X86`, `UNIVERSAL`. `PatchAvailability`: `ENABLED`, `DISABLED`,
`REQUIRED`, `UNAVAILABLE`. Resolvers must be pure and cheap. Without one, callers use `default`.
The old `use` property is deprecated. Universal patches declared `default = true` are forced to
false with a warning.

## Fingerprints and instruction mutation

Use named `object X : Fingerprint(...)` declarations, exact smali access flags, stable SDK calls,
and ordered filters. See `fingerprinting.md`. Modify several indexes highest-to-lowest or
clear/rematch after a mutation.

Common instruction helpers:

```kotlin
method.addInstruction(index, "return-void")
method.addInstructions(index, "const/4 v0, 0x1\nreturn v0")
method.addInstructionsWithLabels(index, smali, ExternalLabel("resume", instruction))
method.removeInstruction(index)
method.removeInstructions(index, count)
method.replaceInstruction(index, "const/4 v0, 0x0")
val instruction = method.getInstruction<OneRegisterInstruction>(index)
```

Use `instruction.registersUsed` from the patches library when available. Preserve `move-result*`
adjacency, branch labels, try/catch boundaries, wide-register pairs, and parameter registers.

## Resource context APIs

```kotlin
val file = get("res/values/strings.xml")
delete("lib/x86/")
document("res/values/strings.xml").use { doc -> /* mutate DOM */ }
val nativeEntries = listApkEntries("lib/")
```

`listApkEntries` sees original archive entries, including native libraries that are not staged.
The list does not reflect changes made earlier in the same patch run.

## Typical source layout

Follow the configured repository rather than imposing a package:

```text
patches/src/main/kotlin/<group>/patches/<app>/
├── shared/Constants.kt
└── <category>/
    ├── Fingerprints.kt
    └── <Name>Patch.kt
extensions/<name>/src/main/java/  # produces .mpe
```

Read existing files before editing, keep changes minimal, and copy exact imports from pinned
source or a compiling repository example instead of guessing them.

## Core imports

```kotlin
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.anyInstruction
import app.morphe.patcher.checkCast
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.instanceOf
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.opcode
import app.morphe.patcher.resourceLiteral
import app.morphe.patcher.string
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.InstallerType
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.SupportedAbi
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.resourcePatch
```

Only import symbols actually used.
