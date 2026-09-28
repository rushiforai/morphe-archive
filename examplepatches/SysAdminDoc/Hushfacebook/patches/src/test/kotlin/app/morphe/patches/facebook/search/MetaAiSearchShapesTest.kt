/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.search

import app.morphe.RepoFiles
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction31i
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction3rc
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertSame
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The parts of Hide Meta AI in search that need no Facebook build: which methods the anchors take and
 * turn down, and the code each hook puts in.
 */
class MetaAiSearchShapesTest {
    private val gate = "Lfixture/Gate;"
    private val builderClass = "Lfixture/AnswerInjector;"
    private val loader = "Lfixture/Loader;"
    private val module = "Lfixture/Module;"
    private val page = "Lfixture/Page;"
    private val header = "Lfixture/Header;"
    private val role = "Lfixture/Role;"
    private val specBuilder = "Lfixture/SpecBuilder;"
    private val string = "Ljava/lang/String;"
    private val pageParameters = listOf(header, IMMUTABLE_LIST, IMMUTABLE_LIST, IMMUTABLE_LIST, string, string, string,
        string, "Z", "Z")

    private fun method(
        owner: String,
        name: String,
        parameters: List<String>,
        returnType: String,
        registers: Int,
        code: List<Instruction>,
        static: Boolean = false,
        public: Boolean = true,
    ): Method = ImmutableMethod(
        owner,
        name,
        parameters.map { ImmutableMethodParameter(it, null, null) },
        returnType,
        (if (public) AccessFlags.PUBLIC.value else 0) or AccessFlags.FINAL.value or
            (if (static) AccessFlags.STATIC.value else 0) or (if (name == "<init>") AccessFlags.CONSTRUCTOR.value else 0),
        null,
        null,
        ImmutableMethodImplementation(registers, code, null, null),
    )

    private fun ref(owner: String, name: String, parameters: List<String>, returnType: String) =
        ImmutableMethodReference(owner, name, parameters, returnType)

    private fun text(value: String, register: Int = 0) = ImmutableInstruction21c(Opcode.CONST_STRING, register, ImmutableStringReference(value))
    private fun invoke(opcode: Opcode, target: MethodReference, vararg registers: Int): Instruction {
        val r = registers.toList() + List(5 - registers.size) { 0 }
        return ImmutableInstruction35c(opcode, registers.size, r[0], r[1], r[2], r[3], r[4], target)
    }

    // ------------------------------------------------------------------ the answer question

    private val question = ref(gate, "A01", listOf(USER_SESSION, RESULTS_CONTEXT), "Z")

    private fun answerBuilder(vararg literals: String = arrayOf(ANSWER_PAGE), parameters: List<String> =
        listOf(USER_SESSION, RESULTS_CONTEXT, loader), returnType: String = "V") =
        method(builderClass, "A00", parameters, returnType, 13,
            literals.map { text(it) } + ImmutableInstruction10x(Opcode.RETURN_VOID))

    private val built = ref(builderClass, "A00", listOf(USER_SESSION, RESULTS_CONTEXT, loader), "V")

    /**
     * A plugin's call of the builder: ask [asked], keep the answer, and on no jump [skip] code units
     * on from the branch (5 lands on the return, past the build).
     */
    private fun caller(asked: MethodReference? = question, skip: Int = 5, askAfter: Boolean = false,
        parameters: List<String> = listOf(USER_SESSION, RESULTS_CONTEXT), branch: Opcode = Opcode.IF_EQZ): Method {
        val ask = listOfNotNull(asked?.let { invoke(Opcode.INVOKE_VIRTUAL, it, 0, 3, 4) })
        val build = invoke(Opcode.INVOKE_VIRTUAL, built, 1, 3, 4, 2)
        val code = if (askAfter) {
            listOf(build) + ask + listOf(ImmutableInstruction11x(Opcode.MOVE_RESULT, 0), ImmutableInstruction21t(branch, 0, 2),
                ImmutableInstruction10x(Opcode.RETURN_VOID))
        } else {
            listOf(ImmutableInstruction21c(Opcode.SGET_OBJECT, 0, ImmutableFieldReference(gate, "A00", gate))) + ask +
                listOf(ImmutableInstruction11x(Opcode.MOVE_RESULT, 0), ImmutableInstruction21t(branch, 0, skip), build,
                    ImmutableInstruction10x(Opcode.RETURN_VOID))
        }
        return method("Lfixture/Plugin;", "Cnl", parameters, "V", 5, code)
    }

