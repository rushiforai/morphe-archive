/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.ads.sponsoredmarketplace

import app.morphe.ExtensionDex
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.misc.extension.SETTINGS_STATUS
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertSame
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Stand-ins for the parts of Facebook's Networking module the answer hooks read: the Tigon callbacks
 * with onBody handing each piece of text on and onEOM handing the whole of it, the request's state
 * and the object holding it, React Native's two emitters, and the state's constructor.
 */
internal object ResponseStandIns {
    const val STATE = "Lfixture/RequestState;"
    const val REQUEST = "Lfixture/TigonRequest;"
    const val EMITTERS = "Lfixture/ResponseUtil;"
    const val CONTEXT = "Lfixture/ReactContext;"
    const val TRACKING = "$STATE->tracking:Ljava/lang/String;"

    const val PIECE = "$EMITTERS->piece($CONTEXT${"Ljava/lang/String;"}Ljava/lang/String;IJJ)V"
    private const val WHOLE = "$EMITTERS->whole($CONTEXT${"Ljava/lang/String;"}Ljava/lang/String;Ljava/lang/String;I)V"
    const val END = "$EMITTERS->end($CONTEXT${"Ljava/lang/String;"}IJ)V"

    fun method(
        owner: String,
        name: String,
        parameters: List<String>,
        locals: Int,
        smali: String,
        static: Boolean = false,
    ): MutableMethod {
        var flags = AccessFlags.PUBLIC.value
        if (static) flags = flags or AccessFlags.STATIC.value
        val ins = parameters.fold(if (static) 0 else 1) { count, type -> count + if (type == "J" || type == "D") 2 else 1 }
        return MutableMethod(
            ImmutableMethod(
                owner, name, parameters.map { ImmutableMethodParameter(it, null, null) }, "V", flags, null, null,
                ImmutableMethodImplementation(locals + ins, emptyList(), null, null),
            ),
        ).apply { addInstructionsWithLabels(0, smali) }
    }

    fun classOf(type: String, vararg methods: Method): ClassDef = ImmutableClassDef(
        type, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null, emptyList(), methods.toList(),
    )

    /** What sendRequest does with the tracking name it read into [name]: builds the state with it. */
    fun buildsTheState(name: String, into: String = "v9") = """
        new-instance $into, $STATE
        invoke-direct { $into, v6, $name }, $STATE-><init>(Ljava/lang/String;Ljava/lang/String;)V
    """

    /** onBody: decode, toString(), and the piece goes to the emitter with the state's context. */
    fun onBody(textFrom: String = "toString", contextFrom: String = "state", branchIn: Boolean = false) = method(
        CALLBACKS, "onBody", listOf("Ljava/nio/ByteBuffer;"), 13, """
            iget-object v1, p0, $CALLBACKS->this${'$'}0:$REQUEST
            iget-object v4, v1, $REQUEST->state:$STATE
            sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;
            invoke-virtual { v0, p1 }, Ljava/nio/charset/Charset;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;
            move-result-object v2
            ${if (branchIn) "if-eqz v2, :after" else ""}
            ${if (textFrom == "toString") "invoke-virtual { v2 }, Ljava/lang/Object;->toString()Ljava/lang/String;" else "invoke-virtual { v2 }, Ljava/nio/CharBuffer;->trim()Ljava/lang/String;"}
            move-result-object v7
            :after
            ${if (contextFrom == "state") "iget-object v5, v4, $STATE->context:$CONTEXT" else "sget-object v5, $EMITTERS->context:$CONTEXT"}
            iget-object v6, v4, $STATE->id:Ljava/lang/String;
            const/4 v8, 0x0
            const-wide/16 v9, 0x0
            const-wide/16 v11, 0x0
            invoke-static/range { v5 .. v12 }, $PIECE
            return-void
        """,
    )

