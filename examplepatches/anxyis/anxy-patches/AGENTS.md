# AGENTS.md

Guide for AI agents working on this repository.

## 1. Core repository philosophy

The repository is not fundamentally:

> "an Alight Motion patch project that happens to allow other apps."

It is:

> **A collection of Morphe patches for Android applications, currently containing Alight Motion work and intended to grow to other applications.**

Existing Alight Motion patches are simply the first/older set of patches in the collection.

Future patches may target:

* Alight Motion
* entirely different Android applications
* multiple versions of the same application
* multiple independent behaviors within the same application
* bytecode, resources, raw APK files, or native binaries where appropriate

The repository should be able to grow naturally into a multi-app patch collection without requiring a separate miniature project for every application.

## 2. Do not over-isolate patches

The previous guidance placed too much emphasis on:

> "never modify existing patches"

and:

> "existing app-specific code is not shared infrastructure."

Those rules are too absolute.

Replace them with a more nuanced principle:

> **Do not modify unrelated existing code merely to make a new patch work. Reuse existing infrastructure or utilities when they are genuinely applicable, and modify shared infrastructure when the new functionality legitimately requires it.**

An existing patch being related to an application does not automatically mean it should be changed.

However, existing code is also not sacred.

A new patch may legitimately:

* reuse a helper
* reuse a fingerprinting technique
* use an existing extension mechanism
* share constants
* add a dependency
* extend shared build infrastructure
* introduce a new generic utility
* improve common infrastructure when the change benefits the collection as a whole

The key question is:

> **Is this change actually part of the new patch's implementation or shared infrastructure, or is the agent modifying unrelated code simply because it is nearby?**

Avoid the latter.

## 3. Use hoo-dles/morphe-patches as the architectural reference

Study `hoo-dles/morphe-patches` when determining how a mature Morphe patch collection organizes multiple applications and patches.

Use it to understand:

* how patches for different applications coexist
* how multiple patches for the same application coexist
* how shared infrastructure is separated from app-specific logic
* how extensions are handled
* how common utilities are reused
* how the repository grows without becoming a collection of completely independent projects
* how naming, packages, dependencies, and compatibility are handled in a real-world Morphe repository

Do **not** assume their exact directory layout, Gradle configuration, package names, or build tooling should be copied here.

The existing `anxy-patches` build system is authoritative.

The reference repository is for **architecture and organization philosophy**, not for blindly copying files.

## 4. Three categories of code

Agents should distinguish between three broad categories.

### A. Morphe framework code

This is provided by Morphe dependencies/APIs.

Examples include the patch APIs, fingerprinting mechanisms, patch annotations/builders, compatibility declarations, and related framework functionality.

Do not modify the external framework inside this repository.

Use it correctly.

### B. Repository infrastructure

This is code belonging to `anxy-patches` itself rather than to a specific Android application.

Examples include:

* build logic
* patch discovery
* packaging
* D8 compilation
* `.mpp` generation
* patch list generation
* genuinely generic helpers/utilities
* common extension/build mechanisms

This code may be modified when necessary.

Do not treat repository infrastructure as immutable.

At the same time, do not alter it casually. A change should have a concrete reason and should be validated against existing patches.

### C. App-specific implementation

This is code whose purpose is tied to a particular Android application.

Examples include:

* fingerprints targeting classes/methods from an app
* patches modifying that app's behavior
* extensions containing classes expected by that app
* app-specific constants
* app/version-specific compatibility declarations
* native patches targeting that app's `.so` files

App-specific code should be organized clearly enough that another agent can tell which application it belongs to.

Do not accidentally treat app-specific implementation as generic infrastructure.

## 5. The desired mental model for adding a patch

When asked to add a new Morphe patch, do **not** begin by asking:

> "Which existing patch can I modify?"

Instead think:

```text
New requested behavior
        ↓
Which Android app is being targeted?
        ↓
What does the target APK actually contain?
        ↓
Which part of the APK needs modification?
        ↓
Which Morphe patch mechanism is appropriate?
        ↓
Can an existing generic repository utility be reused?
        ↓
Can an existing app-specific implementation actually be reused?
        ↓
If yes, reuse it carefully.
If no, create the new implementation.
        ↓
Integrate it into the existing patch collection.
        ↓
Build and validate.
```

