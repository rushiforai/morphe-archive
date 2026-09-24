# Repository Guidelines

## Project Overview

This repository develops binary bytecode and asset patches for Android applications using the **Morphe Patching Framework** (`app.morphe.patches` Gradle plugin v1.3.4, Morphe Patcher v1.14.0).

The primary target application is **Sezzle: Buy Now, Pay Later** (`com.sezzle.sezzlemobile`), a hybrid Android application built with React Native Fabric and compiled to **Hermes Bytecode v98**. The patch suite produces a Morphe Patch Package (`.mpp`) bundle designed to:
- **Lock Down Integrity & Security**: Disable Microsoft CodePush OTA updates so the app cannot override patched local assets, and inject a mandatory native consent gate (`ConsentGate.java`) on first launch.
- **Eliminate Ads & Telemetry**: Neutralize 13 commercial ad networks, survey providers, and telemetry SDKs at the Dalvik bytecode level while zeroing the Google Play Advertising ID (AAID).
- **Streamline UI**: Unmount the commercial store feed, rename the "Shop" bottom tab to "Home", unmount the Rewards (`EarnTab`) feature, and remove phone login controls in favor of Google authentication.

---

## Architecture & Data Flow

Patches operate across three distinct architectural layers to modify the target APK:

```
                               Target: base.apk
                                      |
       +------------------------------+------------------------------+
       |                              |                              |
       v                              v                              v
[ Dalvik / Smali Layer ]   [ Hermes Bytecode Layer ]      [ Native Extension Layer ]
Dexlib2 AST Rewriting      HBC v98 Binary Manipulation    Java Bytecode Merging
- DisableCodePushOta       - RenameShopToHome             - ConsentGate.java
- PatchConsentScreen       - RemoveRewards                  (compiled to
- RemoveAdsAndTracking     - CleanAuthentication            extension.mpe)
       |                              |                              |
       +------------------------------+------------------------------+
                                      |
                                      v
                             sezzle-patched.apk
```

### 1. Hermes Bytecode Layer (HBC v98)
- **Editor**: `patches/src/main/kotlin/app/finance/patches/sezzle/shared/HermesBundleEditor.kt`.
- **Target Asset**: `assets/index.android.bundle` (Hermes Bytecode v98, magic bytes `c6 1f bc 03 c1 03 19 1f`).
- **Mechanism**:
  - Direct opcode substitution (e.g., replacing `useIsShowEarnTabEnabled` with `LoadConstFalse r1` [`0x96 0x01`] and `Ret r1` [`0x76 0x01`]).
  - Array mutation and component unmounting (resizing container children arrays and setting promotional components to `LoadConstUndefined` [`0x93`]).
  - String table operand redirection (pointing `LoadConstString` to alternate localization keys).
  - **Donor String Recycling**: Hermes bundles cannot expand string storage without corrupting cross-section offsets. New text replaces unused donor strings (e.g., storybook debug strings) of equal or greater length, zero-padding remainder bytes.
  - **Integrity Digest**: The Hermes engine verifies a trailing 20-byte SHA-1 digest. `editor.updateFooterHash()` recalculates this hash after any byte modifications.

### 2. Dalvik / Smali Bytecode Layer (`bytecodePatch`)
- **Engine**: Dexlib2 AST manipulation through Morphe DSL (`mutableClassDefBy`, `addInstructions`).
- **Mechanism**:
  - Entrypoint method neutralization: prepends early exits (`return-void`, `const/4 v0, 0x0 \n return v0`, or dummy string returns) to prevent ad/tracker initialization without breaking React Native's `NativeModule` registry.
  - Call interception: replaces the return register of `CodePush.getJSBundleFile()` in `MainApplication` with `null` (`const/4 vX, 0x0`), forcing React Native's `DefaultReactHost` to fall back to the embedded `assets/index.android.bundle`.
  - Lifecycle hooking: injects static calls to native extension methods in `MainActivity.onCreate` before `return-void`.