    /**
     * onEOM: the StringBuilder's toString() goes to the whole emitter, then the answer is reported
     * complete with the state's context and id, the request's number and a length.
     */
    fun onEom(end: Boolean = true, endContextFrom: String = "state", jumpToEnd: Boolean = false, locals: Int = 15) = method(
        CALLBACKS, "onEOM", emptyList(), locals, """
            iget-object v2, p0, $CALLBACKS->this${'$'}0:$REQUEST
            iget-object v5, v2, $REQUEST->state:$STATE
            iget-object v0, p0, $CALLBACKS->mDataBuilder:Ljava/lang/StringBuilder;
            invoke-virtual { v0 }, Ljava/lang/Object;->toString()Ljava/lang/String;
            move-result-object v3
            iget-object v2, v5, $STATE->context:$CONTEXT
            iget-object v1, v5, $STATE->id:Ljava/lang/String;
            const-string v0, "text"
            const/4 v4, 0x0
            invoke-static { v2, v1, v3, v0, v4 }, $WHOLE
            ${if (!end) "" else """
                ${if (endContextFrom == "state") "iget-object v0, v5, $STATE->context:$CONTEXT" else "sget-object v0, $EMITTERS->context:$CONTEXT"}
                iget-object v1, v5, $STATE->id:Ljava/lang/String;
                const/4 v2, 0x1
                const-wide/16 v3, 0x0
                ${if (jumpToEnd) "if-eqz v5, :end\nconst/4 v6, 0x0" else ""}
                :end
                invoke-static { v0, v1, v2, v3, v4 }, $END
            """}
            return-void
        """,
    )

    /** React Native's emitters, each holding its event's name unless told otherwise. */
    fun emitters(pieceEvent: String = PIECE_EVENT, endEvent: String = END_EVENT) = classOf(
        EMITTERS,
        method(EMITTERS, "piece", listOf(CONTEXT, "Ljava/lang/String;", "Ljava/lang/String;", "I", "J", "J"), 1,
            "const-string v0, \"$pieceEvent\"\nreturn-void", static = true),
        method(EMITTERS, "whole", listOf(CONTEXT, "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", "I"), 1,
            "const-string v0, \"$WHOLE_EVENT\"\nreturn-void", static = true),
        method(EMITTERS, "end", listOf(CONTEXT, "Ljava/lang/String;", "I", "J"), 1,
            "const-string v0, \"$endEvent\"\nreturn-void", static = true),
    )

    /** The state's constructor: the body, then the tracking name, each kept in a field. */
    fun stateInit(storesTwice: Boolean = false, overwrites: Boolean = false) = method(
        STATE, "<init>", listOf("Ljava/lang/String;", "Ljava/lang/String;"), 0, """
            ${if (overwrites) "move-object p2, p1" else ""}
            iput-object p1, p0, $STATE->body:Ljava/lang/String;
            iput-object p2, p0, $TRACKING
            ${if (storesTwice) "iput-object p2, p0, $STATE->id:Ljava/lang/String;" else ""}
            invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
            return-void
        """,
    )

    fun classes(callbacks: ClassDef = classOf(CALLBACKS, onBody(), onEom())) =
        listOf(callbacks, classOf(STATE, stateInit()), emitters())
}

/**
 * Hide sponsored Marketplace listings' answer hooks over the stand-ins: where each text lands, where
 * the tracking name is kept, what the patch refuses, and the calls it puts in. Each rule has a
 * control that must fail it.
 */
class MarketplaceResponseShapesTest {
    private val module = "Lfixture/NetworkingModule;"

    private fun Method.body(): List<Instruction> = implementation!!.instructions.toList()

    private fun lookup(vararg classes: ClassDef) = { reference: MethodReference ->
        classes.firstOrNull { it.type == reference.definingClass }?.methods?.firstOrNull {
            it.name == reference.name && it.parameterTypes.map(CharSequence::toString) == reference.parameterTypes.map(CharSequence::toString)
        }
    }

