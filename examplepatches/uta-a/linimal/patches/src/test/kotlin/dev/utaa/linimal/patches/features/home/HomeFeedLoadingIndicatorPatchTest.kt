package dev.utaa.linimal.patches.features.home

import com.android.tools.smali.dexlib2.Opcode
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
import kotlin.test.assertNotEquals
import kotlin.test.assertNull
import kotlin.test.assertTrue

/**
 * 対象の取り違えを 2 度繰り返した箇所です。1 度目は難読化された class 名を主要条件にして
 * 別 package の全画面動画プレイヤーを掴み、2 度目は Material3 の CircularProgressIndicator の
 * うち**確定進捗版**の引数の並びを条件にしてしまい、実機のスピナー（LINE Design System の
 * spinner）に一致しませんでした。ここでは spinner と renderer の shape 判定を固定します。
 */
class HomeFeedLoadingIndicatorPatchTest {

    @Test
    fun `only the LDS spinner signature is accepted`() {
        // (size, Modifier, Boolean, Composer, $$changed, $$default)
        assertTrue(
            isLdsSpinnerSignature(
                renderer(listOf("Lexample/Size;", "Lb4/j;", "Z", "Lj3/r;", "I", "I")),
            ),
        )
        // Material3 の確定進捗版はこの並びではありません。取り違えると実機で何も起きません。
        assertFalse(
            isLdsSpinnerSignature(
                renderer(listOf("Lvb8/a;", "Lb4/j;", "J", "J", "I", "F", "Lvb8/l;", "Lj3/r;", "I")),
            ),
        )
        // Modifier / Boolean / Composer の位置が違えば対象外です。
        assertFalse(
            isLdsSpinnerSignature(
                renderer(listOf("Lexample/Size;", "Z", "Lb4/j;", "Lj3/r;", "I", "I")),
            ),
        )
    }

    @Test
    fun `only the loading renderer signature is accepted`() {
        // 読み込み表示の renderer は view data を持たず、Modifier と Composer と $$changed だけを取ります。
        assertTrue(isLoadingIndicatorRendererSignature(renderer(listOf("Lb4/j;", "Lj3/r;", "I"))))
        assertFalse(isLoadingIndicatorRendererSignature(renderer(listOf("I", "Lj3/r;"))))
        assertFalse(isLoadingIndicatorRendererSignature(renderer(listOf("Lb4/j;", "Lj3/r;"))))
        assertFalse(isLoadingIndicatorRendererSignature(renderer(listOf("Lb4/j;", "Lj3/r;", "I", "I"))))
    }

    @Test
    fun `the loading indicator renderer must be a single target`() {
        assertEquals(1, HOME_FEED_LOADING_INDICATOR_TARGET_COUNT)
    }

    @Test
    fun `no resolved renderer reports target not found and an ambiguous one reports error`() {
        val notFound = homeFeedLoadingIndicatorUnappliedRecord(0, "HomeFeedLoadingIndicatorSourcePackageNotUnique")
        assertEquals(PatchId.HOME_FEED_LOADING_INDICATOR, notFound.patchId)
        assertEquals(PatchStatus.TARGET_NOT_FOUND, notFound.status)
        assertEquals(HOME_FEED_LOADING_INDICATOR_TARGET_COUNT, notFound.expectedTargetCount)
        assertEquals(0, notFound.actualTargetCount)

        val ambiguous = homeFeedLoadingIndicatorUnappliedRecord(2, "HomeFeedLoadingIndicatorRendererNotUnique")
        assertEquals(PatchStatus.ERROR, ambiguous.status)
        assertEquals(2, ambiguous.actualTargetCount)
    }

    @Test
    fun `should execute branch is the injection point`() {
        val gate = homeFeedLoadingIndicatorGateShape(gateBody(shouldExecuteRegister = 1), hasTryBlocks = false)
        assertEquals(HomeFeedLoadingIndicatorGate(branchIndex = 2, shouldExecuteRegister = 1), gate)
    }

    @Test
    fun `a register the restore constant cannot address is rejected`() {
        // const/4 は 4bit register しか取れないため、v16 以降は注入できません。
        assertNull(homeFeedLoadingIndicatorGateShape(gateBody(shouldExecuteRegister = 16), hasTryBlocks = false))
    }

    @Test
    fun `try blocks and a missing skip path are rejected`() {
        assertNull(homeFeedLoadingIndicatorGateShape(gateBody(shouldExecuteRegister = 1), hasTryBlocks = true))
        assertNull(
            homeFeedLoadingIndicatorGateShape(
                gateBody(shouldExecuteRegister = 1, skipToGroupEndCount = 0),
                hasTryBlocks = false,
            ),
        )
        assertNull(
            homeFeedLoadingIndicatorGateShape(
                gateBody(shouldExecuteRegister = 1, skipToGroupEndCount = 2),
                hasTryBlocks = false,
            ),
        )
    }

    @Test
    fun `a branch that targets the injection point is rejected`() {
        // 既存の分岐が if-eqz を指していると、注入した gate を飛び越えて元の判定へ戻ります。
        val instructions = gateBody(shouldExecuteRegister = 1).toMutableList()
        // shouldExecute(3) + move-result(1) = 4 code units 先の if-eqz を指す分岐を先頭へ足します。
        instructions.add(0, ImmutableInstruction21t(Opcode.IF_EQZ, 1, 6))
        assertNull(homeFeedLoadingIndicatorGateShape(instructions, hasTryBlocks = false))
    }

    private fun renderer(parameters: List<String>) = ImmutableMethod(
        "Lve2/l;",
        "a",
        parameters.map { ImmutableMethodParameter(it, null, null) },
        "V",
        0,
        null,
        null,
        null,
    )

    private fun gateBody(
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

    /**
     * 呼び出し関係の突き合わせが overload を区別することを固定します。定義クラスと名前だけを
     * キーにすると、同じクラスの別 overload を同一視して対象を取り違えます。
     */
    @Test
    fun `the caller matching key distinguishes overloads`() {
        val modifierAndComposer = methodKey("Ldh2/p;", "a", listOf("Lb4/j;", "Lj3/r;", "I"), "V")
        val composerOnly = methodKey("Ldh2/p;", "a", listOf("Lj3/r;", "I"), "V")
        val differentReturn = methodKey("Ldh2/p;", "a", listOf("Lb4/j;", "Lj3/r;", "I"), "Ljava/lang/Object;")

        assertNotEquals(modifierAndComposer, composerOnly)
        assertNotEquals(modifierAndComposer, differentReturn)
        assertEquals(modifierAndComposer, methodKey("Ldh2/p;", "a", listOf("Lb4/j;", "Lj3/r;", "I"), "V"))
    }
}
