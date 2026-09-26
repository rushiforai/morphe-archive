package app.ckzombies.patches.nativelib

import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.security.MessageDigest

/** One 32-bit word to replace, addressed by virtual address, with the value it must hold first. */
internal data class WordEdit(val vaddr: Long, val old: Long, val new: Long)

/**
 * Everything the currency patch needs beyond plain word edits: where its code cave goes, how
 * far LOAD1 has to grow to map it, the page to splice in when the file has no room, and the
 * cave and clamp stubs themselves.
 */
internal data class CurrencyPlan(
    val cave: Long,
    val load1End: Long,
    val spliceAtOffset: Long?,
    val spliceSize: Int,
    val caveBytes: String,
    val edits: List<WordEdit>,
)

/**
 * A little-endian ELF32 file read and written by virtual address, the way the dynamic linker
 * maps it, never by raw file offset. That is what lets independent patches compose: splicing a
 * page into a file moves file offsets but no virtual address.
 */
internal class Elf32(bytes: ByteArray) {
    private var data = bytes

    private class Load(val vaddr: Long, val fileSize: Long, val offset: Long)

    private fun u16(at: Int) = ByteBuffer.wrap(data).order(ByteOrder.LITTLE_ENDIAN).getShort(at).toInt() and 0xFFFF

    private fun u32(at: Int) = ByteBuffer.wrap(data).order(ByteOrder.LITTLE_ENDIAN).getInt(at).toLong() and 0xFFFFFFFFL

    private fun putU32(at: Int, value: Long) {
        ByteBuffer.wrap(data).order(ByteOrder.LITTLE_ENDIAN).putInt(at, value.toInt())
    }

    private val programHeaderOffsets: List<Int>
        get() {
            val phOffset = u32(0x1C).toInt()
            val phSize = u16(0x2A)
            return (0 until u16(0x2C)).map { phOffset + it * phSize }
        }

    private val sectionHeaderOffsets: List<Int>
        get() {
            val shOffset = u32(0x20).toInt()
            val shSize = u16(0x2E)
            return if (shOffset == 0) emptyList() else (0 until u16(0x30)).map { shOffset + it * shSize }
        }

    private val loads: List<Load>
        get() = programHeaderOffsets.filter { u32(it) == PT_LOAD }
            .map { Load(u32(it + 8), u32(it + 16), u32(it + 4)) }

    init {
        require(data.size >= 52 && u32(0) == 0x464C457FL) { "not an ELF file" }
        require(data[4].toInt() == 1 && data[5].toInt() == 1) { "not a little-endian ELF32 file" }
        require(loads.isNotEmpty()) { "no PT_LOAD segment" }
    }

    /** File offset of [vaddr], which must lie inside the file-backed part of a PT_LOAD segment. */
    fun offsetOf(vaddr: Long): Int {
        val load = loads.firstOrNull { vaddr >= it.vaddr && vaddr + 4 <= it.vaddr + it.fileSize }
            ?: throw IllegalArgumentException("0x%08X is not file-backed in any PT_LOAD".format(vaddr))
        return (load.offset + (vaddr - load.vaddr)).toInt()
    }

    fun word(vaddr: Long): Long = u32(offsetOf(vaddr))

    /**
     * Applies [edits] all or nothing. Every word must hold its expected old value; a word that
     * already holds the new value means the file was patched before, which is also refused.
     */
    fun apply(edits: List<WordEdit>) {
        for (edit in edits) {
            val current = word(edit.vaddr)
            check(current == edit.old) {
                if (current == edit.new) "0x%08X is already patched".format(edit.vaddr)
                else "0x%08X holds 0x%08X, expected 0x%08X".format(edit.vaddr, current, edit.old)
            }
        }
        for (edit in edits) putU32(offsetOf(edit.vaddr), edit.new)
    }

    /**
     * Inserts [size] zero bytes at [atOffset] and moves everything the file locates by offset:
     * the section header table, every section, and every segment that starts at or after it. No
     * virtual address changes, so relocations, the GOT and the symbols all stay valid.
     */
    fun splice(atOffset: Long, size: Int) {
        check(size % PAGE == 0) { "a splice must be whole pages, or the segments stop mapping" }
        data = data.copyOfRange(0, atOffset.toInt()) + ByteArray(size) + data.copyOfRange(atOffset.toInt(), data.size)

        val sectionHeaderTable = u32(0x20)
        if (sectionHeaderTable >= atOffset) putU32(0x20, sectionHeaderTable + size)
        for (header in sectionHeaderOffsets) {
            if (u32(header + 4) == SHT_NULL) continue
            val offset = u32(header + 0x10)
            if (offset >= atOffset) putU32(header + 0x10, offset + size)
        }
        for (header in programHeaderOffsets) {
            val offset = u32(header + 4)
            if (offset >= atOffset) putU32(header + 4, offset + size)
        }
        for (load in loads) {
            check((load.offset % PAGE) == (load.vaddr % PAGE)) {
                "segment at 0x%08X no longer maps: offset and address disagree mod 4096".format(load.vaddr)
            }
        }
    }

    /**
     * Grows the first PT_LOAD so that it maps up to [end], which must be on a page boundary.
     * The bytes it takes in are the ones between the old end of the segment and that boundary.
     */
    fun growFirstLoadTo(end: Long) {
        val header = programHeaderOffsets.first { u32(it) == PT_LOAD }
        check(u32(header + 4) == 0L && u32(header + 8) == 0L) { "the first PT_LOAD is not the one at offset 0" }
        check(end % PAGE == 0L && end > u32(header + 16)) { "0x%08X is not a page boundary past the segment".format(end) }
        check(end <= data.size.toLong()) { "the file does not reach 0x%08X".format(end) }
        putU32(header + 16, end) // p_filesz
        putU32(header + 20, end) // p_memsz
    }

    /**
     * Claims [size] bytes past the end of the last PT_LOAD, inside the page it already has, for
     * anonymous zero-filled memory. That is where the one-shot flag lives.
     */
    fun extendLastLoadMemory(size: Int): Long {
        val header = programHeaderOffsets.filter { u32(it) == PT_LOAD }.last()
        val end = u32(header + 8) + u32(header + 20)
        check(end % 4 == 0L) { "the end of the segment is not aligned" }
        check((end / PAGE) == ((end + size - 1) / PAGE)) { "the extra bytes would need another page" }
        putU32(header + 20, u32(header + 20) + size)
        return end
    }

    /** Writes [contents] at [vaddr], which must be file-backed and zero all the way. */
    fun writeIntoZeros(vaddr: Long, contents: ByteArray) {
        val offset = offsetOf(vaddr)
        check(offset + contents.size <= data.size) { "0x%08X does not have room".format(vaddr) }
        val occupied = (offset until offset + contents.size).firstOrNull { data[it].toInt() != 0 }
        check(occupied == null) { "0x%08X is not free".format(vaddr + (occupied ?: 0) - offset) }
        contents.copyInto(data, offset)
    }

    fun bytes(): ByteArray = data

    companion object {
        private const val PT_LOAD = 1L
        private const val SHT_NULL = 0L
        private const val PAGE = 4096

        fun sha256(data: ByteArray): String =
            MessageDigest.getInstance("SHA-256").digest(data).joinToString("") { "%02x".format(it) }
    }
}
