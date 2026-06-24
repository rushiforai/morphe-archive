package dev.jason.gboardpatches.patches.gboard.features.writingtools

import java.nio.charset.StandardCharsets
import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardAiWritingToolsFlagValuePatchSourceTest {
    @Test
    fun aiWritingToolsFlagPatchUsesReturnPointInjectionInsteadOfMethodEntryBranching() {
        val source = String(
            Files.readAllBytes(
                Path.of(
                    "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/" +
                        "writingtools/GboardAiWritingToolsFlagValuePatch.kt"
                )
            ),
            StandardCharsets.UTF_8
        )

        assertTrue(source.contains("returnInstructionIndices()"))
        assertTrue(source.contains("buildFlagValueDelegate(resultRegister)"))
        assertTrue(source.contains("addInstructions(0, PRESERVE_RECEIVER_DELEGATE)"))
        assertTrue(source.contains("invoke-static {v1, v\$register}"))
        assertFalse(source.contains("addInstructions(0, FLAG_VALUE_OVERRIDE_DELEGATE)"))
    }
}
