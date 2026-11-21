# Repository Guidelines

Scope: the Python 3.12+ `apk-lab` CLI, its deterministic workspaces/toolchain, and pytest suite.

`docs/apk-lab.md` is the full command and behavior reference. Keep it synchronized with CLI flags, output, exit codes, storage layout, and safety invariants.

## Architecture

- `apk_lab/cli.py`: parser, input validation, command handlers, and exit-code mapping.
- `models.py`: shared immutable/domain models.
- `archives.py`, `inspection.py`, `comparison.py`: safe container handling and artifact metadata/diffs.
- `workspace.py`: deterministic managed `.apk-lab/` runs and guarded cleanup.
- `tools.py`, `tools.lock.json`: pinned external-tool install and checksum verification.
- `morphe.py`: isolated patch execution and result validation.
- `compatibility_ci.py`, `fixtures.py`: package matrix, R2 fixture lifecycle, and result reporting.
- `asm.py`, `il2cpp.py`, `unity.py`, `smali.py`, `resources.py`, `code_inspection.py`: targeted reverse-engineering utilities.
- `deployment.py`, `device.py`: patch/sign/install/launch and runtime health monitoring.
- `tests/test_<area>.py`: behavior tests mirroring module boundaries.

## Runtime and Dependency Rules

- Use Python 3.12+ and `uv`; never install dependencies into the repository with bare `pip`.
- Sync with `uv sync --locked --project tools/apk-lab` and run with `uv run --project tools/apk-lab ...`.
- External JADX/Apktool/smali/Morphe/apkeep binaries must come from `apk-lab setup` and `tools.lock.json`; preserve URL/version/SHA-256 pinning.
- Android SDK tools resolve through `ANDROID_HOME`, `ANDROID_SDK_ROOT`, or root `local.properties`; Build Tools 36.0.0 is the compatibility baseline.

## Code Patterns

- Use `pathlib.Path`, typed return values, small domain models, and explicit dependencies/paths. Keep filesystem and subprocess boundaries visible.
- Validate untrusted archive member names, duplicate entries, compression limits, symlinks, output paths, and container identity before extraction or mutation.
- Preserve deterministic directory IDs, ordering, JSON serialization, and command output. Stable machine-readable output is an API.
- Raise domain-specific exceptions in modules; translate them to concise stderr plus stable exit codes at CLI boundaries. Do not catch broad exceptions inside pure helpers.
- Make destructive operations explicit and guarded. Cleanup must verify `.marker.json`, workspace containment, and non-symlink paths.
- Keep device/cloud/network calls injectable or mockable. Unit tests must not require credentials, a device, or network unless explicitly opt-in.
- Do not weaken verification to accommodate a patch. A failed structural check is evidence to fix the patch or fixture.

## Managed Workspace Invariant

All APK extraction/decompilation uses `.apk-lab/<package>/...` (or custom root specified via global `--workspace-root PATH` before the subcommand) through `WorkspaceManager`.

- Never create ad hoc unzip/JADX/Apktool directories elsewhere in the repo.
- Never use raw `rm -rf` on a workspace.
- Use `apk-lab clean --run <path>` (strictly rejects invalid markers or uncontained paths) or `apk-lab clean --package <pkg>` / `--stale <days>` (skips malformed or unmarked runs and cleans valid entries).
- `inspect` should not create a persistent workspace; analysis/check commands print their managed location and cleanup command.

## Core Commands

```bash
uv sync --locked --project tools/apk-lab
uv run --project tools/apk-lab apk-lab setup --profile analysis
uv run --project tools/apk-lab apk-lab doctor

uv run --project tools/apk-lab apk-lab inspect path/to/app.apkm
uv run --project tools/apk-lab apk-lab analyze path/to/app.apkm --smali
uv run --project tools/apk-lab apk-lab compare old.apkm new.apkm
uv run --project tools/apk-lab apk-lab acquire com.example.app

uv run --project tools/apk-lab apk-lab check path/to/app.apkm \
  --mpp patches/build/libs/patches-X.Y.Z.mpp \
  --package com.example.app \
  --all

# Rapid inner iteration loop during patch authoring: builds patches, locates artifact,
# negotiates keystore, signs, deploys, and launches
uv run --project tools/apk-lab apk-lab dev <app>

# Or deploy explicitly:
uv run --project tools/apk-lab apk-lab deploy path/to/app.apkm \
  --mpp patches/build/libs/patches-X.Y.Z.mpp \
  --package com.example.app \
  --all --launch
uv run --project tools/apk-lab apk-lab monitor \
  --package com.example.app --timeout 10.0 --dump-threads
uv run --project tools/apk-lab apk-lab crash-trace \
  --package com.example.app

uv run --project tools/apk-lab apk-lab clean --package com.example.app
```

Targeted tools: `asm`, `il2cpp`, `unity`, `inspect-code`, `validate-smali`, `res`, and `fixtures`. Prefer them over one-off extraction or assembly scripts.

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
uv run --project tools/apk-lab pytest -q \
  tools/apk-lab/tests/test_<area>.py::<test_name>

# Full module suite
uv run --project tools/apk-lab pytest -q

# Static checks are also available through root orchestration
bun run lint
bun run typecheck
bun run audit
```

Tests should be deterministic, isolated, and use `tmp_path`, `monkeypatch`, and mocks/fakes for subprocess/device/network/cloud boundaries. Add permanent tests for archive safety, path containment, parsing, transitions, exit codes, and consumer-visible CLI behavior—not source-text assertions or mock echoes.

A CLI feature also requires a smoke run of the changed command. Device behavior requires an actual deploy/monitor run when hardware/emulator access exists; state the limitation if it does not.
