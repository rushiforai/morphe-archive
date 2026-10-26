# Build residue cleanup - 2026-10-24

Tool: `tools/Clean-BuildResidue.ps1`
Regression test: `diagnostics/build-layout/Test-CleanBuildResidue.ps1` (55 assertions)
Full policy: `../WORKSPACE_CLEANUP.md`

## Baseline

| Measurement | Value |
|---|---|
| External root | 28,805,506,752 bytes (26.83 GiB) |
| Files | 121,248 |
| APKs | 138 (10,069,749,743 bytes, 9.38 GiB) |
| Repository-local residue | `build/`, `builds/`, `d/`, `.gradle/` |

## Applied

| Measurement | Value |
|---|---|
| Preview plan | 173 targets, 33,902 files, 12,213,726,866 bytes (11.37 GiB) |
| Applied | 173 targets, 33,902 files, 12,213,726,866 bytes |
| Second apply | 0 targets, 0 files, 0 bytes |
| External root after | 16,568,378,094 bytes (15.43 GiB) |
| Files after | 87,388 |
| APKs after | 9 (720,727,566 bytes, 0.67 GiB) |

Receipts:

- Preview: `_cleanup/steamlink-residue-20261024-185546.json`
- Apply: `_cleanup/steamlink-residue-20261024-185648.json`
- Idempotency check: `_cleanup/steamlink-residue-20261024-185751.json`

## Retained APKs

| Bytes | Path |
|---|---|
| 372.51 MiB | `build/4xvr-2.0.22/cn.vr4p.oculus4xvrplayerov_2.0.22_original.apk` |
| 39.43 MiB | `build/audit-5002363/pristine-input/decoded-apk-...-2.0.23-5002363.apk` |
| 7 fixtures | `build/decoded-fixture-apks/*.apk` |

The 4XVR original SHA-256 remains
`24b83ab584675e02570e5318a35c7fa9b8da7eabb1f0763711c74c1bad3a84a8`.
All 13 protected hashes in the apply receipt match after deletion.

## Deleted classes

- Generated APKs under experiment, audit, decoded temporary and `live-hitch`
  directories, including the two generated 4XVR patched builds, the audit
  `isolated-original-input` copies, the live-hitch installed verification APKs and
  one patched-resources APK inside a temporary decoded tree. The owner confirmed
  these are never consumed; hashes/sizes remain in the records and the apply
  receipt.
- `isolated-checkout` trees, compiled classes, `node_modules` and `scratch` under
  the external build root.
- Repository-local `build/`, `builds/`, `d/`, `.gradle/`, `patches/build/`,
  `__pycache__` and a local native `build-*` tree.
- The first apply also removed `startup-boundary-tools` and `audit-5002363` compile
  trees before they were added to the protected list. They are rebuildable from
  source; the cleaner now protects both prefixes and the regression test covers them.

Decoded APK trees, `temporary` decoded content, `tooling`, `verification`,
`live-hitch` captures, `gradle/`, `validation/` and `migration*` remain.

## CI artifact removal

The non-`main`/`dev` branch artifact upload was removed from
`.github/workflows/release.yml`. The no-release build gate still runs; CI uploads no
bundle because build outputs are not consumed. The rule ledger records this
intentional change.

## Verification

- Second apply reclaimed 0 bytes.
- Protected hashes verified by the cleaner.
- Repository-local residue paths are absent.
- Remaining 10 APKs are stock fixtures, pristine copies or decoded content.
