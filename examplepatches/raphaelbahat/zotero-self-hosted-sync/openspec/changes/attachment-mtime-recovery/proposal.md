## Why

Attachments created or synced on Android never upload their files. The device's own trace (captured with the diagnostic-logging patch) shows the cause:

```
E [DefaultDispatcher-worker-1]ReadAttachmentUploadsDbRequest: mtime field value not a number !!!
```

12 lines per sync pass — every attachment the reader considers — followed by no `UploadAttachmentSyncAction` line and **zero** requests to any `items/<key>/file` endpoint. The reader parses the attachment's stored `mtime` with `String.toLongOrNull()` and **skips the whole attachment** when the result is null, so the file protocol is never entered: metadata syncs, bytes never leave the phone, and the server keeps an attachment row with empty `md5`/`mtime`.

The empty value arrives with the attachment's *server* copy — a metadata-only attachment whose file was never registered — and is written into the local row by the item sync, overwriting the numeric value the client had stored when it created the file attachment (`CreateAttachmentDbRequest` writes `System.currentTimeMillis()` for a file attachment). From then on the reader skips it, so the file can never upload and the field can never be repaired: a closed loop.

The same reader already repairs the analogous case for `md5` (a literal `"null"` is recomputed from the file); `mtime` has no such recovery.

## What Changes

- A new patch, **Recover attachments with an unusable modification time** (on by default, since the
  alternative is silently never uploading), that substitutes a usable modification time instead of
  discarding the attachment.
- The substitute is a bounded inaccuracy: it becomes the value the attachment carries (the sync path
  never writes the file's own modification time — `StoreMtimeForAttachmentDbRequest` belongs to
  WebDAV only), so it is the upload time rather than the file's. That is a deliberate trade against
  never uploading the file at all, and it is stated as such in the design rather than left as a claim
  that the field converges on its own.
- A small extension module returns to the bundle to provide the helper (JDK-only code).

## Capabilities

### New Capabilities

- `attachment-upload-recovery`: uploading attachments whose stored metadata cannot be used as-is,
  without changing behaviour for attachments whose metadata is already valid.

### Modified Capabilities

- None.

## Impact

- `patches/src/main/kotlin/app/anondev/patches/zotero/uploads/` — the new patch.
- `extensions/extension/` — re-created (the first change removed it); one JDK-only helper class.
- One instruction in `ReadAttachmentUploadsDbRequest` changes; no other class, request or stored
  value is touched.
