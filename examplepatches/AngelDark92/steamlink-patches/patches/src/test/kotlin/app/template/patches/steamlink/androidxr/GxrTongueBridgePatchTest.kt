package app.template.patches.steamlink.androidxr

import app.morphe.patcher.patch.PatchException
import kotlin.test.Test
import kotlin.test.assertContentEquals
import kotlin.test.assertFailsWith

class GxrTongueBridgePatchTest {
    @Test
    fun `unsupported builds remain byte identical`() {
        val input = fixture(MODERN_TONGUE_ORIGINAL)
        listOf("5002318", "5002322").forEach { versionCode ->
            assertContentEquals(
                input,
                patchModernTongueTransport(input, "2.0.22", versionCode),
                versionCode,
            )
        }
        assertContentEquals(input, patchModernTongueTransport(input, "2.0.23", "5002322"))
        val tiny = ByteArray(64)
        assertContentEquals(tiny, patchModernTongueTransport(tiny, "2.0.22", "5002322"))
    }

    @Test
    fun `5002363 native tongue block is restricted and idempotent`() {
        val stock = fixture(MODERN_TONGUE_ORIGINAL, MODERN_TONGUE_LIBRARY_SIZE_5002363, MODERN_TONGUE_VADDR_5002363)
        val patched = patchModernTongueTransport(stock, "2.0.23", "5002363")
        val offset = MODERN_TONGUE_VADDR_5002363.toInt()
        assertContentEquals(MODERN_TONGUE_REPLACEMENT, patched.copyOfRange(offset, offset + MODERN_TONGUE_REPLACEMENT.size))
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
        librarySize: Int = MODERN_TONGUE_LIBRARY_SIZE_5002363,
        vaddr: Long = MODERN_TONGUE_VADDR_5002363,
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
