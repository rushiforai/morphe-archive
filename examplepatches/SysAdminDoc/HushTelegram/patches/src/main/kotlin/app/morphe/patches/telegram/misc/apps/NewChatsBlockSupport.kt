/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.apps

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.SendRequestGate
import app.morphe.patches.telegram.misc.extension.freeLocalsAt
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.resolveSendRequestGate
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.call
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val PATCH = "Hide popular apps"

internal const val NEW_CHATS_BLOCK = "$EXTENSION_PACKAGE/misc/NewChatsBlock;"

/** Every request on its way out, with its callback: true drops a join and answers a link lookup. */
internal const val NEW_CHATS_BLOCK_DROP = "$NEW_CHATS_BLOCK->drop(Ljava/lang/Object;Ljava/lang/Object;)Z"

/** A chat you aren't in, about to open: true keeps it closed. */
internal const val NEW_CHATS_BLOCK_OPEN = "$NEW_CHATS_BLOCK->refuseOpen()Z"

internal const val IS_NOT_IN_CHAT = "$CHAT_OBJECT->isNotInChat($TL_CHAT)Z"
internal const val IS_MONO_FORUM = "$CHAT_OBJECT->isMonoForum($TL_CHAT)Z"
internal const val LOAD_FULL_CHAT = "$MESSAGES_CONTROLLER->loadFullChat(JIZ)V"
internal const val GET_CHAT_BY_ID = "$MESSAGES_CONTROLLER->getChat(Ljava/lang/Long;)$TL_CHAT"
internal const val TOPICS_LOADED = "Lorg/telegram/messenger/NotificationCenter;->topicsDidLoaded:I"
private const val START_SHORT_POLL = "startShortPoll"
private const val FRAGMENT_CREATE = "onFragmentCreate"
private const val EXTENSION_TYPES = "Lapp/hushtelegram/extension/"

/** What the chat screen's check adds, nops aside. */
internal const val CHAT_OPEN_CHECK_SIZE = 5

/** What the topic list's check adds, nops aside. */
internal const val TOPICS_OPEN_CHECK_SIZE = 20

/** The chat screen's check, in front of its setup for a channel or group you aren't in. */
internal fun chatOpenCheck(answer: Int) = """
    invoke-static {}, $NEW_CHATS_BLOCK_OPEN
    move-result v$answer
    if-eqz v$answer, :hush_stock
    const/16 v$answer, 0x0
    return v$answer
    :hush_stock
    nop
""".trimIndent()

/**
 * The topic list's check, at its very start: the group it was opened for, by [chatId], through
 * [controller], the fragment's own way to its MessagesController. Only a group that's loaded, isn't
 * a channel's direct messages and that you aren't in goes on to ask the extension.
 */
internal fun topicsOpenCheck(controller: String, chatId: String) = """
    move-object/from16 v3, p0
    invoke-virtual {v3}, $controller
    move-result-object v0
    iget-wide v1, v3, $chatId
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v1
    invoke-virtual {v0, v1}, $GET_CHAT_BY_ID
    move-result-object v0
    if-eqz v0, :hush_stock
    invoke-static {v0}, $IS_MONO_FORUM
    move-result v1
    if-nez v1, :hush_stock
    invoke-static {v0}, $IS_NOT_IN_CHAT
    move-result v0
    if-eqz v0, :hush_stock
    invoke-static {}, $NEW_CHATS_BLOCK_OPEN
    move-result v0
    if-eqz v0, :hush_stock
    const/4 v0, 0x0
    return v0
    :hush_stock
    nop
""".trimIndent()

/** One screen's check, put in front of [entry] of [method], [size] instructions long without its nops. */
internal class NewChatOpenSite(val method: MutableMethod, val entry: Int, private val size: Int, private val code: (Method) -> String) {
    fun apply(into: (MutableMethod) -> MutableMethod = { it }) {
        val target = into(method)
        val before = target.counted()
        target.addInstructionsAtControlFlowLabel(entry, code(target))
        // smali drops an instruction it can't build and only logs it, so count what went in.
        if (target.counted() - before != size) {
            throw IllegalStateException("the check in ${method.definingClass}->${method.name} didn't compile whole")
        }
    }

