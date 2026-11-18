package io.github.sabopura.morphe.patches.twitch.ui

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

class SettingsEntryTest {
    private val fragment = "Ltv/twitch/android/shared/settings/BaseSettingsFragment;"

    /** 31.9.0's shape: p0 (v1) is overwritten by the presenter and then by the returned view. */
    private fun onCreateViewReusingP0() = MutableMethod(ImmutableMethod(fragment, "onCreateView",
        listOf("Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;", "Landroid/os/Bundle;").map {
            ImmutableMethodParameter(it, emptySet(), null)
        }, "Landroid/view/View;", AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, emptySet(), emptySet(),
        ImmutableMethodImplementation(5, listOf(
            ImmutableInstruction22c(Opcode.IGET_OBJECT, 1, 1, ImmutableFieldReference(fragment, "Q", "Ljava/lang/Object;")),
            ImmutableInstruction22c(Opcode.IGET_OBJECT, 1, 2,
                ImmutableFieldReference("Ltv/twitch/android/core/mvp/viewdelegate/BaseViewDelegate;", "b", "Landroid/view/View;")),
            ImmutableInstruction11x(Opcode.RETURN_OBJECT, 1)), emptyList(), emptyList())))

    private fun call(code: List<Instruction>, name: String) =
        code.indexOfFirst { (it as? ReferenceInstruction)?.reference?.toString()?.contains("->$name(") == true }

    @Test fun notesTheFragmentBeforeP0IsReused() {
        val method = onCreateViewReusingP0()
        method.wrapLegacySettingsView()
        val code = method.instructions.toList()
        val creating = call(code, "creating")
        assertEquals(0, creating)
        assertEquals(1, (code[creating] as RegisterRangeInstruction).startRegister)
        val wrap = call(code, "wrapIfMain")
        val returned = (code.last() as OneRegisterInstruction).registerA
        assertTrue(wrap > creating)
        assertEquals(1, (code[wrap] as RegisterRangeInstruction).registerCount)
        assertEquals(returned, (code[wrap] as RegisterRangeInstruction).startRegister)
        assertEquals(Opcode.MOVE_RESULT_OBJECT, code[wrap + 1].opcode)
        assertEquals(returned, (code[wrap + 1] as OneRegisterInstruction).registerA)
    }
}
