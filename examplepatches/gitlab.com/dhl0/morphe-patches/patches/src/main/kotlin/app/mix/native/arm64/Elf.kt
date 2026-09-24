package app.mix.native.arm64

import java.nio.ByteBuffer
import java.nio.ByteOrder

/**
 * Minimal ELF64 parser - enough to fingerprint AArch64 shared libraries.
 *
 * Exposes sections, symbols (dynamic + static), string tables and the VA <-> file-offset
 * mapping needed to locate functions and resolve adr/adrp/bl targets.
 */
class Elf private constructor(
    val bytes: ByteArray,
    val machine: Int,
    val sections: List<Section>,
    val dynamicSymbols: List<Symbol>,
    val staticSymbols: List<Symbol>,
) {
    data class Section(
        val name: String,
        val type: Int,
        val flags: Long,
        val address: Long,
        val fileOffset: Long,
        val size: Long,
        val link: Int,
        val entrySize: Long,
        val alignment: Long,
    ) {
        val isExecutable: Boolean get() = flags and 0x4 != 0L
        val isAllocatable: Boolean get() = flags and 0x2 != 0L
        val isNull: Boolean get() = type == SHT_NULL
        val isFileBacked: Boolean get() = type != SHT_NOBITS
    }

    data class Symbol(
        val name: String,
        val value: Long,
        val size: Long,
        val info: Int,
        val sectionIndex: Int,
    ) {
        val isFunction: Boolean get() = (info and 0xF) == STT_FUNC
        val isGlobal: Boolean get() = (info ushr 4) == STB_GLOBAL || (info ushr 4) == STB_WEAK
        val isUndefined: Boolean get() = sectionIndex == 0
    }

    /** The executable sections (.text etc.). */
    val codeSections: List<Section> get() = sections.filter { it.isExecutable && !it.isNull && it.size > 0 }

    fun section(name: String): Section? = sections.firstOrNull { it.name == name }

    fun codeSection(name: String = ".text"): Section? = section(name)

    /**
     * Maps a file offset to its virtual address, or null when the offset
     * does not fall inside any allocated section.
     */
    fun fileOffsetToVa(fileOffset: Long): Long? {
        val section = sections.firstOrNull {
            it.isAllocatable && it.isFileBacked &&
                    fileOffset >= it.fileOffset && fileOffset - it.fileOffset < it.size
        } ?: return null
        return section.address + (fileOffset - section.fileOffset)
    }

    /**
     * Maps a virtual address to its file offset, or null when the VA is not
     * backed by a file section. This is the inverse of [fileOffsetToVa].
     */
    fun vaToFileOffset(va: Long): Long? {
        val section = sections.firstOrNull {
            it.isAllocatable && it.isFileBacked && va >= it.address && va - it.address < it.size
        } ?: return null
        return section.fileOffset + (va - section.address)
    }

    /** Reads `length` raw bytes at a virtual address, or null if out of any section. */
    fun readBytes(va: Long, length: Int): ByteArray? {
        if (length < 0) return null
        val section = sections.firstOrNull {
            it.isAllocatable && it.isFileBacked && va >= it.address && va - it.address < it.size
        } ?: return null
        val relativeOffset = va - section.address
        if (length.toLong() > section.size - relativeOffset) return null
        val fileOffset = section.fileOffset + relativeOffset
        if (fileOffset < 0 || fileOffset > bytes.size.toLong() - length) return null
        return bytes.copyOfRange(fileOffset.toInt(), (fileOffset + length).toInt())
    }

    /** Reads up to [maximumLength] bytes without crossing the containing section. */
    fun readAvailableBytes(va: Long, maximumLength: Int): ByteArray? {
        if (maximumLength < 0) return null
        val section = sections.firstOrNull {
            it.isAllocatable && it.isFileBacked && va >= it.address && va - it.address < it.size
        } ?: return null
        val relativeOffset = va - section.address
        val fileOffset = section.fileOffset + relativeOffset
        if (fileOffset < 0 || fileOffset >= bytes.size) return null
        val available = minOf(
            maximumLength.toLong(),
            section.size - relativeOffset,
            bytes.size.toLong() - fileOffset,
        ).toInt()
        return bytes.copyOfRange(fileOffset.toInt(), fileOffset.toInt() + available)
    }

    companion object {
        private const val ELF64_SECTION_HEADER_SIZE = 64
        private const val SHT_NULL = 0
        private const val SHT_NOBITS = 8
        private const val STB_GLOBAL = 1
        private const val STB_WEAK = 2
        private const val STT_FUNC = 2

        fun parse(bytes: ByteArray): Elf {
            require(bytes.size >= 64) { "Not an ELF: too small" }
            require(bytes[0] == 0x7F.toByte() && bytes[1] == 'E'.code.toByte() && bytes[2] == 'L'.code.toByte() && bytes[3] == 'F'.code.toByte()) {
                "Not an ELF: bad magic"
            }
            require(bytes[4].toInt() == 2) { "Only ELF64 supported" }
            require(bytes[5].toInt() == 1) { "Only little-endian ELF files are supported" }

            val buffer = ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN)
            val machine = buffer.getShort(0x12).toInt() and 0xFFFF
            val sectionHeaderOffset = buffer.getLong(0x28)
            val sectionHeaderEntrySize = buffer.getShort(0x3A).toInt() and 0xFFFF
            val sectionHeaderCount = buffer.getShort(0x3C).toInt() and 0xFFFF
            val sectionNameStringTableIndex = buffer.getShort(0x3E).toInt() and 0xFFFF
            require(sectionHeaderEntrySize >= ELF64_SECTION_HEADER_SIZE || sectionHeaderCount == 0) {
                "Invalid ELF64 section-header size: $sectionHeaderEntrySize"
            }
            require(sectionHeaderOffset >= 0 && sectionHeaderOffset <= bytes.size.toLong()) {
                "Invalid ELF64 section-header offset"
            }
            require(
                sectionHeaderCount.toLong() <= (bytes.size - sectionHeaderOffset) / sectionHeaderEntrySize.coerceAtLeast(
                    1
                )
            ) {
                "ELF64 section-header table is truncated"
            }

            val sections = mutableListOf<Section>()
            for (i in 0 until sectionHeaderCount) {
                val offset = (sectionHeaderOffset + i.toLong() * sectionHeaderEntrySize).toInt()
                sections += Section(
                    name = "", // resolved after reading shstrtab
                    type = buffer.getInt(offset + 0x04),
                    flags = buffer.getLong(offset + 0x08),
                    address = buffer.getLong(offset + 0x10),
                    fileOffset = buffer.getLong(offset + 0x18),
                    size = buffer.getLong(offset + 0x20),
                    link = buffer.getInt(offset + 0x28),
                    alignment = buffer.getLong(offset + 0x30),
                    entrySize = buffer.getLong(offset + 0x38),
                )
            }

            val shstrtab = sections.getOrNull(sectionNameStringTableIndex)
            val shstrtabBytes = shstrtab?.let { slice(bytes, it.fileOffset, it.size) } ?: ByteArray(0)
            val namedSections = sections.mapIndexed { index, section ->
                val nameIndex = buffer.getInt((sectionHeaderOffset + index.toLong() * sectionHeaderEntrySize).toInt())
                section.copy(name = readString(shstrtabBytes, nameIndex))
            }

            fun parseSymbols(section: Section?): List<Symbol> {
                if (section == null) return emptyList()
                val stringsSection = namedSections.getOrNull(section.link) ?: return emptyList()
                val raw = slice(bytes, section.fileOffset, section.size)
                val names = slice(bytes, stringsSection.fileOffset, stringsSection.size)
                val entrySize = section.entrySize.takeIf { it > 0 } ?: 24L
                val symbols = mutableListOf<Symbol>()
                var offset = 0L
                if (raw.isEmpty()) return symbols
                while (offset + entrySize <= raw.size) {
                    val nameIndex = ByteBuffer.wrap(raw).order(ByteOrder.LITTLE_ENDIAN).getInt(offset.toInt())
                    val info = raw[(offset + 4).toInt()].toInt() and 0xFF
                    val sectionIndex = ByteBuffer.wrap(raw).order(ByteOrder.LITTLE_ENDIAN)
                        .getShort((offset + 6).toInt()).toInt() and 0xFFFF
                    val value = ByteBuffer.wrap(raw).order(ByteOrder.LITTLE_ENDIAN).getLong((offset + 8).toInt())
                    val size = ByteBuffer.wrap(raw).order(ByteOrder.LITTLE_ENDIAN).getLong((offset + 16).toInt())
                    symbols += Symbol(
                        name = readString(names, nameIndex),
                        value = value,
                        size = size,
                        info = info,
                        sectionIndex = sectionIndex,
                    )
                    offset += entrySize
                }
                return symbols
            }

            val dynsym = namedSections.firstOrNull { it.name == ".dynsym" }
            val symtab = namedSections.firstOrNull { it.name == ".symtab" }

            return Elf(
                bytes = bytes,
                machine = machine,
                sections = namedSections,
                dynamicSymbols = parseSymbols(dynsym),
                staticSymbols = parseSymbols(symtab),
            )
        }

        private fun slice(bytes: ByteArray, offset: Long, size: Long): ByteArray {
            if (offset < 0 || size <= 0 || offset + size > bytes.size) return ByteArray(0)
            return bytes.copyOfRange(offset.toInt(), (offset + size).toInt())
        }

        private fun readString(table: ByteArray, index: Int): String {
            if (index < 0 || index >= table.size) return ""
            var end = index
            while (end < table.size && table[end] != 0.toByte()) end++
            return String(table, index, end - index)
        }
    }
}
