package dev.jason.gboardpatches.patches.gboard.registry

import java.nio.charset.StandardCharsets
import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardZhuyinBottomRowPatchRegistrySourceTest {
    @Test
    fun registryDefinesIndependentZhuyinBottomRowPatch() {
        val source = String(
            Files.readAllBytes(
                Path.of(
                    "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/registry/" +
                        "GboardPatchRegistry.kt"
                )
            ),
            StandardCharsets.UTF_8
        )

        assertTrue(source.contains("val gboardZhuyinBottomRowWeightPatch = resourcePatch("))
        assertTrue(source.contains("name = \"Zhuyin Bottom Row Key Sizes\""))
        assertTrue(source.contains("gboardPatchesSettingsPatch"))
        assertTrue(source.contains("gboardZhuyinBottomRowWeightFeatureMarkerPatch"))
        assertTrue(source.contains("gboardZhuyinBottomRowWeightSoftKeyPatch"))
    }

    @Test
    fun zhuyinBottomRowPatchStaysIndependentFromOtherKeyboardFamilies() {
        val source = String(
            Files.readAllBytes(
                Path.of(
                    "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/registry/" +
                        "GboardPatchRegistry.kt"
                )
            ),
            StandardCharsets.UTF_8
        )

        val patchStart = source.indexOf("val gboardZhuyinBottomRowWeightPatch")
        val nextPatchStart = source.indexOf("val gboardPackageRenamePatch")
        assertTrue("Zhuyin bottom row patch missing", patchStart >= 0)
        assertTrue("Expected following patch boundary", nextPatchStart > patchStart)

        val patchBlock = source.substring(patchStart, nextPatchStart)
        assertFalse(patchBlock.contains("gboardTopRowSwipe"))
        assertFalse(patchBlock.contains("gboardClipboard"))
    }
}
