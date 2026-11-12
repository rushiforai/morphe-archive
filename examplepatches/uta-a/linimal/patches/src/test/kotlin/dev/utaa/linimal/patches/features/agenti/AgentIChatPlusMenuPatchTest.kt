package dev.utaa.linimal.patches.features.agenti

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction12x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21s
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction31i
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertNotNull
import kotlin.test.assertNull

private const val VIEW = "Landroid/view/View;"
private const val COMPOSE_VIEW = "Landroidx/compose/ui/platform/ComposeView;"

class AgentIChatPlusMenuPatchTest {
    @Test
    fun `the visibility flag is guarded right after the compose view cast`() {
        val shape = assertNotNull(plusMenuToggleShape(toggleBlock()))

        // check-cast の直後。直前の合流点（:goto_7c の命令）には入れません。
        assertEquals(5, shape.injectionIndex)
        assertEquals(3, shape.flagRegister)
    }

    @Test
    fun `a different view id is not accepted`() {
        val instructions = toggleBlock().toMutableList()
        instructions[1] = ImmutableInstruction31i(Opcode.CONST, 8, 0x7f0b0000)
        assertNull(plusMenuToggleShape(instructions))
    }

    @Test
    fun `the cast must be to compose view`() {
        val instructions = toggleBlock().toMutableList()
        instructions[4] = ImmutableInstruction21c(Opcode.CHECK_CAST, 7, ImmutableTypeReference(VIEW))
        assertNull(plusMenuToggleShape(instructions))
    }

    @Test
    fun `the content must be gated by the same flag`() {
        val instructions = toggleBlock().toMutableList()
        // setVisibility の直後で別の register を見るなら、同じ値で中身を決めていません。
        instructions[11] = ImmutableInstruction21t(Opcode.IF_EQZ, 6, 2)
        assertNull(plusMenuToggleShape(instructions))
    }

    @Test
    fun `an overwritten flag is rejected`() {
        val instructions = toggleBlock().toMutableList()
        instructions.add(7, ImmutableInstruction11n(Opcode.CONST_4, 3, 1))
        assertNull(plusMenuToggleShape(instructions))
    }

    @Test
    fun `duplicate id literals are rejected`() {
        val instructions = toggleBlock() + ImmutableInstruction31i(Opcode.CONST, 9, PLUS_MENU_AGENT_I_TOGGLE_ID)
        assertNull(plusMenuToggleShape(instructions))
    }

    @Test
    fun `the visibility argument must be the gone value written under the flag`() {
        val instructions = toggleBlock().toMutableList()
        instructions[9] = ImmutableInstruction21s(Opcode.CONST_16, 6, 4)
        assertNull(plusMenuToggleShape(instructions))
    }

    @Test
    fun `a high flag register is rejected`() {
        val instructions = toggleBlock().toMutableList()
        instructions[7] = ImmutableInstruction21t(Opcode.IF_EQZ, 16, 3)
        instructions[11] = ImmutableInstruction21t(Opcode.IF_EQZ, 16, 2)
        assertNull(plusMenuToggleShape(instructions))
    }

    /**
     * 26.16.0 の `sm1/f1.invoke` の該当部分を縮めたもの。
     *
     * 0 move v3, v6（合流前） / 1 const v8, id / 2 findViewById / 3 move-result-object v7 / 4 check-cast v7
     * 5 if-nez v7 / 6 return-void / 7 if-eqz v3 → 9 / 8 goto → 10 / 9 const/16 v6, 0x8
     * 10 setVisibility {v7, v6} / 11 if-eqz v3 / 12 nop / 13 return-void
     */
    private fun toggleBlock(): List<Instruction> = listOf(
        ImmutableInstruction12x(Opcode.MOVE, 3, 6),
        ImmutableInstruction31i(Opcode.CONST, 8, PLUS_MENU_AGENT_I_TOGGLE_ID),
        invokeVirtual("findViewById", listOf("I"), VIEW, 7, 8),
        ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 7),
        ImmutableInstruction21c(Opcode.CHECK_CAST, 7, ImmutableTypeReference(COMPOSE_VIEW)),
        ImmutableInstruction21t(Opcode.IF_NEZ, 7, 3),
        ImmutableInstruction10x(Opcode.RETURN_VOID),
        ImmutableInstruction21t(Opcode.IF_EQZ, 3, 3),
        ImmutableInstruction10t(Opcode.GOTO, 3),
        ImmutableInstruction21s(Opcode.CONST_16, 6, 8),
        invokeVirtual("setVisibility", listOf("I"), "V", 7, 6),
        ImmutableInstruction21t(Opcode.IF_EQZ, 3, 2),
        ImmutableInstruction10x(Opcode.NOP),
        ImmutableInstruction10x(Opcode.RETURN_VOID),
    )

    private fun invokeVirtual(name: String, parameters: List<String>, returnType: String, vararg registers: Int) =
        ImmutableInstruction35c(
            Opcode.INVOKE_VIRTUAL,
            registers.size,
            registers.getOrElse(0) { 0 },
            registers.getOrElse(1) { 0 },
            0,
            0,
            0,
            ImmutableMethodReference(VIEW, name, parameters, returnType),
        )
}
