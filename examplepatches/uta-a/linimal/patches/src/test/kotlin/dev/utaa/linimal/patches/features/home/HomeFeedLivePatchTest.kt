package dev.utaa.linimal.patches.features.home

import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction3rc
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.PatchStatus
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertNotNull
import kotlin.test.assertNull
import kotlin.test.assertTrue

private const val COMPOSER = "Lj3/r;"
private const val COMPOSER_IMPL = "Lj3/d1;"
private const val ITEM = "Laf2/s;"

class HomeFeedLivePatchTest {
    @Test
    fun `the gate is the shouldExecute branch whose skip path reaches end restart group`() {
        val gate = assertNotNull(homeFeedLiveGateShape(renderer(), hasTryBlocks = false))
        assertEquals(2, gate.branchIndex)
        assertEquals(6, gate.shouldExecuteRegister)
    }

    @Test
    fun `try blocks and missing end restart group are rejected`() {
        assertNull(homeFeedLiveGateShape(renderer(), hasTryBlocks = true))
        val withoutEnd = renderer().filterNot {
            ((it as? ImmutableInstruction3rc)?.reference as? ImmutableMethodReference)?.name == "Z"
        }
        assertNull(homeFeedLiveGateShape(withoutEnd, hasTryBlocks = false))
    }

    @Test
    fun `a high result register is rejected`() {
        val instructions = renderer().toMutableList()
        instructions[1] = ImmutableInstruction11x(Opcode.MOVE_RESULT, 16)
        instructions[2] = ImmutableInstruction21t(Opcode.IF_EQZ, 16, instructions.skipOffset())
        assertNull(homeFeedLiveGateShape(instructions, hasTryBlocks = false))
    }

    @Test
    fun `a skip path that loses the composer is rejected`() {
        val instructions = renderer().toMutableList()
        // skip 側で composer の別名を作らないと、l() / Z() の receiver が composer ではなくなります。
        instructions[SKIP_ALIAS_INDEX] = ImmutableInstruction10x(Opcode.NOP)
        assertNull(homeFeedLiveGateShape(instructions, hasTryBlocks = false))
    }

    @Test
    fun `renderer signature takes the item first and the composer and changed last`() {
        assertTrue(isHomeFeedLiveRendererSignature(method(listOf(ITEM, "Lsg2/h;", "Lds2/c;", COMPOSER, "I")), ITEM))
        assertTrue(isHomeFeedLiveRendererSignature(method(listOf(ITEM, "Lsg2/h;", COMPOSER, "I")), ITEM))
        assertFalse(isHomeFeedLiveRendererSignature(method(listOf("Lother;", "Lsg2/h;", COMPOSER, "I")), ITEM))
        assertFalse(isHomeFeedLiveRendererSignature(method(listOf(ITEM, COMPOSER, "I")), ITEM))
        assertFalse(
            isHomeFeedLiveRendererSignature(method(listOf(ITEM, "Lsg2/h;", COMPOSER, "I"), static = false), ITEM),
        )
    }

    @Test
    fun `unresolved targets are recorded without injection`() {
        assertEquals(PatchStatus.TARGET_NOT_FOUND, homeFeedLiveUnappliedRecord(0, "x").status)
        val multiple = homeFeedLiveUnappliedRecord(2, "x")
        assertEquals(PatchStatus.ERROR, multiple.status)
        assertEquals(PatchId.HOME_FEED_LIVE, multiple.patchId)
        assertEquals(2, multiple.actualTargetCount)
    }

    /**
     * 26.16.0 の `ds2/c1.q` を縮めたもの。
     *
     * 0 A(IZ)Z / 1 move-result v6 / 2 if-eqz v6 → skip / 3 l()（既定値の処理） / 4 nop / 5 return-void
     * skip: 6 move-object/from16 v21, v7 / 7 l() range / 8 Z() range / 9 return-void
     */
    private fun renderer(): List<Instruction> {
        val instructions = mutableListOf<Instruction>(
            composerCall("A", listOf("I", "Z"), "Z", 7, 8, 6),
            ImmutableInstruction11x(Opcode.MOVE_RESULT, 6),
            ImmutableInstruction21t(Opcode.IF_EQZ, 6, 0),
            composerCall("l", emptyList(), "V", 7),
            ImmutableInstruction10x(Opcode.NOP),
            ImmutableInstruction10x(Opcode.RETURN_VOID),
            ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 21, 7),
            ImmutableInstruction3rc(
                Opcode.INVOKE_VIRTUAL_RANGE, 21, 1, ImmutableMethodReference(COMPOSER_IMPL, "l", emptyList(), "V"),
            ),
            ImmutableInstruction3rc(
                Opcode.INVOKE_VIRTUAL_RANGE, 21, 1,
                ImmutableMethodReference(COMPOSER_IMPL, "Z", emptyList(), "Lj3/p3;"),
            ),
            ImmutableInstruction10x(Opcode.RETURN_VOID),
        )
        instructions[2] = ImmutableInstruction21t(Opcode.IF_EQZ, 6, instructions.skipOffset())
        return instructions
    }

    /** if-eqz（index 2）から skip 先（index 6）までの code unit 数。 */
    private fun List<Instruction>.skipOffset(): Int = subList(2, SKIP_ALIAS_INDEX).sumOf { it.codeUnits }

    private fun composerCall(name: String, parameters: List<String>, returnType: String, vararg registers: Int) =
        ImmutableInstruction35c(
            Opcode.INVOKE_VIRTUAL,
            registers.size,
            registers.getOrElse(0) { 0 },
            registers.getOrElse(1) { 0 },
            registers.getOrElse(2) { 0 },
            0,
            0,
            ImmutableMethodReference(COMPOSER_IMPL, name, parameters, returnType),
        )

    private fun method(parameters: List<String>, static: Boolean = true) = ImmutableMethod(
        "Lds2/c1;",
        "q",
        parameters.map { ImmutableMethodParameter(it, null, null) },
        "V",
        if (static) AccessFlags.PUBLIC.value or AccessFlags.STATIC.value else AccessFlags.PUBLIC.value,
        null,
        null,
        null,
    )

    private companion object {
        const val SKIP_ALIAS_INDEX = 6
    }
}
