# Dependency Freshness and Upgrades

This repository uses a unified dependency checker and updater orchestrator (`scripts/deps.ts`), designed to check and apply dependency updates across all monorepo languages and pinned tooling without needing to invoke each ecosystem's package manager manually.

## Commands

Root `package.json` delegates to the Bun script:

```bash
# Check all repository dependencies against upstream registries (read-only)
bun run deps:check

# Filter check to specific dependency ID(s)
bun run deps:check --only 'npm:worker/package.json#devDependencies/wrangler'

# Output structured JSON for automation or review
bun run deps:check --json > /tmp/dependencies.json

# Interactive update (prompts with proposed changes on a TTY)
bun run deps:update

# Agent non-interactive approved update (requires exact proposal digest)
bun run deps:update --plan /tmp/dependencies.json --approve <proposal.digest>

# Audit integration (opt-in freshness phase)
bun scripts/audit.ts deps
bun run audit --deps
```

## Exit Codes

| Exit Code | Meaning                                                                                                   |
| --------- | --------------------------------------------------------------------------------------------------------- |
| `0`       | Success: all checked dependencies are up-to-date or held, or update was cleanly applied.                  |
| `1`       | Error: registry failure, network error, policy violation, stale/tampered plan, or tool execution failure. |
| `2`       | Outdated: actionable updates are available or upstream releases are blocked by interpreter compatibility. |
| `3`       | Declined: user cancelled the interactive update prompt.                                                   |

## Monorepo Coverage

The updater covers all direct software dependencies and version-sensitive toolchain configurations in the repository:

| Ecosystem               | Manifest / Source                                                            | Tracked Lockfiles                                                            |
| ----------------------- | ---------------------------------------------------------------------------- | ---------------------------------------------------------------------------- |
| JavaScript / Web        | `package.json`, `worker/package.json`, `site/package.json`                   | `bun.lock`, `worker/bun.lock`, `site/bun.lock`, `package-lock.json`          |
| Python / Tooling        | `tools/apk-lab/pyproject.toml`                                               | `tools/apk-lab/uv.lock`                                                      |
| Rust / Crates           | `tools/play-metadata/Cargo.toml`, `extensions/nhl-adblock-native/Cargo.toml` | `tools/play-metadata/Cargo.lock`, `extensions/nhl-adblock-native/Cargo.lock` |
| Gradle Plugins          | `settings.gradle.kts`, `gradle/libs.versions.toml`                           | Gradle metadata                                                              |
| External APK Binaries   | `tools/apk-lab/tools.lock.json`                                              | Integrity hashes and version probes                                          |
| Code Quality Tooling    | `scripts/audit.ts` (`KTLINT_VERSION`)                                        | Pinned checksum verification                                                 |
| GitHub Actions & Hooks  | `.github/workflows/*.yml`, `.pre-commit-config.yaml`                         | Pinned versions and commit hashes                                            |
| Toolchain Runtimes      | Workflow setup inputs, `rust-toolchain.toml`, `build.gradle.kts` (NDK)       | Pinned versions across coordinated files                                     |
| Embedded In-Repo Assets | `OsmMapView.java` (Leaflet CDN)                                              | Coupled asset URLs                                                           |
| C++ / Native            | `extensions/adobescan-pdf-native/CMakeLists.txt`                             | CMake FetchContent archives and integrity hashes                             |

### Non-Dependency Exclusions

The dependency checker strictly inspects software dependency releases. It intentionally excludes:

- Target application compatibility versions in patch `Constants.kt`. (App versions require device and reverse-engineering verification via APK Lab).
- Fixture metadata and APK artifact hashes.
- In-tree font resources and adblock filter list sources.
- Repository semantic release version in `gradle.properties`.

## Dependency Policy and Holds

Intentional dependency holds are maintained in root `dependency-policy.json`. Every hold requires a mandatory text `reason` explaining why the package cannot be updated.

```json
{
  "schemaVersion": 1,
  "holds": [
    {
      "id": "npm:package.json#devDependencies/conventional-changelog-conventionalcommits",
      "value": "^9.3.1",
      "reason": "Preserve release-note generation compatibility; see https://github.com/conventional-changelog/conventional-changelog/issues/1495"
    }
  ]
}
```

- When a dependency is held in `dependency-policy.json`, `deps:check` marks it as `held` (displaying the reason and the latest available upstream release), but does not include it in actionable update proposals.
- An update cannot override a held dependency without explicitly removing or updating the hold entry in `dependency-policy.json`.

## Safety & Approval Model

1. **Read-Only Checks**: `deps:check` only fetches upstream metadata over HTTP. It never modifies manifests, runs lifecycle scripts, or downloads binary tools.
2. **Deterministic Proposals**: Each report containing actionable updates generates a cryptographically signed proposal digest (SHA-256 over canonical JSON of sorted inputs and planned updates).
3. **Interactive Confirmation**: On a TTY terminal, `deps:update` displays all candidate updates, highlights major version bumps, and prompts for confirmation before modifying any file.
4. **Agent Programmatic Mode**: In non-interactive environments (e.g. CI, subagents), `deps:update` refuses to run without `--plan <file>` and `--approve <digest>`. If any input file has changed since the plan was generated, or if the digest does not match, the transaction is rejected immediately.
5. **Transactional Staging & Atomic Publish**: Updates are applied and lockfiles regenerated inside an isolated temporary staging directory (`os.tmpdir()`). Only after lock generation and verification succeed are the files published to the repository. If any write fails, all changes are rolled back automatically.