    /** sendRequest reduced to what trackingField reads: the tracking name read, then the state built with it. */
    private fun sendRequest(nameAlsoAsBody: Boolean = false) = ResponseStandIns.method(
        module, SEND_REQUEST, SEND_REQUEST_PARAMETERS, 17, """
            move-object/from16 v1, p6
            const-string v6, "body"
            const-string/jumbo v0, "$TRACKING_NAME"
            invoke-interface { v1, v0 }, $GET_STRING
            move-result-object v5
            if-nez v5, :named
            const-string v5, "react_native"
            :named
            ${if (nameAlsoAsBody) "move-object v6, v5" else ""}
            ${ResponseStandIns.buildsTheState("v5")}
            return-void
        """,
    )

    @Test
    fun `each text is found where it lands, with the request's state beside it`() {
        val handOffs = textHandOffs(ResponseStandIns.classOf(CALLBACKS, ResponseStandIns.onBody(), ResponseStandIns.onEom()),
            lookup(ResponseStandIns.emitters()))
        val piece = handOffs.single { !it.whole }
        assertEquals("onBody", piece.method.name)
        assertEquals(listOf(6, 7, 4), listOf(piece.landed, piece.text, piece.state))
        val whole = handOffs.single { it.whole }
        assertEquals("onEOM", whole.method.name)
        assertEquals(listOf(4, 3, 5), listOf(whole.landed, whole.text, whole.state))
        assertEquals(setOf(ResponseStandIns.STATE), handOffs.map { it.stateType }.toSet())
    }

    @Test
    fun `a text that isn't found the way the hook needs it is left alone`() {
        fun pieces(callbacks: ClassDef, emitters: ClassDef = ResponseStandIns.emitters()) =
            textHandOffs(callbacks, lookup(emitters)).count { !it.whole }
        assertEquals(1, pieces(ResponseStandIns.classOf(CALLBACKS, ResponseStandIns.onBody())))
        assertEquals("an emitter without its event", 0,
            pieces(ResponseStandIns.classOf(CALLBACKS, ResponseStandIns.onBody()), ResponseStandIns.emitters(pieceEvent = "other")))
        assertEquals("a text that isn't a toString()", 0,
            pieces(ResponseStandIns.classOf(CALLBACKS, ResponseStandIns.onBody(textFrom = "trim"))))
        assertEquals("a context from somewhere else", 0,
            pieces(ResponseStandIns.classOf(CALLBACKS, ResponseStandIns.onBody(contextFrom = "static"))))
        assertEquals("a branch around the text", 0,
            pieces(ResponseStandIns.classOf(CALLBACKS, ResponseStandIns.onBody(branchIn = true))))
    }

    @Test
    fun `the tracking name is the field the state's constructor keeps it in`() {
        val state = ResponseStandIns.classOf(ResponseStandIns.STATE, ResponseStandIns.stateInit())
        val field = trackingField(sendRequest(), ResponseStandIns.STATE, lookup(state))
        assertNotNull(field)
        assertEquals(ResponseStandIns.TRACKING, field.toString())
        assertNull("the name passed twice", trackingField(sendRequest(nameAlsoAsBody = true), ResponseStandIns.STATE, lookup(state)))
        assertNull("kept in two fields", trackingField(sendRequest(), ResponseStandIns.STATE,
            lookup(ResponseStandIns.classOf(ResponseStandIns.STATE, ResponseStandIns.stateInit(storesTwice = true)))))
        assertNull("written over first", trackingField(sendRequest(), ResponseStandIns.STATE,
            lookup(ResponseStandIns.classOf(ResponseStandIns.STATE, ResponseStandIns.stateInit(overwrites = true)))))
        assertNull("another class's constructor", trackingField(sendRequest(), "Lfixture/Other;", lookup(state)))
    }