    /** The same edit on a copy, so a smali or register problem shows before the app is touched. */
    fun rehearse(): String? = try {
        apply { MutableMethod(ImmutableMethod.of(it)) }
        null
    } catch (failed: Exception) {
        "the check in ${method.definingClass}->${method.name} doesn't compile (${failed.javaClass.simpleName}: ${failed.message})"
    }
}

/** Instructions without the alignment nops dexlib2 adds or drops before a payload. */
private fun Method.counted(): Int = implementation?.instructions?.count { it.opcode != Opcode.NOP } ?: 0

/**
 * The request gate and both screens' checks, found and rehearsed before anything is edited, or
 * [missing], why this build can't block new chats. It's all or nothing: a block that stops the
 * join but opens the chat, or the other way round, isn't one a parent can count on.
 */
internal class NewChatsBlockPlan(private val gate: SendRequestGate?, val sites: List<NewChatOpenSite>, val missing: String?) {
    fun apply() {
        if (missing != null) return
        gate!!.apply(NEW_CHATS_BLOCK_DROP)
        sites.forEach { it.apply() }
    }
}

/** The runtime the gate and the checks call. It's the extension's own, so a change there refuses the patch. */
internal fun BytecodePatchContext.requireNewChatsBlockRuntime() {
    requireStatusMethod("blockNewChats")
    controlHook(NEW_CHATS_BLOCK, "drop", listOf("Ljava/lang/Object;", "Ljava/lang/Object;"), "Z")
    controlHook(NEW_CHATS_BLOCK, "refuseOpen", emptyList(), "Z")
}

/**
 * Joining goes out as a request, by a channel's page (joinChannel), an invite link (checkChatInvite
 * then importChatInvite) or a shared folder (checkChatlistInvite, joinChatlistInvite and
 * joinChatlistUpdates), and every request leaves through ConnectionsManager's one send, where the
 * gate drops those. A channel or supergroup you aren't in opens in the chat screen, which sets up
 * the watch Telegram keeps on it for a visitor, or in the topic list when it's a forum. The chat
 * screen's check goes in front of that setup, the topic list's at its start, and either returns
 * false from onFragmentCreate, so the screen never opens. Anything else and the switch is left out.
 */
internal fun BytecodePatchContext.resolveNewChatsBlock(): NewChatsBlockPlan {
    fun missing(why: String) = NewChatsBlockPlan(null, emptyList(), why)

    val gate = resolveSendRequestGate(NEW_CHATS_BLOCK_DROP)
    gate.missing?.let { return missing(it) }
    val sites = try {
        requireChatChecks()
        val chat = chatScreenSite()
        listOf(chat, topicsScreenSite(chat.method.definingClass))
    } catch (unfit: ChatsUnfit) {
        return missing(unfit.why)
    }
    sites.firstNotNullOfOrNull { it.rehearse() }?.let { return missing(it) }
    return NewChatsBlockPlan(gate, sites, null)
}

/** Why this build's screens can't take the checks. */
private class ChatsUnfit(val why: String) : Exception(why)

private fun chatsFit(ok: Boolean, why: String) {
    if (!ok) throw ChatsUnfit(why)
}

private fun BytecodePatchContext.requireChatChecks() {
    val chats = classDefByOrNull(CHAT_OBJECT)
    chatsFit(chats != null && AccessFlags.PUBLIC.isSet(chats.accessFlags) && listOf(IS_NOT_IN_CHAT, IS_MONO_FORUM).all { wanted ->
        chats.methods.any { it.toString() == wanted && AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) }
    }, "ChatObject no longer tells a chat you aren't in or a channel's direct messages apart")
}

