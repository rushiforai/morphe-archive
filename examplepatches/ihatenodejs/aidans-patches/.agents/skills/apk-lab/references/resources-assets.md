# Resources, Unity Assets, ARM64 Assembly & IL2CPP

Inspect and query Android resources across multi-split containers, inspect Unity serialized assets and GameObjects, encode ARM64 machine code instructions, and extract stripped Unity IL2CPP symbols.

---

## 1. `res` — Cross-Split Resource Table & Raw Member Inspector

Resolves resource entries, layout IDs, and raw members across the base APK and all configuration splits (`split_config.xxhdpi.apk`), detects duplicates across splits, and recommends the appropriate Morphe patch mode.

### Supported Query Formats

- **Hex Resource ID**: `0x7f08028e` (looks up in ARSC tables via AAPT2).
- **Type/Name Reference**: `@drawable/map_preview_trails` or `drawable/map_preview_trails`.
- **Package-Prefixed Reference**: `com.example.app:string/app_name`.
- **Archive Path**: `res/drawable-xxhdpi/icon.webp`, `assets/index.android.bundle`, `lib/arm64-v8a/libfoo.so`, or `AndroidManifest.xml`.
- **Bare Name**: `map_preview_trails` (matches resource name or file basename).
- **Text/Value Substring**: `text:<query>`, `val:<query>`, `value:<query>`, or `--text <query>` / `--value <query>` flag aliases (case-insensitive substring search across string tables in `resources.arsc`).

### Invariants & Output Intelligence

- **Split Handling**: Split packages lacking `resources.arsc` (such as native library splits `config.arm64_v8a.apk`) are gracefully skipped during ARSC table inspection without error, while raw archive members (assets, libraries, manifest) remain searchable and accessible.
- **Morphe Mode Guidance**:
  - `AndroidManifest.xml` and files under `res/...` advise `resourcePatch` (`document(...)` for XML DOM manipulation, `get(...)` for binary resources).
  - Files under `assets/...` and `lib/...` advise `rawResourcePatch` (raw ZIP asset manipulation).
- **Duplicate Status Across Splits**:
  - `unique`: Resource or file exists in exactly one split APK.
  - `equivalent`: Resource or file exists in multiple splits with identical SHA-256 or scalar value.
  - `conflict`: Resource or file exists in multiple splits with **differing hashes or values** (requires careful split targeting).
- **Extraction Preflight**:
  - When `--extract <dir>` is supplied, preflights and extracts matched file-backed resources only into `<extract_dir>/<split_slug>-<hash8>/...`; scalar ARSC values are skipped with a warning.
  - Refuses extraction if the extract root is a symlink or regular file, if resolved destination paths escape the target root, or if destinations collide or already exist on disk.

### CLI Invocation

```bash
# Query by resource ID
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- res path/to/app.apkm --query 0x7f08028e

# Query by type and name
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- res path/to/app.apkm --query @drawable/brand_logo

# Search resource string values by substring
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- res path/to/app.apkm --text "Upgrade to Premium"

# Search resource string values using prefix query
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- res path/to/app.apkm --query text:"Upgrade to Premium"

# Query by file path and safely extract matched files to disk
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- res path/to/app.apkm \
  --query res/drawable-xxhdpi/brand_logo.webp \
  --extract /tmp/extracted_resources
```

### Exit Codes

- `0`: Query executed successfully.
- `2`: Artifact not found or invalid query format.
- `3`: Archive security error or extraction safety violation.
- `4`: Uncaught infrastructure failure or build tool error.

---

## 2. `unity` — Unity Serialized Asset & GameObject Inspector

Parses Unity serialized asset files (`assets/bin/Data/*.assets`, `*.assets.split*`, `globalgamemanagers`) across single APKs and split containers (APKM, APKS, XAPK). Locates `GameObject` records by name, reports matched asset member paths and file offsets, and computes the exact byte offset and value of the `m_IsActive` boolean property.

### Purpose for Patching

In Unity games, disabling unwanted promotional buttons, help centers, or ad prompts can be accomplished by setting the GameObject's `m_IsActive` byte to `0x00` in the serialized asset file via a Morphe `rawResourcePatch`. This tool finds the exact file offset.

### CLI Invocation

