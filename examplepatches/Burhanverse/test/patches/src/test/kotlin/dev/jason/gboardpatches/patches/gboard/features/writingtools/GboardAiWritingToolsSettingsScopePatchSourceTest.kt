package dev.jason.gboardpatches.patches.gboard.features.writingtools

import java.nio.charset.StandardCharsets
import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardAiWritingToolsSettingsScopePatchSourceTest {
    @Test
    fun `production constants and settings patch use only 1777 targets`() {
        val constants = readSource("GboardAiWritingToolsPatchConstants.kt")
        val settings = readSource("GboardAiWritingToolsSettingsVisibilityPatch.kt")

        assertTrue(constants.contains("SIGNAL_GATE_CLASS = \"Lpel;\""))
        assertTrue(constants.contains("SIGNAL_MARKER_CLASS = \"Lpei;\""))
        assertTrue(constants.contains("PREFERENCE_MANAGER_CLASS = \"Lpnp;\""))
        assertTrue(constants.contains("SETTINGS_CONTROLLER_CLASS = \"Leqn;\""))
        assertTrue(constants.contains("PREFERENCE_WRAPPER_CLASS = \"Lptc;\""))
        assertTrue(settings.contains("applyWritingToolsSettingsControllerScope()"))
        assertTrue(settings.contains("applyWritingToolsSettingsRemovalBypass()"))
        listOf("Loil;", "Loii;", "Loql;", "Lovc;", "Lbze;", "Lhcv;").forEach {
            assertFalse(constants.contains(it))
        }
    }

    private fun readSource(fileName: String): String = String(
        Files.readAllBytes(
            Path.of(
                "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/" +
                    "writingtools/$fileName",
            ),
        ),
        StandardCharsets.UTF_8,
    )
}
