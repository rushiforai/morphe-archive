package arpit.morphe.patches.cricfy.shared

import app.morphe.patcher.patch.rawResourcePatch
import arpit.morphe.patches.cricfy.shared.Constants.COMPATIBILITY_CRICFY_TV

/**
 * Name of the symbol that gates every protected operation of `libnative-lib.so`:
 * `AntiTamper::isTampered(JNIEnv*, jobject)`.
 */
private const val IS_TAMPERED_SYMBOL = "_ZN10AntiTamper10isTamperedEP7_JNIEnvP8_jobject"

/** `mov w0, #0 ; ret` — AArch64 `false`. */
private val STUB_AARCH64 = byteArrayOf(0x00, 0x00, 0x80.toByte(), 0x52, 0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte())

/** `mov r0, #0 ; bx lr` — ARM `false`. */
private val STUB_ARM = byteArrayOf(0x00, 0x00, 0xA0.toByte(), 0xE3.toByte(), 0x1E, 0xFF.toByte(), 0x2F, 0xE1.toByte())

/** `xor eax, eax ; ret` — x86/x86-64 `false`. */
private val STUB_X86 = byteArrayOf(0x31, 0xC0.toByte(), 0xC3.toByte())

/** ELF `e_machine` values of the ABIs the app ships. */
private const val EM_386 = 0x03
private const val EM_ARM = 0x28
private const val EM_X86_64 = 0x3E
private const val EM_AARCH64 = 0xB7

private const val PT_LOAD = 1
private const val SHT_DYNSYM = 11

/**
 * Resolved `isTampered` body: the file offset of the function and the stub that
 * makes it return `false` for the ABIs it was resolved for.
 */
private class IsTamperedLocation(
    val offset: Int,
    val stub: ByteArray,
)

/**
 * Disables the native anti-tamper check.
 *
 * Repackaging the app changes its signing certificate. On startup the app requests
 * its configuration from `https://cfydjjufvbh146.top/app_new.txt`, which is served as
 * an AES-encrypted blob and decrypted by `Baker.merge(String, Context)`. That native
 * method first calls `AntiTamper::isTampered(JNIEnv*, jobject)`, which ORs signature,
 * debugger, emulator, root and hook checks; on a re-signed build it returns true and
 * `Baker.merge` hands back the ciphertext unchanged. The JSON converter then fails
 * with `ConvertException` / `Unexpected JSON token` and the app shows its request
 * error dialog instead of the home screen. `PlaylistCipher.open` is gated the same way
 * and returns `null` on a tampered build.
 *
 * The decryption key does not depend on the signature (`AesDecrypt_decrypt` only
 * receives the ciphertext), so forcing the check to return false restores the normal
 * startup path. This is applied to every ABI in the APK because the Manager builds
 * for the device it is installed on, not necessarily the host.
 *
 * The function is located through the library's own `.dynsym`, so the patch follows
 * every app update without offset tables (7.3 and 7.4 both resolve): the symbol value
 * is mapped to a file offset with the `PT_LOAD` program headers, and the instruction
 * that returns `false` for that architecture is written over the entry. A library
 * without the symbol fails the patch instead of shipping a broken build.
 */
@Suppress("unused")
internal val antiTamperPatch = rawResourcePatch(
    name = "Bypass integrity check",
    description = "Disables the native tamper check that makes a re-signed build fail " +
        "to decrypt the server configuration on startup.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_CRICFY_TV)

    execute {
        val libraries = listApkEntries("lib/")
            .filter { it.endsWith("/libnative-lib.so") }
        check(libraries.isNotEmpty()) {
            "No libnative-lib.so entries found in the APK."
        }

        for (entry in libraries) {
            val file = get(entry)
            val bytes = file.readBytes()
            val location = locateIsTampered(bytes)
                ?: error("$entry does not export $IS_TAMPERED_SYMBOL; unsupported build.")
            check(location.offset + location.stub.size <= bytes.size) {
                "$entry is too small for the isTampered body at 0x${location.offset.toString(16)}."
            }

            location.stub.copyInto(bytes, location.offset)
            file.writeBytes(bytes)
        }
    }
}

/**
 * Resolves [IS_TAMPERED_SYMBOL] in an ELF32/ELF64 little-endian shared object and
 * returns the file offset of its body plus the ABI stub that returns `false`.
 */
