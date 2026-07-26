package dev.jason.gboardpatches.patches.gboard.features.zhuyinbottomrow

import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings
import java.nio.charset.StandardCharsets
import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardZhuyinBottomRowWeightPatchShapeTest {
    @Test
    fun `softkey patch uses exact 1777 shared bind descriptor`() {
        assertEquals(
            "Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;",
            GboardVersionBindings.softKeyBind.classType
        )
        assertEquals("q", GboardVersionBindings.softKeyBind.name)
        assertEquals(listOf("Lowd;", "J"), GboardVersionBindings.softKeyBind.parameterTypes)
        assertEquals("Z", GboardVersionBindings.softKeyBind.returnType)
    }

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
