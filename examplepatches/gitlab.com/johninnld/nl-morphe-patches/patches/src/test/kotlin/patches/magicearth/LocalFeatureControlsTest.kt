package patches.magicearth

import org.junit.Assert.*
import org.junit.Assume.assumeNotNull
import org.junit.Test
import java.io.File
import java.nio.ByteBuffer
import java.nio.ByteOrder

class LocalFeatureControlsTest {
    private fun original(): ByteArray {
        val file = System.getenv("MAGIC_EARTH_ORIGINAL_ARM64_LIBAPP")
        assumeNotNull(file)
        return File(file!!).readBytes()
    }

    private fun instruction(bytes: ByteArray, offset: Int) =
        ByteBuffer.wrap(bytes, offset, 4).order(ByteOrder.LITTLE_ENDIAN).int

    private fun branchTarget(bytes: ByteArray, offset: Int): Int {
        val word = instruction(bytes, offset)
        assertEquals(0x14000000, word and 0xfc000000.toInt())
        return offset + ((word shl 6) shr 4)
    }

    @Test fun changesOnlyAuditedInstructionsAndUsesExistingAsyncReturnPaths() {
        val input = original()
        val before = input.copyOf()
        val output = enableLocalFeatureControls(input)
        assertArrayEquals(before, input)
        assertEquals(input.size, output.size)
        val widgetEntries = listOf(0xbb5d44, 0xde0f4c, 0xc1e2c4, 0xc1e90c)
        val allowed = (listOf(0xb96f40, 0xb79628, 0xb79630, 0xba9270).flatMap { it until it + 4 } +
            widgetEntries.flatMap { it until it + 20 }).toSet()
        for (entry in widgetEntries) {
            assertEquals(0xa9bf79fd.toInt(), instruction(output, entry)) // Dart SP frame, not native SP.
            assertEquals(0xaa0f03fd.toInt(), instruction(output, entry + 4))
            val call = instruction(output, entry + 8)
            assertEquals(0x94000000.toInt(), call and 0xfc000000.toInt())
            assertEquals(0x73b200, entry + 8 + ((call shl 6) shr 4))
            assertEquals(0xa8c179fd.toInt(), instruction(output, entry + 12))
            assertEquals(0xd65f03c0.toInt(), instruction(output, entry + 16))
        }
        assertTrue(input.indices.filter { input[it] != output[it] }.all { it in allowed })
        assertEquals(0xb96f58, branchTarget(output, 0xb96f40))
        assertEquals(0xba9294, branchTarget(output, 0xba9270))
        assertEquals(0xd503201f.toInt(), instruction(output, 0xb79628))
        assertEquals(0xd503201f.toInt(), instruction(output, 0xb79630))
        assertThrows(IllegalStateException::class.java) { enableLocalFeatureControls(output) }
    }

    @Test fun rejectsChangedImagesWithoutMutatingInput() {
        val changed = original().also { it[0x1000] = (it[0x1000].toInt() xor 1).toByte() }
        val before = changed.copyOf()
        assertThrows(IllegalStateException::class.java) { enableLocalFeatureControls(changed) }
        assertArrayEquals(before, changed)
        assertThrows(IllegalStateException::class.java) { enableLocalFeatureControls(changed.copyOf(64)) }
    }
}
