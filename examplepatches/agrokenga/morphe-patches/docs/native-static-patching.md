# Static Native Patching Notes

This is the generic process for changing a method body in an ELF shared library at APK-build
time. It is not a turnkey IAP bypass and is not mapped onto KoPP2's purchase methods.

## What “static” means

A Morphe `resourcePatch` runs while the APK is being rebuilt. It can read and write the
`.so` file, but it cannot execute the app, attach a debugger, or return a live network
response. The result is a modified library inside the rebuilt, re-signed APK.

## 1. Get the library

```kotlin
val lib = get("lib/arm64-v8a/libil2cpp.so")
val bytes = lib.readBytes()
```

Use `listApkEntries("lib/")` first if the archive layout is uncertain. A pure
`bytecodePatch` cannot write this file back; use `resourcePatch` or `rawResourcePatch`.

## 2. Find the method

Possible sources:

- Il2CppDumper `dump.cs` (`// RVA: ... Offset: ...`)
- `nm` / `readelf -s` if symbols are present
- Ghidra/radare2 function list
- Call-site analysis if the function is stripped

For IL2CPP, the dump’s RVA is relative to the image base. The dump’s “Offset” may already be a
file offset; verify by disassembling the bytes. Do not assume both numbers are the same.

## 3. Map RVA to file offset

Iterate the program headers and find the `PT_LOAD` segment containing the RVA:

```text
if rva >= p_vaddr and rva < p_vaddr + p_filesz:
    file_offset = p_offset + (rva - p_vaddr)
```

Use `p_filesz`, not `p_memsz`.

### ELF64 program header

| Field | Offset |
|---|---:|
| `p_type` | 0 |
| `p_flags` | 4 |
| `p_offset` | 8 |
| `p_vaddr` | 16 |
| `p_filesz` | 32 |
| `p_memsz` | 40 |
| `p_align` | 48 |

### ELF32 program header

| Field | Offset |
|---|---:|
| `p_type` | 0 |
| `p_offset` | 4 |
| `p_vaddr` | 8 |
| `p_filesz` | 16 |
| `p_memsz` | 20 |
| `p_flags` | 24 |
| `p_align` | 28 |

A common bug is reading ELF32 `p_flags` at offset 4. That is `p_offset`; use offset 24.

## 4. Disassemble

```bash
llvm-objdump -d --start-address=0x... --stop-address=0x... libil2cpp.so
```

- ARM64 instructions are fixed 4 bytes.
- ARMv7 may be ARM or Thumb-2. Check the low bit of function pointers and the disassembly.
  A 4-byte ARM patch is wrong for Thumb code.
- Watch for literal pools, PC-relative loads, and veneers.

## 5. Choose a patch strategy

### Return a constant

For a method returning `bool`:

ARM64:

```asm
mov w0, #1
ret
```

```text
20 00 80 52   c0 03 5f d6
```

ARMv7 ARM mode:

```asm
mov r0, #1
bx lr
```

```text
01 00 a0 e3   1e ff 2f e1
```

ARMv7 Thumb mode:

```asm
movs r0, #1
bx lr
```

```text
01 20   70 47
```

For `void`, only the return instruction is needed. For 64-bit values on ARM64, use `x0`.

### Disable a branch

Replace a conditional branch with a NOP:

| Architecture | NOP bytes |
|---|---|
| ARM64 | `1F 20 03 D5` |
| ARMv7 ARM | `00 F0 20 E3` |
| ARMv7 Thumb | `00 BF` |

### Branch to a code cave

If the stub is larger than the prologue you can overwrite:

1. Find executable padding in a `PT_LOAD` segment.
2. Write the stub plus the original prologue there.
3. Overwrite the function prologue with a branch to the cave.
4. Branch back to the instruction after the overwritten prologue.

Branch ranges:

- ARM64 `B` / `BL`: about ±128 MiB.
- ARMv7 ARM `B`: about ±32 MiB.
- Thumb: smaller 16-bit and 32-bit forms.

The cave must be executable and must not overlap data, literal pools, or exception tables.

### Patch a call site

If a method is inlined or has many generic instantiations, patching one body may not affect all
callers. In that case, patch the call instruction’s target, or patch the inline body at each
call site.

## 6. Write the patch

```kotlin
val lib = get("lib/arm64-v8a/libil2cpp.so")
val bytes = lib.readBytes()
val offset = 0x2CA3F3C // example only; verify from your own dump

// Replace 4 bytes with a branch or a return stub.
bytes[offset.toInt() + 0] = 0x20
bytes[offset.toInt() + 1] = 0x00
bytes[offset.toInt() + 2] = 0x80
bytes[offset.toInt() + 3] = 0x52

lib.writeBytes(bytes)
```

The patcher detects the changed content, includes the library in the rebuilt APK, and aligns
`.so` entries to 16 KiB.

## 7. Preserve ABI and runtime assumptions

- Return register: `w0`/`x0` on ARM64, `r0` on ARMv7.
- `this` is the first argument; do not clobber it unless the method does not need it.
- Preserve callee-saved registers and stack alignment.
- `out`/`ref` parameters may need to be written.
- Async methods returning `Task`/`UniTask` need a valid completed task, not a bare `true`.
- Generic methods may share one body or have multiple instantiations.
- Inlined methods may have no standalone call to patch.
- If the library uses BTI/PAC, check the ELF properties. Direct branches to a cave generally
  need the correct BTI landing pad if the target is reached indirectly.
- A method may be protected by anti-tamper or integrity checks.

## 8. Verify

1. Repack and sign.
2. Extract the rebuilt APK.
3. Confirm the `.so` is still uncompressed and 16 KiB aligned.
4. Disassemble the patched offset and compare bytes.
5. Install and check `logcat` for crashes or verifier errors.
6. Test both ARM64 and ARMv7 if the APK ships both.

## Limits

Static patching changes client code. It does not change server-side authorization, receipt
validation, signed entitlements, or Play Integrity decisions. A client patch can fake a UI or
a local callback, but it cannot make a remote server accept a purchase it did not authorize.

## Demo patch in this repository

`patches/src/main/kotlin/io/agrokenga/patches/native/NativeMethodPatchDemo.kt` implements the
smallest end-to-end example. It targets `CheatsScreen.ShowCheatAlert(string, string)`, a private
static `void` method that only displays an in-game alert, and replaces its prologue with an
immediate return:

- ARM64: `c0 03 5f d6` (`ret`)
- ARMv7: `1e ff 2f e1` (`bx lr`, ARM mode; this build does not compile the method as Thumb)

It is a `resourcePatch`, disabled by default, with option `nativeMethodPatchDemoEnable`. When
enabled it maps each ABI's RVA through the ELF program headers, verifies that the target lies in
an executable `PT_LOAD` segment, logs the original and patched bytes, writes the file back, and
re-reads it to confirm the change. It does not touch billing, purchases, entitlements, or
networking.
