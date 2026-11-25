/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.ids

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.SendRequestGate
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.requireThisIntact
import app.morphe.patches.telegram.misc.extension.resolveSendRequestGate
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import app.morphe.util.names.addInstructions
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origType
import app.morphe.util.names.replaceInstruction
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy
import app.morphe.util.names.tgMutableClassDefByOrNull
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

internal const val LOCAL_NAMES = "$EXTENSION_PACKAGE/misc/LocalNames;"
internal const val LN_STORAGE = "Lorg/telegram/messenger/MessagesStorage;"
internal const val LN_CHAT = "Lorg/telegram/tgnet/TLRPC\$Chat;"
internal const val LN_PUT_CHAT_PARAMETERS = "${LN_CHAT}Z"
internal const val LN_USER_HOOK = "$LOCAL_NAMES->user(Ljava/lang/Object;Ljava/lang/Object;)V"
internal const val LN_CHAT_HOOK = "$LOCAL_NAMES->chat(Ljava/lang/Object;Ljava/lang/Object;)V"
internal const val LN_UPDATES_HOOK = "$LOCAL_NAMES->updates(Ljava/lang/Object;Ljava/lang/Object;)V"
internal const val LN_STORED_USER = "$LOCAL_NAMES->storedUser(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"
internal const val LN_STORED_CHAT = "$LOCAL_NAMES->storedChat(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"
internal const val LN_OUTGOING = "$LOCAL_NAMES->outgoing(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z"
internal const val LN_MENTION_HOOK = "$LOCAL_NAMES->mentionName(Ljava/lang/Object;I)Ljava/lang/String;"
internal const val LN_PHONE_BOOK_HOOK = "$LOCAL_NAMES->phoneBookUser(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"
internal const val LN_FIRST_NAME = "Lorg/telegram/messenger/UserObject;->getFirstName(Lorg/telegram/tgnet/TLRPC\$User;Z)Ljava/lang/String;"
internal const val LN_CONTACTS = "Lorg/telegram/messenger/ContactsController;"
internal const val LN_USERS_STATEMENT = "REPLACE INTO users VALUES("
internal const val LN_CHATS_STATEMENT = "REPLACE INTO chats VALUES("
private const val LN_LIST_GET = "Ljava/util/List;->get(I)Ljava/lang/Object;"
private const val LN_SPANNABLE = "Landroid/text/SpannableString;"
private const val LN_SET_SPAN = "$LN_SPANNABLE->setSpan(Ljava/lang/Object;III)V"
private const val LN_USER_ID = "Lorg/telegram/tgnet/TLRPC\$User;->id:J"
/** How far past the first name call a mention's span, keyed by the user's id, goes over the name. */
private const val LN_MENTION_REACH = 32
private const val OBJECT = "Ljava/lang/Object;"

/**
 * Where one of MessagesStorage's writers takes a user or chat off its list: the item's cast at
 * [cast] into [register]. The hook goes right after it and may hand back a copy to write instead.
 */
internal class StoredSite(val method: MutableMethod, val cast: Int, val register: Int, val type: String, val hook: String) {
    fun code() = """
        invoke-static {p0, v$register}, $hook
        move-result-object v$register
        check-cast v$register, $type
    """

    fun apply() {
        method.addInstructions(cast + 1, code())
    }
}

/**
 * Where a mention goes into the message being typed: Telegram's first name call at [at], whose
 * answer becomes the mention's text. The hook takes the call's place with the same registers, so
 * nothing around it moves.
 */
internal class MentionSite(val method: MutableMethod, val at: Int) {
    fun apply() {
        val call = method.controlBody()[at]
        val registers = call.namedRegisters()
        method.replaceInstruction(at, if (call.opcode == Opcode.INVOKE_STATIC_RANGE) {
            "invoke-static/range {v${registers.first()} .. v${registers.last()}}, $LN_MENTION_HOOK"
        } else {
            "invoke-static {${registers.joinToString { "v$it" }}}, $LN_MENTION_HOOK"
        })
    }
}

/** Every place Rename on this phone (#104) goes in, found before anything changes. */
internal class LocalNamesHook(
    val putUser: MutableMethod,
    val putChat: MutableMethod,
    val updates: MutableMethod,
    val phoneBook: MutableMethod,
    val stored: List<StoredSite>,
    val mentions: List<MentionSite>,
    val gate: SendRequestGate,
) {
    /** The host methods this changes. */
    val methods get() = (listOf(putUser, putChat, updates, phoneBook) + stored.map { it.method } + mentions.map { it.method } +
        listOfNotNull(gate.method)).distinct()

    /** Goes in before Special contacts, whose hooks then go in front, so it still reads the server's names. */
    fun applyTo() {
        // putUser(user, fromCache, force) and putChat(chat, fromCache): the controller and the peer.
        putUser.addInstructions(0, "invoke-static/range {p0 .. p1}, $LN_USER_HOOK")
        putChat.addInstructions(0, "invoke-static/range {p0 .. p1}, $LN_CHAT_HOOK")
        // processUpdateArray(updates, users, chats, fromGetDifference, date): the controller and the updates.
        updates.addInstructions(0, "invoke-static/range {p0 .. p1}, $LN_UPDATES_HOOK")
        // applyContactToPhoneBook(operations, user): the phone's contacts get the user the hook hands back.
        phoneBook.addInstructions(0, """
            invoke-static/range {p0 .. p2}, $LN_PHONE_BOOK_HOOK
            move-result-object p2
            check-cast p2, $DC_USER
        """)
        stored.forEach { it.apply() }
        mentions.forEach { it.apply() }
        gate.apply(LN_OUTGOING)
    }
}

