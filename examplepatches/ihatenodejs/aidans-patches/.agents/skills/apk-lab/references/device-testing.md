# Device Deployment, Keystore Signing & Runtime Health Monitoring

Apply Morphe patches, align, sign with debug keystore, stream to connected ADB devices, cold-launch activities, and monitor runtime process health, CPU spin, ANRs, and crashes.

---

## 1. `deploy` — Deterministic Patch, Sign & Install

Applies Morphe patches from a `.mpp` bundle to an APK or split container (APKM/XAPK/APKS), aligns with `zipalign`, signs with the negotiated keystore, installs to an ADB device/emulator, and optionally cold-launches the app.

### Deployment Pipeline & Invariants

1. **Patch Application**: Executes pinned Morphe Desktop in a temporary scratch workspace.
2. **Alignment**: Runs `zipalign -f 4` to align 32-bit and 64-bit uncompressed shared libraries to 4-byte boundaries.
3. **Keystore Negotiation & Signing**:
   - Signs the aligned APK using `apksigner`.
   - **Automatic Keystore Negotiation**: If `--keystore` is omitted, `apk-lab` inspects the installed package signature on the target device via ADB. If the installed app signature matches Morphe's bundled key (`6959a7790bff42cc...`), Morphe's cached keystore (`morphe-data/morphe.keystore`) is used automatically with alias `Morphe` and password `Morphe`, avoiding `INSTALL_FAILED_UPDATE_INCOMPATIBLE`. Otherwise, it defaults to the standard Android debug keystore (`~/.android/debug.keystore`, auto-created with secure `0600` permissions if absent).
   - Explicit credentials can be provided via `--keystore PATH`, `--ks-alias ALIAS`, `--ks-pass-file PATH`, and `--key-pass-file PATH`. The file forms must point at a `0600` regular file and are mutually exclusive with the inline `--ks-pass`/`--key-pass` flags.
4. **ADB Streaming Install**:
   - Default / `--reinstall`: Runs `adb install -r` (preserves existing app data and sandbox).
   - `--clean-install`: Attempts `adb uninstall <package>` first (clears app data; uninstall failure is ignored), then `adb install`.
5. **Launcher Activity Execution**: When `--launch` is passed, parses the launchable activity from manifest badging and invokes `adb shell am start -n <package>/<activity>`.
6. **Atomic File Staging & Input Preservation**: Staging occurs inside a temporary directory in the final output's parent folder, so the final `fs::rename` stays on one filesystem and replaces the destination atomically. Output paths are checked upfront to guarantee they never alias or overwrite the source artifact. Failures before destination replacement leave existing output files untouched; installation or launch failures occur after the destination file has already been replaced.

### CLI Invocation

```bash
# Deploy all default-compatible patches to the connected device and cold-launch
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- deploy path/to/app.apkm \
  --mpp patches/build/libs/patches-X.X.X.mpp \
  --package com.example.app \
  --all \
  --launch

# Automatically compile patch bundle via Gradle and deploy
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- deploy path/to/app.apkm \
  --build \
  --package com.example.app \
  --all

# Deploy with custom keystore credentials
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- deploy path/to/app.apkm \
  --mpp patches/build/libs/patches-X.X.X.mpp \
  --package com.example.app \
  --all \
  --keystore /path/to/custom.keystore \
  --ks-alias mykey \
  --ks-pass-file /path/to/ks.pass \
  --key-pass-file /path/to/key.pass

# Clean install (destructively clears existing app data before installing)
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- deploy path/to/app.apkm \
  --mpp patches/build/libs/patches-X.X.X.mpp \
  --package com.example.app \
  --all \
  --clean-install
```

### CLI Arguments

- `artifact` (required positional): Path to APK/APKM/XAPK/APKS.
- `--mpp MPP`: Path to `.mpp` patch bundle (required unless `--build` is specified).
- `--build`: Automatically compile newest `.mpp` patch bundle via Gradle (`./gradlew :patches:buildAndroid`).
- `--package PACKAGE`: Package name (auto-detected from the artifact when omitted).
- `--all` or `-e` / `--enable PATCH ...` (mutually exclusive): `--all` selects every compatible patch marked `default: true` plus dependencies, while `-e` selects explicit patch names. When neither is given, `deploy` defaults to `--all`.
- `-O` / `--option KEY=VALUE ...`: Configuration options for selected patches.
- `--device SERIAL`: Target specific ADB device serial (required only if multiple devices connected).
- `--launch`: Cold-launch the main activity after installation.
- `--reinstall`: Reinstall preserving data (`adb install -r`, default).
- `--clean-install`: Uninstall before install (`adb uninstall && adb install`).
- `--keystore PATH`: Custom signing keystore. When supplied, `--ks-alias` and `--ks-pass` default to `androiddebugkey` and `android` only if omitted; `--key-pass` defaults to the store password.
- `--out PATH`: Copy the patched, signed APK to a specific output path.
- `--ks-alias ALIAS`: Keystore key alias (default: the negotiation-selected alias).
- `--ks-pass PASS`: Keystore password (default: the negotiation-selected password). Inline values are visible in process listings; prefer `--ks-pass-file`.
- `--key-pass PASS`: Key password (default: the keystore password). Inline values are visible in process listings; prefer `--key-pass-file`.
- `--ks-pass-file PATH`: Read the keystore password from a `0600` regular file. Mutually exclusive with `--ks-pass`.
- `--key-pass-file PATH`: Read the key password from a `0600` regular file. Mutually exclusive with `--key-pass`.