    @Test
    fun `the answer page builder takes the session, the context and the loader, and names the page`() {
        assertTrue(isAnswerPageBuilder(answerBuilder()))
        assertFalse(isAnswerPageBuilder(answerBuilder(literals = arrayOf("search_meta_ai_answer_module"))))
        assertFalse(isAnswerPageBuilder(answerBuilder(parameters = listOf(USER_SESSION, RESULTS_CONTEXT))))
        assertFalse(isAnswerPageBuilder(answerBuilder(parameters = listOf(RESULTS_CONTEXT, USER_SESSION, loader))))
        assertFalse(isAnswerPageBuilder(answerBuilder(returnType = "Z")))
    }

    @Test
    fun `the answer question is the one asked right before the build, whose no skips it`() {
        val builder = answerBuilder()
        assertEquals(question, answerQuestion(caller(), builder))
        // Negative controls: no question, a question after the build, a branch that lands on the
        // build, a branch that goes on with a yes, and a caller of another shape.
        assertNull(answerQuestion(caller(asked = null), builder))
        assertNull(answerQuestion(caller(askAfter = true), builder))
        assertNull(answerQuestion(caller(skip = 2), builder))
        assertNull(answerQuestion(caller(branch = Opcode.IF_NEZ), builder))
        assertNull(answerQuestion(caller(parameters = listOf(USER_SESSION)), builder))
        // A caller of another builder isn't asked about at all.
        assertNull(answerQuestion(caller(), answerBuilder().let {
            method("Lfixture/Other;", it.name, it.parameterTypes.map(CharSequence::toString), "V", 13, it.implementation!!.instructions.toList())
        }))
        // Two questions over the session and the context: none is taken.
        val twice = method("Lfixture/Plugin;", "Cnl", listOf(USER_SESSION, RESULTS_CONTEXT), "V", 5, listOf(
            invoke(Opcode.INVOKE_VIRTUAL, question, 0, 3, 4), ImmutableInstruction11x(Opcode.MOVE_RESULT, 0),
            invoke(Opcode.INVOKE_VIRTUAL, ref(gate, "A02", listOf(USER_SESSION, RESULTS_CONTEXT), "Z"), 0, 3, 4),
            ImmutableInstruction11x(Opcode.MOVE_RESULT, 0), ImmutableInstruction21t(Opcode.IF_EQZ, 0, 5),
            invoke(Opcode.INVOKE_VIRTUAL, built, 1, 3, 4, 2), ImmutableInstruction10x(Opcode.RETURN_VOID)))
        assertNull(answerQuestion(twice, builder))
    }

    private fun MutableMethod.at(index: Int) = implementation!!.instructions.elementAt(index)

    /** A question answering false: nine registers over this and two arguments, six locals. */
    private fun answerQuestionMethod(registers: Int = 9) = method(gate, "A01", listOf(USER_SESSION, RESULTS_CONTEXT), "Z",
        registers, listOf(ImmutableInstruction11n(Opcode.CONST_4, 0, 1), ImmutableInstruction11x(Opcode.RETURN, 0)))