    @Test
    fun `the patch hands each text over right where it lands`() {
        val send = sendRequestWithBody()
        val context = PatchContexts.of(
            listOf(ResponseStandIns.classOf(module, send), ExtensionDex.classDef(SETTINGS_STATUS)) + ResponseStandIns.classes(),
        )
        hideSponsoredMarketplaceListingsPatch.execute(context)
        for ((name, original, call, text, state) in listOf(
            Hand("onBody", ResponseStandIns.onBody(), RESPONSE_PIECE, 7, 4),
            Hand("onEOM", ResponseStandIns.onEom(), RESPONSE_WHOLE, 3, 5),
        )) {
            val at = original.body().indexOfFirst { it.opcode == Opcode.MOVE_RESULT_OBJECT && (it as OneRegisterInstruction).registerA == text } + 1
            val patched = context.mutableClassDefBy(CALLBACKS).methods.single { it.name == name }.body()
            val read = patched[at]
            assertEquals("$name: the name's read", Opcode.IGET_OBJECT, read.opcode)
            assertEquals(ResponseStandIns.TRACKING, (read as ReferenceInstruction).reference.toString())
            assertEquals("$name: off the state", state, (read as TwoRegisterInstruction).registerB)
            assertEquals("$name: a local nothing reads afterwards", 0, read.registerA)
            assertEquals(call, (patched[at + 1] as ReferenceInstruction).reference.toString())
            assertEquals(if (call == RESPONSE_WHOLE) listOf(text, 0) else listOf(text, 0, state), patched[at + 1].namedRegisters())
            assertEquals(text, (patched[at + 2] as OneRegisterInstruction).registerA)
            // onEOM also gets the end's nine instructions, right before its end call (which moved down three).
            val end = original.body().indexOfFirst { (it as? ReferenceInstruction)?.reference?.toString() == ResponseStandIns.END }
            val flush = if (end < 0) IntRange.EMPTY else end + 3..end + 11
            assertEquals("$name: nothing else changes", original.body().map { it.opcode },
                patched.filterIndexed { index, _ -> index !in at..at + 2 && index !in flush }.map { it.opcode })
        }
    }

