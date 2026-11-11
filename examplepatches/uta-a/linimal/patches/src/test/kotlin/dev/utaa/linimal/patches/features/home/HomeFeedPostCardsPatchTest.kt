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

class HomeFeedPostCardsPatchTest {
    @Test
    fun `only the five argument renderer taking the module payload is accepted`() {
        val payload = "Lexample/home/Post;"
        assertTrue(
            isModuleRendererSignature(
                signatureMethod("Ljava/lang/String;", payload, "Lsg2/h;", "Lj3/r;", "I"),
                payload,
            ),
        )
        // 同じ形の別 module は view data の型が違うため対象にしません。
        assertFalse(
            isModuleRendererSignature(
                signatureMethod("Ljava/lang/String;", "Lexample/home/Other;", "Lsg2/h;", "Lj3/r;", "I"),
                payload,
            ),
        )
        assertFalse(isModuleRendererSignature(signatureMethod(payload, "Lsg2/h;", "Lj3/r;", "I"), payload))
        assertFalse(
            isModuleRendererSignature(
                signatureMethod("Ljava/lang/String;", payload, "Lexample/home/Other;", "Lj3/r;", "I"),
                payload,
            ),
        )
    }

    @Test
    fun `every post module must resolve before anything is injected`() {
        assertEquals(3, HOME_FEED_POST_CARDS_TARGET_COUNT)
    }

    @Test
    fun `no resolved module reports target not found and a partial one reports partial`() {
        val notFound = homeFeedPostCardsUnappliedRecord(0, "HomeFeedPostPayloadTypeNotUnique")
        assertEquals(PatchId.HOME_FEED_POST_CARDS, notFound.patchId)
        assertEquals(PatchStatus.TARGET_NOT_FOUND, notFound.status)
        assertEquals(HOME_FEED_POST_CARDS_TARGET_COUNT, notFound.expectedTargetCount)
        assertEquals(0, notFound.actualTargetCount)

        val partial = homeFeedPostCardsUnappliedRecord(2, "HomeFeedPostRendererNotUnique")
        assertEquals(PatchStatus.PARTIAL, partial.status)
        assertEquals(2, partial.actualTargetCount)
    }

    @Test
    fun `should execute branch is the injection point`() {
        val gate = homeFeedPostModuleGateShape(renderer(shouldExecuteRegister = 12), hasTryBlocks = false)
        assertEquals(HomeFeedPostModuleGate(branchIndex = 2, shouldExecuteRegister = 12), gate)
    }

    @Test
    fun `a register the restore constant cannot address is rejected`() {
        // const/4 は 4bit register しか取れないため、v16 以降は注入できません。
        assertNull(homeFeedPostModuleGateShape(renderer(shouldExecuteRegister = 16), hasTryBlocks = false))
    }

    @Test
    fun `try blocks and a missing skip path are rejected`() {
        assertNull(homeFeedPostModuleGateShape(renderer(shouldExecuteRegister = 12), hasTryBlocks = true))
        assertNull(
            homeFeedPostModuleGateShape(
                renderer(shouldExecuteRegister = 12, skipToGroupEndCount = 0),
                hasTryBlocks = false,
            ),
        )
        assertNull(
            homeFeedPostModuleGateShape(
                renderer(shouldExecuteRegister = 12, skipToGroupEndCount = 2),
                hasTryBlocks = false,
            ),
        )
    }

    @Test
    fun `a branch that targets the injection point is rejected`() {
        // 既存の分岐が if-eqz を指していると、注入した gate を飛び越えて元の判定へ戻ります。
        val instructions = renderer(shouldExecuteRegister = 12).toMutableList()
        // shouldExecute(3) + move-result(1) = 4 code units 先の if-eqz を指す分岐を先頭へ足します。
        instructions.add(0, ImmutableInstruction21t(Opcode.IF_EQZ, 1, 6))
        assertNull(homeFeedPostModuleGateShape(instructions, hasTryBlocks = false))
    }

    private fun signatureMethod(vararg parameters: String): Method = ImmutableMethod(
        "Lexample/home/PostModule;",
        "a",
        parameters.map { ImmutableMethodParameter(it, null, null) },
        "V",
        0,
        null,
        null,
        null,
    )

    private fun renderer(
        shouldExecuteRegister: Int,
        skipToGroupEndCount: Int = 1,
    ): List<Instruction> = buildList {
        add(composerCall("A", listOf("I", "Z"), "Z"))
        add(ImmutableInstruction11x(Opcode.MOVE_RESULT, shouldExecuteRegister))
        add(ImmutableInstruction21t(Opcode.IF_EQZ, shouldExecuteRegister, 3))
        add(ImmutableInstruction10x(Opcode.NOP))
        repeat(skipToGroupEndCount) { add(composerCall("l", emptyList(), "V")) }
        add(composerCall("Z", emptyList(), "Lj3/p3;"))
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