private class NoLocalNames(why: String) : Exception(why)

private fun namesNeeded(ok: Boolean, why: String) {
    if (!ok) throw NoLocalNames(why)
}

/**
 * Rename on this phone puts a name on Telegram's own user and chat objects where MessagesController
 * stores them (putUser, putChat), keeps a new server name from an update (processUpdateArray), hands
 * MessagesStorage's two writers and ContactsController's phone contacts writer a copy with the
 * server's name, makes a mention typed into a message of the server's name, and gives a request
 * that carries a name the server's back at ConnectionsManager's one send. A build where any of
 * those, the account field or the hooks can't be found keeps the rest of the patch.
 *
 * @return the hook, and null; or null and why there's none
 */
internal fun BytecodePatchContext.resolveLocalNames(): Pair<LocalNamesHook?, String?> = try {
    Pair(localNamesHook(), null)
} catch (missing: NoLocalNames) {
    Pair(null, missing.message)
} catch (missing: PatchException) {
    Pair(null, missing.message)
}

private fun BytecodePatchContext.localNamesHook(): LocalNamesHook {
    requireStatusMethod("localNames")
    controlHook(LOCAL_NAMES, "user", listOf(OBJECT, OBJECT), "V")
    controlHook(LOCAL_NAMES, "chat", listOf(OBJECT, OBJECT), "V")
    controlHook(LOCAL_NAMES, "updates", listOf(OBJECT, OBJECT), "V")
    controlHook(LOCAL_NAMES, "storedUser", listOf(OBJECT, OBJECT), OBJECT)
    controlHook(LOCAL_NAMES, "storedChat", listOf(OBJECT, OBJECT), OBJECT)
    controlHook(LOCAL_NAMES, "outgoing", listOf(OBJECT, OBJECT, OBJECT), "Z")
    controlHook(LOCAL_NAMES, "mentionName", listOf(OBJECT, "I"), "Ljava/lang/String;")
    controlHook(LOCAL_NAMES, "phoneBookUser", listOf(OBJECT, OBJECT, OBJECT), OBJECT)
    val base = tgClassDefByOrNull(SC_BASE)
    namesNeeded(base != null && base.fields.any { it.origName == "currentAccount" && it.type == "I" && !AccessFlags.STATIC.isSet(it.accessFlags) },
        "$SC_BASE->currentAccount is no longer the account a controller serves")
    val controller = tgMutableClassDefByOrNull(SC_CONTROLLER)
    namesNeeded(controller != null, "MessagesController is missing")
    fun one(name: String, parameters: String, result: String) = controller!!.methods.filter {
        it.origName == name && it.origParameterTypes.joinToString("") == parameters && it.origReturnType == result &&
            !AccessFlags.STATIC.isSet(it.accessFlags) && it.implementation != null
    }.let { found ->
        namesNeeded(found.size == 1, "MessagesController.$name is missing or ambiguous")
        found.single()
    }
    val putUser = one("putUser", SC_PUT_USER_PARAMETERS, "Z")
    val putChat = one("putChat", LN_PUT_CHAT_PARAMETERS, "V")
    val updates = one("processUpdateArray", SC_UPDATES_PARAMETERS, "Z")
    for (method in listOf(putUser, putChat, updates)) {
        val flow = ControlFlow.of(method)
        namesNeeded(flow.normal.none { 0 in it } && flow.exceptional.none { 0 in it },
            "something jumps back to the start of MessagesController.${method.origName}")
        method.requireThisIntact("Rename on this phone", listOf(0))
    }
    val stored = listOf(storedSite("putUsersInternal", LN_USERS_STATEMENT, DC_USER, LN_STORED_USER),
        storedSite("putChatsInternal", LN_CHATS_STATEMENT, LN_CHAT, LN_STORED_CHAT))
    val phoneBook = phoneBookWriter()
    val mentions = mentionSites()
    val gate = resolveSendRequestGate(LN_OUTGOING)
    gate.missing?.let { throw NoLocalNames(it) }
    return LocalNamesHook(putUser, putChat, updates, phoneBook, stored, mentions, gate)
}

/**
 * ContactsController.applyContactToPhoneBook(operations, user), which writes a Telegram contact
 * into the phone's contacts. Contact sync reads those back into Telegram's own copy of the phone's
 * contacts, so a given name written there would come back as one the phone holds.
 */
