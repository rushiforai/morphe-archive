/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.settings

import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Test
import app.morphe.util.names.origString

/** The application's onCreate hook goes in front of every return, branched to or fallen into. */
class BeforeEveryReturnTest {
    private val hook = "invoke-static {}, Lcom/example/Probe;->hit()V"

    @Test
    fun `every return gets the hook and a branch to a return lands on it`() {
        val method = host("Z", """
            if-eqz p0, :early
            nop
            return-void
            :early
            return-void
        """)
        assertEquals(2, method.beforeEveryReturn(hook))
        val instructions = method.implementation!!.instructions.toList()
        assertEquals(listOf(Opcode.IF_EQZ, Opcode.NOP, Opcode.INVOKE_STATIC, Opcode.RETURN_VOID,
            Opcode.INVOKE_STATIC, Opcode.RETURN_VOID), instructions.map { it.opcode })
        var address = 0
        val addresses = instructions.map { instruction -> address.also { address += instruction.codeUnits } }
        val target = addresses.indexOf((instructions.first() as OffsetInstruction).codeOffset)
        // A plain insert leaves the label on the return, and the branch would skip the hook.
        assertEquals("the branch runs the hook before its return", 4, target)
        assertEquals("Lcom/example/Probe;->hit()V", (instructions[target] as ReferenceInstruction).reference.origString())
    }

    @Test
    fun `a method that never returns is left as it is`() {
        val method = host("Ljava/lang/Throwable;", "throw p0")
        assertEquals(0, method.beforeEveryReturn(hook))
        assertEquals(listOf(Opcode.THROW), method.implementation!!.instructions.map { it.opcode })
    }

    private fun host(parameter: String, code: String) = MutableMethod(
        ImmutableMethod(
            "Lcom/example/Host;", "onCreate", listOf(ImmutableMethodParameter(parameter, null, null)), "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
            ImmutableMethodImplementation(1, emptyList(), null, null),
        ),
    ).apply { addInstructionsWithLabels(0, code) }
}
