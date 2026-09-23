package dev.jason.gboardpatches.patches.gboard.features.customtheme

import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardCustomThemeAssetsPatchTest {
    @Test
    fun `mpp embeds catalog but not remote preview images`() {
        val root = Path.of("src/main/resources/custom-theme-assets")
        val files = Files.walk(root).use { paths ->
            paths.filter(Files::isRegularFile)
                .map { path -> root.relativize(path).toString().replace('\\', '/') }
                .sorted()
                .toList()
        }

        assertEquals(listOf("catalog.json"), files)
        assertFalse(Files.exists(root.resolve("previews")))
        val source = Files.readString(Path.of(
            "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/customtheme/" +
                "GboardCustomThemeAssetsPatch.kt"
        ))
        assertTrue(source.contains("assets/gboard-custom-themes/\$relativePath"))
        assertFalse(source.contains("index.txt"))
    }
}
