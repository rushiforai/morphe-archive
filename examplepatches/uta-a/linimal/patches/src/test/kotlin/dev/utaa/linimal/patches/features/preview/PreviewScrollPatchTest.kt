package dev.utaa.linimal.patches.features.preview

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction3rc
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference
import dev.utaa.linimal.patches.features.premium.CHAT_HISTORY_PREVIEW_ACTIVITY_PREFIX
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertNull

class PreviewScrollPatchTest {
    private val policy = ImmutableMethodReference("Lpolicy;", "a", emptyList(), "Z")
    private val constructor = ImmutableMethodReference(
        "Lscreen;", "<init>",
        listOf("Lone;", "Ltwo;", "Ljava/lang/String;", "Z", "Lfive;", "Lsix;", "Lseven;") +
            listOf("e;", "g;", "f;").map { CHAT_HISTORY_PREVIEW_ACTIVITY_PREFIX + it },
        "V",
    )

    private fun body(): MutableList<Instruction> = mutableListOf(
        ImmutableInstruction21c(Opcode.CHECK_CAST, 2, ImmutableTypeReference("Lpolicy;")),
        ImmutableInstruction35c(Opcode.INVOKE_INTERFACE, 1, 2, 0, 0, 0, 0, policy),
        ImmutableInstruction11x(Opcode.MOVE_RESULT, 9),
        ImmutableInstruction10x(Opcode.NOP),
        ImmutableInstruction3rc(Opcode.INVOKE_DIRECT_RANGE, 5, 11, constructor),
        ImmutableInstruction10x(Opcode.RETURN_VOID),
    )

    @Test
    fun `policy result reaches preview model without changing other arguments`() {
        assertEquals(PreviewScrollInjection(3, 9), previewScrollInjection(body()))
    }

    @Test
    fun `different result register or overwritten scroll value is unsafe`() {
        assertNull(previewScrollInjection(body().apply { this[2] = ImmutableInstruction11x(Opcode.MOVE_RESULT, 8) }))
        assertNull(previewScrollInjection(body().apply { this[3] = ImmutableInstruction11x(Opcode.MOVE_RESULT, 9) }))
    }

    @Test
    fun `branch or exception handler cannot bypass hook`() {
        // cast=2, invoke=3, move-result=1 code unit: NOP の address は 6。
        assertNull(previewScrollInjection(body(), setOf(6)))
        val code = body().apply { add(0, ImmutableInstruction10t(Opcode.GOTO, 7)) }
        assertNull(previewScrollInjection(code))
    }

    @Test
    fun `multiple policy calls or model constructors are ambiguous`() {
        assertNull(previewScrollInjection(body().apply { addAll(0, body().take(3)) }))
        assertNull(previewScrollInjection(body().apply { add(4, this[4]) }))
    }

    @Test
    fun `policy receiver and constructor argument must match`() {
        assertNull(previewScrollInjection(body().apply {
            this[1] = ImmutableInstruction35c(Opcode.INVOKE_INTERFACE, 1, 3, 0, 0, 0, 0, policy)
        }))
        assertNull(previewScrollInjection(body().apply {
            this[4] = ImmutableInstruction3rc(Opcode.INVOKE_DIRECT_RANGE, 6, 11, constructor)
        }))
    }

    @Test
    fun `scroll result must fit move result encoding`() {
        assertNull(previewScrollInjection(body().apply {
            this[4] = ImmutableInstruction3rc(Opcode.INVOKE_DIRECT_RANGE, 252, 11, constructor)
        }))
    }
}
