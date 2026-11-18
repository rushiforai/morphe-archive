package io.github.sabopura.morphe.patches.twitch.player

import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Test

class PipShrinkHookTest {
    private val theatre = "Ltv/twitch/android/feature/theatre/TheatreModeFragment;"
    private val presenter = "Ljb40;"
    private val source = "Lz1q;"
    private val inner = "Lb840;"

    private fun method(owner: String, name: String, parameters: List<String>, returns: String, registers: Int, vararg code: Instruction) =
        ImmutableMethod(owner, name, parameters.map { ImmutableMethodParameter(it, null, null) }, returns,
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, null, null,
            ImmutableMethodImplementation(registers, code.asIterable(), null, null))

    private fun call(opcode: Opcode, owner: String, name: String, parameters: List<String>, returns: String, vararg registers: Int) =
        ImmutableInstruction35c(opcode, registers.size, registers.getOrElse(0) { 0 }, registers.getOrElse(1) { 0 }, 0, 0, 0,
            ImmutableMethodReference(owner, name, parameters, returns))

    private fun field(opcode: Opcode, target: Int, holder: Int, owner: String, name: String, type: String) =
        ImmutableInstruction22c(opcode, target, holder, ImmutableFieldReference(owner, name, type))

    private fun constant(register: Int, name: String) =
        ImmutableInstruction21c(Opcode.SGET_OBJECT, register, ImmutableFieldReference(source, name, source))

    // 31.9.0's shrinkPlayer(): one local, `this` in v1.
    private fun screenShrinkWith(constant: String) = method(theatre, "shrinkPlayer", emptyList(), "Z", 2,
        field(Opcode.IGET_OBJECT, 0, 1, theatre, "Q", presenter),
        ImmutableInstruction21t(Opcode.IF_NEZ, 0, 3),
        ImmutableInstruction11n(Opcode.CONST_4, 1, 0),
        ImmutableInstruction11x(Opcode.RETURN, 1),
        call(Opcode.INVOKE_VIRTUAL, theatre, "S", emptyList(), presenter, 1),
        ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 1),
        constant(0, constant),
        call(Opcode.INVOKE_VIRTUAL, presenter, "F2", listOf(source), "Z", 1, 0),
        ImmutableInstruction11x(Opcode.MOVE_RESULT, 1),
        ImmutableInstruction11x(Opcode.RETURN, 1))

    @Test fun findsThePresenterAndTheShrinkThatOtherScreensCall() {
        val found = screenShrink(screenShrinkWith("BUTTON_TAP"))!!
        assertEquals(0, found.read)
        assertEquals(0, found.presenter)
        assertEquals("$source->BUTTON_TAP:$source", found.source.toString())
        assertEquals("$presenter->F2($source)Z", found.shrink.toString())
    }

    @Test fun leavesTheBackHandlersShrinkAlone() {
        assertNull(screenShrink(screenShrinkWith("BACK_PRESS")))
    }

    // The merged picture-in-picture listener's accept(Object): `this` in v1 becomes the presenter, the info in v2 the flag.
    private val readsTheFlag = listOf<Instruction>(
        field(Opcode.IGET_OBJECT, 1, 1, "Lmnt;", "b", "Ljava/lang/Object;"),
        call(Opcode.INVOKE_VIRTUAL, theatre, "S", emptyList(), presenter, 1),
        ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 1),
        call(Opcode.INVOKE_VIRTUAL, "Lsnt;", "a", emptyList(), "Z", 2),
        ImmutableInstruction11x(Opcode.MOVE_RESULT, 2),
        field(Opcode.IPUT_BOOLEAN, 2, 1, presenter, "M", "Z"),
        field(Opcode.IGET_OBJECT, 0, 1, presenter, "m", inner),
        call(Opcode.INVOKE_INTERFACE, inner, "onPictureInPictureModeChanged", listOf("Z"), "V", 0, 2))

    private fun listener(vararg rest: Instruction) =
        method("Lmnt;", "accept", listOf("Ljava/lang/Object;"), "V", 3, *(readsTheFlag + rest).toTypedArray())

    @Test fun hooksBehindTheHandOverAndBorrowsTheInnerPlayersRegister() {
        val method = listener(
            field(Opcode.IGET_OBJECT, 1, 1, presenter, "r", "Limh;"),
            call(Opcode.INVOKE_VIRTUAL, "Limh;", "t", emptyList(), "V", 1),
            ImmutableInstruction10x(Opcode.RETURN_VOID))
        val forward = pipForward(method, presenter)!!
        assertEquals(8, forward.after)
        assertEquals(1, forward.presenter)
        assertEquals(2, forward.pip)
        assertEquals(0, forward.scratch)
    }

    @Test fun refusesWhenNoLocalIsFreeBehindTheHandOver() {
        val method = listener(
            call(Opcode.INVOKE_VIRTUAL, inner, "g", emptyList(), "V", 0),
            ImmutableInstruction10x(Opcode.RETURN_VOID))
        assertNull(pipForward(method, presenter))
    }

    @Test fun refusesAHandOverThatLoadsTheInnerPlayerOverThePresenter() {
        val method = method("Lmnt;", "accept", listOf("Ljava/lang/Object;"), "V", 3,
            field(Opcode.IGET_OBJECT, 1, 1, presenter, "m", inner),
            call(Opcode.INVOKE_INTERFACE, inner, "onPictureInPictureModeChanged", listOf("Z"), "V", 1, 2),
            ImmutableInstruction10x(Opcode.RETURN_VOID))
        assertNull(pipForwardCall(method, presenter))
    }

    @Test fun ignoresAHandOverFromAnotherPresenter() {
        val method = listener(ImmutableInstruction10x(Opcode.RETURN_VOID))
        assertNull(pipForwardCall(method, "Lother;"))
    }
}