### 3. Native Extension Layer (`extensions/extension.mpe`)
- **Module**: `:extensions:extension` compiles Java classes into a Morphe Patch Extension (`.mpe`).
- **Component**: `app.finance.extension.sezzle.ConsentGate` presents an un-cancelable `AlertDialog` tracking acknowledgment in `SharedPreferences`.
- **Packaging**: Merged into patch bundles via `extendWith("extensions/extension.mpe")` and injected into the target APK's DEX.

### Data Flow
1. **Build Time**: Gradle builds `:extensions:extension` into `.mpe`, compiles Kotlin patch definitions into `.mpp`, and executes `PatchListGeneratorKt` to emit `patches-list.json`.
2. **Patch Time (Morphe CLI / Desktop)**: Morphe unzips the target APK, validates package/version compatibility, modifies Dalvik classes, merges `.mpe` classes into DEX, parses and edits `index.android.bundle`, recalculates the SHA-1 footer, and repacks/signs the APK.
3. **Runtime**: `MainActivity.onCreate` triggers `ConsentGate.maybeShow()`. `MainApplication` returns `null` for CodePush bundle paths, executing the patched embedded Hermes bundle. Ad and analytics calls hit instant return opcodes.

---

## Key Directories

```
.
├── patches/                               # Core Morphe patch definitions module
│   ├── build.gradle.kts                   # Patch bundle metadata & task configuration
│   └── src/main/kotlin/
│       ├── app/finance/patches/sezzle/    # Sezzle patch implementations
│       │   ├── ads/                       # Ad and tracker removal (13 SDKs neutralized)
│       │   ├── auth/                      # Authentication flow sanitization
│       │   ├── navigation/                # Bottom tab renaming and UI de-bloat
│       │   ├── security/                  # CodePush OTA lock and consent dialog hook
│       │   └── shared/                    # Constants, compatibility, HermesBundleEditor
│       └── util/                          # Build-time utilities (PatchListGenerator.kt)
├── extensions/extension/                  # Native Android extension module
│   ├── build.gradle.kts                   # Compiles Java sources to extension.mpe
│   └── src/main/
│       ├── AndroidManifest.xml            # Minimal extension manifest
│       └── java/app/finance/extension/    # Native Java code (ConsentGate.java)
├── docs/                                  # Reverse engineering specs & deep dive docs
├── gradle/                                # Gradle wrapper and libs.versions.toml
└── .github/                               # CI/CD workflows, issue templates, release scripts
```

---

## Development Commands

### Building & Compilation
```bash
# Compile patch bundle (.mpp) and extension (.mpe)
./gradlew buildAndroid
# Output: patches/build/libs/patches-<version>.mpp

# Build only the patches module
./gradlew :patches:buildAndroid

# Clean build verification (matches CI test step)
./gradlew :patches:buildAndroid clean --no-daemon

# Standard Gradle build (:patches:build finalizes with buildAndroid)
./gradlew build
```

### Metadata & Documentation Tasks
```bash
# Generate patches-list.json from compiled .mpp artifacts
./gradlew generatePatchesList

# Synchronize README.md patch tables with patches-list.json
python3 .github/scripts/generate_patches_readme.py <owner/repo> <branch> patches-list.json README.md
```

### Patch Application (Local Verification)
```bash
# Apply compiled patches to a base APK using Morphe Desktop CLI
java -jar morphe-desktop.jar patch \
  --patches patches/build/libs/patches-1.0.0.mpp \
  --out sezzle-patched.apk \
  base.apk
```

### Release Pipeline (Local Dry-Run)
```bash
# Install release automation dependencies
npm install

# Dry-run semantic-release pipeline
npx semantic-release --dry-run
```

---

## Code Conventions & Common Patterns

### 1. Modern Morphe Kotlin DSL
Do not use legacy `@Patch` or `@CompatiblePackage` annotations. Define patches as top-level Kotlin values using `bytecodePatch` or `rawResourcePatch`:

