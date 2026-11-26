/*
 * Patches for tvQuickActions Pro.
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.tvqa.patches.shared

import app.morphe.patcher.patch.PatchException
import java.io.File

/**
 * `e_machine` values of the two ELF formats the app ships.
 */
object ElfMachine {
    const val ARM = 0x28L
    const val AARCH64 = 0xB7L
}

/**
 * One library of the APK, loaded so its code can be searched and rewritten.
 *
 * The engine libraries carry no symbols the patcher can read, so the routines the patches care
 * about are found by how they are reached rather than by what they are called:
 * [locate] returns the one place an instruction sequence occurs, which recognises a routine from
 * the handful of instructions it opens with, and [blCallers] decodes every branch and returns the
 * sites that reach one address, so the routine is found and then its call sites are derived from
 * it. Neither depends on an offset, which is the point: an offset only describes one build.
 *
 * Every address here is a virtual address, and [read]/[write] take one too, so a caller never has
 * to mix virtual addresses and file offsets: ARM32 libraries start their `.text` at virtual
 * address `0x0` while ARM64 ones start it at `0x59d600`, and the segments are the only thing that
 * knows which is which.
 */
class ElfFile private constructor(
    val file: File,
    val data: ByteArray,
    val machine: Long,
    private val is64Bit: Boolean,
    private val segments: List<Segment>,
) {

    val isArm64: Boolean get() = machine == ElfMachine.AARCH64

    /** Reads `width` little-endian bytes at a virtual address. */
    fun read(vaddr: Long, width: Int): Long {
        val offset = fileOffsetOf(vaddr)
            ?: throw PatchException("0x${vaddr.toString(16)} is not backed by ${file.name}")

        return u(offset, width)
    }

    /** Writes `width` little-endian bytes at a virtual address. */
    fun write(vaddr: Long, width: Int, value: Long) {
        val offset = fileOffsetOf(vaddr)
            ?: throw PatchException("0x${vaddr.toString(16)} is not backed by ${file.name}")

        for (byte in 0 until width) {
            data[offset + byte] = ((value shr (8 * byte)) and 0xFF).toByte()
        }
    }

    /** The file offset backing a virtual address, or `null` when nothing backs it. */
    fun fileOffsetOf(vaddr: Long): Int? {
        val segment = segments.firstOrNull { it.loadable && vaddr >= it.vaddr && vaddr < it.vaddr + it.fileSize }
            ?: return null

        return (segment.offset + (vaddr - segment.vaddr)).toInt()
    }

    /** Saves the rewritten bytes back over the library. */
    fun save() = file.writeBytes(data)

    /**
     * Replaces the constructor an `INIT_ARRAY` slot is filled with.
     *
     * A 64-bit `INIT_ARRAY` is zero on disk and filled at load time from `R_AARCH64_RELATIVE`
     * relocations, so the slot's content is the addend of the relocation that targets it. The
     * whole array is read at once: the slot is not known in advance, it is whichever one holds
     * the constructor, and reporting the others lets a caller recognise the layout instead of a
     * version.
     */
    /** Whether `address` is one of the functions `INIT_ARRAY` runs at load. */
    fun isInitArrayEntry(address: Long): Boolean = address in initArrayAddends()

    /**
     * The `INIT_ARRAY` function whose body contains `address`.
     *
     * A call site sits inside the function that issues it, so the entry that starts at or before
     * it, with no other entry in between, is the function that holds it.
     */
    fun initArrayEntryIn(address: Long): Long? = initArrayAddends()
        .filter { it > 0 && it < address }
        .maxOrNull()

    /**
     * The `INIT_ARRAY` function that makes the call at `site` early in its own body.
     *
     * The engine's constructor calls the licence check straight after building its frame, so the
     * entry the call belongs to is the one closest before it. Entries that start the same way are
     * told apart by that distance, not by their prologue.
     */
    fun constructorCallingAt(site: Long, window: Long = 0x4000): Long? = initArrayAddends()
        .filter { it > 0 && it < site && site - it <= window }
        .maxOrNull()

    /**
     * Whether the function starting at `entry` is the one that makes the call at `site`.
     *
     * arm32 only: `bx lr` returns from a Thumb function.
     *
     * A function ends at its first `bx lr`, so a call before that terminator is made from inside
     * it. This is how two functions that open the same way are told apart on arm32.
     */
    fun owns(entry: Long, site: Long): Boolean {
        if (site <= entry) return false

        val terminator = findAll(intArrayOf(0x4770)).firstOrNull { it > entry }
            ?: return false

        return site < terminator
    }

    fun initArrayAddends(): List<Long> {
        val array = dynamicValue(DT_INIT_ARRAY) ?: return emptyList()
        val size = dynamicValue(DT_INIT_ARRAYSZ) ?: return emptyList()
        val relocations = relativeRelocations()

        return (0 until (size / 8).toInt()).map { index -> relocations[array + index * 8] ?: 0L }
    }

    /**
     * Points the `INIT_ARRAY` slot holding a constructor at `replacement`.
     *
     * [expected] is either the constructor itself or the `INIT_ARRAY` addend that runs just
     * before it. Accepting the neighbour is what makes this work on a build where the
     * constructor has moved inside the library but the order of the array did not: the
     * constructor is the entry that follows that neighbour.
     */
    fun redirectConstructor(expected: Long, replacement: Long): Boolean {
        val array = dynamicValue(DT_INIT_ARRAY) ?: return false
        val size = dynamicValue(DT_INIT_ARRAYSZ) ?: return false
        val table = dynamicValue(DT_RELA) ?: return false
        val tableSize = dynamicValue(DT_RELASZ) ?: 0L
        val entrySize = dynamicValue(DT_RELAENT) ?: 24L
        val addends = initArrayAddends()

        val index = addends.indices.firstOrNull { addends[it] == expected }
            ?: addends.indices.firstOrNull { it > 0 && addends[it - 1] == expected }
            ?: return false

        val slot = array + index * 8
        var entry = table

        while (entry < table + tableSize) {
            val offset = entry.toInt()

            if (u(offset, 8) == slot && u(offset + 8, 4) == R_AARCH64_RELATIVE) {
                write(entry + 16, 8, replacement)

                return true
            }

            entry += entrySize
        }

        return false
    }

    /**
     * The name of the libc function a `.plt` stub calls, or `null` when `stub` is not a stub.
     *
     * An arm64 stub keeps no name: it loads an address from a table page and jumps. The
     * relocation that fills that entry names the function, and that entry's address is what the
     * stub adds to the page base, so the stub's own instructions give the slot. Neither the
     * stub's place in the table nor the name in the string table is assumed.
     */
    fun importedSymbolCalledByStub(stub: Long): String? {
        val words = (0 until 4).map { read(stub + it * 4, 4) }

        // adrp xN, page ; ldr xM, [xN, #off] ; add x0, xN, #off ; br xM
        if (words[0] and 0x9F00001FL != 0x90000010L || words[3] and 0xFFFFFC1FL != 0xD61F0000L) return null

        val page = (stub and 0xFFFFFFFFFFFFF000UL.toLong()) + (((words[0] shr 29) and 0x3) or ((words[0] shr 5) and 0x7FFFFL)) * 4096
        val loadOffset = ((words[1] shr 10) and 0xFFFL) shl ((words[1] shr 22) and 0x3).toInt()

        return importedSymbolAt(page + loadOffset)
    }

    /**
     * The name of the libc function a relocation puts in [slot], or `null`.
     *
     * Both tables are read: a function imported through `.plt` lands in `DT_JMPREL` as a
     * `JUMP_SLOT`, while a data pointer to it, such as the address `system` is called through in
     * some builds, lands in `DT_RELA` as a `GLOB_DAT`.
     */
    fun importedSymbolAt(slot: Long): String? {
        return jumpSlotSymbol(slot) ?: globDatSymbol(slot)
    }

    private fun jumpSlotSymbol(slot: Long): String? {
        val table = dynamicValue(DT_JMPREL) ?: return null
        val size = dynamicValue(DT_PLTRELSZ) ?: 0L
        if (dynamicValue(DT_PLTREL) != DT_RELA) return null

        return relaSymbol(slot, table, size, R_AARCH64_JUMP_SLOT)
    }

    private fun globDatSymbol(slot: Long): String? {
        val table = dynamicValue(DT_RELA) ?: return null
        val size = dynamicValue(DT_RELASZ) ?: 0L

        return relaSymbol(slot, table, size, R_AARCH64_GLOB_DAT)
    }

    private fun relaSymbol(slot: Long, table: Long, size: Long, type: Long): String? {
        val symbols = dynamicValue(DT_SYMTAB) ?: return null
        val strings = dynamicValue(DT_STRTAB) ?: return null
        val entrySize = dynamicValue(DT_RELAENT) ?: 24L

        var entry = table

        while (entry < table + size) {
            val offset = entry.toInt()

            if (u(offset, 8) == slot && u(offset + 8, 4) == type) {
                val nameOffset = u((symbols + (u(offset + 8, 8) shr 32) * 24).toInt(), 4)
                val start = (strings + nameOffset).toInt()
                var end = start

                while (data[end].toInt() != 0 && end < data.size) end++

                return String(data, start, end - start)
            }

            entry += entrySize
        }

        return null
    }

    /** Every `R_AARCH64_RELATIVE` relocation as slot -> addend. */
    private fun relativeRelocations(): Map<Long, Long> {
        val table = dynamicValue(DT_RELA) ?: throw PatchException("${file.name} has no relocation table")
        val size = dynamicValue(DT_RELASZ) ?: 0L
        val entrySize = dynamicValue(DT_RELAENT) ?: 24L
        val relocations = mutableMapOf<Long, Long>()

        var entry = table

        while (entry < table + size) {
            val offset = entry.toInt()

            if (u(offset + 8, 4) == R_AARCH64_RELATIVE) relocations[u(offset, 8)] = u(offset + 16, 8)
            entry += entrySize
        }

        return relocations
    }

    private fun dynamicValue(tag: Long): Long? {
        val dynamic = segments.firstOrNull { it.type == PT_DYNAMIC } ?: return null
        var offset = dynamic.offset.toInt()
        val end = offset + dynamic.fileSize.toInt()
        val stride = if (is64Bit) 16 else 8

        while (offset < end) {
            val current = u(offset, if (is64Bit) 8 else 4)
            if (current == 0L) return null
            if (current == tag) return u(offset + stride / 2, stride / 2)
            offset += stride
        }

        return null
    }

    /**
     * Every virtual address holding a branch to [target].
     *
     * Both Thumb `BL` and ARM `BL` are decoded, and both arm64 `BL` and `B`, because the same
     * routine is called with different encodings in the different builds. ARM32 is scanned at
     * every byte: a Thumb call is aligned to two bytes but not to four, and a misaligned `BL` is
     * what a short scan misses.
     */
    fun blCallers(target: Long): List<Long> {
        val sites = mutableListOf<Long>()

        for (segment in segments.filter { it.executable }) {
            val start = segment.offset.toInt()
            val end = start + segment.fileSize.toInt()
            var offset = start

            while (offset + 4 <= end) {
                val address = segment.vaddr + (offset - segment.offset)

                if (branchTarget(address, offset) == target) sites += address
                offset += if (is64Bit) 4 else 2
            }
        }

        return sites.sorted()
    }

    /**
     * The single place an instruction sequence occurs, or `null` when it occurs nowhere.
     *
     * [signature] is taken from one build and recognises the code around it structurally: the
     * constants the routine computes, the instructions it assembles its call from, the padding
     * the compiler emitted between two of them. A build that changed it, or that happens to
     * contain it twice, is not something a patch can safely guess about, so the caller is told
     * rather than given an address.
     */
    fun locate(signature: IntArray): Long? {
        val matches = findAll(signature)

        if (matches.size > 1) {
            throw PatchException(
                "${file.name} contains the signature at ${matches.size} places " +
                        "(${matches.joinToString { "0x" + it.toString(16) }}); it cannot be used to " +
                        "find one routine"
            )
        }

        return matches.firstOrNull()
    }

    /**
     * Every place [signature] occurs, compared as whole instructions.
     *
     * The comparison is done per instruction rather than per byte so that code can never be
     * matched halfway into another instruction, and the search resumes one instruction after a
     * hit instead of after the whole signature, so overlapping occurrences are all reported.
     */
    fun findAll(signature: IntArray): List<Long> {
        val width = if (is64Bit) 4 else 2
        val wanted = signature.flatMap { word ->
            if (width == 4) {
                listOf(
                    (word and 0xFF).toByte(),
                    ((word shr 8) and 0xFF).toByte(),
                    ((word shr 16) and 0xFF).toByte(),
                    ((word shr 24) and 0xFF).toByte(),
                )
            } else {
                listOf((word and 0xFF).toByte(), ((word shr 8) and 0xFF).toByte())
            }
        }.toByteArray()

        val matches = mutableListOf<Long>()

        for (segment in segments.filter { it.executable }) {
            val start = segment.offset.toInt()
            val end = start + segment.fileSize.toInt() - wanted.size
            var offset = start

            while (offset <= end && offset >= start) {
                if (data[offset] == wanted[0] && regionMatches(offset, wanted)) {
                    matches += segment.vaddr + (offset - segment.offset)
                }

                offset += width
            }
        }

        return matches
    }

    /**
     * Every virtual address of the given value, so a table can be found from the routines it
     * lists rather than from an offset.
     */
    fun findAllWords(value: Long, width: Int): List<Long> {
        val wanted = ByteArray(width) { ((value shr (8 * it)) and 0xFF).toByte() }

        return segments.filter { it.loadable }.flatMap { segment ->
            val found = mutableListOf<Long>()
            var offset = segment.offset.toInt()
            val last = offset + segment.fileSize.toInt() - width

            while (offset <= last) {
                if (wanted.indices.all { data[offset + it] == wanted[it] }) {
                    found += segment.vaddr + (offset - segment.offset)
                }
                offset++
            }

            found
        }
    }

    /** The address the branch at [address] reaches, or `null` when there is no branch there. */
    fun branchTarget(address: Long): Long? {
        val offset = fileOffsetOf(address) ?: return null

        return branchTarget(address, offset)
    }

    private fun branchTarget(address: Long, offset: Int): Long? {
        if (is64Bit) {
            val word = u(offset, 4)
            // BL (0b100101) and B (0b000101) share their immediate layout in arm64.
            val opcode = (word shr 26) and 0x3FL

            if (opcode != 0x25L && opcode != 0x05L) return null

            var immediate = word and 0x03FFFFFF
            if (immediate and 0x02000000 != 0L) immediate = immediate or 0xFFFFFFFFFC000000UL.toLong()

            return address + (immediate shl 2)
        }

        val first = u(offset, 2)
        if (first shr 11 == 0x1EL) {
            val second = u(offset + 2, 2)
            // Thumb-2 32-bit prefix: BL is 11110... 11..., BLX is 11110... 11... with L == 0.
            if (second shr 14 != 0x3L) return null

            val sign = (first shr 10) and 1
            val imm10 = first and 0x3FF
            val j1 = (second shr 13) and 1
            val j2 = (second shr 11) and 1
            val imm11 = second and 0x7FF
            val i1 = 1 - (j1 xor sign)
            val i2 = 1 - (j2 xor sign)

            var immediate = (sign shl 24) or (i1 shl 23) or (i2 shl 22) or (imm10 shl 12) or (imm11 shl 1)
            if (immediate and 0x01000000 != 0L) immediate -= 0x02000000

            // A Thumb BL destination is reported without the Thumb bit it is called through.
            return address + 4 + immediate
        }

        val word = u(offset, 4)
        // ARM BL: 1110 1011 .... with a 24-bit word offset.
        if (word shr 24 != 0xEBL) return null

        var immediate = word and 0x00FFFFFF
        if (immediate and 0x00800000 != 0L) immediate = immediate or 0xFFFFFFFFFF000000UL.toLong()

        return address + 8 + (immediate shl 2)
    }

    private fun regionMatches(offset: Int, wanted: ByteArray): Boolean {
        for (index in wanted.indices) {
            if (data[offset + index] != wanted[index]) return false
        }

        return true
    }

    private fun u(offset: Int, width: Int): Long {
        var value = 0L

        for (byte in 0 until width) {
            value = value or ((data[offset + byte].toLong() and 0xFF) shl (8 * byte))
        }

        return value
    }

    private class Segment(
        val type: Long,
        val offset: Long,
        val vaddr: Long,
        val fileSize: Long,
        val flags: Long,
    ) {
        val loadable: Boolean get() = type == PT_LOAD
        val executable: Boolean get() = loadable && flags and 0x1L != 0L
    }

    companion object {
        /**
         * How many words of a function's opening are compared when matching two of them.
         *
         * The saved registers and the frame pointer come first; the frame size that follows is
         * what distinguishes two otherwise identical functions, so it is left out.
         */
        private const val OPENING_WORDS = 7

        private const val PT_LOAD = 1L
        private const val PT_DYNAMIC = 2L
        private const val DT_INIT_ARRAY = 25L
        private const val DT_INIT_ARRAYSZ = 27L
        private const val DT_RELA = 7L
        private const val DT_RELASZ = 8L
        private const val DT_RELAENT = 9L
        private const val DT_JMPREL = 23L
        private const val DT_PLTRELSZ = 2L
        private const val DT_PLTREL = 20L
        private const val DT_SYMTAB = 6L
        private const val DT_STRTAB = 5L
        private const val R_AARCH64_RELATIVE = 1027L
        private const val R_AARCH64_GLOB_DAT = 1025L
        private const val R_AARCH64_JUMP_SLOT = 1026L

        fun load(file: File): ElfFile {
            val data = file.readBytes()

            if (data.size < 64 ||
                data[0] != 0x7F.toByte() || data[1] != 'E'.code.toByte() ||
                data[2] != 'L'.code.toByte() || data[3] != 'F'.code.toByte()
            ) {
                throw PatchException("${file.name} is not an ELF file")
            }

            if (data[5].toInt() != 1) throw PatchException("${file.name} is not little-endian")

            val is64Bit = when (data[4].toInt()) {
                1 -> false
                2 -> true
                else -> throw PatchException("${file.name} is neither a 32-bit nor a 64-bit ELF file")
            }

            val machine = (data[0x12].toLong() and 0xFF) or ((data[0x13].toLong() and 0xFF) shl 8)
            val headerOffset: Long
            val headerSize: Long
            val headerCount: Long

            fun word(offset: Int, width: Int): Long {
                var value = 0L
                for (byte in 0 until width) {
                    value = value or ((data[offset + byte].toLong() and 0xFF) shl (8 * byte))
                }
                return value
            }

            if (is64Bit) {
                headerOffset = word(0x20, 8)
                headerSize = word(0x36, 2)
                headerCount = word(0x38, 2)
            } else {
                headerOffset = word(0x1C, 4)
                headerSize = word(0x2A, 2)
                headerCount = word(0x2C, 2)
            }

            val segments = (0 until headerCount).map { index ->
                val at = (headerOffset + index * headerSize).toInt()

                if (is64Bit) {
                    Segment(
                        type = word(at, 4),
                        offset = word(at + 8, 8),
                        vaddr = word(at + 16, 8),
                        fileSize = word(at + 32, 8),
                        flags = word(at + 4, 4),
                    )
                } else {
                    Segment(
                        type = word(at, 4),
                        offset = word(at + 4, 4),
                        vaddr = word(at + 8, 4),
                        fileSize = word(at + 16, 4),
                        flags = word(at + 24, 4),
                    )
                }
            }

            return ElfFile(file, data, machine, is64Bit, segments)
        }
    }
}
