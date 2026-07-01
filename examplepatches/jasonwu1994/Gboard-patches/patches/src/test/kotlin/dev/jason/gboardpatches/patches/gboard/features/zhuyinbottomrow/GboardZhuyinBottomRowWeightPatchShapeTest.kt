package dev.jason.gboardpatches.patches.gboard.features.zhuyinbottomrow

import java.nio.charset.StandardCharsets
import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertTrue
import org.junit.Assert.assertFalse
import org.junit.Test

class GboardZhuyinBottomRowWeightPatchShapeTest {
    @Test
    fun `softkey patch delegates after bind work to runtime helper`() {
        assertTrue(
            ZHUYIN_BOTTOM_ROW_AFTER_BIND_DELEGATE.contains(
                "invoke-static {p0}, $ZHUYIN_BOTTOM_ROW_RUNTIME_CLASS->afterSoftKeyBound(Ljava/lang/Object;)V"
            )
        )
    }

    @Test
    fun `softkey patch injects at return sites instead of rewriting method entry`() {
        val source = String(
            Files.readAllBytes(
                Path.of(
                    "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/" +
                        "zhuyinbottomrow/GboardZhuyinBottomRowWeightSoftKeyPatch.kt"
                )
            ),
            StandardCharsets.UTF_8
        )

        assertTrue(source.contains("mutableMethod.returnInstructionIndices()"))
        assertTrue(
            source.contains(
                "mutableMethod.addInstructions(returnIndex, ZHUYIN_BOTTOM_ROW_AFTER_BIND_DELEGATE)"
            )
        )
        assertFalse(source.contains("mutableMethod.addInstructions(0, ZHUYIN_BOTTOM_ROW_AFTER_BIND_DELEGATE)"))
    }
}
