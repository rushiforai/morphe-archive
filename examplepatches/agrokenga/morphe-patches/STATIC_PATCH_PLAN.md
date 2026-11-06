# Static Patch Plan for libil2cpp.so

## Goal
Replace `PlayFabApiCall.ExecuteAsync` behavior at build time by patching the native method body in `libil2cpp.so` (DEX or IL2CPP runtime code), eliminating Frida/dumpOffset dependencies.

## Problem with Current Approach
- Uses Frida runtime hooking → requires dynamic instrumentation
- Uses dumpOffset (file offset) → not a stable runtime address
- Hook script is Frida JavaScript → cannot be statically embedded

## Static Patch Strategy

### 1. Identify the Target Method
The current patch targets:
```
PlayFabApiCall<object,object>.ExecuteAsync
arm64-v8a: rva=0x2CA7F3C, dumpOffset=0x2CA3F3C
```

For static patching, we need the **actual method body bytes** in the DEX/IL2CPP blob.

### 2. Patch Options

#### A. DEX Bytecode Patching (Recommended)
If the app is .NET IL2CPP but uses DEX wrappers:
- Locate the `PlayFabApiCall.ExecuteAsync` method in the DEX
- Replace the entire method body with:
  ```
  // Static stub: immediately return null to abort the API call
  return null;
  ```
- Or better: replace with a short-circuit that returns early before network I/O

**Tooling:**
- `dex2jar` → extract DEX to Java bytecode
- Find method by signature: `PlayFabApiCall.executeAsync(LVictor/Request;)`
- Use `baksmali` to disassemble, patch, and reassemble

#### B. Native IL2CPP Blob Patching
If it's pure IL2CPP (no DEX wrappers):
- Locate the method in the IL2CPP runtime blob (not libil2cpp.so itself, but the app's native code)
- This is harder: need to map RVA → actual bytes
- Use `objdump -d` on the APK's native code section

### 3. Patch Implementation (Example for DEX)

**Original method signature:**
```java
public static <T1, T2> PlayFabApiCall<T1, T2>.ExecuteAsync(Request request)
```

**Static replacement:**
```java
// Patched: abort all PlayFab calls at source
public static <T1, T2> PlayFabApiCall<T1, T2>.ExecuteAsync(Request request) {
    return null; // Short-circuit: no network, no response
}
```

**Apply via Morphe (pseudo-code):**
```kotlin
resourcePatch {
    execute {
        // 1. Read the DEX method bytes at the known offset
        val methodBytes = readBytes(apk, dexOffset + methodRva)
        
        // 2. Replace with stub bytecode:
        //    return null (simplified ARM64 DEX)
        val stub = byteArrayOf(
            0x00, 0x00, 0x00, 0x00, // nop
            0x00, 0x00, 0x00, 0x00, // nop
            0x00, 0x00, 0x00, 0x00  // nop
        )
        
        // 3. Write back
        writeBytes(apk, dexOffset + methodRva, stub)
    }
}
```

### 4. Trade-offs vs Frida

| Aspect | Frida (Current) | Static Patch |
|--------|-----------------|--------------|
| Runtime overhead | Moderate (hook agent) | None |
| Detectability | Obfuscated, harder | Bytecode-level, detectable |
| Signature verification | Bypassed at runtime | Must also patch verification |
| Toggle support | Yes (booleanOption) | No (always active) |
| Build complexity | Low (Morphe supports it) | Medium (manual byte manipulation) |
| Portability | Works across builds | Fragile across IL2CPP rebuilds |

### 5. Recommended Approach

1. **Use DEX bytecode patching** if the app exposes PlayFab calls through DEX wrappers.
2. Replace `ExecuteAsync` body with immediate `return null;`.
3. Optionally patch `PlayFabDataService.ExecuteAsync` as well for completeness.
4. Keep the `booleanOption` but have it control whether the patch is applied at build time (or always apply and document it as "bypass by default").

### 6. Next Steps
- Confirm whether the app uses DEX wrappers or pure IL2CPP
- Extract and analyze the exact method bytes
- Create a test patch on a sample APK
- Verify short-circuit behavior (no network calls made)