```kotlin
val samplePatch = bytecodePatch(
    name = "Patch Display Name",
    description = "Concise description of the modifications.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SEZZLE)
    extendWith("extensions/extension.mpe") // Optional: include native extension

    execute {
        // Dalvik bytecode manipulation
    }
}
```

For raw asset modifications:
```kotlin
val sampleResourcePatch = rawResourcePatch(
    name = "Asset Patch Name",
    description = "Modifies embedded Hermes JS bundle.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SEZZLE)

    execute {
        val editor = HermesBundleEditor(get("assets/index.android.bundle"))
        // Apply edits
        editor.updateFooterHash()
    }
}
```

### 2. Dalvik Bytecode Helpers
Keep bytecode injection logic reusable and safe:
- Always check that the target method has an implementation (`method.implementation != null`) before injecting instructions.
- Use localized helper methods for stubbing out SDK calls:
  - `disableVoidMethods(classDescriptor, vararg methodNames)` -> injects `return-void`.
  - `returnBoolean(classDescriptor, methodName, value)` -> injects `const/4 v0, 0x0 \n return v0`.
  - `returnConstString(classDescriptor, methodName, value)` -> injects `const-string v0, "..." \n return-object v0`.

### 3. Hermes Bytecode Editing Principles
- **Guard Before Writing**: Use `editor.matchesBytes(offset, expected)` or `editor.patchBytesIfMatches(offset, expected, replacement)` to prevent corrupting mismatched bundle versions.
- **Fixed Size Invariant**: Never append bytes or reallocate sections; modify opcodes and operands in-place.
- **Donor String Replacement**: To insert custom text, locate an unused string of equal or greater length (e.g. storybook paths) and re-point the target string table entry using `replaceStringUsingDonor(...)`.
- **Mandatory Rehash**: Always call `editor.updateFooterHash()` prior to bundle export.

### 4. Error Handling
- Throw `PatchException("Descriptive reason")` when a target class, method, or byte offset cannot be located.
- Prefer fail-fast checks (`require(...)`, `check(...)`, `singleOrNull ?: throw PatchException(...)`) over silent failure or try/catch suppression.

### 5. Formatting & Code Style
- Kotlin official style enforced via `.editorconfig` (`ktlint_code_style = intellij_idea`).
- Wildcard imports are disabled in lint rules (`ktlint_standard_no-wildcard-imports = disabled`).
- 4-space indentation for Kotlin/Java; 2-space indentation for Gradle KTS, YAML, and JSON.

---

## Important Files

| File Path | Description |
| --- | --- |
| `patches/src/main/kotlin/app/finance/patches/sezzle/shared/Constants.kt` | Target package name (`com.sezzle.sezzlemobile`), version codes, and Morphe `Compatibility` object. |
| `patches/src/main/kotlin/app/finance/patches/sezzle/shared/HermesBundleEditor.kt` | Binary parser and in-place bytecode/string editor for Hermes Bytecode (HBC v98+). |
| `patches/src/main/kotlin/app/finance/patches/sezzle/security/DisableCodePushOtaPatch.kt` | Dalvik patch forcing `CodePush.getJSBundleFile()` to return `null`. |
| `patches/src/main/kotlin/app/finance/patches/sezzle/security/PatchConsentScreenPatch.kt` | Dalvik patch injecting `ConsentGate.maybeShow(this)` into `MainActivity.onCreate`. |
| `extensions/extension/src/main/java/app/finance/extension/sezzle/ConsentGate.java` | Native Android Java component rendering the user consent modal dialog. |
| `patches/src/main/kotlin/util/PatchListGenerator.kt` | JavaExec reflection utility generating `patches-list.json` from `.mpp` archives. |
| `settings.gradle.kts` | Multi-project setup, plugin management, and GitHub Packages repository declarations. |
| `patches/build.gradle.kts` | Patch metadata, gson classpath setup, and `generatePatchesList` task definition. |
| `gradle/libs.versions.toml` | Version catalog for `morphe-patcher` (1.14.0), `smali`, and `gson`. |
| `.releaserc` | Semantic-release configuration managing version bumps, changelog bundling, and backmerges. |
| `.github/workflows/release.yml` | CI/CD release workflow with Java 21, build provenance attestation, and fallback build checks. |
| `docs/sezzle_architecture_and_patches.md` | Reverse engineering specification for Sezzle v5.3.9 Hermes bytecode and Dalvik structures. |

