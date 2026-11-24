# Binary Assets, Hermes Bytecode & Resources Reference

This reference covers manipulating Hermes bytecode bundles (`index.android.bundle`), in-place ARM64/ARMv7 native shared library patching (`.so`), and Android XML/Manifest DOM manipulation.

---

## 1. Hermes Bytecode (HBC v96, v98+) Patching

React Native Android applications often compile JavaScript into Hermes Bytecode (HBC). The bundle is located at `assets/index.android.bundle`. In Morphe, asset manipulation is executed within a `rawResourcePatch` or the `rawResources { ... }` block of a `compositeFeaturePatch`.

### `HermesBundleEditor` Overview

The repository provides a shared utility: `app.aidan.patches.shared.HermesBundleEditor`.

```kotlin
import app.aidan.patches.shared.HermesBundleEditor
import app.morphe.patcher.patch.PatchException

rawResources {
    val bundleFile = get("assets/index.android.bundle")
    if (!bundleFile.exists()) {
        throw PatchException("assets/index.android.bundle not found")
    }

    // The constructor validates HBC magic and rejects unsupported versions
    // (supported: 96 and 98+). Do not duplicate that check with dead conditions.
    val editor = HermesBundleEditor(bundleFile.readBytes())

    // Apply mutations...

    // Critical: Recalculate the SHA-1 footer checksum before writing
    editor.updateFooterHash()
    bundleFile.writeBytes(editor.toByteArray())
}
```

### Core API Methods in `HermesBundleEditor`

| Method | Actual behavior |
|---|---|
| `version`, `functionCount`, `stringCount` | Parsed header fields. Construction throws `IllegalArgumentException` for invalid magic or unsupported version. |
| `getFunctionHeader(funcIndex)` | Returns `FunctionHeaderInfo(codeOffset, functionNameId, bytecodeSize, isOverflowed, largeHeaderOffset)`. v96 small headers report `bytecodeSize = 0`. |
| `findFunctionOffsetByName(name, predicate)` | Returns the **first** function whose name ID matches and whose predicate accepts the code offset. Can silently pick the wrong same-named function. |
| `findFunctionOffsetsByName(name)` | Returns **all** matching code offsets. Prefer this plus `singleOrNull()` when uniqueness is required. |
| `findStringId(target)` / `getString(id)` | Linear string-table lookup and decode (`ISO_8859_1` for single-byte entries, UTF-16LE for wide entries). |
| `matchesBytes(offset, expected)` | Uses the shared overflow-safe `ByteArray.hasRange`/`matchesAt` helpers. Negative, overflowing, or beyond-end offsets return `false` without allocating a copy. |
| `patchBytes(offset, bytes)` | Bounds-checked in-place `System.arraycopy`; throws `IllegalArgumentException` when the range is out of bounds. No size/idempotency policy. |
| `patchBytesIfMatches(offset, expected, replacement)` | Requires `expected.size == replacement.size`, a valid in-bounds range, and exact expected bytes, then writes. Throws `IllegalArgumentException` on size mismatch, out-of-range, or mismatch. Not idempotent: a second call with the original `expected` throws. |
| `redirectFunctionHeader(funcIndex, newCodeOffset, newBytecodeSize)` | **(HBC v98+ only)** Rewrites small or large header fields. Does not move code, validate the new code range against the bundle size, or update the footer hash. |
| `replaceStringUsingDonor(target, replacement, donor)` | Reuses an **unused single-byte** donor string slot that is not an overflow-table entry. Requires `replacement` to fit the donor byte length; writes the replacement, zero-fills the remaining donor bytes, and points both target and donor entries at it. `replacement` is encoded as `ISO_8859_1`; non-Latin-1 characters are not supported. |
| `updateFooterHash()` | Requires at least 20 bytes; recalculates SHA-1 over `data.size - 20` bytes and writes the final 20 bytes. |
| `toByteArray()` | Returns the mutated backing array. |

### Hard Invariants for Hermes Patching

1. **Never Shift or Expand Bundles**:
   - HBC offsets for functions, string tables, and identifiers are absolute. Never insert or delete bytes, which would invalidate all subsequent offsets.
   - Any in-place byte replacement must have `expected.size == replacement.size`.
2. **String Replacement & Donor Recycling**:
   - `replaceStringUsingDonor` is the supported mechanism. The donor must be an unused development/source-path string with single-byte encoding and enough capacity.
   - The replacement cannot exceed the donor's byte capacity; remaining donor bytes are zero-filled by the implementation.
3. **Always Update Footer Hash**:
   - Hermes runtimes verify the 20-byte SHA-1 hash at the end of `index.android.bundle`. Omitting `editor.updateFooterHash()` produces an invalid bundle. The method assumes the array has at least 20 bytes.
