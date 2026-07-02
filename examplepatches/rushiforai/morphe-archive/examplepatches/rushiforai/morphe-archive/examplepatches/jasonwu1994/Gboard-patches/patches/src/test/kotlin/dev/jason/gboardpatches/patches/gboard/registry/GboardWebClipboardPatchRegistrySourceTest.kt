package dev.jason.gboardpatches.patches.gboard.registry

import java.nio.charset.StandardCharsets
import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardWebClipboardPatchRegistrySourceTest {
    @Test
    fun registryDefinesIndependentWebClipboardPatch() {
        val source = String(
            Files.readAllBytes(
                Path.of(
                    "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/registry/" +
                        "GboardPatchRegistry.kt"
                )
            ),
            StandardCharsets.UTF_8
        )

        assertTrue(source.contains("val gboardWebClipboardPatch = resourcePatch("))
        assertTrue(source.contains("name = \"Web Clipboard\""))
        assertTrue(source.contains("快速設定開關"))
        assertTrue(source.contains("default = true"))
        assertTrue(source.contains("gboardPatchesSettingsPatch"))
        assertTrue(source.contains("gboardWebClipboardFeatureMarkerPatch"))
        assertTrue(source.contains("gboardWebClipboardManifestPatch"))
        assertTrue(source.contains("gboardWebClipboardAssetsPatch"))
        assertTrue(source.contains("gboardWebClipboardCapturePatch"))
    }

    @Test
    fun clipboardEnhancementsStaysSeparateFromWebClipboard() {
        val source = String(
            Files.readAllBytes(
                Path.of(
                    "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/registry/" +
                        "GboardPatchRegistry.kt"
                )
            ),
            StandardCharsets.UTF_8
        )

        val enhancementsStart = source.indexOf("val gboardClipboardEnhancementsPatch")
        val webClipboardStart = source.indexOf("val gboardWebClipboardPatch")
        assertTrue("Clipboard Enhancements patch missing", enhancementsStart >= 0)
        assertTrue("Web Clipboard patch missing", webClipboardStart >= 0)

        val enhancementsBlock = source.substring(enhancementsStart, webClipboardStart)
        assertTrue(enhancementsBlock.contains("name = \"Clipboard Enhancements\""))
        assertFalse(
            "Clipboard Enhancements should not absorb Web Clipboard implementation",
            enhancementsBlock.contains("gboardWebClipboard")
        )
    }
}