Do not assume that every new patch requires a new Gradle module.

Do not assume that every new app requires a new Gradle module.

Do not create new modules merely for aesthetic separation.

Use the minimum repository structure necessary for the implementation, unless the build system or app requirements genuinely require additional isolation.

## 6. Multiple patches for the same application are normal

The repository must explicitly support the idea that an application can have many independent patches.

Conceptually:

```text
Application A
├── Patch A
├── Patch B
├── Patch C
└── Patch D
```

Each patch may alter a different part of the application.

They do not need to be merged into one giant patch.

They may have:

* different fingerprints
* different compatibility requirements
* different dependencies
* different options
* different extension requirements
* different implementation strategies

When adding another patch for an application that already exists in the repository:

1. Locate the existing app-specific organization.
2. Understand the conventions already being used.
3. Determine whether reusable code is genuinely applicable.
4. Add the new patch in the appropriate location.
5. Avoid changing unrelated existing patches.
6. Modify shared infrastructure only when the new patch legitimately requires it.

Do not create artificial separation merely because the patch is new.

## 7. Multiple applications are normal

The same repository may contain:

```text
Application A
    ├── patches...

Application B
    ├── patches...

Application C
    ├── patches...
```

The presence of one application's code does not imply that the repository is dedicated to that application.

When adding a completely new application:

1. Identify the application's package name.
2. Identify supported versions.
3. Inspect the target APK.
4. Determine the required patch type.
5. Determine whether extension code is required.
6. Determine where the implementation belongs within the existing repository architecture.
7. Add only the app-specific and infrastructure changes actually required.
8. Keep the implementation consistent with repository conventions.
9. Build the complete patch collection.
10. Test the resulting `.mpp`.

Do not automatically create a new Gradle project/module.

## 8. Existing Alight Motion code

The current Alight Motion patches and the `extensions/alightmotion` code are useful examples of real Morphe work.

They are **not the definition of how every future patch must work**.

An agent working on another application should not automatically copy:

* Alight Motion package names
* Alight Motion Java classes
* Alight Motion fingerprints
* Alight Motion constants
* Alight Motion extension structure
* Alight Motion assumptions about runtime behavior

Before reusing code from Alight Motion, determine what that code actually represents.

For example:

```text
Generic DEX/build helper
→ potentially reusable

Alight Motion PopupDismisser
→ application-specific

Alight Motion package constant
→ application-specific

Generic fingerprint utility
→ potentially reusable
```

Reuse based on semantics, not file location.

## 9. Learn from existing patches, but do not blindly copy them

Existing patches are valuable references.

Agents should inspect them to learn:

* how the repository invokes Morphe APIs
* local coding conventions
* fingerprint patterns
* compatibility declarations
* extension integration
* build/package expectations
* how patches are named and described

However:

> **An existing patch is an example implementation, not automatically the correct template for every new patch.**

Different applications can require radically different patching strategies.

The agent should understand the target APK first and then choose the implementation.

Do not force a new app to behave structurally like Alight Motion simply because Alight Motion is currently the largest app-specific implementation in the repository.

## 10. Morphe concepts remain important

The guidance should still explain the actual Morphe framework before explaining this repository.

At minimum, cover:

### Patch types

Explain the purpose and appropriate use of:

* `bytecodePatch`
* `resourcePatch`
* `rawResourcePatch`

Do not imply they are interchangeable.

Choose based on what must actually be modified.

### Fingerprinting

Explain that fingerprints are used to locate code in target APKs, particularly where class/method names may be obfuscated.

Explain the importance of:

* stable identifying characteristics
* return types
* parameter types
* instruction patterns
* strings/constants where useful
* avoiding brittle identifiers
* keeping fingerprints narrowly tied to the intended target

Do not over-fingerprint without reason.

### Extensions

Explain that extensions provide additional compiled code that can be merged/injected when a patch needs runtime support beyond simply replacing existing bytecode.

Do not assume every patch requires an extension.

### Compatibility

Explain that patches need appropriate package/version compatibility declarations.

Compatibility is part of patch correctness, not just metadata.

A patch that works for one APK version should not casually claim compatibility with unrelated versions.

