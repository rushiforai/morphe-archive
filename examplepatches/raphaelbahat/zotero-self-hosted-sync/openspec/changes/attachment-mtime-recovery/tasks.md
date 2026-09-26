## 1. Evidence

- [x] 1.1 Capture the client's own trace (with the diagnostic-logging patch) and confirm the reader skips every attachment: 12 `mtime field value not a number !!!` lines per sync pass, no `UploadAttachmentSyncAction` line, and zero requests to any `items/<key>/file` endpoint.
- [x] 1.2 Locate the parse site in the pinned artifact: `classes7/…/ReadAttachmentUploadsDbRequest.smali:336` — `invoke-static {v7}, Lkotlin/text/StringsKt;->toLongOrNull(Ljava/lang/String;)Ljava/lang/Long;`, followed by `if-nez v12, :cond_bc`. The app uses `toLongOrNull` in nine classes, so the change must be scoped to this one.

## 2. Patch and extension

- [x] 2.1 Re-create the extension module (removed by the first change) with a JDK-only helper that returns a non-null epoch-milliseconds value for a stored string.
- [x] 2.2 Add the patch: replace that one call inside `ReadAttachmentUploadsDbRequest` with the extension helper (same signature, original register), fail when the call is absent, and declare `extendWith` for the extension.
- [x] 2.3 Confirm the replacement is scoped to that class only.

## 3. Build and artifact verification

- [x] 3.1 Build with `./gradlew buildAndroid`; list the bundle and confirm the new patch appears.
- [x] 3.2 Patch the pinned APK with the patch selected; confirm in the artifact that the call site now invokes the extension helper and that the helper class is present in the merged DEX.
- [x] 3.3 Confirm the rest of the reader's logic and every other `toLongOrNull` call site are unchanged. (The reader now holds zero `StringsKt->toLongOrNull` calls, the patch only ever iterates that one class, and the other eight call sites live in untouched classes.)

## 4. Device verification (needs the device)

- [x] 4.1 Install and sync: the reader no longer logs the skip (0 `mtime field value not a number` lines, was 12 per pass), `UploadAttachmentSyncAction` reaches the upload, the request reaches `items/Z5B8C2J9/file` and is answered `200`, the bytes are uploaded, and the register step answers `204` — altero only returns that after re-reading the stored bytes and matching the authorized length and digest.
- [x] 4.2 A later sync does not reintroduce an unusable value: with the attachment uploaded, a following sync window makes **0** requests to its file endpoint (measured in its own window), so the reader no longer consults the field. **Correction, verified in the client source:** the stored value is the substitute this patch supplies, not the file's own modification time — `StoreMtimeForAttachmentDbRequest` is called only by `WebDavController`, so the sync/upload path never writes the file's mtime. The earlier wording here and D4 below were wrong and are corrected.

## 5. Hygiene

- [x] 5.1 Run `openspec validate attachment-mtime-recovery --strict` and fix anything it reports.
