package dev.srwi.gintype.patches.gboard.features.thicctopbar

import app.morphe.patcher.util.smali.InlineSmaliCompiler
import dev.srwi.gintype.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.srwi.gintype.patches.gboard.shared.runtimeabi.RuntimeCallId
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardThiccTopBarSmaliCompilationTest {
    @Test
    fun `verify append candidates invoke range compiles for method D with 29 registers`() {
        val smaliRange = RuntimeCallEmitter.invoke(
            RuntimeCallId.THICC_TOP_BAR_RUNTIME_ON_CANDIDATES_UPDATED,
            "p0 .. p1",
        )
        assertTrue(smaliRange.startsWith("invoke-static/range"))

        val instructions = InlineSmaliCompiler.compile(
            instructions = smaliRange,
            parameters = "Ljava/util/List;Ljava/util/ArrayList;",
            registers = 29,
            forStaticMethod = false,
        )
        assertEquals(1, instructions.size)
    }

    @Test
    fun `verify clear candidates invoke compiles for method l with 7 registers`() {
        val smaliDirect = RuntimeCallEmitter.invoke(
            RuntimeCallId.THICC_TOP_BAR_RUNTIME_ON_CANDIDATES_CLEARED,
            "p0",
        )
        assertTrue(smaliDirect.startsWith("invoke-static"))

        val instructions = InlineSmaliCompiler.compile(
            instructions = smaliDirect,
            parameters = "",
            registers = 7,
            forStaticMethod = false,
        )
        assertEquals(1, instructions.size)
    }

    @Test
    fun `verify SoftKeyboardView inflate hook compiles with 3 registers`() {
        val smaliInflate = RuntimeCallEmitter.invoke(
            RuntimeCallId.THICC_TOP_BAR_RUNTIME_ON_SOFT_KEYBOARD_VIEW_INFLATED,
            "p0",
        )
        assertTrue(smaliInflate.startsWith("invoke-static"))

        val instructions = InlineSmaliCompiler.compile(
            instructions = smaliInflate,
            parameters = "",
            registers = 3,
            forStaticMethod = false,
        )
        assertEquals(1, instructions.size)
    }

    @Test
    fun `verify SoftKeyboardView target height scale wrapper compiles with 2 registers`() {
        val scaleInvoke = RuntimeCallEmitter.invoke(
            RuntimeCallId.THICC_TOP_BAR_RUNTIME_SCALE_HEADER_TARGET_HEIGHT,
            "p0, v0",
        )
        assertTrue(scaleInvoke.startsWith("invoke-static"))

        val instructions = InlineSmaliCompiler.compile(
            instructions = """
                invoke-direct {p0}, Lcom/google/android/libraries/inputmethod/widgets/SoftKeyboardView;->gboardPatchesOriginalTargetHeight()I
                move-result v0
                $scaleInvoke
                move-result v0
                return v0
            """.trimIndent(),
            parameters = "",
            registers = 2,
            forStaticMethod = false,
        )
        assertEquals(5, instructions.size)
    }

    @Test
    fun `verify SoftKeyboardView dispatchTouchEvent hook compiles with 3 registers`() {
        val smaliTouch = RuntimeCallEmitter.invoke(
            RuntimeCallId.THICC_TOP_BAR_RUNTIME_ON_KEYBOARD_TOUCH_EVENT,
            "p0, p1",
        )
        assertTrue(smaliTouch.startsWith("invoke-static"))

        val instructions = InlineSmaliCompiler.compile(
            instructions = smaliTouch,
            parameters = "Landroid/view/MotionEvent;",
            registers = 3,
            forStaticMethod = false,
        )
        assertEquals(1, instructions.size)
    }

    @Test
    fun `verify BasicMotionEventHandler onKeyDataDispatched hook compiles with 0 registers`() {
        val smaliKeyData = RuntimeCallEmitter.invoke(
            RuntimeCallId.THICC_TOP_BAR_RUNTIME_ON_KEY_DATA_DISPATCHED,
            "",
        )
        assertTrue(smaliKeyData.startsWith("invoke-static {}"))

        val instructions = InlineSmaliCompiler.compile(
            instructions = smaliKeyData,
            parameters = "",
            registers = 1,
            forStaticMethod = false,
        )
        assertEquals(1, instructions.size)
    }
}
