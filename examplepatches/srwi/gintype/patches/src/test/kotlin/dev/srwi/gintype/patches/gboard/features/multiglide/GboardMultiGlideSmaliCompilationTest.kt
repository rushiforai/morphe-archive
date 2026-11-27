package dev.srwi.gintype.patches.gboard.features.multiglide

import app.morphe.patcher.util.smali.InlineSmaliCompiler
import dev.srwi.gintype.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.srwi.gintype.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.srwi.gintype.patches.gboard.shared.runtimeabi.RuntimeCallId
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardMultiGlideSmaliCompilationTest {
    @Test
    fun `verify onGestureEventEntry invoke compiles for method g with 39 registers`() {
        val smali = RuntimeCallEmitter.invoke(
            RuntimeCallId.MULTIGLIDE_RUNTIME_ON_GESTURE_EVENT_ENTRY,
            "v0, v8",
        )
        assertTrue(smali.startsWith("invoke-static {v0, v8}"))

        val instructions = InlineSmaliCompiler.compile(
            instructions = smali,
            parameters = "Landroid/view/MotionEvent;",
            registers = 39,
            forStaticMethod = false,
        )
        assertEquals(1, instructions.size)
    }

    @Test
    fun `verify shouldInterceptGestureDispatch compiles for method g with 39 registers`() {
        val shouldInterceptRef = RuntimeAbiCatalog.abi(
            RuntimeCallId.MULTIGLIDE_RUNTIME_SHOULD_INTERCEPT_GESTURE_DISPATCH,
        ).reference
        val smali = """
            invoke-static {v0}, $shouldInterceptRef
            move-result v2
        """.trimIndent()

        val instructions = InlineSmaliCompiler.compile(
            instructions = smali,
            parameters = "Landroid/view/MotionEvent;",
            registers = 39,
            forStaticMethod = false,
        )
        assertEquals(2, instructions.size)
    }

    @Test
    fun `verify shouldInterceptGestureReset invoke compiles for method B with 6 registers`() {
        val shouldInterceptResetRef = RuntimeAbiCatalog.abi(
            RuntimeCallId.MULTIGLIDE_RUNTIME_SHOULD_INTERCEPT_GESTURE_RESET,
        ).reference
        val smali = """
            invoke-static {p0}, $shouldInterceptResetRef
            move-result v0
            if-eqz v0, :multiglide_skip_reset_early_return
            return-void
            :multiglide_skip_reset_early_return
            nop
        """.trimIndent()

        val instructions = InlineSmaliCompiler.compile(
            instructions = smali,
            parameters = "",
            registers = 6,
            forStaticMethod = false,
        )
        assertEquals(5, instructions.size)
    }

    @Test
    fun `verify resolveLetterStarted invoke compiles for method g with 39 registers`() {
        val invoke = RuntimeCallEmitter.invoke(
            RuntimeCallId.MULTIGLIDE_RUNTIME_RESOLVE_LETTER_STARTED,
            "v0, v2",
        )
        val smali = """
            $invoke
            move-result v2
        """.trimIndent()

        val instructions = InlineSmaliCompiler.compile(
            instructions = smali,
            parameters = "Landroid/view/MotionEvent;",
            registers = 39,
            forStaticMethod = false,
        )
        assertEquals(2, instructions.size)
    }

    @Test
    fun `verify shouldReceiveEventsDuringOtherOwner helper compiles for gu()Z`() {
        val invoke = RuntimeCallEmitter.invoke(
            RuntimeCallId.MULTIGLIDE_RUNTIME_SHOULD_RECEIVE_EVENTS_DURING_OTHER_OWNER,
            "p0",
        )
        val smali = """
            $invoke
            move-result v0
            return v0
        """.trimIndent()

        val instructions = InlineSmaliCompiler.compile(
            instructions = smali,
            parameters = "",
            registers = 2,
            forStaticMethod = false,
        )
        assertEquals(3, instructions.size)
    }

    @Test
    fun `verify shouldSuppressBasicMotionEventHandler compiles for BasicMotionEventHandler t with 16 registers`() {
        val invoke = RuntimeCallEmitter.invoke(
            RuntimeCallId.MULTIGLIDE_RUNTIME_SHOULD_SUPPRESS_BASIC_HANDLER,
            "v14, v15",
        )
        val smali = """
            $invoke
            move-result v0
            if-eqz v0, :multiglide_continue_basic_handler
            return-void
            :multiglide_continue_basic_handler
            nop
        """.trimIndent()

        val instructions = InlineSmaliCompiler.compile(
            instructions = smali,
            parameters = "Landroid/view/MotionEvent;",
            registers = 16,
            forStaticMethod = false,
        )
        assertEquals(5, instructions.size)
    }

    @Test
    fun `verify shouldSuppressRolloverCommitOnPointerDown compiles for Lqil c with 12 registers`() {
        val invoke = RuntimeCallEmitter.invoke(
            RuntimeCallId.MULTIGLIDE_RUNTIME_SHOULD_SUPPRESS_ROLLOVER_COMMIT,
            "v10",
        )
        val smali = """
            $invoke
            move-result v3
            if-nez v3, :multiglide_skip_rollover_commit
            invoke-static {v2, v10, v0}, Lqil;->t(Lqin;Landroid/view/MotionEvent;I)V
            :multiglide_skip_rollover_commit
            nop
        """.trimIndent()

        val instructions = InlineSmaliCompiler.compile(
            instructions = smali,
            parameters = "Landroid/view/MotionEvent;Z",
            registers = 12,
            forStaticMethod = false,
        )
        assertEquals(5, instructions.size)
    }
}
