package dev.utaa.linimal.patches.features.home

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import dev.utaa.linimal.patches.util.isDivertedInjectionIndex
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertNull
import kotlin.test.assertTrue

private const val VIEW_HOLDER = "Lo42/d;"
private const val CONTENT_MODEL = "Lkd2/c;"

/**
 * recommendation binder の注入位置を固定します。抑制経路は `iput-object v0, ...` で cache を消して
 * `return-void` するため、注入位置で v0 が本当に `this` を保持していること、そしてその位置が
 * 既存の分岐先や例外 handler の先頭でないことの両方が前提になります。
 */
class HomeContentsRecommendationPatchTest {
    @Test
    fun `the injection point is right after removeAllViews`() {
        assertEquals(
            LIST_READ_INDEX,
            homeRecommendationInjectionIndex(
                instructions = binder(),
                cleanupIndex = CLEANUP_INDEX,
                thisParameterRegister = THIS_PARAMETER_REGISTER,
                hasTryBlocks = false,
                handlerAddresses = emptySet(),
            ),
        )
    }

    @Test
    fun `a binder with try blocks is rejected`() {
        // 抑制経路は bind を return-void で打ち切ります。例外経路を持つ binder は扱いません。
        assertNull(
            homeRecommendationInjectionIndex(
                instructions = binder(),
                cleanupIndex = CLEANUP_INDEX,
                thisParameterRegister = THIS_PARAMETER_REGISTER,
                hasTryBlocks = true,
                handlerAddresses = emptySet(),
            ),
        )
    }

    @Test
    fun `an injection point that is also a branch target is rejected`() {
        // addr 0015（cleanup 直後の list 読み出し）へ直接飛ぶ経路を足します。dexlib2 は既存 location を
        // Label ごと後ろへずらすため、この経路だけが抑制を飛び越して recommendation が描かれます。
        val instructions = binder(equalityJumpOffset = 13)

        assertTrue(isDivertedInjectionIndex(instructions, LIST_READ_INDEX))
        assertNull(
            homeRecommendationInjectionIndex(
                instructions = instructions,
                cleanupIndex = CLEANUP_INDEX,
                thisParameterRegister = THIS_PARAMETER_REGISTER,
                hasTryBlocks = false,
                handlerAddresses = emptySet(),
            ),
        )
    }

    @Test
    fun `an injection point that is an exception handler head is rejected`() {
        assertNull(
            homeRecommendationInjectionIndex(
                instructions = binder(),
                cleanupIndex = CLEANUP_INDEX,
                thisParameterRegister = THIS_PARAMETER_REGISTER,
                hasTryBlocks = false,
                handlerAddresses = setOf(LIST_READ_ADDRESS),
            ),
        )
    }

    @Test
    fun `a this register that is overwritten before the injection point is rejected`() {
        // container の読み出し先を v0 にすると、注入する iput-object の receiver は `this` ではなく
        // LinearLayout になります。field は ViewHolder のものなので verifier がクラスごと拒否します。
        assertNull(
            homeRecommendationInjectionIndex(
                instructions = binder(containerRegister = 0),
                cleanupIndex = CLEANUP_INDEX,
                thisParameterRegister = THIS_PARAMETER_REGISTER,
                hasTryBlocks = false,
                handlerAddresses = emptySet(),
            ),
        )
    }

    @Test
    fun `a leading move that does not carry this is rejected`() {
        // v0 へ入るのが `this` 以外の parameter だった場合も、receiver の前提が崩れます。
        assertNull(
            homeRecommendationInjectionIndex(
                instructions = binder(thisMoveSource = THIS_PARAMETER_REGISTER + 1),
                cleanupIndex = CLEANUP_INDEX,
                thisParameterRegister = THIS_PARAMETER_REGISTER,
                hasTryBlocks = false,
                handlerAddresses = emptySet(),
            ),
        )
    }

    @Test
    fun `a binder that never moves this into v0 is rejected`() {
        assertNull(
            homeRecommendationInjectionIndex(
                instructions = binder().drop(1),
                cleanupIndex = CLEANUP_INDEX - 1,
                thisParameterRegister = THIS_PARAMETER_REGISTER,
                hasTryBlocks = false,
                handlerAddresses = emptySet(),
            ),
        )
    }

    /**
     * `equality short-circuit → tracker cleanup → removeAllViews → model list` の並び。
     * 命令境界は addr 0000 / 0002 / 0004 / 0007 / 0008 / 000a / 000b / 000d / 0010 / 0012 / 0015 / 0017 です。
     */
    private fun binder(
        equalityJumpOffset: Int = 3,
        containerRegister: Int = 1,
        thisMoveSource: Int = THIS_PARAMETER_REGISTER,
    ): List<Instruction> = listOf(
        // addr 0000: this を v0 へ退避します。
        ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 0, thisMoveSource),
        // addr 0002: cache 済みの content model
        ImmutableInstruction22c(Opcode.IGET_OBJECT, 1, 0, field(VIEW_HOLDER, "c", CONTENT_MODEL)),
        // addr 0004: Intrinsics.areEqual
        ImmutableInstruction35c(
            Opcode.INVOKE_STATIC,
            2,
            1, 2, 0, 0, 0,
            ImmutableMethodReference(
                "Lkotlin/jvm/internal/n;",
                "b",
                listOf("Ljava/lang/Object;", "Ljava/lang/Object;"),
                "Z",
            ),
        ),
        // addr 0007
        ImmutableInstruction11x(Opcode.MOVE_RESULT, 1),
        // addr 0008: 同じ model なら描き直しません。
        ImmutableInstruction21t(Opcode.IF_EQZ, 1, equalityJumpOffset),
        // addr 000a
        ImmutableInstruction10x(Opcode.RETURN_VOID),
        // addr 000b: impression tracker
        ImmutableInstruction22c(Opcode.IGET_OBJECT, 1, 0, field(VIEW_HOLDER, "d", "Lsg2/u;")),
        // addr 000d
        ImmutableInstruction35c(
            Opcode.INVOKE_VIRTUAL,
            1,
            1, 0, 0, 0, 0,
            ImmutableMethodReference("Lsg2/u;", "a", emptyList(), "V"),
        ),
        // addr 0010: 行を並べる LinearLayout
        ImmutableInstruction22c(
            Opcode.IGET_OBJECT,
            containerRegister,
            0,
            field(VIEW_HOLDER, "b", "Landroid/widget/LinearLayout;"),
        ),
        // addr 0012: cleanup
        ImmutableInstruction35c(
            Opcode.INVOKE_VIRTUAL,
            1,
            containerRegister, 0, 0, 0, 0,
            ImmutableMethodReference("Landroid/view/ViewGroup;", "removeAllViews", emptyList(), "V"),
        ),
        // addr 0015: 注入位置
        ImmutableInstruction22c(Opcode.IGET_OBJECT, 2, 1, field(CONTENT_MODEL, "a", "Ljava/util/List;")),
        // addr 0017
        ImmutableInstruction10x(Opcode.RETURN_VOID),
    )

    private fun field(definingClass: String, name: String, type: String) =
        ImmutableFieldReference(definingClass, name, type)

    private companion object {
        const val CLEANUP_INDEX = 9
        const val LIST_READ_INDEX = 10
        const val LIST_READ_ADDRESS = 0x15
        const val THIS_PARAMETER_REGISTER = 16
    }
}
