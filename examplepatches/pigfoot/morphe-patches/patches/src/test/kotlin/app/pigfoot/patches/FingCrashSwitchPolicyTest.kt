package app.pigfoot.patches

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.pigfoot.patches.fing.*
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.immutable.*
import com.android.tools.smali.dexlib2.immutable.instruction.*
import com.android.tools.smali.dexlib2.immutable.reference.*
import org.junit.Assert.*
import org.junit.Test

class FingCrashSwitchPolicyTest {
    private fun fixture(key: String = "crash_reporting_enabled", result: Int = 2): MutableMethod {
        val code = listOf(
            ImmutableInstruction21c(Opcode.CONST_STRING, 4, ImmutableStringReference(key)),
            ImmutableInstruction35c(Opcode.INVOKE_INTERFACE, 3, 2, 4, 5, 0, 0,
                ImmutableMethodReference("Landroid/content/SharedPreferences;", "getBoolean", listOf("Ljava/lang/String;", "Z"), "Z")),
            ImmutableInstruction11x(Opcode.MOVE_RESULT, result),
            ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 2, 0, 2, 0, 0, 0,
                ImmutableMethodReference("Landroidx/appcompat/widget/SwitchCompat;", "setChecked", listOf("Z"), "V")),
            ImmutableInstruction10x(Opcode.RETURN_VOID))
        return MutableMethod(ImmutableMethod(FING_PRIVACY_ACTIVITY, "onCreate",
            listOf(ImmutableMethodParameter("Landroid/os/Bundle;", emptySet(), null)), "V", 1,
            emptySet(), emptySet(), ImmutableMethodImplementation(9, code, emptyList(), emptyList())))
    }

    @Test fun storedTrueFalseAndMissingPreferenceCannotDisplayOrEnableReporting() {
        for (preferenceResult in listOf(true, false)) {
            val method = fixture()
            applyFingCrashSwitchPolicy(method)
            val registers = IntArray(9)
            val calls = mutableMapOf<String, Int>()
            for (instruction in method.implementation!!.instructions) {
                when (instruction.opcode) {
                    Opcode.MOVE_RESULT -> registers[(instruction as OneRegisterInstruction).registerA] = if (preferenceResult) 1 else 0
                    Opcode.CONST_4 -> registers[(instruction as OneRegisterInstruction).registerA] = (instruction as NarrowLiteralInstruction).narrowLiteral
                    Opcode.INVOKE_VIRTUAL -> {
                        val ref = (instruction as ReferenceInstruction).reference as com.android.tools.smali.dexlib2.iface.reference.MethodReference
                        calls[ref.name] = registers[(instruction as FiveRegisterInstruction).registerD]
                    }
                    else -> Unit
                }
            }
            assertEquals(mapOf("setChecked" to 0, "setEnabled" to 0), calls)
            assertEquals(7, method.implementation!!.instructions.size)
            val refs = method.implementation!!.instructions.filterIsInstance<ReferenceInstruction>().map { it.reference.toString() }
            assertFalse(refs.any { it.contains("putBoolean") || it.contains("clear(") })
        }
    }

    @Test fun unrelatedPreferenceAndChangedRegisterFlowFailBeforeMutation() {
        for (method in listOf(fixture("unrelated_setting"), fixture(result = 3))) {
            val before = method.implementation!!.instructions.toList()
            assertThrows(IllegalArgumentException::class.java) { applyFingCrashSwitchPolicy(method) }
            assertEquals(before, method.implementation!!.instructions.toList())
        }
    }
}
