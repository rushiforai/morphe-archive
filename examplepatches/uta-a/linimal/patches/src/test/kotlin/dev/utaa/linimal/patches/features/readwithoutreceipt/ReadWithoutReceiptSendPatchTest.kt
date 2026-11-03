package dev.utaa.linimal.patches.features.readwithoutreceipt

import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

class ReadWithoutReceiptSendPatchTest {
    @Test
    fun `hook is selected only after queue submission returns with original request intact`() {
        val call = ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 4, 0, 15, 1, 2, 0,
            ImmutableMethodReference("Lqueue;", "submit", listOf(REQUEST, "Lcallback;", "Z"), "V"))
        val method = method(listOf(call, ImmutableInstruction10x(Opcode.RETURN_VOID)), registers = 20)
        assertEquals(listOf(SendSubmissionSite(1, 15)), readWithoutReceiptSendSites(method, REQUEST))
    }

    @Test
    fun `branch bypassing submission cannot execute a sent-message hook`() {
        // goto は RETURN_VOID に直接合流し、送信していない経路でも hook が実行される危険があります。
        val method = method(listOf(
            ImmutableInstruction10t(Opcode.GOTO, 4), call(), ImmutableInstruction10x(Opcode.RETURN_VOID),
        ))
        assertTrue(readWithoutReceiptSendSites(method, REQUEST).isEmpty())
    }

    @Test
    fun `unknown calls and post-submission work are not rewritten`() {
        assertTrue(readWithoutReceiptSendSites(method(listOf(call(returnType = "Z"),
            ImmutableInstruction10x(Opcode.RETURN_VOID))), REQUEST).isEmpty())
        assertTrue(readWithoutReceiptSendSites(method(listOf(call(), ImmutableInstruction10x(Opcode.NOP),
            ImmutableInstruction10x(Opcode.RETURN_VOID))), REQUEST).isEmpty())
        assertTrue(readWithoutReceiptSendSites(method(listOf(call(), ImmutableInstruction10x(Opcode.RETURN_VOID)),
            flags = AccessFlags.STATIC.value), REQUEST).isEmpty())
    }

    @Test
    fun `a submission without the trailing boolean is not the queue api`() {
        val twoArguments = ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 3, 0, 1, 2, 0, 0,
            ImmutableMethodReference("Lqueue;", "submit", listOf(REQUEST, "Lcallback;"), "V"))
        assertTrue(readWithoutReceiptSendSites(method(listOf(twoArguments,
            ImmutableInstruction10x(Opcode.RETURN_VOID))), REQUEST).isEmpty())
    }

    @Test
    fun `read observation preserves wide position and chatId even in high parameter registers`() {
        val method = ImmutableMethod("Lreader;", "markRead",
            listOf("J", "Ljava/lang/String;", "Z").map { ImmutableMethodParameter(it, null, null) },
            "V", AccessFlags.PUBLIC.value, null, null,
            ImmutableMethodImplementation(300, listOf(ImmutableInstruction10x(Opcode.RETURN_VOID)), emptyList(), emptyList()))
        val implementation = MutableMethodImplementation(checkNotNull(method.implementation))
        implementation.addInstruction(0, checkNotNull(readWithoutReceiptReadAttemptHook(method)))
        val dex = checkNotNull(ImmutableMethodImplementation.of(implementation))
        val hook = dex.instructions.first() as RegisterRangeInstruction
        // v295=this、v296:v297=J、v298=chatId。boolean v299 は渡さず、scratch も追加しません。
        assertEquals(Opcode.INVOKE_STATIC_RANGE, hook.opcode)
        assertEquals(295, hook.startRegister)
        assertEquals(4, hook.registerCount)
        assertEquals(300, dex.registerCount)
        assertEquals(Opcode.RETURN_VOID, dex.instructions.last().opcode)
    }

    private fun call(returnType: String = "V") = ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL,
        4, 0, 1, 2, 3, 0, ImmutableMethodReference("Lqueue;", "submit", listOf(REQUEST, "Lcallback;", "Z"), returnType))

    private fun method(instructions: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>,
        registers: Int = 4, flags: Int = AccessFlags.PUBLIC.value) = ImmutableMethod(
        "Ladapter;", "send", emptyList(), "V", flags, null, null,
        ImmutableMethodImplementation(registers, instructions, emptyList(), emptyList()),
    )

    companion object {
        private const val REQUEST = "Lrequest;"
    }
}
