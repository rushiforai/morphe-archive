package dev.jason.gboardpatches.patches.gboard.features.writingtools

import java.nio.charset.StandardCharsets
import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardAiWritingToolsOfficialPreferencesPatchSourceTest {
    @Test
    fun officialPreferencesPatchAvoidsDirectBzeVObserver() {
        val source = String(
            Files.readAllBytes(
                Path.of(
                    "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/" +
                        "writingtools/GboardAiWritingToolsOfficialPreferencesPatch.kt"
                )
            ),
            StandardCharsets.UTF_8
        )

        assertTrue(source.contains("classType = PREFERENCE_MANAGER_CLASS"))
        assertTrue(source.contains("returnInstructionIndices()"))
        assertTrue(source.contains("OneRegisterInstruction"))
        assertTrue(source.contains("buildOfficialPreferenceObserverDelegate(resultRegister)"))
        assertFalse(source.contains("invoke-static {p1, p0}"))
        assertFalse(source.contains("classType = SHARED_PREFERENCES_CLASS"))
        assertFalse(source.contains("name = \"v\""))
    }
}
