/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.search

import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.feed.namesString
import app.morphe.patches.facebook.feed.treeFieldKey
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.facebook.misc.extension.localRegisterCount
import app.morphe.patches.facebook.misc.extension.parameterRegisterNumber
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/*
 * Where Meta AI comes into Facebook's search, on the 577, 580 and 581 builds.
 *
 * Three ways, each with its own place in the code.
 *
 * The answer on top of the results. When a results page opens, its plugin asks one boolean
 * question over the user session and the page's SearchResultsMutableContext (a kept class): should
 * this page carry a Meta AI answer? It says yes when the query came from a suggestion the server
 * marked trigger_blended_serp, or when the page's tab is on a server-set list. On yes the plugin
 * adds a placeholder page named "meta_ai_answer_entities", holding one module whose role is
 * SEARCH_META_AI_ANSWER, and the page's renderer streams Meta AI's answer into it. The results
 * query itself asks the same question for one of its flags. The builder of that placeholder page is
 * the only method loading "meta_ai_answer_entities" on either build, and its two callers each ask
 * that one question right before it and skip the page on no.
 *
 * The Meta AI modules among the results. Every page of results is one object built by a
 * constructor that takes a header, the page's modules, two more lists, four strings and two flags.
 * A module is built from a result edge, and it reads its role, a constant of Facebook's
 * GraphQLGraphSearchResultRole enum, from the edge's result_role field (key "result_role".hashCode())
 * or from its node's module_role. The enum is the class loaded where Facebook logs "Failed to parse
 * GraphQLGraphSearchResultRole from type". Among its 548 roles, eight are Meta AI's answer and prompt
 * modules (see the extension's MetaAiSearch.HIDDEN_ROLES). The enum's fields are renamed, but its
 * constants keep their names. On a signed-in 580 (the S22, 2026-09-27) the server sent its answer as
 * a SEARCH_META_AI_ANSWER module first in the All results even when the question above said no, so
 * the page hook is what takes it off. The results page's Meta AI tab builds its answer as a page of
 * its own, the one page named "search_meta_ai_answer_module" (the name is the page constructor's
 * sixth argument), and the page hook hands the extension that name so the tab keeps its answer.
 *
 * The suggestions that open Meta AI. Each suggestion in the search box comes from Facebook's
 * server, and the parser that builds them (the one method logging "Failed to parse keyword
 * suggestion type") reads a boolean off each one into the query spec's builder. The results
 * router, the one static method loading "META_AI_TAB" that answers a GraphSearchQuerySpec (a kept
 * interface), asks the spec that boolean first and on yes sends the search to the Meta AI tab in AI
 * mode. The spec class, GraphSearchQuerySpecImpl (kept), answers it from a field its constructor
 * copies from the builder's. So the boolean is found by following those two steps back, not by its
 * renamed names. The Meta AI button beside the search box sets the same builder field to true with
 * a constant, and nothing here touches that.
 *
 * 585 gives the page class (arm64 LX/0D1n) a short constructor, (ImmutableList, ImmutableList,
 * String, String, String, Z), that moves its arguments into place, fills in a null header, an empty
 * third list, a null fourth string and a false second flag, and hands everything to the full one. The
 * answer page builder (arm64 LX/0DyI;->A00) and the Meta AI tab's builder (LX/0lDL;->BdR) both build
 * their pages through it, so a builder's call is read through that constructor's moves onto the full
 * one's arguments (see [pageCall]): the modules are its first argument and the page's name its fourth.
 * 585's suggestion parser (arm64 LX/0iKn;->apply) no longer reads the route flag off TreeJNI itself:
 * it calls the suggestion model's accessor (LX/0mDN;->Cvd()Z, the interface it also asks getName()
 * of), whose implementations (LX/0HaV and five more) load the key 0xc35386fc and ask the tree
 * (LX/0srD;->CPO(I)Z), and stores that into the builder's field (LX/0iKK;->A0X) as before.
 */
internal const val PATCH = "Hide Meta AI in search"

/** The extension class the hooks call, and its stub for a module's role. */
internal const val META_AI_SEARCH = "$EXTENSION_PACKAGE/search/MetaAiSearch;"
internal const val HIDE_ANSWER = "$META_AI_SEARCH->hideAnswer()Z"
internal const val OPENS_META_AI = "$META_AI_SEARCH->opensMetaAi(Z)Z"
internal const val ROLE_STUB = "unitRole"

