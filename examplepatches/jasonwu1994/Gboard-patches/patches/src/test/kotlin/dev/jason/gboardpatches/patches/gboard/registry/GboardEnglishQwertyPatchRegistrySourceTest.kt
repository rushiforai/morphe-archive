package dev.jason.gboardpatches.patches.gboard.registry

import java.nio.charset.StandardCharsets
import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardEnglishQwertyPatchRegistrySourceTest {
    @Test
    fun registryRenamesEnglishPatchToUppercaseToggle() {
        val source = readSource()

        assertTrue(source.contains("val gboardEnglishQwertySlideUppercaseTogglePatch = resourcePatch("))
        assertTrue(source.contains("name = \"English QWERTY Up-Flick Uppercase\""))
        assertTrue(
            source.contains(
                "description = \"英文 QWERTY 鍵盤上滑大小寫\\n" +
                    "Flick up on the English QWERTY keyboard to toggle uppercase and lowercase.\""
            )
        )
        assertFalse(source.contains("name = \"English QWERTY Slide Uppercase Toggle\""))
        assertFalse(source.contains("name = \"English QWERTY Slide Symbols\""))
        assertFalse(source.contains("slide-up and slide-down symbol input"))
    }

    @Test
    fun englishPatchStillUsesExistingEnglishResourceAndSoftKeyImplementation() {
        val source = readSource()

        val patchStart = source.indexOf("val gboardEnglishQwertySlideUppercaseTogglePatch")
        val nextPatchStart = source.indexOf("val gboardZhuyinQuickTraditionalSimplifiedTogglePatch")
        assertTrue("English QWERTY patch missing", patchStart >= 0)
        assertTrue("Expected following patch boundary", nextPatchStart > patchStart)

        val patchBlock = source.substring(patchStart, nextPatchStart)
        assertTrue(patchBlock.contains("gboardAboutPageResourcePatch"))
        assertTrue(patchBlock.contains("gboardPatchesSettingsPatch"))
        assertTrue(patchBlock.contains("gboardEnglishUppercaseToggleFeatureMarkerPatch"))
        assertTrue(patchBlock.contains("gboardEnglishQwertySlideResourcePatch"))
        assertTrue(patchBlock.contains("gboardEnglishQwertySoftKeyPatch"))
        assertFalse(patchBlock.contains("gboardZhuyin"))
    }

    @Test
    fun englishPatchUsesInAppSettingsInsteadOfManagerPatchOptions() {
        val source = readSource()

        val patchStart = source.indexOf("val gboardEnglishQwertySlideUppercaseTogglePatch")
        val nextPatchStart = source.indexOf("val gboardZhuyinQuickTraditionalSimplifiedTogglePatch")
        assertTrue("English QWERTY patch missing", patchStart >= 0)
        assertTrue("Expected following patch boundary", nextPatchStart > patchStart)

        val patchBlock = source.substring(patchStart, nextPatchStart)
        assertFalse(patchBlock.contains("booleanOption("))
        assertFalse(patchBlock.contains("title = \"啟用英文鍵盤上滑大寫\""))
        assertFalse(patchBlock.contains("\"啟用\" to true"))
    }

    private fun readSource(): String =
        String(
            Files.readAllBytes(
                Path.of(
                    "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/registry/" +
                        "GboardPatchRegistry.kt"
                )
            ),
            StandardCharsets.UTF_8
        )
}
