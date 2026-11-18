package io.github.sabopura.morphe.patches.twitch.player

import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test

class VodEndHookTest {
    private val state = "Lnnw;"
    private val playable = "Ltv/twitch/android/models/Playable;"

    // A merged lambda's invoke(Object): five locals, then the lambda in v5 and its argument in v6.
    private val self = 5
    private val argument = 6

    private fun lambda(vararg code: Instruction) = ImmutableMethod("Lfnw;", "invoke",
        listOf(ImmutableMethodParameter("Ljava/lang/Object;", null, null)), "Ljava/lang/Object;", AccessFlags.PUBLIC.value,
        null, null, ImmutableMethodImplementation(7, code.asIterable(), null, null))

    private fun call(opcode: Opcode, target: String, name: String, vararg registers: Int) =
        ImmutableInstruction35c(opcode, registers.size, registers.getOrElse(0) { 0 }, registers.getOrElse(1) { 0 }, 0, 0, 0,
            ImmutableMethodReference(target, name, List(maxOf(0, registers.size - 1)) { "Ljava/lang/Object;" }, "V"))

    private val castArgument = ImmutableInstruction21c(Opcode.CHECK_CAST, argument, ImmutableTypeReference(playable))
    private fun create(type: String = state) = ImmutableInstruction21c(Opcode.NEW_INSTANCE, 0, ImmutableTypeReference(type))
    private val construct = call(Opcode.INVOKE_DIRECT, state, "<init>", 0, argument)
    private fun push(receiver: Int) = call(Opcode.INVOKE_VIRTUAL, "Ltv/twitch/android/core/mvp/presenter/RxPresenter;", "v2", receiver, 0)
    private fun returns(register: Int) = ImmutableInstruction11x(Opcode.RETURN_OBJECT, register)
    private val loadPresenter = ImmutableInstruction22c(Opcode.IGET_OBJECT, argument, self, ImmutableFieldReference("Lfnw;", "b", "Lqnw;"))
    private val loadUnit = ImmutableInstruction21c(Opcode.SGET_OBJECT, argument, ImmutableFieldReference("Lxz50;", "a", "Lxz50;"))

    @Test fun findsTheStateCreatedAndPushedByThePresenterItself() {
        // 31.9.0 and 32.0.0: the lambda holds the presenter, and Unit was loaded before the switch.
        val method = lambda(castArgument, create(), call(Opcode.INVOKE_VIRTUAL, "Ljava/lang/Object;", "getClass", argument),
            construct, push(self), returns(2))
        assertEquals(1..4, stateHandOver(method, state))
    }

    @Test fun findsTheStatePushedThroughAPresenterLoadedOnTheWay() {
        // 30.7.2: the presenter is read into the argument's register, which the next instruction overwrites.
        val method = lambda(castArgument, create(), call(Opcode.INVOKE_STATIC, "Ldrk;", "k", argument), construct,
            loadPresenter, push(argument), loadUnit, returns(argument))
        assertEquals(1..5, stateHandOver(method, state))
    }

    @Test fun refusesWhenTheStateIsReadAgainAfterwards() {
        assertNull(stateHandOver(lambda(create(), construct, push(self), returns(0)), state))
    }

    @Test fun refusesWhenLaterCodeReadsARegisterTheStretchWrote() {
        assertNull(stateHandOver(lambda(create(), construct, loadPresenter, push(argument), returns(argument)), state))
    }

    @Test fun refusesAStretchThatBranches() {
        val method = lambda(create(), ImmutableInstruction21t(Opcode.IF_EQZ, 1, 3), construct, push(self), returns(2))
        assertNull(stateHandOver(method, state))
    }

    @Test fun refusesTwoPlacesThatCreateTheState() {
        val method = lambda(create(), construct, push(self), create(), construct, push(self), returns(2))
        assertNull(stateHandOver(method, state))
    }

    @Test fun refusesAStateThatIsNeverHandedOn() {
        assertNull(stateHandOver(lambda(create(), construct, returns(2)), state))
    }

    @Test fun tellsWhichMethodCreatesTheState() {
        assertTrue(createsState(lambda(create(), construct, push(self), returns(2)), state))
        assertFalse(createsState(lambda(create("Lonw;"), returns(2)), state))
    }
}
