package app.aidan.patches.shared

import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.security.MessageDigest
import org.junit.Assert.assertArrayEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

class HermesBundleEditorBoundsTest {
    private fun minimalBundle(version: Int = 98): ByteArray {
        val data = ByteArray(128)
        val buffer = ByteBuffer.wrap(data).order(ByteOrder.LITTLE_ENDIAN)
        buffer.putLong(0, HERMES_MAGIC)
        buffer.putInt(8, version)
        buffer.putInt(40, 0) // functionCount
        buffer.putInt(44, 0) // stringKindCount
        buffer.putInt(48, 0) // idCount
        buffer.putInt(52, 0) // stringCount
        buffer.putInt(56, 0) // overflowStringCount
        buffer.putInt(60, 0) // stringStorageSize
        return data
    }

    @Test
    fun `matchesBytes accepts an exact end-of-buffer range`() {
        val editor = HermesBundleEditor(minimalBundle())

        assertTrue(editor.matchesBytes(126, byteArrayOf(0, 0)))
        assertFalse(editor.matchesBytes(127, byteArrayOf(0, 0)))
    }

    @Test
    fun `matchesBytes rejects negative and overflowing offsets without throwing`() {
        val editor = HermesBundleEditor(minimalBundle())

        assertFalse(editor.matchesBytes(-1, byteArrayOf(0)))
        assertFalse(editor.matchesBytes(Int.MAX_VALUE, byteArrayOf(0)))
    }

    @Test
    fun `patchBytesIfMatches writes an exact end-of-buffer range`() {
        val data = minimalBundle()
        val editor = HermesBundleEditor(data)

        editor.patchBytesIfMatches(126, byteArrayOf(0, 0), byteArrayOf(1, 2))

        assertArrayEquals(byteArrayOf(1, 2), data.copyOfRange(126, 128))
    }

    @Test
    fun `patchBytesIfMatches rejects an out-of-range write without mutating`() {
        val data = minimalBundle()
        val editor = HermesBundleEditor(data)

        val error = assertThrows(IllegalArgumentException::class.java) {
            editor.patchBytesIfMatches(127, byteArrayOf(0, 0), byteArrayOf(1, 2))
        }

        assertTrue(error.message.orEmpty().contains("Patch range"))
        assertArrayEquals(byteArrayOf(0, 0), data.copyOfRange(126, 128))
    }

    @Test
    fun `patchBytes rejects negative and overflowing offsets`() {
        val editor = HermesBundleEditor(minimalBundle())

        assertThrows(IllegalArgumentException::class.java) {
            editor.patchBytes(-1, byteArrayOf(1))
        }
        assertThrows(IllegalArgumentException::class.java) {
            editor.patchBytes(Int.MAX_VALUE, byteArrayOf(1))
        }
    }

    @Test
    fun `updateFooterHash writes the SHA-1 of the preceding bytes`() {
        val data = minimalBundle()
        val editor = HermesBundleEditor(data)
        val expected = MessageDigest.getInstance("SHA-1")
            .digest(data.copyOfRange(0, data.size - 20))

        editor.updateFooterHash()

        assertArrayEquals(expected, data.copyOfRange(data.size - 20, data.size))
    }

    @Test
    fun `constructor rejects unsupported Hermes versions`() {
        assertThrows(IllegalArgumentException::class.java) {
            HermesBundleEditor(minimalBundle(version = 97))
        }
    }

    private companion object {
        const val HERMES_MAGIC = 0x1f1903c103bc1fc6L
    }
}