### Dependencies

Explain that patches may depend on other patches when the Morphe framework supports/needs such relationships.

Do not introduce dependencies merely for organization.

### `.mpp`

Explain the role of the final Morphe Patch Package and the repository's packaging pipeline.

The `.mpp` is the deliverable consumed by a Morphe-compatible patch manager.

## 11. Repository-specific build system is authoritative

The repository does not necessarily follow the official Morphe template exactly.

The agent must inspect the current implementation before making assumptions.

In particular, understand the actual roles of:

* `patches/`
* `extensions/`
* `patches/build.gradle.kts`
* `settings.gradle.kts`
* root Gradle configuration
* D8 compilation
* `.mpp` bundling
* `patches-list.json`
* `patches-bundle.json`
* patch list generation
* CI/release automation

Do not replace the custom build system with the official template merely because the template is simpler or newer.

Do not migrate the project to another architecture unless explicitly requested.

## 12. Generated files

Understand which files are generated rather than treating them as ordinary handwritten source.

In particular, investigate:

* `patches-list.json`
* `patches-bundle.json`
* generated `.mpp` artifacts

When a build or generation task updates these files, do not manually edit them unless the project explicitly expects that.

Always determine the source-of-truth first.

## 13. Native patching

`HexPatchBuilder` may be used for patches involving native binaries.

Document it as a legitimate Morphe patching technique, not as an Alight Motion-specific feature.

Use native patching only when the desired behavior actually resides in native code.

Before using it:

* identify the correct `.so`
* identify the correct architecture
* verify the target bytes/pattern
* make the smallest safe modification
* ensure the patch is version-compatible
* avoid assuming the same native layout across versions

The existing native-patching utility should remain available for future app-specific patches.

## 14. Agent behavior rules

Before editing:

1. Read the repository guidance.
2. Inspect the relevant app-specific code.
3. Inspect the relevant build/integration code.
4. Identify the smallest correct change.
5. Determine whether an existing helper is generic or app-specific.
6. Confirm which files actually need modification.

While editing:

* Keep changes focused.
* Follow existing repository conventions.
* Prefer adding a new patch over modifying an unrelated patch.
* Reuse generic infrastructure where appropriate.
* Do not introduce needless modules.
* Do not rename/reorganize unrelated code.
* Do not perform broad cleanup unless requested.
* Do not rewrite working infrastructure to satisfy personal stylistic preferences.

After editing:

* Build the relevant code.
* Run the repository's validation/tests.
* Confirm the patch is actually discovered/packageable.
* Check generated outputs.
* Verify that unrelated patches still build.
* Review the final diff for accidental changes.

## 15. What "cleanly added" means

A clean new patch does **not** necessarily mean:

> "No existing file was touched."

A clean change means:

> **Only the code and infrastructure that actually need to change were changed, and the resulting patch fits naturally into the repository's existing Morphe collection.**

Examples:

### Good

```text
Add NewAppPatch.kt
Add NewAppFingerprints.kt
Add required extension code
Update necessary build registration
Regenerate patch metadata
```

### Also good when genuinely required

```text
Add generic helper utility
Refactor shared build code to support a legitimate new patch type
Update common extension infrastructure
```

### Bad

```text
Rewrite Alight Motion patches
Rename unrelated packages
Create five new Gradle modules for one patch
Replace the entire build system
Reorganize the repository for aesthetic reasons
```

## 16. The priority order

When making decisions, use this order:

```text
1. Correctness for the target APK
2. Correct Morphe API usage
3. Compatibility with the target app/version
4. Compatibility with the existing repository build
5. Consistency with repository conventions
6. Reuse of genuinely applicable infrastructure
7. Minimal unnecessary change
```

Do not sacrifice correctness merely to avoid touching an existing shared utility.

Do not sacrifice repository stability merely to make the new implementation look architecturally elegant.

## 17. Before implementing the next patch

Do not immediately start writing patch code.

First perform a short reconnaissance of:

* the target APK
* the relevant DEX/classes
* relevant native libraries if applicable
* existing patches in this repository that use similar Morphe techniques
* the official Morphe documentation for the APIs involved
* `hoo-dles/morphe-patches` for comparable organizational patterns where useful

