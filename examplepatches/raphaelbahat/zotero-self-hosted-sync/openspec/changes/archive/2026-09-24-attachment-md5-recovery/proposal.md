## Why

Attachments created or synced on Android still never upload their files. The device's own trace — captured with the diagnostic-logging patch, and identical to the banner the app shows when syncing — names every part of the failure:

```
E [DefaultDispatcher-worker-1]UploadAttachmentSyncAction: could not upload
E [DefaultDispatcher-worker-1]UploadAttachmentSyncAction: authorizationFailed(statusCode=400, response=md5 not provided, hadIfMatchHeader=false)
E [DefaultDispatcher-worker-1]AuthorizeUploadSyncAction: key=Z5B8C2J9;oldMd5=null;md5=;filesize=208429;mtime=1790273325176
```

The third line is the client's own record of what it sent, and `md5=` is **empty**. The request
`POST /users/1/items/Z5B8C2J9/file` therefore carries an empty `md5` field, and the server answers
`400` with a 16-byte body — exactly `md5 not provided`. With no upload authorization the file is
never uploaded, `MarkAttachmentUploadedDbRequest` never records it, and the attachment never appears
on the desktop: the reported "attachments are still not synced" is this one request.

The client's upload reader repairs a stored `md5` only when it is the literal string `"null"`:

```kotlin
if (md5Field.value == "null") {
    md5Field.value = fileStorage.md5(file)
}
```

A row holding an **empty** value — which is what the item sync leaves behind for an attachment whose
file was never registered — is not repaired, so the empty digest goes to the wire verbatim. This is
the same closed loop the `attachment-mtime-recovery` change addresses, one field over: no upload, so
no repair, so no upload.

The server is not at fault. It enforces the protocol: `altero/services/storage.py` builds
`missing = [name for name in ("md5", "filename", "filesize", "mtime") if not form.get(name)]`, and
`not ""` is true, so an empty field is reported as `md5 not provided`; a present value is then
checked to be a 32-character hex digest. The desktop client always sends a real digest, which is why
the same library accepts uploads from the desktop and none from the phone.

## What Changes

- A new patch, **Recover attachments with an unusable MD5** (on by default, since the alternative is
  silently never uploading), that generalises the reader's own repair from "the stored value is the
  literal `"null"`" to "the stored value is not a digest the server accepts".
- The repair the reader already performs — recompute with `FileStore.md5` and store the result on the
  attachment — is left to do the work, so the stored value is corrected rather than merely
  substituted for one request.
- The helper is added to the existing extension module (JDK-only code).

## Capabilities

### New Capabilities

- None.

### Modified Capabilities

- `attachment-upload-recovery` (introduced by the in-flight `attachment-mtime-recovery` change):
  extends "an attachment whose stored metadata cannot be used as-is is still uploaded" from the
  modification time to the digest, without changing behaviour for an attachment whose value is
  already usable.

## Impact

- `patches/src/main/kotlin/app/anondev/patches/zotero/uploads/` — the new patch.
- `extensions/extension/` — one more JDK-only helper class.
- One instruction in `ReadAttachmentUploadsDbRequest` changes: the comparison that guards the
  existing md5 repair. The `"null"` constant it compares against is shared with the correct
  `backendMd5 == "null"` check further down, so that constant is deliberately left in place and the
  second check is untouched.
- No request, stored value or code path outside that one comparison is affected. `AttachmentUpload`
  is built in this reader and nowhere else, so no other upload path carries a stored digest.
