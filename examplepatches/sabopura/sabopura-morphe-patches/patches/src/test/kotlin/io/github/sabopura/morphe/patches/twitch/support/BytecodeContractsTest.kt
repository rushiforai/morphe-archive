package io.github.sabopura.morphe.patches.twitch.support

import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction12x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction31t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutablePackedSwitchPayload
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableSwitchElement
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import org.junit.Assert.*
import org.junit.Test

class BytecodeContractsTest {
    @Test fun rejectsAmbiguousMatchesWithActionableError() {
        try { listOf(1, 2).uniqueContract("fixture") ; fail() }
        catch (error: PatchException) { assertTrue(error.message!!.contains("found 2")) }
    }

    private fun method(vararg code: Instruction) = ImmutableMethod("Lx;", "m", emptyList(), "V", AccessFlags.STATIC.value, null, null,
        ImmutableMethodImplementation(4, code.asIterable(), null, null))

    private fun const(register: Int) = ImmutableInstruction11n(Opcode.CONST_4, register, 1)
    private val returnVoid = ImmutableInstruction10x(Opcode.RETURN_VOID)

    @Test fun aRegisterOverwrittenOnEveryBranchIsDead() {
        val code = method(ImmutableInstruction21t(Opcode.IF_EQZ, 0, 4), const(1), returnVoid, const(1), returnVoid)
        assertTrue(registerDeadAt(code, 0, 1))
    }

    @Test fun aReadOnOneBranchKeepsTheRegisterAlive() {
        val code = method(ImmutableInstruction21t(Opcode.IF_EQZ, 0, 4), const(1), returnVoid, ImmutableInstruction11x(Opcode.RETURN, 1))
        assertFalse(registerDeadAt(code, 0, 1))
    }

    @Test fun aTwoAddressInstructionReadsItsTarget() {
        assertFalse(registerDeadAt(method(ImmutableInstruction12x(Opcode.ADD_INT_2ADDR, 1, 0), returnVoid), 0, 1))
    }

    @Test fun aWideReadReadsBothHalves() {
        assertFalse(registerDeadAt(method(ImmutableInstruction12x(Opcode.MOVE_WIDE, 2, 0), returnVoid), 0, 1))
    }

    @Test fun nothingFollowsAGotoOrAReturn() {
        val code = method(ImmutableInstruction10t(Opcode.GOTO, 2), ImmutableInstruction11x(Opcode.RETURN, 1), const(1), returnVoid)
        assertTrue(registerDeadAt(code, 0, 1))
        assertTrue(registerDeadAt(method(returnVoid, ImmutableInstruction11x(Opcode.RETURN, 1)), 0, 1))
    }

    @Test fun aSwitchCaseEarlierInTheMethodIsFollowed() {
        // goto switch; case: return v1; switch v0 (case 0 -> back one unit); const v1; return-void; payload
        val code = method(
            ImmutableInstruction10t(Opcode.GOTO, 2), ImmutableInstruction11x(Opcode.RETURN, 1),
            ImmutableInstruction31t(Opcode.PACKED_SWITCH, 0, 5), const(1), returnVoid,
            ImmutablePackedSwitchPayload(listOf(ImmutableSwitchElement(0, -1))),
        )
        assertFalse(registerDeadAt(code, 2, 1))
    }

    /** Four registers: locals v0 to v2 and the int parameter in v3. */
    private fun withParameter(vararg code: Instruction) = ImmutableMethod("Lx;", "m", listOf(ImmutableMethodParameter("I", null, null)), "V",
        AccessFlags.STATIC.value, null, null, ImmutableMethodImplementation(4, code.asIterable(), null, null))

    private fun reading(vararg registers: Int) = ImmutableInstruction35c(Opcode.INVOKE_STATIC, registers.size,
        registers.getOrElse(0) { 0 }, registers.getOrElse(1) { 0 }, registers.getOrElse(2) { 0 }, 0, 0,
        ImmutableMethodReference("Lx;", "use", registers.map { "I" }, "V"))

    @Test fun picksTheLowestLocalNothingReadsAgain() {
        assertEquals(2, freeLocalAt(withParameter(reading(0, 1), returnVoid), 0))
        assertEquals(0, freeLocalAt(withParameter(reading(1), const(0), ImmutableInstruction11x(Opcode.RETURN, 0)), 0))
    }

    @Test fun neverPicksAParameter() {
        assertNull(freeLocalAt(withParameter(reading(0, 1, 2), returnVoid), 0))
    }
}
