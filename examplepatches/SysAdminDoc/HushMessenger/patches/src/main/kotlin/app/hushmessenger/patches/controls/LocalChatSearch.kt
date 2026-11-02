package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.w3c.dom.Document
import org.w3c.dom.Element

/**
 * The result list of a chat's own search. Meta's server no longer searches some old chats, though they still open and
 * what they've loaded sits in Messenger's database on the phone, so the list gets a button that searches that (#92).
 * Only the list for chats that aren't end-to-end encrypted: an encrypted chat's messages aren't in that database.
 */
internal const val LOCAL_CHAT_SEARCH = "local_chat_search"

/** The list's fragment tag, in the one method that picks which list a chat gets. */
internal const val LOCAL_SEARCH_LIST = "message_search_thread_message_list_fragment"
internal const val LOCAL_SEARCH_ACTIVITY = "app.hushmessenger.extension.LocalSearchActivity"
internal const val LOCAL_SEARCH_QUERY_CALL = "Lapp/hushmessenger/extension/LocalChatSearch;->query(Ljava/lang/Object;Ljava/lang/String;)V"
internal const val LOCAL_SEARCH_VIEW_CALL = "Lapp/hushmessenger/extension/LocalChatSearch;->attach(Landroid/view/View;)V"

private const val THREAD_KEY = "Lcom/facebook/messaging/model/threadkey/ThreadKey;"
private const val STRING = "Ljava/lang/String;"

private fun localSearchChanged(detail: String): Nothing =
    throw PatchException("Messenger controls: the chat message search changed ($detail)")

private fun Method.parameters() = parameterTypes.map { it.toString() }

private fun Instruction.reference() = (this as? ReferenceInstruction)?.reference

/**
 * The list the picker makes for a chat that isn't encrypted. The picker takes the summary, the words and a count, tags
 * the list, and has one branch on a yes-or-no of the chat's key that makes a different list on each side: encrypted
 * falls through, anything else jumps. Null when this isn't the picker or the shape changed.
 */
internal fun Method.localSearchListType(): String? {
    if (returnType != "V" || parameters() != listOf(THREAD_SUMMARY, STRING, "I")) return null
    val code = implementation?.instructions?.toList() ?: return null
    if (code.none { (it.reference() as? StringReference)?.string == LOCAL_SEARCH_LIST }) return null
    fun made(index: Int) = code.getOrNull(index)?.takeIf { it.opcode == Opcode.NEW_INSTANCE }
        ?.let { (it.reference() as? TypeReference)?.type }
    val lists = code.indices.mapNotNull { index ->
        val call = code[index].reference() as? MethodReference
        if (code[index].opcode != Opcode.INVOKE_VIRTUAL || call?.definingClass != THREAD_KEY || call.returnType != "Z" ||
            call.parameterTypes.isNotEmpty() || code.getOrNull(index + 1)?.opcode != Opcode.MOVE_RESULT ||
            code.getOrNull(index + 2)?.opcode != Opcode.IF_EQZ) return@mapNotNull null
        val encrypted = made(index + 3) ?: return@mapNotNull null
        made(code.branchTarget(index + 2))?.takeIf { it != encrypted }
    }
    return lists.singleOrNull()
}

/** Where the list's search method reads the chat's key off the summary, and the registers that hold the key and words. */
internal class LocalSearchKey(val index: Int, val key: Int, val words: Int)

/**
 * The list's search method: an instance method taking the summary and the words, which reads the key off that summary
 * once and hasn't touched the words by then. Null when this isn't that method or the shape changed.
 */
internal fun Method.localSearchKey(): LocalSearchKey? {
    if (AccessFlags.STATIC.isSet(accessFlags) || returnType != "V" || parameters() != listOf(THREAD_SUMMARY, STRING)) return null
    val code = implementation?.instructions?.toList() ?: return null
    val summary = parameterRegister(1)
    val words = parameterRegister(2)
    val reads = code.indices.filter { index ->
        val read = code[index]
        val field = read.reference() as? FieldReference
        read.opcode == Opcode.IGET_OBJECT && field?.definingClass == THREAD_SUMMARY && field.type == THREAD_KEY &&
            (read as TwoRegisterInstruction).registerB == summary
    }
    val index = reads.singleOrNull() ?: return null
    val key = (code[index] as TwoRegisterInstruction).registerA
    // Both go in a plain invoke, and the words have to still be the words when it runs.
    if (key > 15 || words > 15 || index + 1 in jumpTargets()) return null
    if (code.take(index).any { it.opcode.setsRegister() && (it as? OneRegisterInstruction)?.registerA == words }) return null
    return LocalSearchKey(index, key, words)
}

/** The list's own onViewCreated, the moment the list has a view. */
internal fun Method.isLocalSearchView(): Boolean = !AccessFlags.STATIC.isSet(accessFlags) && name == "onViewCreated" &&
    returnType == "V" && parameters() == listOf("Landroid/view/View;", "Landroid/os/Bundle;") && implementation != null

/** The list's search method and view, once one picker names one list that has exactly one of each. */
internal fun findLocalChatSearch(classes: Iterable<ClassDef>): List<Method> {
    val type = classes.flatMap { it.methods }.mapNotNull { it.localSearchListType() }.singleOrNull() ?: return emptyList()
    val list = classes.singleOrNull { it.type == type } ?: return emptyList()
    val search = list.methods.filter { it.localSearchKey() != null }.singleOrNull() ?: return emptyList()
    val view = list.methods.filter { it.isLocalSearchView() }.singleOrNull() ?: return emptyList()
    return listOf(search, view)
}

internal fun MutableMethod.validateLocalChatSearch() {
    if (localSearchKey() == null && !isLocalSearchView()) localSearchChanged("no search method or view in ${hookId()}")
}

/**
 * The search method tells the extension the chat and words, and the view gets the button, which reads nothing until
 * it's tapped. Messenger's own list and search carry on as they were. Off, Pause and safe mode add no button.
 */
internal fun MutableMethod.injectLocalChatSearch() {
    val search = localSearchKey()
    if (search != null) {
        addInstructions(search.index + 1, "invoke-static {v${search.key}, v${search.words}}, $LOCAL_SEARCH_QUERY_CALL")
        return
    }
    validateLocalChatSearch()
    val view = parameterRegister(1)
    addInstructions(0, "invoke-static/range {v$view .. v$view}, $LOCAL_SEARCH_VIEW_CALL")
}

/**
 * The search screen runs in a process of its own. Android's SQLite in Messenger's process would drop the locks
 * Messenger's own SQLite holds on the same file the moment it closes it, while another process just reads the way any
 * second reader of the database does.
 */
internal fun Document.addLocalSearch() {
    val application = getElementsByTagName("application").item(0) as? Element
        ?: throw PatchException("Messenger controls: expected one application")
    val activity = createElement("activity")
    listOf("name" to LOCAL_SEARCH_ACTIVITY, "exported" to "false", "excludeFromRecents" to "true", "process" to ":hushsearch",
        "configChanges" to "orientation|screenSize|smallestScreenSize|screenLayout|keyboardHidden",
        "windowSoftInputMode" to "adjustResize").forEach { (name, value) -> activity.setAttribute("android:$name", value) }
    application.appendChild(activity)
}
