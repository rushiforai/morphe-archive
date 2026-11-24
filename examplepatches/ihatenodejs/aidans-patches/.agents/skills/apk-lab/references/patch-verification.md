# Morphe Patch Compatibility & Verification

Execute real patch compatibility testing using Morphe Desktop, test boolean option inversions, verify DEX structural integrity, and automate CI test matrix generation.

---

## 1. `check` — Real Patch Compatibility Testing

Applies patch bundles (`.mpp`) to an APK or split bundle (APKM/XAPK) using pinned Morphe Desktop in isolated ephemeral workspaces.

### Why Real Patch Testing is Mandatory

A patch cannot be marked compatible in `Constants.kt` from a metadata diff or code inspection alone. A version is supported **ONLY** when `apk-lab check ... --all` executes every patch baseline and independent boolean-option inversion, and passes all verification gates:

1. **Morphe Execution**: Morphe Desktop executes without throwing unhandled exceptions or failing AST anchors.
2. **Identity Invariance**: Package name and version code remain unchanged in the output APK.
3. **Android SDK DEX Verification**: Runs `dexdump -c` across all generated DEX files to verify structural validity and bytecode formatting.
4. **Member Delta Verification**: At least one patchable member (DEX, manifest, resources, assets, native libs) is modified in the output APK.
5. **Extension Verification**: Classes injected from `extensions/extension.mpe` (`app/aidan/extension/...`) are inventoried in the output APK when present.

### Automated Option Permutation Testing

When a patch declares boolean configuration options, `apk-lab check` generates and executes:

- **Baseline test case**: Default patch configuration.
- **Inverted test cases**: One independent test case per boolean option with its value inverted (e.g. `primaryColor`, `filterMarketplace=true`).

### CLI Invocation

```bash
# Test a specific patch with all option permutations
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- check path/to/app.apkm \
  --mpp patches/build/libs/patches-X.X.X.mpp \
  --package com.example.app \
  --patch "Patch Name"

# Test ALL compatible patches declared for the package
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- check path/to/app.apkm \
  --mpp patches/build/libs/patches-X.X.X.mpp \
  --package com.example.app \
  --all

# Force check to establish failing baseline during app updates
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- check path/to/app.apkm \
  --mpp patches/build/libs/patches-X.X.X.mpp \
  --package com.example.app \
  --all \
  --force

# Retain workspace scratch files for post-mortem debugging
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- check path/to/app.apkm \
  --mpp patches/build/libs/patches-X.X.X.mpp \
  --package com.example.app \
  --all \
  --keep-workspace

# Output structured compatibility report to JSON
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- check path/to/app.apkm \
  --mpp patches/build/libs/patches-X.X.X.mpp \
  --package com.example.app \
  --all \
  --json report.json
```

### CLI Arguments

- `artifact` (required positional): Path to APK or split bundle.
- `--mpp MPP` (optional): Path to compiled Morphe patch bundle (`.mpp`). When omitted, the newest bundle in `patches/build/libs/` is used.
- `--package PACKAGE`: Package name (inferred from artifact manifest if omitted).
- `--all`: Test every compatible patch declared for this package in `patches-list.json`, including patches declared with `default: false`, plus their dependencies.
- `--patch NAME ...`: Repeatable name of specific patch(es) to test.
- `--force`: Bypass target version compatibility check in Morphe metadata (vital for app updates to establish failing baseline).
- `--keep-workspace`: Retain ephemeral workspace under `.apk-lab/` instead of cleaning up on exit.
- `--json [PATH|-]`: Output structured JSON report (`PatchCompatibilityReport`).

### Exit Codes

- `0`: All patch test cases passed.
- `1`: `COMPATIBILITY_FAILURE` — One or more test cases failed to apply, violated postconditions, or failed DEX structural verification.
- `2`: `USAGE_OR_TOOL_ERROR` — Missing files or invalid patch name.
- `4`: `INFRASTRUCTURE_FAILURE` — Uncaught exceptions, malformed artifacts, missing Morphe binary, or workspace errors.

---

## 2. CI Automation (`apk-lab ci`)

Orchestrates automated patch testing and R2 fixture reconciliation in GitHub Actions workflows (`.github/workflows/apk-compatibility.yml`). The release binary is built once and invoked directly.

### Subcommands

1. **`matrix`**: Analyzes Git diff between commits to generate a dynamic matrix of affected packages.

   ```bash
   tools/apk-lab/target/release/apk-lab ci matrix \
     --patches-list patches-list.json \
     --output-file "$GITHUB_OUTPUT"
   ```

2. **`start`**: Registers a test run with dispatch metadata.

   ```bash
   tools/apk-lab/target/release/apk-lab ci start --package com.example.app --request-id 12345 --git-revision abc1234 --patches-list patches-list.json
   ```

3. **`run`**: Downloads test fixtures from R2, verifies patch bundle compatibility, checks targets, and updates status.

   ```bash
   tools/apk-lab/target/release/apk-lab ci run --package com.example.app --mpp patches/build/libs/patches-1.0.0.mpp --patches-list patches-list.json
   ```

---

## 3. Native Library and Test References

There is no supported Python API. The CLI is the stable contract; Rust modules
(`morphe.rs`, `compatibility_ci.rs`, `tools.rs`, `workspace.rs`) back the commands
above and are covered by `cargo test --locked --manifest-path tools/apk-lab/Cargo.toml`.
