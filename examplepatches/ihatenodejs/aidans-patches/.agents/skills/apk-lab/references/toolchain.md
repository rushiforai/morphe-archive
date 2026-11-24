# APK Lab Toolchain & Workspace Management

Manage host prerequisites, pinned reverse engineering binaries, diagnostics, and managed scratch workspaces for APK analysis.

---

## 1. Prerequisites & Host Requirements

APK Lab orchestrates external tools pinned with immutable SHA-256 digests in `tools/apk-lab/tools.lock.json`. Before running analysis, verify the host environment:

| Requirement                | Supported Versions                                     | Resolution / Detection Order                                                                                            |
| -------------------------- | ------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------- |
| **Rust / Cargo**           | Stable toolchain                                       | `cargo` on PATH; builds `tools/apk-lab`                                                                                 |
| **Java / JDK**             | `21+` (Eclipse Temurin recommended)                    | PATH (`java`)                                                                                                           |
| **Android Build Tools**    | `36.0.0` (`aapt2`, `apksigner`, `zipalign`, `dexdump`) | `$ANDROID_HOME/build-tools/`, `$ANDROID_SDK_ROOT/build-tools/`, `local.properties` (`sdk.dir`)                          |
| **Android Platform Tools** | `adb`                                                  | `$ANDROID_HOME/platform-tools/adb`, `$ANDROID_SDK_ROOT/platform-tools/adb`, PATH (runtime only; not probed by `doctor`) |

External tools cached in `~/.cache/aidans-patches/apk-lab/tools/`:

- **Morphe Desktop**: `1.18.0` (JAR)
- **JADX**: `1.5.6` (ZIP with bin/jadx)
- **Apktool**: `3.0.3` (JAR)
- **baksmali**: `3.0.10` (JAR)
- **smali**: `3.0.10` (JAR)
- **apkeep**: `1.1.0` (native binary, Linux x86_64 only; CI profile)

---

## 2. CLI Reference

Global options (e.g. `--workspace-root PATH`, default: `.apk-lab`) precede the subcommand:

```bash
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- [--workspace-root PATH] <subcommand> [flags]
```

### `setup` — Toolchain Download & Verification

Downloads and verifies all pinned tools for the specified profile using SHA-256 checksums from `tools.lock.json`.

```bash
# Install analysis tools (Morphe Desktop, JADX, Apktool, baksmali, smali)
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- setup --profile analysis

# Install CI tools (analysis profile + apkeep on Linux x86_64)
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- setup --profile ci
```

- **Arguments**:
  - `--profile {analysis,ci}`: Tool profile (default: `analysis`).
- **Exit Codes**:
  - `0`: All tools installed and passed version probe.
  - `2`: Download, verification, probe, or unsupported platform failure.

### `doctor` — Diagnostics & Prerequisite Check

Validates host tools, cache status, workspace write access, and optional CI credential presence.

```bash
# Check host readiness and cached tool status
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- doctor

# Check in CI mode with JSON output to stdout
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- doctor --ci --json -

# Save diagnostic report to file
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- doctor --json report.json
```

- **Arguments**:
  - `--ci`: Check CI credentials (`APKEEP_ACCOUNTS`, `R2_ACCOUNT_ID`, `R2_ACCESS_KEY_ID`, `R2_SECRET_ACCESS_KEY`, `COMPATIBILITY_STATUS_SECRET`) as boolean flags without printing values.
  - `--profile {analysis,ci}`: Check prerequisites for specified profile.
  - `--json [PATH|-]`: Output structured JSON (stdout if `-` or flag without path).
- Note: To customize the workspace root, pass global `--workspace-root PATH` before `doctor`.
- **Exit Codes**:
  - `0`: All prerequisites and tools satisfied.
  - `2`: Missing prerequisite, uninstalled tool, or unwritable workspace.

### `clean` — Safe Managed Workspace Cleanup

Safely removes run directories created under `.apk-lab/`. **NEVER** use raw `rm -rf` on workspace folders; `clean` enforces safety checks.

```bash
# Clean a specific run directory
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- clean --run .apk-lab/com.example.app/100-abc123456789/def987654321

# Clean all runs for a specific package
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- clean --package com.example.app

# Clean all runs older than 7 days
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- clean --stale 7

# Dry-run preview of what would be removed
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- clean --package com.example.app --dry-run
```

- **Arguments**:
  - `--run PATH`: Clean specific run path.
  - `--package NAME`: Clean all runs for application package.
  - `--stale DAYS`: Clean runs older than non-negative float days.
  - `--dry-run`: List targets without deleting files.
- **Safety Invariants**:
  - Validates that target path is inside workspace root.
  - Rejects symlinks and unresolved path escapes.
  - Requires valid schema-1 `.marker.json` inside run directories.
  - `--run PATH`: strictly rejects targets with missing, corrupted, or unmanaged markers (returns exit code `2`).
  - `--package NAME` and `--stale DAYS`: safely skip invalid, unreadable, or unmarked directories and proceed with valid targets (returns exit code `0`).
  - Automatically removes empty parent package directories after cleaning runs.
- **Exit Codes**:
  - `0`: Cleanup succeeded (or completed skipping invalid candidates in package/stale mode).
  - `2`: Target not found, unsafe path, or invalid workspace marker in `--run` mode.

---

## 3. Workspace Structure & Marker Contract

Analysis runs create isolated, reproducible workspaces under `.apk-lab/`:

```text
.apk-lab/
  └── <package_name>/
      └── <version_code>-<sha256_prefix_12>/
          └── <config_and_tool_digest_12>/
              ├── .marker.json
              ├── base/
              ├── splits/
              ├── lib/
              └── smali/
```

### Marker Format (`.marker.json`)

```json
{
  "schemaVersion": 1,
  "inputCanonicalPath": "/path/to/app.apkm",
  "inputSha256": "3a7b...",
  "command": "analyze",
  "configDigest": "def987654321",
  "toolVersions": {
    "baksmali": "3.0.10",
    "jadx": "1.5.6"
  },
  "createdAt": "2026-10-10T12:00:00Z"
}
```

---

## 4. Native Library and Test References

There is no supported Python API. The CLI is the stable contract; Rust modules
(`tools.rs`, `workspace.rs`, `process.rs`) back the commands above and are covered by
`cargo test --locked --manifest-path tools/apk-lab/Cargo.toml`.
