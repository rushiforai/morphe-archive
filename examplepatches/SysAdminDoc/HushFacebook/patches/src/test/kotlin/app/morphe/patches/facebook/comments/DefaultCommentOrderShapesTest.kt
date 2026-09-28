/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.comments

import app.morphe.ExtensionDex
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.misc.extension.SETTINGS_STATUS
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Default comment order over a stand-in request builder, params class and comment sheet: which
 * methods count as the builder, the params' constructor and the pick handler, what the patch
 * refuses, and the calls it puts first in the constructor and the handler. Each rule has a control
 * that must fail it.
 */
class DefaultCommentOrderShapesTest {
    private val builderOwner = "Lfixture/RequestBuilder;"
    private val sheet = "Lfixture/CommentSheet;"
    private val variables = "Lfixture/Variables;"
    private val string = "Ljava/lang/String;"

    private val feedbackIdField = "$FETCH_FEEDBACK_PARAMS->A04:$string"
    private val focusedField = "$FETCH_FEEDBACK_PARAMS->A07:$string"
    private val orderField = "$FETCH_FEEDBACK_PARAMS->A02:$string"
    private val otherField = "$FETCH_FEEDBACK_PARAMS->A0G:$string"

    private fun method(
        owner: String,
        name: String,
        parameters: List<String>,
        returns: String,
        registers: Int,
        static: Boolean = false,
        constructor: Boolean = false,
        smali: String,
    ): MutableMethod {
        var flags = AccessFlags.PUBLIC.value
        if (static) flags = flags or AccessFlags.STATIC.value
        if (constructor) flags = flags or AccessFlags.CONSTRUCTOR.value
        return MutableMethod(
            ImmutableMethod(
                owner, name, parameters.map { ImmutableMethodParameter(it, null, null) }, returns, flags, null, null,
                ImmutableMethodImplementation(registers, emptyList(), null, null),
            ),
        ).apply { addInstructionsWithLabels(0, smali) }
    }

    /**
     * The builder as both builds write it: each value read from the params into v1, checked, then
     * its name loaded into v0 and both handed on. Parts can change.
     */
    private fun builder(
        owner: String = builderOwner,
        takes: String = FETCH_FEEDBACK_PARAMS,
        orderRead: String = orderField,
        feedbackRead: String = feedbackIdField,
        overwriteOrder: Boolean = false,
        orderTwice: Boolean = false,
    ): MutableMethod = method(
        owner, "build", listOf(takes, USER_SESSION), "Ljava/lang/Object;", 4, smali = """
            iget-object v1, p1, $feedbackRead
            if-eqz v1, :focused
            const-string v0, "$FEEDBACK_ID_VARIABLE"
            invoke-static { v0, v1 }, $variables->put(${string}$string)V
            :focused
            iget-object v1, p1, $focusedField
            if-eqz v1, :order
            const-string v0, "$FOCUSED_COMMENT_VARIABLE"
            invoke-static { v0, v1 }, $variables->put(${string}$string)V
            :order
            iget-object v1, p1, $orderRead
            if-eqz v1, :done
            invoke-virtual { v1 }, $string->length()I
            move-result v0
            ${if (overwriteOrder) "const/4 v1, 0x0" else ""}
            if-eqz v0, :done
            const-string/jumbo v0, "$ORDER_VARIABLE"
            invoke-static { v0, v1 }, $variables->put(${string}$string)V
            ${if (orderTwice) "const-string v0, \"$ORDER_VARIABLE\"" else ""}
            :done
            const/4 v0, 0x0
            return-object v0
        """,
    )

    /**
     * The params' constructor: the feedback id, the focused comment, another string and the order
     * as parameters two to five, each stored into its field. Parts can change.
     */
    private fun constructor(
        orderFrom: String = "p5",
        orderInto: String = "p0",
        overwriteOrder: Boolean = false,
    ): MutableMethod = method(
        FETCH_FEEDBACK_PARAMS, "<init>", listOf("Ljava/lang/Object;", string, string, string, string, "Z"), "V",
        8, constructor = true, smali = """
            invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
            iput-object p2, p0, $feedbackIdField
            iput-object p3, p0, $focusedField
            iput-object p4, p0, $otherField
            ${if (overwriteOrder) "const/4 p5, 0x0" else ""}
            iput-object $orderFrom, $orderInto, $orderField
            iput-boolean p6, p0, $FETCH_FEEDBACK_PARAMS->A0A:Z
            return-void
        """,
    )

    /** The sheet's pick handler: it names the order-change request and fetches with the picked token. */
    private fun handler(
        name: String = "pick",
        parameters: List<String> = listOf(USER_SESSION, string),
        literal: String = PICK_QUERY,
        static: Boolean = false,
    ): MutableMethod = method(
        sheet, name, parameters, "V", 1 + parameters.size + (if (static) 0 else 1), static = static, smali = """
            const-string v0, "$literal"
            return-void
        """,
    )

    /** Like Facebook's refetch beside it: the same request, with the session alone. */
    private fun refresh(): MutableMethod = handler(name = "refresh", parameters = listOf(USER_SESSION))

    private fun classOf(type: String, vararg methods: Method): ClassDef = ImmutableClassDef(
        type, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null, emptyList(), methods.toList(),
    )

    private fun Method.body(): List<Instruction> = implementation!!.instructions.toList()

    private val Instruction.reference: String get() = (this as ReferenceInstruction).reference.toString()

    private fun Instruction.callRegisters(): List<Int> = when (this) {
        is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
        is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
        else -> emptyList()
    }

