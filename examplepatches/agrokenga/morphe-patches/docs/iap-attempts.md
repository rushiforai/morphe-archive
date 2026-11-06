# IAP Patch Attempts

This is a record of what was tried, what failed, and why. The goal is to prevent repeating the
same dead ends.

## Attempt 1: bytecode patch on `PlayFabDataService`

Early `IAPBypassPatch` used `bytecodePatch` and targeted:

```text
LVictor/PlayFabDataService;
  ExecuteAsync(LVictor/Request;Ljava/lang/Object;Ljava/util/Map;)
    -> Ljava/util/concurrent/CompletableFuture;
```

Problems:

- No such class exists in the DEX. The app is Unity IL2CPP; the C# code is compiled into
  `libil2cpp.so`, not DEX.
- `PlayFabDataService` is abstract and has no `ExecuteAsync`; it has `FetchOrUpdate`,
  `StartFetchOrUpdate`, `OnFetched`, `OnFailed`, and `Status`.
- The generic `ExecuteAsync(TRequest, object, Dictionary<string,string>)` belongs to
  `PlayFabApiCall<TRequest,TResult>`.
- `Victor.Request` and `getUrl` do not exist.
- The injected smali was invalid: `p0` is `this`, `move-result` followed a branch instead of
  an invoke, and the method returns an object, not an int.
- The patch was not registered and did not compile.

## Attempt 2: native probe

A `resourcePatch` was written to:

- list `lib/` entries;
- extract `lib/arm64-v8a/libil2cpp.so` and `lib/armeabi-v7a/libil2cpp.so`;
- parse the ELF program headers;
- map the target RVAs to file offsets;
- log size, SHA-256, architecture, segment data, executable flag, and first bytes;
- optionally append one byte to test write-back.

This worked. Morphe Manager rebuilt and signed a new APK containing the modified libraries.
The results are in [probe-results.md](probe-results.md).

The probe did **not** patch any instructions in its read-only mode. The write-back test only
appended a harmless byte to prove the pipeline.

## Attempt 3: Frida resource patch

A later `IAPBypassPatch` attempted to call:

```kotlin
Frida.hook("libil2cpp.so", "0x2CA3F3C", "...smali...")
```

Problems:

- There is no `Frida` class or Frida dependency in the project.
- Morphe patches run at build time; Frida is runtime instrumentation.
- A `resourcePatch` cannot start a Frida server or attach to the app.
- Passing smali instructions to a native address is not meaningful.
- The offset is a file/dump offset, not a runtime module address.
- The patch does not compile and is not a valid Morphe patch.

Bundling a Frida gadget would be a different architecture: ship the gadget, load it at startup,
and hook the process at runtime. That is not what this project does.

## Attempt 4: current “static patch” files

The working tree currently contains experimental rewrites:

- `IAPBypassPatch.kt` defines ELF helpers, then has a top-level `execute { ... }` with no
  enclosing `resourcePatch`.
- `IAPNativeProbePatch.kt` has no package/imports, calls `resourcePatch(...)` at top level,
  and uses `target { ... }` / `patchBytes(...)`, which are not Morphe APIs.
- `STATIC_PATCH_PLAN.md` assumes DEX wrappers and a `readBytes(apk, offset)` API; both are
  wrong for this app and this patcher.

Neither file compiles. The last compile-clean versions are in `d39d9aa`.

## Attempt 5: static instruction patch idea

A correct static patch would need to:

1. Validate the ELF and map the RVA.
2. Disassemble the target in the right mode (ARM64 or ARMv7 ARM/Thumb).
3. Choose a semantically valid patch for the method’s return type and side effects.
4. Write the bytes and rebuild the APK.
5. Test both ABIs and confirm the app does not crash.

That is technically possible, but it is not implemented here. Even a correct instruction patch
would only change client behavior; it would not make PlayFab or Google Play authorize a
purchase. See [kopp2-analysis.md](kopp2-analysis.md).

## Conclusion

- The native extract/edit/write-back pipeline works.
- The current IAP patch implementations do not work and do not compile.
- The purchase flow is server-authoritative.
- Keep `IAPBypassPatch` disabled or remove it.
- If the probe is needed, restore the `d39d9aa` version and build from there.
