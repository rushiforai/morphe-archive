# Folder reviews

## Supported input

- Package: `com.chessable.chessable`
- Version: `3.0.4`, version code `118333`
- APK SHA-256: `ddc7ee49e98bb449fbadd0d12c11e117c0d8548ab8f8fed4bed2b56834e7485d`
- Hermes v96 asset: `assets/index.android.bundle`
- Bundle SHA-256: `cc6f85db55e96769a08058975fd09af6f7af227899b32f8c570240179693e95e`

The APK contains the complete folder UI and review implementation. `onReviewFolder`
passes `studyMode: review` and `folderId` to MoveTrainer. The queue loader requests
`/v1/reviewAllData` and folder membership separately. The existing review selector
uses the folder's course IDs to filter eligible material. Live non-PRO testing
confirms folder scope and server-persisted reviews; see [testing](testing.md) for
the exact evidence and limitations.

## Audited changes

All offsets below are absolute offsets in the uncompressed bundle. Offsets are
valid only for the fingerprint above. No app-wide entitlement getters are changed.

| Purpose | Function anchor | Offset | Change |
| --- | --- | --- | --- |
| Show the native folder button when reviews are due | #28498, the effect in #28496; `getFolderReviewNum`, `hideButton`, `showButton` | `0x7c3925` | Replace the premium-only branch with a register-preserving `Mov`. Loading and zero-count behavior stays native. |
| Retain the chosen folder in the review tab | #25505; `folderId`, `userIsPro`, `folderLimit` | `0x769928` | Remove the premium-only branch before assigning `folderLimit.id`. |
| Display the native random switch | #27189 `RandomReviewSetting` | `0x798417` | Test the already-validated review eligibility register instead of `proSettingsEnabled`. The earlier review-mode and single-course guards remain. |
| Honor the stored random preference | #25860 `getIsReviewAll_random` | `0x770f64` | Always read the user-local preference; preserve the false default. |
| Reject a disappeared folder | #25800, generator behind `getReviewAll` | `0x76fbda` | Throw the existing error string (#54979) instead of clearing the folder ID and continuing globally. |
| Keep folders reachable on fresh accounts | #27966 `renderItem`; `DashboardFoldersButton`, `ProTrialWidget` | `0x7afb89` | Replace the trial-banner branch with a register-preserving `Mov`. The native Folders entry is rendered; the surrounding folder-visibility checks remain. |

Authenticated testing reproduced the trial banner replacing the Folders entry on
the fresh account, even after courses were added to a folder. Restoring this entry
is necessary to reach folder review. Upgrade controls elsewhere remain native.

The missing-folder change rejects the loading promise through the existing error
path. A live two-client deletion test confirms the native error screen appears without
falling back to global review.

`HermesEdits` checks the magic, version, file length, footer checksum, edit bounds,
original instructions, and whole-bundle SHA-256 before writing anything. Known
edits are normalized for fingerprint checking, so reapplication is idempotent.
Every replacement has the same length; jump targets and exception tables remain
valid. The SHA-1 footer is recomputed after all edits succeed.

## Adding patches and app versions

Use a separate named Morphe patch for each user-facing behavior. Reuse the asset
editing helper, rather than introducing a runtime extension for static changes.
Inspect each new app version, record its fingerprint and branch semantics, and
add a tested profile before advertising compatibility. Do not remove validation
to make an unknown build appear supported.

The current profile rejects unrelated bundle modifications. When adding another
Hermes patch, extend the shared profile to normalize all recognized edits and test
both selection orders. Never accept arbitrary modifications to the bundle.

For inspection, `P1sec/hermes-dec` supports this Hermes version. Keep extracted
bundles and disassemblies in a private temporary directory, not in this repository.
