# APK Lab: Deterministic APK Analysis and Compatibility Toolkit

`apk-lab` is the repository's deterministic toolchain for reverse engineering Android applications, managing APK/APKM/XAPK artifacts, running fail-fast patch compatibility tests via Morphe Desktop, and managing private cloud test fixtures in Cloudflare R2.

---

## 1. Prerequisites and Installation

### Host Prerequisites
- **Python**: Version `3.12+` managed via `uv`.
- **Java**: JDK `21+` (Eclipse Temurin recommended).
- **Android SDK Build Tools**: Version `36.0.0` (`aapt2`, `apksigner`, `zipalign`, `dexdump`).
  - Path detected automatically from `ANDROID_HOME`, `ANDROID_SDK_ROOT`, or repository `local.properties` (`sdk.dir`).
- **uv**: Fast Python package installer and virtualenv manager.

### Setup & Toolchain Installation
Tools are pinned in `tools/apk-lab/tools.lock.json` with official download URLs and immutable SHA-256 digests. Only `apk-lab setup` downloads external tools.

```bash
# Sync Python virtual environment
uv sync --locked --project tools/apk-lab

# Install pinned analysis tools (Morphe Desktop 1.18.0, JADX 1.5.6, Apktool 3.0.3, baksmali 3.0.10)
uv run --project tools/apk-lab apk-lab setup --profile analysis

# Install CI profile (includes apkeep on Linux x86-64)
uv run --project tools/apk-lab apk-lab setup --profile ci

# Verify host prerequisites, tool caches, and workspace permissions
uv run --project tools/apk-lab apk-lab doctor

# Doctor verification in CI mode (checks presence of credentials without leaking values)
uv run --project tools/apk-lab apk-lab doctor --ci --json
```

---

## 2. Command Reference

### `inspect` — Artifact Inspection
Validates archive security (path traversal, duplicate names, zip bomb ratio limits, encryption) and parses container structure, signing certificates, splits, DEX counts, native libraries, and assets by content rather than file suffix.

```bash
# Human readable inspection
uv run --project tools/apk-lab apk-lab inspect path/to/app.apkm

# JSON output (creates no persistent workspace)
uv run --project tools/apk-lab apk-lab inspect path/to/app.apkm --json -
```

### `analyze` — Managed Extraction & Decompilation
Extracts artifacts into a managed run directory under `.apk-lab/<package>/<versionCode>-<inputShaPrefix>/<configDigest>/` with `.marker.json` metadata.

```bash
# Default: metadata + smali disassembly
uv run --project tools/apk-lab apk-lab analyze path/to/app.apkm

# Include JADX Java decompilation
uv run --project tools/apk-lab apk-lab analyze path/to/app.apkm --jadx

# Include Apktool resource decoding
uv run --project tools/apk-lab apk-lab analyze path/to/app.apkm --apktool
```

The command extracts all native `.so` shared libraries across the base APK and architecture splits into `<workspace>/lib/<arch>/` (e.g. `lib/arm64-v8a/libil2cpp.so`), and prints the exact directory and matching cleanup command upon completion.

### `compare` — Artifact Diffing
Compares two APK/APKM artifacts across version codes, signing certificates, split members, DEX classes/methods delta, native libraries, and assets.

```bash
uv run --project tools/apk-lab apk-lab compare old_version.apkm new_version.apkm

# Save JSON diff report
uv run --project tools/apk-lab apk-lab compare old_version.apkm new_version.apkm --json report.json

# Decompile and diff specific classes with JADX (reports unchanged, modified, added, removed, or missing)
uv run --project tools/apk-lab apk-lab compare old_version.apkm new_version.apkm --class com.example.Foo
```

### `check` — Real Patch Compatibility Testing
Applies patch bundles (`.mpp`) to an artifact using Morphe Desktop in isolated runs. Runs the default option configuration and independently inverts every boolean option to test all boundary cases. Validates postconditions:
- Output is a valid APK.
- Package name, version name, and version code remain unchanged.
- Android SDK DEX structural verification passes (`dexdump -c`).
- Uncompressed members changed in output while unrelated sentinels remain byte-identical.
- Extension classes (`app/aidan/extension/...`) are inventoried.