private fun Method.isFragmentCreate() = name == FRAGMENT_CREATE && parameterTypes.isEmpty() && returnType == "Z" &&
    !AccessFlags.STATIC.isSet(accessFlags) && implementation != null

private fun Instruction.poll(): List<String>? = call()?.takeIf { it.definingClass == MESSAGES_CONTROLLER &&
    it.name == START_SHORT_POLL && it.returnType == "V" }?.parameterTypes?.map(CharSequence::toString)

/** The watch Telegram keeps on a chat you aren't in, which also hears back when it changes. */
private fun Instruction.isVisitorPoll() = poll()?.let { it.size == 4 && it.take(3) == listOf(TL_CHAT, "I", "Z") } == true

/** The watch on a chat you're in. */
private fun Instruction.isPlainPoll() = poll() == listOf(TL_CHAT, "I", "Z")

private fun flowOf(method: Method, what: String): ControlFlow = try {
    ControlFlow.of(method)
} catch (failed: IllegalArgumentException) {
    throw ChatsUnfit("$what can't be read (${failed.message})")
}

/**
 * The chat screen's onFragmentCreate asks once whether you're in a channel. A visitor's way starts
 * after Telegram's own exceptions (a thread, a channel's direct messages and the like), which each
 * branch to where a member goes, and runs straight to the visitor's watch. The check goes where
 * that straight run starts, so only a channel or supergroup you aren't in reaches it.
 */
private fun BytecodePatchContext.chatScreenSite(): NewChatOpenSite {
    val found = mutableListOf<Method>()
    forEachClassMentioning(Mention.reference(IS_NOT_IN_CHAT) and Mention.member(MESSAGES_CONTROLLER, START_SHORT_POLL)) { classDef ->
        if (classDef.type.startsWith(EXTENSION_TYPES)) return@forEachClassMentioning
        classDef.methods.filterTo(found) { method -> method.isFragmentCreate() && method.controlBody().let { body ->
            body.any { it.controlRef() == IS_NOT_IN_CHAT } && body.any { it.isVisitorPoll() }
        } }
    }
    chatsFit(found.size == 1, "${found.size} chat screens watch a channel you aren't in, not one")
    val method = mutableClassDefBy(found.single().definingClass).methods.single { it.isFragmentCreate() }
    val body = method.controlBody()
    val checks = body.indices.filter { body[it].controlRef() == IS_NOT_IN_CHAT }
    chatsFit(checks.size == 1, "the chat screen asks ${checks.size} times whether you're in the chat, not once")
    val check = checks.single()
    val answer = body.getOrNull(check + 1)
    val test = body.getOrNull(check + 2)
    chatsFit(answer != null && test != null && answer.opcode == Opcode.MOVE_RESULT && test.opcode == Opcode.IF_EQZ &&
        test.namedRegisters() == answer.namedRegisters(),
        "the chat screen no longer branches on whether you're in the chat")
    val flow = flowOf(method, "the chat screen")
    val member = flow.normal[check + 2].singleOrNull { it != check + 3 }
        ?: throw ChatsUnfit("the chat screen no longer branches on whether you're in the chat")
    // Only the watch between the test and a member's way counts: Play's build also watches a
    // channel's linked discussion group the visitor's way, much later in the method.
    val polls = (check + 3 until member).filter { body[it].isVisitorPoll() }
    chatsFit(polls.size == 1, "the chat screen watches a chat you aren't in ${polls.size} times on its way there, not once")
    val poll = polls.single()
    var entry = check + 3
    for (at in check + 3 until poll) {
        val next = flow.normal[at]
        chatsFit(next.isNotEmpty() && next.all { it == at + 1 || it == member },
            "the chat screen's way to a chat you aren't in goes somewhere a member's doesn't")
        if (member in next) entry = at + 1
    }
    chatsFit(flow.normal.indices.none { it != entry - 1 && entry in flow.normal[it] } && flow.exceptional.none { entry in it },
        "something else jumps to where the chat screen sets up a chat you aren't in")
    // A member's way watches the chat the plain way, so the branch is still the one it was.
    val straight = (member until body.size).firstOrNull { flow.normal[it] != listOf(it + 1) } ?: (body.size - 1)
    chatsFit((member..straight).any { body[it].isPlainPoll() }, "a member's way through the chat screen no longer watches the chat")
    return NewChatOpenSite(method, entry, CHAT_OPEN_CHECK_SIZE) { chatOpenCheck(it.freeLocalsAt(PATCH, entry, 1, highest = 255).single()) }
}

