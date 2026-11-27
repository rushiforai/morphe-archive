package dev.srwi.gintype.patches.gboard.features.customholdpopups

import app.morphe.patcher.util.smali.InlineSmaliCompiler
import dev.srwi.gintype.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.srwi.gintype.patches.gboard.shared.runtimeabi.RuntimeCallId
import org.junit.Assert.assertEquals
import org.junit.Test

class GboardCustomHoldPopupsSmaliCompilationTest {
    @Test
    fun `verify transformSoftKeyDef hook compiles for SoftKeyView setSoftKeyDef`() {
        val invoke = RuntimeCallEmitter.invoke(
            RuntimeCallId.CUSTOM_HOLD_POPUPS_RUNTIME_TRANSFORM_SOFT_KEY_DEF,
            "p0, p1",
        )
        val smali = """
            $invoke
            move-result-object p1
            check-cast p1, Lcom/google/android/libraries/inputmethod/metadata/SoftKeyDef;
        """.trimIndent()
        val instructions = InlineSmaliCompiler.compile(
            instructions = smali,
            parameters = "Lcom/google/android/libraries/inputmethod/metadata/SoftKeyDef;J",
            registers = 8,
            forStaticMethod = false,
        )
        assertEquals(3, instructions.size)
    }

    @Test
    fun `verify onPopupShown hook compiles for TouchActionBundle showPopup`() {
        val smali = RuntimeCallEmitter.invoke(
            RuntimeCallId.CUSTOM_HOLD_POPUPS_RUNTIME_ON_POPUP_SHOWN,
            "p0 .. p0",
        )
        val instructions = InlineSmaliCompiler.compile(
            instructions = smali,
            parameters = "J",
            registers = 27,
            forStaticMethod = false,
        )
        assertEquals(1, instructions.size)
    }

    @Test
    fun `verify onPopupSelectionUpdated hook compiles for PopupManager handleMove`() {
        val smali = RuntimeCallEmitter.invoke(
            RuntimeCallId.CUSTOM_HOLD_POPUPS_RUNTIME_ON_POPUP_SELECTION_UPDATED,
            "p0, p3",
        )
        val instructions = InlineSmaliCompiler.compile(
            instructions = smali,
            parameters = "FFZ",
            registers = 5,
            forStaticMethod = false,
        )
        assertEquals(1, instructions.size)
    }

    @Test
    fun `verify onPopupHidden hook compiles for PopupManager hide and close`() {
        val smali = RuntimeCallEmitter.invoke(
            RuntimeCallId.CUSTOM_HOLD_POPUPS_RUNTIME_ON_POPUP_HIDDEN,
            "p0",
        )
        val instructions = InlineSmaliCompiler.compile(
            instructions = smali,
            parameters = "J",
            registers = 7,
            forStaticMethod = false,
        )
        assertEquals(1, instructions.size)
    }

    @Test
    fun `verify shouldInterceptKeyDataDispatch hook compiles for BasicMotionEventHandler fireKeyData`() {
        val invoke = RuntimeCallEmitter.invoke(
            RuntimeCallId.CUSTOM_HOLD_POPUPS_RUNTIME_SHOULD_INTERCEPT_KEY_DATA_DISPATCH,
            "p0 .. p4",
        )
        val smali = """
            $invoke
            move-result v8
            if-eqz v8, :custom_hold_popups_allow_dispatch
            return-void
            :custom_hold_popups_allow_dispatch
            nop
        """.trimIndent()
        val instructions = InlineSmaliCompiler.compile(
            instructions = smali,
            parameters = "Lqin;Lqae;Lqbc;Lcom/google/android/libraries/inputmethod/metadata/SoftKeyDef;JZZIZJI",
            registers = 28,
            forStaticMethod = false,
        )
        assertEquals(5, instructions.size)
    }
}