    @Test
    fun `what still waits at the end goes to JavaScript as one last piece before the answer is reported complete`() {
        val end = answerEnds(ResponseStandIns.classOf(CALLBACKS, ResponseStandIns.onBody(), ResponseStandIns.onEom()),
            ResponseStandIns.STATE, lookup(ResponseStandIns.emitters())).single()
        assertEquals("onEOM", end.method.name)
        assertEquals(listOf(14, 0, 1, 2, 5), listOf(end.call, end.context, end.id, end.number, end.state))

        val context = PatchContexts.of(
            listOf(ResponseStandIns.classOf(module, sendRequestWithBody()), ExtensionDex.classDef(SETTINGS_STATUS)) + ResponseStandIns.classes(),
        )
        hideSponsoredMarketplaceListingsPatch.execute(context)
        val patched = context.mutableClassDefBy(CALLBACKS).methods.single { it.name == "onEOM" }.body()
        // The whole text's three instructions went in above it, so the end's start moved down three.
        val at = end.call + 3
        assertEquals(RESPONSE_END, (patched[at] as ReferenceInstruction).reference.toString())
        assertEquals("the state", listOf(5), patched[at].namedRegisters())
        // The end call reads v0 to v4 and nothing reads anything after it, so v5 to v12 carry the last piece.
        assertEquals(listOf(Opcode.MOVE_RESULT_OBJECT, Opcode.IF_EQZ), listOf(patched[at + 1].opcode, patched[at + 2].opcode))
        assertEquals(listOf(7), patched[at + 1].namedRegisters())
        assertEquals(listOf(7), patched[at + 2].namedRegisters())
        assertSame("nothing waits: straight on to the end call", patched[at + 9],
            (patched[at + 2] as BuilderOffsetInstruction).target.location.instruction)
        assertEquals("the context, the id and the number the end call is given",
            listOf(listOf(5, 0), listOf(6, 1), listOf(8, 2)), (3..5).map { patched[at + it].namedRegisters() })
        assertEquals(listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_FROM16, Opcode.CONST_WIDE_16,
            Opcode.CONST_WIDE_16, Opcode.INVOKE_STATIC_RANGE), (3..8).map { patched[at + it].opcode })
        assertEquals(ResponseStandIns.PIECE, (patched[at + 8] as ReferenceInstruction).reference.toString())
        assertEquals((5..12).toList(), patched[at + 8].namedRegisters())
        assertEquals(ResponseStandIns.END, (patched[at + 9] as ReferenceInstruction).reference.toString())
    }

    @Test
    fun `an end that isn't found the way the hook needs it is left alone`() {
        fun ends(onEom: Method, emitters: ClassDef = ResponseStandIns.emitters()) =
            answerEnds(ResponseStandIns.classOf(CALLBACKS, onEom), ResponseStandIns.STATE, lookup(emitters)).size
        assertEquals(1, ends(ResponseStandIns.onEom()))
        assertEquals("an emitter without its event", 0, ends(ResponseStandIns.onEom(), ResponseStandIns.emitters(endEvent = "other")))
        assertEquals("a context from somewhere else", 0, ends(ResponseStandIns.onEom(endContextFrom = "static")))
        assertEquals("a jump straight to the call", 0, ends(ResponseStandIns.onEom(jumpToEnd = true)))
        assertEquals("another state", 0, answerEnds(ResponseStandIns.classOf(CALLBACKS, ResponseStandIns.onEom()), "Lfixture/Other;",
            lookup(ResponseStandIns.emitters())).size)
    }

    @Test
    fun `a build whose answers can't be followed is refused`() {
        fun refusal(classes: List<ClassDef>): String {
            val context = PatchContexts.of(
                listOf(ResponseStandIns.classOf(module, sendRequestWithBody()), ExtensionDex.classDef(SETTINGS_STATUS)) + classes,
            )
            return assertThrows(PatchException::class.java) { hideSponsoredMarketplaceListingsPatch.execute(context) }.message!!
        }
        val none = refusal(listOf(ResponseStandIns.classOf(ResponseStandIns.STATE, ResponseStandIns.stateInit()), ResponseStandIns.emitters()))
        assertTrue(none, none.contains("has no $CALLBACKS"))
        val oneWay = refusal(ResponseStandIns.classes(ResponseStandIns.classOf(CALLBACKS, ResponseStandIns.onBody())))
        assertTrue(oneWay, oneWay.contains("found 1 and 0"))
        val unkept = refusal(listOf(ResponseStandIns.classOf(CALLBACKS, ResponseStandIns.onBody(), ResponseStandIns.onEom()),
            ResponseStandIns.classOf(ResponseStandIns.STATE, ResponseStandIns.stateInit(storesTwice = true)), ResponseStandIns.emitters()))
        assertTrue(unkept, unkept.contains("kept in one String field"))
        val endless = refusal(ResponseStandIns.classes(ResponseStandIns.classOf(CALLBACKS, ResponseStandIns.onBody(),
            ResponseStandIns.onEom(end = false))))
        assertTrue(endless, endless.contains("report an answer complete once, with the request's state at hand, found 0"))
        val cramped = refusal(ResponseStandIns.classes(ResponseStandIns.classOf(CALLBACKS, ResponseStandIns.onBody(),
            ResponseStandIns.onEom(locals = 12))))
        assertTrue(cramped, cramped.contains("no eight locals in a row"))
    }

    private data class Hand(val name: String, val original: Method, val call: String, val text: Int, val state: Int)

    /** A sendRequest the request hook can read too: the body into a StringEntity, then the state. */
    private fun sendRequestWithBody() = ResponseStandIns.method(
        module, SEND_REQUEST, SEND_REQUEST_PARAMETERS, 17, """
            move-object/from16 v1, p6
            const-string v0, "$NETWORKING_TAG"
            const-string/jumbo v11, "$BODY_KEY"
            invoke-interface { v1, v11 }, $GET_STRING
            move-result-object v6
            new-instance v12, Lorg/apache/http/entity/StringEntity;
            const-string v0, "UTF-8"
            invoke-direct { v12, v6, v0 }, $STRING_ENTITY_INIT
            const-string/jumbo v0, "$TRACKING_NAME"
            invoke-interface { v1, v0 }, $GET_STRING
            move-result-object v5
            ${ResponseStandIns.buildsTheState("v5")}
            return-void
        """,
    )
}
