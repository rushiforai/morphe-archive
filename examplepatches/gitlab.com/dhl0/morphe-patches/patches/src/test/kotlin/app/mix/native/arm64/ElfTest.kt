package app.mix.native.arm64

import java.nio.ByteBuffer
import java.nio.ByteOrder
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertNotNull
import kotlin.test.assertTrue

class ElfTest {
    @Test
    fun parsesElf64SectionsAndSymbols() {
        val elf = Elf.parse(testElf())

        assertEquals(183, elf.machine)
        assertEquals(listOf("", ".text", ".shstrtab", ".dynstr", ".dynsym"), elf.sections.map { it.name })
        assertEquals(0x1000, elf.codeSection()?.address)
        assertEquals(0x100, elf.vaToFileOffset(0x1000))
        assertEquals(0x1000, elf.fileOffsetToVa(0x100))

        val symbol = elf.dynamicSymbols.single()
        assertEquals("target", symbol.name)
        assertTrue(symbol.isFunction)
        assertTrue(symbol.isGlobal)
        assertFalse(symbol.isUndefined)
    }

    @Test
    fun shortReadCanStopAtSectionBoundary() {
        val elf = Elf.parse(testElf())
        val bytes = elf.readAvailableBytes(0x100C, 128)
        assertNotNull(bytes)
        assertEquals(4, bytes.size)
    }

}

internal fun testElf(machine: Int = 183): ByteArray {
    val bytes = ByteArray(0x400)
    val buffer = ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN)
    bytes[0] = 0x7F
    bytes[1] = 'E'.code.toByte()
    bytes[2] = 'L'.code.toByte()
    bytes[3] = 'F'.code.toByte()
    bytes[4] = 2
    bytes[5] = 1
    buffer.putShort(0x12, machine.toShort())
    buffer.putLong(0x28, 0x200)
    buffer.putShort(0x3A, 64)
    buffer.putShort(0x3C, 5)
    buffer.putShort(0x3E, 2)

    val shstr = byteArrayOf(0) + ".text\u0000.shstrtab\u0000.dynstr\u0000.dynsym\u0000".encodeToByteArray()
    val dynstr = byteArrayOf(0) + "target\u0000".encodeToByteArray()
    shstr.copyInto(bytes, 0x120)
    dynstr.copyInto(bytes, 0x160)

    writeSection(buffer, 1, 1, 1, 0x6, 0x1000, 0x100, 0x10)
    writeSection(buffer, 2, 7, 3, 0, 0, 0x120, shstr.size.toLong())
    writeSection(buffer, 3, 17, 3, 0x2, 0x2000, 0x160, dynstr.size.toLong())
    writeSection(buffer, 4, 25, 11, 0x2, 0x3000, 0x170, 24, link = 3, entrySize = 24)

    buffer.putInt(0x170, 1)
    bytes[0x174] = 0x12
    buffer.putShort(0x176, 1)
    buffer.putLong(0x178, 0x1000)
    buffer.putLong(0x180, 0x10)
    return bytes
}

private fun writeSection(
    buffer: ByteBuffer,
    index: Int,
    nameIndex: Int,
    type: Int,
    flags: Long,
    address: Long,
    fileOffset: Long,
    size: Long,
    link: Int = 0,
    entrySize: Long = 0,
) {
    val offset = 0x200 + index * 64
    buffer.putInt(offset, nameIndex)
    buffer.putInt(offset + 4, type)
    buffer.putLong(offset + 8, flags)
    buffer.putLong(offset + 0x10, address)
    buffer.putLong(offset + 0x18, fileOffset)
    buffer.putLong(offset + 0x20, size)
    buffer.putInt(offset + 0x28, link)
    buffer.putLong(offset + 0x30, 8)
    buffer.putLong(offset + 0x38, entrySize)
}