    private fun build(
        builder: Method = builder(),
        constructor: Method = constructor(),
        handlers: List<Method> = listOf(handler(), refresh()),
    ): List<ClassDef> = listOf(
        classOf(builderOwner, builder),
        classOf(FETCH_FEEDBACK_PARAMS, constructor),
        classOf(sheet, *handlers.toTypedArray()),
        ExtensionDex.classDef(SETTINGS_STATUS),
    )

    private val fields = RequestFields(order = orderField, feedbackId = feedbackIdField, focusedComment = focusedField)

    @Test
    fun `the builder reads each variable's value from the params right before its name`() {
        assertEquals(fields, requestFields(builder()))
        assertNull("another params class", requestFields(builder(takes = "Lfixture/OtherParams;")))
        assertNull("the order's value overwritten before its name",
            requestFields(builder(overwriteOrder = true)))
        assertNull("the order's name loaded twice", requestFields(builder(orderTwice = true)))
        assertNull("the order read from another class",
            requestFields(builder(orderRead = "Lfixture/OtherParams;->A02:$string")))
        assertNull("the order read from a field that isn't a String",
            requestFields(builder(orderRead = "$FETCH_FEEDBACK_PARAMS->A01:Ljava/lang/Object;")))
        assertNull("the order and the feedback id read from one field",
            requestFields(builder(feedbackRead = orderField)))
    }

    @Test
    fun `the constructor stores each from its own parameter, untouched before the store`() {
        // Seven ins after one local: this is v1, and the four strings are v3 to v6.
        assertEquals(RequestRegisters(order = 6, feedbackId = 3, focusedComment = 4), requestRegisters(constructor(), fields))
        assertNull("the order stored from a local", requestRegisters(constructor(orderFrom = "v0"), fields))
        assertNull("the order stored into another object", requestRegisters(constructor(orderInto = "p1"), fields))
        assertNull("the order's parameter written before the store",
            requestRegisters(constructor(overwriteOrder = true), fields))
        assertNull("a method that isn't a constructor", requestRegisters(builder(), fields))
    }

    @Test
    fun `the pick handler takes the session and the token and names the order-change request`() {
        assertTrue(isPickHandler(handler()))
        assertFalse("the refetch beside it", isPickHandler(refresh()))
        assertFalse("another request", isPickHandler(handler(literal = "FetchFeedbackQuery")))
        assertFalse("a static method", isPickHandler(handler(static = true)))
        assertFalse("other parameters", isPickHandler(handler(parameters = listOf(string, USER_SESSION))))
    }

    @Test
    fun `the patch asks the extension first in the constructor and tells it first in the handler`() {
        val context = PatchContexts.of(build())

        defaultCommentOrderPatch.execute(context)

        val constructor = context.mutableClassDefBy(FETCH_FEEDBACK_PARAMS).methods.single().body()
        assertEquals(Opcode.INVOKE_STATIC, constructor[0].opcode)
        assertEquals(REQUESTED_ORDER, constructor[0].reference)
        assertEquals(listOf(6, 3, 4), constructor[0].callRegisters())
        assertEquals(Opcode.MOVE_RESULT_OBJECT, constructor[1].opcode)
        assertEquals(6, (constructor[1] as OneRegisterInstruction).registerA)
        assertEquals(Opcode.INVOKE_DIRECT, constructor[2].opcode)
        assertEquals(this.constructor().body().map { it.opcode }, constructor.drop(2).map { it.opcode })

        val methods = context.mutableClassDefBy(sheet).methods
        val pick = methods.single { it.name == "pick" }.body()
        assertEquals(Opcode.INVOKE_STATIC_RANGE, pick[0].opcode)
        assertEquals(PICKED, pick[0].reference)
        assertEquals("the picked token, the handler's last register", listOf(3), pick[0].callRegisters())
        assertEquals(listOf(Opcode.CONST_STRING, Opcode.RETURN_VOID), pick.drop(1).map { it.opcode })
        assertEquals("the refetch is left alone", listOf(Opcode.CONST_STRING, Opcode.RETURN_VOID),
            methods.single { it.name == "refresh" }.body().map { it.opcode })

        val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "defaultCommentOrder" }
        val answer = status.body().first { it is NarrowLiteralInstruction }
        assertEquals("the settings screen isn't told the patch is in", 1, (answer as NarrowLiteralInstruction).narrowLiteral)
    }

    @Test
    fun `a build whose request or pick can't be told apart is refused`() {
        fun refusal(classes: List<ClassDef>): String {
            val context = PatchContexts.of(classes)
            return assertThrows(PatchException::class.java) { defaultCommentOrderPatch.execute(context) }.message!!
        }
        val noBuilder = refusal(build(builder = builder(overwriteOrder = true)))
        assertTrue(noBuilder, noBuilder.contains("request builder") && noBuilder.contains("found 0"))
        val twoBuilders = refusal(build() + classOf("Lfixture/OtherBuilder;", builder(owner = "Lfixture/OtherBuilder;")))
        assertTrue(twoBuilders, twoBuilders.contains("found 2"))
        val noConstructor = refusal(build(constructor = constructor(orderFrom = "v0")))
        assertTrue(noConstructor, noConstructor.contains("constructor of $FETCH_FEEDBACK_PARAMS") &&
            noConstructor.contains("found 0"))
        val noHandler = refusal(build(handlers = listOf(refresh())))
        assertTrue(noHandler, noHandler.contains("pick handler") && noHandler.contains("found 0"))
    }
}