---

## Runtime/Tooling Preferences

- **Java / JDK**:
  - JDK 17+ is required for local builds; JDK 27 is tested and supported.
  - CI uses **Eclipse Temurin JDK 21**.
- **Android SDK**:
  - Required to compile `:extensions:extension` (`ConsentGate.java`).
  - Configure path via `ANDROID_HOME` environment variable or `sdk.dir=/path/to/sdk` in `local.properties`.
- **Gradle**:
  - Use the bundled wrapper `./gradlew` (pinned to **Gradle 9.7.1** with SHA-256 verification).
  - Parallel execution and build caching are enabled in `gradle.properties`.
- **Node.js & npm**:
  - Node.js LTS (`lts/*`) with standard `npm`.
  - Used exclusively for semantic-release and changelog tooling (`package.json`). Do not introduce runtime JS dependencies into the patches.
- **Python**:
  - Python 3 is required to run `.github/scripts/generate_patches_readme.py`.
- **Repository Authentication**:
  - GitHub Packages registry (`maven.pkg.github.com/MorpheApp/registry`) requires authentication via `GITHUB_TOKEN` / `GITHUB_ACTOR` or `gpr.key` / `gpr.user` in `~/.gradle/gradle.properties`.

---

## Testing & QA

### Testing Status
- **Automated Unit / Integration Tests**: None. There are no test sources in `patches/src/test` or `extensions/extension/src/test`.
- **Test Dependencies**: `gradle/libs.versions.toml` contains no testing frameworks (no JUnit, MockK, Kotest, or Robolectric). Running `./gradlew test` executes 0 tasks.
- **Rationale**: Patches transform proprietary, closed-source APK binaries (`base.apk` and embedded Hermes bundles). Synthetic unit testing without real target binaries provides little value compared to build-time invariants and real-world APK testing.

### Quality Assurance Strategy
1. **Compilation Verification**:
   - Primary CI validation (`release.yml`):
     ```bash
     ./gradlew :patches:buildAndroid clean --no-daemon
     ```
   - Validates that Kotlin sources, Java extension code, and `.mpp` packaging compile cleanly.
2. **Metadata Verification**:
   - Run `./gradlew generatePatchesList` to verify that all patches instantiate cleanly, register valid compatibility objects, and serialize to `patches-list.json`.
3. **Defensive Patch-Time Invariants**:
   - All patches must enforce strict preconditions. If class names, method signatures, or byte sequences differ from the expected target version, the patch must immediately throw `PatchException` rather than producing a corrupt APK.
4. **Local Artifact & Bytecode Inspection**:
   - Apply the `.mpp` bundle to a target Sezzle APK using `morphe-desktop.jar`.
   - Disassemble the output APK with `jadx` or `baksmali` to verify Dalvik method injections.
   - Inspect `assets/index.android.bundle` using Hermes disassemblers (`hbctool` or `hermes-dec`) to verify opcode and string edits.
5. **Device Smoke Testing**:
   - Install the patched APK on an emulator or device (`adb install -r sezzle-patched.apk`).
   - Verify that `ConsentGate` blocks interaction until accepted.
   - Verify that CodePush does not trigger OTA downloads over the network.
   - Verify UI: "Shop" tab is titled "Home", store feed is empty, Rewards tab is unmounted, and Google sign-in works.
   - Monitor `adb logcat` to confirm ad and tracking SDK initializations are neutralized without throwing unhandled exceptions.
