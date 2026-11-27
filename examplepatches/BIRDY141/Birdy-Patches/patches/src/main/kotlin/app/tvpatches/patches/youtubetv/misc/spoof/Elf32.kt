package app.tvpatches.patches.youtubetv.misc.spoof

import java.nio.ByteBuffer
import java.nio.ByteOrder

/**
 * Just enough of a 32-bit little-endian ELF editor to rename a DT_NEEDED entry and an imported
 * symbol in place. New names must have the same length as the old ones, so no offsets move.
 */
internal class Elf32(val bytes: ByteArray) {
    private val buf = ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN)

    private class Section(val name: String, val offset: Int, val size: Int, val entSize: Int)

    private val sections: Map<String, Section>

    init {
        require(bytes.size > 0x34 && bytes[0] == 0x7f.toByte() && bytes[1] == 'E'.code.toByte() &&
            bytes[4] == 1.toByte() && bytes[5] == 1.toByte()) { "Not a 32-bit little-endian ELF file" }
        val shOff = buf.getInt(0x20)
        val shEntSize = buf.getShort(0x2E).toInt() and 0xffff
        val shNum = buf.getShort(0x30).toInt() and 0xffff
        val shStrIndex = buf.getShort(0x32).toInt() and 0xffff
        fun header(i: Int) = shOff + i * shEntSize
        val shStrOffset = buf.getInt(header(shStrIndex) + 0x10)
        sections = (0 until shNum).associate { i ->
            val h = header(i)
            val name = cString(shStrOffset + buf.getInt(h))
            name to Section(name, buf.getInt(h + 0x10), buf.getInt(h + 0x14), buf.getInt(h + 0x24))
        }
    }

    private fun section(name: String) = sections[name] ?: throw IllegalStateException("ELF section $name missing")

    private fun cString(offset: Int): String {
        var end = offset
        while (bytes[end] != 0.toByte()) end++
        return String(bytes, offset, end - offset, Charsets.ISO_8859_1)
    }

    private fun overwrite(offset: Int, old: String, new: String) {
        require(old.length == new.length) { "\"$new\" must have the length of \"$old\"" }
        check(cString(offset) == old) { "Unexpected string at $offset" }
        new.toByteArray(Charsets.ISO_8859_1).copyInto(bytes, offset)
    }

    /** Renames a DT_NEEDED entry. */
    fun renameNeeded(old: String, new: String) {
        val dynamic = section(".dynamic")
        val dynStr = section(".dynstr")
        var i = 0
        while (i < dynamic.size) {
            val tag = buf.getInt(dynamic.offset + i)
            if (tag == 0) break
            if (tag == 1) { // DT_NEEDED
                val offset = dynStr.offset + buf.getInt(dynamic.offset + i + 4)
                if (cString(offset) == old) {
                    overwrite(offset, old, new)
                    return
                }
            }
            i += 8
        }
        throw IllegalStateException("DT_NEEDED $old not found")
    }

    /**
     * Renames an undefined (imported) symbol and drops its version requirement, since the new
     * definition is unversioned.
     */
    fun renameImport(old: String, new: String) {
        val dynSym = section(".dynsym")
        val dynStr = section(".dynstr")
        val versions = sections[".gnu.version"]
        val count = dynSym.size / 16
        for (index in 0 until count) {
            val entry = dynSym.offset + index * 16
            val nameOffset = dynStr.offset + buf.getInt(entry)
            val sectionIndex = buf.getShort(entry + 14).toInt() and 0xffff
            if (sectionIndex != 0 || cString(nameOffset) != old) continue

            // The name must not be shared (as a suffix) with another symbol.
            for (other in 0 until count) {
                if (other == index) continue
                val o = dynStr.offset + buf.getInt(dynSym.offset + other * 16)
                check(o !in nameOffset..(nameOffset + old.length)) { "Symbol name $old is shared" }
            }
            overwrite(nameOffset, old, new)
            if (versions != null) buf.putShort(versions.offset + index * 2, 1) // VER_NDX_GLOBAL
            return
        }
        throw IllegalStateException("Imported symbol $old not found")
    }
}
