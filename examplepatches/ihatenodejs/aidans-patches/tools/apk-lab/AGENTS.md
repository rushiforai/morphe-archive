# Repository Guidelines

Scope: the native Rust `apk-lab` CLI, its deterministic workspaces/toolchain, and the Cargo test suite.

`docs/apk-lab.md` is the full command and behavior reference. Keep it synchronized with CLI flags, output, exit codes, storage layout, and safety invariants.

## Canonical Commands

Run from the repository root:

```bash
# Development: build and run in one step
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- <subcommand> [flags]

# CI/release: build once, execute the release binary
cargo build --release --locked --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab
tools/apk-lab/target/release/apk-lab <subcommand>

# Tests
cargo test --locked --manifest-path tools/apk-lab/Cargo.toml
```

## Architecture

- `src/cli.rs`, `src/bin/apk-lab.rs`: parser, input validation, command dispatch, and exit-code mapping.
- `src/models.rs`, `src/error.rs`: shared domain models and typed errors.
- `src/archives.rs`, `src/inspection.rs`, `src/comparison.rs`: safe container handling and artifact metadata/diffs.
- `src/workspace.rs`, `src/process.rs`: deterministic managed `.apk-lab/` runs, guarded cleanup, and shell-free subprocesses.
- `src/tools.rs`, `tools.lock.json`: pinned external-tool install and checksum verification.
- `src/morphe.rs`: isolated patch execution and result validation.
- `src/analysis.rs`: managed `analyze` orchestration and native-library extraction.
- `src/compatibility_ci.rs`, `src/fixtures.rs`, `src/acquisition.rs`, `src/accounts.rs`, `src/accounts_tui.rs`: package matrix, R2 fixture lifecycle, result reporting, Play delivery, and interactive account management.
- `src/asm.rs`, `src/il2cpp.rs`, `src/unity.rs`, `src/smali.rs`, `src/resources.rs`, `src/code_inspection.rs`, `src/dex_strings.rs`, `src/manifest.rs`: targeted reverse-engineering utilities.
- `src/deployment.rs`, `src/device.rs`: patch/sign/install/launch and runtime health monitoring.
- `src/play.rs`: native Play provider boundary used by acquisition.
- `tests/`: behavior tests mirroring module boundaries.

## Runtime and Dependency Rules

- Use a stable Rust toolchain and the locked manifests; never add an unlisted runtime dependency without a lockfile update.
- External JADX/Apktool/smali/Morphe/apkeep binaries must come from `apk-lab setup` and `tools.lock.json`; preserve URL/version/SHA-256 pinning.
- Android SDK tools resolve through `ANDROID_HOME`, `ANDROID_SDK_ROOT`, or root `local.properties`; Build Tools 36.0.0 is the compatibility baseline.
- No Python runtime, package manager, or script participates in build, test, or command execution.

## Code Patterns

- Use typed return values, small domain models, and explicit dependencies/paths. Keep filesystem and subprocess boundaries visible.
- Validate untrusted archive member names, duplicate entries, compression limits, symlinks, output paths, and container identity before extraction or mutation.
- Preserve deterministic directory IDs, ordering, JSON serialization, and command output. Stable machine-readable output is an API.
- Return domain-specific errors and translate them to concise stderr plus stable exit codes at CLI boundaries. Do not swallow errors inside pure helpers.
- Make destructive operations explicit and guarded. Cleanup must verify the marker file, workspace containment, and non-symlink paths.
- Keep device/cloud/network calls injectable or mockable. Unit tests must not require credentials, a device, or network unless explicitly opt-in.
- Do not weaken verification to accommodate a patch. A failed structural check is evidence to fix the patch or fixture.

## Managed Workspace Invariant

All APK extraction/decompilation uses `.apk-lab/<package>/...` (or a custom root specified via global `--workspace-root PATH` before the subcommand) through the workspace manager.

- Never create ad hoc unzip/JADX/Apktool directories elsewhere in the repo.
- Never use raw `rm -rf` on a workspace.
- Use `apk-lab clean --run <path>` (strictly rejects invalid markers or uncontained paths) or `apk-lab clean --package <pkg>` / `--stale <days>` (skips malformed or unmarked runs and cleans valid entries).
- `inspect` should not create a persistent workspace; analysis/check commands print their managed location and cleanup command.

## Core Commands

```bash
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- setup --profile analysis
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- doctor

cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- inspect path/to/app.apkm
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- analyze path/to/app.apkm --smali
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- compare old.apkm new.apkm
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- acquire com.example.app

cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- check path/to/app.apkm \
  --mpp patches/build/libs/patches-X.Y.Z.mpp \
  --package com.example.app \
  --all

# Rapid inner iteration loop during patch authoring: builds patches, locates artifact,
# negotiates keystore, signs, deploys, and launches
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- dev <app>

# Or deploy explicitly:
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- deploy path/to/app.apkm \
  --mpp patches/build/libs/patches-X.Y.Z.mpp \
  --package com.example.app \
  --all --launch
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- monitor \
  --package com.example.app --timeout 10.0 --dump-threads
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- crash-trace \
  --package com.example.app

cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- clean --package com.example.app
```

Targeted tools: `asm`, `il2cpp`, `unity`, `inspect-code`, `validate-smali`, `res`, `strings`, `manifest`, and `fixtures`. Prefer them over one-off extraction or assembly scripts.

## Compatibility Contract

`apk-lab check ... --all` tests the baseline patch configuration plus each independent boolean-option inversion and verifies:

- Morphe reports success and produces an APK.
- Package name and version code remain unchanged, except when the case declares a `packageName` option (for example Clone App); the output must match that declared package.
- Android `dexdump -c` structural verification passes.
- At least one patchable member (DEX, manifest/resources, assets/lib) is modified in the output.
- Injected extension classes are inventoried when present.

Never declare a target version compatible from `inspect`/`compare` metadata alone. For app updates, first capture the forced failing baseline, remap against targeted analysis, rebuild, pass `check --all`, and smoke the actual device flow.

## Testing & QA

```bash
# Targeted while iterating
cargo test --locked --manifest-path tools/apk-lab/Cargo.toml TEST_NAME

# Full host suite
cargo test --locked --manifest-path tools/apk-lab/Cargo.toml

# Static checks are also available through root orchestration
bun run lint
bun run typecheck
bun run audit
```

Tests should be deterministic, isolated, and use temporary directories plus fakes for subprocess/device/network/cloud boundaries. Add permanent tests for archive safety, path containment, parsing, transitions, exit codes, and consumer-visible CLI behavior—not source-text assertions or mock echoes.

A CLI feature also requires a smoke run of the changed command through the canonical `cargo run` invocation. Device behavior requires an actual deploy/monitor run when hardware/emulator access exists; state the limitation if it does not.
