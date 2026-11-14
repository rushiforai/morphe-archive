package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/** Chats picked in the chat list's long-press menu stay off the list, on this phone only. */
internal const val HIDDEN_CHATS = "hidden_chats"
internal const val HIDDEN_CHAT_LIST = "hidden_chat_list"
internal const val HIDDEN_CHAT_ROW = "hidden_chat_row"
internal const val HIDDEN_CHAT_TAP = "hidden_chat_tap"

internal const val CHAT_HIDING = "Lapp/hushmessenger/extension/ChatHiding;"
internal const val HIDDEN_ROWS_CALL = "$CHAT_HIDING->inboxRows(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"
internal const val HIDE_ROW_CALL = "$CHAT_HIDING->menuRows(Ljava/lang/Object;Ljava/util/ArrayList;)V"
internal const val HIDE_TAP_CALL = "$CHAT_HIDING->menuTapped(Ljava/lang/Object;I)Z"
internal const val HIDDEN_CHAT_ROUTE = "$HOST_SCREENS->hiddenChatRoute()Ljava/lang/String;"

internal const val THREAD_PARTICIPANT = "Lcom/facebook/messaging/model/threads/ThreadParticipant;"
internal const val PARTICIPANT_INFO = "Lcom/facebook/messaging/model/messages/ParticipantInfo;"
internal const val USER_KEY = "Lcom/facebook/user/model/UserKey;"
/** The chat list's own name for a chat, which reads the chat's name field before it falls back to its people. */
internal const val STANDARD_THREAD_NAME = "Lcom/facebook/messaging/threadlist/plugins/core/threadname/standard/StandardThreadNameImplementation;"
internal const val CLIENT_FILTER = "Lcom/facebook/messaging/threadlist/clientfilter/ThreadListClientFilter;"
/** The chat list's long-press menu is built by the one class its plugin creates under this name. */
internal const val MENU_ITEMS = "MenuItems"

private const val ITERATOR_CALL = "Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;"
private const val NEXT_CALL = "Ljava/util/Iterator;->next()Ljava/lang/Object;"
private const val STRING_EQUALS = "Ljava/lang/String;->equals(Ljava/lang/Object;)Z"
private const val STRING = "Ljava/lang/String;"
private const val CHAR_SEQUENCE = "Ljava/lang/CharSequence;"
private const val ARRAY_LIST = "Ljava/util/ArrayList;"
private val FILTER_PARAMS = listOf(CLIENT_FILTER, IMMUTABLE_LIST, STRING)

private fun hiddenChatChanged(): Nothing =
    throw PatchException("Messenger controls: the hidden chat route no longer matches the tested build")

/** Hide chosen chats and Special contacts share the chat list and menu hooks: whichever patches first puts them in, and the other finds them there. */
internal fun Method.hiddenChatHooked(hook: String): Boolean {
    val call = when (hook) {
        HIDDEN_CHAT_LIST -> HIDDEN_ROWS_CALL
        HIDDEN_CHAT_ROW -> HIDE_ROW_CALL
        HIDDEN_CHAT_TAP -> HIDE_TAP_CALL
        else -> return false
    }
    return implementation?.instructions?.any { (it as? ReferenceInstruction)?.reference?.toString() == call } == true
}

private fun Method.isStatic() = AccessFlags.STATIC.isSet(accessFlags)

private fun Method.types() = parameterTypes.map { it.toString() }

private fun Instruction.methodRef() = (this as? ReferenceInstruction)?.reference as? MethodReference

private fun Instruction.fieldRef() = (this as? ReferenceInstruction)?.reference as? FieldReference

private fun Instruction.string() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

private fun Instruction.writesRegister(register: Int): Boolean {
    if (!opcode.setsRegister()) return false
    val written = (this as? OneRegisterInstruction)?.registerA ?: return false
    return written == register || (opcode.setsWideRegister() && written + 1 == register)
}

/**
 * Where the items read walks the chats its client filters gave back: the `iterator()` call on that list, the list's and
 * the iterator's registers, and the chat fields the loop reads from each one. The fields are the chat's key and people,
 * and from each person the account id, which is how the extension names a chat with no name of its own.
 */
internal class HiddenListSite(val at: Int, val list: Int, val iterator: Int, val key: String, val participants: String,
    val participant: String, val user: String, val userId: String)

/**
 * The walk, when the items read has exactly one. The iterator's register is overwritten by the call's own result, so
 * it's free to hold the supplier just before, and both registers fit a plain call. `this` must still be in place there.
 */
