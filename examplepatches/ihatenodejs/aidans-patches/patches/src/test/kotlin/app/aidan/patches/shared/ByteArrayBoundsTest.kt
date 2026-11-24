package app.aidan.patches.shared

import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class ByteArrayBoundsTest {
    @Test
    fun `range ending at exact end is valid`() {
        val bytes = ByteArray(4)

        assertTrue(bytes.hasRange(0, 4))
        assertTrue(bytes.hasRange(4, 0))
        assertTrue(bytes.hasRange(2, 2))
    }

    @Test
    fun `range beyond the end is invalid`() {
        val bytes = ByteArray(4)

        assertFalse(bytes.hasRange(3, 2))
        assertFalse(bytes.hasRange(5, 0))
        assertFalse(bytes.hasRange(4, 1))
    }

    @Test
    fun `negative or overflowed offsets are invalid`() {
        val bytes = ByteArray(4)

        assertFalse(bytes.hasRange(-1, 1))
        assertFalse(bytes.hasRange(Int.MIN_VALUE, 1))
        assertFalse(bytes.hasRange(Int.MAX_VALUE, 1))
        assertFalse(bytes.hasRange(0, Int.MAX_VALUE))
        assertFalse(bytes.hasRange(0, -1))
    }

    @Test
    fun `matchesAt accepts exact end and rejects out of range`() {
        val bytes = byteArrayOf(1, 2, 3, 4)

        assertTrue(bytes.matchesAt(2, byteArrayOf(3, 4)))
        assertFalse(bytes.matchesAt(2, byteArrayOf(3, 4, 5)))
        assertFalse(bytes.matchesAt(5, ByteArray(0)))
        assertFalse(bytes.matchesAt(Int.MAX_VALUE, byteArrayOf(4)))
        assertFalse(bytes.matchesAt(-1, byteArrayOf(1)))
    }
}
