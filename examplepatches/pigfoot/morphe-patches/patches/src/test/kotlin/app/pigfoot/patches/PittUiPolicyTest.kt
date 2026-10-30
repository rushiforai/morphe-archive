package app.pigfoot.patches

import app.pigfoot.patches.pitt.*
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.immutable.*
import com.android.tools.smali.dexlib2.immutable.instruction.*
import com.android.tools.smali.dexlib2.immutable.reference.*
import org.junit.Assert.*
import org.junit.Test

class PittUiPolicyTest {
    private val toast = ImmutableMethodReference("Lcom/ihad/ptt/model/handler/b1;", "h",
        listOf("Landroid/content/Context;", "Ljava/lang/String;"), "V")
    private fun toastCall(context: Int, message: Int) = ImmutableInstruction35c(Opcode.INVOKE_STATIC,
        2, context, message, 0, 0, 0, toast)
    private fun MethodImplementationRefs(method: MutableMethod) = method.implementation!!.instructions
        .mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }

    private fun expiry(message: String = PITT_EXPIRED_MESSAGE): MutableMethod = MutableMethod(ImmutableMethod(
        PITT_EXPIRY_NOTICE_OWNER, "run", emptyList(), "V", 17, emptySet(), emptySet(),
        ImmutableMethodImplementation(10, listOf(
            ImmutableInstruction21c(Opcode.CONST_STRING, 2, ImmutableStringReference("付款處理中，請稍後重新驗證")),
            toastCall(1, 2),
            ImmutableInstruction21c(Opcode.CONST_STRING, 2, ImmutableStringReference(message)),
            toastCall(1, 2),
            ImmutableInstruction22c(Opcode.IGET_OBJECT, 0, 0,
                ImmutableFieldReference("Lcom/ihad/ptt/model/handler/c0;", "d", "Lcom/ihad/ptt/model/handler/c0\$e;")),
            ImmutableInstruction35c(Opcode.INVOKE_INTERFACE, 1, 0, 0, 0, 0, 0,
                ImmutableMethodReference("Lcom/ihad/ptt/model/handler/c0\$e;", "a", emptyList(), "V")),
            ImmutableInstruction21c(Opcode.CONST_STRING, 2, ImmutableStringReference("商店無回應")),
            toastCall(1, 2), ImmutableInstruction10x(Opcode.RETURN_VOID)
        ), emptyList(), emptyList())
    ))

    @Test fun expiryWarningOnlyIsMutedAndRealWarningsAndResetCallbackRemain() {
        val method = expiry()
        suppressPittExpiryNotice(method)
        val code = method.implementation!!.instructions.toList()
        assertEquals(Opcode.INVOKE_STATIC, code[1].opcode)
        assertEquals(Opcode.NOP, code[3].opcode)
        assertEquals(Opcode.IGET_OBJECT, code[4].opcode)
        assertEquals(Opcode.INVOKE_INTERFACE, code[5].opcode)
        assertEquals(Opcode.INVOKE_STATIC, code[7].opcode)
        assertEquals(2, MethodImplementationRefs(method).count { it == PITT_TOAST })
        assertTrue(MethodImplementationRefs(method).contains("Lcom/ihad/ptt/model/handler/c0\$e;->a()V"))
        assertEquals(10, method.implementation!!.registerCount)
        assertThrows(IllegalArgumentException::class.java) { suppressPittExpiryNotice(method) }
    }

    @Test fun unexpectedExpiryFlowFailsBeforeMutation() {
        val method = expiry("different warning")
        val before = method.implementation!!.instructions.map { it.opcode }
        assertThrows(IllegalArgumentException::class.java) { suppressPittExpiryNotice(method) }
        assertEquals(before, method.implementation!!.instructions.map { it.opcode })
        val badCallback = expiry()
        badCallback.implementation!!.replaceInstruction(5, com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x(Opcode.NOP))
        assertThrows(IllegalArgumentException::class.java) { suppressPittExpiryNotice(badCallback) }
        assertEquals(Opcode.INVOKE_STATIC, badCallback.implementation!!.instructions[3].opcode)
    }

}
