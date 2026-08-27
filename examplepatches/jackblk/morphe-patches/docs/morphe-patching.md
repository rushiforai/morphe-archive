# Morphe patching — what we learned

Context for how Morphe patches work, so a future session does not re-derive it.
Operating commands live in `AGENTS.md`; this file is the mental model.

## The model

A patch does not edit source code. It rewrites the app's compiled Dalvik bytecode
(smali) at patch time. Two pieces:

1. **Fingerprint** — a search query that locates one method inside the obfuscated
   APK. Obfuscated names change between versions, so a fingerprint matches on stable
   traits: defining class, method name, return type, parameters, and instruction
   filters. Declaring fingerprints as `object ... : Fingerprint(...)` is optional but
   recommended — the object name shows up in the stack trace if the match fails.
2. **Patch body** (`bytecodePatch { execute { ... } }`) — once the fingerprint
   resolves to a method, rewrite its bytecode.

Build produces a `.mpp` bundle (`./gradlew buildAndroid`); the Morphe Desktop CLI
applies that bundle to an APK.

## Fingerprint fields (from the template's `example/Fingerprints.kt`)

- `definingClass` — matched by implicit comparison. Can be a package fragment
  (`":com/some/app/ads/"`), a class suffix (`"/AdsLoader;"`), or a full descriptor
  (`"Lcom/some/app/ads/AdsLoader;"`). Obfuscated params use just the object type `"L"`.
- `name` — exact method name.
- `accessFlags` — e.g. `listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)`.
- `returnType` — partial matches allowed (`"Z"`, `"Lio/reactivex/Single;"`).
- `parameters` — list of type descriptors; partial matches allowed.
- `filters` — instruction filters (`string(...)`, `methodCall(...)`, `fieldAccess(...)`,
  `opcode(...)`, `literal(...)`) to disambiguate when name/signature are not enough.
  These are the most robust anchors when a method is obfuscated.

A fingerprint resolves to `.method` (the matched method). `instructionMatches[i].index`
gives the bytecode index where filter `i` matched — used to inject at a precise spot.

## Common premium-unlock patterns

The whole game is finding the methods that answer "is the user premium / is this
content locked?" and forcing the answer. From the Calm reference
(`tmp/example-patches/calm-premium/`):

**Force a boolean method** (the workhorse):
```kotlin
SomeIsSubscribedFingerprint.method.apply {
    removeInstructions(0, instructions.count())
    addInstructions(0, "const/4 v0, 0x1\nreturn v0")   // true; use 0x0 for false
}
```

**Force a wrapped/boxed return** (e.g. RxJava `Single<Boolean>`):
```kotlin
addInstructions(0, """
    const/4 v0, 0x0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    move-result-object v0
    invoke-static {v0}, Lio/reactivex/Single;->just(Ljava/lang/Object;)Lio/reactivex/Single;
    move-result-object v0
    return-object v0
""".trimIndent())
```

**Surgical injection** (e.g. skip an upsell ViewHolder for subscribers): use
`addInstructionsWithLabels(index, ...)` at `instructionMatches[0].index`, and manage
registers carefully to avoid clobbering live values / causing a `VerifyError`. This is
the hard case — prefer forcing a boolean check upstream if one exists.

Key lesson from Calm: premium is usually gated in **layers** (subscription-valid check,
user-repository check, per-content lock flags, upsell banners). Forcing one may not be
enough; find every gate and patch each. Calm needed 9.

## Gotchas

- Cannot `return null` where the caller dereferences it (e.g. RecyclerView view holders)
  — it will NPE/VerifyError. Return a valid object instead.
- Boxed types (`Boolean`) vs primitives (`Z`) need the right return opcode
  (`return` vs `return-object`).
- Rewriting instructions shifts offsets; injecting into a method that reuses a
  parameter register can break the verifier's type tracking. Patch a cleaner method
  when possible.

## Reference

- Template example: `patches/src/main/kotlin/app/.../example/`
- Working premium reference: `tmp/example-patches/calm-premium/`
- Docs: https://github.com/MorpheApp/morphe-patcher/blob/main/docs
  (see `2_2_1_fingerprinting.md`).
