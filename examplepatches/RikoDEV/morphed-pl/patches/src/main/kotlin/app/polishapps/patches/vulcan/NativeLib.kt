package app.polishapps.patches.vulcan

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import java.io.File
import java.nio.ByteBuffer
import java.nio.ByteOrder

/**
 * Helpers for patches that edit Dart AOT code in `lib/<abi>/libapp.so`.
 */

/** `stp fp, lr, [sp, #-0x10]!; mov fp, sp`, the prologue most Dart functions start with. */
internal val ENTER_FRAME = byteArrayOf(
    0xfd.toByte(), 0x79, 0xbf.toByte(), 0xa9.toByte(),
    0xfd.toByte(), 0x03, 0x0f, 0xaa.toByte(),
)

/** `add x0, x22, #0x20; ret`, the tagged Dart `true`. */
internal val DART_TRUE = byteArrayOf(
    0xc0.toByte(), 0x82.toByte(), 0x00, 0x91.toByte(),
    0xc0.toByte(), 0x03, 0x5f, 0xd6.toByte(),
)

/** `add x0, x22, #0x30; ret`, the tagged Dart `false`. */
internal val DART_FALSE = byteArrayOf(
    0xc0.toByte(), 0xc2.toByte(), 0x00, 0x91.toByte(),
    0xc0.toByte(), 0x03, 0x5f, 0xd6.toByte(),
)

internal fun ResourcePatchContext.nativeLibrary(path: String): File {
    val file = get(path)
    if (!file.exists()) throw PatchException("$path not found in the patched APK")
    return file
}

/** Encodes `bl <target>` as a 32-bit AArch64 instruction at [pc]. */
internal fun blInstruction(pc: Long, target: Long): ByteArray {
    val offset = (target - pc) shr 2
    if (offset < -(1L shl 25) || offset >= (1L shl 25)) {
        throw PatchException("bl 0x${target.toString(16)} is out of range from 0x${pc.toString(16)}")
    }
    val instruction = 0x94000000L or (offset and 0x03ffffffL)
    return ByteBuffer.allocate(4).order(ByteOrder.LITTLE_ENDIAN).putInt(instruction.toInt()).array()
}

/**
 * Maps a virtual address in the `.text` section to its file offset, so a patch does not depend on
 * the section being mapped one-to-one.
 */
internal fun ByteArray.textFileOffset(address: Long): Long {
    fun fail(reason: String): Nothing = throw PatchException("libapp.so: $reason")

    if (size < 0x40 || this[0] != 0x7f.toByte() || this[1] != 'E'.code.toByte() ||
        this[2] != 'L'.code.toByte() || this[3] != 'F'.code.toByte()
    ) fail("not an ELF file")
    if (this[4] != 2.toByte() || this[5] != 1.toByte()) fail("not a little-endian ELF64 file")

    val buffer = ByteBuffer.wrap(this).order(ByteOrder.LITTLE_ENDIAN)
    val sectionHeaders = buffer.getLong(0x28)
    val sectionEntrySize = buffer.getShort(0x3a).toInt() and 0xffff
    val sectionCount = buffer.getShort(0x3c).toInt() and 0xffff
    val sectionNamesIndex = buffer.getShort(0x3e).toInt() and 0xffff
    if (sectionHeaders <= 0 || sectionEntrySize < 64 || sectionCount == 0 ||
        sectionNamesIndex >= sectionCount
    ) fail("invalid section table")

    fun sectionOffset(index: Int) = sectionHeaders + index.toLong() * sectionEntrySize
    fun stringAt(offset: Long): String {
        var end = offset
        while (end < size && this[end.toInt()] != 0.toByte()) end++
        return String(this, offset.toInt(), (end - offset).toInt(), Charsets.ISO_8859_1)
    }

    val stringTable = buffer.getLong(sectionOffset(sectionNamesIndex).toInt() + 24)
    for (index in 0 until sectionCount) {
        val header = sectionOffset(index).toInt()
        val nameOffset = buffer.getInt(header).toLong() and 0xffffffffL
        if (stringAt(stringTable + nameOffset) != ".text") continue
        val addressStart = buffer.getLong(header + 16)
        val fileStart = buffer.getLong(header + 24)
        val sectionSize = buffer.getLong(header + 32)
        if (address !in addressStart until (addressStart + sectionSize)) {
            fail("0x${address.toString(16)} is outside .text")
        }
        return fileStart + (address - addressStart)
    }
    fail(".text section not found")
}

internal fun ByteArray.expectBytes(offset: Int, expected: ByteArray, label: String) {
    if (offset < 0 || offset + expected.size > size) {
        throw PatchException("libapp.so: $label is outside the file")
    }
    for (index in expected.indices) {
        if (this[offset + index] != expected[index]) {
            throw PatchException(
                "libapp.so: unexpected bytes for $label at 0x${(offset + index).toString(16)} " +
                    "(expected 0x${expected[index].toUByte().toString(16)}, " +
                    "found 0x${this[offset + index].toUByte().toString(16)})",
            )
        }
    }
}

/** Dart AOT snapshots keep the build ID as an ISO-8859-1 string in the executable. */
internal fun ByteArray.containsSnapshotBuildId(buildId: String): Boolean =
    String(this, Charsets.ISO_8859_1).contains(buildId)
