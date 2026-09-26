## 1. Evidence

- [x] 1.1 Capture the client's own trace and confirm the failure: `NullPointerException` at `AuthorizeUploadResponse$Companion.fromJson(AuthorizeUploadResponse.kt:20)` via `AuthorizeNewUploadResponse$Companion.fromJson(…:24)`, shown to the user as `Unknown error`, with 18 authorizations of the same attachment in one window and no upload.
- [x] 1.2 Read the server's authorization response at the version under test: it carries `{"url", "contentType", "prefix", "suffix", "uploadKey"}` and no `params` (pinned by altero's own test), because it has no S3 form to hand out.
- [x] 1.3 Locate the parse in the pinned artifact (`AuthorizeNewUploadResponse$Companion.smali`): the `"params"` read, the inlined `unmarshalLinkedHashMap` body, `move-object v2, p2`, and `Intrinsics.checkNotNull(v2)` — a `void` call on the same register the constructor receives.
- [x] 1.4 Confirm the client's upload body **and** the server's requirement: the client sends `@Multipart` with `createFormData("file", …)` plus the (empty) form, while `receive_upload` reads `request.body()` and `store_bytes` raises when the length differs from the authorized one.
- [x] 1.5 Identify the client the upload uses (`NonZoteroApiModule.provideOkHttpClient`, unqualified `NonZoteroApi`) and its closing instruction (`addInterceptor` on the same builder register that `build()` is then called on).

## 2. Patch and extension

- [x] 2.1 Add the helper that supplies the response's form, or an empty one when it has none, and the patch that replaces that one read; fail unless exactly one `"params"` read is found.
- [x] 2.2 Add the interceptor that rewrites a multipart body whose sole part is the file into the file itself, plus the installer the client's closing `addInterceptor` call is replaced with; fail unless exactly one such call is found.
- [x] 2.3 Confirm the replacement is scoped: the other `addInterceptor` in that module, the second non-Zotero client, and every other `JsonObject.get` are untouched.
- [x] 2.4 Declare the extension module's compile-only Gson and OkHttp dependencies, both provided by the patched app.

## 3. Build and artifact verification

- [x] 3.1 Build with `./gradlew buildAndroid`; the bundle lists seven patches, both new ones `Enabled: true`.
- [x] 3.2 Patch the pinned APK: all seven report `Applied`, and the artifact shows the `params` read invoking `AuthorizeUploadParams.orEmpty(JsonObject)JsonElement` (with `JsonObject->get` down 3→2) and the closing `addInterceptor` invoking `AttachmentUploadInterceptor.install(Builder, Interceptor)Builder` (with `Builder->addInterceptor` down 2→1). All four extension helper classes are in the merged DEX, and identity is unchanged (`org.zotero.android`, `versionCode` 247).
- [x] 3.3 Confirmed unchanged: the first `addInterceptor` in that module, the second non-Zotero client (`NonZoteroNoRedirectModule`, still only in its original dex), the parser's `url` and `uploadKey` reads, the md5 guard and the mtime helper.

## 4. Device verification (needs the device)

- [x] 4.1 Install and sync: the authorization is parsed (no `NullPointerException`, no `AuthorizeNewUploadResponse` line at all), the authorize POST answers `200`, the upload POST to `/storage/upload/<key>` is issued, and the register POST answers `204` — which altero only returns after re-reading the stored bytes and matching them against the authorized length and digest, so it cannot pass while the body is still an envelope. `md5 not provided`: 0. HTTP failures: 0.
- [x] 4.2 Confirmed: the attachment registers and a later sync, measured in its own window, makes **0** requests to `Z5B8C2J9/file`, logs `0` "file needs upload" and `0` upload-path errors, and shows only ordinary sync reads. The attachment is on the server and on desktop Zotero. (The stored `mtime` is the value the upload declared — see the note in `attachment-mtime-recovery`, whose "file's own value" wording is corrected there.)

## 5. Hygiene

- [x] 5.1 `openspec validate upload-without-form-envelope --strict` → "Change 'upload-without-form-envelope' is valid".
- [x] 5.2 Filed: https://github.com/eseifert/altero/issues/13 — "Zotero Android cannot upload: authorize response has no `params`, and the upload endpoint expects a raw body", covering both gaps with the exact client code, the observed failures and a suggestion for each. The change records the revert path in its Migration Plan, and the exit condition is tracked as a TickTick task.