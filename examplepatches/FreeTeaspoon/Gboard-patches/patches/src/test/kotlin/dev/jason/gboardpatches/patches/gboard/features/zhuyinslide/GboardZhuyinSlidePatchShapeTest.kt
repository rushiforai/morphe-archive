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
        assertTrue(sources.contains("GboardSoftKeyFamilyFeature.ZHUYIN_SLIDE"))
    }

    @Test
    fun `softkey contribution leaves parity ordering to the family composer`() {
        val source = readSource("GboardZhuyinSlideSoftKeyPatch.kt")

        assertTrue(source.contains("GboardSoftKeyFamilyFeature.ZHUYIN_SLIDE"))
        assertTrue(source.contains("gboardSoftKeyFamilyFeaturePatch"))
        assertFalse(source.contains("maxOf("))
        assertFalse(source.contains("addInstructions"))
    }

    @Test
    fun `public registry depends on extension bind and pointer patches without resource patch`() {
        val registry = Files.readString(Path.of(
            "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/registry/GboardPatchRegistry.kt"
        )).replace("\r\n", "\n")
        val wiring = Files.readString(Path.of(
            "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/registry/" +
                "GboardContributionWiring.kt"
        )).replace("\r\n", "\n")
        val start = registry.indexOf("val gboardZhuyinSlideInputPatch")
        val end = registry.indexOf("val gboardEnglishQwertySlideUppercaseTogglePatch", start)
        assertTrue(start >= 0 && end > start)
        val block = registry.substring(start, end)

        assertTrue(block.contains("gboardPatchesExtensionCarrierPatch"))
        assertTrue(wiring.contains("gboardZhuyinSlideSoftKeyPatch"))
        assertTrue(wiring.contains("gboardZhuyinSlidePointerAnchorPatch"))
        assertFalse(block.contains("gboardZhuyinSlideResourcePatch"))
    }

    private fun readSource(fileName: String): String = Files.readString(Path.of(
        "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/zhuyinslide/$fileName"
    )).replace("\r\n", "\n")
}
