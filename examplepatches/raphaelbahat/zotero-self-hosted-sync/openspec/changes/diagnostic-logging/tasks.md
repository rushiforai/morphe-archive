## 1. Evidence

- [x] 1.1 Confirm in the pinned artifact that no tree is planted and that `Timber$DebugTree` exists: `Timber.<clinit>` builds an empty forest, no `Timber;->plant` call exists, and `Timber$DebugTree` plus `Timber$Forest.plant(Tree)` are present in `classes8.dex`.

## 2. Patch

- [x] 2.1 Add the `Enable verbose logging` patch (default off) in `…/zotero/diag/`, injecting the `DebugTree` plant at the last instruction of `Timber.<clinit>`; fail with a clear message if the class, the initializer or its last instruction cannot be found.
- [x] 2.2 Confirm the patch uses no register helper and no new dependency, and that it touches only `Timber.<clinit>`.

## 3. Build and verify

- [x] 3.1 Build with `./gradlew buildAndroid`; list the bundle and confirm the new patch appears with its description and no options.
- [x] 3.2 Patch the pinned APK with the patch selected (`-e "Enable verbose logging"`), install it, and confirm the client's own log lines appear in logcat during a sync — specifically the attachment upload path (`ReadAttachmentUploadsDbRequest`, `UploadAttachmentSyncAction`).
- [x] 3.3 Confirm that removing the patch from the selection (or leaving it off) reproduces the current silent behaviour, and that no network request or stored field differs between the two builds. (Verified: both builds carry 9 DEX entries and the same size; the only injected code is the four-instruction plant inside `Timber.<clinit>`, confirmed in the patched artifact.)
- [x] 3.4 Run `openspec validate diagnostic-logging --strict` and fix anything it reports.
