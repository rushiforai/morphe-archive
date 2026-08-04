package dev.jason.gboardpatches.patches.gboard.features.writingtools

import java.nio.charset.StandardCharsets
import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardAiWritingToolsFlagValuePatchSourceTest {
    @Test
    fun aiWritingToolsFlagOwnerComesOnlyFromTheGeneratedBinding() {
        val patchSource = readSource("GboardAiWritingToolsFlagValuePatch.kt")
        val constantsSource = readSource("GboardAiWritingToolsPatchConstants.kt")

        assertTrue(
            patchSource.contains(
                "findMutableMethodOrThrow(GboardVersionBindings.flagBoolGetter)",
            ),
        )
        assertFalse(patchSource.contains("FLAG_VALUE_CLASS"))
        assertFalse(constantsSource.contains("FLAG_VALUE_CLASS"))
        assertFalse(constantsSource.contains("\"Lmky;\""))
    }

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

        assertTrue(source.contains("mutableMethod.applyWritingToolsFlagValueOverride()"))
        assertTrue(source.contains("internal fun MutableMethod.applyWritingToolsFlagValueOverride()"))
        assertTrue(source.contains("injectFeatureFlagReturnOverrides("))
        assertTrue(source.contains("delegateTemplate = FLAG_VALUE_DELEGATE_TEMPLATE"))
        assertFalse(source.contains("::buildFlagValueDelegate"))
        assertTrue(source.contains("AI_WRITING_TOOLS_RUNTIME_APPLY_OVERRIDDEN_FLAG_VALUE"))
        assertTrue(source.contains("\"v1, v\$RESULT_REGISTER_TOKEN\""))
        assertFalse(source.contains("addInstructions(0, PRESERVE_RECEIVER_DELEGATE)"))
        assertFalse(source.contains("addInstructions(0, FLAG_VALUE_OVERRIDE_DELEGATE)"))
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
