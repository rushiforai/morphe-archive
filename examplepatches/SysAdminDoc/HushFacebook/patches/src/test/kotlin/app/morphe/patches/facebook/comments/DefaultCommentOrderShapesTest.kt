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
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Default comment order over a stand-in request builder, params class, comment sheet, section
 * renderer and post page: which methods count as the builder, the params' constructor, the pick
 * handler and the sort menu's header, what the patch refuses, the calls it puts first in the
 * constructor, the handler and the header, and the ask before the post page's params are built.
 * Each rule has a control that must fail it.
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

    private val renderer = "Lfixture/CommentSection;"
    private val keyOwner = "Lfixture/SectionKeys;"
    private val header = "Lfixture/SortHeader;"
    private val feedback = "Lfixture/Feedback;"
    private val function1 = "Lkotlin/jvm/functions/Function1;"
    private val headerParameters = listOf(USER_SESSION, feedback, string, function1)
    private val keyMap = "$keyOwner->A00:Ljava/util/Map;"

    /** The sort menu's header: the session, the feedback, a string and the pick, five registers like 582's. */
    private fun sortHeader(): MutableMethod = method(
        header, "<init>", headerParameters, "V", 5, constructor = true, smali = """
            invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
            iput-object p2, p0, $header->A01:$feedback
            iput-object p4, p0, $header->A03:$function1
            return-void
        """,
    )

    /** The class whose static map holds the key the header is filed under. */
    private fun keys(key: String = SELECTOR_KEY): ClassDef = ImmutableClassDef(
        keyOwner, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null,
        listOf(ImmutableField(keyOwner, "A00", "Ljava/util/Map;",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or AccessFlags.FINAL.value, null, null, null)),
        listOf(method(keyOwner, "<clinit>", emptyList(), "V", 1, static = true, constructor = true, smali = """
            const-string v0, "$key"
            invoke-static { v0 }, Lfixture/Maps;->of(Ljava/lang/Object;)Ljava/util/Map;
            move-result-object v0
            sput-object v0, $keyMap
            return-void
        """)),
    )

    private val answer = "Lfixture/Answer;"
    private val comments = "Lfixture/Comments;"
    private val strings = "Lfixture/Strings;"
    private val intentGetter = "$answer->intent()Lfixture/Intent;"
    private val pagesGetter = "$comments->pages()Lcom/facebook/graphservice/interfaces/PaginableList;"

    /** A string table answering [INTENT_FLAG] for 0x971, as 585's arm64 `LX/07kI;->A00` does. */
    private fun table(): ClassDef = classOf(strings, method(strings, "A00", listOf("I"), string, 2, static = true, smali = """
        packed-switch p0, :cases
        const-string v0, "unused"
        return-object v0
        :intent
        const-string v0, "$INTENT_FLAG"
        return-object v0
        :cases
        .packed-switch 0x971
            :intent
        .end packed-switch
    """))

    /**
     * 585's answer models: one implementing [implementsAnswer] asks the table for the intent flag,
     * one implementing [implementsComments] holds the pagination string.
     */
    private fun models(implementsAnswer: String = answer, implementsComments: String = comments): List<ClassDef> = listOf(
        ImmutableClassDef("Lfixture/AnswerModel;", AccessFlags.PUBLIC.value, "Ljava/lang/Object;", listOf(implementsAnswer),
            null, null, emptyList(), listOf(method("Lfixture/AnswerModel;", "intent", emptyList(), "Lfixture/Intent;", 2, smali = """
                const/16 v0, 0x971
                invoke-static { v0 }, $strings->A00(I)$string
                move-result-object v0
                const/4 v0, 0x0
                return-object v0
            """))),
        ImmutableClassDef("Lfixture/CommentsModel;", AccessFlags.PUBLIC.value, "Ljava/lang/Object;", listOf(implementsComments),
            null, null, emptyList(), listOf(method("Lfixture/CommentsModel;", "pages", emptyList(),
                "Lcom/facebook/graphservice/interfaces/PaginableList;", 2, smali = """
                const-string v0, "$INTERRANKED"
                const/4 v0, 0x0
                return-object v0
            """))),
        table(),
    )

    /**
     * The comment sheet's section renderer: both strings, the header built from its parameters,
     * then the key's map read right after, as 582 does. With [getters], 585's: no string, a call to
     * the answer's intent getter and the comments' pages getter instead. Parts can change.
     */
    private fun render(
        name: String = "render",
        interranked: Boolean = true,
        keyRead: String? = keyMap,
        keyGap: Int = 0,
        built: String = header,
        builtWith: List<String> = headerParameters,
        getters: Boolean = false,
    ): MutableMethod = method(
        renderer, name, listOf("Ljava/lang/Object;", feedback, USER_SESSION, function1), "Ljava/lang/Object;", 8,
        smali = """
            ${if (getters) "invoke-interface { p1 }, $intentGetter" else "const-string v0, \"$INTENT_FLAG\""}
            ${when {
                !interranked -> ""
                getters -> "invoke-interface { p1 }, $pagesGetter"
                else -> "const-string v0, \"$INTERRANKED\""
            }}
            new-instance v1, $built
            const-string v0, "title"
            invoke-direct { v1, p3, p2, v0, p4 }, $built-><init>(${builtWith.joinToString("")})V
            ${"nop\n".repeat(keyGap)}
            ${if (keyRead != null) "sget-object v2, $keyRead" else ""}
            return-object v1
        """,
    )

    private val storyOwner = "Lfixture/StoryRequest;"
    private val pageOwner = "Lfixture/PostPage;"
    private val pageOrderField = "$FETCH_SINGLE_STORY_PARAMS->A0M:$string"

    /** The post page's request builder (#192): the order read from the params, then its name loaded. */
    private fun storyBuilder(): MutableMethod = method(
        storyOwner, "build", listOf(FETCH_SINGLE_STORY_PARAMS, USER_SESSION), "Ljava/lang/Object;", 4, smali = """
            iget-object v1, p1, $pageOrderField
            if-eqz v1, :done
            const-string v0, "$ORDER_VARIABLE"
            invoke-static { v0, v1 }, $variables->put(${string}$string)V
            :done
            const/4 v0, 0x0
            return-object v0
        """,
    )

    /** The post page params' constructor: an id, then the order stored from its second parameter. */
    private fun storyConstructor(): MutableMethod = method(
        FETCH_SINGLE_STORY_PARAMS, "<init>", listOf(string, string), "V", 3, constructor = true, smali = """
            invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
            iput-object p2, p0, $pageOrderField
            return-void
        """,
    )

    /** The link-to-page builder: it builds the params with the link's order in v2. */
    private fun pageBuilder(): MutableMethod = method(
        pageOwner, "open", listOf(PERMALINK_PARAMS), "Ljava/lang/Object;", 5, smali = """
            new-instance v0, $FETCH_SINGLE_STORY_PARAMS
            const-string v1, "id"
            const-string v2, "RANKED_THREADED"
            invoke-direct { v0, v1, v2 }, $FETCH_SINGLE_STORY_PARAMS-><init>(${string}$string)V
            return-object v0
        """,
    )

    private fun build(
        builder: Method = builder(),
        constructor: Method = constructor(),
        handlers: List<Method> = listOf(handler(), refresh()),
        renders: List<Method> = listOf(render()),
        pages: List<Method> = listOf(pageBuilder()),
        models: List<ClassDef> = emptyList(),
    ): List<ClassDef> = models + listOf(
        classOf(builderOwner, builder),
        classOf(FETCH_FEEDBACK_PARAMS, constructor),
        classOf(sheet, *handlers.toTypedArray()),
        classOf(renderer, *renders.toTypedArray()),
        keys(),
        classOf(header, sortHeader()),
        classOf(storyOwner, storyBuilder()),
        classOf(FETCH_SINGLE_STORY_PARAMS, storyConstructor()),
        classOf(pageOwner, *pages.toTypedArray()),
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

        val menu = context.mutableClassDefBy(header).methods.single().body()
        assertEquals(Opcode.INVOKE_STATIC, menu[0].opcode)
        assertEquals(SORT_MENU, menu[0].reference)
        assertEquals("the feedback and the pick, p2 and p4 of five registers", listOf(2, 4), menu[0].callRegisters())
        assertEquals(sortHeader().body().map { it.opcode }, menu.drop(1).map { it.opcode })
        assertEquals("the renderer is left alone", render().body().map { it.opcode },
            context.mutableClassDefBy(renderer).methods.single().body().map { it.opcode })

        val page = context.mutableClassDefBy(pageOwner).methods.single().body()
        assertEquals("the page's ask goes right before the params' constructor",
            listOf(Opcode.NEW_INSTANCE, Opcode.CONST_STRING, Opcode.CONST_STRING, Opcode.INVOKE_STATIC_RANGE,
                Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_DIRECT, Opcode.RETURN_OBJECT),
            page.map { it.opcode })
        assertEquals(PAGE_ORDER, page[3].reference)
        assertEquals("the link's order, the constructor's second parameter", listOf(2), page[3].callRegisters())
        assertEquals(2, (page[4] as OneRegisterInstruction).registerA)
        assertEquals("the story request builder is left alone", storyBuilder().body().map { it.opcode },
            context.mutableClassDefBy(storyOwner).methods.single().body().map { it.opcode })

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
        val noMenu = refusal(build(renders = listOf(render(keyRead = null))))
        assertTrue(noMenu, noMenu.contains("comment sort menu header") && noMenu.contains("found 0"))
        val twoMenus = refusal(build(renders = listOf(render(), render(name = "renderAgain", built = "Lfixture/OtherHeader;"))))
        assertTrue(twoMenus, twoMenus.contains("comment sort menu header") && twoMenus.contains("found 2"))
        val noPage = refusal(build(pages = emptyList()))
        assertTrue(noPage, noPage.contains("taking $PERMALINK_PARAMS") && noPage.contains("found 0"))
    }

    @Test
    fun `the sort menu's header is the one the renderer builds right before filing it under the key`() {
        val maps = selectorKeyMaps(listOf(keys(), classOf("Lfixture/NoMap;")))
        assertEquals(setOf(keyMap), maps)
        assertTrue("a class without the key has no map here", selectorKeyMaps(listOf(classOf("Lfixture/NoMap;"))).isEmpty())

        assertEquals("$header-><init>(${headerParameters.joinToString("")})V", sortHeaderIn(render(), maps).toString())
        assertNull("without the pagination string", sortHeaderIn(render(interranked = false), maps))
        assertNull("no key read", sortHeaderIn(render(keyRead = null), maps))
        assertNull("another map read", sortHeaderIn(render(keyRead = "Lfixture/Other;->A00:Ljava/util/Map;"), maps))
        assertNotNull("the key read eight below", sortHeaderIn(render(keyGap = 7), maps))
        assertNull("the key read too far below", sortHeaderIn(render(keyGap = 8), maps))
        assertNull("a header without the pick",
            sortHeaderIn(render(builtWith = listOf(USER_SESSION, feedback, string, string)), maps))
        assertNull("a header without the session",
            sortHeaderIn(render(builtWith = listOf(string, feedback, string, function1)), maps))

        val reference = { parameters: List<String> -> ImmutableMethodReference(header, "<init>", parameters, "V") }
        assertTrue(isSortHeaderConstructor(reference(headerParameters)))
        assertFalse("three parameters", isSortHeaderConstructor(reference(headerParameters.dropLast(1))))
        assertFalse("not a constructor", isSortHeaderConstructor(
            ImmutableMethodReference(header, "make", headerParameters, "V")))
    }

    @Test
    fun `585's renderer stands for the strings with calls to the models' getters on their interfaces`() {
        val models = models()
        val methods = models.flatMap { it.methods }
        val intent = interfaceGetters(models, methods.filter { it.name == "intent" })
        val pages = interfaceGetters(models, methods.filter { it.name == "pages" })
        assertEquals(setOf(intentGetter), intent)
        assertEquals(setOf(pagesGetter), pages)
        assertTrue("a getter of a class with no interface stands for nothing",
            interfaceGetters(listOf(classOf("Lfixture/Plain;")), methods).isEmpty())
        assertEquals(listOf("intent", "pages"), methods.filter(::isSheetGetter).map { it.name })

        val maps = selectorKeyMaps(listOf(keys()))
        assertEquals("$header-><init>(${headerParameters.joinToString("")})V",
            sortHeaderIn(render(getters = true), maps, intent, pages).toString())
        assertNull("no getter known", sortHeaderIn(render(getters = true), maps))
        assertNull("only the intent's getter", sortHeaderIn(render(getters = true, interranked = false), maps, intent, pages))
        assertNull("no getter known for the pagination string", sortHeaderIn(render(getters = true), maps, intent, emptySet()))
        assertNull("only the intent's getter called, the pages getter wanted for both",
            sortHeaderIn(render(getters = true, interranked = false), maps, pages, pages))
        assertNull("no key read", sortHeaderIn(render(getters = true, keyRead = null), maps, intent, pages))
    }

    @Test
    fun `the patch finds 585's renderer by the key's class and the models' getters and tells the header`() {
        val context = PatchContexts.of(build(renders = listOf(render(getters = true)), models = models()))

        defaultCommentOrderPatch.execute(context)

        val menu = context.mutableClassDefBy(header).methods.single().body()
        assertEquals(SORT_MENU, menu[0].reference)
        assertEquals("the feedback and the pick", listOf(2, 4), menu[0].callRegisters())
        assertEquals(sortHeader().body().map { it.opcode }, menu.drop(1).map { it.opcode })

        fun refusal(classes: List<ClassDef>): String =
            assertThrows(PatchException::class.java) { defaultCommentOrderPatch.execute(PatchContexts.of(classes)) }.message!!
        val noModels = refusal(build(renders = listOf(render(getters = true))))
        assertTrue(noModels, noModels.contains("comment sort menu header") && noModels.contains("found 0"))
        val otherInterface = refusal(build(renders = listOf(render(getters = true)), models = models(implementsComments = "Lfixture/Other;")))
        assertTrue(otherInterface, otherInterface.contains("comment sort menu header") && otherInterface.contains("found 0"))
    }
}
