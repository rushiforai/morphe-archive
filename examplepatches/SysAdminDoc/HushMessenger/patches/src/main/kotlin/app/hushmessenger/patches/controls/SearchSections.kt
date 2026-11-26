package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

/**
 * #204 and #207: search's own sections and rows, and the launcher every chat opens through.
 *
 * Every search source hands its finished sections to one result class's constructor, and every section is made by one
 * section constructor, which takes the section's type and its rows. Both lists pass through the extension on their way
 * in, which drops a section a switch hides (Suggested, recent reels, Meta AI's) and, with Hide Meta AI on, Meta AI's
 * rows from every section. The extension hands back a plain list, so it goes through ImmutableList.copyOf, which gives
 * an ImmutableList back as it is. Neither constructor has a register to spare, so the list's own register carries the
 * call, and a null list skips it.
 *
 * The chat launcher answers whether it handled a chat. With Block Meta AI chats on, it says yes for one of Meta AI's
 * chats without opening it.
 *
 * The result class is the one the People You May Know source returns, the section class the one whose constructor
 * starts with the enum of section types, and the launcher the method that names its own spec.
 */
internal const val SEARCH_SECTIONS = "search_sections"
internal const val SEARCH_ITEMS = "search_items"
internal const val AI_CHAT_OPEN = "ai_chat_open"

private const val SEARCH_EXTENSION = "Lapp/hushmessenger/extension/SearchSections;"
internal const val SEARCH_SECTIONS_CALL = "$SEARCH_EXTENSION->sections(Ljava/util/List;)Ljava/util/List;"
internal const val SEARCH_ITEMS_CALL = "$SEARCH_EXTENSION->items(Ljava/lang/Object;Ljava/util/List;)Ljava/util/List;"
internal const val AI_CHAT_OPEN_CALL = "$SEARCH_EXTENSION->blocksChat(Ljava/lang/Object;)Z"
internal const val SEARCH_COPY_LIST = "$IMMUTABLE_LIST->copyOf(Ljava/util/Collection;)$IMMUTABLE_LIST"

/** One of the section types, as the enum's static initializer names it. */
internal const val SECTION_TYPE_ANCHOR = "NULL_STATE_AI_BOTS"
internal const val THREAD_LAUNCHER_SPEC = "messaging.navigation.threadviewlauncher.ThreadViewLauncherSpec"
internal const val THREAD_VIEW_PARAMS = "Lcom/facebook/messaging/threadview/params/ThreadViewParams;"
private const val SEARCH_INTEGER = "Ljava/lang/Integer;"
private const val SEARCH_MAP = "Lcom/google/common/collect/ImmutableMap;"

private val RESULT_PARAMETERS = listOf(IMMUTABLE_LIST, SEARCH_INTEGER, "I")

/** 588's section constructor takes a second Integer after 587's one. */
private fun sectionParameters(type: String) = listOf(type, IMMUTABLE_LIST, SEARCH_MAP, SEARCH_INTEGER, SEARCH_INTEGER, "Ljava/lang/String;", "Z")

private val LAUNCHER_PARAMETERS = { types: List<String> ->
    types.size == 4 && types[0] == "Landroid/content/Context;" && types[2] == FB_USER_SESSION && types[3] == THREAD_VIEW_PARAMS
}

private fun Method.types() = parameterTypes.map { it.toString() }

private fun Method.searchCode() = implementation?.instructions?.toList().orEmpty()

/** The register holding parameter [index] (0 is the first after `this`). */
internal fun Method.argumentRegister(index: Int): Int? {
    val registers = implementation?.registerCount ?: return null
    val sizes = types().map { if (it == "J" || it == "D") 2 else 1 }
    val self = if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    val first = registers - sizes.sum() - self
    if (first < 0) return null
    return first + self + sizes.take(index).sum()
}

/** Whether [method]'s code starts with this hook's call on [register]: another control already put it there. */
private fun Method.startsWithListHook(call: String, register: Int): Boolean {
    val code = searchCode()
    val skip = code.getOrNull(0)
    val hook = code.getOrNull(1)
    return skip?.opcode == Opcode.IF_EQZ && (skip as OneRegisterInstruction).registerA == register &&
        hook?.opcode == Opcode.INVOKE_STATIC_RANGE && (hook as ReferenceInstruction).reference.toString() == call
}

private fun searchChanged(what: String, method: Method): Nothing =
    throw PatchException("Messenger controls: search's $what ${method.hookId()} no longer matches the tested build")

/** The result constructor's list register, or null when [this] isn't that constructor. */
internal fun Method.searchSectionsList(): Int? {
    if (name != "<init>" || AccessFlags.STATIC.isSet(accessFlags) || returnType != "V" || types() != RESULT_PARAMETERS) return null
    if (implementation == null || 0 in jumpTargets()) return null
    return argumentRegister(0)
}

/** The section constructor's type and list registers, side by side, or null when [this] isn't that constructor. */
internal fun Method.searchItemsSite(sectionType: String? = null): Pair<Int, Int>? {
    if (name != "<init>" || AccessFlags.STATIC.isSet(accessFlags) || returnType != "V") return null
    val types = types()
    if (types.size != 7 || (sectionType != null && types[0] != sectionType) || types != sectionParameters(types[0])) return null
    if (implementation == null || 0 in jumpTargets()) return null
    val type = argumentRegister(0) ?: return null
    val list = argumentRegister(1) ?: return null
    return if (list == type + 1) type to list else null
}

