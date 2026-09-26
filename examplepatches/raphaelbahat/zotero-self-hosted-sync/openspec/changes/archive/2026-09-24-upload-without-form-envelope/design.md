## Context

Measured on the device with the `mtime` and `md5` patches applied: the server authorizes the upload
(`<-- 200 https://altero.myhut.live/users/1/items/Z5B8C2J9/file`) and the client fails to read the
answer —

```
E AuthorizeUploadSyncAction$result: java.lang.NullPointerException
E   at …AuthorizeUploadResponse$Companion.fromJson(AuthorizeUploadResponse.kt:20)
E   at …AuthorizeNewUploadResponse$Companion.fromJson(AuthorizeNewUploadResponse.kt:24)
E AuthorizeUploadSyncAction: key=…
```

with 18 `POST` attempts to the same file endpoint in one window and the same failure for each.

Read in the pinned artifact, `AuthorizeNewUploadResponse$Companion.fromJson` is:

```smali
const-string v0, "params"
invoke-virtual {p1, v0}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;
move-result-object p1
if-eqz p1, :cond_7b                 # absent ⇢ v2 keeps its initial null
    …
    invoke-virtual {p2, p1, v0}, Lcom/google/gson/Gson;->fromJson(…)Ljava/lang/Object;
    move-result-object p2
    move-object v2, p2              # the parsed map
    goto :goto_7b
:goto_7b
invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V   # the `!!`
…
invoke-direct {p1, v1, v4, v2}, …AuthorizeNewUploadResponse;-><init>(…)V   # v2 is what the object gets
```

Two consequences that shape the change: the check is a `void` call, so replacing it cannot change what
the constructor receives — the value itself has to be non-null — and the value is only ever null
because the response carried no `params` at all.

The second failure was found by reading the rest of the path rather than by waiting for it. The client
sends `@POST @Multipart` with `MultipartBody.Part.createFormData("file", file.name, requestBody)` and
the (empty) form as `@PartMap`; the server's `receive_upload` does `body = await request.body()` and
`store_bytes` raises when `len(body) != upload.filesize`. The desktop client sends the file on its own
when there is no form; this one always wraps it. Verified in the same read of the client: the upload
uses the `NonZoteroApi` client built by `NonZoteroApiModule.provideOkHttpClient`, whose chain ends

```smali
invoke-virtual {p1, v0}, Lokhttp3/OkHttpClient$Builder;->addInterceptor(Lokhttp3/Interceptor;)Lokhttp3/OkHttpClient$Builder;
move-result-object p1
invoke-virtual {p1}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;
```

## Goals / Non-Goals

**Goals:**

- Complete an upload the server has authorized without an upload form, and send the bytes the upload
  was authorized for.
- Leave an authorization that does carry a form — and the S3 upload path it implies — exactly as it
  is.

**Non-Goals:**

- Fixing the server, which is what the upstream report is for.
- Changing how the client is *built* (annotations, call sites): the transfer patch works on the
  requests the client already makes.
- Touching the client's other non-Zotero client, its logging, or any other interceptor.

## Decisions

- **D1 — Supply the form, not the check.** `get("params")` is replaced by a helper returning the
  response's element, or an empty object when there is none; the client's own inlined parsing then
  produces an empty map. Replacing the `!!` instead was considered and rejected on the bytecode:
  `Intrinsics.checkNotNull` returns `void`, so a replacement cannot hand the constructor a value.
- **D2 — Install the interceptor by replacing the call that closes the chain.** `addInterceptor`
  takes a builder and an interceptor and returns the builder — the same shape as the installer — so
  the swap preserves the chain's order, needs no inserted instruction and no spare register. The
  alternative, inserting `new-instance`/`invoke-direct`/`addInterceptor` before `build()`, would have
  to prove a register free in a method whose registers are all live, or widen `.registers`, which
  moves the parameter registers of every method it touches.
- **D3 — Rewrite only the shape that means "nothing but the file".** The interceptor acts on a
  multipart body whose only part is the `file` part, so an upload carrying a form (more than one
  part) passes through unchanged. The file body is taken from the part, so the bytes and length are
  the ones the client already verified and the server already authorized; headers, including the
  precondition, are kept.
- **D4 — Call it a workaround.** The client speaks the protocol the official server expects; the
  deviation is on the server side. The change says so in its patch description, in this document and
  in the upstream report, so the patch is understood as removable rather than as the correct design.
- **D5 — On by default.** Both failures are silent, permanent failures to upload for an operator
  running a server that takes the bytes itself.

## Risks / Trade-offs

- [Rewriting an unrelated single-part multipart upload] → the rule also requires the sole part's
  disposition to name `file`, and the interceptor is only installed on the client this module builds
  for the non-Zotero API.
- [The extension now references Gson and OkHttp] → both are `compileOnly`; the patched app ships
  them, and only signatures that are stable across their versions are used.
- [The interceptor sits innermost, so the existing logging line still reports the envelope's size] →
  verification is by outcome — the server's `201`, then the register step — not by the log line's
  number.
- [A future target renames the client module or the parser] → both patches match on the class and
  instruction shape and fail loudly (`PatchException`) rather than patching the wrong place.

## Migration Plan

Reported upstream as https://github.com/eseifert/altero/issues/13 (filed 2026-09-24) — requesting
an empty `params` envelope in the authorization response and a `file` part accepted at
`POST /storage/upload/<key>`.

Once that is merged and the release being run carries it, the workaround comes out, in this order:

1. Verify with the transfer patch disabled (`-d "Send attachment uploads as the file itself"`) that a
   fresh attachment still uploads end-to-end: authorize `200`, the upload request issued, register
   `204`, and a following sync making no request to the attachment's file endpoint.
2. Delete the patch `AttachmentUploadEnvelopePatch.kt` and the class
   `AttachmentUploadInterceptor.java`. Nothing else refers to them: patches are discovered by
   scanning, so there is no registration to remove.
3. Drop `compileOnly(libs.okhttp)` from `extensions/extension/build.gradle.kts` and the `okhttp`
   entry from `gradle/libs.versions.toml`, unless something else has come to use them.
4. Keep the parser patch only if altero still omits `params`; if it does not, delete
   `AuthorizeUploadParamsPatch.kt` and `AuthorizeUploadParams.java` and drop
   `compileOnly(libs.gson)` if nothing else uses it.
5. Rebuild, re-patch, confirm the identity (`org.zotero.android`, `versionCode` 247), and archive
   this change.

## Open Questions

- Whether the upstream report leads altero to accept the client's multipart body or to send an empty
  form envelope; either would make the transfer patch redundant, and the parser patch harmless.