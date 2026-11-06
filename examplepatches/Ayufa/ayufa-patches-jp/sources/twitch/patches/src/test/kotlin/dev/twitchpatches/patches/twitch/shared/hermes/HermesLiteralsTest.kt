package dev.twitchpatches.patches.twitch.shared.hermes

import java.nio.ByteBuffer
import java.nio.ByteOrder
import org.junit.Assert.*
import org.junit.Test

class HermesLiteralsTest {
    @Test fun objectShapePairsBooleanAndStringAcrossSerializedRuns() {
        val bytes = ByteArray(64)
        bytes[0] = 0x21; bytes[1] = 0x51; bytes[2] = 2
        bytes[8] = 0x52; bytes[9] = 0; bytes[11] = 1
        ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN).putInt(16, 0).putInt(20, 2)
        val reader = HermesLiterals(bytes, listOf("success", "error", "fixture no-fill"))
        assertEquals(mapOf("success" to false, "error" to "fixture no-fill"),
            reader.objectAt(0, 4, 8, 5, 16, 1, 0, 0))
    }

    @Test fun malformedOffsetsRunsAndStringReferencesFailClosed() {
        val bytes = ByteArray(64)
        val reader = HermesLiterals(bytes, listOf("fixture"))
        assertThrows(IllegalArgumentException::class.java) { reader.read(0, 4, 5, 1) }
        assertThrows(IllegalArgumentException::class.java) { reader.read(0, 4, 0, 1) }
        bytes[0] = 0x51; bytes[1] = 9
        assertThrows(IllegalArgumentException::class.java) { reader.read(0, 3, 0, 1) }
        assertThrows(IllegalArgumentException::class.java) { reader.read(0, 2, 0, 1) }
    }

    @Test fun extendedRunsAndUndefinedTagDoNotConsumeStringPayloadBytes() {
        val bytes = ByteArray(64)
        bytes[0] = 0xe0.toByte(); bytes[1] = 16; bytes[2] = 0x11
        val result = HermesLiterals(bytes, emptyList()).read(0, 3, 0, 17)
        assertEquals(17, result.size)
        assertEquals(true, result.last())
    }
}
