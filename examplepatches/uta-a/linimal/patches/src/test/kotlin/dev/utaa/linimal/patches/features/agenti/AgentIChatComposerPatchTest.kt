package dev.utaa.linimal.patches.features.agenti

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction12x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction3rc
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference
import dev.utaa.linimal.patches.status.PatchStatus
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertNull

class AgentIChatComposerPatchTest {
    @Test
    fun `missing composite target reports target not found`() {
        val record = agentIChatComposerUnappliedRecord(0, "AgentIChatComposerCompositeTargetNotUnique")

        assertEquals(PatchStatus.TARGET_NOT_FOUND, record.status)
        assertEquals(1, record.expectedTargetCount)
        assertEquals(0, record.actualTargetCount)
    }

    @Test
    fun `multiple composite targets preserve the actual cardinality as an error`() {
        val record = agentIChatComposerUnappliedRecord(2, "AgentIChatComposerCompositeTargetNotUnique")

        assertEquals(PatchStatus.ERROR, record.status)
        assertEquals(1, record.expectedTargetCount)
        assertEquals(2, record.actualTargetCount)
    }

    @Test
    fun `gate is placed between the accessor result and its null check`() {
        val shape = gateShape(supplyInstructions())

        assertEquals(2, shape?.insertionIndex)
        assertEquals(6, shape?.chipBarRegister)
    }

    @Test
    fun `gate is rejected when another accessor is read`() {
        assertNull(aiTalkSuggestionChipBarGateShape(supplyInstructions(), "J", setOf(ACCESSOR_OWNER)))
        assertNull(aiTalkSuggestionChipBarGateShape(supplyInstructions(), "E", setOf("Lother;")))
    }

    @Test
    fun `gate is rejected when the holder does not receive the checked view`() {
        assertNull(gateShape(supplyInstructions(holderViewRegister = 5)))
    }

    @Test
    fun `gate is rejected when the checked view is overwritten before the holder`() {
        val instructions = supplyInstructions().toMutableList()
        instructions.add(4, ImmutableInstruction11n(Opcode.CONST_4, 6, 0))

        assertNull(gateShape(instructions))
    }

    @Test
    fun `gate is rejected when the holder is not supplied to the controller`() {
        assertNull(gateShape(supplyInstructions(supplyRegister = 14)))
    }

    @Test
    fun `gate is rejected when LINE has no null supply branch`() {
        assertNull(gateShape(supplyInstructions().filterNot { it.opcode == Opcode.CONST_4 }))
    }

    @Test
    fun `gate is rejected when the null branch does not reach the null supply`() {
        // 分岐先が holder の生成（addr 0006）だと、null の view で holder を作る経路になります。
        assertNull(gateShape(supplyInstructions(nullBranchOffset = 2)))
    }

    @Test
    fun `gate is rejected when the holder constructor receives another object`() {
        // constructor の receiver（v8）が、生成した holder（v9）の写しではありません。
        assertNull(gateShape(supplyInstructions(holderCopySource = 7)))
    }

    @Test
    fun `gate is rejected when the result register cannot be used by the non range hook`() {
        val instructions = supplyInstructions().toMutableList()
        instructions[1] = ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 16)
        instructions[2] = ImmutableInstruction21t(Opcode.IF_EQZ, 16, 8)

        assertNull(gateShape(instructions))
    }

    private fun gateShape(instructions: List<Instruction>) =
        aiTalkSuggestionChipBarGateShape(instructions, "E", setOf(ACCESSOR_OWNER))

    /** 26.16.0 の `MessageInputViewControllerImpl` の controller 構築と同じ並び。 */
    private fun supplyInstructions(
        holderViewRegister: Int = 6,
        supplyRegister: Int = 15,
        nullBranchOffset: Int = 9,
        holderCopySource: Int = 9,
    ): List<Instruction> = listOf(
        ImmutableInstruction35c(
            Opcode.INVOKE_INTERFACE,
            1,
            2,
            0,
            0,
            0,
            0,
            ImmutableMethodReference(ACCESSOR_OWNER, "E", emptyList(), COMPOSE_VIEW),
        ),
        ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 6),
        // null 側は `const/4 v15, 0`（addr 000d）へ分岐します。
        ImmutableInstruction21t(Opcode.IF_EQZ, 6, nullBranchOffset),
        ImmutableInstruction21c(Opcode.NEW_INSTANCE, 9, ImmutableTypeReference(CHIP_BAR_HOLDER)),
        ImmutableInstruction12x(Opcode.MOVE_OBJECT, 8, holderCopySource),
        ImmutableInstruction35c(
            Opcode.INVOKE_DIRECT,
            4,
            8,
            holderViewRegister,
            4,
            2,
            0,
            ImmutableMethodReference(
                CHIP_BAR_HOLDER,
                "<init>",
                listOf(COMPOSE_VIEW, "Landroidx/lifecycle/p2;", "Lqp1/a;"),
                "V",
            ),
        ),
        ImmutableInstruction12x(Opcode.MOVE_OBJECT, supplyRegister, 8),
        ImmutableInstruction11n(Opcode.CONST_4, 15, 0),
        ImmutableInstruction3rc(
            Opcode.INVOKE_DIRECT_RANGE,
            12,
            8,
            ImmutableMethodReference(
                "Lcom/linecorp/line/chat/ui/impl/message/input/aitalksuggestion/a;",
                "<init>",
                listOf(
                    "Landroidx/fragment/app/b0;",
                    "Landroid/view/ViewStub;",
                    CHIP_BAR_HOLDER,
                    "Lkn1/b;",
                    "Lmd1/b;",
                    "Ljava/lang/String;",
                    "Li81/c;",
                ),
                "V",
            ),
        ),
    )

    private companion object {
        const val ACCESSOR_OWNER = "Ljb1/i;"
        const val COMPOSE_VIEW = "Landroidx/compose/ui/platform/ComposeView;"
        const val CHIP_BAR_HOLDER = "Lzm1/a;"
    }
}
