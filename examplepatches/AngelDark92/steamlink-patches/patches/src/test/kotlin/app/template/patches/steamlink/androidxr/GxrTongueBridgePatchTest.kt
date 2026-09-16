package app.template.patches.steamlink.androidxr

import app.morphe.patcher.patch.PatchException
import kotlin.test.Test
import kotlin.test.assertContentEquals
import kotlin.test.assertFailsWith

class GxrTongueBridgePatchTest {
    @Test
    fun `5002322 native tongue block is patched and idempotent`() {
        val stock = fixture(MODERN_TONGUE_ORIGINAL_5002322)
        val patched = patchModernTongueTransport(stock, "2.0.22", "5002322")

        assertContentEquals(
            MODERN_TONGUE_REPLACEMENT_5002322,
            patched.copyOfRange(
                MODERN_TONGUE_VADDR_5002322.toInt(),
                MODERN_TONGUE_VADDR_5002322.toInt() + MODERN_TONGUE_REPLACEMENT_5002322.size,
            ),
        )
        assertContentEquals(
            patched,
            patchModernTongueTransport(patched, "2.0.22", "5002322"),
        )
    }

    @Test
    fun `other exact builds remain byte identical`() {
        val input = fixture(MODERN_TONGUE_ORIGINAL_5002322)
        assertContentEquals(
            input,
            patchModernTongueTransport(input, "2.0.22", "5002318"),
        )
    }

    @Test
    fun `unexpected 5002322 bytes fail without mutating input`() {
        val input = fixture(ByteArray(MODERN_TONGUE_ORIGINAL_5002322.size) { 0x55 })
        val before = input.copyOf()
        assertFailsWith<PatchException> {
            patchModernTongueTransport(input, "2.0.22", "5002322")
        }
        assertContentEquals(before, input)
    }

    @Test
    fun `unexpected 5002322 library size fails closed`() {
        assertFailsWith<PatchException> {
            patchModernTongueTransport(ByteArray(64), "2.0.22", "5002322")
        }
    }

    @Test
    fun `5002363 native tongue block is restricted and idempotent`() {
        val stock = fixture(MODERN_TONGUE_ORIGINAL_5002363, MODERN_TONGUE_LIBRARY_SIZE_5002363, MODERN_TONGUE_VADDR_5002363)
        val patched = patchModernTongueTransport(stock, "2.0.23", "5002363")
        val offset = MODERN_TONGUE_VADDR_5002363.toInt()
        assertContentEquals(MODERN_TONGUE_REPLACEMENT_5002363, patched.copyOfRange(offset, offset + 24))
        assertContentEquals(stock.copyOfRange(0, offset), patched.copyOfRange(0, offset))
        assertContentEquals(stock.copyOfRange(offset + 24, stock.size), patched.copyOfRange(offset + 24, patched.size))
        assertContentEquals(patched, patchModernTongueTransport(patched, "2.0.23", "5002363"))
        assertContentEquals(stock, patchModernTongueTransport(stock, "2.0.22", "5002363"))
        assertContentEquals(stock, patchModernTongueTransport(stock, "2.0.23", "5002322"))
    }

    @Test
    fun `5002363 rejects unexpected native block and size without mutation`() {
        val malformed = fixture(ByteArray(24) { 0x55 }, MODERN_TONGUE_LIBRARY_SIZE_5002363, MODERN_TONGUE_VADDR_5002363)
        val before = malformed.copyOf()
        assertFailsWith<PatchException> { patchModernTongueTransport(malformed, "2.0.23", "5002363") }
        assertContentEquals(before, malformed)
        assertFailsWith<PatchException> { patchModernTongueTransport(ByteArray(64), "2.0.23", "5002363") }
    }

    private fun fixture(
        block: ByteArray,
        librarySize: Int = MODERN_TONGUE_LIBRARY_SIZE_5002322,
        vaddr: Long = MODERN_TONGUE_VADDR_5002322,
    ) = ByteArray(librarySize).apply {
        byteArrayOf(0x7f, 0x45, 0x4c, 0x46).copyInto(this, 0)
        writeU64LE(32, 64)
        writeU16LE(54, 56)
        writeU16LE(56, 1)
        writeU32LE(64, 1)
        writeU64LE(72, 0)
        writeU64LE(80, 0)
        writeU64LE(96, size.toLong())
        block.copyInto(this, vaddr.toInt())
    }

    private fun ByteArray.writeU16LE(offset: Int, value: Int) {
        this[offset] = value.toByte()
        this[offset + 1] = (value ushr 8).toByte()
    }

    private fun ByteArray.writeU32LE(offset: Int, value: Int) {
        repeat(4) { index -> this[offset + index] = (value ushr (index * 8)).toByte() }
    }

    private fun ByteArray.writeU64LE(offset: Int, value: Long) {
        repeat(8) { index -> this[offset + index] = (value ushr (index * 8)).toByte() }
    }
}
