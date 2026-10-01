package app.spicetify.patches.spotify.theme

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction3rc
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction51l
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import org.junit.jupiter.api.Assertions.assertFalse
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Test

class FeedsColorTest {
    private val color = ImmutableMethodReference("Lp/iae1;", "g", listOf("J"), "J")
    private val other = ImmutableMethodReference("Lp/other;", "g", listOf("J"), "J")

    private fun constant(register: Int = 2) = ImmutableInstruction51l(Opcode.CONST_WIDE, register, 0xFF121212L)
    private fun call(register: Int = 2, method: ImmutableMethodReference = color) =
        ImmutableInstruction35c(Opcode.INVOKE_STATIC, 2, register, register + 1, 0, 0, 0, method)
    private fun result(register: Int) = ImmutableInstruction11x(Opcode.MOVE_RESULT_WIDE, register)
    private fun feeds(vararg code: Instruction) = feedsColor(code.toList(), 0)

    @Test fun `a constant passed straight to Color is accepted`() =
        assertTrue(feeds(constant(), call(), result(7), constant()))

    @Test fun `a delayed Color call and a range call are accepted`() = assertTrue(feeds(constant(12),
        ImmutableInstruction11x(Opcode.MOVE_RESULT_WIDE, 9),
        ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 12, 2, color), result(4), call(12), result(6)))

    @Test fun `overwriting the register before Color is refused`() =
        assertFalse(feeds(constant(), result(2), call()))

    @Test fun `overwriting the overlapping wide register is refused`() =
        assertFalse(feeds(constant(), result(1), call()))

    @Test fun `a read by something other than Color is refused`() = assertFalse(feeds(constant(),
        ImmutableInstruction21c(Opcode.SPUT_WIDE, 2, ImmutableFieldReference("Lp/x;", "y", "J")), call()))

    @Test fun `a later non-Color reuse is refused`() =
        assertFalse(feeds(constant(), call(), result(7), call(method = other)))

    @Test fun `a branch before the register is rewritten is refused`() =
        assertFalse(feeds(constant(), call(), result(7), ImmutableInstruction10t(Opcode.GOTO, 2)))

    @Test fun `a move-wide copy that reaches Color is accepted`() = assertTrue(feeds(constant(),
        ImmutableInstruction22x(Opcode.MOVE_WIDE_FROM16, 8, 2), call(8), result(10)))

    @Test fun `a move-wide copy that reaches something else is refused`() = assertFalse(feeds(constant(),
        ImmutableInstruction22x(Opcode.MOVE_WIDE_FROM16, 8, 2), call(8, other)))

    @Test fun `an adjacent register pair in an invoke is not a read`() = assertTrue(feeds(constant(4),
        ImmutableInstruction35c(Opcode.INVOKE_STATIC, 2, 2, 3, 0, 0, 0, other), call(4), result(9)))

    @Test fun `an unused move-wide copy is accepted when the constant reaches Color`() = assertTrue(feeds(constant(),
        ImmutableInstruction22x(Opcode.MOVE_WIDE_FROM16, 8, 2), result(8), call(), result(10)))

    @Test fun `a narrow neighbour read is not a read of the pair`() = assertTrue(feeds(constant(4),
        ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 9, 3), call(4), result(10)))

    @Test fun `a constant never passed to Color is refused`() =
        assertFalse(feeds(constant(), ImmutableInstruction10x(Opcode.RETURN_VOID)))
}
