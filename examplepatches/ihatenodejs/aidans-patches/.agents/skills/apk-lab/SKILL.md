---
name: apk-lab
description: Deterministic APK reverse engineering, inspection, decompilation, patch compatibility, ARM64 assembly, and device testing toolkit. Use when inspecting Android packages, extracting Smali/Java bytecode, validating Dalvik registers/CFGs, patching ARM64 binaries or Unity IL2CPP assets, testing Morphe patch compatibility, or deploying/monitoring apps on device.
---

# APK Lab: Deterministic APK Reverse Engineering & Compatibility Toolkit

`apk-lab` is the repository's deterministic native Rust toolchain located in `tools/apk-lab/`. It provides fail-fast APK inspection, container normalization, bytecode disassembly, Dalvik register/CFG validation, ARM64 branch instruction assembly, Unity asset inspection, Morphe patch compatibility verification, device deployment, and runtime health monitoring.

---

## 1. Why Use Existing APK Lab Tools Over Ad-Hoc Scripts

Agents must use the built-in `apk-lab` utilities rather than writing temporary bash scripts or custom Python tools:

1. **Split-Container Awareness**: Real Android apps ship as split bundles (`.apkm`, `.xapk`, `.apks`) with multi-DEX files (`classes*.dex`) scattered across splits. Ad-hoc `unzip` commands miss splits, confuse base manifests, and risk zip-slip vulnerabilities.
2. **Dalvik Architecture Invariants**: Dalvik opcodes have strict register bit-widths (e.g., format `22c` `instance-of` is restricted to 4-bit registers `v0..v15`). `apk-lab validate-smali` statically catches register overflows, invalid literal ranges, and broken CFGs before patch compilation.
3. **ARM64 Branch Calculations**: Calculating 26-bit PC-relative branches (`bl`, `b`) and formatting signed bytes for Kotlin `byteArrayOf(...)` by hand is error-prone. `apk-lab asm` computes branch relocations and outputs Kotlin syntax directly.
4. **Isolated & Safe Workspaces**: `apk-lab analyze` and `apk-lab check` run inside deterministic, marked workspaces (`.apk-lab/`) with schema-1 `.marker.json` files (ephemeral check runs removed unless `--keep-workspace`). Safe cleanup (`apk-lab clean`) strictly prevents deleting symlinks or unmanaged paths.
5. **Real Morphe Verification**: Compatibility cannot be deduced from metadata alone. `apk-lab check` executes Morphe Desktop across the baseline configuration plus independent inversions for each declared boolean option and validates the output with Android SDK `dexdump -c`.

---

## 2. Invocation Syntax

All tools execute directly from the repository root through Cargo:

```bash
# Canonical development command
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- <subcommand> [flags]

# CI/release builds once and executes the binary directly
cargo build --release --locked --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab
tools/apk-lab/target/release/apk-lab <subcommand> [flags]
```

---

## 3. Progressive Disclosure: Reference Directory Map

To conserve context tokens, read only the specific reference file needed for your current task:

| Task / Domain                 | Subcommands & Modules                                                              | Reference Document                                                                                                         |
| ----------------------------- | ---------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| **Toolchain & Workspace**     | `setup`, `doctor`, `clean`, `workspace.rs`, `tools.rs`                             | [Toolchain Reference](references/toolchain.md)<br>`skill://apk-lab/references/toolchain.md`                                |
| **Inspection & Diffing**      | `inspect`, `compare`, `inspection.rs`, `comparison.rs`, `archives.rs`              | [Inspection & Comparison](references/inspection-comparison.md)<br>`skill://apk-lab/references/inspection-comparison.md`    |
| **Decompilation & Smali**     | `analyze`, `inspect-code`, `validate-smali`, `code_inspection.rs`, `smali.rs`      | [Decompilation & Code Inspection](references/decompilation-code.md)<br>`skill://apk-lab/references/decompilation-code.md`  |
| **Resources & Native/Unity**  | `res`, `unity`, `asm`, `il2cpp`, `resources.rs`, `unity.rs`, `asm.rs`, `il2cpp.rs` | [Resources, Assets & Assembly](references/resources-assets.md)<br>`skill://apk-lab/references/resources-assets.md`         |
| **Patch Compatibility & CI**  | `check`, `compatibility_ci.rs`, `morphe.rs`                                        | [Patch Verification & CI](references/patch-verification.md)<br>`skill://apk-lab/references/patch-verification.md`          |
| **Device Testing & Health**   | `deploy`, `monitor`, `deployment.rs`, `device.rs`                                  | [Device Testing & Monitoring](references/device-testing.md)<br>`skill://apk-lab/references/device-testing.md`              |
| **Acquisition & R2 Fixtures** | `acquire`, `fixtures`, `acquisition.rs`, `fixtures.rs`                             | [Acquisition & Cloud Fixtures](references/fixtures-acquisition.md)<br>`skill://apk-lab/references/fixtures-acquisition.md` |

