/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.unifiedpush

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.deleted.CHANNEL_DELETE_MESSAGES
import app.morphe.patches.telegram.misc.deleted.USER_DELETE_MESSAGES
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.liveAcrossInjection
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.extension.requireThisIntact
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.classDefsMentioning
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

internal const val REACTION_ALERTS = "$EXTENSION_PACKAGE/misc/ReactionAlerts;"
internal const val REACTIONS_UPDATE = "Lorg/telegram/tgnet/tl/TL_update\$TL_updateMessageReactions;"
internal const val EDIT_UPDATE = "Lorg/telegram/tgnet/tl/TL_update\$TL_updateEditMessage;"

private const val ANY = "Ljava/lang/Object;"
private const val TEXT = "Ljava/lang/String;"
private const val TG = "Lorg/telegram/messenger/"
private const val TL = "Lorg/telegram/tgnet/TLRPC\$"
private const val PEER = "${TL}Peer;"
private const val MESSAGE = "${TL}Message;"
private const val TG_CHAT = "${TL}Chat;"
private const val TG_USER = "${TL}User;"
private const val MESSAGE_OBJECT = "${TG}MessageObject;"
private const val CONTROLLER = "${TG}MessagesController;"
private const val BASE = "${TG}BaseController;"
private const val STORAGE = "${TG}MessagesStorage;"
private const val QUEUE = "${TG}DispatchQueue;"
private const val DATABASE = "Lorg/telegram/SQLite/SQLiteDatabase;"
private const val CURSOR = "Lorg/telegram/SQLite/SQLiteCursor;"
private const val BUFFER = "Lorg/telegram/tgnet/NativeByteBuffer;"
private const val ACCOUNT = "${TG}AccountInstance;"
private const val CONFIG = "${TG}UserConfig;"
private const val CONNECTION = "Lorg/telegram/tgnet/ConnectionsManager;"
private const val NOTIFIER = "${TG}NotificationsController;"
private const val STRINGS = "${TG}R\$string;"
private const val PATCH = "UnifiedPush notifications"

/** A method the extension calls by name, on the class that declares it. */
private class Call(val owner: String, val name: String, val parameters: String, val result: String, val static: Boolean = false)

private val CALLS = listOf(
    Call(BASE, "getMessagesStorage", "", STORAGE),
    Call(BASE, "getAccountInstance", "", ACCOUNT),
    Call(BASE, "getUserConfig", "", CONFIG),
    Call(BASE, "getConnectionsManager", "", CONNECTION),
    Call(BASE, "getNotificationsController", "", NOTIFIER),
    Call(ACCOUNT, "getCurrentAccount", "", "I"),
    Call(CONFIG, "getClientUserId", "", "J"),
    Call(CONNECTION, "getCurrentTime", "", "I"),
    Call(STORAGE, "getStorageQueue", "", QUEUE),
    Call(STORAGE, "getDatabase", "", DATABASE),
    Call(QUEUE, "postRunnable", "Ljava/lang/Runnable;", "Z"),
    Call(DATABASE, "queryFinalized", "$TEXT[$ANY", CURSOR),
    Call(CURSOR, "next", "", "Z"),
    Call(CURSOR, "intValue", "I", "I"),
    Call(CURSOR, "byteBufferValue", "I", BUFFER),
    Call(CURSOR, "dispose", "", "V"),
    Call(BUFFER, "readInt32", "Z", "I"),
    Call(BUFFER, "reuse", "", "V"),
    Call(MESSAGE, "TLdeserialize", "Lorg/telegram/tgnet/InputSerializedData;IZ", MESSAGE, static = true),
    Call(MESSAGE_OBJECT, "getPeerId", PEER, "J", static = true),
    Call(CONTROLLER, "getUser", "Ljava/lang/Long;", TG_USER),
    Call(CONTROLLER, "getChat", "Ljava/lang/Long;", TG_CHAT),
    Call("${TG}UserObject;", "getUserName", TG_USER, TEXT, static = true),
    Call("${TG}ChatObject;", "isChannel", TG_CHAT, "Z", static = true),
    Call("${TG}LocaleController;", "formatString", "I[$ANY", TEXT, static = true),
    Call(NOTIFIER, "processNewMessages", "Ljava/util/ArrayList;ZZLjava/util/concurrent/CountDownLatch;", "V"),
    Call(MESSAGE_OBJECT, "<init>", "I${MESSAGE}${TEXT}${TEXT}${TEXT}ZZZZ", "V"),
    Call("${TL}TL_message;", "<init>", "", "V"),
    Call("${TL}TL_peerUser;", "<init>", "", "V"),
    Call("${TL}TL_peerChat;", "<init>", "", "V"),
    Call("${TL}TL_peerChannel;", "<init>", "", "V"),
    Call("${TL}TL_messageReplyHeader;", "<init>", "", "V"),
)

