## Why

With the `mtime` and `md5` defects fixed, the upload finally reaches the file protocol and the server
authorizes it — `POST /users/1/items/Z5B8C2J9/file` answers `200` — and then the client throws the
completed authorization away:

```
E AuthorizeUploadSyncAction$result: java.lang.NullPointerException
E   at …AuthorizeUploadResponse$Companion.fromJson(AuthorizeUploadResponse.kt:20)
E   at …AuthorizeNewUploadResponse$Companion.fromJson(AuthorizeNewUploadResponse.kt:24)
E   at …AuthorizeUploadSyncAction$result$2.invokeSuspend(AuthorizeUploadSyncAction.kt:60)
```

The user is shown `Unknown error`, and the client authorizes the same attachment again on every sync
pass — 18 requests to the same endpoint in one window, none of them completing.

The client reads an upload form out of the authorization and treats it as non-null:

```kotlin
val params = data["params"].unmarshalLinkedHashMap<String, String>(gson)!!   // null when absent
```

altero has no S3 form to hand out and sends none — its own test pins the response to exactly
`{"url", "contentType", "prefix", "suffix", "uploadKey"}` — so the parse yields null and the `!!`
throws. The desktop client accepts the same response, which is why desktop uploads work.

Behind that failure sits a second one of the same origin. The client uploads with the S3 shape it is
written for — `@Multipart` with the form's fields plus a `file` part (`createFormData("file", …)`) —
while a server that takes the bytes itself reads the body as the file and holds it to the authorized
length and digest (`if len(body) != upload.filesize: raise`). The desktop client sends the file on its
own when there is no form; this one would send an envelope around it.

## What Changes

- A new patch, **Accept upload authorization that carries no upload form** (on by default), that hands
  the parser an empty form when the response has none, so a completed authorization is used instead
  of discarded.
- A new patch, **Send attachment uploads as the file itself** (on by default), that rewrites an
  upload body that carries nothing but the file into the file itself, so what the server receives is
  what the upload was authorized for. An upload that does carry a form — the S3 case the client was
  written for — is passed through untouched.
- The second patch is a **workaround for the server behaviour**, not a client fix: the client speaks
  the protocol the official server expects. The server side is reported upstream, and this patch can
  be dropped once that is addressed.

## Capabilities

### New Capabilities

- None.

### Modified Capabilities

- `attachment-upload-recovery`: extends "an attachment whose stored metadata cannot be used as-is is
  still uploaded" to the authorization and transfer steps — an authorization that hands out no upload
  form is completed, with the file sent as the file.

## Impact

- `patches/src/main/kotlin/app/anondev/patches/zotero/uploads/` — the two new patches.
- `extensions/extension/` — two more helper classes, and the module's first compile-only
  dependencies (Gson and OkHttp), both of which the patched app already ships.
- One instruction changes in `AuthorizeNewUploadResponse$Companion` (the `params` read) and one in
  `NonZoteroApiModule` (the call that closes its OkHttp chain). The client's other interceptor, its
  logging, and the second non-Zotero client are untouched.