---

## 4. Standard Operational Workflows

### Workflow A: Inspecting an Unknown APK or Bundle

1. Read `skill://apk-lab/references/inspection-comparison.md`.
2. Run `apk-lab inspect <artifact>` to determine container type, package name, version, signing certificate, splits, and DEX metrics.

### Workflow B: Authoring Patches for a New Target App

1. Read `skill://apk-lab/references/decompilation-code.md` and `references/resources-assets.md`.
2. Run `apk-lab analyze <artifact> --smali` to extract smali and native shared libraries into `.apk-lab/`.
3. If Unity: run `apk-lab il2cpp <artifact> --query <name>` or `apk-lab unity <artifact> --gameobject <name>`.
4. If native ARM64: run `apk-lab asm "<instruction>" --pc <pc> --format kotlin`.
5. If Dalvik: validate Smali snippets with `apk-lab validate-smali --snippet "..." --locals N --params N`.
6. Implement patch in `patches/src/main/kotlin/app/aidan/patches/<app>/...`.
7. Compile: `./gradlew :patches:buildAndroid`.
8. Verify: `apk-lab check <artifact> --mpp patches/build/libs/patches-*.mpp --package <pkg> --all`.
9. Clean: `apk-lab clean --run <run_path>`.

### Workflow C: Migrating Patches on App Updates

1. Read `skill://apk-lab/references/inspection-comparison.md` and `references/patch-verification.md`.
2. Acquire update: `apk-lab acquire <pkg>` or load updated artifact.
3. Compare versions: `apk-lab compare <old_artifact> <new_artifact> --class <TargetClass>`.
4. Capture failing baseline: `apk-lab check <new_artifact> --mpp <bundle> --package <pkg> --all --force`.
5. Surgical inspection of changed methods: `apk-lab inspect-code <new_artifact> --class <Class> --method <Method> --compare <old_artifact>`.
6. Update patch anchors and bump target in `Constants.kt`.
7. Verify all patches pass: `apk-lab check <new_artifact> --mpp <bundle> --package <pkg> --all`.

### Workflow D: Deploying & Smoke Testing on Device

1. Read `skill://apk-lab/references/device-testing.md`.
2. Rapid iteration shortcut: `apk-lab dev <app>` (auto-builds patches, locates artifact, signs with negotiated keystore, deploys, and launches).
3. Or manual deploy: `apk-lab deploy <artifact> --mpp <bundle> --package <pkg> --all --launch` (or with `--build` to compile automatically).
4. Watch health: `apk-lab monitor --package <pkg> --timeout 10.0 --dump-threads`.
5. Inspect crashes with Smali resolution: `apk-lab crash-trace --package <pkg>`.

---

## 5. Command Reference Quick Index

