package dev.utaa.linimal.patches.util

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction12x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertNull
import kotlin.test.assertTrue

/**
 * Compose の `shouldExecute` 分岐で、false 側が同じ composer の skipToGroupEnd → endRestartGroup へ
 * 進むことを確かめる判定を固定します。fixture は 26.16.0 の Home 特集枠 renderer の skip 側を縮めたもので、
 * composer（v5）を `move-object v11, v5` で写してから `l()` / `Z()` を呼びます。
 */
class ControlFlowTest {
    @Test
    fun `the skip side reaches the group end through a copied composer`() {
        val body = renderer()

        assertTrue(composeSkipReachesGroupEnd(body, 0, 2, SKIP_INDEX, END_INDEX))
    }

    @Test
    fun `a skip side that calls another composer is rejected`() {
        // skip 側の l() が composer の写しではない register を receiver にしています。
        val body = renderer(skipReceiver = 3)

        assertFalse(composeSkipReachesGroupEnd(body, 0, 2, SKIP_INDEX, END_INDEX))
    }

    @Test
    fun `a conditional branch on the skip side is rejected`() {
        val body = renderer(conditionalOnSkip = true)

        assertFalse(composeSkipReachesGroupEnd(body, 0, 2, SKIP_INDEX, END_INDEX))
    }

    @Test
    fun `a branch that does not land on the skip side is rejected`() {
        // 分岐先が body 側の先頭 (nop) なら、false 側は skipToGroupEnd を通りません。
        val body = renderer(branchOffset = 2)

        assertFalse(composeSkipReachesGroupEnd(body, 0, 2, SKIP_INDEX, END_INDEX))
    }

    @Test
    fun `aliases follow goto and drop overwritten registers`() {
        val instructions = listOf(
            ImmutableInstruction12x(Opcode.MOVE_OBJECT, 2, 1), // 0: v2 = v1
            ImmutableInstruction10t(Opcode.GOTO, 2), // 1: goto 3
            ImmutableInstruction10x(Opcode.NOP), // 2: 到達しない
            ImmutableInstruction11n(Opcode.CONST_4, 1, 0), // 3: v1 を上書き
            ImmutableInstruction10x(Opcode.NOP), // 4
        )

        assertEquals(setOf(2), unconditionalPathAliases(instructions, 0, 4, setOf(1)))
        // return や invoke を挟む経路は一本道として扱いません。
        assertNull(
            unconditionalPathAliases(
                listOf(ImmutableInstruction10x(Opcode.RETURN_VOID), ImmutableInstruction10x(Opcode.NOP)),
                0,
                1,
                setOf(1),
            ),
        )
    }

    /**
     * ```
     * 0: invoke-virtual {v5, v3, v1}, A(IZ)Z     addr 0
     * 1: move-result v1                           addr 3
     * 2: if-eqz v1, <skip>                        addr 4
     * 3: nop  (body 側の代わり)                   addr 6
     * 4: goto <end>                               addr 7
     * 5: move-object v11, v5   <skip>             addr 8
     * 6: invoke-virtual {v11}, l()V               addr 9
     * 7: invoke-virtual {v11}, Z()                addr 12
     * ```
     */
    private fun renderer(
        skipReceiver: Int = 11,
        conditionalOnSkip: Boolean = false,
        branchOffset: Int = 4,
    ): List<Instruction> = buildList {
        add(composerCall("A", listOf("I", "Z"), "Z", 5, 3, 1))
        add(ImmutableInstruction11x(Opcode.MOVE_RESULT, 1))
        add(ImmutableInstruction21t(Opcode.IF_EQZ, 1, branchOffset))
        add(ImmutableInstruction10x(Opcode.NOP))
        add(ImmutableInstruction10t(Opcode.GOTO, 5))
        add(
            if (conditionalOnSkip) {
                ImmutableInstruction21t(Opcode.IF_EQZ, 5, 1)
            } else {
                ImmutableInstruction12x(Opcode.MOVE_OBJECT, 11, 5)
            },
        )
        add(composerCall("l", emptyList(), "V", skipReceiver))
        add(composerCall("Z", emptyList(), "Lj3/p3;", 11))
    }

    private fun composerCall(name: String, parameters: List<String>, returnType: String, vararg registers: Int) =
        ImmutableInstruction35c(
            Opcode.INVOKE_VIRTUAL,
            registers.size,
            registers.getOrElse(0) { 0 },
            registers.getOrElse(1) { 0 },
            registers.getOrElse(2) { 0 },
            0,
            0,
            ImmutableMethodReference("Lj3/d1;", name, parameters, returnType),
        )

    private companion object {
        const val SKIP_INDEX = 6
        const val END_INDEX = 7
    }
}