/** Kept names. */
internal const val USER_SESSION = "Lcom/facebook/auth/usersession/FbUserSession;"
internal const val RESULTS_CONTEXT = "Lcom/facebook/search/results/model/SearchResultsMutableContext;"
internal const val QUERY_SPEC = "Lcom/facebook/search/model/GraphSearchQuerySpec;"
internal const val QUERY_SPEC_IMPL = "Lcom/facebook/search/model/GraphSearchQuerySpecImpl;"
internal const val IMMUTABLE_LIST = "Lcom/google/common/collect/ImmutableList;"
internal const val TREE_JNI = "Lcom/facebook/graphservice/tree/TreeJNI;"
private const val STRING = "Ljava/lang/String;"

/** Guava's copy of a collection into its own list, which the page keeps its modules in. */
internal const val COPY_OF = "$IMMUTABLE_LIST->copyOf(Ljava/util/Collection;)$IMMUTABLE_LIST"

/** The name the Meta AI answer's placeholder page carries. */
internal const val ANSWER_PAGE = "meta_ai_answer_entities"

/** What Facebook logs where it loads the result role enum. */
internal const val ROLE_PARSE_FAILURE = "Failed to parse GraphQLGraphSearchResultRole from type"

/** The tab the results router sends a search to when the spec asks for Meta AI. */
internal const val META_AI_TAB = "META_AI_TAB"

/** What the search box's suggestion parser logs, and the source it files a suggestion under. */
internal const val KEYWORD_TYPE_FAILURE = "Failed to parse keyword suggestion type"
internal const val TYPEAHEAD_SUGGESTION = "TYPEAHEAD_SUGGESTION"

/** The key a module reads its role under. */
internal val RESULT_ROLE_KEY = treeFieldKey("result_role")

/**
 * The roles the extension leaves out, as its `MetaAiSearch.HIDDEN_ROLES` names them.
 * MetaAiSearchShapesTest holds the two lists together.
 */
internal val HIDDEN_ROLES = listOf(
    "SEARCH_META_AI_ANSWER",
    "SEARCH_META_AI_ANSWER_BODY",
    "SEARCH_META_AI_ANSWER_BODY_FULL",
    "SEARCH_META_AI_ANSWER_LOADING",
    "HCM_SEARCH_META_AI_ANSWER",
    "HCM_RELATED_META_AI_PROMPTS",
    "HCM_RELATED_META_AI_PROMPTS_W_LOADING",
    "HCM_SEARCH_AI_MODE",
)

/**
 * The name of the Meta AI tab's own page, which the extension leaves whole, as its
 * `MetaAiSearch.META_AI_TAB_PAGE` names it.
 */
internal const val META_AI_TAB_PAGE = "search_meta_ai_answer_module"

/** The page constructor's declared arguments the hook reads: the modules and the page's name. */
internal const val PAGE_MODULES = 1
internal const val PAGE_NAME = 5

