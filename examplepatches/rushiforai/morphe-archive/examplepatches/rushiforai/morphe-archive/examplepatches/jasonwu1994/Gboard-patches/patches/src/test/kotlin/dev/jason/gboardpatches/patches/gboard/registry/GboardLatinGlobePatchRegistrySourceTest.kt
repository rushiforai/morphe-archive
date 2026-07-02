package dev.jason.gboardpatches.patches.gboard.registry

import java.nio.charset.StandardCharsets
import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardLatinGlobePatchRegistrySourceTest {
    @Test
    fun registryDefinesIndependentLatinGlobePatch() {
        val source = String(
            Files.readAllBytes(
                Path.of(
                    "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/registry/" +
                        "GboardPatchRegistry.kt"
                )
            ),
            StandardCharsets.UTF_8
        )

        assertTrue(source.contains("val gboardLatinGlobeKeyIgnoreIntervalPatch = resourcePatch("))
        assertTrue(source.contains("name = \"Latin Globe Key Ignore Interval\""))
        assertTrue(source.contains("gboardPatchesSettingsPatch"))
        assertTrue(source.contains("gboardLatinGlobeKeyIgnoreIntervalFeatureMarkerPatch"))
        assertTrue(source.contains("gboardLatinGlobeKeyIgnoreIntervalBytecodePatch"))
        assertTrue(source.contains("default = true"))
    }

    @Test
    fun latinGlobePatchStaysIndependentFromOtherKeyboardFeatures() {
        val source = String(
            Files.readAllBytes(
                Path.of(
                    "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/registry/" +
                        "GboardPatchRegistry.kt"
                )
            ),
            StandardCharsets.UTF_8
        )

        val patchStart = source.indexOf("val gboardLatinGlobeKeyIgnoreIntervalPatch")
        val nextPatchStart = source.indexOf("val gboardPackageRenamePatch")
        assertTrue("Latin globe patch missing", patchStart >= 0)
        assertTrue("Expected following patch boundary", nextPatchStart > patchStart)

        val latinGlobeBlock = source.substring(patchStart, nextPatchStart)
        assertFalse(
            "Latin globe patch should not absorb clipboard implementation",
            latinGlobeBlock.contains("gboardClipboard")
        )
        assertFalse(
            "Latin globe patch should not absorb symbol footer implementation",
            latinGlobeBlock.contains("gboardSymbolFooterOrder")
        )
    }
}
