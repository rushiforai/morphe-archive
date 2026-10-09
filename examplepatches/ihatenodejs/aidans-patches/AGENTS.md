# Repository Guidelines

## Project Overview

This repository develops binary bytecode, resource, and asset patches for Android applications using the **Morphe Patching Framework** (`app.morphe.patches` Gradle plugin v1.3.4, Morphe Patcher v1.14.0).

The project patches eight Android applications:
1. **Sezzle: Buy Now, Pay Later** (`com.sezzle.sezzlemobile`, target `5.3.9`): Hybrid React Native Fabric application compiled to **Hermes Bytecode v98**. Patches eliminate ads and tracking SDKs, suppress CodePush OTA updates and root/tamper checks, sanitize authentication (Google SSO only, native `ConsentGate` modal), restructure navigation (replace Shop with Home, remove Rewards, customize shortcuts, replace AI Discover), unblock features (receipt scanner, custom launcher icons), expose internal developer settings, and ensure 16 KB page size compatibility on Android 15+.
2. **SidelineSwap: Buy & Sell Gear** (`com.sidelineswap.android`, target `1.52.0`): Native Android (Kotlin/Java) marketplace app. Patches eliminate first-party and third-party tracking/analytics (Amplitude, Firebase Analytics, Crashlytics, Facebook App Events, Iterable, Braintree FPTI) and customize the primary brand accent color via Android XML resource modification.
3. **AfterShip: Package Tracker** (`com.aftership.AfterShip`, target `5.25.8`): Native Android (Kotlin/Java) tracking app with native C++ libraries (`libandroidsig-lib.so`). Patches neutralize native APK signature verification (`checkApkSha`), remove login barriers (forcing permanent guest mode), strip promotional feedback and shipment sync entry points, zero AAID and ad/tracking SDKs, provide an OpenStreetMap/Leaflet map engine replacement, add multi-shipment copy tracking, and apply a pure AMOLED black theme.
4. **Canvas Student** (`com.instructure.candroid`, target `8.10.0`): Native Android (Kotlin/Java) learning-management client. Patches repair 16 KB page size compatibility across three prebuilt ARM64 shared libraries (`libandroidx.graphics.path.so`, `libdatastore_shared_counter.so`, `libpspdfkit.so`) and remove Pendo behavioral tracking, Instructure Pandata pageview surveillance, first-party analytics, Firebase Crashlytics reporting, and Play Store rating redirects.
5. **Navigate360 Student** (`com.eab.se`, target `26.19.22`): Cordova hybrid Android application hosted in an Ionic WebView. Patches neutralize native Gainsight PX telemetry and Cordova bridge methods, remove Sentry Browser/CSP web reporting, and inert embedded Gainsight web engines.
6. **Blackjack** (`com.tripledot.blackjack`, target `2.22.09`): Unity IL2CPP game compiled to native ARM64 (`libil2cpp.so`). Patches eliminate ads, six telemetry SDKs (Tripledot Analytics, Firebase, Crashlytics, Adjust, AppsFlyer, Unity Analytics), and notification permission requests; rewire defunct store buttons to a custom Android chip balance dialog (`ChipBalanceDialog`); install an in-game level skip touch interceptor (`SkipLevelDialog`); and enforce 16 KB page size alignment.
7. **Adobe Scan: PDF Scanner, OCR** (`com.adobe.scan.android`, target `26.09.25`): Native Android (Kotlin/Java + Compose) scanning app. Patches bypass the mandatory Adobe ID / social sign-in gate on cold start, neutralize in-scanner save prompts and banners, preserve local scans without an account, replace Adobe Clean typography with the device system font, and remove Adobe, Branch, Facebook, Creative SDK, and Crashlytics telemetry, in-app ads, AAID and install-referrer collection, rating prompts, and dead telemetry settings.
8. **Fizz** (`com.ashtoncofer.Buzz`, target `1.54.0`): Native Android (Kotlin/Java + Compose) social application. Patches bypass PairIP Play Integrity licensing verification, neutralize first-party event tracking and batch uploads (`ra.ga`, `jc.k0`), disable Mixpanel analytics, Airbridge and Adjust attribution SDKs, zero the Google Play Advertising ID (AAID), eliminate feed ads and sponsored marketplace listings, and provide options for silent DM screenshots and Sentry telemetry removal.

---

## Architecture & Patching Layers

Patches operate across six distinct architectural layers depending on target application requirements:
```
                                      Target APK / XAPK / APKM
                                                 |
       +-------------------+---------------------+--------------------+--------------------+--------------------+
       |                   |                     |                    |                    |                    |
       v                   v                     v                    v                    v                    v
[ Dalvik / Smali ]  [ Hermes HBC v98 ]   [ Web Assets / HTML ]  [ Native Extension ]   [ XML Resource ]    [ Raw Binary/SO ]
  bytecodePatch      rawResourcePatch        rawResourcePatch       extendWith           resourcePatch      rawResourcePatch
  Dexlib2 AST        Bytecode & string   Cordova JS/HTML edits  Java DEX injection     Android DOM XML      ELF / SO patching
  rewriting          manipulation        (Sentry, Gainsight)    (Dialogs, Maps, Gates) (colors, manifest)   (IL2CPP, Sig, RELRO)
       |                   |                     |                    |                    |                    |
       +-------------------+---------------------+--------------------+--------------------+--------------------+
                                                 |
                                                 v
                                        Patched Output APK
```