private fun Method.code(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

private fun Method.parameters(): List<String> = parameterTypes.map { it.toString() }

private fun MethodReference.parameters(): List<String> = parameterTypes.map { it.toString() }

private val Instruction.call: MethodReference?
    get() = if (opcode.name.startsWith("invoke")) (this as? ReferenceInstruction)?.reference as? MethodReference else null

private val Instruction.field: FieldReference?
    get() = (this as? ReferenceInstruction)?.reference as? FieldReference

private fun Instruction.literal(): Int? = (this as? NarrowLiteralInstruction)?.narrowLiteral

private fun isStatic(method: Method) = AccessFlags.STATIC.isSet(method.accessFlags)

/** Whether [call] names [target]: its class, its name and its prototype. */
private fun isCallTo(call: MethodReference, target: Method): Boolean =
    call.definingClass == target.definingClass && call.name == target.name && call.returnType == target.returnType &&
        call.parameters() == target.parameters()

/** The registers a call reads, in order, whether it's written as a range or not. */
internal fun Instruction.callArguments(): List<Int> = when (this) {
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    else -> emptyList()
}

/** Whether [instruction] can write [register], a wide write counting for both halves. */
private fun writes(instruction: Instruction, register: Int): Boolean {
    if (!instruction.opcode.setsRegister() || instruction !is OneRegisterInstruction) return false
    val first = instruction.registerA
    return first == register || (instruction.opcode.setsWideRegister() && first + 1 == register)
}

/** The index of the instruction the branch at [index] of [code] lands on, or null. */
internal fun branchTarget(code: List<Instruction>, index: Int): Int? {
    val branch = code[index] as? OffsetInstruction ?: return null
    var address = 0
    val addresses = code.map { val at = address; address += it.codeUnits; at }
    return addresses.indexOf(addresses[index] + branch.codeOffset).takeIf { it >= 0 }
}

/**
 * The builder of the Meta AI answer's placeholder page: it takes the user session, the page's
 * context and the page loader, returns nothing, and loads [ANSWER_PAGE].
 */
internal fun isAnswerPageBuilder(method: Method): Boolean {
    val parameters = method.parameters()
    return method.implementation != null && method.returnType == "V" && parameters.size == 3 &&
        parameters[0] == USER_SESSION && parameters[1] == RESULTS_CONTEXT && parameters[2].startsWith("L") &&
        holdsString(method, ANSWER_PAGE)
}

/**
 * The question [caller] asks before it calls [builder], or null when it isn't such a caller.
 *
 * The caller takes the user session and the page's context and returns nothing. It asks exactly one
 * boolean question over the two, keeps the answer, and its `if-eqz` on that answer jumps past the
 * call to the builder, so a no leaves the placeholder page out.
 */
internal fun answerQuestion(caller: Method, builder: Method): MethodReference? {
    if (caller.returnType != "V" || caller.parameters() != listOf(USER_SESSION, RESULTS_CONTEXT)) return null
    val code = caller.code()
    val builds = code.indexOfFirst { instruction -> instruction.call?.let { isCallTo(it, builder) } == true }
    if (builds < 0) return null
    val asks = code.indices.filter { index ->
        code[index].call?.let { it.returnType == "Z" && it.parameters() == listOf(USER_SESSION, RESULTS_CONTEXT) } == true
    }
    val ask = asks.singleOrNull() ?: return null
    if (ask > builds) return null
    val result = code.getOrNull(ask + 1) as? OneRegisterInstruction ?: return null
    val branch = code.getOrNull(ask + 2) ?: return null
    if (code[ask + 1].opcode != Opcode.MOVE_RESULT || branch.opcode != Opcode.IF_EQZ) return null
    if ((branch as OneRegisterInstruction).registerA != result.registerA) return null
    val skipsTo = branchTarget(code, ask + 2) ?: return null
    if (skipsTo <= builds) return null
    return code[ask].call
}

/** Whether [method] is the answer question itself: an instance method with a body over the session and context. */
internal fun isAnswerQuestion(method: Method, question: MethodReference): Boolean =
    method.definingClass == question.definingClass && method.name == question.name && method.returnType == "Z" &&
        method.parameters() == listOf(USER_SESSION, RESULTS_CONTEXT) && method.implementation != null && !isStatic(method)

/** The one class [parser], the method logging [ROLE_PARSE_FAILURE], loads with `const-class`: the role enum. */
internal fun roleEnumType(parser: Method): String? =
    parser.code().filter { it.opcode == Opcode.CONST_CLASS }
        .map { ((it as ReferenceInstruction).reference as TypeReference).type }
        .distinct()
        .singleOrNull()

/**
 * Whether [method] is a result module's constructor from a result edge: one argument, the key of
 * `result_role` loaded, and a cast to the [role] enum of what it reads.
 */
internal fun isModuleConstructor(method: Method, role: String): Boolean {
    if (method.name != "<init>" || method.parameterTypes.size != 1 || method.implementation == null) return false
    val code = method.code()
    return code.any { it.literal() == RESULT_ROLE_KEY } &&
        code.any { it.opcode == Opcode.CHECK_CAST && ((it as ReferenceInstruction).reference as TypeReference).type == role }
}

/** The module's role accessors: public instance methods with a body, no arguments, answering [role]. */
internal fun roleAccessors(module: ClassDef, role: String): List<Method> = module.methods.filter {
    it.returnType == role && it.parameterTypes.isEmpty() && it.implementation != null &&
        AccessFlags.PUBLIC.isSet(it.accessFlags) && !isStatic(it)
}

/** The page constructor's arguments after the header: the modules, two more lists, four strings, two flags. */
private val PAGE_TAIL = listOf(IMMUTABLE_LIST, IMMUTABLE_LIST, IMMUTABLE_LIST, STRING, STRING, STRING, STRING, "Z", "Z")

/** Whether [constructor] is a results page's constructor: a header object, then [PAGE_TAIL]. */
internal fun isPageConstructor(constructor: MethodReference): Boolean {
    val parameters = constructor.parameters()
    return constructor.name == "<init>" && constructor.returnType == "V" && parameters.size == 1 + PAGE_TAIL.size &&
        parameters[0].startsWith("L") && parameters.drop(1) == PAGE_TAIL
}

/**
 * A call that builds a results page: the page constructor [page] that runs, and for each of its
 * declared arguments the index among the call's own registers that carries it, or null where the
 * call doesn't pass that argument in.
 */
internal class PageCall(val page: MethodReference, val positions: List<Int?>)

/** The moves that copy a register unchanged, which a delegating constructor puts its arguments in place with. */
private val PLAIN_MOVES = setOf(
    Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.MOVE_16, Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16,
)

/**
 * The register whose value [register] holds at [at] of branchless [code], followed back through
 * plain moves to one nothing before wrote. Null when anything else wrote it on the way.
 */
private fun movedFrom(code: List<Instruction>, at: Int, register: Int): Int? {
    var current = register
    var before = at
    while (true) {
        val write = (before - 1 downTo 0).firstOrNull { writes(code[it], current) } ?: return current
        if (code[write].opcode !in PLAIN_MOVES) return null
        current = (code[write] as TwoRegisterInstruction).registerB
        before = write
    }
}

/**
 * The page [call] builds, or null when it builds none: a call straight to a page constructor, or a
 * call to a constructor [resolve] reads that hands its page to its own class's page constructor.
 * Why: 585's short page constructor sits between the builders and the full one. It must have no
 * branch, make exactly one constructor call, and pass `this` and its own arguments to it through
 * plain moves alone; an argument it fills in itself has no position.
 */
internal fun pageCall(call: MethodReference, resolve: (MethodReference) -> Method?): PageCall? {
    if (call.name != "<init>") return null
    // Every page argument is one register wide, so declared argument i is register 1 + i after the new page.
    if (isPageConstructor(call)) return PageCall(call, call.parameterTypes.indices.map { it + 1 })
    val delegate = resolve(call) ?: return null
    val code = delegate.code()
    if (code.isEmpty() || isStatic(delegate) || code.any { it is OffsetInstruction }) return null
    val hands = code.indices.filter { index ->
        code[index].opcode in setOf(Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE) && code[index].call?.name == "<init>"
    }
    val hand = hands.singleOrNull() ?: return null
    val page = code[hand].call ?: return null
    if (page.definingClass != delegate.definingClass || !isPageConstructor(page)) return null
    val registers = code[hand].callArguments()
    val self = delegate.localRegisterCount()
    if (registers.size != 1 + page.parameterTypes.size || movedFrom(code, hand, registers[0]) != self) return null
    // Each of the delegate's own arguments by the register it arrives in.
    val own = delegate.parameterTypes.indices.associateBy { delegate.parameterRegisterNumber(it) }
    val positions = page.parameterTypes.indices.map { index ->
        movedFrom(code, hand, registers[1 + index])?.let(own::get)?.let { delegate.parameterRegisterNumber(it) - self }
    }
    return PageCall(page, positions)
}

/**
 * The page constructor [builder] calls, held to the evidence that its first list is the page's
 * modules: [builder] builds that list with a static `(ImmutableList)ImmutableList` method of the
 * [module] class, and the register that list lands in reaches the constructor unchanged as its
 * modules. A call through a constructor [resolve] reads counts as its page's (see [pageCall]). Null
 * when the builder doesn't build its page that way.
 */
internal fun answerPageConstructor(
    builder: Method,
    module: String,
    resolve: (MethodReference) -> Method? = { null },
): MethodReference? {
    val code = builder.code()
    val pages = code.indices.mapNotNull { index ->
        if (code[index].opcode !in setOf(Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE)) return@mapNotNull null
        code[index].call?.let { pageCall(it, resolve) }?.let { index to it }
    }
    val (page, built) = pages.singleOrNull() ?: return null
    val lists = code.indices.filter { index ->
        code[index].opcode in setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE) && code[index].call?.let {
            it.definingClass == module && it.returnType == IMMUTABLE_LIST && it.parameters() == listOf(IMMUTABLE_LIST)
        } == true
    }
    val list = lists.singleOrNull() ?: return null
    if (list > page) return null
    val result = code.getOrNull(list + 1) ?: return null
    if (result.opcode != Opcode.MOVE_RESULT_OBJECT) return null
    val modules = (result as OneRegisterInstruction).registerA
    // Straight to the page constructor, argument 0 is the new page, 1 its header, 2 its modules.
    val slot = built.positions.getOrNull(PAGE_MODULES) ?: return null
    if (code[page].callArguments().getOrNull(slot) != modules) return null
    if (code.subList(list + 2, page).any { writes(it, modules) }) return null
    return built.page
}

