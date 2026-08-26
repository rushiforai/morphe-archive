package app.template.patches.steamlink.util

import app.morphe.patcher.patch.PatchException

internal object BinaryPatchHelper {

    fun findUniqueAndReplace(bytes: ByteArray, search: ByteArray, replacement: ByteArray): ByteArray {
        require(search.size == replacement.size) { "search and replacement lengths must match" }
        var matchIndex = -1
        var matchCount = 0
        outer@ for (i in 0..bytes.size - search.size) {
            for (j in search.indices) {
                if (bytes[i + j] != search[j]) continue@outer
            }
            matchIndex = i
            matchCount++
        }
        when {
            matchCount == 0 -> throw PatchException("Pattern not found: ${search.hex()}")
            matchCount > 1 -> throw PatchException("Ambiguous pattern ($matchCount occurrences): ${search.hex()}")
        }
        return bytes.copyOf().apply { replacement.copyInto(this, matchIndex) }
    }

    // Converts an ELF64 virtual address to a file offset using PT_LOAD segment headers.
    fun vaddrToFileOffset(bytes: ByteArray, vaddr: Long, regionSize: Int = 4): Int {
        if (bytes.size < 64 || bytes.readU32LE(0) != 0x464C457F.toInt()) {
            throw PatchException("Not a valid ELF file")
        }
        val phoff = bytes.readU64LE(32).toInt()
        val phentsize = bytes.readU16LE(54).toInt()
        val phnum = bytes.readU16LE(56).toInt()
        for (i in 0 until phnum) {
            val base = phoff + i * phentsize
            if (bytes.readU32LE(base) != 1) continue  // PT_LOAD = 1
            val segOffset = bytes.readU64LE(base + 8).toInt()
            val segVaddr = bytes.readU64LE(base + 16)
            val segFilesz = bytes.readU64LE(base + 32).toInt()
            val relative = vaddr - segVaddr
            if (relative >= 0 && relative + regionSize <= segFilesz) {
                return segOffset + relative.toInt()
            }
        }
        throw PatchException("vaddr 0x${vaddr.toString(16)} not in any PT_LOAD segment")
    }

    private fun ByteArray.readU32LE(off: Int): Int =
        (this[off].toInt() and 0xFF) or
        ((this[off + 1].toInt() and 0xFF) shl 8) or
        ((this[off + 2].toInt() and 0xFF) shl 16) or
        ((this[off + 3].toInt() and 0xFF) shl 24)

    private fun ByteArray.readU64LE(off: Int): Long {
        var v = 0L
        for (i in 7 downTo 0) v = (v shl 8) or (this[off + i].toLong() and 0xFF)
        return v
    }

    private fun ByteArray.readU16LE(off: Int): Int =
        (this[off].toInt() and 0xFF) or ((this[off + 1].toInt() and 0xFF) shl 8)

    private fun ByteArray.hex() = joinToString("") { "%02x".format(it) }
}
