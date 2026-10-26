# Workspace cleanup and artifact ownership

Cleanup is part of completing an experiment, finalizing a patch or finishing a CI
rehearsal. It is not optional.

## Required completion rule

Record the outcome, exact base, evidence and runtime limits. Delete generated APKs,
rebuildable scratch and repository-local output. Keep decoded trees, stock originals,
tooling, captures and compact evidence. Run the cleaner preview, review the plan,
then apply it and keep the receipt. Verify the protected hashes. Keep a dated failed
or retired record so a failed experiment is not recommended again.

The cleaner is repository-wide. Do not run `-Apply` while another experiment is
actively writing output; wait until that experiment stops, then preview and apply.

```powershell
.\tools\Clean-BuildResidue.ps1          # preview
.\tools\Clean-BuildResidue.ps1 -Apply   # delete and write a receipt
.\diagnostics\build-layout\Test-CleanBuildResidue.ps1
```

Receipts go to `../builds/steamlink-patches/_cleanup/steamlink-residue-<timestamp>.json`.

## Ownership

| Class | Location | Rule |
|---|---|---|
| Source | `patches/src/main`, `patches/src/test`, `extensions/*/src`, `diagnostics/` records | Tracked. Edit the source, never a generated copy. |
| Canonical inputs | decoded APK trees, `decoded-fixture-apks`, `decoded-fixture-sources`, stock APKs, tooling | Keep. Never delete or rewrite in place. |
| Generated output | external `build/`, `gradle/`, `extensions/<name>/build-*`, `_cleanup/` receipts | Delete when disposable. Keep receipts. |
| Evidence | `.md`, `.json`, `.txt`, `.log`, captures, validation reports | Keep compact records. Bulk artifacts can go after the record is written. |

## External paths

All generated output belongs under `../builds/steamlink-patches/`, outside the
checkout.

| Path | Contents | Cleanup |
|---|---|---|
| `gradle/root`, `gradle/patches` | Gradle and Kotlin output | Keep as build cache; `clean` only this tree. |
| `build/` | Mixed fixtures, tools, captures and experiment output | Classify children. Never delete wholesale. |
| `build/decoded-fixture-apks`, `build/decoded-fixture-sources` | Exact stock fixtures | Keep. |
| `build/4xvr-2.0.22/*_original.apk` | Pristine 4XVR stock base | Keep. |
| `build/tooling`, `build/verification` | Compilers and validation reports | Keep. |
| `build/startup-boundary-tools`, `build/audit-5002363` | Retained tool and audit compile trees | Keep their `classes`, `test-classes` and `compiled*` trees. |
| `build/live-hitch-*` | Device captures and result records | Keep captures and records. Generated APKs inside were retired on 2026-10-24 by owner decision. |
| `build/*/temporary`, decoded trees | Decoded APK contents | Keep unless the user explicitly retires that experiment. |
| `extensions/<name>/build-*` | Native CMake output | Keep if it holds downloaded OpenXR headers or referenced native inputs; otherwise regenerate with the project script. |
| `validation/`, `migration*` | Retained checkouts and relocation receipts | Keep. |

The residue cleaner deletes generated APKs, `isolated-checkout*`, `compiled*`,
`classes`, `test-classes`, `node_modules`, `scratch*`, repository-local `build/`,
`patches/build/`, `.gradle/`, `.kotlin/`, nested `builds/`, the lowercase `d/` tree
and `__pycache__`. It keeps the paths above and all evidence files outside deleted
scratch. Compile trees under `startup-boundary-tools` and `audit-5002363` are
protected; the first apply removed those two trees before they were added to the
keep list. They are rebuildable from source and the regression test now covers them.

## 2026-10-24 retired generated APKs

The owner confirmed that Morphe is used directly and build-folder APKs are never
consumed. The apply retired the generated 4XVR patched builds, the live-hitch
installed verification APKs, the audit `isolated-original-input` copies and one
patched-resources APK inside a temporary decoded tree. Nine stock/decoded APKs
remain. Their sizes and hashes remain in the records and the apply receipts
`_cleanup/steamlink-residue-20261024-185648.json` and
`_cleanup/steamlink-residue-20261024-194012.json`; the canonical stock 4XVR APK and
decoded fixtures remain. The affected 4XVR launch-hang and live-hitch records now
state that those generated copies are retired.

The non-`main`/`dev` CI branch artifact upload was removed in the same change. CI
builds the release graph as a gate but uploads no bundle; local outputs are not
consumed from CI.

## Repository rules

- Canonical patch code and payloads live in `patches/src/main` for every app. Never
  create `patches/bin` or a second source tree.
- Keep generated CMake build trees out of Git.
- GitHub release workflows build Morphe bundles and catalogs; they do not regenerate
  native `.so` payloads. Preserve source resource binaries, tracked catalogs, exact
  decoded bases, fixture APKs and audit tools.
- Use `python -B` or an external `sys.pycache_prefix`; do not leave `__pycache__` in
  source folders.
- A new experiment uses the external root for every build, checkout, log and cache.

## Retired experiments

| Experiment | Status | Record |
|---|---|---|
| Decoder input buffering | Retired; headset test failed | `diagnostics/steamlink-hitches/TRIED-EXPERIMENTS.md` |
| FEC duplicate reservation guard | Retired; headset test failed | `diagnostics/steamlink-hitches/TRIED-EXPERIMENTS.md` |
| UDP receive buffer | Retired; headset test failed | `diagnostics/steamlink-hitches/TRIED-EXPERIMENTS.md` |
| Uber link rescan disable | Retired; headset test failed | `diagnostics/steamlink-hitches/TRIED-EXPERIMENTS.md` |
| Full-FOV foveal canvas | Retired; did not solve high resolution | `diagnostics/steamlink-foveal-canvas/` |

Do not re-add or re-derive them. Read the hitch ledger before hitch work and the resolution ledger before resolution work.

## History

The full dated cleanup record through 2026-10-24 is archived at
`diagnostics/build-layout/cleanup-history-2026-10-24.md`. Historical receipts under
`diagnostics/*/cleanup.json` and `build/*/cleanup/` remain evidence. Older records
may use the former repository-root `build/` path; map it with
`tools/Build-Paths.ps1` or `diagnostics/build-layout/README.md`.

## Completion conditions

- The cleaner receipt exists and reports `status: passed`.
- Protected hashes are unchanged.
- No generated APK remains outside the stock/decoded allowlist.
- No repository-local `build/`, `builds/`, `d/`, `.gradle/` or `.kotlin/` tree exists.
- Retained evidence and canonical inputs still exist.
- The final report states removed bytes, retained inputs and any skipped target.
