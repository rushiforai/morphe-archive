package dev.jason.gboardpatches.patches.gboard.features.englishqwerty

import java.nio.charset.StandardCharsets
import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardEnglishQwertyToggleRuntimeSourceTest {
    @Test
    fun disabledToggleReturnsIncomingMetadataWithoutStrippingStockActions() {
        val source = readSource()
        val patchBody = helperBody(source, "PATCH_INCOMING_METADATA_BODY")

        assertTrue(patchBody.contains("->isEnabled()Z"))
        assertTrue(patchBody.contains("if-eqz v0, :cond_return_original_safe"))
        assertFalse(source.contains("jasondevStripSlideUpAction"))
        assertFalse(source.contains("STRIP_SLIDE_UP_ACTION_BODY"))
        assertFalse(source.contains("Ljava/util/EnumMap;->remove"))
    }

    @Test
    fun softKeyPatchDoesNotInstallARedundantRuntimeToggleWrapper() {
        val source = readSource()

        assertFalse(source.contains("jasondevIsEnglishUppercaseToggleEnabled"))
        assertFalse(source.contains("IS_ENGLISH_UPPERCASE_TOGGLE_ENABLED_BODY"))
    }

    private fun helperBody(source: String, name: String): String =
        Regex(
            "private val $name = " + "\"\"\"" + "(.*?)" + "\"\"\"",
            setOf(RegexOption.DOT_MATCHES_ALL)
        ).find(source)?.groupValues?.get(1) ?: error("$name body not found")

    private fun readSource(): String =
        String(
            Files.readAllBytes(
                Path.of(
                    "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/englishqwerty/" +
                        "GboardEnglishQwertySoftKeyPatch.kt"
                )
            ),
            StandardCharsets.UTF_8
        )
}