internal fun Method.hiddenListSite(): HiddenListSite? {
    val impl = implementation ?: return null
    if (definingClass != INBOX_SUPPLIER || isStatic() || parameterTypes.isNotEmpty() || returnType != IMMUTABLE_LIST) return null
    val code = impl.instructions.toList()
    val self = impl.registerCount - 1
    if (code.any { it.writesRegister(self) }) return null
    return code.indices.mapNotNull { code.hiddenListSiteAt(it, self) }.singleOrNull()
}

private fun List<Instruction>.hiddenListSiteAt(at: Int, self: Int): HiddenListSite? {
    val walk = this[at] as? FiveRegisterInstruction ?: return null
    if (walk.opcode != Opcode.INVOKE_VIRTUAL || walk.methodRef()?.toString() != ITERATOR_CALL || walk.registerCount != 1) return null
    val list = walk.registerC
    val taken = getOrNull(at + 1)
    if (taken?.opcode != Opcode.MOVE_RESULT_OBJECT) return null
    val iterator = (taken as OneRegisterInstruction).registerA
    if (iterator == list || list > 15 || iterator > 15 || list >= self || iterator >= self) return null
    // The list is what the last client filter handed back.
    val written = (at - 1 downTo 1).firstOrNull { this[it].writesRegister(list) } ?: return null
    val filter = this[written - 1]
    val filtered = filter.methodRef() ?: return null
    if (this[written].opcode != Opcode.MOVE_RESULT_OBJECT || (filter.opcode != Opcode.INVOKE_INTERFACE && filter.opcode != Opcode.INVOKE_INTERFACE_RANGE) ||
        filtered.returnType != IMMUTABLE_LIST || filtered.parameterTypes.map { it.toString() } != FILTER_PARAMS) return null
    // Each turn takes the next chat.
    val next = (at + 2..minOf(at + 8, size - 3)).firstOrNull { i ->
        this[i].opcode == Opcode.INVOKE_INTERFACE && this[i].methodRef()?.toString() == NEXT_CALL && (this[i] as FiveRegisterInstruction).registerC == iterator
    } ?: return null
    val chat = this[next + 1]
    val cast = this[next + 2]
    if (chat.opcode != Opcode.MOVE_RESULT_OBJECT || cast.opcode != Opcode.CHECK_CAST ||
        (cast as OneRegisterInstruction).registerA != (chat as OneRegisterInstruction).registerA ||
        ((cast as ReferenceInstruction).reference as TypeReference).type != THREAD_SUMMARY) return null
    fun read(owner: String, type: String, name: String? = null) = drop(next + 3).firstOrNull { i ->
        i.opcode == Opcode.IGET_OBJECT && i.fieldRef()?.let { it.definingClass == owner && it.type == type && (name == null || it.name == name) } == true
    }?.fieldRef()?.toString()
    return HiddenListSite(at, list, iterator,
        read(THREAD_SUMMARY, THREAD_KEY_TYPE) ?: return null,
        read(THREAD_SUMMARY, IMMUTABLE_LIST) ?: return null,
        read(THREAD_PARTICIPANT, PARTICIPANT_INFO) ?: return null,
        read(PARTICIPANT_INFO, USER_KEY) ?: return null,
        read(USER_KEY, STRING, "id") ?: return null)
}

/** The extension takes the supplier and the filtered list, and the walk goes over whatever list comes back. */
internal fun MutableMethod.injectHiddenChatList() {
    if (hiddenChatHooked(HIDDEN_CHAT_LIST)) return
    val site = hiddenListSite() ?: hiddenChatChanged()
    // A branch into the walk keeps landing on its first replacement instruction.
    replaceInstruction(site.at, "move-object/from16 v${site.iterator}, p0")
    addInstructions(site.at + 1, """
        invoke-static {v${site.iterator}, v${site.list}}, $HIDDEN_ROWS_CALL
        move-result-object v${site.list}
        check-cast v${site.list}, $IMMUTABLE_LIST
        invoke-virtual {v${site.list}}, $ITERATOR_CALL
    """.trimIndent())
}

/** How the menu builds a row, all from calls and writes its own rows make: "factory", then the id, icon, title and description, then "build". */
internal class HiddenRowBuilder(val factory: String, val id: String, val icon: String, val iconType: String, val title: String,
    val description: String, val build: String)

