package app.morphe.util

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import app.morphe.patcher.patch.PatchException
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

class ControlFlowLabelInjectionTest {
    @Test
    fun `a hook at a goto target runs on the branch and fall through paths`() {
        val method = branchTargetReturn()
        val returnIndex = method.implementation!!.instructions.indexOfFirst {
            it.opcode == Opcode.RETURN_VOID
        }

        method.addInstructionsAtControlFlowLabel(
            returnIndex,
            "invoke-static {}, Lcom/example/Probe;->hit()V",
        )

        val instructions = method.implementation!!.instructions.toList()
        val addresses = codeAddresses(method)
        val gotoIndex = instructions.indexOfFirst { it.opcode == Opcode.GOTO }
        val gotoTarget = addresses[gotoIndex] +
            (instructions[gotoIndex] as OffsetInstruction).codeOffset
        val targetIndex = addresses.indexOf(gotoTarget)

        assertEquals(Opcode.INVOKE_STATIC, instructions[targetIndex].opcode)
        assertEquals(1, execute(method, parameter = 0))
        assertEquals(1, execute(method, parameter = 1))
    }

    @Test
    fun `a hook in front of a switch is refused before the method changes`() {
        // The copy the hook is built around would share the switch's payload, which dexlib2
        // refused only after the copy was in. The seeded injection tests found it.
        for (switch in listOf(
            "packed-switch p0, :cases" to ":cases\n.packed-switch 0x0\n    :first\n.end packed-switch",
            "sparse-switch p0, :cases" to ":cases\n.sparse-switch\n    0x5 -> :first\n.end sparse-switch",
        )) {
            val method = payloadMethod(switch.first, switch.second)
            val before = method.implementation!!.instructions.map { it.opcode }
            val refusal = assertThrows(PatchException::class.java) {
                method.addInstructionsAtControlFlowLabel(1, "invoke-static {}, Lcom/example/Probe;->hit()V")
            }
            assertTrue(refusal.message, refusal.message!!.endsWith("in front of the ${before[1]} at instruction 1"))
            assertEquals(switch.first, before, method.implementation!!.instructions.map { it.opcode })
        }
    }

    @Test
    fun `a hook on a payload is refused before the method changes`() {
        for (user in listOf(
            "packed-switch p0, :cases" to ":cases\n.packed-switch 0x0\n    :first\n.end packed-switch",
            "sparse-switch p0, :cases" to ":cases\n.sparse-switch\n    0x5 -> :first\n.end sparse-switch",
            "fill-array-data v0, :values" to ":values\n.array-data 4\n    0x1\n.end array-data",
        )) {
            val method = payloadMethod(user.first, user.second)
            val before = method.implementation!!.instructions.map { it.opcode }
            val refusal = assertThrows(PatchException::class.java) {
                method.addInstructionsAtControlFlowLabel(3, "invoke-static {}, Lcom/example/Probe;->hit()V")
            }
            assertTrue(refusal.message, refusal.message!!.contains("instruction 3 is a ${before[3]}, data that never runs"))
            assertEquals(user.first, before, method.implementation!!.instructions.map { it.opcode })
        }
    }

    @Test
    fun `a hook in front of fill-array-data keeps the array's payload`() {
        val method = payloadMethod("fill-array-data v0, :values", ":values\n.array-data 4\n    0x1\n.end array-data")
        method.addInstructionsAtControlFlowLabel(1, "invoke-static {}, Lcom/example/Probe;->hit()V")
        val instructions = method.implementation!!.instructions.toList()
        assertEquals(
            listOf(Opcode.NEW_ARRAY, Opcode.INVOKE_STATIC, Opcode.FILL_ARRAY_DATA, Opcode.RETURN_VOID),
            instructions.take(4).map { it.opcode },
        )
        val addresses = codeAddresses(method)
        val payload = addresses[2] + (instructions[2] as OffsetInstruction).codeOffset
        assertEquals(Opcode.ARRAY_PAYLOAD, instructions[addresses.indexOf(payload)].opcode)
    }

    private fun payloadMethod(user: String, payload: String) = MutableMethod(
        ImmutableMethod(
            "Lcom/example/Host;", "pick", listOf(ImmutableMethodParameter("I", null, null)), "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
            ImmutableMethodImplementation(2, emptyList(), null, null),
        ),
    ).apply {
        addInstructionsWithLabels(0, "new-array v0, p0, [I\n$user\n:first\nreturn-void\n$payload")
    }

    private fun branchTargetReturn() = MutableMethod(
        ImmutableMethod(
            "Lcom/example/Host;",
            "finish",
            listOf(ImmutableMethodParameter("Z", null, null)),
            "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            null,
            null,
            ImmutableMethodImplementation(1, emptyList(), null, null),
        ),
    ).apply {
        addInstructionsWithLabels(
            0,
            """
                if-eqz p0, :fall_through
                goto :shared_return
                :fall_through
                nop
                :shared_return
                return-void
            """,
        )
    }

    private fun execute(method: MutableMethod, parameter: Int): Int {
        val instructions = method.implementation!!.instructions.toList()
        val addresses = codeAddresses(method)
        val indexAtAddress = addresses.withIndex().associate { (index, address) ->
            address to index
        }
        var index = 0
        var calls = 0

        while (true) {
            val instruction = instructions[index]
            when (instruction.opcode) {
                Opcode.IF_EQZ -> {
                    index = if (parameter == 0) {
                        val target = addresses[index] +
                            (instruction as OffsetInstruction).codeOffset
                        indexAtAddress.getValue(target)
                    } else {
                        index + 1
                    }
                }
                Opcode.GOTO -> {
                    val target = addresses[index] +
                        (instruction as OffsetInstruction).codeOffset
                    index = indexAtAddress.getValue(target)
                }
                Opcode.INVOKE_STATIC -> {
                    calls++
                    index++
                }
                Opcode.NOP -> index++
                Opcode.RETURN_VOID -> return calls
                else -> error("Unexpected opcode in fixture: ${instruction.opcode}")
            }
        }
    }

    private fun codeAddresses(method: MutableMethod): List<Int> {
        var address = 0
        return method.implementation!!.instructions.map { instruction ->
            address.also { address += instruction.codeUnits }
        }
    }
}