```bash
# Locate GameObject and calculate active-state byte offset
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- unity path/to/game.apkm --gameobject Button_HelpCenter

# Output matches as JSON
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- unity path/to/game.apkm --gameobject Button_HelpCenter --json -
```

### CLI Arguments

- `artifact` (required positional): Path to APK or split bundle.
- `--gameobject` / `-g` (required): Case-sensitive name of the Unity `GameObject`.
- `--json [PATH|-]`: Output structured JSON report.

### Exit Codes

- `0`: Inspection succeeded.
- `2`: Artifact not found or invalid argument.

---

## 3. `asm` — ARM64 Assembler & Branch Relocator

Encodes ARM64 machine instructions and computes 26-bit relative branch relocations (`b`, `bl`), register returns (`ret`), and register moves (`mov`/`movz`). Formats output deterministically for direct use in Morphe Kotlin patches.

### Capabilities

- **Branch Relocation**: Computes relative PC offset for `b` and `bl` instructions:
  $$\text{imm26} = \frac{\text{target} - \text{pc}}{4}$$
  Enforces 4-byte alignment and range $[-134217728, +134217724]$ ($\pm 128\text{ MiB}$).
- **Returns**: `ret` with optional 64-bit register (default `x30` / `lr`).
- **Register Moves**: `mov` / `movz` with destination register (`x0..x30`, `w0..w30`), source register (`xzr`, `wzr`), or 16-bit immediate ($0..65535$).
- **Morphe Kotlin Format**: Generates Kotlin `byteArrayOf(...)` arrays where bytes $> 127$ are formatted with `.toByte()` casting for signed byte compatibility in Java/Kotlin.

### CLI Invocation

```bash
# Calculate relative branch and encode to little-endian hex bytes
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- asm "bl 0x3c98ce4" --pc 0x1fcf6e8
# Output: 7f 25 73 94

# Calculate branch with explicit target override
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- asm "b" --pc 0x1000 --target 0x2000
# Output: 00 04 00 14

# Encode return instruction directly to Morphe Kotlin byteArrayOf syntax
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- asm "ret" --format kotlin
# Output: byteArrayOf(0xc0.toByte(), 0x03, 0x5f, 0xd6.toByte())

# Encode immediate register move
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- asm "mov w1, #1" --format hex
# Output: 21 00 80 52
```

### CLI Arguments

- `statement` (required positional): ARM64 instruction (e.g. `"bl 0x3c98ce4"`, `"ret"`, `"mov w1, #1"`).
- `--pc INT|HEX`: Program counter address (default: `0`).
- `--target INT|HEX`: Explicit branch target address (overrides operand in statement).
- `--format {hex,kotlin,int,bytes}`: Output formatting (default: `hex`).

### Exit Codes

- `0`: Assembly succeeded.
- `2`: Syntax error, unaligned address, out-of-range branch or immediate, or invalid format.

---

## 4. `il2cpp` — Unity IL2CPP Metadata Querying

Extracts and parses Unity `assets/bin/Data/Managed/Metadata/global-metadata.dat` (supported layouts: version 29 and 31) across single APKs and split bundles. Enables instant querying of stripped C# type definitions, method names, parameter counts, and namespaces without external tooling.

### CLI Invocation

```bash
# Query symbols matching a method name substring or regex
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- il2cpp path/to/game.apkm --query OpenShop

# Export all symbols or matches to JSON file
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- il2cpp path/to/game.apkm --query "Blackjack.*" --json symbols.json
```

### CLI Arguments

- `artifact` (required positional): Path to APK or split bundle.
- `--query` / `-q`: Case-insensitive regex or substring query. Searches namespace, type name, and method names.
- `--json [PATH|-]`: Output structured JSON array.

### Exit Codes

- `0`: Query succeeded.
- `2`: Artifact not found, `global-metadata.dat` missing, or unsupported metadata version.

---

## 5. Native Library and Test References

There is no supported Python API. The CLI is the stable contract; Rust modules
(`resources.rs`, `unity.rs`, `asm.rs`, `il2cpp.rs`, `archives.rs`, `inspection.rs`) back
the commands above and are covered by
`cargo test --locked --manifest-path tools/apk-lab/Cargo.toml`.
