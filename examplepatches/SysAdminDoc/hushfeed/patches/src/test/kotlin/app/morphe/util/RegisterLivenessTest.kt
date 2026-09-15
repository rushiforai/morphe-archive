package app.morphe.util

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableExceptionHandler
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.ImmutableTryBlock
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction31t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutablePackedSwitchPayload
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableSwitchElement
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import org.junit.Assert.assertEquals
import org.junit.Test

class RegisterLivenessTest {
    @Test
    fun `a register read on one arm of a branch is live before the branch and dead after its write`() {
        val method = smali(
            registers = 3, params = listOf("Z"),
            body = """
                if-eqz p0, :skip
                invoke-static {v0}, Lcom/example/Log;->note(Ljava/lang/Object;)V
                :skip
                const/4 v0, 0x0
                invoke-static {v0}, Lcom/example/Log;->note(Ljava/lang/Object;)V
                return-void
            """,
        )
        val liveness = RegisterLiveness.of(method)
        assertEquals(setOf(0, 2), liveness.liveInto(0))   // v0 on the arm that reads it, p0 for the test
        assertEquals(setOf(0), liveness.liveInto(1))
        assertEquals(emptySet<Int>(), liveness.liveInto(2))   // the const writes v0 before anything reads it
        assertEquals(setOf(0), liveness.liveInto(3))
    }

    @Test
    fun `a backward goto carries a read back around the loop`() {
        val method = smali(
            registers = 3, params = listOf("I"),
            body = """
                const/4 v1, 0x0
                :top
                invoke-static {v0}, Lcom/example/Log;->note(Ljava/lang/Object;)V
                add-int/lit8 v1, v1, 0x1
                if-eqz p0, :top
                return-void
            """,
        )
        val liveness = RegisterLiveness.of(method)
        // v0 is never written, so it is live at the top of the loop and before the const; v1
        // is read by the two-address add, so it is live once written and again around the loop.
        assertEquals(setOf(0, 2), liveness.liveInto(0))
        assertEquals(setOf(0, 1, 2), liveness.liveInto(1))
        assertEquals(setOf(0, 1, 2), liveness.liveInto(3))
    }

    @Test
    fun `every case of a packed switch is followed`() {
        // packed-switch v0 with two cases that each read a different register, and a
        // fall-through that reads a third. All three are live before the switch.
        val note = ImmutableMethodReference("Lcom/example/Log;", "note", listOf("Ljava/lang/Object;"), "V")
        fun call(register: Int) = ImmutableInstruction35c(Opcode.INVOKE_STATIC, 1, register, 0, 0, 0, 0, note)
        val returnVoid = ImmutableInstruction10x(Opcode.RETURN_VOID)
        // Code units: packed-switch 3, invoke 3, return 1, invoke 3, return 1, invoke 3, return 1,
        // then the payload. The switch is at 0, case 0 at 3+3+1 = 7, case 1 at 7+3+1 = 11,
        // the payload at 11+3+1 = 15 (even, as a payload must be).
        val payload = ImmutablePackedSwitchPayload(listOf(
            ImmutableSwitchElement(0, 7),
            ImmutableSwitchElement(1, 11),
        ))
        val instructions = listOf(
            ImmutableInstruction31t(Opcode.PACKED_SWITCH, 0, 15),
            call(1), returnVoid,      // fall-through reads v1
            call(2), returnVoid,      // case 0 reads v2
            call(3), returnVoid,      // case 1 reads v3
            payload,
        )
        val method = MutableMethod(ImmutableMethod(
            "Lcom/example/Host;", "run", emptyList(), "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
            ImmutableMethodImplementation(4, instructions, null, null),
        ))
        val liveness = RegisterLiveness.of(method)
        assertEquals(setOf(0, 1, 2, 3), liveness.liveInto(0))
        assertEquals(setOf(1), liveness.liveInto(1))
        assertEquals(setOf(2), liveness.liveInto(3))
        assertEquals(setOf(3), liveness.liveInto(5))
    }

    @Test
    fun `a register the exception handler reads is live everywhere inside the try`() {
        val risky = ImmutableMethodReference("Lcom/example/Io;", "risky", emptyList<String>(), "V")
        val note = ImmutableMethodReference("Lcom/example/Log;", "note", listOf("Ljava/lang/Object;"), "V")
        // 0: const/4 v1, 0        (1 code unit)   try starts at address 1
        // 1: invoke-static {} risky  (3)           in the try
        // 2: const/4 v2, 0        (1)              in the try, writes v2
        // 3: return-void          (1)              try ends at address 6
        // 4: move-exception v0    (1)              handler at address 6
        // 5: invoke-static {v2} note (3)           the handler reads v2
        // 6: return-void
        val instructions = listOf(
            ImmutableInstruction11n(Opcode.CONST_4, 1, 0),
            ImmutableInstruction35c(Opcode.INVOKE_STATIC, 0, 0, 0, 0, 0, 0, risky),
            ImmutableInstruction11n(Opcode.CONST_4, 2, 0),
            ImmutableInstruction10x(Opcode.RETURN_VOID),
            ImmutableInstruction11x(Opcode.MOVE_EXCEPTION, 0),
            ImmutableInstruction35c(Opcode.INVOKE_STATIC, 1, 2, 0, 0, 0, 0, note),
            ImmutableInstruction10x(Opcode.RETURN_VOID),
        )
        val tryBlock = ImmutableTryBlock(1, 5, listOf(ImmutableExceptionHandler("Ljava/lang/Exception;", 6)))
        val method = MutableMethod(ImmutableMethod(
            "Lcom/example/Host;", "run", emptyList(), "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
            ImmutableMethodImplementation(3, instructions, listOf(tryBlock), null),
        ))
        val liveness = RegisterLiveness.of(method)
        // The handler can be entered from the risky call before v2 is written, so v2 is live
        // there and before the try; after its own write it is dead on the straight path but
        // the return inside the try can still throw into the handler, so it stays live.
        assertEquals(setOf(2), liveness.liveInto(0))
        assertEquals(setOf(2), liveness.liveInto(1))
        assertEquals(emptySet<Int>(), liveness.liveInto(2))
        assertEquals(setOf(2), liveness.liveInto(3))
        assertEquals(setOf(2), liveness.liveInto(4))
    }

    @Test
    fun `wide values occupy the register above as well`() {
        val method = smali(
            registers = 4, params = emptyList(),
            body = """
                const-wide/16 v0, 0x0
                move-wide v2, v0
                return-wide v2
            """,
        )
        val liveness = RegisterLiveness.of(method)
        assertEquals(emptySet<Int>(), liveness.liveInto(0))
        assertEquals(setOf(0, 1), liveness.liveInto(1))
        assertEquals(setOf(2, 3), liveness.liveInto(2))
    }

    private fun smali(registers: Int, params: List<String>, body: String) = MutableMethod(
        ImmutableMethod(
            "Lcom/example/Host;", "run", params.map { ImmutableMethodParameter(it, null, null) }, "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
            ImmutableMethodImplementation(registers, emptyList(), null, null),
        ),
    ).apply { addInstructionsWithLabels(0, body.trimIndent()) }
}