private fun locateIsTampered(bytes: ByteArray): IsTamperedLocation? {
    check(bytes.size >= 0x40 && bytes[0] == 0x7F.toByte() && bytes[1] == 'E'.code.toByte() &&
        bytes[2] == 'L'.code.toByte() && bytes[3] == 'F'.code.toByte()) {
        "Not an ELF file."
    }
    val elfClass = bytes[4].toInt()
    check(bytes[5].toInt() == 1) { "Only little-endian ELF files are supported." }

    val is64 = when (elfClass) {
        1 -> false
        2 -> true
        else -> error("Unsupported ELF class $elfClass.")
    }

    val machine = bytes.u16(18)
    val stub = when {
        is64 && machine == EM_AARCH64 -> STUB_AARCH64
        !is64 && machine == EM_ARM -> STUB_ARM
        !is64 && machine == EM_386 -> STUB_X86
        is64 && machine == EM_X86_64 -> STUB_X86
        else -> error("Unsupported ELF machine 0x${machine.toString(16)}.")
    }

    val programHeaderOffset = if (is64) bytes.u64(0x20) else bytes.u32(0x1C).toLong()
    val sectionHeaderOffset = if (is64) bytes.u64(0x28) else bytes.u32(0x20).toLong()
    val programHeaderEntrySize = bytes.u16(if (is64) 0x36 else 0x2A)
    val programHeaderCount = bytes.u16(if (is64) 0x38 else 0x2C)
    val sectionHeaderEntrySize = bytes.u16(if (is64) 0x3A else 0x2E)
    val sectionHeaderCount = bytes.u16(if (is64) 0x3C else 0x30)

    /** Section header field offsets differ between ELF32 and ELF64. */
    fun sectionField(index: Int, offset32: Int, offset64: Int, size: Int): Long {
        val header = (sectionHeaderOffset + index.toLong() * sectionHeaderEntrySize).toInt()
        return if (size == 4) bytes.u32(header + if (is64) offset64 else offset32).toLong()
        else bytes.u64(header + if (is64) offset64 else offset32)
    }

    // Locate .dynsym and its string table.
    var dynsymIndex = -1
    for (index in 0 until sectionHeaderCount) {
        if (sectionField(index, 4, 4, 4) == SHT_DYNSYM.toLong()) {
            dynsymIndex = index
            break
        }
    }
    check(dynsymIndex >= 0) { "No .dynsym section in the library." }

    val dynsymOffset = sectionField(dynsymIndex, 16, 24, if (is64) 8 else 4).toInt()
    val dynsymSize = sectionField(dynsymIndex, 20, 32, if (is64) 8 else 4)
    val dynsymEntrySize = sectionField(dynsymIndex, 36, 56, if (is64) 8 else 4).toInt()
    val stringTableIndex = sectionField(dynsymIndex, 24, 40, 4).toInt()
    val stringTableOffset =
        sectionField(stringTableIndex, 16, 24, if (is64) 8 else 4).toInt()

    var symbolValue = -1L
    val symbolSize = if (is64) 24 else 16
    val entrySize = if (dynsymEntrySize > 0) dynsymEntrySize else symbolSize
    var entry = dynsymOffset
    while (entry + entrySize <= dynsymOffset + dynsymSize) {
        val nameOffset = bytes.u32(entry)
        val name = readNullTerminated(bytes, stringTableOffset + nameOffset)
        if (name == IS_TAMPERED_SYMBOL) {
            symbolValue = if (is64) bytes.u64(entry + 8) else bytes.u32(entry + 4).toLong()
            break
        }
        entry += entrySize
    }
    if (symbolValue < 0) return null

    // Map the virtual address to a file offset through the PT_LOAD segments.
    var fileOffset = -1
    for (index in 0 until programHeaderCount) {
        val header = (programHeaderOffset + index.toLong() * programHeaderEntrySize).toInt()
        if (bytes.u32(header) != PT_LOAD) continue
        val segmentOffset = (if (is64) bytes.u64(header + 8) else bytes.u32(header + 4).toLong())
        val segmentAddress = (if (is64) bytes.u64(header + 16) else bytes.u32(header + 8).toLong())
        val segmentFileSize = (if (is64) bytes.u64(header + 32) else bytes.u32(header + 16).toLong())
        if (symbolValue >= segmentAddress && symbolValue < segmentAddress + segmentFileSize) {
            fileOffset = (segmentOffset + (symbolValue - segmentAddress)).toInt()
            break
        }
    }
    check(fileOffset >= 0) { "$IS_TAMPERED_SYMBOL is not mapped by a PT_LOAD segment." }

    return IsTamperedLocation(fileOffset, stub)
}

private fun ByteArray.u8(offset: Int): Int = this[offset].toInt() and 0xFF

private fun ByteArray.u16(offset: Int): Int = u8(offset) or (u8(offset + 1) shl 8)

private fun ByteArray.u32(offset: Int): Int =
    u16(offset) or (u16(offset + 2) shl 16)

private fun ByteArray.u64(offset: Int): Long =
    u32(offset).toLong() and 0xFFFFFFFFL or (u32(offset + 4).toLong() shl 32)

private fun readNullTerminated(bytes: ByteArray, offset: Int): String {
    var end = offset
    while (end < bytes.size && bytes[end] != 0.toByte()) end++
    return String(bytes, offset, end - offset, Charsets.US_ASCII)
}
