## 1. Evidence

- [x] 1.1 Capture the client's own trace and confirm the failing request: `400` from `POST /users/1/items/Z5B8C2J9/file` with a 16-byte body, `authorizationFailed(statusCode=400, response=md5 not provided)`, and the client's own parameter line `key=Z5B8C2J9;oldMd5=null;md5=;filesize=208429;mtime=1790273325176` showing the digest it sent was empty.
- [x] 1.2 Read the server's rule at the version under test (`altero/services/storage.py:221`): an empty field is reported as `md5 not provided` (`not form.get(name)` is true for `""`), and a present value must be a 32-character hex digest. The server is correct; the client sends an empty field.
- [x] 1.3 Locate the guard in the pinned artifact: `classes7/…/ReadAttachmentUploadsDbRequest.smali:505` — `invoke-static {v3, v6}, Lkotlin/jvm/internal/Intrinsics;->areEqual(...)Z` with `const-string v6, "null"` on the line above, followed by `if-eqz v3, :cond_134` and the reader's own repair (`FileStore.md5` → `RItemField.setValue`).
- [x] 1.4 Confirm the constant is **shared**: `grep` finds one `const-string "null"` in the class, reused by the `backendMd5 == "null"` comparison at `:541`, which is correct and must not change. Only the first comparison may be replaced.
- [x] 1.5 Confirm the site is the only one that can matter: `AttachmentUpload` (the object carrying `md5` into `AuthorizeUploadSyncAction`) is constructed in this reader and nowhere else; the share/background uploader computes its digest at creation time.

## 2. Patch and extension

- [x] 2.1 Add the extension helper: a JDK-only `AttachmentMd5.unusable(String, File)` that answers the protocol's question (is this a 32-character hex digest, and is there a file to recompute it from).
- [x] 2.2 Add the patch: replace that one comparison inside `ReadAttachmentUploadsDbRequest` with the helper (taking the value register and the file register the existing repair uses), fail unless exactly one such comparison is found, and declare `extendWith` for the extension.
- [x] 2.3 Confirm the replacement is scoped: the shared `"null"` constant and the `backendMd5` comparison are left in place, and no other class is visited.

## 3. Build and artifact verification

- [x] 3.1 Build with `./gradlew buildAndroid`; the bundle lists the new patch as `Enabled: true`.
- [x] 3.2 Patch the pinned APK: the patch reports `Applied`, and the artifact shows the guard invoking `AttachmentMd5.unusable(Ljava/lang/String;Ljava/io/File;)Z` in place of `Intrinsics.areEqual`, with `move-result v3` and `if-eqz v3, :cond_134` intact and the app's own repair (`FileStore.md5` → `RItemField.setValue`) left to do the work. The helper class is in the merged DEX and identity is unchanged (`org.zotero.android`, `versionCode` 247).
- [x] 3.3 Confirmed unchanged: `areEqual` count in the reader fell 2→1 (the `backendMd5` comparison is untouched), the shared `const-string "null"` is still present once, `FileStore->md5` is still there once, and the sibling mtime patch is intact (`toLongOrNull` 0, `AttachmentMtime->mtimeOrNow` 1).

## 4. Device verification (needs the device)

- [x] 4.1 Install and sync: the client logs a real digest (`md5=091bf1dcd34ec968623b6af08709b45a`, was empty), the authorize request answers **200** (was `400 md5 not provided`), the upload request is issued to `/storage/upload/<key>`, and the register step answers `204` — which the server only returns after re-reading the stored bytes and matching them against the authorized length and digest. `md5 not provided`: 0 occurrences.
- [x] 4.2 Confirmed: the attachment registers on the server and is present on desktop Zotero. A later sync, measured in its own window, makes **0** requests to `Z5B8C2J9/file`, logs no `file needs upload`, and no upload-path error — so no empty digest is resent and the failure does not recur.

## 5. Hygiene

- [x] 5.1 `openspec validate attachment-md5-recovery --strict` → "Change 'attachment-md5-recovery' is valid".
