package io.github.sabopura.morphe.patches.twitch.app

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference
import org.junit.Assert.assertEquals
import org.junit.Test

class ViewEventSubscriptionsTest {
    private val presenter = "LPresenter;"
    private val self = 3
    private val delegate = 4

    private fun call(opcode: Opcode, reference: ImmutableMethodReference, vararg registers: Int) = ImmutableInstruction35c(
        opcode, registers.size, registers.getOrElse(0) { 0 }, registers.getOrElse(1) { 0 }, registers.getOrElse(2) { 0 },
        registers.getOrElse(3) { 0 }, registers.getOrElse(4) { 0 }, reference,
    )

    private fun init(type: String, first: String) = ImmutableMethodReference(type, "<init>", listOf(first, "I"), "V")

    /** `new T(this, case)`, as Twitch builds a Function1. */
    private fun handler(register: Int, type: String, first: String, case: Int) = listOf(
        ImmutableInstruction21c(Opcode.NEW_INSTANCE, register, ImmutableTypeReference(type)),
        ImmutableInstruction11n(Opcode.CONST_4, 2, case),
        call(Opcode.INVOKE_DIRECT, init(type, first), register, self, 2),
    )

    /** The view's EventDispatcher is in [delegate]; its event stream replaces it. */
    private val eventStream = listOf(
        call(Opcode.INVOKE_VIRTUAL, ImmutableMethodReference("Ltv/twitch/android/core/mvp/viewdelegate/EventDispatcher;", "b", emptyList(), "Lio/reactivex/f;"), delegate),
        ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, delegate),
    )

    private fun subscribe(handler: Int, stream: Int) = call(
        Opcode.INVOKE_VIRTUAL,
        ImmutableMethodReference("LBasePresenter;", "S0", listOf("Lio/reactivex/f;", "LDisposeOn;", "Lkotlin/jvm/functions/Function1;"), "V"),
        self, stream, 0, handler,
    )

    private fun found(code: List<Instruction>) = viewEventSubscriptions(code, presenter).map { (ref, case) -> ref.definingClass to case }

    @Test fun findsTheHandlerTypedWithObjectUpTo31() {
        assertEquals(listOf("LHandler;" to 6), found(eventStream + handler(1, "LHandler;", "Ljava/lang/Object;", 6) + subscribe(1, delegate)))
    }

    @Test fun findsTheHandlerTypedWithThePresenterIn32() {
        assertEquals(listOf("LHandler;" to 1), found(eventStream + handler(1, "LHandler;", presenter, 1) + subscribe(1, delegate)))
    }

    @Test fun skipsAFunctionNotSubscribedToTheViewEvents() {
        val toolbar = handler(1, "LToolbarClick;", "Ljava/lang/Object;", 7) +
            call(Opcode.INVOKE_VIRTUAL, ImmutableMethodReference("LToolbar;", "g", listOf("LListener;"), "V"), 0, 1)
        assertEquals(listOf("LHandler;" to 1), found(toolbar + eventStream + handler(1, "LHandler;", presenter, 1) + subscribe(1, delegate)))
    }

    @Test fun skipsAHandlerOfAnotherPresenter() {
        assertEquals(emptyList<Pair<String, Int>>(), found(eventStream + handler(1, "LHandler;", "LOther;", 1) + subscribe(1, delegate)))
    }
}