/**
 * Whether [builder] builds a page with [constructor] and names it [name]: the register the call
 * passes as the page's name (argument 6 after the new page, or wherever a constructor [resolve]
 * reads takes it, see [pageCall]) is loaded with [name] and not written again before the call.
 */
internal fun namesPage(
    builder: Method,
    constructor: MethodReference,
    name: String,
    resolve: (MethodReference) -> Method? = { null },
): Boolean {
    val code = builder.code()
    val calls = code.indices.mapNotNull { index ->
        if (code[index].opcode !in setOf(Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE)) return@mapNotNull null
        code[index].call?.let { pageCall(it, resolve) }?.takeIf { isConstructorCall(it.page, constructor) }?.let { index to it }
    }
    val (call, built) = calls.singleOrNull() ?: return false
    val slot = built.positions.getOrNull(PAGE_NAME) ?: return false
    val register = code[call].callArguments().getOrNull(slot) ?: return false
    val loads = code.indices.filter { index ->
        index < call && code[index].opcode in setOf(Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO) &&
            (code[index] as OneRegisterInstruction).registerA == register &&
            ((code[index] as ReferenceInstruction).reference as? StringReference)?.string == name
    }
    val load = loads.lastOrNull() ?: return false
    return code.subList(load + 1, call).none { writes(it, register) }
}

