# Historical recovery

Current commands, contracts and progress are in the [documentation index](../README.md). Old reports/cards/prompts are evidence, not active instructions. They are not required to build or maintain current source.

## Committed history

Use Git commits/tags for earlier source and CHANGELOG/Releases for delivered versions. The repository HEAD at the 2026-10-28 audit entry was db8948c9880fa6951306fe84bd113ffebcc74bc5; the working tree already contained substantial uncommitted maintenance. That commit does not reconstruct the newer working tree.

## Private originals

These local-only paths are deliberately absent from a public clone:

- `validation/runs/20261028-D6-F123-review-01/entry.zip`, with cleanup-plan.json/archive-manifest.json: retired old N/version documents, scoreboard, generated disassembly and one-off tools from the earlier cleanup.
- `validation/runs/20261028-repository-governance-01/entry.zip`, with entry.json/retirement-plan.json: exact entry bytes and original paths for the later retired maintenance cards/prompts/reports, superseded guides, unused tools and duplicate fixture. This same archive covers pre-edit versions; no second copy of the retired documentation collection was created.
- `validation/runs/20261028-repository-governance-01/historical-delivery-moves.json`: original→private path/SHA mapping for the two 1.3.5 MPPs now under `.verification/release-archive/1.3.5/`.

For recovery, verify the archive SHA in its manifest and the selected member SHA; extract only needed paths into `.tmp/`, compare with current files, and do not overwrite later edits. Archived scripts contain old workspace paths and must not be run blindly. A source archive is not a backup of phone configuration/API keys.

Original diagnostic history, published/candidate assets and raw validation records remain private and byte-preserved. Three older temporary duplicate ZIPs whose removal was previously blocked by automatic approval review were not retried in this governance run; they are not official restoration entry points. Shared tools/caches were not repacked or removed.

The later supplemental-retirement.json also indexes the retired ui-preservation.json. Its stored hashes were never checked by the old path counter; real source/protocol/localization/layout/package guards remain. local-entry-retirement.json records the ignored obsolete access probe and old local README. composition-scratch-plan.json records generated Patcher session working directories removed only alongside retained complete APK/structure evidence; failed/unknown sessions remain. Regenerable native extraction and Patcher scratch are not backed up as unique history.