4. **Verify Opcode Bytes Per HBC Version**:
   - Hermes opcode numbers and operand layouts are **version-specific**. Never reuse a byte sequence from another HBC version. Re-disassemble the exact bundle and verify the expected prefix before patching.

### Example: Neutralizing a React Native Feature Flag Function

The following byte values are **HBC v98** values observed in this repository (see `docs/sezzle/patches.md` and `patches/src/main/kotlin/app/aidan/patches/sezzle/ads/HideBannerAdsPatch.kt`). They are illustrative, not a cross-version constant:

| Operation | Bytes (register r0) |
|---|---|
| `LoadConstFalse r0; Ret r0` | `0x96, 0x00, 0x76, 0x00` |
| `LoadConstTrue r0; Ret r0` | `0x95, 0x00, 0x76, 0x00` |
| `LoadConstNull r0; Ret r0` | `0x92, 0x00, 0x76, 0x00` |
| `LoadConstUndefined r0; Ret r0` | `0x93, 0x00, 0x76, 0x00` |
| `LoadConstZero r0; Ret r0` | `0x97, 0x00, 0x76, 0x00` |

```kotlin
val offsets = editor.findFunctionOffsetsByName("useIsPromotionsEnabled")
if (offsets.isEmpty()) {
    throw PatchException("Function useIsPromotionsEnabled not found in Hermes bundle")
}
if (offsets.size > 1) {
    throw PatchException(
        "Ambiguous function useIsPromotionsEnabled (${offsets.size} offsets); use a unique predicate"
    )
}
val fnOffset = offsets.single()

val returnTrue = byteArrayOf(0x95.toByte(), 0x00, 0x76, 0x00)
val returnFalse = byteArrayOf(0x96.toByte(), 0x00, 0x76, 0x00)

when {
    // Idempotency: the replacement is already present.
    editor.matchesBytes(fnOffset, returnFalse) -> Unit

    // Expected original state.
    editor.matchesBytes(fnOffset, returnTrue) ->
        editor.patchBytesIfMatches(fnOffset, returnTrue, returnFalse)

    // Out-of-range offsets also land here because matchesBytes returns false.
    else -> throw PatchException(
        "Unexpected function prefix at 0x${fnOffset.toString(16)} for useIsPromotionsEnabled"
    )
}
```

---

## 2. Native Shared Library Patching (ARM64 / ARMv7)

When app integrity checks, signature validation, or core protections are implemented in C/C++ native shared libraries (`lib/**/*.so`), use in-place binary patching inside a `rawResourcePatch`.

### Standard ARM64 Assembly Sequences

| Operation      | ARM64 Disassembly     | Kotlin Byte Sequence (`byteArrayOf(...)`)                                                |
| -------------- | --------------------- | ---------------------------------------------------------------------------------------- |
| `RETURN_VOID`  | `ret`                 | `byteArrayOf(0xc0.toByte(), 0x03, 0x5f, 0xd6.toByte())`                                  |
| `RETURN_TRUE`  | `mov w0, #1`<br>`ret` | `byteArrayOf(0x20, 0x00, 0x80.toByte(), 0x52, 0xc0.toByte(), 0x03, 0x5f, 0xd6.toByte())` |
| `RETURN_FALSE` | `mov w0, #0`<br>`ret` | `byteArrayOf(0x00, 0x00, 0x80.toByte(), 0x52, 0xc0.toByte(), 0x03, 0x5f, 0xd6.toByte())` |
| `NOP`          | `nop`                 | `byteArrayOf(0x1f, 0x20, 0x03, 0xd5.toByte())`                                           |

### Assembling & Disassembling ARM64 with Existing Tools

`apk-lab asm` **assembles** one statement at a time; it does not disassemble byte strings. It currently supports `b`, `bl`, `ret`, and `mov`/`movz` immediate forms. Use the NDK's `llvm-objdump` to disassemble the exact library and derive offsets.

```bash
# Assemble a supported instruction to Kotlin bytes
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- asm "mov w0, #1" --format kotlin
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- asm "ret" --format kotlin

# Resolve a branch relocation against a known PC/target
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- asm "bl 0x3c98ce4" --pc 0x1fcf6e8 --format kotlin

# Disassemble the exact .so (NDK path shown for macOS; adjust host tag)
"$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/darwin-x86_64/bin/llvm-objdump" \
  -d --no-show-raw-insn lib/arm64-v8a/libsecurity.so | less
```

For instructions outside `asm`'s supported set (for example `sub`, `str`, `nop`), assemble them with a trusted ARM64 assembler (the NDK LLVM/Clang toolchain or an equivalent), then verify the exact bytes with `llvm-objdump` against the target library. Do not hand-compute encodings without verification.

### Binary Patching Pattern: Bounds, Match & Idempotency

