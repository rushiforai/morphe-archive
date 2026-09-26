# Task Validation: upload-without-form-envelope

- Validated against: the pinned artifact's smali, the client source at the tested version, and the
  server's own handlers and tests
- Validation date: 2026-09-24
- Verdict: READY

## INVALID — requires revision

None.

## VALID — confirmed

### 1.3 — why the obvious target cannot work

- `Intrinsics.checkNotNull(Object)` returns `void`, and the constructor is called with the same
  register the check receives, so replacing the check cannot supply a value. The change therefore
  replaces the read that produces the null instead of the dereference that throws on it.
- Evidence: `analysis/zotero/smali/classes8/…/AuthorizeNewUploadResponse$Companion.smali` (the whole
  `fromJson`, including the `:goto_7b` label and the `invoke-direct …-><init>` that follows it).

### 2.2 — the interceptor can be installed without inserting an instruction

- `OkHttpClient.Builder.addInterceptor(Interceptor)` takes the builder and an interceptor and returns
  the builder, which is exactly the installer's shape, so the two-register `invoke-virtual` becomes a
  two-register `invoke-static` with the same argument order and return type. The chain's order is
  preserved by re-adding the interceptor that call was installing.
- The alternative would need a live register in a method where the chain occupies all of them, or a
  widened `.registers`, which renumbers the parameter registers.

### 1.5 / 2.3 — the right client, and only the right call

- The class adds two interceptors and only the second closes the chain; the selector requires a
  `build()` on the same register within a few instructions, which the first call's window does not
  contain, so it matches exactly one instruction.
- Evidence: `analysis/zotero/smali/classes7/…/NonZoteroApiModule.smali` lines 168–200.

### 2.4 — the extension may reference Gson and OkHttp

- They are declared `compileOnly`, so they are not shipped by the extension; the patched app already
  contains both, and only signatures stable across their versions are used.
- Evidence: `gradle/libs.versions.toml`, `extensions/extension/build.gradle.kts`, and the app's own
  `buildSrc/src/main/kotlin/Libs.kt` (OkHttp and Retrofit are declared there).

### 4.x — what will count as proof

- The upload's success is proven at the server boundary: a `201` from `/storage/upload/<key>` means
  `store_bytes` accepted the length and digest, which cannot happen if the bytes are still wrapped in
  a form, and the register step's `204` means the attachment record is attached. The client's own
  logging line is not used as proof, because the logging interceptor precedes the rewriter and still
  measures the envelope.

## Fixes needed

None.

## Verdict

`VERDICT: READY`