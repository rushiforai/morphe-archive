# Artifact Acquisition & R2 Cloud Fixtures

Acquire Android application artifacts directly from Google Play, normalize split bundles to `.apkm`, and manage the two-slot private Cloudflare R2 test fixture architecture (`target` and `latest`).

---

## 1. `acquire` — Google Play & Fallback Artifact Acquisition

Downloads APK/APKM artifacts using Google Play accounts (`apkeep` with `goopdl` fallback, followed by configured package mappings in APKMirror, then APKPure through `apkeep` as the last resort) and normalizes multi-split downloads into `.apkm` container bundles (or single `.apk` for APKMirror APK mappings). A requested `--version` is pinned per source (`apkeep -a <pkg>@<version>`), so a stale Play rollout fails the provider instead of silently returning a newer build.

APKPure is a last resort: it repackages third-party builds, so the artifact is not the Play-signed APK. The source label stored with compatibility results and fixture slots is `apkpure`, and `apkeep`'s `acknowledge_dangers=true` option is passed explicitly. Prefer a first-party source whenever one can produce the requested version.

### Normalization Pipeline

1. Downloads base APK and configuration splits (`split_config.*.apk`).
2. Parses badging metadata across regular `.apk` files using the inspection badging parser (non-APK files such as `.dm`/`.obb` are excluded).
3. Enforces container invariants:
   - Exactly one base APK (manifest has no `split` attribute).
   - All split APKs have identical package name and version code.
4. Packages splits into a canonical `.apkm` ZIP container containing the base and split APKs.

### Credentials & Prerequisites

- Google Play accounts: `APKEEP_ACCOUNTS` or `${XDG_CONFIG_HOME:-~/.config}/aidans-patches/google-play-accounts.json`.
- APKPure: no credentials; requires the pinned `apkeep` from `apk-lab setup` and network access. Last resort only — it repackages third-party builds, so the recorded source is `apkpure`.
- R2 storage: `R2_ACCOUNT_ID`, `R2_ACCESS_KEY_ID`, and `R2_SECRET_ACCESS_KEY` (default bucket: `aidans-patches-apk-fixtures`).

### CLI Invocation

```bash
# Acquire the latest version of an app from Google Play
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- acquire com.example.app

# Acquire a specific version to a target output directory
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- acquire com.example.app \
  --version 2.22.09 \
  --out-dir /tmp/artifacts
```

### CLI Arguments

- `package` (required positional): Application package name.
- `--version VERSION`: Desired version name.
- `--version-code INT`: Desired version code.
- `--out-dir DIR`: Directory to place the acquired artifact (defaults to system temporary directory).

### Exit Codes

- `0`: Acquisition and normalization succeeded.
- `4`: `INFRASTRUCTURE_FAILURE` — Downloader authentication error, download failure, network error, or normalization failure.

---

## 2. `fixtures` — Private R2 Cloud Fixtures

Manages the repository's two-slot private Cloudflare R2 storage architecture (`aidans-patches-apk-fixtures`):

- `fixtures/<package>/target`: Currently supported production patch target APK.
- `fixtures/<package>/latest`: Newest version released on Google Play Store.

### Subcommands

#### `seed`

Uploads a local artifact to an R2 slot, calculating hashes and signing certificate metadata. `--source LABEL` records provenance; the label must be a lowercase token (letters, digits, `.`, `_`, `-`, at most 32 characters) and defaults to `manual`. `--expect-version NAME` and `--expect-sha256 HEX` are checked after inspection and before the object write, so a wrong or truncated file never replaces a verified slot.

```bash
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- fixtures seed \
  --package com.example.app \
  --role target \
  --artifact path/to/app.apkm \
  --source device-pull \
  --expect-version 1.2.3 \
  --expect-sha256 <64-hex-sha256>
```

Seeding is local and private: the artifact goes only to the R2 bucket, using `R2_ACCOUNT_ID`/`R2_ACCESS_KEY_ID`/`R2_SECRET_ACCESS_KEY`. This is the supported way to supply a version that no provider can produce any more; do not host the artifact publicly to feed a workflow.

#### `info`

Inspects fixture metadata stored in R2 (displays role, version name/code, first 16 SHA-256 characters, signing-certificate SHA-256, and acquisition source).

```bash
# Check both slots (target and latest)
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- fixtures info --package com.example.app

# Check specific slot
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- fixtures info --package com.example.app --role target
```

#### `download`

Downloads an APK artifact from an R2 slot to local disk.

```bash
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- fixtures download \
  --package com.example.app \
  --role target \
  --out /tmp/target.apkm
```

### CLI Arguments

- `fixture_subcommand`: `seed`, `info`, or `download`.
- `--package PACKAGE` (required): Application package name.
- `--role {target,latest}`: Target slot role.
- `--artifact PATH`: Path to local artifact for `seed`.
- `--out PATH`: Destination path for `download`.

### Slot Rotation Logic (`rotate_slots_on_new_latest`)

When a new version is released on Google Play:

1. If the existing `latest` matches the repository's desired target version, it is copied to `target`.
2. The newly acquired version is uploaded to `latest`.
3. If `target` and `latest` have the same version and hash, `target` is cleared.

### Exit Codes

CLI handlers return `0` on success, `2` on CLI argument syntax errors, and `4` (`INFRASTRUCTURE_FAILURE`) on caught exceptions (missing credentials, package mismatch, network, or S3 errors).

## 3. Native Library and Test References

There is no supported Python API. CLI handlers return `0` on success, `2` on CLI
argument syntax errors, and `4` (`INFRASTRUCTURE_FAILURE`) on missing credentials,
package mismatch, network, or S3 errors. Rust modules (`acquisition.rs`, `fixtures.rs`)
back the commands above and are covered by
`cargo test --locked --manifest-path tools/apk-lab/Cargo.toml`.
