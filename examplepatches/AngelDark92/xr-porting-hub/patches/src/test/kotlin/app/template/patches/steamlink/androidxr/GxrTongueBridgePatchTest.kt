package app.template.patches.steamlink.androidxr

import app.morphe.patcher.patch.PatchException
import java.io.File
import java.security.MessageDigest
import org.junit.Assume.assumeTrue
import kotlin.test.Test
import kotlin.test.assertContentEquals
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

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
    fun `5002395 native tongue block is restricted and idempotent`() {
        val stock = fixture(MODERN_TONGUE_ORIGINAL, MODERN_TONGUE_LIBRARY_SIZE_5002395, MODERN_TONGUE_VADDR_5002395)
        val patched = patchModernTongueTransport(stock, "2.0.24", "5002395")
        val offset = MODERN_TONGUE_VADDR_5002395.toInt()
        assertContentEquals(MODERN_TONGUE_REPLACEMENT, patched.copyOfRange(offset, offset + MODERN_TONGUE_REPLACEMENT.size))
        assertContentEquals(stock.copyOfRange(0, offset), patched.copyOfRange(0, offset))
        assertContentEquals(stock.copyOfRange(offset + 24, stock.size), patched.copyOfRange(offset + 24, patched.size))
        assertContentEquals(patched, patchModernTongueTransport(patched, "2.0.24", "5002395"))
        assertContentEquals(stock, patchModernTongueTransport(stock, "2.0.23", "5002395"))
        assertContentEquals(stock, patchModernTongueTransport(stock, "2.0.24", "5002363"))
    }

    @Test
    fun `5002395 rejects unexpected native block and size without mutation`() {
        val malformed = fixture(ByteArray(24) { 0x55 }, MODERN_TONGUE_LIBRARY_SIZE_5002395, MODERN_TONGUE_VADDR_5002395)
        val before = malformed.copyOf()
        assertFailsWith<PatchException> { patchModernTongueTransport(malformed, "2.0.24", "5002395") }
        assertContentEquals(before, malformed)
        assertFailsWith<PatchException> { patchModernTongueTransport(ByteArray(64), "2.0.24", "5002395") }
    }

    @Test
    fun `5002363 rejects unexpected native block and size without mutation`() {
        val malformed = fixture(ByteArray(24) { 0x55 }, MODERN_TONGUE_LIBRARY_SIZE_5002363, MODERN_TONGUE_VADDR_5002363)
        val before = malformed.copyOf()
        assertFailsWith<PatchException> { patchModernTongueTransport(malformed, "2.0.23", "5002363") }
        assertContentEquals(before, malformed)
        assertFailsWith<PatchException> { patchModernTongueTransport(ByteArray(64), "2.0.23", "5002363") }
    }

    @Test
    fun `5002527 native tongue block is restricted and idempotent`() {
        val stock = fixture(MODERN_TONGUE_ORIGINAL, MODERN_TONGUE_LIBRARY_SIZE_5002527, MODERN_TONGUE_VADDR_5002527)
        val patched = patchModernTongueTransport(stock, "2.0.24", "5002527")
        val offset = MODERN_TONGUE_VADDR_5002527.toInt()
        assertEquals(0x143fdc, offset)
        assertContentEquals(MODERN_TONGUE_REPLACEMENT, patched.copyOfRange(offset, offset + MODERN_TONGUE_REPLACEMENT.size))
        assertContentEquals(stock.copyOfRange(0, offset), patched.copyOfRange(0, offset))
        assertContentEquals(stock.copyOfRange(offset + 24, stock.size), patched.copyOfRange(offset + 24, patched.size))
        assertContentEquals(patched, patchModernTongueTransport(patched, "2.0.24", "5002527"))
        assertContentEquals(stock, patchModernTongueTransport(stock, "2.0.23", "5002527"))
        assertContentEquals(stock, patchModernTongueTransport(stock, "2.0.24", "5002528"))
    }

    @Test
    fun `5002527 rejects unexpected native block and size without mutation`() {
        val malformed = fixture(ByteArray(24) { 0x55 }, MODERN_TONGUE_LIBRARY_SIZE_5002527, MODERN_TONGUE_VADDR_5002527)
        val before = malformed.copyOf()
        assertFailsWith<PatchException> { patchModernTongueTransport(malformed, "2.0.24", "5002527") }
        assertContentEquals(before, malformed)
        assertFailsWith<PatchException> { patchModernTongueTransport(ByteArray(64), "2.0.24", "5002527") }
        // Another base's block address is not valid for this base.
        val borrowed = fixture(MODERN_TONGUE_ORIGINAL, MODERN_TONGUE_LIBRARY_SIZE_5002527, MODERN_TONGUE_VADDR_5002395)
        assertFailsWith<PatchException> { patchModernTongueTransport(borrowed, "2.0.24", "5002527") }
    }

    @Test
    fun `previous bases keep their addresses and tongue block is shared`() {
        assertEquals(0x141c6cL, MODERN_TONGUE_VADDR_5002363)
        assertEquals(0x1433acL, MODERN_TONGUE_VADDR_5002395)
        assertEquals(24, MODERN_TONGUE_ORIGINAL.size)
        assertEquals(24, MODERN_TONGUE_REPLACEMENT.size)
        // Tongue only: the one shared 24-byte block touches FB2 slots 63..69 and nothing else.
        assertContentEquals(
            intArrayOf(0xa1, 0x42, 0xc0, 0x3d).map { it.toByte() }.toByteArray(),
            MODERN_TONGUE_REPLACEMENT.copyOfRange(0, 4),
        )
    }

    @Test
    fun `decoded 5002527 scene patches only the tongue block`() {
        val stock = decodedScene("2.0.24", "5002527")
        assertEquals(MODERN_TONGUE_LIBRARY_SIZE_5002527, stock.size)
        assertEquals(MODERN_TONGUE_STOCK_SHA256_5002527, sha256(stock))
        val offset = MODERN_TONGUE_VADDR_5002527.toInt()
        assertContentEquals(MODERN_TONGUE_ORIGINAL, stock.copyOfRange(offset, offset + 24))
        // Two independent anchors: the preceding FB2 store and the following size check.
        assertContentEquals(byteArrayOf(0xe0.toByte(), 0x3f, 0x41, 0xbd.toByte()), stock.copyOfRange(offset, offset + 4))
        val patched = patchModernTongueTransport(stock, "2.0.24", "5002527")
        val changed = stock.indices.filter { stock[it] != patched[it] }
        assertTrue(changed.isNotEmpty() && changed.all { it in offset until offset + 24 }, "changed=$changed")
        assertContentEquals(MODERN_TONGUE_REPLACEMENT, patched.copyOfRange(offset, offset + 24))
        assertContentEquals(patched, patchModernTongueTransport(patched, "2.0.24", "5002527"))
        // The original block occurs exactly once in the real renderer.
        var count = 0
        var index = stock.indexOfSubArray(MODERN_TONGUE_ORIGINAL, 0)
        while (index >= 0) { count++; index = stock.indexOfSubArray(MODERN_TONGUE_ORIGINAL, index + 1) }
        assertEquals(1, count)
    }

    private fun decodedScene(version: String, code: String): ByteArray {
        val relative = "android-steamlinkvr-release-base-$version-$code/lib/arm64-v8a/libvrlink_scene.so"
        val scene = listOf(File(relative), File("../$relative")).firstOrNull(File::isFile)
        assumeTrue("Real decoded-input audit BLOCKED: missing exact $version/$code scene", scene != null)
        return requireNotNull(scene).readBytes()
    }

    private fun sha256(bytes: ByteArray) =
        MessageDigest.getInstance("SHA-256").digest(bytes).joinToString("") { "%02x".format(it) }

    private fun ByteArray.indexOfSubArray(pattern: ByteArray, from: Int): Int {
        for (i in from..size - pattern.size) {
            if (pattern.indices.all { this[i + it] == pattern[it] }) return i
        }
        return -1
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