/** The fields the extension reads and writes by name, on the class that declares each. */
private val FIELDS = listOf(
    Triple(REACTIONS_UPDATE, "peer", PEER),
    Triple(REACTIONS_UPDATE, "msg_id", "I"),
    Triple(REACTIONS_UPDATE, "top_msg_id", "I"),
    Triple(REACTIONS_UPDATE, "reactions", "${TL}TL_messageReactions;"),
    Triple(EDIT_UPDATE, "message", MESSAGE),
    Triple(MESSAGE, "reactions", "${TL}TL_messageReactions;"),
    Triple("${TL}MessageReactions;", "recent_reactions", "Ljava/util/ArrayList;"),
    Triple("${TL}MessagePeerReaction;", "peer_id", PEER),
    Triple("${TL}MessagePeerReaction;", "reaction", "${TL}Reaction;"),
    Triple("${TL}MessagePeerReaction;", "date", "I"),
    Triple("${TL}MessagePeerReaction;", "unread", "Z"),
    Triple("${TL}MessagePeerReaction;", "flags", "I"),
    Triple("${TL}TL_reactionEmoji;", "emoticon", TEXT),
    Triple("${TL}TL_reactionCustomEmoji;", "document_id", "J"),
    Triple(PEER, "user_id", "J"),
    Triple(PEER, "chat_id", "J"),
    Triple(PEER, "channel_id", "J"),
    Triple(MESSAGE, "id", "I"),
    Triple(MESSAGE, "message", TEXT),
    Triple(MESSAGE, "date", "I"),
    Triple(MESSAGE, "dialog_id", "J"),
    Triple(MESSAGE, "peer_id", PEER),
    Triple(MESSAGE, "from_id", PEER),
    Triple(MESSAGE, "flags", "I"),
    Triple(MESSAGE, "out", "Z"),
    Triple(MESSAGE, "reply_to", "${TL}MessageReplyHeader;"),
    Triple("${TL}MessageReplyHeader;", "forum_topic", "Z"),
    Triple("${TL}MessageReplyHeader;", "reply_to_top_id", "I"),
    Triple(TG_CHAT, "title", TEXT),
    Triple(MESSAGE_OBJECT, "isReactionPush", "Z"),
)

/** Telegram's own reaction lines, the ones its push shows. */
private val LINES = listOf("PushReactText", "PushReactNoText", "PushChatReactText", "PushChatReactNotext")

/** Every type the extension reaches by name, for a test to load. */
internal val REACTION_ALERT_TYPES: Set<String> =
    (CALLS.map { it.owner } + FIELDS.map { it.first } + listOf(STRINGS, CONTROLLER)).toSet()

/** One place the update loop hands an update over: right after it's cast, with two free registers in a row. */
internal class ReactionSite(val type: String, val insertAt: Int, val update: Int, val scratch: Int)

/**
 * Where the update loop hands reactions over: a reactions update, which groups and channels get,
 * and an edited message, which is how a private chat's reactions arrive.
 */
internal class ReactionHook(val updates: MutableMethod, val sites: List<ReactionSite>) {
    fun applyTo(method: MutableMethod) {
        // The later site first, so the earlier one's index still holds.
        for (site in sites.sortedByDescending { it.insertAt }) {
            method.addInstructionsAtControlFlowLabel(
                site.insertAt,
                """
                    move-object/from16 v${site.scratch}, v${site.update}
                    move-object/from16 v${site.scratch + 1}, p0
                    invoke-static/range {v${site.scratch} .. v${site.scratch + 1}}, $REACTION_ALERTS->changed($ANY$ANY)V
                """.trimIndent(),
            )
        }
    }
}

private class NoReactions(why: String) : Exception(why)

private fun needed(ok: Boolean, why: String) {
    if (!ok) throw NoReactions(why)
}

/**
 * Telegram shows a reaction to your message only when a push says so; the same reaction coming in
 * on the open connection is only stored. Groups and channels get a reactions update, and a private
 * chat gets the whole message again as an edit, its reactions included. The update loop casts each
 * to its own type, and a hook goes right after both casts, so the extension sees them before
 * Telegram stores them. A build where either or a name the extension reads can't be found keeps the
 * rest of the patch.
 *
 * @return the hook, and null; or null and why there's none
 */
