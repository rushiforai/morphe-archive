package dev.jason.gboardpatches.patches.gboard.features.zhuyinslide

import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardZhuyinSlidePatchShapeTest {
    @Test
    fun `active slide patch is bind time only and contains no resource mutation`() {
        val featureDir = Path.of(
            "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/zhuyinslide"
        )
        val sources = Files.list(featureDir).use { paths ->
            paths.filter { path -> path.fileName.toString().endsWith(".kt") }
                .map(Files::readString)
                .toList()
                .joinToString("\n")
        }

        assertFalse(Files.exists(featureDir.resolve("GboardZhuyinSlideResourcePatch.kt")))
        listOf(
            "xml_0x7f17117a", "xml_0x7f171179", "slideup_data", "slidedown_data",
            "ensureTemplateAction", "setAttribute("
        ).forEach { stale -> assertFalse("Found active resource mutation $stale", sources.contains(stale)) }
        assertTrue(sources.contains("GboardVersionBindings.softKeyBind"))
    }

    @Test
    fun `softkey delegate recognizes every existing metadata rewrite and runs last`() {
        val source = readSource("GboardZhuyinSlideSoftKeyPatch.kt")

        assertTrue(source.contains("TOP_ROW_SWIPE_RUNTIME_CLASS"))
        assertTrue(source.contains("ZHUYIN_TOGGLE_RUNTIME_CLASS"))
        assertTrue(source.contains("ENGLISH_UPPERCASE_TOGGLE_RUNTIME_IS_ENABLED"))
        assertTrue(source.contains("patchIncomingSoftKeyMetadata"))
        assertTrue(source.contains("jasondevPatchIncomingMetadata"))
        assertTrue(source.contains("maxOf("))
        assertTrue(source.contains("mutableMethod.addInstructions(insertIndex"))
        assertTrue(source.contains("ZHUYIN_SLIDE_RUNTIME_PATCH_INCOMING_SOFT_KEY_METADATA"))
    }

    @Test
    fun `public registry depends on extension bind and pointer patches without resource patch`() {
        val registry = Files.readString(Path.of(
            "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/registry/GboardPatchRegistry.kt"
        )).replace("\r\n", "\n")
        val start = registry.indexOf("val gboardZhuyinSlideInputPatch")
        val end = registry.indexOf("val gboardEnglishQwertySlideUppercaseTogglePatch", start)
        assertTrue(start >= 0 && end > start)
        val block = registry.substring(start, end)

        assertTrue(block.contains("gboardPatchesExtensionCarrierPatch"))
        assertTrue(block.contains("gboardZhuyinSlideSoftKeyPatch"))
        assertTrue(block.contains("gboardZhuyinSlidePointerAnchorPatch"))
        assertFalse(block.contains("gboardZhuyinSlideResourcePatch"))
    }

    private fun readSource(fileName: String): String = Files.readString(Path.of(
        "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/zhuyinslide/$fileName"
    )).replace("\r\n", "\n")
}
