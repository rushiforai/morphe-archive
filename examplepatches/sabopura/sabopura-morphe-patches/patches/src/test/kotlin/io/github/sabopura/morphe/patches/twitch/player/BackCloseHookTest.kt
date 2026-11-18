package io.github.sabopura.morphe.patches.twitch.player

import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertThrows
import org.junit.Test

class BackCloseHookTest {
    private val theatre = "LTheatre;"
    private val source = "LSource;"
    private val activity = "Landroidx/fragment/app/r;"
    private val shrink = ImmutableMethodReference(theatre, "D2", listOf(source), "Z")
    private val close = ImmutableMethodReference("LRouter;", "e", listOf(activity, "LTracker;"), "V")

    private fun call(reference: ImmutableMethodReference, vararg registers: Int) = ImmutableInstruction35c(
        Opcode.INVOKE_VIRTUAL, registers.size, registers.getOrElse(0) { 0 }, registers.getOrElse(1) { 0 },
        registers.getOrElse(2) { 0 }, 0, 0, reference,
    )

    private fun load(register: Int, type: String, name: String) =
        ImmutableInstruction21c(Opcode.SGET_OBJECT, register, ImmutableFieldReference(type, name, type))

    private fun method(registers: Int, vararg code: Instruction) = ImmutableMethod("LHandler;", "invoke", emptyList(),
        "Ljava/lang/Object;", AccessFlags.PUBLIC.value, null, null, ImmutableMethodImplementation(registers, code.asIterable(), null, null))

    private fun screen(vararg fieldTypes: String) = ImmutableClassDef(theatre, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null,
        fieldTypes.mapIndexed { index, type -> ImmutableField(theatre, "f$index", type, AccessFlags.PUBLIC.value, null, null, null) }, emptyList())

    // ---- the close call ----

    private val sizing = ImmutableMethodReference("LContainer;", "s", listOf("LSize;", "LAlignment;"), "V")

    @Test fun findsTheCloseTheShrinkMakesWithItsOwnFields() {
        val body = method(4, call(sizing, 0, 1, 2), call(close, 0, 1, 2))
        assertEquals(close.toString(), theatreClose(screen("LRouter;", activity, "LTracker;", "LContainer;"), body).toString())
    }

    @Test fun aCallOnSomethingThePlayerScreenDoesNotHoldIsNotTheClose() {
        val body = method(4, call(close, 0, 1, 2))
        assertNull(theatreClose(screen(activity, "LTracker;"), body))
        assertNull(theatreClose(screen("LRouter;", activity), body))
    }

    @Test fun aTypeHeldTwiceCannotTellWhichFieldToPass() {
        assertNull(theatreClose(screen("LRouter;", activity, "LTracker;", "LTracker;"), method(4, call(close, 0, 1, 2))))
    }

    @Test fun twoDifferentCloseCallsAreNotGuessedBetween() {
        val other = ImmutableMethodReference("LRouter;", "d", listOf(activity, "LTracker;"), "V")
        val body = method(4, call(close, 0, 1, 2), call(other, 0, 1, 2))
        assertNull(theatreClose(screen("LRouter;", activity, "LTracker;"), body))
    }

    @Test fun theSameCloseCalledTwiceIsStillOne() {
        val body = method(4, call(close, 0, 1, 2), call(close, 0, 1, 2))
        assertEquals(close.toString(), theatreClose(screen("LRouter;", activity, "LTracker;"), body).toString())
    }

    // ---- the back handler ----

    private val unit = "Lkotlin/Unit;"

    /** 31.9.0 and 32.0.0: one local, the player screen in the handler's own register. */
    private val newShape = method(2, load(0, source, "BACK_PRESS"), call(shrink, 1, 0), load(1, unit, "a"),
        ImmutableInstruction11x(Opcode.RETURN_OBJECT, 1))

    /** 30.7.2: the player screen in v0, which Twitch then reuses for the result it returns. */
    private val oldShape = method(3, load(1, source, "BACK_PRESS"), call(shrink, 0, 1), load(0, unit, "a"),
        ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0))

    @Test fun hooksRightAfterTheShrinkThatBackAsksFor() {
        val found = backShrink(newShape, shrink, source)!!
        assertEquals(listOf(2, 1, 0), listOf(found.after, found.theatre, found.scratch))
    }

    @Test fun theResultNeverTakesThePlayerScreensRegister() {
        val found = backShrink(oldShape, shrink, source)!!
        assertEquals(listOf(2, 0, 1), listOf(found.after, found.theatre, found.scratch))
    }

    @Test fun theMinimiseButtonAndTheSwipeAreLeftAlone() {
        for (other in listOf("BUTTON_TAP", "SWIPE"))
            assertNull(backShrink(method(2, load(0, source, other), call(shrink, 1, 0), load(1, unit, "a"),
                ImmutableInstruction11x(Opcode.RETURN_OBJECT, 1)), shrink, source))
    }

    @Test fun aShrinkOfAnotherScreenIsNotTheBackHandler() {
        val elsewhere = ImmutableMethodReference("LOther;", "D2", listOf(source), "Z")
        assertNull(backShrink(method(2, load(0, source, "BACK_PRESS"), call(elsewhere, 1, 0),
            ImmutableInstruction11x(Opcode.RETURN_OBJECT, 1)), shrink, source))
    }

    @Test fun aHandlerThatReadsTheResultStopsThePatch() {
        val reads = method(2, load(0, source, "BACK_PRESS"), call(shrink, 1, 0), ImmutableInstruction11x(Opcode.MOVE_RESULT, 0),
            ImmutableInstruction11x(Opcode.RETURN_OBJECT, 1))
        assertThrows(PatchException::class.java) { backShrink(reads, shrink, source) }
    }

    @Test fun aHandlerWithoutASpareRegisterStopsThePatch() {
        // The only local still holds a value the handler returns.
        val busy = method(2, load(0, source, "BACK_PRESS"), call(shrink, 1, 0), ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0))
        assertThrows(PatchException::class.java) { backShrink(busy, shrink, source) }
    }
}