| Command          | Summary                                | Key Flags                                                                                                                                                                      | Reference                                                       |
| ---------------- | -------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------- |
| `setup`          | Install pinned toolchain               | `--profile {analysis,ci}`                                                                                                                                                      | [toolchain.md](references/toolchain.md)                         |
| `doctor`         | Verify prerequisites & cache           | `--ci`, `--profile`, `--json`                                                                                                                                                  | [toolchain.md](references/toolchain.md)                         |
| `clean`          | Safely clean workspace runs            | `--run`, `--package`, `--stale`, `--dry-run`                                                                                                                                   | [toolchain.md](references/toolchain.md)                         |
| `inspect`        | Secure artifact inspection             | `--json [PATH\|-]`                                                                                                                                                             | [inspection-comparison.md](references/inspection-comparison.md) |
| `compare`        | Compare two APK versions               | `--class CLASS`, `--json [PATH\|-]`                                                                                                                                            | [inspection-comparison.md](references/inspection-comparison.md) |
| `analyze`        | Managed extraction & disassembly       | `--jadx`, `--apktool`, `--smali`, `--class`                                                                                                                                    | [decompilation-code.md](references/decompilation-code.md)       |
| `inspect-code`   | Surgical class/method diffing          | `--class`, `--method`, `--format`, `--compare`                                                                                                                                 | [decompilation-code.md](references/decompilation-code.md)       |
| `validate-smali` | Pre-injection register/CFG check       | `--snippet`, `--locals`, `--params`, `--descriptor`, `--is-static`                                                                                                             | [decompilation-code.md](references/decompilation-code.md)       |
| `res`            | Cross-split resource inspector         | `--query`, `--text` / `--value`, `--extract DIR`                                                                                                                               | [resources-assets.md](references/resources-assets.md)           |
| `unity`          | Unity GameObject offset locator        | `--gameobject NAME`, `--json`                                                                                                                                                  | [resources-assets.md](references/resources-assets.md)           |
| `asm`            | ARM64 branch assembler                 | `--pc`, `--target`, `--format {hex,kotlin,...}`                                                                                                                                | [resources-assets.md](references/resources-assets.md)           |
| `il2cpp`         | Unity C# symbol query                  | `--query QUERY`, `--json`                                                                                                                                                      | [resources-assets.md](references/resources-assets.md)           |
| `check`          | Morphe patch compatibility             | `--mpp`, `--package`, `--all`, `--patch`, `--force`, `--keep-workspace`, `--json`                                                                                              | [patch-verification.md](references/patch-verification.md)       |
| `deploy`         | Patch, sign, install & launch          | `--mpp`, `--build`, `--package`, `--all`, `-e`, `-O`, `--device`, `--launch`, `--clean-install`, `--reinstall`, `--keystore`, `--ks-alias`, `--ks-pass`, `--key-pass`, `--out` | [device-testing.md](references/device-testing.md)               |
| `dev`            | Build, locate, deploy & launch loop    | `app`, `--device`, `--launch`, `--all`, `--reinstall`, `--clean-install`                                                                                                       | [device-testing.md](references/device-testing.md)               |
| `monitor`        | CPU spin, ANR & crash watcher          | `--package`, `--device`, `--timeout`, `--dump-threads`                                                                                                                         | [device-testing.md](references/device-testing.md)               |
| `crash-trace`    | Smali-aware crash harvester            | `--package`, `--device`, `--lines`, `--json`                                                                                                                                   | [device-testing.md](references/device-testing.md)               |
| `ui`             | Device UI dump & click automation      | `dump`, `click`, `--device`, `--text`, `--desc`, `--coords`, `--clickable`, `--json`                                                                                           | [device-testing.md](references/device-testing.md)               |
| `ci`             | Compatibility CI orchestration         | `matrix`, `start`, `run`, `--patches-list`, `--mpp`, `--output-file`                                                                                                           | [patch-verification.md](references/patch-verification.md)       |
| `selftest`       | Native contract self-check             | `--json [PATH\|-]`                                                                                                                                                             | [toolchain.md](references/toolchain.md)                         |
| `acquire`        | Download from Play, APKMirror, APKPure | `--version`, `--version-code`, `--out-dir`                                                                                                                                     | [fixtures-acquisition.md](references/fixtures-acquisition.md)   |
| `fixtures`       | Manage R2 fixture slots                | `seed`, `info`, `download`, `--package`, `--role`                                                                                                                              | [fixtures-acquisition.md](references/fixtures-acquisition.md)   |
| `play-accounts`  | Manage Google Play accounts            |                                                                                                                                                                                | [fixtures-acquisition.md](references/fixtures-acquisition.md)   |
