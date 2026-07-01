package dev.jason.gboardpatches.patches.gboard.features.englishqwerty

import java.nio.charset.StandardCharsets
import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardEnglishQwertyToggleRuntimeSourceTest {
    @Test
    fun softKeyPatchConsultsRuntimeToggleAndRemovesSlideUpActionWhenDisabled() {
        val source = readSource(
            "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/englishqwerty/" +
                "GboardEnglishQwertySoftKeyPatch.kt"
        )

        assertTrue(source.contains("GboardEnglishUppercaseToggleRuntime"))
        assertTrue(source.contains("jasondevIsEnglishUppercaseToggleEnabled"))
        assertTrue(source.contains("jasondevStripSlideUpAction"))
        assertTrue(source.contains("Ljava/util/EnumMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;"))
        assertTrue(source.contains("sget-object v6, Lnxi;->c:Lnxi;"))
    }

    @Test
    fun staticToggleHelperUsesLocalRegisterForRuntimeFlag() {
        val source = readSource(
            "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/englishqwerty/" +
                "GboardEnglishQwertySoftKeyPatch.kt"
        )
        val helperBody = Regex(
            """private val IS_ENGLISH_UPPERCASE_TOGGLE_ENABLED_BODY = """ + "\"\"\"" + """(.*?)""" + "\"\"\"",
            setOf(RegexOption.DOT_MATCHES_ALL)
        ).find(source)?.groupValues?.get(1) ?: error("toggle helper body not found")

        assertTrue(helperBody.contains("move-result v0"))
        assertTrue(helperBody.contains("return v0"))
        assertFalse(helperBody.contains("move-result p0"))
        assertFalse(helperBody.contains("return p0"))
    }

    private fun readSource(relativePath: String): String =
        String(Files.readAllBytes(Path.of(relativePath)), StandardCharsets.UTF_8)
}
