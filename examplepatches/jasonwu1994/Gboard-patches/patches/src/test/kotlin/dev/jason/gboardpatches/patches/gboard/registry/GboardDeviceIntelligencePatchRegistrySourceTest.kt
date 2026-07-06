package dev.jason.gboardpatches.patches.gboard.registry

import java.nio.charset.StandardCharsets
import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardDeviceIntelligencePatchRegistrySourceTest {
    @Test
    fun registryDefinesDedicatedDeviceIntelligencePatch() {
        val source = String(
            Files.readAllBytes(
                Path.of(
                    "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/registry/" +
                        "GboardPatchRegistry.kt"
                )
            ),
            StandardCharsets.UTF_8
        )

        assertTrue(source.contains("val gboardDeviceIntelligencePatch = resourcePatch("))
        assertTrue(source.contains("name = \"Enable Inline Autofill Suggestions\""))
        assertTrue(
            source.contains(
                "description = \"啟用內嵌自動填入建議 / Enable Inline Autofill Suggestions\""
            )
        )
        assertTrue(source.contains("default = true"))
        assertTrue(source.contains("gboardFeatureFlagsBytecodePatch"))
        assertTrue(source.contains("gboardDeviceIntelligenceFeatureMarkerPatch"))
    }
}
