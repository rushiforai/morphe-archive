package dev.jason.gboardpatches.patches.gboard.features.writingtools

import java.nio.charset.StandardCharsets
import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardAiWritingToolsBackendFactoryPatchSourceTest {
    @Test
    fun `direct factory patch targets only gyc and delegates post result privacy policy`() {
        val source = String(
            Files.readAllBytes(
                Path.of(
                    "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/" +
                        "writingtools/GboardAiWritingToolsBackendFactoryPatch.kt",
                ),
            ),
            StandardCharsets.UTF_8,
        )

        assertTrue(source.contains("classType = BACKEND_FACTORY_CLASS"))
        assertTrue(source.contains("name = \"a\""))
        assertTrue(source.contains("parameterTypes = listOf(\"Landroid/content/Context;\", \"Loxe;\")"))
        assertTrue(source.contains("returnType = \"Lnjz;\""))
        assertTrue(source.contains("applyWritingToolsBackendFactoryGuard()"))
        assertTrue(source.contains("returnInstructionIndices()"))
        assertTrue(source.contains("check-cast v\$resultRegister, Lnjz;"))
        assertFalse(source.contains("Lhcv;"))
    }
}
