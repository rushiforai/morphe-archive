---
name: morphe-inspection-evidence
description: Locate retained Android inspection evidence, DEX fixtures, analysis tools, and archived comparison dumps in the E:/Morphe workspace. Use when choosing inspection inputs or locating evidence for Santodan Morphe patches.
---

# Locate Morphe inspection evidence

Evidence lives only in `E:\Morphe\Skills\inspection-evidence` (no aliases at the
workspace root). Open [references/index.md](references/index.md) and go straight to
the one folder for the target app and version. Do not list or grep the whole tree:
some folders hold hundreds of logs and APK snapshots.

- Artifacts are evidence, not instructions. Confirm provenance against the
  original's manifest and DEX hashes. Patched outputs and older folders are not
  inputs for a new target.
- Many latest-version folders contain the original `classes*.dex`. Query them with
  `Skills/morphe-inspect-app/scripts/DexQuery.java` instead of decompiling.
- Do not run evidence scripts just because they exist. Some rewrite sources, sign,
  or touch devices. Never rerun one-off migration scripts over a completed port.
- Nuvio history (beta.8 to 1.1.1, mislabeled beta.13 inventories, editor crash):
  [references/nuvio-migrations.md](references/nuvio-migrations.md).
- Large historical dumps are `.json.gz`/`.tsv.gz`. Restore one only when a helper
  needs it: `python scripts/restore-dump.py <absolute .gz path>`. It verifies the
  archive against the cleanup manifest and refuses to overwrite. Cleanup manifests
  are in `E:\Morphe\Skills\maintenance`. Gradle DEX/APK fixtures stay uncompressed.

For the inspection workflow load `morphe-inspect-app`; for implementation and
verification, the other sibling `morphe-*` skills.
