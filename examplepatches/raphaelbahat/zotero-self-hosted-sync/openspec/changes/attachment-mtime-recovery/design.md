## Context

Measured on the device with the diagnostic-logging patch applied: the upload reader logs
`mtime field value not a number !!!` once per attachment per sync pass (12 per pass in this
library), queues nothing, and issues no request to any `items/<key>/file` endpoint. The server
therefore only ever holds attachment *metadata* for anything created on Android.

The reader's code (`ReadAttachmentUploadsDbRequest.process`) is a `mapNotNull` that returns null —
silently dropping the attachment — for a missing field, a missing content type, a missing md5 and a
non-numeric mtime. The same block repairs a literal `"null"` **md5** by recomputing it from the
file; the mtime has no recovery, so an unusable value is permanent.

Verified in the pinned artifact (`classes7`):

```smali
:cond_92
invoke-virtual {v6}, Lorg/zotero/android/database/objects/RItemField;->getValue()Ljava/lang/String;
move-result-object v7
invoke-static {v7}, Lkotlin/text/StringsKt;->toLongOrNull(Ljava/lang/String;)Ljava/lang/Long;
move-result-object v12
if-nez v12, :cond_bc
```

`ReadAttachmentUploadsDbRequest.smali:336`. The app parses strings with `toLongOrNull` in nine
classes, so the change must be scoped to this class.

## Goals / Non-Goals

**Goals:**

- Make an attachment with an unusable `mtime` upload anyway, without touching anything else.
- Leave attachments whose value is already usable byte-for-byte unchanged.

**Non-Goals:**

- Fixing the writers of the field, the item sync that overwrites it, or the server's copy.
- Changing what `mtime` means, or repairing values that are already numbers.

## Decisions

- **D1 — Substitute at the reader's parse, scoped to that class.** The single call
  `String.toLongOrNull()` inside `ReadAttachmentUploadsDbRequest` is replaced with an extension
  helper of the same signature that never returns null: it parses the stored value when it can and
  otherwise returns `System.currentTimeMillis()`. The following `if-nez` therefore never takes the
  skip branch, and the attachment is queued with a usable value. Alternatives: repair every writer
  of the field (the empty value legitimately arrives from the server, so a writer fix cannot cover
  it) or hook the reader's field access (larger, no more correct).
- **D2 — Use an extension for the helper.** A JDK-only static method is the smallest way to express
  "parse, else substitute" without register or control-flow surgery; the helper takes and returns
  the same types as the call it replaces, so the surrounding bytecode is untouched. This
  re-introduces the extension module the first change removed.
- **D3 — On by default.** The behaviour it replaces is a silent, permanent failure to upload, so the
  patch belongs in the default set; the description states what it does.
- **D4 — The substitute is what the server records, and it is corrected at the source, not here.**
  An earlier version of this change claimed the client stores the file's own modification time after
  the upload (`StoreMtimeForAttachmentDbRequest`). That is wrong: the request is called only by
  `WebDavController`, never by the sync path, so the value the upload declares — this substitute —
  is what the attachment ends up carrying on the server and on every client. It is good enough to
  make the attachment uploadable and to stop the reader skipping it, but it is the upload time
  rather than the file's own mtime, which is a bounded inaccuracy this patch accepts rather than
  hides. Closing that would mean writing the file's mtime in the sync path as well.

## Risks / Trade-offs

- [A substituted "now" can make a file look newer than it is] → it is only used when the stored
  value is unusable, and is replaced by the file's real value after the upload; the alternative is
  never uploading the file at all.
- [Replacing the wrong `toLongOrNull` call] → the change matches on the instruction's method
  reference *inside the reader class only* and fails if it finds none.
- [The extension must be merged into the app] → declared with `extendWith`, as the template's own
  example does; verified in the patched artifact.

## Migration Plan

Not applicable: no data migration. Existing unusable values are handled at read time; nothing is
rewritten except the transient value the client stores after uploading.

## Open Questions

- Whether a future target stops shipping the extension point or renames the helper's call — re-check
  at target confirmation, and note the failure mode is a loud `PatchException`.