private fun BytecodePatchContext.phoneBookWriter(): MutableMethod {
    val contacts = tgMutableClassDefByOrNull(LN_CONTACTS)
    namesNeeded(contacts != null, "ContactsController is missing")
    val method = contacts!!.methods.filter {
        it.origName == "applyContactToPhoneBook" && it.origParameterTypes == listOf("Ljava/util/ArrayList;", DC_USER) &&
            it.origReturnType == "V" && !AccessFlags.STATIC.isSet(it.accessFlags) && it.implementation != null
    }.let { found ->
        namesNeeded(found.size == 1, "ContactsController.applyContactToPhoneBook is missing or ambiguous")
        found.single()
    }
    // The hook's answer goes back into the user's own register, which move-result-object reaches up to v255.
    namesNeeded(method.implementation!!.registerCount <= 256, "ContactsController.applyContactToPhoneBook keeps its user past v255")
    val flow = ControlFlow.of(method)
    namesNeeded(flow.normal.none { 0 in it } && flow.exceptional.none { 0 in it },
        "something jumps back to the start of ContactsController.applyContactToPhoneBook")
    method.requireThisIntact("Rename on this phone", listOf(0))
    return method
}

/**
 * Every place a mention of a person goes into the message being typed (picked from the @ list, or
 * from a long press on their picture): Telegram's first name call whose answer becomes the
 * mention's text. That text goes out to everyone in the chat, so it must never be a given name.
 */
private fun BytecodePatchContext.mentionSites(): List<MentionSite> {
    val sites = mutableListOf<MentionSite>()
    forEachClassMentioning(Mention.reference(LN_FIRST_NAME) and Mention.type(LN_SPANNABLE)) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/") || cls.methods.none { mentionNameCalls(it.controlBody()).isNotEmpty() }) {
            return@forEachClassMentioning
        }
        for (method in tgMutableClassDefBy(cls.type).methods) {
            for (at in mentionNameCalls(method.controlBody())) sites += MentionSite(method, at)
        }
    }
    namesNeeded(sites.isNotEmpty(), "no mention of a person in the message being typed takes its name from UserObject.getFirstName")
    return sites
}

/**
 * In [body], each first name call a mention is made from: its answer becomes a SpannableString
 * right away, and a span keyed by the user's id goes over it.
 */
private fun mentionNameCalls(body: List<Instruction>): List<Int> = body.indices.filter { at ->
    body[at].controlRef() == LN_FIRST_NAME && body.getOrNull(at + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT &&
        body.getOrNull(at + 2)?.let { it.opcode == Opcode.NEW_INSTANCE && it.controlRef() == LN_SPANNABLE } == true &&
        body.subList(at + 3, minOf(body.size, at + LN_MENTION_REACH)).let { next ->
            next.any { it.controlRef() == LN_USER_ID } && next.any { it.controlRef() == LN_SET_SPAN }
        }
}

/**
 * MessagesStorage's writer [name], which runs [statement] for each [type] on its list: the one cast
 * that takes an item off the list, where nothing else jumps to the instruction after it and both
 * `this` and the item still sit in registers a plain call reaches.
 */
private fun BytecodePatchContext.storedSite(name: String, statement: String, type: String, hook: String): StoredSite {
    val storage = tgMutableClassDefByOrNull(LN_STORAGE)
    namesNeeded(storage != null, "MessagesStorage is missing")
    val method = storage!!.methods.filter {
        it.origName == name && it.origParameterTypes == listOf("Ljava/util/List;") && it.origReturnType == "V" &&
            !AccessFlags.STATIC.isSet(it.accessFlags) && it.implementation != null
    }.let { found ->
        namesNeeded(found.size == 1, "MessagesStorage.$name is missing or ambiguous")
        found.single()
    }
    val body = method.controlBody()
    namesNeeded(body.any { it.controlString()?.startsWith(statement) == true }, "MessagesStorage.$name no longer runs $statement")
    val casts = body.indices.filter { body[it].opcode == Opcode.CHECK_CAST && body[it].controlRef() == type }
    namesNeeded(casts.size == 1, "MessagesStorage.$name casts to $type ${casts.size} times, not once")
    val cast = casts.single()
    val register = (body[cast] as OneRegisterInstruction).registerA
    namesNeeded(cast >= 2 && body[cast - 1].opcode == Opcode.MOVE_RESULT_OBJECT && (body[cast - 1] as OneRegisterInstruction).registerA == register &&
        body[cast - 2].controlRef() == LN_LIST_GET, "MessagesStorage.$name no longer casts each item as it takes it off the list")
    val self = method.implementation!!.registerCount - 2
    namesNeeded(self <= 15 && register <= 15, "MessagesStorage.$name keeps its list item or itself past v15")
    val next = cast + 1
    val flow = ControlFlow.of(method)
    namesNeeded(next < body.size && flow.normal.withIndex().none { (at, to) -> at != cast && next in to } && flow.exceptional.none { next in it },
        "something jumps into MessagesStorage.$name right after its cast")
    method.requireThisIntact("Rename on this phone", listOf(next))
    return StoredSite(method, cast, register, type, hook)
}
