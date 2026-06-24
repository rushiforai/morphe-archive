package dev.jason.gboardpatches.patches.gboard.features.latinglobe

import java.nio.charset.StandardCharsets
import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardLatinGlobeBytecodePatchSourceTest {
    @Test
    fun staticLatinImeBuilderDoesNotInjectReceiverRegister() {
        val source = readSource(
            "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/latinglobe/" +
                "GboardLatinGlobeKeyIgnoreIntervalBytecodePatch.kt"
        )

        assertFalse(source.contains("invoke-static {p0,"))
        assertTrue(source.contains("->applyOverride(Ljava/lang/Object;)Ljava/lang/Object;"))
    }

    @Test
    fun latinGlobeRuntimeOverrideOnlyRequiresRuntimeParamsArgument() {
        val source = readSource(
            "../extensions/extension/src/main/java/dev/jason/gboardpatches/extension/keyboard/" +
                "GboardLatinGlobeKeyIgnoreIntervalRuntime.java"
        )

        assertTrue(source.contains("public static Object applyOverride(Object runtimeParams)"))
        assertFalse(source.contains("public static Object applyOverride(Object receiver, Object runtimeParams)"))
    }

    private fun readSource(relativePath: String): String =
        String(Files.readAllBytes(Path.of(relativePath)), StandardCharsets.UTF_8)
}
