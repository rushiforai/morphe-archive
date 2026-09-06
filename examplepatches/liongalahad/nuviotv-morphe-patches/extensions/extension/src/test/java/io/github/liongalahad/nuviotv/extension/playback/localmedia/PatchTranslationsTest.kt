package io.github.liongalahad.nuviotv.extension.playback.localmedia

import org.junit.Assert.*
import org.junit.Test
import java.util.Locale

class PatchTranslationsTest {
    @Test fun `all translated settings preserve formatting arguments and contain text`() {
        val entries = PatchTranslations.ENTRIES
        assertEquals(entries.size, entries.map { it[0] }.toSet().size)
        val placeholders = Regex("%[-+0-9.$]*[sdf%]")
        for (entry in entries) {
            assertEquals(10, entry.size)
            val expected = placeholders.findAll(entry[0]).map { it.value }.sorted().toList()
            for (text in entry.drop(1)) {
                assertTrue("Missing translation for ${entry[0]}", text.isNotBlank())
                assertFalse(text.contains("\uFFFD"))
                assertEquals("Formatting mismatch for ${entry[0]}", expected,
                    placeholders.findAll(text).map { it.value }.sorted().toList())
            }
        }
    }
}