private fun isConstructorCall(call: MethodReference, constructor: MethodReference): Boolean =
    call.definingClass == constructor.definingClass && call.name == "<init>" && call.parameters() == constructor.parameters()

/** Whether [method] is the page constructor [constructor] names. */
internal fun isConstructor(method: Method, constructor: MethodReference): Boolean =
    method.definingClass == constructor.definingClass && method.name == "<init>" &&
        method.parameters() == constructor.parameters() && method.implementation != null

/** Whether [owner], ImmutableList, has the public static `copyOf(Collection)` the page hook calls. */
internal fun hasCollectionCopy(owner: ClassDef): Boolean = owner.methods.any {
    it.name == "copyOf" && it.returnType == IMMUTABLE_LIST && it.parameters() == listOf("Ljava/util/Collection;") &&
        AccessFlags.PUBLIC.isSet(it.accessFlags) && isStatic(it)
}

/**
 * The spec question [method] routes by, when it's the results router: static, answering a spec, taking
 * one, loading [META_AI_TAB], and asking the spec an interface boolean with no arguments first thing.
 */
internal fun routeQuestion(method: Method): MethodReference? {
    if (!isStatic(method) || method.returnType != QUERY_SPEC || QUERY_SPEC !in method.parameters()) return null
    if (!holdsString(method, META_AI_TAB)) return null
    val code = method.code()
    val first = code.firstOrNull() ?: return null
    if (first.opcode != Opcode.INVOKE_INTERFACE) return null
    val question = first.call ?: return null
    if (question.definingClass != QUERY_SPEC || question.returnType != "Z" || question.parameterTypes.isNotEmpty()) return null
    if (code.getOrNull(1)?.opcode != Opcode.MOVE_RESULT || code.getOrNull(2)?.opcode != Opcode.IF_NEZ) return null
    return question
}

