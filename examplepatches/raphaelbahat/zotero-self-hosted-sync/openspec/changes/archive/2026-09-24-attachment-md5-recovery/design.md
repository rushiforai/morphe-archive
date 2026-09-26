## Context

Measured on the device with the diagnostic-logging patch applied: the upload now reaches the file
protocol (the `attachment-mtime-recovery` patch removed the earlier `mtime` skip), and the server
refuses it —

```
<-- 400 https://altero.myhut.live/users/1/items/Z5B8C2J9/file (104ms, 16-byte body)
AuthorizeUploadSyncAction: key=Z5B8C2J9;oldMd5=null;md5=;filesize=208429;mtime=1790273325176
authorizationFailed(statusCode=400, response=md5 not provided, hadIfMatchHeader=false)
```

The client's own log line is authoritative: the digest it sent was empty. `oldMd5=null` on the same
line shows that the empty `backendMd5` *was* normalised by the app's own `ifEmpty` — so the reader
already distinguishes empty from null for that field, and only the md5 repair is written narrowly.

Both the reader and the server were read at the exact versions under test:

- `ReadAttachmentUploadsDbRequest.process` repairs the digest inside
  `if (md5Field.value == "null")`, and otherwise passes `md5 = md5Field.value` into `AttachmentUpload`
  (the only construction site of that class in the app).
- `AuthorizeUploadSyncAction` puts that value into the form field `md5`
  (`ZoteroApi.authorizeUpload`, `@Field("md5") md5: String`), so an empty value is sent as `md5=`.
- `altero/services/storage.py:221` rejects it as `md5 not provided`, then requires
  `len(md5) == 32` hex.

Verified in the pinned artifact (`classes7/…/ReadAttachmentUploadsDbRequest.smali`):

```smali
.line 97
invoke-virtual {v13}, LRItemField;->getValue()Ljava/lang/String;
move-result-object v3
const-string v6, "null"
invoke-static {v3, v6}, Lkotlin/jvm/internal/Intrinsics;->areEqual(...)Z    # :505 — the guard
move-result v3
if-eqz v3, :cond_134
    invoke-virtual {v3, v4}, Lorg/zotero/android/files/FileStore;->md5(Ljava/io/File;)Ljava/lang/String;
    invoke-virtual {v13, v3}, LRItemField;->setValue(Ljava/lang/String;)V
:cond_134
    …
.line 102
invoke-static {v3, v6}, Lkotlin/jvm/internal/Intrinsics;->areEqual(...)Z    # :541 — backendMd5, correct
```

`grep` finds exactly one `const-string "null"` in the file: the compiler hoisted it and both
comparisons share it. The second comparison is `backendMd5 == "null"`, which is correct behaviour and
must not change — so the constant cannot be edited, and only the first comparison may be replaced.

## Goals / Non-Goals

**Goals:**

- Make an attachment whose stored digest is not one the server accepts upload anyway, and end up with
  the correct digest stored on the attachment.
- Leave an attachment whose digest is already usable byte-for-byte unchanged.
- Change exactly one instruction.

**Non-Goals:**

- Fixing the writers of the field, the item sync that leaves it empty, or the server's copy.
- Weakening the diagnosis of a genuinely mismatched digest: a valid stored digest is still sent as-is
  (the server answers `If-Match` mismatches on its own).
- Touching the `backendMd5` comparison, the other upload paths (the share/background uploader
  computes its digest at creation), or any other `Intrinsics.areEqual` call.

## Decisions

- **D1 — Generalise the guard rather than special-case the empty string.** The replacement asks the
  protocol's own question: is this value a 32-character hex digest, and is there a file to recompute
  it from? That covers the literal `"null"` the app already handled (4 characters, so not a digest),
  the empty value this change is about, and any other malformed value, without the patch carrying a
  magic string of its own. Alternatives: comparing against `""` as well (turns one magic value into
  two, and still sends any other malformed value to the wire); rewriting the empty value at every
  writer (the empty value legitimately arrives from the server's copy of the item, so no writer can
  cover it).
- **D2 — Let the app's own repair do the work.** The guard is all that changes; the reader keeps
  calling `FileStore.md5(file)` and `RItemField.setValue`, so the digest is stored on the attachment
  and the correction persists. Hashing in the extension instead would duplicate the app's own
  implementation and leave the stored value wrong.
- **D3 — Require the file to exist before asking for a repair.** The reader is a `mapNotNull` inside
  a Realm write, so an exception from hashing a missing file aborts the *whole* upload pass — the
  same one-bad-row failure mode that motivated the `mtime` change. An unusable digest with no local
  file therefore keeps today's behaviour (it cannot be uploaded either way) instead of becoming a
  new way to fail every other attachment.
- **D4 — Identify the guard by more than its method reference.** Both comparisons in this class
  target `Intrinsics.areEqual` with the same constant register, so the instruction to replace is
  found by requiring the preceding instruction to be the `"null"` constant **and** the branch after
  it to reach `FileStore.md5`. A count other than exactly one is a hard `PatchException`.
- **D5 — On by default.** The behaviour it replaces is a silent, permanent failure to upload, so the
  patch belongs in the default set; the description states what it does.

## Risks / Trade-offs

- [Recomputing a digest for a row whose file is genuinely absent] → the repair is skipped when the
  file is not there, which leaves behaviour exactly as it is today rather than risking the whole pass.
- [Masking a real mismatch by always recomputing] → a stored value that already *is* a hex digest is
  never recomputed, so a stale-but-valid digest still reaches the server and fails its `If-Match`
  check as it should.
- [Replacing the wrong comparison] → the target must be preceded by the `"null"` constant *and*
  followed by the `FileStore.md5` repair, and the patch fails unless it finds exactly one; the
  `backendMd5` comparison and the shared constant are left untouched.
- [The extension must be merged into the app] → declared with `extendWith`, as the sibling patch does;
  verified in the patched artifact.

## Migration Plan

Not applicable: no data migration. Existing unusable values are handled at read time, and the client
stores the recomputed digest itself.

## Open Questions

- Whether a future target renames `FileStore.md5`, moves the repair, or changes the guard's shape —
  re-check at target confirmation, and note the failure mode is a loud `PatchException`.
