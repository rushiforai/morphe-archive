package dev.srwi.gintype.patches.gboard.features.typingeffects

import app.morphe.patcher.util.smali.InlineSmaliCompiler
import dev.srwi.gintype.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.srwi.gintype.patches.gboard.shared.runtimeabi.RuntimeCallId
import org.junit.Assert.assertEquals
import org.junit.Test

class GboardTypingEffectsSmaliCompilationTest {
    @Test
    fun `verify onKeyboardTouchEvent hook compiles for SoftKeyboardView dispatchTouchEvent`() {
        val smali = RuntimeCallEmitter.invoke(
            RuntimeCallId.TYPING_EFFECTS_RUNTIME_ON_KEYBOARD_TOUCH_EVENT,
            "p0, p1",
        )
        val instructions = InlineSmaliCompiler.compile(
            instructions = smali,
            parameters = "Landroid/view/MotionEvent;",
            registers = 6,
            forStaticMethod = false,
        )
        assertEquals(1, instructions.size)
    }

    @Test
    fun `verify onKeyboardDetached hook compiles for SoftKeyboardView onDetachedFromWindow`() {
        val smali = RuntimeCallEmitter.invoke(
            RuntimeCallId.TYPING_EFFECTS_RUNTIME_ON_KEYBOARD_DETACHED,
            "p0",
        )
        val instructions = InlineSmaliCompiler.compile(
            instructions = smali,
            parameters = "",
            registers = 2,
            forStaticMethod = false,
        )
        assertEquals(1, instructions.size)
    }

    @Test
    fun `verify shouldSuppressStockGestureTrail hook compiles for GestureOverlayView onDraw`() {
        val suppressInvoke = RuntimeCallEmitter.invoke(
            RuntimeCallId.TYPING_EFFECTS_RUNTIME_SHOULD_SUPPRESS_STOCK_TRAIL,
            "p0",
        )
        val smali = """
            $suppressInvoke
            move-result v0
            if-eqz v0, :typing_effects_allow_stock_trail
            return-void
            :typing_effects_allow_stock_trail
            nop
        """.trimIndent()
        val instructions = InlineSmaliCompiler.compile(
            instructions = smali,
            parameters = "Landroid/graphics/Canvas;",
            registers = 4,
            forStaticMethod = false,
        )
        assertEquals(5, instructions.size)
    }
}