/** The menu's row list, where it hands the list back, and a register that's free there to hold the menu. */
internal class HiddenRowSite(val at: Int, val rows: Int, val menu: Int, val builder: HiddenRowBuilder)

internal fun Method.hiddenRowSite(): HiddenRowSite? {
    val impl = implementation ?: return null
    if (isStatic() || parameterTypes.isNotEmpty() || returnType != ARRAY_LIST) return null
    val code = impl.instructions.toList()
    val at = code.indices.singleOrNull { code[it].opcode == Opcode.RETURN_OBJECT } ?: return null
    val rows = (code[at] as OneRegisterInstruction).registerA
    val menu = if (rows == 0) 1 else 0
    if (rows > 15 || menu >= impl.registerCount - 1) return null
    return HiddenRowSite(at, rows, menu, code.rowBuilder() ?: return null)
}

private fun List<Instruction>.rowBuilder(): HiddenRowBuilder? {
    fun calls(opcode: Opcode, wanted: (MethodReference) -> Boolean) =
        filter { it.opcode == opcode }.mapNotNull { it.methodRef() }.filter(wanted).map { it.toString() }.distinct().singleOrNull()
    fun writes(opcode: Opcode, owner: String, type: String) =
        filter { it.opcode == opcode }.mapNotNull { it.fieldRef() }.filter { it.definingClass == owner && it.type == type }.map { it.toString() }.distinct().singleOrNull()
    val built = filter { it.opcode == Opcode.INVOKE_STATIC }.mapNotNull { it.methodRef() }.filter { m ->
        m.parameterTypes.map { it.toString() } == listOf(m.definingClass, STRING) && m.returnType.startsWith("L")
    }.distinctBy { it.toString() }.singleOrNull() ?: return null
    val owner = built.definingClass
    val icon = filter { it.opcode == Opcode.INVOKE_VIRTUAL }.mapNotNull { it.methodRef() }.filter { m ->
        m.definingClass == owner && m.returnType == "V" && m.parameterTypes.size == 1 && m.parameterTypes[0].toString().let { it.startsWith("L") && it != CHAR_SEQUENCE && it != STRING }
    }.distinctBy { it.toString() }.singleOrNull() ?: return null
    return HiddenRowBuilder(
        calls(Opcode.INVOKE_STATIC) { it.definingClass == owner && it.parameterTypes.isEmpty() && it.returnType == owner } ?: return null,
        writes(Opcode.IPUT, owner, "I") ?: return null,
        icon.toString(), icon.parameterTypes[0].toString(),
        calls(Opcode.INVOKE_VIRTUAL) { it.definingClass == owner && it.returnType == "V" && it.parameterTypes.map { p -> p.toString() } == listOf(CHAR_SEQUENCE) } ?: return null,
        // 587 fills the description through a setter instead of writing the field, and the extension calls that.
        writes(Opcode.IPUT_OBJECT, owner, STRING)
            ?: calls(Opcode.INVOKE_VIRTUAL) { it.definingClass == owner && it.returnType == "V" && it.parameterTypes.map { p -> p.toString() } == listOf(STRING) }
            ?: return null,
        built.toString())
}

/** The builder, once its icon is an enum that has both eye icons, the ones the row shows for Hide and for Show. */
internal fun Method.hiddenRowBuilder(classOf: (String) -> ClassDef?): HiddenRowBuilder? {
    val builder = hiddenRowSite()?.builder ?: return null
    val icons = classOf(builder.iconType) ?: return null
    val names = icons.methods.flatMap { it.implementation?.instructions?.mapNotNull { i -> i.string() }.orEmpty() }.toSet()
    return builder.takeIf { AccessFlags.ENUM.isSet(icons.accessFlags) && "EYE" in names && "EYE_CROSS" in names }
}

/** The extension adds its row to the finished list just before the menu hands it back. */
internal fun MutableMethod.injectHiddenChatRow() {
    if (hiddenChatHooked(HIDDEN_CHAT_ROW)) return
    val site = hiddenRowSite() ?: hiddenChatChanged()
    replaceInstruction(site.at, "move-object/from16 v${site.menu}, p0")
    addInstructions(site.at + 1, "invoke-static {v${site.menu}, v${site.rows}}, $HIDE_ROW_CALL\nreturn-object v${site.rows}")
}

