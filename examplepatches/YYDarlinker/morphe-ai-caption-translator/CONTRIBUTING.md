# Contributing

Report addon issues here, not in the official Morphe tracker. Search [existing issues](https://github.com/YYDarlinker/morphe-ai-caption-translator/issues) first. Include addon/official patch/YouTube versions, Android/device, source and target language, reproduction steps and a redacted diagnostic export. Never attach API keys, signing keys or pre-patched YouTube APKs.

## Local development

Start with [Development environment](docs/DEVELOPMENT.md): JDK 21, Python 3.12, Android SDK 35/36/build-tools36, the pinned Gradle wrapper and explicit Robolectric/Maven/Gradle inputs. The source-distributed Windows entry is `tools/workspace/`; run `.\tools\workspace\dev.cmd` for localization and both unit suites, or pass Gradle tasks. The ignored `.devenv/` files are optional local compatibility aliases. Package settings must be explicit, even for offline cached runs; initialization does not import account credentials or overwrite cache configuration. Never commit credentials.

For a complete source/candidate check on Windows, use `.\tools\workspace\verify-full.cmd` (or
`tools/workspace/verify-full.ps1`). On an already configured JDK 21 / Android SDK environment:

```sh
python3 tools/verify_current.py --run-id my-change-01 --rerun-tests
```

This runs localization, source/provenance checks, verification/release tool contracts,
`:translation-core:testDebugUnitTest` and `:extensions:extension:testDebugUnitTest`, independent UI
assembly, MPP construction and explicit package/credential checks. It never calls a real model.
Use a fresh run ID; outputs are isolated under `build/maintenance/M1a/<run-id>/` and evidence under
`validation/runs/<run-id>/`. `--rerun-tests` forces only the two Test tasks; otherwise current Gradle
task receipts distinguish execution from valid `UP-TO-DATE` / `FROM-CACHE` reuse. Missing reports,
zero/effectively all-skipped tests, task failures and identity mismatches fail verification.

The summary names the exact candidate MPP, independent MPE, hashes, source fingerprint and reports.
Core reports follow the selected build root; extension reports remain in
`extensions/extension/build/{test-results,reports/tests}/`. The extension's standard build directory
is retained for R8. A plain `:patches:buildAndroid` still uses `build/n39/gradle/patches/libs/`.
Candidate verification checks the published metadata internally (`--mode published`); it does not
force its version to match a newer local candidate or generate a public patch list.
Local composition tasks need an original APK and the matching official MPP, supplied explicitly
through `composition.*` properties. Missing inputs mean composition is unverified. These
proprietary/input files are not distributed here.

Keep translation logic in `translation-core`, host integration in `application-host`, configuration and transport in `infrastructure`, display scheduling in `presentation`, settings and rendering in `ui`, and structural hooks in Kotlin `patches`. UI calls the core through the application interfaces. Preserve independent namespaces, the single public AI root, existing configuration/cache identity, publication ownership and typed DEX safety. Caption language is owned by YouTube/the official Captions patch; do not reintroduce a separate language-memory root. A fix should address a mechanism, not a video ID, phrase or arbitrary time offset. Add focused regression evidence for material behavior changes; do not rewrite old assertions to hide a failure.

Work on `dev` or a feature branch, use semantic commits (`feat:`, `fix:`, `chore:`), then merge `dev` into `main` without squashing. Publishing uses the existing semantic-release workflow; see [RELEASING.md](docs/RELEASING.md). Do not hand-edit generated release metadata.

For the maintainer's local Windows workspace, follow [AGENTS.md](AGENTS.md): project work stays on E:, while shared installed tools may remain on C:.

The current long-term direction is to maintain this independent bundle. See the [maintenance roadmap](docs/MAINTENANCE-ROADMAP.md) for the N75 baseline, protected behavior, phased improvements and acceptance criteria. Use the [maintenance operations guide](docs/maintenance/OPERATIONS.md) for candidate identity, daily checks, explicit composition inputs, evidence and guarded per-file rollback. [Current state](docs/PROJECT-STATE.md) names the accepted local candidate and current review status; historical upstream-migration plans do not define active work.
