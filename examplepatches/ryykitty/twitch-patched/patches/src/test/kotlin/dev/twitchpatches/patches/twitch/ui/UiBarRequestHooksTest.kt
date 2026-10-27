package dev.twitchpatches.patches.twitch.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import dev.twitchpatches.patches.twitch.shared.code
import org.junit.Assert.*
import org.junit.Test

class UiBarRequestHooksTest {
    @Test fun redirectsBothRequestFormsWithoutChangingRegistersOrOtherCalls() {
        val method = ImmutableMethod("Lsynthetic/Host;", "apply", emptyList(), "V", AccessFlags.PUBLIC.value,
            null, null, MutableMethodImplementation(22)).toMutable().apply {
            addInstructionsWithLabels(0, """
                invoke-virtual {v3, v7}, Landroid/view/View;->setSystemUiVisibility(I)V
                invoke-interface/range {v18 .. v19}, Landroid/view/WindowInsetsController;->show(I)V
                invoke-virtual {v3}, Landroid/view/View;->requestLayout()V
                return-void
            """)
        }
        assertEquals(2, rewriteUiBarRequests(method).size)
        val code = method.code()
        assertEquals(Opcode.INVOKE_STATIC, code[0].opcode)
        assertEquals(3, (code[0] as FiveRegisterInstruction).registerC)
        assertEquals(7, (code[0] as FiveRegisterInstruction).registerD)
        assertEquals(Opcode.INVOKE_STATIC_RANGE, code[1].opcode)
        assertEquals(18, (code[1] as RegisterRangeInstruction).startRegister)
        assertEquals(Opcode.INVOKE_VIRTUAL, code[2].opcode)
    }
}