/** The menu's chat field, read by its tap, when the tap can ask first with two scratch locals and nothing jumps to its start. */
internal fun Method.hiddenTapSummary(): String? {
    val impl = implementation ?: return null
    if (isStatic() || returnType != "V" || types() != listOf("I") || impl.registerCount - 2 < 2 || 0 in jumpTargets()) return null
    return impl.instructions.filter { it.opcode == Opcode.IGET_OBJECT }.mapNotNull { it.fieldRef() }
        .filter { it.definingClass == definingClass && it.type == THREAD_SUMMARY }.map { it.toString() }.distinct().singleOrNull()
}

/** A tap on the extension's own row stops there. Every other row goes on to Messenger. */
internal fun MutableMethod.injectHiddenChatTap() {
    if (hiddenChatHooked(HIDDEN_CHAT_TAP)) return
    hiddenTapSummary() ?: hiddenChatChanged()
    addInstructionsWithLabels(0, """
        move-object/from16 v0, p0
        move/from16 v1, p1
        invoke-static {v0, v1}, $HIDE_TAP_CALL
        move-result v0
        if-eqz v0, :stock
        return-void
    """.trimIndent(), ExternalLabel("stock", getInstruction(0)))
}

/**
 * The menu's class for the chat list's long press: the class its plugin builds once the plugin's name is "MenuItems",
 * with one row list and one tap. Empty when there isn't exactly one such class.
 */
internal fun findHiddenChats(classes: Iterable<ClassDef>): Map<String, List<Method>> {
    val byType = classes.associateBy { it.type }
    val menus = classes.flatMap { it.methods }.flatMap { method ->
        val code = method.implementation?.instructions?.toList().orEmpty()
        code.indices.mapNotNull { i -> code.menuBuiltAt(i) }
    }.distinct().mapNotNull { byType[it] }.filter { menu ->
        menu.methods.count { !it.isStatic() && it.parameterTypes.isEmpty() && it.returnType == ARRAY_LIST } == 1 &&
            menu.methods.count { !it.isStatic() && it.returnType == "V" && it.types() == listOf("I") } == 1
    }
    val menu = menus.singleOrNull() ?: return mapOf(HIDDEN_CHAT_ROW to emptyList(), HIDDEN_CHAT_TAP to emptyList())
    return mapOf(
        HIDDEN_CHAT_ROW to listOf(menu.methods.single { !it.isStatic() && it.parameterTypes.isEmpty() && it.returnType == ARRAY_LIST }),
        HIDDEN_CHAT_TAP to listOf(menu.methods.single { !it.isStatic() && it.returnType == "V" && it.types() == listOf("I") }),
    )
}

/** `const-string "MenuItems"`, its `equals`, the answer, the branch past it and the menu's `new-instance`. */
private fun List<Instruction>.menuBuiltAt(at: Int): String? {
    if ((this[at].opcode != Opcode.CONST_STRING && this[at].opcode != Opcode.CONST_STRING_JUMBO) || this[at].string() != MENU_ITEMS) return null
    val asked = getOrNull(at + 1) ?: return null
    if (asked.opcode != Opcode.INVOKE_VIRTUAL || asked.methodRef()?.toString() != STRING_EQUALS || getOrNull(at + 2)?.opcode != Opcode.MOVE_RESULT ||
        getOrNull(at + 3)?.opcode != Opcode.IF_EQZ || getOrNull(at + 4)?.opcode != Opcode.NEW_INSTANCE) return null
    return ((this[at + 4] as ReferenceInstruction).reference as TypeReference).type
}

/** How the settings list names a hidden chat: the chat's own name, or else its people's names, which are SecretStrings. */
internal class HiddenChatNames(val name: String, val secretName: String, val secretText: String)