```bash
# Test specific patch with all option permutations
uv run --project tools/apk-lab apk-lab check path/to/app.apkm \
  --mpp patches/build/libs/patches-X.X.X.mpp \
  --package com.example.app \
  --patch "Patch Name"

# Test ALL compatible patches declared for the package
uv run --project tools/apk-lab apk-lab check path/to/app.apkm \
  --mpp patches/build/libs/patches-X.X.X.mpp \
  --package com.example.app \
  --all

# Retain workspace scratch files for inspection (ephemeral by default)
uv run --project tools/apk-lab apk-lab check path/to/app.apkm \
  --mpp patches/build/libs/patches-X.X.X.mpp \
  --package com.example.app \
  --all \
  --keep-workspace
```

### `clean` — Managed Workspace Cleanup
Safely removes managed run directories. Strictly refuses symlinks, directories missing `.marker.json`, and paths outside the workspace root.

```bash
# Clean specific run
uv run --project tools/apk-lab apk-lab clean --run .apk-lab/com.example/run-dir

# Clean all runs for an application package
uv run --project tools/apk-lab apk-lab clean --package com.example.app

# Clean runs older than N days
uv run --project tools/apk-lab apk-lab clean --stale 7

# Dry-run preview
uv run --project tools/apk-lab apk-lab clean --package com.example.app --dry-run
```
### `asm` — ARM64 Instruction Assembler & Branch Relocator
Encodes ARM64 machine instructions and computes 26-bit relative branch relocations (`b`, `bl`), returns (`ret`), and register moves (`mov`/`movz`). Deterministically formats output as space-separated hex bytes, integer opcodes, or Morphe Kotlin `byteArrayOf(...)` arrays with appropriate `.toByte()` casting for signed bytes.

```bash
# Calculate relative branch and encode to little-endian hex bytes
uv run --project tools/apk-lab apk-lab asm "bl 0x3c98ce4" --pc 0x1fcf6e8
# Output: 7f 25 73 94

# Encode return instruction directly to Kotlin byteArrayOf syntax
uv run --project tools/apk-lab apk-lab asm "ret" --format kotlin
# Output: byteArrayOf(0xc0.toByte(), 0x03, 0x5f, 0xd6.toByte())

# Encode immediate register move
uv run --project tools/apk-lab apk-lab asm "mov w1, #1"
# Output: 21 00 80 52
```
### `il2cpp` — Unity IL2CPP Metadata Extraction & Symbol Mapping
Extracts and parses Unity `assets/bin/Data/Managed/Metadata/global-metadata.dat` and companion native shared libraries (`lib/<arch>/libil2cpp.so`) across single APKs and multi-split container bundles (APKM, APKS, XAPK). Enables instant querying of stripped C# type definitions, method signatures, parameter counts, and namespaces without external tooling.

```bash
# Query symbols matching a method name substring
uv run --project tools/apk-lab apk-lab il2cpp path/to/game.apkm --query OpenShop

# Export all symbols or matches to JSON stdout or file
uv run --project tools/apk-lab apk-lab il2cpp path/to/game.apkm --query "Blackjack.*" --json symbols.json
```
### `unity` — Unity Serialized Asset & GameObject Inspector
Inspects Unity serialized asset files (`assets/bin/Data/*.assets`, `*.assets.split*`, `globalgamemanagers`) across single APKs and multi-split container bundles (APKM, APKS, XAPK). Locates `GameObject` records by name, reports their containing split chunk, and calculates the exact byte offset and value of the `m_IsActive` boolean property for direct Morphe raw resource patching.

```bash
# Locate GameObject and calculate active-state byte offset
uv run --project tools/apk-lab apk-lab unity path/to/game.apkm --gameobject Button_HelpCenter

# Output matches as JSON
uv run --project tools/apk-lab apk-lab unity path/to/game.apkm --gameobject Button_HelpCenter --json
```




### `fixtures` — Private R2 Cloud Fixtures
Manages the two-slot private R2 storage architecture (`fixtures/<package>/latest` and `fixtures/<package>/target`).

```bash
# Seed a target slot from a verified local artifact
uv run --project tools/apk-lab apk-lab fixtures seed \
  --package com.example.app \
  --role target \
  --artifact path/to/app.apkm

# Inspect slot metadata in R2
uv run --project tools/apk-lab apk-lab fixtures info --package com.example.app

# Download a fixture slot
uv run --project tools/apk-lab apk-lab fixtures download \
  --package com.example.app \
  --role target \
  --out /tmp/target.apk
```

