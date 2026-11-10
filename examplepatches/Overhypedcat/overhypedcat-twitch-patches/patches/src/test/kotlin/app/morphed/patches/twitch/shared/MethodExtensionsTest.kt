package app.morphed.patches.twitch.shared

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction12x
import org.junit.Assert.assertThrows
import org.junit.Test

class MethodExtensionsTest {
    /** An instance method with 3 registers: v0 local, v1 = this, v2 = one object parameter. */
    private fun method(vararg instructions: Instruction) = MutableMethod(
        ImmutableMethod(
            "Lexample/Player;", "setSurface",
            listOf(ImmutableMethodParameter("Landroid/view/Surface;", null, null)),
            "V", AccessFlags.PUBLIC.value, null, null,
            ImmutableMethodImplementation(3, instructions.toList() + ImmutableInstruction10x(Opcode.RETURN_VOID), null, null),
        ),
    )

    @Test
    fun acceptsAMethodThatOnlyReadsThis() {
        // v0 = this: reading v1 is fine.
        method(ImmutableInstruction12x(Opcode.MOVE_OBJECT, 0, 1)).checkRegisterNotReused(1)
    }

    @Test
    fun refusesAMethodThatOverwritesThis() {
        // v1 = 0: the compiler reused this's register, so code added before the return would read 0.
        val error = assertThrows(IllegalStateException::class.java) {
            method(ImmutableInstruction11n(Opcode.CONST_4, 1, 0)).checkRegisterNotReused(1)
        }
        assert(error.message!!.contains("reuses v1"))
    }

    @Test
    fun refusesAWideValueThatCoversThis() {
        // A long written to v0 also fills v1.
        assertThrows(IllegalStateException::class.java) {
            method(ImmutableInstruction12x(Opcode.MOVE_WIDE, 0, 2)).checkRegisterNotReused(1)
        }
    }
}
