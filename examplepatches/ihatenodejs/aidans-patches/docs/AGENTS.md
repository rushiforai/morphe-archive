# Repository Guidelines

Scope: maintained technical documentation under `docs/`.

## Documentation Ownership

- `apk-lab.md`: canonical CLI, toolchain, storage, command, exit-code, compatibility, and safety reference for `tools/apk-lab/`.
- `dependencies.md`: canonical CLI, approval model, coverage boundaries, and policy reference for `scripts/deps.ts`.
- `<app>/architecture.md`: observed target-app architecture, classes/resources/assets, data flow, reverse-engineering evidence, and compatibility-sensitive anchors.
- `<app>/patches.md`: implemented patch behavior, options, dependencies, affected layers, verification, and user-visible limitations.
- App-specific feature catalogs such as `hidden_feature_flags.md`: evidence-backed reverse-engineering notes that do not belong in general architecture or patch behavior.

Source package and docs directory names may differ (for example `adobescan` source versus `adobe-scan` docs). Follow existing directories; do not create aliases.

## Writing Rules

- Document facts established by source, generated metadata, or observed APK/device behavior. Mark unverified interpretation as such.
- Prefer stable symbols, paths, commands, invariants, and failure modes over patch counts or prose inventories that quickly drift.
- Keep architecture (what the target/app/tool is) separate from patch specification (what this repository changes).
- Update docs in the same change when user-visible behavior, patch options/dependencies, target compatibility, CLI flags/output, storage layout, or safety rules change.
- Use exact repository-relative paths and runnable commands. Commands must use `./gradlew`, Bun package scripts, or `uv run --project tools/apk-lab`; do not recommend ad hoc tool invocation that bypasses repository controls.
- Avoid duplicating the full root or nested `AGENTS.md` rules. Link to the canonical guide and explain only feature-specific context.
- Never include credentials, private fixture contents, proprietary source dumps, or large decompiler output. Summarize evidence and point to repository-owned code/specs.

## Generated Documentation Boundaries

- Root README content between `PATCHES_START` and `PATCHES_END` is generated from `patches-list.json`; never edit it manually.
- `CHANGELOG.md`, `patches-bundle.json`, release-version metadata, and the README patch block are semantic-release outputs.
- `patches-list.json` is generated from Kotlin patch declarations, not authored documentation.
- App docs under `docs/` are hand-maintained and should not restate the full generated patch metadata schema; concise patch inventories and option tables for human navigation are expected.

## Verification

For docs-only changes:

- Re-read changed sections against the cited source/config and verify links/paths/commands.
- Run the affected command's non-mutating help/check mode when changing command examples.
- If docs changed because code behavior changed, use the code module's required tests and root `bun run audit`.
- If README generation changed, run the generator on intentional inputs and inspect the marker-delimited diff along with any supported template-URL substitutions outside it; do not hand-repair generated output.
