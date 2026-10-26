# External build layout

All generated output belongs under `../builds/steamlink-patches/`, outside the
checkout. Scripts resolve it relative to the checkout, including on CI.

| Former project folder | External folder |
|---|---|
| `build/` | `build/` |
| `patches/build/` | `gradle/patches/` |
| Root Gradle output | `gradle/root/` |
| `.gradle/`, `.kotlin/` | `.gradle/`, `.kotlin/` |
| `extensions/<name>/build-*` | Same relative path |

`build/` is mixed: it holds retained fixtures, tools, captures and evidence as well
as disposable output. Classify children; never delete it wholesale.

## Keep

- `build/decoded-fixture-apks/`, `build/decoded-fixture-sources/`
- the exact stock APK at `build/4xvr-2.0.22/*_original.apk`
- `build/tooling/`, `build/verification/`
- `build/live-hitch-*/` captures and compact records
- decoded APK trees, `gradle/`, `validation/`, `migration*`, `_cleanup/`
- source binaries, fixture APKs, exact decoded bases and audit tools

## Delete

- generated `*.apk` files outside the keep list
- `isolated-checkout*`, `compiled*`, `classes`, `test-classes`, `node_modules`,
  `scratch*`
- repository-local `build/`, `patches/build/`, `.gradle/`, `.kotlin/`, nested
  `builds/`, the lowercase `d/` tree and `__pycache__`

Preview, apply and test the cleaner:

```powershell
.\tools\Clean-BuildResidue.ps1
.\tools\Clean-BuildResidue.ps1 -Apply
.\diagnostics\build-layout\Test-CleanBuildResidue.ps1
```

Full policy and retained-exception conditions: `WORKSPACE_CLEANUP.md`.

## Rules

- Use `python -B` or an external cache prefix; do not leave bytecode caches in
  source folders.
- Gradle `clean` touches only `gradle/`, never retained `build/` inputs.
- A relocated CMake cache may contain absolute paths. Configure a fresh external
  directory or use `cmake --fresh -S <source> -B <external-output>`; do not reuse
  relocated configure state.
- Saved Java classpaths are translated by `tools/build_paths.py`. Python tool
  packages remain usable through explicit `sys.path`; recreate old virtualenv
  launchers if needed.
- Historical receipts keep their original paths. Map old `build/` and
  `patches/build/` prefixes with `tools/Build-Paths.ps1`.

## Records

- Migration receipt: `2026-10-08-migration.json`
- CI repair: `2026-10-08-ci-repair.md`
- Single-build workflow: `2026-10-12-ci-single-build.md`
- Cleanup history through 2026-10-24: `cleanup-history-2026-10-24.md`
- Current residue receipt: `2026-10-24-residue-cleanup.md`
- Verification runners: `diagnostics/build-verification/Test-VerifyBuild.ps1`,
  `diagnostics/build-layout/Test-BuildPaths.ps1`,
  `diagnostics/build-layout/Test-CleanBuildResidue.ps1`