/** The field GraphSearchQuerySpecImpl answers [question] from: its method of that name returns one boolean field. */
internal fun routeField(impl: ClassDef, question: MethodReference): FieldReference? {
    val getters = impl.methods.filter {
        it.name == question.name && it.returnType == "Z" && it.parameterTypes.isEmpty() && !isStatic(it)
    }
    val code = getters.singleOrNull()?.code() ?: return null
    if (code.size != 2 || code[0].opcode != Opcode.IGET_BOOLEAN || code[1].opcode != Opcode.RETURN) return null
    if ((code[0] as TwoRegisterInstruction).registerA != (code[1] as OneRegisterInstruction).registerA) return null
    return code[0].field?.takeIf { it.definingClass == impl.type && it.type == "Z" }
}

/** Whether two field references name the same field. */
internal fun sameField(one: FieldReference, other: FieldReference): Boolean =
    one.definingClass == other.definingClass && one.name == other.name && one.type == other.type

/**
 * The builder's field GraphSearchQuerySpecImpl's constructors copy into [field]: an `iget-boolean`
 * of it straight before the `iput-boolean` into [field], from the same register. Null unless every
 * copy reads the same one.
 */
internal fun builderRouteField(impl: ClassDef, field: FieldReference): FieldReference? {
    val sources = impl.methods.filter { it.name == "<init>" }.flatMap { constructor ->
        val code = constructor.code()
        code.indices.mapNotNull { index ->
            val put = code[index]
            if (put.opcode != Opcode.IPUT_BOOLEAN || put.field?.let { sameField(it, field) } != true) return@mapNotNull null
            val get = code.getOrNull(index - 1) ?: return@mapNotNull null
            if (get.opcode != Opcode.IGET_BOOLEAN) return@mapNotNull null
            if ((get as TwoRegisterInstruction).registerA != (put as TwoRegisterInstruction).registerA) return@mapNotNull null
            get.field
        }
    }
    val distinct = sources.distinctBy { "${it.definingClass}->${it.name}:${it.type}" }
    return distinct.singleOrNull()
}

/** Where the suggestion parser stores the route flag it read off a suggestion. */
internal data class RouteStore(
    /** The `iput-boolean` into the builder's field. */
    val store: Int,
    /** The register the flag is kept in, from the `move-result` right before. */
    val register: Int,
)

/**
 * Every place [parser] stores into [field] a boolean it just read off the server's tree: the
 * `iput-boolean` right after the `move-result` of TreeJNI's `getBooleanValue(int)`, or of a `()Z`
 * accessor of the suggestion's own model, both on the same register. A store of anything else, a
 * constant say, isn't one.
 */
internal fun routeStores(parser: Method, field: FieldReference): List<RouteStore> {
    val code = parser.code()
    // Why: 585 reads the flag through the suggestion model's own accessor, so a `()Z` call counts when
    // its class is one the parser also asks the suggestion's kept getName() of.
    val models = code.mapNotNull { it.call }.filter {
        it.name == "getName" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;"
    }.map { it.definingClass }.toSet()
    return code.indices.mapNotNull { index ->
        val put = code[index]
        if (put.opcode != Opcode.IPUT_BOOLEAN || put.field?.let { sameField(it, field) } != true) return@mapNotNull null
        val result = code.getOrNull(index - 1) ?: return@mapNotNull null
        val read = code.getOrNull(index - 2)?.call ?: return@mapNotNull null
        if (result.opcode != Opcode.MOVE_RESULT) return@mapNotNull null
        val register = (result as OneRegisterInstruction).registerA
        if ((put as TwoRegisterInstruction).registerA != register) return@mapNotNull null
        val fromTree = read.definingClass == TREE_JNI && read.name == "getBooleanValue" && read.returnType == "Z" &&
            read.parameters() == listOf("I")
        val fromModel = read.definingClass in models && read.returnType == "Z" && read.parameterTypes.isEmpty()
        if (!fromTree && !fromModel) return@mapNotNull null
        RouteStore(index, register)
    }
}

/**
 * Whether [method] is the search box's suggestion parser: it logs [KEYWORD_TYPE_FAILURE] and files
 * suggestions as [TYPEAHEAD_SUGGESTION], a literal of its own on 577 and 580 and a string table
 * entry [resolve] reads on 581.
 */
internal fun isSuggestionParser(method: Method, resolve: (MethodReference) -> Method?): Boolean =
    holdsString(method, KEYWORD_TYPE_FAILURE) && namesString(method, TYPEAHEAD_SUGGESTION, resolve)