The offset below is **illustrative only**. A native offset is valid only for the exact library build, version, and ABI from which it was derived; never reuse it across releases.

```kotlin
private fun ByteArray.matchesAt(offset: Int, expected: ByteArray): Boolean =
    offset >= 0 && expected.size <= size - offset &&
        expected.indices.all { this[offset + it] == expected[it] }

val arm64So = get("lib/arm64-v8a/libsecurity.so")
if (!arm64So.exists()) {
    throw PatchException("Required lib/arm64-v8a/libsecurity.so is missing")
}

val bytes = arm64So.readBytes()
val offset = 0x48dd8 // ILLUSTRATIVE ONLY: re-derive for this exact .so

val expected = byteArrayOf(
    0xff.toByte(), 0x43, 0x02, 0xd1.toByte(), // sub sp, sp, #0x90
    0xf7.toByte(), 0x2b, 0x00, 0xf9.toByte()  // str x23, [sp, #0x50]
)
val replacement = byteArrayOf(
    0x20, 0x00, 0x80.toByte(), 0x52,          // mov w0, #1
    0xc0.toByte(), 0x03, 0x5f, 0xd6.toByte()  // ret
)

// In-place code patches must not change the region length.
if (expected.size != replacement.size) {
    throw PatchException("Replacement length ${replacement.size} != expected ${expected.size}")
}

// Overflow-safe bounds check; a write ending exactly at EOF is valid.
val end = offset.toLong() + expected.size
if (offset < 0 || end > bytes.size.toLong()) {
    throw PatchException(
        "Patch range 0x${offset.toString(16)}..0x${end.toString(16)} exceeds ${bytes.size} bytes"
    )
}

// Idempotency: accept the already-patched bytes before requiring the original.
if (!bytes.matchesAt(offset, replacement)) {
    if (!bytes.matchesAt(offset, expected)) {
        throw PatchException(
            "libsecurity.so byte sequence mismatch at offset 0x${offset.toString(16)}"
        )
    }
    System.arraycopy(replacement, 0, bytes, offset, replacement.size)
    arm64So.writeBytes(bytes)
}
```

If an ABI variant is legitimately optional, guard its absence with an explicit comment explaining why the feature still works. Do not silently skip a required library.

---

## 3. Android XML & Manifest DOM Manipulation

XML resources (such as `res/xml/*.xml`, `res/values/*.xml`, and `AndroidManifest.xml`) are modified inside a `resourcePatch` or the `resources { ... }` block of a `compositeFeaturePatch`.

### XML Namespaces

Android resource documents use standard XML namespaces:

- Android: `http://schemas.android.com/apk/res/android`
- App/Custom: `http://schemas.android.com/apk/res-auto`

### Accessing Documents

Use `document(path).use { doc -> ... }` to ensure safe parsing and streaming:

```kotlin
private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"

resources {
    document("AndroidManifest.xml").use { doc ->
        val manifest = doc.documentElement
        val application = manifest.getElementsByTagName("application").item(0) as? org.w3c.dom.Element
            ?: throw PatchException("Missing <application> tag in AndroidManifest.xml")

        // 1. Remove an unwanted receiver by exact class name; fail if the expected node is gone.
        val receivers = application.getElementsByTagName("receiver")
        var removed = false
        for (i in receivers.length - 1 downTo 0) {
            val receiver = receivers.item(i) as? org.w3c.dom.Element ?: continue
            val name = receiver.getAttributeNS(ANDROID_NS, "name")
            if (name == "com.example.analytics.CrashReportReceiver") {
                application.removeChild(receiver)
                removed = true
            }
        }
        if (!removed) {
            throw PatchException("Expected crash receiver not found in AndroidManifest.xml")
        }

        // 2. Example attribute edit; apply only when the feature requires it.
        application.setAttributeNS(ANDROID_NS, "android:allowBackup", "false")
    }
}
```

**Never ship a patch that sets `android:debuggable="true"`.** It weakens the target app's security and changes runtime behavior. If debugging a local build is necessary, do it in a throwaway artifact outside the patch bundle.

### Hard Invariants for Resource Patching

1. **Always Use `.use { ... }`**: Ensures XML output is flushed and underlying streams are closed.
2. **Explicit Namespace URI**: Never use unqualified attribute names (e.g. `setAttribute("android:name", ...)`); always use `setAttributeNS("http://schemas.android.com/apk/res/android", "android:name", ...)`.
3. **Fail-Fast on Missing Required Nodes**: If an XML document or an anchor node is expected, throw `PatchException` rather than silently doing nothing. If a node is genuinely version-optional, guard only that node and document why.
4. **No Insecure Defaults**: Do not enable `debuggable`, cleartext traffic, exported components, or permissive file access unless the feature explicitly requires it and the security tradeoff is documented.
