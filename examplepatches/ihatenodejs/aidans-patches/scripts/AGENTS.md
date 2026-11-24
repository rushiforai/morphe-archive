# Repository Guidelines

Scope: Bun audit, dependency, README, hook, and native asset-launch automation.

## Command Contract

Root `package.json` delegates to `scripts/audit.ts`:

| Command                     | Behavior                                                                                                                                                       |
| --------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `bun run format`            | Mutating Prettier, ktlint format, cargo fmt, and clang-format on configured scopes.                                                                            |
| `bun run format:check`      | Non-mutating formatter checks (Prettier, ktlint, cargo fmt, clang-format).                                                                                     |
| `bun run lint`              | Oxlint, ktlint, clippy, and C++ native engine lint (-Wall -Wextra).                                                                                            |
| `bun run lint:fix`          | Mutating supported lint fixes (Oxlint, ktlint, clippy --fix).                                                                                                  |
| `bun run typecheck`         | Worker `tsc`, Astro check, Kotlin/Java compile, Rust cargo check, and C++ native host compilation (CMake).                                                     |
| `bun run test`              | APK Lab Rust tests, Worker Vitest, site tests, cargo test, icon consistency check, CTest native engine tests, and `:extensions:extension:testReleaseUnitTest`. |
| `bun run audit`             | Format check → lint → typecheck → test (offline and deterministic).                                                                                            |
| `bun run audit --deps`      | Format check → lint → typecheck → test → dependency freshness.                                                                                                 |
| `bun run deps:check`        | Non-mutating read-only check across all monorepo dependencies and pinned tooling.                                                                              |
| `bun run deps:update`       | Transactional update application with mandatory approval (TTY prompt or agent plan).                                                                           |
| `bun scripts/audit.ts deps` | Single-phase dependency freshness audit check.                                                                                                                 |

This script is the source of truth. Root/nested guides should describe its public commands rather than duplicate every internal argument.

## Implementation Rules

- Use Bun/TypeScript and `spawn` with argument arrays (`shell: false`) for commands. Do not concatenate untrusted shell strings.
- Preserve per-step cwd, exit code, stdout/stderr, duration, diagnostic parsing, and final non-zero status when any step fails.
- Keep mutating (`format`, `lint:fix`) and check-only commands visibly separate.
- Tool acquisition must be pinned and checksum-verified. The ktlint fallback downloads only the pinned version into ignored `.tools/`; do not add unverified download execution.
- Prefer existing repository package scripts and Cargo/Gradle wrappers over duplicating tool setup.
- Keep output concise but retain enough raw diagnostics to reproduce failures. Never suppress a failed subcommand to make the aggregate green.
- When adding a language/module, update format, lint, typecheck, test, and dependency checker phases deliberately; do not claim coverage in docs before the orchestrator actually runs it.
- `generate-patches-readme.ts` owns the README transformation and installed-Prettier formatting. Preserve frozen reference output; validate markers/metadata and finish formatting before writing. Pure transformation preserves exterior bytes apart from template links.
- `hooks.ts` performs check-only staged/committed hygiene and isolated-snapshot audits; never mutate the user's index or working files. Snapshots may reuse only build-independent caches (`.tools`, `.gradle`, dependency installs); never link Cargo `target` directories, because artifacts embed absolute source paths and cross-root reuse executes binaries compiled for a deleted root. `install-hooks.ts --check` is non-mutating; installation and legacy/shared-path migration require explicit developer execution/opt-ins. New automation tests are registered in the web audit domain.
- `asset-prep.ts` resolves `rustc -vV` and passes its host triple explicitly to locked release Cargo execution. Preserve root-relative target-directory overrides, inherited stdio, and the native exit status; site/audit/icon automation share this bootstrap, while Gradle builds the same host target independently.
- Dependency management (`scripts/deps.ts`) isolates updates in temporary staging before publication, verifies inputs with SHA-256 digests, and enforces mandatory reasons in `dependency-policy.json` for held dependencies.

## Verification

Run the directly changed phase first, then the aggregate:

```bash
bun run format:check
bun run lint
bun run typecheck
bun run test
bun run audit
```

The audit orchestrator verifies format checks, linting, typechecking (including C++ CMake host target compilation), and full test suites (including native CTest execution and extension release unit tests via `./gradlew :extensions:extension:testReleaseUnitTest`).

A change to command orchestration must be smoke-tested on both success and a controlled failing command when practical, verifying the reported diagnostic and process exit status. Do not use mutating format/fix modes as the only proof.
