package dev.utaa.linimal.patches.features.readwithoutreceipt

import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference
import com.android.tools.smali.dexlib2.Opcode
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertNull

/**
 * chatId のレジスタ計算と、scratch に使う v0 が parameter と衝突しないことの検証です。
 * 命令列そのものは `outboundGateFingerprint` が保証するため、ここでは register 割り当てだけを見ます。
 */
class ReadWithoutReceiptLocalReadBlockPatchTest {

    @Test
    fun `the exact apk register layout resolves the chat id to v8`() {
        // 実測: registers=10, ins=5 (this + J + String + Z)。parameter 列は v5 から始まります。
        val shape = mainChatMarkAsReadShape(markAsReadMethod(registerCount = 10))

        assertEquals(8, shape?.chatIdRegister)
    }

    @Test
    fun `the unread clear resolves the exact apk registers`() {
        // 実測: registers=3、check-cast v2 / iget-object v0 / invoke-interface {v0, v2} / ... / sget-object v1
        val shape = localUnreadClearShape(unreadClearMethod(unreadClearInstructions()), localUpdate)

        assertEquals(2, shape?.chatIdRegister)
        assertEquals(0, shape?.scratchRegister)
        assertEquals("a", shape?.resultField?.name)
    }

    @Test
    fun `the unread clear is rejected for another local update`() {
        val other = ImmutableMethodReference("Lother;", "x", listOf("Ljava/lang/String;"), "V")

        assertNull(localUnreadClearShape(unreadClearMethod(unreadClearInstructions()), other))
    }

    @Test
    fun `the unread clear is rejected when the scratch register would be a parameter`() {
        // 命令 1 の書き込み先が parameter だと、scratch に使えば this や chatId を潰します。
        val instructions = unreadClearInstructions().toMutableList()
        instructions[1] = ImmutableInstruction22c(
            Opcode.IGET_OBJECT,
            1,
            1,
            ImmutableFieldReference("Lclear;", "c", "Lstore;"),
        )
        instructions[2] = ImmutableInstruction35c(Opcode.INVOKE_INTERFACE, 2, 1, 2, 0, 0, 0, localUpdate)

        assertNull(localUnreadClearShape(unreadClearMethod(instructions), localUpdate))
    }

    @Test
    fun `the unread clear is rejected when it does more than the known shape`() {
        val instructions = unreadClearInstructions() + ImmutableInstruction10x(Opcode.NOP)

        assertNull(localUnreadClearShape(unreadClearMethod(instructions), localUpdate))
    }

    @Test
    fun `the local update is the first interface call taking only a string`() {
        val method = ImmutableMethod(
            "Lsender;",
            "d",
            emptyList(),
            "V",
            0,
            null,
            null,
            ImmutableMethodImplementation(
                4,
                listOf(
                    ImmutableInstruction35c(
                        Opcode.INVOKE_VIRTUAL,
                        2,
                        0,
                        1,
                        0,
                        0,
                        0,
                        ImmutableMethodReference("Lv;", "v", listOf("Ljava/lang/String;"), "V"),
                    ),
                    ImmutableInstruction35c(Opcode.INVOKE_INTERFACE, 2, 0, 1, 0, 0, 0, localUpdate),
                    ImmutableInstruction10x(Opcode.RETURN_VOID),
                ),
                emptyList(),
                emptyList(),
            ),
        )

        assertEquals(localUpdate, outboundLocalUpdateReference(method))
    }

    private val localUpdate = ImmutableMethodReference("Lstore;", "e0", listOf("Ljava/lang/String;"), "V")

    private fun unreadClearInstructions(): List<Instruction> = listOf(
        ImmutableInstruction21c(Opcode.CHECK_CAST, 2, ImmutableTypeReference("Ljava/lang/String;")),
        ImmutableInstruction22c(Opcode.IGET_OBJECT, 0, 1, ImmutableFieldReference("Lclear;", "c", "Lstore;")),
        ImmutableInstruction35c(Opcode.INVOKE_INTERFACE, 2, 0, 2, 0, 0, 0, localUpdate),
        ImmutableInstruction22c(Opcode.IGET_OBJECT, 1, 1, ImmutableFieldReference("Lclear;", "d", "Ljava/lang/Runnable;")),
        ImmutableInstruction35c(
            Opcode.INVOKE_INTERFACE,
            1,
            1,
            0,
            0,
            0,
            0,
            ImmutableMethodReference("Ljava/lang/Runnable;", "run", emptyList(), "V"),
        ),
        ImmutableInstruction21c(Opcode.SGET_OBJECT, 1, ImmutableFieldReference("Lresult;", "a", "Ljava/lang/Void;")),
        ImmutableInstruction11x(Opcode.RETURN_OBJECT, 1),
    )

    private fun unreadClearMethod(instructions: List<Instruction>) = ImmutableMethod(
        "Lclear;",
        "f",
        listOf(ImmutableMethodParameter("Ljava/lang/Object;", null, null)),
        "Ljava/lang/Object;",
        0,
        null,
        null,
        ImmutableMethodImplementation(3, instructions, emptyList(), emptyList()),
    )

    @Test
    fun `additional local registers shift the chat id register`() {
        val shape = mainChatMarkAsReadShape(markAsReadMethod(registerCount = 12))

        assertEquals(10, shape?.chatIdRegister)
    }

    @Test
    fun `a single local register is still enough for the scratch register`() {
        val shape = mainChatMarkAsReadShape(markAsReadMethod(registerCount = 6))

        assertEquals(4, shape?.chatIdRegister)
    }

    @Test
    fun `without a local register the scratch register would collide with a parameter`() {
        // registerCount が parameter 数ちょうどだと v0 が this になるため、注入しません。
        assertNull(mainChatMarkAsReadShape(markAsReadMethod(registerCount = 5)))
    }

    @Test
    fun `a method without an implementation is not injected`() {
        assertNull(mainChatMarkAsReadShape(abstractMarkAsReadMethod()))
    }

    private fun markAsReadMethod(registerCount: Int) = ImmutableMethod(
        OWNER_TYPE,
        "d",
        listOf(
            ImmutableMethodParameter("J", null, null),
            ImmutableMethodParameter("Ljava/lang/String;", null, null),
            ImmutableMethodParameter("Z", null, null),
        ),
        "V",
        0,
        null,
        null,
        ImmutableMethodImplementation(
            registerCount,
            listOf(ImmutableInstruction10x(Opcode.RETURN_VOID)),
            emptyList(),
            emptyList(),
        ),
    )

    private fun abstractMarkAsReadMethod() = ImmutableMethod(
        OWNER_TYPE,
        "d",
        listOf(
            ImmutableMethodParameter("J", null, null),
            ImmutableMethodParameter("Ljava/lang/String;", null, null),
            ImmutableMethodParameter("Z", null, null),
        ),
        "V",
        0,
        null,
        null,
        null,
    )

    private companion object {
        const val OWNER_TYPE = "Lq33/e;"
    }
}