/**
 * The topic list's onFragmentCreate, the screen a forum opens in: it loads its group's full info
 * by the id it keeps, then registers for topics and the rest. The check goes at its start, before
 * any of that, and reads the group by the same id through the fragment's own MessagesController.
 */
private fun BytecodePatchContext.topicsScreenSite(chatScreen: String): NewChatOpenSite {
    val found = mutableListOf<Method>()
    val query = Mention.reference(TOPICS_LOADED) and Mention.reference(LOAD_FULL_CHAT) and Mention.member(MESSAGES_CONTROLLER, START_SHORT_POLL)
    forEachClassMentioning(query) { classDef ->
        if (classDef.type == chatScreen || classDef.type.startsWith(EXTENSION_TYPES)) return@forEachClassMentioning
        classDef.methods.filterTo(found) { method -> method.isFragmentCreate() && method.controlBody().let { body ->
            body.any { it.opcode == Opcode.SGET && it.controlRef() == TOPICS_LOADED } &&
                body.any { it.controlRef() == LOAD_FULL_CHAT } && body.any { it.isPlainPoll() }
        } }
    }
    chatsFit(found.size == 1, "${found.size} topic lists load a forum by its id, not one")
    val method = mutableClassDefBy(found.single().definingClass).methods.single { it.isFragmentCreate() }
    val body = method.controlBody()
    // The check writes v0 to v3 and reads this, the last register; nothing is live at the start.
    chatsFit(method.localRegisterCount() >= 4, "the topic list has no room for its check")
    val self = method.implementation!!.registerCount - 1
    val load = body.indexOfFirst { it.controlRef() == LOAD_FULL_CHAT }
    val id = body[load].namedRegisters().getOrNull(1) ?: throw ChatsUnfit("the topic list no longer loads its forum by id")
    val read = (0 until load).lastOrNull { body[it].opcode == Opcode.IGET_WIDE }
    val field = read?.let { (body[it] as ReferenceInstruction).reference as? FieldReference }
    chatsFit(read != null && field != null && body[read].namedRegisters() == listOf(id, self) &&
        field.definingClass == method.definingClass && field.type == "J" &&
        (read + 1 until load).none { body[it].namedRegisters().firstOrNull().let { written -> written == id || written == id + 1 } },
        "the topic list no longer loads its forum by the id it keeps")
    chatsFit(body.any { it.controlRef() == GET_CHAT_BY_ID }, "the topic list no longer reads its forum by id")
    val controller = body.firstOrNull { instruction -> instruction.opcode == Opcode.INVOKE_VIRTUAL &&
        instruction.namedRegisters() == listOf(self) && instruction.call()?.let {
            it.name == "getMessagesController" && it.parameterTypes.isEmpty() && it.returnType == MESSAGES_CONTROLLER
        } == true }?.controlRef() ?: throw ChatsUnfit("the topic list no longer reaches its MessagesController")
    val flow = flowOf(method, "the topic list")
    chatsFit(flow.normal.none { 0 in it } && flow.exceptional.none { 0 in it }, "something jumps back to the start of the topic list")
    val chatId = field!!.toString()
    return NewChatOpenSite(method, 0, TOPICS_OPEN_CHECK_SIZE) { topicsOpenCheck(controller, chatId) }
}