internal fun hiddenChatNames(classOf: (String) -> ClassDef?): HiddenChatNames? {
    val namer = classOf(STANDARD_THREAD_NAME)?.methods?.singleOrNull { it.types() == listOf(THREAD_SUMMARY) } ?: return null
    val name = namer.implementation?.instructions?.firstOrNull { i ->
        i.opcode == Opcode.IGET_OBJECT && i.fieldRef()?.let { it.definingClass == THREAD_SUMMARY && it.type == STRING } == true
    }?.fieldRef()?.toString() ?: return null
    // ParticipantInfo's toString lists each field under its name, so the read after "name" is the person's name.
    val described = classOf(PARTICIPANT_INFO)?.methods?.singleOrNull { it.name == "toString" && it.parameterTypes.isEmpty() && it.returnType == STRING }
        ?.implementation?.instructions?.toList() ?: return null
    val label = described.indexOfFirst { (it.opcode == Opcode.CONST_STRING || it.opcode == Opcode.CONST_STRING_JUMBO) && it.string() == "name" }
    val secretName = described.getOrNull(label + 1)?.takeIf { label >= 0 && it.opcode == Opcode.IGET_OBJECT }?.fieldRef()
        ?.takeIf { it.definingClass == PARTICIPANT_INFO && it.type == SECRET_STRING }?.toString() ?: return null
    // SecretString keeps the real text in the field its (String) constructor fills from the argument register.
    val secret = classOf(SECRET_STRING)?.methods?.singleOrNull { it.name == "<init>" && it.types() == listOf(STRING) && it.implementation != null } ?: return null
    val argument = secret.implementation!!.registerCount - 1
    val secretText = secret.implementation!!.instructions.mapNotNull { i ->
        i.fieldRef()?.takeIf { it.definingClass == SECRET_STRING && it.type == STRING && (i as? TwoRegisterInstruction)?.registerA == argument }?.toString()
    }.distinct().singleOrNull() ?: return null
    return HiddenChatNames(name, secretName, secretText)
}

/**
 * What the extension reads and builds by reflection, as "|"-joined parts: each field "Lowner;->name:type" and each
 * call "Lowner;->name(params)return", then the chat list refresh route.
 */
internal data class HiddenChatRoute(val key: String, val name: String, val participants: String, val participant: String, val user: String,
    val userId: String, val secretName: String, val secretText: String, val menuSummary: String, val factory: String, val id: String,
    val icon: String, val title: String, val description: String, val build: String, val refresh: InboxRefreshRoute) {
    override fun toString() = listOf(key, name, participants, participant, user, userId, secretName, secretText, menuSummary, factory, id,
        icon, title, description, build, refresh.toString()).joinToString("|")
}

/** Proved on the stock classes before any edit. */
internal fun resolveHiddenChatRoute(list: Method, row: Method, tap: Method, classOf: (String) -> ClassDef?): HiddenChatRoute {
    val site = list.hiddenListSite() ?: hiddenChatChanged()
    val names = hiddenChatNames(classOf) ?: hiddenChatChanged()
    val builder = row.hiddenRowBuilder(classOf) ?: hiddenChatChanged()
    val summary = tap.hiddenTapSummary() ?: hiddenChatChanged()
    if (row.definingClass != tap.definingClass) hiddenChatChanged()
    return HiddenChatRoute(site.key, names.name, site.participants, site.participant, site.user, site.userId, names.secretName, names.secretText,
        summary, builder.factory, builder.id, builder.icon, builder.title, builder.description, builder.build, resolveInboxRefresh(list, classOf))
}

/** Checks the extension's half before any edit and returns the stub the route goes into. */
internal fun BytecodePatchContext.hiddenChatStub(): MutableMethod {
    val calls = classDefByOrNull(CHAT_HIDING)?.methods?.toList().orEmpty()
    for (id in listOf(HIDDEN_ROWS_CALL, HIDE_ROW_CALL, HIDE_TAP_CALL)) {
        val call = calls.singleOrNull { it.hookId() == id }
        if (call == null || !AccessFlags.STATIC.isSet(call.accessFlags) || !AccessFlags.PUBLIC.isSet(call.accessFlags)) hiddenChatChanged()
    }
    val stub = mutableClassDefBy(HOST_SCREENS).methods.singleOrNull { it.hookId() == HIDDEN_CHAT_ROUTE } ?: hiddenChatChanged()
    if (stub.routeWritten() == null) stub.validateRouteStub(HIDDEN_CHAT_ROUTE)
    return stub
}

/** The route a patch that shares these hooks already wrote, or null while the stub still answers "". */
private fun Method.routeWritten(): String? {
    val code = implementation?.instructions?.toList() ?: return null
    if (code.size != 2 || code[1].opcode != Opcode.RETURN_OBJECT) return null
    return code[0].string()?.takeIf { it.isNotEmpty() }
}

internal fun MutableMethod.writeHiddenChatRoute(route: HiddenChatRoute) {
    routeWritten()?.let { if (it == route.toString()) return else hiddenChatChanged() }
    validateRouteStub(HIDDEN_CHAT_ROUTE)
    val register = (implementation!!.instructions.first() as OneRegisterInstruction).registerA
    replaceInstruction(0, "const-string v$register, \"$route\"")
}