internal fun BytecodePatchContext.resolveReactionAlerts(): Pair<ReactionHook?, String?> = try {
    Pair(reactionHook(), null)
} catch (missing: NoReactions) {
    Pair(null, missing.message)
} catch (missing: PatchException) {
    Pair(null, missing.message)
}

private fun BytecodePatchContext.reactionHook(): ReactionHook {
    for (call in CALLS) {
        val owner = classDefByOrNull(call.owner)
        needed(owner != null && AccessFlags.PUBLIC.isSet(owner.accessFlags) && owner.methods.any {
            it.name == call.name && it.parameterTypes.joinToString("") == call.parameters && it.returnType == call.result &&
                AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) == call.static
        }, "${call.owner}->${call.name} is no longer a public method reaction notifications can call")
    }
    for ((owner, name, type) in FIELDS) {
        val cls = classDefByOrNull(owner)
        needed(cls != null && AccessFlags.PUBLIC.isSet(cls.accessFlags) && cls.fields.any {
            it.name == name && it.type == type && AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags)
        }, "$owner->$name is no longer a public field reaction notifications can read")
    }
    val strings = classDefByOrNull(STRINGS)
    needed(strings != null && LINES.all { line ->
        strings.fields.any { it.name == line && it.type == "I" && AccessFlags.STATIC.isSet(it.accessFlags) && AccessFlags.PUBLIC.isSet(it.accessFlags) }
    }, "Telegram's reaction notification lines are gone")

    // The update loop: the one method that also collects both kinds of deleted IDs.
    val loops = mutableClassDefByOrNull(CONTROLLER)?.methods?.filter { m ->
        val refs = m.controlBody().mapNotNull { it.controlRef() }.toSet()
        USER_DELETE_MESSAGES in refs && CHANNEL_DELETE_MESSAGES in refs && REACTIONS_UPDATE in refs
    } ?: emptyList()
    needed(loops.size == 1, "the update loop that reads reactions is missing or ambiguous")
    val updates = loops.single()
    needed(!AccessFlags.STATIC.isSet(updates.accessFlags), "the update loop is static")
    val body = updates.controlBody()
    val flow = ControlFlow.of(updates)
    val sites = listOf(REACTIONS_UPDATE to "a reactions update", EDIT_UPDATE to "an edited message").map { (type, what) ->
        val casts = body.indices.filter { body[it].opcode == Opcode.CHECK_CAST && body[it].controlRef() == type }
        needed(casts.size == 1, "the update loop no longer casts $what once")
        val cast = casts.single()
        val insertAt = cast + 1
        needed(insertAt < body.size && flow.normal.indices.none { it != cast && insertAt in flow.normal[it] },
            "something jumps past the cast of $what")
        val live = updates.liveAcrossInjection(insertAt)
        val free = (0 until updates.localRegisterCount()).filter { it !in live }
        val scratch = free.firstOrNull { it + 1 in free && it + 1 <= 255 }
        needed(scratch != null, "the update loop has no two registers in a row free after the cast of $what")
        ReactionSite(type, insertAt, (body[cast] as OneRegisterInstruction).registerA, scratch!!)
    }
    updates.requireThisIntact(PATCH, sites.map { it.insertAt })
    return ReactionHook(updates, sites)
}

private const val DOCUMENT = "${TL}Document;"
private const val DRAWABLE = "Landroid/graphics/drawable/Drawable;"
private const val CACHE_READ = "Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;"
internal const val EMOJI_NAME = "${MESSAGE_OBJECT}->findAnimatedEmojiEmoticon($DOCUMENT$TEXT)$TEXT"

/**
 * Whether [method] of [owner] has the shape of AnimatedEmojiDrawable.findDocument, which R8 renames:
 * public and static on a public Drawable, an account and a document ID in, a Document out, read from
 * a HashMap and cast.
 */
internal fun isEmojiLookup(owner: ClassDef, method: Method): Boolean =
    owner.superclass == DRAWABLE && AccessFlags.PUBLIC.isSet(owner.accessFlags) && method.returnType == DOCUMENT &&
        method.parameterTypes.joinToString("") == "IJ" && AccessFlags.PUBLIC.isSet(method.accessFlags) &&
        AccessFlags.STATIC.isSet(method.accessFlags) && method.controlBody().let { body ->
            body.any { it.controlRef() == CACHE_READ } && body.any { it.opcode == Opcode.CHECK_CAST && it.controlRef() == DOCUMENT }
        }