    @Test
    fun `the answer question answers no first thing while Meta AI is hidden, and asks its own otherwise`() {
        val gated = MutableMethod(answerQuestionMethod())
        val own = gated.implementation!!.instructions.count()
        gated.answerNoWhileMetaAiHidden()
        assertEquals(Opcode.INVOKE_STATIC, gated.at(0).opcode)
        assertEquals(HIDE_ANSWER, ((gated.at(0) as ReferenceInstruction).reference as MethodReference).toString())
        assertEquals(listOf(Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.CONST_4, Opcode.RETURN),
            (1..4).map { gated.at(it).opcode })
        assertEquals("the hook's answer isn't no", 0, (gated.at(3) as NarrowLiteralInstruction).narrowLiteral)
        listOf(1, 2, 3, 4).forEach { assertEquals(0, (gated.at(it) as OneRegisterInstruction).registerA) }
        assertEquals(own + 5, gated.implementation!!.instructions.count())
        assertSame("a yes goes on to the question's own first instruction", gated.at(5),
            (gated.at(2) as BuilderOffsetInstruction).target.location.instruction)
    }

    @Test
    fun `a question with no local to borrow stops the patch`() {
        val tight = MutableMethod(answerQuestionMethod(registers = 3))
        val refusal = assertThrows(PatchException::class.java) { tight.answerNoWhileMetaAiHidden() }
        assertTrue(refusal.message, refusal.message!!.contains(PATCH))
        assertEquals(2, tight.implementation!!.instructions.count())
    }

    // ------------------------------------------------------------------ roles, modules and pages

    @Test
    fun `the role enum is the one class the role parser loads`() {
        val parser = method("Lfixture/Config;", "A00", emptyList(), "V", 4, listOf(
            ImmutableInstruction21c(Opcode.CONST_CLASS, 1, ImmutableTypeReference(role)), text(ROLE_PARSE_FAILURE),
            ImmutableInstruction10x(Opcode.RETURN_VOID)))
        assertEquals(role, roleEnumType(parser))
        val two = method("Lfixture/Config;", "A00", emptyList(), "V", 4, listOf(
            ImmutableInstruction21c(Opcode.CONST_CLASS, 1, ImmutableTypeReference(role)),
            ImmutableInstruction21c(Opcode.CONST_CLASS, 1, ImmutableTypeReference("Lfixture/Other;")),
            ImmutableInstruction10x(Opcode.RETURN_VOID)))
        assertNull(roleEnumType(two))
    }

    private fun moduleConstructor(key: Int = RESULT_ROLE_KEY, cast: String = role, parameters: List<String> = listOf("Lfixture/Edge;")) =
        method(module, "<init>", parameters, "V", 12, listOf(
            ImmutableInstruction31i(Opcode.CONST, 0, key),
            ImmutableInstruction21c(Opcode.CHECK_CAST, 0, ImmutableTypeReference(cast)),
            ImmutableInstruction10x(Opcode.RETURN_VOID)))

