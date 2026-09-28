/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.chats

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertSame
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The parts of Hide the Get Messenger card that need no Facebook build: which methods the anchors
 * take and turn down, and the code the hook puts first in the card's show question.
 */
class MessengerCardShapesTest {
    private val owner = "Lfixture/MessengerPlugin;"
    private val questionParameters = listOf(
        "Landroid/content/Context;", "Lcom/facebook/auth/usersession/FbUserSession;", "Lfixture/Helper;",
        "Lfixture/OtherHelper;", THREAD_LIST_PARAMS, "Lfixture/ListState;",
    )
    private val builderParameters = listOf(
        "Lcom/facebook/auth/usersession/FbUserSession;", "Lfixture/Context;", "Lfixture/Helper;", THREAD_LIST_PARAMS,
        "I", "Z",
    )

    /** A method loading each of [literals], then answering false (a boolean) or returning. */
    private fun method(
        name: String,
        parameters: List<String>,
        returnType: String,
        registers: Int,
        vararg literals: String,
        static: Boolean = false,
        definingClass: String = owner,
    ): Method = ImmutableMethod(
        definingClass,
        name,
        parameters.map { ImmutableMethodParameter(it, null, null) },
        returnType,
        AccessFlags.PUBLIC.value or AccessFlags.FINAL.value or (if (static) AccessFlags.STATIC.value else 0),
        null,
        null,
        ImmutableMethodImplementation(
            registers,
            literals.map { ImmutableInstruction21c(Opcode.CONST_STRING, 0, ImmutableStringReference(it)) } +
                if (returnType == "Z") {
                    listOf(ImmutableInstruction11n(Opcode.CONST_4, 0, 0), ImmutableInstruction11x(Opcode.RETURN, 0))
                } else {
                    listOf(ImmutableInstruction10x(Opcode.RETURN_VOID))
                },
            null,
            null,
        ),
    )

    private fun question(parameters: List<String> = questionParameters, static: Boolean = false, returnType: String = "Z") =
        method("AfW", parameters, returnType, 9, static = static)

    private fun builder(vararg literals: String = arrayOf(TOP_BANNER_TAG), parameters: List<String> = builderParameters) =
        method("B8u", parameters, "Lfixture/Component;", 18, *literals)

    private fun plugin(vararg methods: Method) =
        ImmutableClassDef(owner, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", listOf("Lfixture/Plugin;"), null, null,
            null, methods.toList())

    @Test
    fun `the show question is the instance boolean over the context, the session and the list's params`() {
        assertTrue(isShowQuestion(question()))
        assertFalse(isShowQuestion(question(static = true)))
        assertFalse(isShowQuestion(question(returnType = "V")))
        // The params moved: another plugin interface's method, not this one.
        assertFalse(isShowQuestion(question(questionParameters.reversed())))
        assertFalse(isShowQuestion(question(questionParameters.dropLast(1))))
        assertFalse(isShowQuestion(question(questionParameters.map { if (it == THREAD_LIST_PARAMS) "Lfixture/Params;" else it })))
    }

    @Test
    fun `the card's builder takes the list's params and loads the banner's tag`() {
        assertTrue(isCardBuilder(builder()))
        assertFalse(isCardBuilder(builder(literals = arrayOf())))
        // The dismiss button's tag is the card's, but it's loaded by the card, not by its builder.
        assertFalse(isCardBuilder(builder("$TOP_BANNER_TAG-dismiss-button")))
        assertFalse(isCardBuilder(builder(parameters = builderParameters.filter { it != THREAD_LIST_PARAMS })))
        assertFalse(isCardBuilder(method("B8u", builderParameters, "Lfixture/Component;", 18, TOP_BANNER_TAG, static = true)))
        assertFalse(isCardBuilder(method("B8u", builderParameters, "Z", 18, TOP_BANNER_TAG)))
    }

    @Test
    fun `the question is taken only from a plugin with one builder and one question`() {
        val question = question()
        assertSame(question, cardQuestion(plugin(question, builder())))
        // Negative controls: the same question on a plugin whose builder shows another banner,
        // on one with no builder, one with two builders, and one with two questions.
        assertNull(cardQuestion(plugin(question, builder("mib-notification-push-upsell-banner"))))
        assertNull(cardQuestion(plugin(question)))
        assertNull(cardQuestion(plugin(question, builder(), method("B8v", builderParameters, "Lfixture/Component;", 18,
            TOP_BANNER_TAG))))
        assertNull(cardQuestion(plugin(question, builder(), method("AfX", questionParameters, "Z", 9))))
        assertNull(cardQuestion(plugin(question(static = true), builder())))
    }

    private fun MutableMethod.at(index: Int) = implementation!!.instructions.elementAt(index)

    @Test
    fun `the question answers no first thing while the card goes and asks its own question otherwise`() {
        val question = MutableMethod(question())
        val own = question.implementation!!.instructions.count()
        question.answerNoWhileHidden()
        val hook = (question.at(0) as ReferenceInstruction).reference as MethodReference
        assertEquals(Opcode.INVOKE_STATIC, question.at(0).opcode)
        assertEquals("Lapp/morphe/extension/facebook/chats/MessengerCard;->hide()Z",
            hook.definingClass + "->" + hook.name + "()" + hook.returnType)
        assertTrue(hook.parameterTypes.isEmpty())
        assertEquals(Opcode.MOVE_RESULT, question.at(1).opcode)
        assertEquals(Opcode.IF_EQZ, question.at(2).opcode)
        assertEquals(Opcode.CONST_4, question.at(3).opcode)
        assertEquals("the hook's answer isn't no", 0, (question.at(3) as NarrowLiteralInstruction).narrowLiteral)
        assertEquals(Opcode.RETURN, question.at(4).opcode)
        // The hook borrows v0, a local no parameter sits in, and answers from it.
        assertEquals(0, (question.at(1) as OneRegisterInstruction).registerA)
        assertEquals(0, (question.at(4) as OneRegisterInstruction).registerA)
        // The branch lands on the question's own first instruction, so none of it is skipped.
        assertEquals(own + 5, question.implementation!!.instructions.count())
        assertEquals(Opcode.CONST_4, question.at(5).opcode)
        assertEquals(5, offsetTarget(question, 2))
    }

    /** A question with no local register to borrow is refused by name, before anything goes in. */
    @Test
    fun `a question with no local to borrow stops the patch`() {
        val tight = MutableMethod(method("AfW", questionParameters, "Z", 7))
        val refusal = assertThrows(PatchException::class.java) { tight.answerNoWhileHidden() }
        assertTrue(refusal.message, refusal.message!!.contains(PATCH))
        assertEquals(Opcode.CONST_4, tight.at(0).opcode)
        assertEquals(2, tight.implementation!!.instructions.count())
    }

    /** The instruction index a branch at [index] lands on. */
    private fun offsetTarget(method: MutableMethod, index: Int): Int {
        val instructions = method.implementation!!.instructions.toList()
        val branch = instructions[index] as OffsetInstruction
        var address = 0
        val addresses = instructions.map { val at = address; address += it.codeUnits; at }
        return addresses.indexOf(addresses[index] + branch.codeOffset)
    }
}