Then explain internally/briefly:

```text
Target application:
Target version(s):
Desired behavior:
Likely patch type:
Target method/resource/native file:
Fingerprint strategy:
Extension required?:
Existing reusable infrastructure:
Files expected to change:
```

Only after that should implementation begin.

## Final principle

The repository should evolve like a **real Morphe patch collection**, not like a collection of isolated one-off experiments.

Use existing work as knowledge.

Reuse code when it is genuinely reusable.

Keep app-specific implementations understandable.

Add new patches alongside existing patches.

Allow multiple patches for the same application.

Allow many different applications to coexist.

Protect unrelated working code from unnecessary edits.

And above all:

> **Understand the target application and the Morphe framework first; then fit the new patch into the repository. Do not force every new patch into the shape of the first patches that happened to be written.**

---

## How Morphe Patches Work

Before touching this repo, understand the framework.

### Patch Types

Morphe Patcher supports three patch types:

- **`bytecodePatch`** — Modifies Dalvik VM bytecode (methods, classes, instructions). This is the most common type.
- **`resourcePatch`** — Modifies decoded Android resources (XML, images, etc.). Decodes and rebuilds resources, which is slower.
- **`rawResourcePatch`** — Modifies arbitrary files inside the APK (e.g., native `.so` libraries). Does not decode resources.

All patches define an `execute` block containing the actual modification logic.

### Fingerprints

A fingerprint is a declarative description used to locate a specific method in an obfuscated APK. Fingerprints match by:

- **definingClass** — The class containing the target method (supports partial matching for obfuscated names)
- **name** — Exact method name (only for non-obfuscated methods)
- **accessFlags** — Required access modifiers (public, final, static, etc.)
- **returnType** — Method return type
- **parameters** — Method parameter types
- **filters** — Ordered instruction-level matchers (strings, method calls, field accesses, opcodes, literals)
- **strings** — Unordered string literal matches (use `filters` with `string()` instead for most cases)

**Critical rule:** Never fingerprint by obfuscated names. Obfuscated class/method names change between app versions. Fingerprint by structural characteristics (return type, parameters, instruction patterns) instead.

Example pattern:

```kt
object SomeFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("L"),
    filters = listOf(
        string("unique string that survives obfuscation"),
        methodCall(name = "someMethod"),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately())
    )
)
```

Fingerprints are typically declared in a `Fingerprints.kt` file per app/package, but can also be local variables when one fingerprint depends on another's match result.

### Extensions

An extension is a precompiled DEX file merged into the target APK at patch time. Extensions contain runtime code (Java/Kotlin classes) that the patched app will execute. Use extensions when:

- The patch needs complex logic that's impractical as inline smali
- Multiple patches share runtime helper code
- The patch needs ContentProviders, Services, or other Android components

Extensions are referenced in patches via `extendWith("path/to/extension.mpe")` and called with `invoke-static` instructions.

### Compatibility

Each patch declares which app package and versions it supports:

```kt
val COMPATIBILITY = Compatibility(
    name = "App Name",
    packageName = "com.example.app",
    appIconColor = 0xFF0000,
    targets = listOf(
        AppTarget(version = "1.0.0"),
        AppTarget(version = "0.9.5")
    )
)
```

- If `compatibleWith` is not used, the patch is treated as compatible with any package
- If a package is specified with no versions, it's compatible with any version of that package
- Use `targets` to declare specific known-compatible versions

### Dependencies

Patches can depend on other patches via `dependsOn()`. Dependencies execute first. If a dependency fails, the dependent patch is skipped.

### Finalization

Patches can have a `finalize` block that runs after all dependent patches have executed, in reverse order. Useful for cleanup (closing files, etc.).

### The .mpp Bundle

The output of this repo is a `.mpp` file — a JAR containing:

- Compiled patch classes (`.class` files)
- Extension DEX files (if any)
- `META-INF/MANIFEST.MF` with metadata (name, version, author, patcher version)

Morphe Manager and Morphe Desktop load `.mpp` files and apply the patches they contain to target APKs.

## How This Repo Is Structured

