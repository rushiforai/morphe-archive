package dev.utaa.linimal.patches.features.home

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.PatchStatus
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertNull
import kotlin.test.assertTrue

private const val MATOME_PAYLOAD = "Lexample/home/MatomeSingle;"

class HomeTrendingPatchTest {
    @Test
    fun `only the five argument module renderer of the payload is accepted`() {
        assertTrue(
            isMatomeModuleRendererSignature(
                renderer("Ljava/lang/String;", MATOME_PAYLOAD, "Lsg2/h;", "Lj3/r;", "I"),
                MATOME_PAYLOAD,
            ),
        )
        // 同じ形の別 module（Carousel など）は view data の型が違うため対象にしません。
        assertFalse(
            isMatomeModuleRendererSignature(
                renderer("Ljava/lang/String;", "Lexample/home/Carousel;", "Lsg2/h;", "Lj3/r;", "I"),
                MATOME_PAYLOAD,
            ),
        )
        // 話題枠の compose body は 5 引数版だけです。引数の数や並びが違うものは対象にしません。
        assertFalse(
            isMatomeModuleRendererSignature(renderer(MATOME_PAYLOAD, "Lsg2/h;", "Lj3/r;", "I"), MATOME_PAYLOAD),
        )
        assertFalse(
            isMatomeModuleRendererSignature(
                renderer("Ljava/lang/String;", MATOME_PAYLOAD, MATOME_PAYLOAD, "Lj3/r;", "I"),
                MATOME_PAYLOAD,
            ),
        )
        assertFalse(
            isMatomeModuleRendererSignature(
                renderer("Ljava/lang/String;", MATOME_PAYLOAD, "Lsg2/h;", "Lj3/r;", "J"),
                MATOME_PAYLOAD,
            ),
        )
    }

    @Test
    fun `only one target is expected and nothing is injected without it`() {
        assertEquals(1, HOME_TRENDING_TARGET_COUNT)

        val notFound = homeTrendingUnappliedRecord(0, "HomeMatomePayloadTypeNotUnique")
        assertEquals(PatchId.HOME_MATOME_SINGLE_MODULE, notFound.patchId)
        assertEquals(PatchStatus.TARGET_NOT_FOUND, notFound.status)
        assertEquals(HOME_TRENDING_TARGET_COUNT, notFound.expectedTargetCount)
        assertEquals(0, notFound.actualTargetCount)

        // 1 件に絞り込めていない場合は raw match count を残した ERROR にします。
        val ambiguous = homeTrendingUnappliedRecord(2, "HomeMatomeModuleRendererNotUnique")
        assertEquals(PatchStatus.ERROR, ambiguous.status)
        assertEquals(2, ambiguous.actualTargetCount)
    }

    @Test
    fun `should execute branch is the injection point`() {
        val gate = homeTrendingModuleGateShape(moduleBody(shouldExecuteRegister = 5), hasTryBlocks = false)
        assertEquals(HomeTrendingModuleGate(branchIndex = 2, shouldExecuteRegister = 5), gate)
    }

    @Test
    fun `a register the restore constant cannot address is rejected`() {
        // const/4 は 4bit register しか取れないため、v16 以降は注入できません。
        assertNull(homeTrendingModuleGateShape(moduleBody(shouldExecuteRegister = 16), hasTryBlocks = false))
    }

    @Test
    fun `try blocks and an ambiguous or missing skip path are rejected`() {
        assertNull(homeTrendingModuleGateShape(moduleBody(shouldExecuteRegister = 5), hasTryBlocks = true))
        assertNull(
            homeTrendingModuleGateShape(
                moduleBody(shouldExecuteRegister = 5, skipToGroupEndCount = 0),
                hasTryBlocks = false,
            ),
        )
        assertNull(
            homeTrendingModuleGateShape(
                moduleBody(shouldExecuteRegister = 5, skipToGroupEndCount = 2),
                hasTryBlocks = false,
            ),
        )
        assertNull(
            homeTrendingModuleGateShape(
                moduleBody(shouldExecuteRegister = 5, endRestartGroupCount = 0),
                hasTryBlocks = false,
            ),
        )
        assertNull(
            homeTrendingModuleGateShape(
                moduleBody(shouldExecuteRegister = 5, shouldExecuteCount = 2),
                hasTryBlocks = false,
            ),
        )
    }

    @Test
    fun `a shape without the move result and branch sequence is rejected`() {
        val instructions = moduleBody(shouldExecuteRegister = 5).toMutableList()
        // move-result を欠く実装は、判定結果の register を確定できないため対象外です。
        instructions.removeAt(1)
        assertNull(homeTrendingModuleGateShape(instructions, hasTryBlocks = false))

        val otherRegister = moduleBody(shouldExecuteRegister = 5).toMutableList()
        // 分岐が判定結果ではない register を見ている実装も対象外です。
        otherRegister[2] = ImmutableInstruction21t(Opcode.IF_EQZ, 6, 3)
        assertNull(homeTrendingModuleGateShape(otherRegister, hasTryBlocks = false))
    }

    @Test
    fun `a branch that targets the injection point is rejected`() {
        // 既存の分岐が if-eqz を指していると、注入した gate を飛び越えて元の判定へ戻ります。
        val instructions = moduleBody(shouldExecuteRegister = 5).toMutableList()
        // shouldExecute(3) + move-result(1) = 4 code units 先の if-eqz を指す分岐を先頭へ足します。
        instructions.add(0, ImmutableInstruction21t(Opcode.IF_EQZ, 1, 6))
        assertNull(homeTrendingModuleGateShape(instructions, hasTryBlocks = false))
    }

    private fun renderer(vararg parameters: String): Method = ImmutableMethod(
        "Lexample/home/MatomeModule;",
        "a",
        parameters.map { ImmutableMethodParameter(it, null, null) },
        "V",
        0,
        null,
        null,
        null,
    )

    private fun moduleBody(
        shouldExecuteRegister: Int,
        shouldExecuteCount: Int = 1,
        skipToGroupEndCount: Int = 1,
        endRestartGroupCount: Int = 1,
    ): List<Instruction> = buildList {
        add(composerCall("A", listOf("I", "Z"), "Z"))
        add(ImmutableInstruction11x(Opcode.MOVE_RESULT, shouldExecuteRegister))
        add(ImmutableInstruction21t(Opcode.IF_EQZ, shouldExecuteRegister, 3))
        add(ImmutableInstruction10x(Opcode.NOP))
        repeat(shouldExecuteCount - 1) { add(composerCall("A", listOf("I", "Z"), "Z")) }
        repeat(skipToGroupEndCount) { add(composerCall("l", emptyList(), "V")) }
        repeat(endRestartGroupCount) { add(composerCall("Z", emptyList(), "Lj3/p3;")) }
    }

    private fun composerCall(
        name: String,
        parameters: List<String>,
        returnType: String,
    ) = ImmutableInstruction35c(
        Opcode.INVOKE_VIRTUAL,
        1,
        6, 0, 0, 0, 0,
        ImmutableMethodReference("Lj3/d1;", name, parameters, returnType),
    )
}
