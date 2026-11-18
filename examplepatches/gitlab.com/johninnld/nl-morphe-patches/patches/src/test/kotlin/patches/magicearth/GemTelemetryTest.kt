package patches.magicearth

import org.junit.Assert.*
import org.junit.Assume.assumeNotNull
import org.junit.Test
import java.io.File
import java.nio.ByteBuffer
import java.nio.ByteOrder

class GemTelemetryTest {
    private fun original(): ByteArray {
        val path = System.getenv("MAGIC_EARTH_ORIGINAL_ARM64_GEM")
        assumeNotNull(path)
        return File(path!!).readBytes()
    }

    @Test fun suppressesOnlyTracedDispatchCallsAndPreservesInitialization() {
        val input = original()
        val before = input.copyOf()
        val output = withoutGemTelemetryDispatch(input)
        assertArrayEquals(before, input)
        val dispatches = listOf(0x10b4a28, 0x10cc964, 0x10bc464)
        val allowed = dispatches.flatMap { it until it + 4 }.toSet()
        assertEquals(input.size, output.size)
        assertTrue(input.indices.filter { input[it] != output[it] }.all { it in allowed })
        for (offset in dispatches) {
            val old = ByteBuffer.wrap(input, offset, 4).order(ByteOrder.LITTLE_ENDIAN).int
            assertEquals(0x94000000.toInt(), old and 0xfc000000.toInt())
            assertEquals(0x10c635c, offset + ((old shl 6) shr 4))
            val current = ByteBuffer.wrap(output, offset, 4).order(ByteOrder.LITTLE_ENDIAN).int
            assertEquals(0xd503201f.toInt(), current)
        }
        // Keep the required object's factory and its initializer prologue byte-identical.
        assertArrayEquals(input.copyOfRange(0x10cc258, 0x10cc354), output.copyOfRange(0x10cc258, 0x10cc354))
        assertArrayEquals(input.copyOfRange(0x10cc354, 0x10cc450), output.copyOfRange(0x10cc354, 0x10cc450))
        assertThrows(IllegalStateException::class.java) { withoutGemTelemetryDispatch(output) }
    }

    @Test fun rejectsChangedAndTruncatedInputs() {
        val input = original().also { it[0x1000] = (it[0x1000].toInt() xor 1).toByte() }
        val before = input.copyOf()
        assertThrows(IllegalStateException::class.java) { withoutGemTelemetryDispatch(input) }
        assertArrayEquals(before, input)
        assertThrows(IllegalStateException::class.java) { withoutGemTelemetryDispatch(input.copyOf(64)) }
    }
}
