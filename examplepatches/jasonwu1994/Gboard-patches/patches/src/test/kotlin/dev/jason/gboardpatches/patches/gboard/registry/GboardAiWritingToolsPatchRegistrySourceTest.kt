package dev.jason.gboardpatches.patches.gboard.registry

import java.nio.charset.StandardCharsets
import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardAiWritingToolsPatchRegistrySourceTest {
    @Test
    fun registryDefinesDedicatedAiWritingToolsPatch() {
        val source = String(
            Files.readAllBytes(
                Path.of(
                    "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/registry/" +
                        "GboardPatchRegistry.kt"
                )
            ),
            StandardCharsets.UTF_8
        )

        assertTrue(source.contains("val gboardAiWritingToolsPatch = resourcePatch("))
        assertTrue(source.contains("name = \"AI Writing Tools\""))
        assertTrue(source.contains("description = \"啟用 AI 撰寫工具，支援所有語言\\nEnable AI writing tools with support for all languages.\""))
        assertTrue(source.contains("default = true"))
        assertTrue(source.contains("gboardAiWritingToolsFeatureMarkerPatch"))
        assertTrue(source.contains("gboardAiWritingToolsSettingsVisibilityPatch"))
        assertTrue(source.contains("gboardAiWritingToolsFlagValuePatch"))
        assertTrue(source.contains("gboardAiWritingToolsSignalPatch"))
        assertTrue(source.contains("gboardAiWritingToolsOfficialPreferencesPatch"))
        assertTrue(source.contains("gboardAiWritingToolsDependencyPatch"))
        assertFalse(source.contains("gboardAiWritingToolsTracePatch"))
    }

    @Test
    fun aiWritingToolsPatchUsesDedicatedFamilyInsteadOfGenericFeatureflagsOnly() {
        val source = String(
            Files.readAllBytes(
                Path.of(
                    "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/registry/" +
                        "GboardPatchRegistry.kt"
                )
            ),
            StandardCharsets.UTF_8
        )

        val patchStart = source.indexOf("val gboardAiWritingToolsPatch")
        val nextPatchStart = source.indexOf("val gboardSettingsHomepagePatch")
        assertTrue("AI Writing Tools patch missing", patchStart >= 0)
        assertTrue("Expected following patch boundary", nextPatchStart > patchStart)

        val aiWritingToolsBlock = source.substring(patchStart, nextPatchStart)
        assertFalse(
            "AI Writing Tools patch should not fall back to the generic featureflags patch only",
            aiWritingToolsBlock.contains("gboardFeatureFlagsBytecodePatch")
        )
        assertFalse(
            "AI Writing Tools patch should not depend on the debug trace patch in public builds",
            aiWritingToolsBlock.contains("gboardAiWritingToolsTracePatch")
        )
    }
}