/** The launcher's ThreadViewParams register, or null when [this] isn't the launcher or has no local for the answer. */
internal fun Method.aiChatOpenParams(): Int? {
    if (AccessFlags.STATIC.isSet(accessFlags) || returnType != "Z" || !LAUNCHER_PARAMETERS(types())) return null
    val params = argumentRegister(3) ?: return null
    // The answer goes in v0, which has to be a local: `this` sits right above the locals, so it can't be v0.
    val self = argumentRegister(0)?.minus(1) ?: return null
    if (self < 1) return null
    if (0 in jumpTargets()) return null
    return params
}

/** The people search source's methods, whose return type is the result class. */
internal val searchResultSources = MethodCheck {
    val source = StringMatch(PEOPLE_SEARCH_SOURCE)
    val failure = StringMatch("Failed to load people you may know")
    val test: MethodTest = { _, method ->
        !AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType.startsWith("L") && source.inCode(method) && failure.inCode(method)
    }
    test
}

/** The enum of section types, by the type it names. */
internal val searchSectionTypes = ClassCheck {
    val anchor = StringMatch(SECTION_TYPE_ANCHOR)
    val test: MethodTest = { cls, method -> cls.superclass == "Ljava/lang/Enum;" && method.name == "<clinit>" && anchor.inCode(method) }
    test
}

internal val aiChatLaunchers = MethodCheck {
    val spec = StringMatch(THREAD_LAUNCHER_SPEC)
    val test: MethodTest = { _, method ->
        !AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "Z" && LAUNCHER_PARAMETERS(method.types()) && spec.inCode(method)
    }
    test
}

/** The result constructor, taken only while the people source names exactly one result class that has it. */
internal fun findSearchSections(classes: Iterable<ClassDef>): List<Method> {
    val result = searchResultSources.methods(classes).map { it.returnType }.distinct().singleOrNull() ?: return emptyList()
    val cls = classes.firstOrNull { it.type == result } ?: return emptyList()
    return listOfNotNull(cls.methods.singleOrNull { it.searchSectionsList() != null })
}

/** The section constructor, taken only while exactly one enum names the section types and one constructor takes it. */
internal fun findSearchItems(classes: Iterable<ClassDef>): List<Method> {
    val type = searchSectionTypes.classes(classes).singleOrNull()?.type ?: return emptyList()
    val found = classes.flatMap { cls -> cls.methods.filter { it.name == "<init>" && it.searchItemsSite(type) != null } }
    return listOfNotNull(found.singleOrNull())
}

internal fun findAiChatOpen(classes: Iterable<ClassDef>): List<Method> =
    listOfNotNull(aiChatLaunchers.methods(classes).singleOrNull { it.aiChatOpenParams() != null })

internal fun Method.validateSearchSections() {
    val list = searchSectionsList() ?: run {
        // Hooked already by another control that rides the same constructor.
        val hooked = argumentRegister(0)
        if (hooked != null && startsWithListHook(SEARCH_SECTIONS_CALL, hooked)) return
        searchChanged("result constructor", this)
    }
    if (list > 255) searchChanged("result constructor", this)
}

internal fun Method.validateSearchItems() {
    searchItemsSite() ?: run {
        val hooked = argumentRegister(1)
        if (hooked != null && startsWithListHook(SEARCH_ITEMS_CALL, hooked)) return
        searchChanged("section constructor", this)
    }
}

/** Whether [this] starts with an invoke-static/range of [call]: a hook that's in already. */
internal fun Method.startsWithCall(call: String): Boolean {
    val first = implementation?.instructions?.firstOrNull()
    return first?.opcode == Opcode.INVOKE_STATIC_RANGE && (first as ReferenceInstruction).reference.toString() == call
}

internal fun Method.validateAiChatOpen() {
    aiChatOpenParams() ?: run {
        if (startsWithCall(AI_CHAT_OPEN_CALL)) return
        searchChanged("chat launcher", this)
    }
}

/** Once per constructor, however many controls ride it. */
internal fun MutableMethod.injectSearchSections() {
    val list = searchSectionsList() ?: run {
        validateSearchSections()
        return
    }
    if (startsWithListHook(SEARCH_SECTIONS_CALL, list)) return
    addInstructionsWithLabels(0, """
        if-eqz v$list, :stock_sections
        invoke-static/range {v$list .. v$list}, $SEARCH_SECTIONS_CALL
        move-result-object v$list
        invoke-static/range {v$list .. v$list}, $SEARCH_COPY_LIST
        move-result-object v$list
    """.trimIndent(), ExternalLabel("stock_sections", getInstruction(0)))
}

internal fun MutableMethod.injectSearchItems() {
    val (type, list) = searchItemsSite() ?: run {
        validateSearchItems()
        return
    }
    if (startsWithListHook(SEARCH_ITEMS_CALL, list)) return
    addInstructionsWithLabels(0, """
        if-eqz v$list, :stock_items
        invoke-static/range {v$type .. v$list}, $SEARCH_ITEMS_CALL
        move-result-object v$list
        invoke-static/range {v$list .. v$list}, $SEARCH_COPY_LIST
        move-result-object v$list
    """.trimIndent(), ExternalLabel("stock_items", getInstruction(0)))
}

internal fun MutableMethod.injectAiChatOpen() {
    val params = aiChatOpenParams() ?: run {
        validateAiChatOpen()
        return
    }
    if (startsWithCall(AI_CHAT_OPEN_CALL)) return
    addInstructionsWithLabels(0, """
        invoke-static/range {v$params .. v$params}, $AI_CHAT_OPEN_CALL
        move-result v0
        if-eqz v0, :stock_launch
        const/4 v0, 0x1
        return v0
    """.trimIndent(), ExternalLabel("stock_launch", getInstruction(0)))
}
