package util

import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertFalse
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

class PatchListGeneratorTest {

    @TempDir
    lateinit var tempDir: File

    @Test
    fun `replaces the output without leaving a temporary file`() {
        val output = File(tempDir, "patches-list.json")
        output.writeText("""{"old":true}""")

        writePatchListAtomically(output, """{"new":true}""")

        assertEquals("""{"new":true}""", output.readText())
        assertEquals(listOf(output.name), tempDir.list()?.toList())
    }

    @Test
    fun `creates missing output directories`() {
        val output = File(tempDir, "generated/patches-list.json")

        writePatchListAtomically(output, """{"patches":[]}""")

        assertEquals("""{"patches":[]}""", output.readText())
        assertFalse(File(tempDir, "generated").listFiles().orEmpty().any { it.extension == "tmp" })
    }
}