### 1. Hermes Bytecode Layer (`rawResourcePatch` on HBC v98)
- **App**: Sezzle (`assets/index.android.bundle`, Hermes v98, magic `c6 1f bc 03 c1 03 19 1f`).
- **Editor**: `patches/src/main/kotlin/app/aidan/patches/sezzle/shared/HermesBundleEditor.kt`.
- **Mechanism**:
  - Direct opcode substitution (e.g., replacing function bodies with `LoadConstFalse r1` [`0x96 0x01`] / `Ret r1` [`0x76 0x01`]).
  - Array mutation and component unmounting (resizing container children arrays and setting promotional elements to `LoadConstUndefined` [`0x93`]).
  - Donor string recycling: Hermes cannot expand string tables without corrupting cross-section offsets. New text replaces unused donor strings (e.g. storybook debug strings) of equal or greater length, zero-padding remainder bytes.
  - Trailing SHA-1 digest recalculation via `editor.updateFooterHash()`.

### 2. Dalvik / Smali Bytecode Layer (`bytecodePatch`)
- **Apps**: Sezzle, SidelineSwap, AfterShip, Canvas Student, Navigate360 Student, Blackjack.
- **Engine**: Dexlib2 AST manipulation via Morphe DSL (`mutableClassDefBy`, `addInstructions`).
- **Mechanism**:
  - Neutralizes entrypoints by injecting early returns (`return-void`, `const/4 v0, 0x0 \n return v0`, dummy objects).
  - Intercepts method return values (e.g., overriding `CodePush.getJSBundleFile()` to return `null`, forcing fallback to embedded Hermes bundle).
  - Hooks lifecycles and UI events (e.g., injecting `ConsentGate.maybeShow(this)` into Sezzle's `MainActivity.onCreate`, `SkipLevelDialog.install(this)` into Blackjack's `UnityPlayerActivity.onCreate`, or `CopyTrackingBridge.onUpdateButtons` into AfterShip's `HomeActivity.S2`).

### 3. Web Asset Layer (`rawResourcePatch` on HTML / JavaScript)
- **App**: Navigate360 Student (`assets/www/index.html`, `assets/bundle.js`, `assets/www/plugins/cordova-gainsight/www/gainsight.js`).
- **Mechanism**: Replaces string patterns in embedded Cordova web assets to remove Sentry initialization scripts and CSP reporting endpoints, and replaces Gainsight telemetry functions with inert local stubs.

### 4. XML Resource Layer (`resourcePatch`)
- **Apps**: SidelineSwap (`res/values/colors.xml`, `res/values-night/colors.xml`), AfterShip (`res/values-night/colors.xml`, `AndroidManifest.xml`), Sezzle (`AndroidManifest.xml`).
- **Engine**: Morphe `document(...)` XML DOM manipulation.
- **Mechanism**: Edits color element hex values based on patch options (`primaryColor`, `primaryDarkColor`, AMOLED black `#000000`) or sets manifest attributes like `android:debuggable="true"` and `android:pageSizeCompat="enabled"`.

### 5. Native Extension Layer (`extensions/extension.mpe`)
- **Module**: `:extensions:extension` compiles Java classes into a Morphe Patch Extension (`.mpe`).
- **Components**:
  - **Sezzle**: `app.aidan.extension.sezzle.ConsentGate` presents an un-cancelable user consent dialog.
  - **AfterShip**: `app.aidan.extension.aftership.CopyTrackingBridge` injects a dynamic Copy action into the multi-shipment action bar; `app.aidan.extension.aftership.OsmMapBridge` and `OsmMapView` render an embedded Leaflet/OpenStreetMap engine.
  - **Blackjack**: `app.aidan.extension.blackjack.ChipBalanceDialog` provides a native chip store replacement; `app.aidan.extension.blackjack.SkipLevelDialog` intercepts HUD touch events to skip levels.
- **Packaging**: Merged via `extendWith("extensions/extension.mpe")` and injected into the target APK's DEX.

### 6. Native Binary / Library Layer (`rawResourcePatch`)
- **Apps**: AfterShip (`lib/*/libandroidsig-lib.so`), Canvas Student (`lib/arm64-v8a/*.so`), Blackjack (`lib/arm64-v8a/libil2cpp.so`).
- **Mechanism**:
  - **AfterShip**: Directly patches machine code instructions in `libandroidsig-lib.so` (neutralizing `checkApkSha`).
  - **Canvas Student**: Rewrites ELF64 program headers in `libandroidx.graphics.path.so`, `libdatastore_shared_counter.so`, and `libpspdfkit.so` to replace non-16 KB aligned `PT_GNU_RELRO` segments with `PT_NULL`.
  - **Blackjack**: Patches ARM64 instructions in `libil2cpp.so` across `OpenShop`, `CheckUpdateToVersion` (custom 192-byte input hook), `BlackjackAds`, `PlayerData.get_AdsDisabled`, `AdManager`, and 6 telemetry SDKs.

### 7. Cross-Layer Coordination & `dependsOn` Invariant
Morphe enforces strict type invariance on patch execution contexts (`Patch<T>`):
- `bytecodePatch` executes in `BytecodePatchContext`, which exclusively mutates Dalvik/Smali DEX ASTs. In `bytecodePatch`-only runs (`STRIP_FAST` mode), Morphe skips raw resource decoding entirely and only swaps modified DEX files into the APK—raw APK assets in `assets/` are **never staged or repacked**.
- `rawResourcePatch` executes in `ResourcePatchContext`, which decodes the APK in raw mode, tracks asset files accessed via `get(...)`, and repackages modified assets (Hermes bytecode, ELF shared libraries, web bundles) into the final output APK.

**Rule:** When a feature requires changes across multiple architectural layers (e.g., Dalvik bytecode + embedded Hermes bytecode, or Dalvik bytecode + native `.so` ELF binaries, or Dalvik bytecode + asset fonts), the modifications **CANNOT** be merged into a single `bytecodePatch`. Attempting to modify asset files from inside a `bytecodePatch` will silently fail to repackage the asset in the output APK.

Instead, define a companion `rawResourcePatch` (or `resourcePatch`) and link it to the primary user-facing patch via `dependsOn(...)`:
- **Fizz**: `replaceEmojiFontWithIosPatch` (`bytecodePatch`) $\rightarrow$ `dependsOn(replaceEmojiFontWithIosResourcePatch)` (`rawResourcePatch`)
- **Blackjack**: `addCustomChipStorePatch` (`bytecodePatch`) $\rightarrow$ `dependsOn(patchChipStoreResourcePatch)` (`rawResourcePatch`)
- **AfterShip**: `removeLoginPatch` (`bytecodePatch`) $\rightarrow$ `dependsOn(bypassSignatureCheckResourcePatch)` (`rawResourcePatch`)
- **Sezzle**: `suppressUpdatesAndIntegrityPatch` (`bytecodePatch`) $\rightarrow$ `dependsOn(suppressHermesUpdatesAndIntegrityPatch)` (`rawResourcePatch`)
- **Sezzle**: `removeAdsAndTrackingPatch` (`bytecodePatch`) $\rightarrow$ `dependsOn(removeAdsAndTrackingFromJsBundlePatch)` (`rawResourcePatch`)

When `dependsOn` is declared, selecting the user-facing patch automatically triggers the companion patch and causes Morphe's resource encoder to decode, patch, and repackage the raw assets.
### Data Flow
1. **Build Time**: Gradle builds `:extensions:extension` into `.mpe`, compiles Kotlin patch definitions into `.mpp`, and executes `PatchListGeneratorKt` to emit `patches-list.json`.
2. **Patch Time (Morphe CLI / Desktop)**: Morphe unzips the target APK/APKM/XAPK, validates package/version compatibility, modifies Dalvik bytecode, merges `.mpe` classes into DEX, applies XML DOM edits, edits raw resources/ELF binaries/Hermes bundles, updates hashes, and repacks/signs the output APK.
3. **Runtime**: Patched classes, resources, native libraries, and Hermes bundles execute with tracking neutralized, security/integrity bypassed, and custom navigation/theming active.

---

## Key Directories

```
.
├── patches/                               # Core Morphe patch definitions module
│   ├── build.gradle.kts                   # Patch bundle metadata & task configuration
│   └── src/main/kotlin/
│       ├── app/aidan/patches/
│       │   ├── aftership/                 # AfterShip patch implementations (12 patches)
│       │   │   ├── account/               # RemoveAfterShipAccountPageLinksPatch
│       │   │   ├── ads/                   # RemoveAdsAndTrackingPatch
│       │   │   ├── auth/                  # Bypass native signature check, remove login
│       │   │   ├── customization/         # Copy tracking, OSM, AMOLED, custom GMaps key
│       │   │   ├── feedback/              # RemoveFeedbackPatch
│       │   │   ├── shared/                # AfterShip constants & compatibility
│       │   │   └── sync/                  # RemoveShipmentSyncPatch
│       │   ├── blackjack/                 # Blackjack patch implementations (6 patches)
│       │   │   ├── ads/                   # RemoveAdsPatch
│       │   │   ├── customization/         # Custom chip store, skip to next level
│       │   │   ├── notifications/         # RemoveNotificationsPatch
│       │   │   ├── shared/                # Blackjack constants & compatibility
│       │   │   └── tracking/              # RemoveTrackingAndAnalyticsPatch
│       │   ├── canvas/                    # Canvas Student patch implementations (1 patch)
│       │   │   ├── shared/                # Canvas constants & compatibility
│       │   │   └── tracking/              # RemoveTrackingAndAnalyticsPatch, Fix16KbPageCompatibilityPatch
│       │   ├── fizz/                      # Fizz patch implementations (4 patches)
│       │   │   ├── ads/                   # RemoveAdsPatch (sponsored ads, marketplace feed listings)
│       │   │   ├── customization/         # ReplaceEmojiFontWithIosPatch
│       │   │   ├── dev/                   # EnableDeveloperSettingsPatch
│       │   │   ├── shared/                # Fizz constants & compatibility
│       │   │   └── tracking/              # RemoveTrackingAndAnalyticsPatch
│       │   ├── navigate360/               # Navigate360 Student patch implementations (2 patches)
│       │   │   ├── shared/                # Navigate360 constants & compatibility
│       │   │   └── tracking/              # RemoveTrackingAndTelemetryPatch, RemoveWebTrackingAndTelemetryPatch
│       │   ├── sezzle/                    # Sezzle patch implementations (15 patches)
│       │   │   ├── ads/                   # HideBannerAdsPatch (13 SDKs neutralized, Thanks/Rokt post-payment offers)
│       │   │   ├── auth/                  # CleanAuthenticationPatch
│       │   │   ├── compatibility/         # PageSizeCompatibilityPatch
│       │   │   ├── customization/         # UnlockCustomAppIconsPatch
│       │   │   ├── dev/                   # EnableAppDebuggingPatch, UnlockDevSettingsPatch
│       │   │   ├── features/              # UnlockReceiptScannerPatch
│       │   │   ├── navigation/            # ReplaceShopWithHome, RemoveRewards, ConfigureShortcuts, etc.
│       │   │   ├── security/              # SuppressUpdatesAndIntegrityPatch, PatchConsentScreenPatch
│       │   │   └── shared/                # Constants, compatibility, HermesBundleEditor
│       │   └── sidelineswap/              # SidelineSwap patch implementations (2 patches)
│       │       ├── customization/         # ChangeBrandColorPatch
│       │       ├── tracking/              # BlockTrackingAndTelemetryPatch
│       │       └── shared/                # SidelineSwap constants & compatibility
│       └── util/                          # Build-time utilities (PatchListGenerator.kt)
├── extensions/extension/                  # Native Android extension module
│   ├── build.gradle.kts                   # Compiles Java sources to extension.mpe
│   └── src/main/
│       ├── AndroidManifest.xml            # Minimal extension manifest
│       └── java/app/aidan/extension/      # Native Java code
│           ├── aftership/                 # CopyTrackingBridge.java, OsmMapBridge.java, OsmMapView.java
│           ├── blackjack/                 # ChipBalanceDialog.java, SkipLevelDialog.java
│           └── sezzle/                    # ConsentGate.java
├── tools/apk-lab/                         # Deterministic APK lifecycle, analysis & compatibility toolkit
│   ├── pyproject.toml                     # Python 3.12 project configuration with uv lock and CLI entry point
│   ├── tools.lock.json                    # Pinned toolchain hashes (Morphe, JADX, Apktool, baksmali, apkeep)
│   ├── apk_lab/                           # Python modules (inspection, comparison, morphe, workspace, fixtures, asm, il2cpp, unity)
│   └── tests/                             # Automated pytest test suite (78 tests)
├── worker/                                # Cloudflare Worker control plane (daily Play scraper, badges, dispatch)
│   ├── wrangler.jsonc                     # Worker configuration & KV namespace binding
│   └── src/                               # TypeScript sources (apps.ts derived from patches-list.json, badges.ts)
├── site/                                  # Astro documentation, status dashboard & web surface
├── docs/                                  # Reverse engineering specs & deep dive docs
│   ├── apk-lab.md                         # Complete apk-lab CLI documentation, workflows, and invariants
│   ├── aftership/                         # architecture.md, patches.md
│   ├── blackjack/                         # architecture.md, patches.md
│   ├── canvas/                            # architecture.md, patches.md
│   ├── fizz/                              # architecture.md, patches.md
│   ├── navigate360/                       # architecture.md, patches.md
│   ├── sezzle/                            # architecture.md, patches.md, hidden_feature_flags.md
│   └── sidelineswap/                      # architecture.md, patches.md
├── gradle/                                # Gradle wrapper and libs.versions.toml
└── .github/                               # CI/CD workflows, issue templates, release scripts
    ├── workflows/apk-lab-tests.yml        # Public tooling test & build verification workflow
    └── workflows/apk-compatibility.yml    # Private R2 fixture rotation & patch compatibility CI
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

### Patch Application & Artifact Tooling (`apk-lab`)
```bash
# Setup toolchain and verify host environment
uv run --project tools/apk-lab apk-lab setup --profile analysis
uv run --project tools/apk-lab apk-lab doctor

# Inspect container, splits, signers, and DEX inventories (content-based)
uv run --project tools/apk-lab apk-lab inspect path/to/app.apkm

# Decompile and extract into a managed, marked workspace
uv run --project tools/apk-lab apk-lab analyze path/to/app.apkm --smali

# Compare two APK/APKM versions (metadata, splits, DEX counts, native libs, assets)
uv run --project tools/apk-lab apk-lab compare old.apkm new.apkm

# Run isolated patch compatibility check across all patches and option permutations
uv run --project tools/apk-lab apk-lab check path/to/app.apkm \
  --mpp patches/build/libs/patches-X.X.X.mpp \
  --package com.example.app \
  --all

# Encode ARM64 branch instruction or return into Morphe Kotlin byteArrayOf format
uv run --project tools/apk-lab apk-lab asm "bl 0x3c98ce4" --pc 0x1fcf6e8 --format kotlin

# Extract and query stripped Unity IL2CPP symbols across splits
uv run --project tools/apk-lab apk-lab il2cpp path/to/game.apkm --query OpenShop

# Inspect Unity serialized assets and locate GameObject active-state byte offsets
uv run --project tools/apk-lab apk-lab unity path/to/game.apkm --gameobject Button_HelpCenter

# Acquire application artifact from Google Play
uv run --project tools/apk-lab apk-lab acquire com.example.app

# Clean managed workspaces safely (never use raw rm -rf on workspaces)
uv run --project tools/apk-lab apk-lab clean --package com.example.app

### Agent Operational Rules for APKs and Patches
- **Start with apk-lab**: Always use `uv run --project tools/apk-lab apk-lab inspect|analyze|compare|check|asm|il2cpp|unity`. Never invent arbitrary unzipping/decompilation locations outside the managed `.apk-lab` workspace.
- **Safe Cleanup**: Never use raw `rm -rf` on workspace folders. Always use `apk-lab clean --run <path>` or `apk-lab clean --package <pkg>`, which verify `.marker.json` and refuse symlinks or escaped paths.
- **Never Guess Compatibility**: Never mark a target version supported in `Constants.kt` from a metadata diff alone. A version is supported ONLY when `apk-lab check ... --all` executes every patch and boolean option permutation independently and passes Morphe result parsing and Android SDK DEX verification.
- **New Patch Sequence**: `inspect` $\rightarrow$ targeted `analyze` $\rightarrow$ implement fail-fast bytecode hooks $\rightarrow$ compile `.mpp` $\rightarrow$ `check --all` $\rightarrow$ device smoke.
- **App Update Sequence**: `compare` $\rightarrow$ forced failing `check --all --force` (capture failing baseline) $\rightarrow$ targeted `analyze` $\rightarrow$ remap anchors and models $\rightarrow$ compile `.mpp` $\rightarrow$ `check --all` $\rightarrow$ update compatibility and docs.
### Release Pipeline (Local Dry-Run)
```bash
# Install release automation dependencies
npm install

# Dry-run semantic-release pipeline
npx semantic-release --dry-run
```

---

## Code Conventions & Common Patterns

Do not use legacy `@Patch` or `@CompatiblePackage` annotations. Define patches as top-level Kotlin values using `bytecodePatch`, `rawResourcePatch`, or `resourcePatch`:

```kotlin
// Dalvik bytecode patch
val sampleBytecodePatch = bytecodePatch(
    name = "Patch Display Name",
    description = "Concise description of the modifications.",
    default = true
) {
    compatibleWith(COMPATIBILITY_OBJECT)
    extendWith("extensions/extension.mpe") // Optional: include native extension
    dependsOn(anotherPatch)               // Optional: dependencies

    execute {
        // Dalvik bytecode manipulation via Dexlib2 AST
    }
}

// Raw binary / asset patch (Hermes bundle, ELF shared library)
val sampleRawResourcePatch = rawResourcePatch(
    name = "Asset Patch Name",
    description = "Modifies embedded asset or binary.",
    default = true
) {
    compatibleWith(COMPATIBILITY_OBJECT)

    execute {
        val file = get("assets/index.android.bundle") // or "lib/arm64-v8a/libfoo.so"
        // In-place byte modifications
    }
}

// Android XML resource patch
val sampleResourcePatch = resourcePatch(
    name = "Resource Patch Name",
    description = "Modifies XML resources or manifest.",
    default = true
) {
    compatibleWith(COMPATIBILITY_OBJECT)

    execute {
        document("res/values/colors.xml").use { doc ->
            // DOM manipulation
        }
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
| `patches/src/main/kotlin/app/aidan/patches/sezzle/shared/Constants.kt` | Sezzle package name (`com.sezzle.sezzlemobile`), version codes, and Morphe `Compatibility` object. |
| `patches/src/main/kotlin/app/aidan/patches/sezzle/shared/HermesBundleEditor.kt` | Binary parser and in-place bytecode/string editor for Hermes Bytecode (HBC v98+). |
| `patches/src/main/kotlin/app/aidan/patches/sezzle/security/SuppressUpdatesAndIntegrityPatch.kt` | Security patches suppressing CodePush OTA updates, RootBeer/JailMonkey, Hermes update sagas, and Play Store redirects. |
| `patches/src/main/kotlin/app/aidan/patches/sezzle/security/PatchConsentScreenPatch.kt` | Dalvik patch injecting `ConsentGate.maybeShow(this)` into `MainActivity.onCreate`. |
| `patches/src/main/kotlin/app/aidan/patches/sezzle/compatibility/PageSizeCompatibilityPatch.kt` | Resource patch enabling 16 KB page size compatibility, native library extraction, and 16 KB ZIP alignment in Sezzle. |
| `patches/src/main/kotlin/app/aidan/patches/sidelineswap/shared/Constants.kt` | SidelineSwap package name (`com.sidelineswap.android`), signatures, and Morphe `Compatibility` object. |
| `patches/src/main/kotlin/app/aidan/patches/sidelineswap/tracking/BlockTrackingAndTelemetryPatch.kt` | Dalvik patch neutralizing all analytics, tracking, telemetry, and AAID in SidelineSwap. |
| `patches/src/main/kotlin/app/aidan/patches/sidelineswap/customization/ChangeBrandColorPatch.kt` | XML resource patch customizing SidelineSwap brand colors. |
| `patches/src/main/kotlin/app/aidan/patches/aftership/shared/Constants.kt` | AfterShip package name (`com.aftership.AfterShip`) and Morphe `Compatibility` object. |
| `patches/src/main/kotlin/app/aidan/patches/aftership/auth/RemoveLoginPatch.kt` | Patches bypassing native signature check in `libandroidsig-lib.so` and enforcing permanent guest mode. |
| `patches/src/main/kotlin/app/aidan/patches/aftership/account/RemoveAfterShipAccountPageLinksPatch.kt` | Dalvik patch removing About the app, Share the app, and Feedback links from the Account screen. |
| `patches/src/main/kotlin/app/aidan/patches/aftership/feedback/RemoveFeedbackPatch.kt` | Dalvik patch removing feedback prompts, Feedback buttons, and star rating component on shipments. |
| `patches/src/main/kotlin/app/aidan/patches/aftership/sync/RemoveShipmentSyncPatch.kt` | Dalvik patch removing email shipment synchronization, prompts, banners, dialogs, and entry points. |
| `patches/src/main/kotlin/app/aidan/patches/aftership/customization/OpenStreetMapPatch.kt` | Dalvik patch providing an OpenStreetMap / Leaflet WebView map engine replacement. |
| `patches/src/main/kotlin/app/aidan/patches/aftership/customization/AddCopyTrackingNumberOptionPatch.kt` | Dalvik patch dynamically inserting a Copy action into the multi-shipment selection menu. |
| `patches/src/main/kotlin/app/aidan/patches/aftership/ads/RemoveAdsAndTrackingPatch.kt` | Dalvik patch neutralizing Disco ads, 5-star review dialogs, AAID, and analytics dispatchers. |
| `patches/src/main/kotlin/app/aidan/patches/canvas/shared/Constants.kt` | Canvas Student package name (`com.instructure.candroid`), signature, APKM type, and Morphe `Compatibility` object. |
| `patches/src/main/kotlin/app/aidan/patches/canvas/tracking/Fix16KbPageCompatibilityPatch.kt` | Raw resource patch rewriting ELF64 program headers to remove incompatible GNU RELRO segments. |
| `patches/src/main/kotlin/app/aidan/patches/canvas/tracking/RemoveTrackingAndAnalyticsPatch.kt` | Dalvik patch neutralizing Pendo, Pandata, first-party analytics, Crashlytics, and rating redirects in Canvas Student. |
| `patches/src/main/kotlin/app/aidan/patches/navigate360/shared/Constants.kt` | Navigate360 Student package name (`com.eab.se`), signature, APKM type, and Morphe `Compatibility` object. |
| `patches/src/main/kotlin/app/aidan/patches/navigate360/tracking/RemoveTrackingAndTelemetryPatch.kt` | Dalvik patch neutralizing native Gainsight PX SDK and Cordova bridge in Navigate360 Student. |
| `patches/src/main/kotlin/app/aidan/patches/navigate360/tracking/RemoveWebTrackingAndTelemetryPatch.kt` | Raw resource patch removing Sentry Browser/CSP and stubbing Gainsight web scripts in Navigate360 Student. |
| `patches/src/main/kotlin/app/aidan/patches/blackjack/shared/Constants.kt` | Blackjack package name (`com.tripledot.blackjack`), signature, APKM type, and Morphe `Compatibility` object. |
| `patches/src/main/kotlin/app/aidan/patches/blackjack/customization/AddCustomChipStorePatch.kt` | Patches installing native ARM64 hook in `libil2cpp.so` and presenting custom Android chip balance dialog. |
| `patches/src/main/kotlin/app/aidan/patches/blackjack/customization/SkipToNextLevelPatch.kt` | Dalvik patch intercepting level HUD touches in `UnityPlayerActivity` to advance player levels. |
| `patches/src/main/kotlin/app/aidan/patches/blackjack/ads/RemoveAdsPatch.kt` | Raw resource patch disabling interstitial ads, banners, and rewarded video containers in `libil2cpp.so`. |
| `patches/src/main/kotlin/app/aidan/patches/blackjack/tracking/RemoveTrackingAndAnalyticsPatch.kt` | Raw resource patch neutralizing Tripledot Analytics, Firebase, Crashlytics, Adjust, AppsFlyer, and Unity Analytics. |
| `patches/src/main/kotlin/app/aidan/patches/blackjack/notifications/RemoveNotificationsPatch.kt` | XML resource patch removing the Android notification permission from `AndroidManifest.xml`. |
| `patches/src/main/kotlin/app/aidan/patches/adobescan/shared/Constants.kt` | Adobe Scan package name (`com.adobe.scan.android`), signature, APKM type, and Morphe `Compatibility` object. |
| `patches/src/main/kotlin/app/aidan/patches/adobescan/auth/RemoveLoginPatch.kt` | Dalvik patch bypassing cold-start sign-in tour, neutralizing in-scanner save prompts, and preserving local scans without an account. |
| `patches/src/main/kotlin/app/aidan/patches/adobescan/ads/RemoveAdsAndTrackingPatch.kt` | Dalvik patch removing in-app ads, telemetry, attribution, advertising identifiers, install-referrer collection, Crashlytics reporting, review prompts, and optional dead telemetry settings. |
| `patches/src/main/kotlin/app/aidan/patches/adobescan/customization/UseSystemFontPatch.kt` | Dalvik patch replacing Adobe Clean resource, Compose, and Creative SDK font paths with the device system font. |
| `patches/src/main/kotlin/app/aidan/patches/adobescan/customization/PremiumPatch.kt` | Dalvik patch enabling locally executable premium OCR, editing, compression, and page organization, with an option to remove broken cloud actions like Generative summary. |
| `patches/src/main/kotlin/app/aidan/patches/adobescan/customization/RemoveUselessPromotionalItemsPatch.kt` | Dalvik patch removing promotional, feedback, and support items from Settings and stripping Fill & Sign Play Store redirection from File Options. |
| `extensions/extension/src/main/java/app/aidan/extension/sezzle/ConsentGate.java` | Native Android Java component rendering the Sezzle user consent modal dialog. |
| `extensions/extension/src/main/java/app/aidan/extension/aftership/CopyTrackingBridge.java` | Native Android Java bridge extracting and copying tracking numbers to clipboard. |
| `extensions/extension/src/main/java/app/aidan/extension/aftership/OsmMapBridge.java` | Native Android Java bridge binding ViewModel coordinates to `OsmMapView`. |
| `extensions/extension/src/main/java/app/aidan/extension/aftership/OsmMapView.java` | Native Android Java WebView rendering Leaflet 1.9.4 and OpenStreetMap raster tiles. |
| `extensions/extension/src/main/java/app/aidan/extension/blackjack/ChipBalanceDialog.java` | Native Android Java component rendering custom chip balance input dialog. |
| `extensions/extension/src/main/java/app/aidan/extension/blackjack/SkipLevelDialog.java` | Native Android Java touch interceptor and confirmation dialog for level skipping. |
| `extensions/extension/src/main/java/app/aidan/extension/adobescan/SystemFontBridge.java` | Native Java bridge resolving Adobe font-resource weights and styles to the device system typeface. |
| `patches/src/main/kotlin/util/PatchListGenerator.kt` | JavaExec reflection utility generating `patches-list.json` from `.mpp` archives. |
| `settings.gradle.kts` | Multi-project setup, plugin management, and GitHub Packages repository declarations. |
| `patches/build.gradle.kts` | Patch metadata, gson classpath setup, and `generatePatchesList` task definition. |
| `gradle/libs.versions.toml` | Version catalog for `morphe-patcher` (1.14.0), `smali`, and `gson`. |
| `.releaserc` | Semantic-release configuration managing version bumps, changelog bundling, and backmerges. |
| `.github/workflows/release.yml` | CI/CD release workflow with Java 21, build provenance attestation, and fallback build checks. |
| `docs/sezzle/architecture.md` | Architecture and reverse engineering specification for Sezzle v5.3.9. |
| `docs/sezzle/patches.md` | Patch specifications for all 16 Sezzle patches across navigation, security, and features. |
| `docs/sezzle/hidden_feature_flags.md` | Catalog of Sezzle hidden feature flags, cohorts, and debugger hooks. |
| `docs/sidelineswap/architecture.md` | Reverse engineering specification for SidelineSwap architecture and telemetry. |
| `docs/sidelineswap/patches.md` | Patch specification for SidelineSwap tracking neutralization and brand color customization. |
| `docs/aftership/architecture.md` | Reverse engineering specification for AfterShip architecture, native libs, and auth. |
| `docs/aftership/patches.md` | Patch specification for AfterShip signature bypass, login removal, OSM, and themes. |
| `docs/canvas/architecture.md` | Reverse engineering specification for Canvas Student telemetry architecture and 16 KB runtime. |
| `docs/canvas/patches.md` | Patch specification for Canvas Student tracking removal and 16 KB page compatibility fix. |
| `docs/navigate360/architecture.md` | Reverse engineering specification for Navigate360 Student hybrid Cordova architecture. |
| `docs/navigate360/patches.md` | Patch specification for Navigate360 Student native and web telemetry removal. |
| `docs/blackjack/architecture.md` | Reverse engineering specification for Blackjack Unity IL2CPP runtime and extensions. |
| `docs/blackjack/patches.md` | Patch specification for Blackjack custom store, level skip, ad removal, and tracking block. |
| `docs/adobe-scan/architecture.md` | Reverse engineering specification for Adobe Scan navigation, local PDF pipeline, telemetry, and advertising surfaces. |
| `docs/adobe-scan/patches.md` | Patch specifications for Adobe Scan login removal, local-only persistence, and ads/tracking removal. |
| `patches/src/main/kotlin/app/aidan/patches/fizz/shared/Constants.kt` | Fizz package name (`com.ashtoncofer.Buzz`), signature, APKM type, and Morphe `Compatibility` object. |
|`patches/src/main/kotlin/app/aidan/patches/fizz/ads/RemoveAdsPatch.kt`|Dalvik patch removing sponsored feed advertisements by default and filtering marketplace listing cards from the feed via option.|
| `patches/src/main/kotlin/app/aidan/patches/fizz/tracking/RemoveTrackingAndAnalyticsPatch.kt` | Dalvik patch neutralizing first-party tracking, Mixpanel, Airbridge, Adjust, AAID, PairIP check, Sentry, and screenshot alerts in Fizz. |
| `patches/src/main/kotlin/app/aidan/patches/fizz/customization/ReplaceEmojiFontWithIosPatch.kt` | Dalvik & asset patch bundling Apple Color Emoji and configuring native fallback chain. |
| `extensions/extension/src/main/java/app/aidan/extension/emoji/EmojiFontBridge.java` | Native Android extension creating and caching `CustomFallbackBuilder` typefaces with Apple Color Emoji. |
| `docs/fizz/architecture.md` | Reverse engineering specification for Fizz social architecture, PairIP protection, and telemetry pipelines. |
| `docs/fizz/patches.md` | Patch specifications for Fizz tracking removal, PairIP bypass, and silent screenshots. |
| `patches/src/main/kotlin/app/aidan/patches/fizz/dev/EnableDeveloperSettingsPatch.kt` | Dalvik patch injecting top-bar developer mod menu icon with Mobile Studio trigger. |
| `extensions/extension/src/main/java/app/aidan/extension/fizz/FeedFilterBridge.java` | Native Android bridge filtering advertisements and marketplace listings from Home feed display items. |
| `extensions/extension/src/main/java/app/aidan/extension/fizz/DeveloperMenuBridge.java` | Native Android bridge handling menu invocation, Mobile Studio flow trigger, and app restart. |
| `extensions/extension/src/main/java/app/aidan/extension/fizz/DeveloperMenuDialog.java` | Native Android modal dialog presenting developer mod menu with Mobile Studio launcher. |
| `tools/apk-lab/tools.lock.json` | Pinned external toolchain manifest (Morphe Desktop 1.18.0, JADX 1.5.6, Apktool 3.0.3, baksmali 3.0.10, apkeep 1.1.0). |
| `tools/apk-lab/pyproject.toml` | Isolated Python 3.12 project configuration for the `apk-lab` CLI toolkit. |
| `docs/apk-lab.md` | Complete reference specification, workflow guides, and storage rules for the `apk-lab` toolkit. |
| `worker/src/apps.ts` | Dynamic target app metadata module deriving unique packages, targets, and signers from `patches-list.json`. |
| `worker/src/badges.ts` | SVG badge generator for aggregate and per-package patch compatibility. |
| `.github/workflows/apk-lab-tests.yml` | GitHub Actions workflow executing the 78-test pytest suite and Gradle patch compilation gate. |
| `.github/workflows/apk-compatibility.yml` | GitHub Actions workflow acquiring APKs, rotating R2 slots, and testing target/latest compatibility. |
---

## Runtime/Tooling Preferences

- **Java / JDK**:
  - JDK 17+ is required for local builds; JDK 27 is tested and supported.
  - CI uses **Eclipse Temurin JDK 21**.
- **Android SDK**:
  - Required to compile `:extensions:extension` (`ConsentGate.java`) and run `apk-lab` inspections/verification.
  - Android SDK Build Tools **36.0.0** (`aapt2`, `apksigner`, `zipalign`, `dexdump`).
  - Configure path via `ANDROID_HOME` / `ANDROID_SDK_ROOT` environment variables or `sdk.dir=/path/to/sdk` in `local.properties`.
- **Python & uv**:
  - Python 3.12+ managed via **uv** (`tools/apk-lab`).
  - All APK lifecycle tasks (inspect, analyze, compare, check, clean, fixtures, acquire, asm, il2cpp, unity) must run via `uv run --project tools/apk-lab apk-lab <subcommand>`.
- **Gradle**:
  - Use the bundled wrapper `./gradlew` (pinned to **Gradle 9.7.1** with SHA-256 verification).
  - Parallel execution and build caching are enabled in `gradle.properties`.
- **Node.js, Bun & npm**:
  - Node.js LTS (`lts/*`) with standard `npm` for semantic-release.
  - **Bun** is used for Cloudflare Worker runtime tests (`vitest`), types generation (`wrangler types`), and Astro site builds (`site/`).
- **Repository Authentication**:
  - GitHub Packages registry (`maven.pkg.github.com/MorpheApp/registry`) requires authentication via `GITHUB_TOKEN` / `GITHUB_ACTOR` or `gpr.key` / `gpr.user` in `~/.gradle/gradle.properties`.

---

## Testing & QA

### Testing Status
- **Patch Core Tests**: There are no synthetic test sources in `patches/src/test` or `extensions/extension/src/test`. Patches transform proprietary closed-source APK binaries; synthetic tests provide little value compared to real-world APK application.
- **Automated Tooling & Archive Tests**: The `tools/apk-lab` module includes a comprehensive pytest suite (`uv run --project tools/apk-lab pytest`, 78 tests) covering safe archive extraction, zip bomb rejection, path traversal rejection, container classification, split consistency, deterministic workspace IDs, tool checksums, Morphe result parsing, multi-split native library extraction, deterministic ARM64 instruction assembly, Unity IL2CPP metadata parsing, and Unity serialized asset inspection.
- **Automated Worker Tests**: The `worker/` module includes a Vitest suite (`cd worker && bun run test`, 15 tests) testing app metadata derivation, Play Store scraper error handling, duplicate dispatch suppression, authenticated result ingestion, and badge SVG generation.
- **Automated Compatibility Verification**: `apk-lab check <artifact> --mpp <bundle> --package <pkg> --all` runs live application of all declared patches and boolean option permutations, enforcing Morphe success and Android SDK DEX structural verification.

### Quality Assurance Strategy
1. **Compilation Verification**:
   - Primary CI validation (`release.yml`, `apk-lab-tests.yml`):
     ```bash
     ./gradlew :patches:buildAndroid clean --no-daemon
     ```
   - Validates that Kotlin sources, Java extension code, and `.mpp` packaging compile cleanly.
2. **Tooling & Unit Test Gates**:
   - Run `uv run --project tools/apk-lab pytest` to verify archive safety, tool caching, and workspace invariants.
   - Run `cd worker && bun run test` to verify control plane endpoints, dispatch logic, and badge rendering.
3. **Metadata Verification**:
   - Run `./gradlew generatePatchesList` to verify that all patches instantiate cleanly, register valid compatibility objects, and serialize to `patches-list.json`.
4. **Automated Patch Compatibility Testing (`apk-lab check`)**:
   - Apply the `.mpp` bundle across all compatible patches and option permutations:
     ```bash
     uv run --project tools/apk-lab apk-lab check <artifact> --mpp patches/build/libs/patches-*.mpp --package <pkg> --all
     ```
   - Enforces Morphe execution success, unchanged package/version identity, SDK DEX verification (`dexdump -c`), and member byte deltas.
5. **Defensive Patch-Time Invariants**:
   - All patches must enforce strict preconditions. If class names, method signatures, or byte sequences differ from the expected target version, the patch must immediately throw `PatchException` rather than producing a corrupt APK.
6. **Local Artifact & Bytecode Inspection**:
   - Use `apk-lab analyze <artifact> --smali` to decompile and inspect smali in a marked, managed run.
   - Disassemble output APK with `jadx` or `baksmali` to verify Dalvik method injections.
   - Inspect `assets/index.android.bundle` using Hermes disassemblers (`hbctool` or `hermes-dec`) to verify opcode and string edits.
7. **Device Smoke Testing**:
   - Install the patched APK on an emulator or device (`adb install -r <patched-apk>`).
   - Verify user flows, settings toggles, and UI behavior.
   - Monitor `adb logcat` to confirm ad and tracking SDK initializations are neutralized without throwing unhandled exceptions.