### `acquire` — Artifact Acquisition from Google Play
Downloads and normalizes Android application artifacts directly from the Google Play Store using `apkeep` (native Play Store downloader) or `goopdl` fallback. Validates downloaded package signatures, container integrity, and version metadata.

```bash
# Acquire latest version of an application package
uv run --project tools/apk-lab apk-lab acquire com.example.app

# Acquire specific version to an explicit output directory
uv run --project tools/apk-lab apk-lab acquire com.example.app --version 2.22.08 --out-dir /tmp/artifacts
```

---

## 3. Standard Workflows

### Authoring Patches for a New Application
1. **Inspect**: Run `apk-lab inspect <artifact>` to determine package name, version, signing cert SHA-256, and container structure.
2. **Analyze**: Run `apk-lab analyze <artifact> --smali` to extract smali and native shared libraries (`lib/<arch>/*.so`) into a managed run.
3. **Native & Unity Inspection** (if applicable):
   - For Unity IL2CPP applications: Run `apk-lab il2cpp <artifact> --query <Symbol>` to locate stripped C# classes and method signatures in `global-metadata.dat`.
   - For Unity serialized assets: Run `apk-lab unity <artifact> --gameobject <Name>` to find GameObject entries and calculate `m_IsActive` byte offsets across asset splits.
   - For ARM64 binary patches: Run `apk-lab asm "<instruction>" --pc <pc> --format kotlin` to calculate 26-bit branch offsets and emit Morphe Kotlin `byteArrayOf(...)` hooks.
4. **Implement**: Define fail-fast Morphe bytecode and resource patches in Kotlin using `bytecodePatch`, `resourcePatch`, or `rawResourcePatch`. Register `Compatibility(name, packageName, apkFileType, signatures, targets)`.
5. **Compile**: Run `./gradlew :patches:buildAndroid --no-daemon`.
6. **Verify**: Run `apk-lab check <artifact> --mpp patches/build/libs/patches-*.mpp --package <pkg> --all`.
7. **Device Smoke Test**: Install patched APK on an emulator or test device (`adb install -r output.apk`) and smoke test user flows.
8. **Clean**: Clean the workspace with `apk-lab clean --run <path>`.

### Migrating Existing Patches on App Updates
1. **Acquire or Ingest**: Download update via `apk-lab acquire <pkg>` or load from local artifact.
2. **Compare**: Run `apk-lab compare <old_artifact> <new_artifact>` to identify changed DEX method counts, split changes, native libraries, and resource modifications.
3. **Forced Baseline Check**: Run `apk-lab check <new_artifact> --mpp <bundle> --package <pkg> --all --force` to capture the failing-before baseline and pinpoint obsolete anchors.
4. **Analyze & Remap**: Run `apk-lab analyze <new_artifact> --smali` to rediscover changed classes, obfuscated descriptors, and instructions using stable landmarks. For native/Unity patches, rerun `apk-lab il2cpp` and `apk-lab unity` to update shifted offsets.
5. **Update Source**: Update patch definitions, extension classes, and bump target in `Constants.kt`.
6. **Matrix Check**: Rebuild and run `apk-lab check <new_artifact> --mpp <bundle> --package <pkg> --all`. Require 100% pass rate.
7. **Documentation & List**: Update reverse engineering specs in `docs/<app>/`, run `./gradlew generatePatchesList`, and sync README with `generate_patches_readme.py`.

---

## 4. Invariants & Storage Rules

- **Durable vs. Disposable**: Durable repository changes are patch Kotlin sources, Java extension sources, compatibility metadata, docs, tests, and web UI. APK files, decompiled smali/java trees, patched APK outputs, and downloader tokens are **disposable and never committed**.
- **Private Fixtures**: APK fixture bytes exist only in runner temp memory or the private `aidans-patches-apk-fixtures` R2 bucket. Public worker endpoints and status APIs only return metadata and status badges, never proprietary binaries.
- **Fail-Fast Invariant**: All patches enforce strict preconditions; if bytecode shapes differ, patches throw `PatchException` rather than generating corrupted APKs.