```
anxy-patches/
├── patches/                          # Main patch module (Kotlin JVM)
│   ├── build.gradle.kts              # Custom build: D8 compilation, .mpp bundling
│   └── src/main/kotlin/
│       └── anxyis/morphe/
│           ├── patches/
│           │   ├── alightmotion/     # Alight Motion patches
│           │   │   ├── Constants.kt
│           │   │   ├── Fingerprints.kt
│           │   │   ├── AmzNoPopupPatch.kt
│           │   │   └── AlightMotionProNoPopupPatch.kt
│           │   └── shared/
│           │       └── HexPatchBuilder.kt
│           └── util/
│               └── PatchListGenerator.kt
├── extensions/
│   └── alightmotion/                 # Android library for Alight Motion runtime code
│       ├── build.gradle.kts
│       └── src/main/java/.../
│           ├── NoPopupSeedProvider.java
│           └── PopupDismisser.java
├── patches-list.json                 # Auto-generated patch metadata
├── patches-bundle.json               # Release download pointer
└── gradle.properties                 # Version, JVM args
```

**Key detail:** This repo uses a **custom build pipeline**, not the official `app.morphe.patches` Gradle plugin. The `patches/build.gradle.kts` manually handles:

1. D8 compilation of extension classes into `classes.dex`
2. `.mpp` JAR bundling with manifest
3. `PatchListGenerator` execution for metadata

When adding patches, you work within this existing build system. You do not need to modify the build unless your patch requires a new extension module or changes to the D8 pipeline.

## Adding a New Patch for an Existing App

When adding a patch for an app that already has patches in this repo (e.g., another Alight Motion patch):

### Step 1: Create the patch file

Create a new Kotlin file in the appropriate package directory:

```
patches/src/main/kotlin/anxyis/morphe/patches/alightmotion/YourNewPatch.kt
```

### Step 2: Define the patch

```kt
package anxyis.morphe.patches.alightmotion

import app.morphe.patcher.patch.bytecodePatch
import anxyis.morphe.patches.alightmotion.Constants.COMPATIBILITY_AMZ_MOTION

val yourNewPatch = bytecodePatch(
    name = "Descriptive Patch Name",
    description = "Third-person present-tense description of what this does.",
    default = true
) {
    compatibleWith(COMPATIBILITY_AMZ_MOTION)

    execute {
        // Your fingerprint-based modifications here
    }
}
```

### Step 3: Add fingerprints if needed

If your patch targets methods not already fingerprinted, add them to `Fingerprints.kt` or create a new fingerprints file in the same package.

### Step 4: Add extension code if needed

If your patch requires runtime classes, add Java/Kotlin source files to `extensions/alightmotion/src/main/java/...` and reference them via `extendWith()`.

### Step 5: Build and test

```bash
./gradlew :patches:build
./gradlew test
```

## Adding Patches for a New App

When adding patches for an app not yet in this repo:

### Step 1: Determine the scope

Decide what your patch needs:

- **Patch files only** — A new package under `patches/src/main/kotlin/anxyis/morphe/patches/yourapp/` with patch and fingerprint files. No build changes needed.
- **Extension code** — If your patch requires runtime classes, you need to either add them to the existing extension module (if the code is generic) or create a new extension module (if app-specific).
- **New Gradle module** — Only if you need a separate Android library module for extensions with different configuration.

Start with the minimum. A new package with patch files is usually sufficient for bytecode-only patches.

### Step 2: Create the package structure

```
patches/src/main/kotlin/anxyis/morphe/patches/yourapp/
├── Constants.kt          # Compatibility declarations
├── Fingerprints.kt       # Method locators
└── YourPatch.kt          # The patch itself
```

### Step 3: Define compatibility

```kt
package anxyis.morphe.patches.yourapp

import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.AppTarget

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Target App Name",
        packageName = "com.target.app",
        appIconColor = 0x000000,
        targets = listOf(
            AppTarget(version = "1.0.0")
        )
    )
}
```

### Step 4: Write fingerprints

Use jadx or a similar decompiler to analyze the target APK. Identify methods by their structural characteristics, not obfuscated names. See [Morphe fingerprinting docs](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/2_2_1_fingerprinting.md) for the full filter API.

### Step 5: Write the patch

