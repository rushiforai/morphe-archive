package dev.jason.gboardpatches.patches.gboard.features.englishqwerty

import java.nio.charset.StandardCharsets
import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardEnglishQwertyPatchSourceTest {
    @Test
    fun resourcePatchOnlyDefinesEnglishSlideUpMetadata() {
        val source = readSource(
            "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/englishqwerty/" +
                "GboardEnglishQwertySlideResourcePatch.kt"
        )

        assertTrue(source.contains("type = \"SLIDE_UP\""))
        assertTrue(source.contains("resolveEnglishSlideUpValue(key.getAttribute(\"press_data\"))"))
        assertFalse(source.contains("type = \"SLIDE_DOWN\""))
        assertFalse(source.contains("template.setAttribute(\"layout\""))
        assertFalse(source.contains("ENGLISH_SLIDE_DOWN_MAP"))
        assertFalse(source.contains("setFooterLabelValue"))
        assertFalse(source.contains("resolveEnglishSlideDownValue"))
        assertFalse(source.contains("slidedown_data"))
    }

    @Test
    fun softKeyPatchOnlyBuildsUppercaseToggleWithoutEnglishHintOrSlideDown() {
        val source = readSource(
            "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/englishqwerty/" +
                "GboardEnglishQwertySoftKeyPatch.kt"
        )

        assertTrue(source.contains("jasondevToggleAsciiCase"))
        assertTrue(source.contains("sget-object v6, Lnxi;->c:Lnxi;"))
        assertFalse(source.contains("jasondevResolveEnglishSlideDown"))
        assertFalse(source.contains("jasondevSyncSyntheticEnglishHint"))
        assertFalse(source.contains("jasondevSyncEnglishHintView"))
        assertFalse(source.contains("Lnxi;->d:Lnxi;"))
        assertFalse(source.contains("0x7f0b060f"))
    }

    @Test
    fun softKeyPatchFailsClosedAndReturnsOriginalMetadataOnRuntimeError() {
        val source = readSource(
            "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/englishqwerty/" +
                "GboardEnglishQwertySoftKeyPatch.kt"
        )

        assertTrue(source.contains(".catch Ljava/lang/Throwable;"))
        assertTrue(source.contains(":catch_0"))
        assertTrue(source.contains(":cond_return_original"))
        assertTrue(source.contains("return-object p1"))
    }

    private fun readSource(relativePath: String): String =
        String(Files.readAllBytes(Path.of(relativePath)), StandardCharsets.UTF_8)
}
