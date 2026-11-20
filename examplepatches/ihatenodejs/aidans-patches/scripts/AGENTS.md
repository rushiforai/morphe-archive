# Repository Guidelines

Scope: root automation scripts, currently the Bun audit orchestrator `audit.ts`.

## Command Contract

Root `package.json` delegates to `scripts/audit.ts`:

| Command                     | Behavior                                                                                                                                                   |
| --------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `bun run format`            | Mutating Prettier, Ruff format, ktlint format, cargo fmt, and clang-format on configured scopes.                                                           |
| `bun run format:check`      | Non-mutating formatter checks (Prettier, Ruff, ktlint, cargo fmt, clang-format).                                                                           |
| `bun run lint`              | Oxlint, Ruff, ktlint, clippy, and C++ native engine lint (-Wall -Wextra).                                                                                  |
| `bun run lint:fix`          | Mutating supported lint fixes (Oxlint, Ruff, ktlint, clippy --fix).                                                                                        |
| `bun run typecheck`         | Worker `tsc`, Astro check, APK Lab mypy, Kotlin/Java compile, Rust cargo check, and C++ native host compilation (CMake).                                   |
| `bun run test`              | APK Lab pytest, Worker Vitest, site tests, cargo test, icon consistency check, CTest native engine tests, and `:extensions:extension:testReleaseUnitTest`. |
| `bun run audit`             | Format check → lint → typecheck → test (offline and deterministic).                                                                                        |
| `bun run audit --deps`      | Format check → lint → typecheck → test → dependency freshness.                                                                                             |
| `bun run deps:check`        | Non-mutating read-only check across all monorepo dependencies and pinned tooling.                                                                          |
| `bun run deps:update`       | Transactional update application with mandatory approval (TTY prompt or agent plan).                                                                       |
| `bun scripts/audit.ts deps` | Single-phase dependency freshness audit check.                                                                                                             |

This script is the source of truth. Root/nested guides should describe its public commands rather than duplicate every internal argument.

## Implementation Rules

- Use Bun/TypeScript and `spawn` with argument arrays (`shell: false`) for commands. Do not concatenate untrusted shell strings.
- Preserve per-step cwd, exit code, stdout/stderr, duration, diagnostic parsing, and final non-zero status when any step fails.
- Keep mutating (`format`, `lint:fix`) and check-only commands visibly separate.
- Tool acquisition must be pinned and checksum-verified. The ktlint fallback downloads only the pinned version into ignored `.tools/`; do not add unverified download execution.
- Prefer existing repository package scripts and `uv`/Gradle wrappers over duplicating tool setup.
- Keep output concise but retain enough raw diagnostics to reproduce failures. Never suppress a failed subcommand to make the aggregate green.
- When adding a language/module, update format, lint, typecheck, test, and dependency checker phases deliberately; do not claim coverage in docs before the orchestrator actually runs it.
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
