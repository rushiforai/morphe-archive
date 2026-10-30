# Contributing

Report addon issues in [this repository](https://github.com/YYDarlinker/morphe-ai-caption-translator/issues), not the official Morphe tracker. Include addon/official patch/YouTube versions, Android/device, source/target language, reproduction steps and a redacted diagnostic export. Do not attach API keys, signing keys or pre-patched YouTube APKs.

## Start developing

Read [development setup](docs/DEVELOPMENT.md), [architecture](docs/ARCHITECTURE.md) and [current state](docs/PROJECT-STATE.md). JDK 21, Python 3.12, Android SDK 35/36 and the pinned Gradle wrapper are required. Supply tool/cache/package settings explicitly; never commit credentials. Windows entry points are distributed in `tools/workspace/`; `.devenv/` is optional local material.

```powershell
# Configured process, localization plus both unit suites:
.\tools\workspace\dev.cmd
# Relevant tests with cached dependencies:
.\tools\workspace\dev.cmd :translation-core:testDebugUnitTest --tests '*RepairAdmissionTest' --offline
```

Use `tools/workspace/verify-full.cmd` for a final candidate with a fresh run ID and current version/build ID. It checks provenance, dependency/ABI/package boundaries, both suites, rebuilt test outputs, the UI fixture and exact MPP/MPE identity. It never calls a real model. See [maintenance](docs/MAINTAINING.md) for verification, evidence and guarded rollback.

Preserve YouTube/official Captions ownership of CC and target language, source-mode zero model requests, stale-work rejection, request budgets and credential isolation. Address mechanisms rather than video IDs or phrases. Check resources and patch-injected string references before removing apparently unused code. Add focused regression coverage for material behavior changes; preserve useful old assertions.

Use feature branches and semantic commit messages. Source synchronization and publication have different effects: the local workflow configuration validates source pushes and reserves publication/main and the dev→main PR helper for separate manual dispatch. Older remote revisions can still auto-publish or open PRs until the guarded revision is delivered. Follow [releasing](docs/RELEASING.md) before remote writes; do not hand-edit generated metadata or overwrite historical assets. The project remains an independent bundle.

For the maintainer's Windows checkout, follow [AGENTS.md](AGENTS.md): project writes stay on E:, and unrelated shared tools/session storage stay outside cleanup. Old reports and prompts are recovery material, not contributor instructions.
