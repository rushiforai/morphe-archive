# Fossify File Manager: nested favorite paths

Patch: **Keep favorites consistent after folder rename or removal**.
Target: official Fossify File Manager 1.6.2, `org.fossify.filemanager`, `file-manager-14-foss-release.apk`.
Original SHA-256: `c2993c75ea7287e7ede354b061d9c8772aa9b4b050e7660ec1ebc3592dc3d051`.
Original release: https://github.com/FossifyOrg/File-Manager/releases/tag/1.6.2
Issue: https://github.com/FossifyOrg/File-Manager/issues/513

## Behavior

After a successful rename, rewrite favorites equal to the old path or below `oldPath + "/"`. A sibling such as `DocsSibling` is not under `Docs`. Preserve the suffix, case, unrelated favorites and set semantics. Failed/canceled callbacks leave favorites unchanged. No file moves, overwrites, deletion calls or storage permissions are added by the extension.

The patch wraps the existing shared `ActivityKt.renameFile(BaseSimpleActivity,String,String,boolean,Function2)` callback. A Java proxy implements the exact R8-renamed Kotlin callback interface `Lg11;`; update favorite metadata before forwarding the original callback, preserve its return/exception behavior, and keep null callbacks null. The unused boolean is retained in the extension signature so the original five contiguous argument registers can be passed without extra register allocation. Callback metadata-update failures are logged and the original callback still runs. Single and multiple rename dialogs share this operation.

For deletion, extend only the existing `ItemsAdapter.deleteFiles` selection cleanup call, removing favorite descendants alongside its original exact-path cleanup. Ordinary **Remove favorite** actions stay exact and keep descendant favorites. Deletion cleanup happens at Fossify's existing pre-deletion selection stage, not after confirmed filesystem deletion. If the later filesystem deletion fails, those selected favorites may already be gone; this patch does not change Fossify's deletion timing or claim failure-safe delete restoration.

Exact method signature, original call reference, register count and dead-register boundary checks reject unsupported APK layouts.

## Verification

Isolated Android 15 ARM64, disposable shared-storage fixtures only:

- Original: favorite `Docs/Projects`, rename `Docs` to `Docs2`; the favorite still displays `Docs/Projects` although the folder is now `Docs2`.
- Patched: same UI rename gives `Docs2/Projects`; the favorite opens the correct folder and remains in preferences after process restart.
- Actual multi-select rename dialog: append `X` to `Notes` and `DocsSibling`; both corresponding favorites follow their successful renames.
- Actual deletion of synthetic `Docs2`: nested favorite removed, `DocsSibling` and `Notes` retained.
- Ordinary unfavorite removes only the exact entry, independently verified against the installed app's original Config method.
- 26 native instrumentation assertions pass against the installed patched APK: exact/nested/path-boundary transformations, no input mutation, absent paths, trailing separators, same/empty/root paths, deduplication, invalid removes, failed/successful/null callbacks and exception propagation, ordinary unfavorite, selected deletion cleanup, real single/multiple-mode native rename callbacks, original file content preservation.
- Original-to-patched APK update with the same disposable certificate installs successfully. No data migration. Final fresh crash log empty.

Native 1080 × 1920 before/after screenshots use the same fixture, emulator and viewport. Additional multi-rename screenshot retained.

## Installation and limits

Use the original official 1.6.2 APK. Patched package remains `org.fossify.filemanager`. Updating an existing same-key Morphe installation preserves app data. Migrating from an official signature requires separate app-settings/favorites recovery planning; do not uninstall an existing installation just to bypass a signature conflict without a verified backup.

Independently tested storage: emulator internal shared storage. SD cards, external document providers/SAF permission/error branches, root paths, physical Xiaomi devices, mobile Morphe Manager and other Android versions remain unverified. The hook covers the shared operation, but that alone does not prove every storage backend. No recovery of favorites lost before installing the patch, no interception of renames by other apps, and no repair of unrelated upstream rename/delete errors are promised.

## Before and after

| Before | After |
| --- | --- |
| <img src="https://github.com/pengusto/penguin-patches/blob/pr-assets/filemanager/before.png?raw=true" width="320" alt="Original app before patch" /> | <img src="https://github.com/pengusto/penguin-patches/blob/pr-assets/filemanager/after.png?raw=true" width="320" alt="Patched app after the same operation" /> |

[Native screenshots and test results](https://github.com/pengusto/penguin-patches/tree/pr-assets).