/**
 * A custom emoji reaction names its emoji by document ID alone. Telegram keeps the custom emoji it
 * has loaded in AnimatedEmojiDrawable, whose findDocument(account, id) is found by its shape, the
 * only one of its kind, and MessageObject.findAnimatedEmojiEmoticon reads the emoji a document
 * stands for. A build where either can't be found keeps reaction notifications without custom emoji.
 *
 * @return the lookup's reference, and null; or null and why there's none
 */
internal fun BytecodePatchContext.resolveEmojiLookup(): Pair<String?, String?> {
    val lookups = classDefsMentioning(Mention.type(DOCUMENT) and Mention.member("Ljava/util/HashMap;", "get")).flatMap { owner ->
        owner.methods.filter { isEmojiLookup(owner, it) }
    }
    if (lookups.size != 1) return Pair(null, "the lookup of loaded custom emoji is missing or ambiguous")
    val name = classDefByOrNull(MESSAGE_OBJECT)?.methods?.any {
        it.toString() == EMOJI_NAME && AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags)
    }
    if (name != true) return Pair(null, "$EMOJI_NAME is no longer a public method custom emoji can call")
    return Pair(lookups.single().toString(), null)
}

/** ReactionAlerts.emojiDocument's body: Telegram's loaded copy of the custom emoji, or null. */
internal fun BytecodePatchContext.writeEmojiLookup(lookup: String) {
    writeStub(REACTION_ALERTS, "emojiDocument", 4, """
        invoke-static {p0, p1, p2}, $lookup
        move-result-object v0
        return-object v0
    """)
}

private const val REACTION_PUSH = "${MESSAGE_OBJECT}->isReactionPush:Z"
internal const val REACTION_QUIET = "$REACTION_ALERTS->quiet(I)Z"

/** Right after Telegram's silent notification check reads whether a notification is for a reaction. */
internal class ReactionSoundHook(val check: MutableMethod, val insertAt: Int, val flag: Int) {
    fun applyTo(method: MutableMethod) {
        method.addInstructions(
            insertAt,
            """
                invoke-static/range {v$flag .. v$flag}, $REACTION_QUIET
                move-result v$flag
            """.trimIndent(),
        )
    }
}

/**
 * Telegram's silent notification check counts every reaction as silent, so a reaction's
 * notification never plays the sound or vibration Telegram's own Notifications and Sounds sets for
 * reactions. The hook goes right after the check reads the reaction flag and lets the extension
 * clear it. It goes there and not at the top, where Silence non-contacts hooks the same method. A
 * build where the read can't be found keeps the rest of the patch.
 *
 * @return the hook, and null; or null and why there's none
 */
internal fun BytecodePatchContext.resolveReactionSound(): Pair<ReactionSoundHook?, String?> = try {
    Pair(reactionSoundHook(), null)
} catch (missing: NoReactions) {
    Pair(null, missing.message)
} catch (missing: PatchException) {
    Pair(null, missing.message)
}

private fun BytecodePatchContext.reactionSoundHook(): ReactionSoundHook {
    val checks = mutableClassDefByOrNull(NOTIFIER)?.methods?.filter {
        it.name == "isSilentMessage" && it.parameterTypes.joinToString("") == MESSAGE_OBJECT && it.returnType == "Z" &&
            !AccessFlags.STATIC.isSet(it.accessFlags)
    } ?: emptyList()
    needed(checks.size == 1, "the silent notification check is missing or ambiguous")
    val check = checks.single()
    val body = check.controlBody()
    val reads = body.indices.filter { body[it].opcode == Opcode.IGET_BOOLEAN && body[it].controlRef() == REACTION_PUSH }
    needed(reads.size == 1, "the silent notification check no longer reads the reaction flag once")
    val read = reads.single()
    val insertAt = read + 1
    val flag = (body[read] as TwoRegisterInstruction).registerA
    val test = body.getOrNull(insertAt)
    needed(test != null && (test.opcode == Opcode.IF_EQZ || test.opcode == Opcode.IF_NEZ) &&
        (test as OneRegisterInstruction).registerA == flag,
        "the silent notification check no longer tests the reaction flag right after reading it")
    val flow = ControlFlow.of(check)
    needed(flow.normal.indices.none { it != read && insertAt in flow.normal[it] },
        "something jumps past the silent notification check's reaction flag read")
    return ReactionSoundHook(check, insertAt, flag)
}