### Exit Codes

- `0`: Deployment succeeded.
- `2`: Usage error, missing files, or device selection error.
- `4`: Infrastructure error (ADB failure, Morphe failure, signing error).

---

## 2. `monitor` — Runtime Process Health, Spin & ANR Watcher

Hooks into a running or freshly launched app process via ADB, monitors main thread CPU utilization, detects infinite spin loops, catches ANRs and native crashes, and retrieves diagnostic stack traces.

### Monitoring & Detection Rules

- **Main Thread CPU Spin Detection**:
  - Samples `/proc/<pid>/task/<pid>/stat` (TID == PID) and `/proc/stat` at 500ms intervals.
  - Flags a **High CPU Spin Warning** and exits with code `5` (`RUNTIME_FAILURE`) if the main thread sustains State `R` (running) and $\ge 90\%$ CPU for 3.0 consecutive seconds (6 samples).
- **ANR Detection**:
  - Monitors live logcat for `ANR in <package>` and `BIND APPLICATION ANR`.
  - Immediately exits with code `5` (`RUNTIME_FAILURE`).
- **Crash Detection**:
  - Catches unhandled Java exceptions and native crashes (e.g. `SIGSEGV`, `SIGABRT`).
  - Immediately exits with code `5` (`RUNTIME_FAILURE`).
- **Process Exit & Diagnostics**:
  - On process termination, inspects `dumpsys activity exit-info`.
  - Reasons `4` (`CRASH`), `5` (`CRASH_NATIVE`), and `6` (`ANR`) return exit code `5`.
  - Clean exits return exit code `0`.
- **Thread Dump Capture**:
  - When `--dump-threads` is enabled, sends `kill -3` to the target PID upon detecting ANR or high CPU spin and extracts the thread traces from logcat.

### CLI Invocation

```bash
# Monitor application process for 10 seconds
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- monitor \
  --package com.example.app \
  --timeout 10.0

# Monitor with automatic thread dump capture on ANR or spin
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- monitor \
  --package com.example.app \
  --device emulator-5554 \
  --dump-threads
```

### CLI Arguments

- `--package PACKAGE` (required): Package name to monitor.
- `--device SERIAL`: Specific ADB device serial.
- `--timeout SECONDS`: Monitoring duration (default: monitor until exit or Ctrl+C).
- `--dump-threads`: Capture thread dump on spin or ANR.

### Exit Codes

- `0`: Healthy monitoring session or clean process termination.
- `2`: Device not connected or multiple devices without `--device`.
- `5`: `RUNTIME_FAILURE` — Package did not start before `--timeout`, high CPU spin loop, ANR, crash, or fatal exit-info reason.

## 3. `crash-trace` — Smali-Aware Crash Harvester

Harvests recent Android logcat crash reports for a package, extracting fatal exceptions, ANRs, and verification errors. When an analysis workspace exists at `.apk-lab/<package>`, stack trace frames are cross-referenced with Smali bytecode across multi-dex directories (`smali/`, `smali_classes2/`, etc.) to show exact file locations, method signatures, and instruction snippets.

### CLI Invocation

```bash
# Harvest recent crash reports for a package
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- crash-trace --package com.example.app

# Output structured JSON including resolved Smali frames
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- crash-trace \
  --package com.example.app \
  --device emulator-5554 \
  --lines 10000 \
  --json
```

### CLI Arguments

- `--package PACKAGE` (required): Target application package name.
- `--device SERIAL`: Specific ADB device serial.
- `--lines N`: Number of logcat lines to inspect (default: `5000`).
- `--json`: Output structured JSON reports including `resolved_frames` (`smali_path`, `method_signature`, `code_snippet`).

---

## 4. `dev` — Rapid Iteration Workflow

Automates the inner development loop for patch development. Executes a complete iteration cycle with a single command:

1. **Repo Root Discovery**: Resolves the root of the Git repository containing patch sources.
2. **Patch Compilation**: Executes `./gradlew :patches:buildAndroid` to compile the newest `.mpp` patch bundle.
3. **Artifact Discovery**: Locates the matching target APK/APKM artifact for the given application slug/name.
4. **Package Inspection**: Inspects the artifact manifest to extract the target package name.
5. **Keystore Negotiation & Deployment**: Evaluates target device signatures, resolves the appropriate keystore (Morphe vs. debug), applies patches, zipaligns, signs, installs to device, and cold-launches the application.

### CLI Invocation

```bash
# Iterate on an app: compile patches, locate artifact, deploy, and launch
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- dev geocaching

# Target specific emulator with clean installation
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- dev sezzle --device emulator-5554 --clean-install
```

### CLI Arguments

- `app` (required positional): Application name or package identifier (e.g. `geocaching`, `sezzle`).
- `--device SERIAL`: Specific ADB device serial.
- `--launch`: Launch main activity after installation (default: `True`).
- `--all`: Apply all compatible patches (default: `True`).
- `--reinstall`: Reinstall preserving data (`adb install -r`, default).
- `--clean-install`: Clean install by uninstalling first.

---

## 5. Native Library and Test References

There is no supported Python API. The CLI is the stable contract; Rust modules
(`device.rs`, `deployment.rs`, `tools.rs`) back the commands above and are covered by
`cargo test --locked --manifest-path tools/apk-lab/Cargo.toml`.