    @Test
    fun `a module is built from an edge whose result role it reads as the role enum`() {
        assertEquals("result_role".hashCode(), RESULT_ROLE_KEY)
        assertTrue(isModuleConstructor(moduleConstructor(), role))
        assertFalse(isModuleConstructor(moduleConstructor(key = "module_role".hashCode()), role))
        assertFalse(isModuleConstructor(moduleConstructor(cast = "Lfixture/Other;"), role))
        assertFalse(isModuleConstructor(moduleConstructor(parameters = listOf("Lfixture/Edge;", "I")), role))
        val roleOf = method(module, "A02", emptyList(), role, 3, listOf(ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0)))
        val hidden = method(module, "A03", emptyList(), role, 3, listOf(ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0)), public = false)
        val staticOne = method(module, "A00", listOf(module), role, 3, listOf(ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0)), static = true)
        val moduleClass = ImmutableClassDef(module, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null, null,
            listOf(moduleConstructor(), roleOf, hidden, staticOne))
        assertEquals(listOf("A02"), roleAccessors(moduleClass, role).map { it.name })
    }

    private val pageConstructor = ref(page, "<init>", pageParameters, "V")
    private val wrap = ref(module, "A01", listOf(IMMUTABLE_LIST), IMMUTABLE_LIST)

    /** The answer builder's page: modules wrapped into v3, the page built from v1 to v11. */
    private fun pageBuilder(wrapper: MethodReference = wrap, modulesAt: Int = 3, overwrite: Boolean = false,
        constructor: MethodReference = pageConstructor): Method {
        val code = mutableListOf<Instruction>(
            invoke(Opcode.INVOKE_STATIC, wrapper, 0),
            ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, modulesAt),
        )
        if (overwrite) code += ImmutableInstruction21c(Opcode.CONST_STRING, 3, ImmutableStringReference("x"))
        code += text(ANSWER_PAGE, 7)
        code += ImmutableInstruction21c(Opcode.NEW_INSTANCE, 1, ImmutableTypeReference(page))
        code += ImmutableInstruction3rc(Opcode.INVOKE_DIRECT_RANGE, 1, 11, constructor)
        code += ImmutableInstruction10x(Opcode.RETURN_VOID)
        return method(builderClass, "A00", listOf(USER_SESSION, RESULTS_CONTEXT, loader), "V", 13, code)
    }

    @Test
    fun `the page takes the modules the module class wrapped, as its second argument`() {
        assertTrue(isPageConstructor(pageConstructor))
        assertFalse(isPageConstructor(ref(page, "<init>", pageParameters.dropLast(1), "V")))
        assertFalse(isPageConstructor(ref(page, "<init>", listOf("I") + pageParameters.drop(1), "V")))
        assertEquals(pageConstructor, answerPageConstructor(pageBuilder(), module))
        // Negative controls: the list wrapped by another class, landing in another register, written
        // over before the page is built, and a page of another shape.
        assertNull(answerPageConstructor(pageBuilder(wrapper = ref("Lfixture/Other;", "A01", listOf(IMMUTABLE_LIST), IMMUTABLE_LIST)), module))
        assertNull(answerPageConstructor(pageBuilder(modulesAt = 4), module))
        assertNull(answerPageConstructor(pageBuilder(overwrite = true), module))
        assertNull(answerPageConstructor(pageBuilder(constructor = ref(page, "<init>", pageParameters.dropLast(1), "V")), module))
    }

    /** A builder of the Meta AI tab's page: the name loaded into v6, then the page built from v0 to v10. */
    private fun tabPageBuilder(name: String = META_AI_TAB_PAGE, overwrite: Boolean = false, at: Int = 6): Method {
        val code = mutableListOf<Instruction>(text(name, at))
        if (overwrite) code += text("page_info", 6)
        code += ImmutableInstruction21c(Opcode.NEW_INSTANCE, 0, ImmutableTypeReference(page))
        code += ImmutableInstruction3rc(Opcode.INVOKE_DIRECT_RANGE, 0, 11, pageConstructor)
        code += ImmutableInstruction10x(Opcode.RETURN_VOID)
        return method("Lfixture/MetaAiTab;", "AoM", listOf(USER_SESSION, RESULTS_CONTEXT, "Lfixture/FetchType;",
            IMMUTABLE_LIST), "V", 16, code)
    }

    @Test
    fun `the Meta AI tab's page is the one its builder names`() {
        assertTrue(namesPage(tabPageBuilder(), pageConstructor, META_AI_TAB_PAGE))
        // Negative controls: another name, the name written over, the name in another argument, and
        // a page of another shape.
        assertFalse(namesPage(tabPageBuilder(name = "page_info"), pageConstructor, META_AI_TAB_PAGE))
        assertFalse(namesPage(tabPageBuilder(overwrite = true), pageConstructor, META_AI_TAB_PAGE))
        assertFalse(namesPage(tabPageBuilder(at = 7), pageConstructor, META_AI_TAB_PAGE))
        assertFalse(namesPage(tabPageBuilder(), ref(page, "<init>", pageParameters.dropLast(1), "V"), META_AI_TAB_PAGE))
    }

    /** The page's constructor: this in v1 after one local, the modules in v3. */
    private fun pageConstructorMethod(registers: Int = 12) = method(page, "<init>", pageParameters, "V", registers, listOf(
        invoke(Opcode.INVOKE_DIRECT, ref("Ljava/lang/Object;", "<init>", emptyList(), "V"), registers - 11),
        ImmutableInstruction22c(Opcode.IPUT_OBJECT, registers - 9, registers - 11, ImmutableFieldReference(page, "A03", IMMUTABLE_LIST)),
        ImmutableInstruction10x(Opcode.RETURN_VOID)))

    /** A constructor with [registers] registers that only returns, for registers past what the code above can name. */
    private fun bareConstructor(registers: Int) =
        method(page, "<init>", pageParameters, "V", registers, listOf(ImmutableInstruction10x(Opcode.RETURN_VOID)))

    @Test
    fun `the page hands its modules to the extension first, and keeps a copy of what comes back`() {
        val constructor = MutableMethod(pageConstructorMethod())
        val own = constructor.implementation!!.instructions.count()
        constructor.filterPageModulesFirst(PATCH)
        val calls = listOf(0, 3).map { ((constructor.at(it) as ReferenceInstruction).reference as MethodReference).toString() }
        assertEquals(listOf(KEPT_MODULES, COPY_OF), calls)
        assertEquals(listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.IF_EQZ, Opcode.INVOKE_STATIC,
            Opcode.MOVE_RESULT_OBJECT), (0..4).map { constructor.at(it).opcode })
        // The modules are p2, v3 here, and the page's name p6, v7: both read first, and the copy
        // goes back where the modules were.
        assertEquals(listOf(3, 7), constructor.at(0).callArguments())
        assertEquals(0, (constructor.at(1) as OneRegisterInstruction).registerA)
        assertEquals(0, (constructor.at(2) as OneRegisterInstruction).registerA)
        assertEquals(listOf(0), constructor.at(3).callArguments())
        assertEquals(3, (constructor.at(4) as OneRegisterInstruction).registerA)
        assertEquals(own + 5, constructor.implementation!!.instructions.count())
        assertSame("a null goes on to the constructor's own first instruction", constructor.at(5),
            (constructor.at(2) as BuilderOffsetInstruction).target.location.instruction)
        assertEquals("the constructor's own code after the hook", Opcode.INVOKE_DIRECT, constructor.at(5).opcode)
    }

    @Test
    fun `a page with no local, or its modules past v15, stops the patch`() {
        val tight = MutableMethod(pageConstructorMethod(registers = 11))
        assertTrue(assertThrows(PatchException::class.java) { tight.filterPageModulesFirst(PATCH) }.message!!.contains(PATCH))
        val far = MutableMethod(bareConstructor(registers = 25))
        val refusal = assertThrows(PatchException::class.java) { far.filterPageModulesFirst(PATCH) }
        assertTrue(refusal.message, refusal.message!!.contains("v16"))
        assertEquals(1, far.implementation!!.instructions.count())
        // The modules in v12, but the name in v16.
        val farName = MutableMethod(bareConstructor(registers = 21))
        assertTrue(assertThrows(PatchException::class.java) { farName.filterPageModulesFirst(PATCH) }.message!!.contains("v16"))
        // Both in reach: v15 is the last register an invoke's four bits name.
        MutableMethod(bareConstructor(registers = 20)).filterPageModulesFirst(PATCH)
    }

    // ------------------------------------------------------------------ the suggestion route

    private val routeQuestionRef = ref(QUERY_SPEC, "CaH", emptyList(), "Z")

    private fun router(first: Instruction = invoke(Opcode.INVOKE_INTERFACE, routeQuestionRef, 4), static: Boolean = true,
        literal: String = META_AI_TAB, returnType: String = QUERY_SPEC) =
        method("Lfixture/Router;", "A01", listOf("Lfixture/Router;", QUERY_SPEC, "Lfixture/Tab;"), returnType, 7, listOf(
            first, ImmutableInstruction11x(Opcode.MOVE_RESULT, 0), ImmutableInstruction21t(Opcode.IF_NEZ, 0, 3),
            ImmutableInstruction11x(Opcode.RETURN_OBJECT, 4), text(literal), ImmutableInstruction11x(Opcode.RETURN_OBJECT, 4)),
            static = static)

    @Test
    fun `the router asks the spec one boolean first and goes to the Meta AI tab on yes`() {
        assertEquals(routeQuestionRef, routeQuestion(router()))
        assertNull(routeQuestion(router(static = false)))
        assertNull(routeQuestion(router(literal = "POSTS_TAB")))
        assertNull(routeQuestion(router(returnType = "V")))
        assertNull(routeQuestion(router(first = invoke(Opcode.INVOKE_INTERFACE, ref(QUERY_SPEC, "BBN", emptyList(), string), 4))))
        assertNull(routeQuestion(router(first = invoke(Opcode.INVOKE_STATIC, ref("Lfixture/Other;", "A00", emptyList(), "Z")))))
    }

    private val implFlag = ImmutableFieldReference(QUERY_SPEC_IMPL, "A0U", "Z")
    private val builderFlag = ImmutableFieldReference(specBuilder, "A0W", "Z")

    private fun impl(getter: List<Instruction> = listOf(ImmutableInstruction22c(Opcode.IGET_BOOLEAN, 0, 0, implFlag),
        ImmutableInstruction11x(Opcode.RETURN, 0)), copies: List<ImmutableFieldReference> = listOf(builderFlag)) =
        ImmutableClassDef(QUERY_SPEC_IMPL, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", listOf(QUERY_SPEC), null, null,
            null, listOf(
                method(QUERY_SPEC_IMPL, "CaH", emptyList(), "Z", 1, getter),
                method(QUERY_SPEC_IMPL, "<init>", listOf(specBuilder), "V", 3, copies.flatMap { source ->
                    listOf(ImmutableInstruction22c(Opcode.IGET_BOOLEAN, 0, 2, source),
                        ImmutableInstruction22c(Opcode.IPUT_BOOLEAN, 0, 1, implFlag))
                } + ImmutableInstruction10x(Opcode.RETURN_VOID)),
            ))

    @Test
    fun `the spec answers the route question from the field its constructor copies from the builder`() {
        val field = routeField(impl(), routeQuestionRef)
        assertNotNull(field)
        assertTrue(sameField(implFlag, field!!))
        assertTrue(sameField(builderFlag, builderRouteField(impl(), field)!!))
        // A getter that computes, or copies from two builder fields, isn't taken.
        assertNull(routeField(impl(getter = listOf(ImmutableInstruction11n(Opcode.CONST_4, 0, 0), ImmutableInstruction11x(Opcode.RETURN, 0))),
            routeQuestionRef))
        assertNull(builderRouteField(impl(copies = listOf(builderFlag, ImmutableFieldReference(specBuilder, "A0X", "Z"))), implFlag))
    }

    private val routeKey = -1017936132

    /** The parser: read the flag off the tree into v0 and store it, then store a constant true. */
    private fun parser(registers: Int = 21, flag: Int = 0, jumpToStore: Boolean = false): Method {
        val code = mutableListOf<Instruction>()
        // A goto of one code unit, then const (3), the read (3) and its move-result (1): the store is 8 on.
        if (jumpToStore) code += ImmutableInstruction10t(Opcode.GOTO, 8)
        code += ImmutableInstruction31i(Opcode.CONST, flag, routeKey)
        code += invoke(Opcode.INVOKE_VIRTUAL, ref(TREE_JNI, "getBooleanValue", listOf("I"), "Z"), 1, flag)
        code += ImmutableInstruction11x(Opcode.MOVE_RESULT, flag)
        code += ImmutableInstruction22c(Opcode.IPUT_BOOLEAN, flag, 15, builderFlag)
        code += ImmutableInstruction11n(Opcode.CONST_4, 0, 1)
        code += ImmutableInstruction22c(Opcode.IPUT_BOOLEAN, 0, 15, builderFlag)
        code += text(KEYWORD_TYPE_FAILURE)
        code += text(TYPEAHEAD_SUGGESTION)
        code += ImmutableInstruction10x(Opcode.RETURN_VOID)
        return method("Lfixture/Parser;", "apply", listOf("Ljava/lang/Object;"), "Ljava/lang/Object;", registers, code)
    }

    @Test
    fun `the parser stores the flag it reads off the tree once, and a constant store isn't one`() {
        assertTrue(isSuggestionParser(parser()))
        assertEquals(listOf(RouteStore(3, 0)), routeStores(parser(), builderFlag))
        assertEquals(emptyList<RouteStore>(), routeStores(parser(), ImmutableFieldReference(specBuilder, "A0X", "Z")))
    }

    @Test
    fun `the route flag goes through the extension between its read and its store`() {
        val parser = MutableMethod(parser())
        val own = parser.implementation!!.instructions.count()
        parser.askBeforeStoringRoute(RouteStore(3, 0))
        assertEquals(Opcode.MOVE_RESULT, parser.at(2).opcode)
        assertEquals(Opcode.INVOKE_STATIC, parser.at(3).opcode)
        assertEquals(OPENS_META_AI, ((parser.at(3) as ReferenceInstruction).reference as MethodReference).toString())
        assertEquals(listOf(0), parser.at(3).callArguments())
        assertEquals(Opcode.MOVE_RESULT, parser.at(4).opcode)
        assertEquals(0, (parser.at(4) as OneRegisterInstruction).registerA)
        assertEquals(Opcode.IPUT_BOOLEAN, parser.at(5).opcode)
        assertEquals(0, (parser.at(5) as TwoRegisterInstruction).registerA)
        assertEquals(own + 2, parser.implementation!!.instructions.count())
    }

    @Test
    fun `a jump to the store, or a flag past v15, stops the patch`() {
        val jumped = MutableMethod(parser(jumpToStore = true))
        assertTrue(assertThrows(PatchException::class.java) { jumped.askBeforeStoringRoute(RouteStore(4, 0)) }
            .message!!.contains("jump"))
        val far = MutableMethod(parser())
        assertTrue(assertThrows(PatchException::class.java) { far.askBeforeStoringRoute(RouteStore(3, 16)) }
            .message!!.contains("v16"))
    }

    // ------------------------------------------------------------------ the extension's list

    @Test
    fun `the patch requires the roles the extension leaves out`() {
        val source = File(RepoFiles.root, "extensions/facebook/src/main/java/app/morphe/extension/facebook/search/MetaAiSearch.java")
        val array = Regex("""HIDDEN_ROLES\s*=\s*\{([^}]*)\}""").find(source.readText())
            ?: throw AssertionError("MetaAiSearch.java has no HIDDEN_ROLES array")
        val hidden = Regex(""""([A-Z_]+)"""").findAll(array.groupValues[1]).map { it.groupValues[1] }.toList()
        assertEquals(HIDDEN_ROLES, hidden)
        assertTrue("the answer card Facebook serves on top of the All results stays", "SEARCH_META_AI_ANSWER" in HIDDEN_ROLES)
        assertFalse("the Meta AI tab's modules would go", "SEARCH_META_AI_TAB" in HIDDEN_ROLES)
        assertFalse("modules Facebook can't name would go", "UNSET_OR_UNRECOGNIZED_ENUM_VALUE" in HIDDEN_ROLES)
        val tabPage = Regex("""META_AI_TAB_PAGE\s*=\s*"([^"]+)"""").find(source.readText())?.groupValues?.get(1)
        assertEquals("the extension's Meta AI tab page", META_AI_TAB_PAGE, tabPage)
    }
}