```kt
package anxyis.morphe.patches.yourapp

import app.morphe.patcher.patch.bytecodePatch
import anxyis.morphe.patches.yourapp.Constants.COMPATIBILITY

val yourPatch = bytecodePatch(
    name = "What It Does",
    description = "Detailed description in third person, present tense.",
    default = true
) {
    compatibleWith(COMPATIBILITY)

    execute {
        SomeFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )
    }
}
```

### Step 6: Register new module (only if needed)

If you created a new extension module, register it in `settings.gradle.kts`:

```kotlin
include(":patches")
include(":extensions:alightmotion")
include(":extensions:yourapp")  // Add this
```

And update `patches/build.gradle.kts` if the build needs to dex the new extension.

## Native Binary Patching

`HexPatchBuilder` in `patches/src/main/kotlin/anxyis/morphe/patches/shared/HexPatchBuilder.kt` provides utilities for patching native `.so` (ELF) libraries:

- **`bytesFromHex(hex: String)`** — Converts a hex string to a byte array
- **`findPattern(data: ByteArray, pattern: ByteArray)`** — Finds the offset of a byte pattern within a binary

### When to use

Use native binary patching when:

- The target behavior lives in a native library (`.so` file), not in Dalvik bytecode
- You need to NOP out a function call, replace an instruction, or modify data in a compiled library
- Bytecode-level patching cannot reach the target code (e.g., it's in a JNI native implementation)

### How it works

1. Extract the `.so` file from the APK using `get("lib/arm64-v8a/libsomething.so")`
2. Read it as bytes
3. Use `findPattern` to locate the target bytes
4. Replace the bytes (e.g., NOP instruction `0x1F2003D5` for AArch64)
5. Write the modified bytes back

### Example use case

A patch that disables a native integrity check:

```kotlin
execute {
    val libFile = get("lib/arm64-v8a/libcheck.so")
    val data = libFile.readBytes()

    val pattern = HexPatchBuilder.bytesFromHex("FF 83 02 D1") // sub sp, sp, #0x20
    val offset = HexPatchBuilder.findPattern(data, pattern)
    if (offset == -1) throw PatchException("Pattern not found in native library")

    // NOP the function prologue
    val nop = HexPatchBuilder.bytesFromHex("1F 20 03 D5")
    for (i in nop.indices) data[offset + i] = nop[i]

    libFile.writeBytes(data)
}
```

## Conventions

### Patch naming

Name patches after what they do: "Disable ads", "Remove update check", "Bypass signature verification".

### Patch descriptions

Write in third person, present tense, ending with a period. Example: "Disables the startup dialog displayed on first launch."

### Fingerprint naming

Name fingerprints after what the target method appears to do: `ShowAdsFingerprint`, `SignatureCheckFingerprint`. If the method is fully obfuscated, describe its context: `StartupDialogBuilderFingerprint`.

### Patch minimalism

Keep patches small. Complex logic belongs in extensions (precompiled DEX), not inline in the patch. Patches should ideally do one thing.

### Documentation

Document non-obvious parts. Explain why a method is patched, what a block of instructions does, or why a specific fingerprint approach was chosen.

## Build & Test Commands

```bash
# Build the .mpp patch bundle
./gradlew :patches:build

# Run JUnit 5 tests
./gradlew test

# Generate patches-list.json metadata
./gradlew generatePatchesList
```

The `.mpp` output lands in `patches/build/libs/patches-{version}.mpp`.

## Common Pitfalls

**Forgetting to register new modules.** If you create a new extension module in `extensions/`, it must be added to `settings.gradle.kts` or the build won't find it.

**Over-fingerprinting.** Including obfuscated class names, method names, or version-specific strings in fingerprints. These break on app updates. Use structural matchers (return types, parameters, instruction filters).

**Modifying existing patches.** The most common and most damaging mistake. If your new patch seems related to an existing one, that does not mean they should be merged or that the existing one should be updated.

**Version mismatches.** Ensure the `version` in `gradle.properties` matches what you intend to release. The build pipeline and semantic-release depend on this.

**Skipping the test step.** Always run `./gradlew test` after making changes. The regression tests verify that all patch objects can be instantiated.

**Not understanding the target APK.** Before writing fingerprints, decompile the target APK with jadx. Understand the code structure. Fingerprints written without analysis will be fragile or wrong.
