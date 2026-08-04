package dev.jason.gboardpatches.patches.gboard.features.writingtools

import java.nio.charset.StandardCharsets
import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardAiWritingToolsSignalPatchSourceTest {
    @Test
    fun `signal patch postprocesses target result instead of short circuiting entry`() {
        val source = String(
            Files.readAllBytes(
                Path.of(
                    "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/" +
                        "writingtools/GboardAiWritingToolsSignalPatch.kt",
                ),
            ),
            StandardCharsets.UTF_8,
        )

        assertTrue(source.contains("applyWritingToolsSignalOverride()"))
        assertTrue(source.contains("AI_WRITING_TOOLS_RUNTIME_APPLY_SIGNAL_RESULT"))
        assertTrue(source.contains("returnInstructionIndices()"))
        assertFalse(source.contains("shouldForceSignalTrue"))
        assertFalse(source.contains("return v0\n\n    :cond_jasondev_continue_original"))
    }
}
