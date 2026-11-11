/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.autoforward

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.names.addInstructions
import app.morphe.util.numberOfParameterRegisters
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlMembers
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.messagemenu.FORWARD_SEND
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.names.origDescriptor
import app.morphe.util.names.origName
import app.morphe.util.names.tgMutableClassDefByOrNull
import com.android.tools.smali.dexlib2.AccessFlags

private const val PATCH = "Auto-forwarding rules"
private const val NOTIFICATIONS_CONTROLLER = "Lorg/telegram/messenger/NotificationsController;"
private const val PROCESS_NEW_MESSAGES = "(Ljava/util/ArrayList;ZZLjava/util/concurrent/CountDownLatch;)V"

internal const val AUTO_FORWARDING = "$EXTENSION_PACKAGE/misc/AutoForwarding;"
internal const val ON_NEW_MESSAGES = "$AUTO_FORWARDING->onNewMessages(Ljava/lang/Object;I)V"

private const val OBJECT = "Ljava/lang/Object;"
private const val LIST = "Ljava/util/ArrayList;"
private const val STRING = "Ljava/lang/String;"
private const val MESSAGE = "Lorg/telegram/messenger/MessageObject;"
private const val TL_MESSAGE = "Lorg/telegram/tgnet/TLRPC\$Message;"
private const val FWD_HEADER = "Lorg/telegram/tgnet/TLRPC\$MessageFwdHeader;"
private const val PEER = "Lorg/telegram/tgnet/TLRPC\$Peer;"
private const val MEDIA = "Lorg/telegram/tgnet/TLRPC\$MessageMedia;"
private const val PHOTO = "Lorg/telegram/tgnet/TLRPC\$Photo;"
private const val DOCUMENT = "Lorg/telegram/tgnet/TLRPC\$Document;"
private const val MEDIA_POLL = "Lorg/telegram/tgnet/TLRPC\$TL_messageMediaPoll;"
private const val POLL = "Lorg/telegram/tgnet/TLRPC\$Poll;"
private const val GEO = "Lorg/telegram/tgnet/TLRPC\$GeoPoint;"
private const val MEDIA_DICE = "Lorg/telegram/tgnet/TLRPC\$TL_messageMediaDice;"
private const val TL_GAME = "Lorg/telegram/tgnet/TLRPC\$TL_game;"
private const val MEDIA_GIVEAWAY = "Lorg/telegram/tgnet/TLRPC\$TL_messageMediaGiveaway;"
private const val MEDIA_GIVEAWAY_RESULTS = "Lorg/telegram/tgnet/TLRPC\$TL_messageMediaGiveawayResults;"
private const val MEDIA_TODO = "Lorg/telegram/tgnet/TLRPC\$TL_messageMediaToDo;"
private const val TODO_LIST = "Lorg/telegram/tgnet/TLRPC\$TodoList;"
private const val TEXT_WITH_ENTITIES = "Lorg/telegram/tgnet/TLRPC\$TL_textWithEntities;"
private const val TL_CHAT = "Lorg/telegram/tgnet/TLRPC\$Chat;"
private const val CHAT_OBJECT = "Lorg/telegram/messenger/ChatObject;"
private const val TL_USER = "Lorg/telegram/tgnet/TLRPC\$User;"
private const val USER_OBJECT = "Lorg/telegram/messenger/UserObject;"
private const val ACTION = "Lorg/telegram/tgnet/TLRPC\$MessageAction;"
private const val ACTION_EMPTY = "Lorg/telegram/tgnet/TLRPC\$TL_messageActionEmpty;"
private const val TL_DIALOG = "Lorg/telegram/tgnet/TLRPC\$Dialog;"
private const val USER_CONFIG = "Lorg/telegram/messenger/UserConfig;"
private const val CONTROLLER = "Lorg/telegram/messenger/MessagesController;"
private const val DIALOG_OBJECT = "Lorg/telegram/messenger/DialogObject;"
private const val SEND_HELPER = "Lorg/telegram/messenger/SendMessagesHelper;"

@Suppress("unused")
val autoForwardingPatch = bytecodePatch(
    name = PATCH,
    description = "Forwards new messages others send in one chat to another by rules you set, every message or only " +
        "messages with media. A forward from any account you're signed in to is never forwarded again, so rules can't loop, " +
        "and at most 20 go out a minute. Starts off. Turn it on and add rules in HushTelegram settings > Privacy.",
    default = true,
) {
    category("Privacy")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())

    execute {
        val process = resolveAutoForwarding()
        writeAutoForwardingStubs()
        // p1 is the new messages and p3 isFcm, a notification built from a push.
        val p0 = process.implementation!!.registerCount - process.numberOfParameterRegisters
        process.addInstructions(0, """
            move-object/from16 v0, v${p0 + 1}
            move/from16 v1, v${p0 + 3}
            invoke-static {v0, v1}, $ON_NEW_MESSAGES
        """)
        enableStatus("autoForwarding")
    }
}

/**
 * NotificationsController.processNewMessages(messages, isLast, isFcm, latch) gets each batch of
 * new messages, from a push or from the connection, and the stubs reach the members below.
 * Everything is checked before anything changes.
 */
internal fun BytecodePatchContext.resolveAutoForwarding(): MutableMethod {
    requireStatusMethod("autoForwarding")
    controlHook(AUTO_FORWARDING, "onNewMessages", listOf(OBJECT, "I"), "V")
    for (name in listOf("account", "id", "date", "originDate", "diceValue", "storyId", "giveawayEnd", "giveawayCount",
        "giveawayMonths")) {
        controlHook(AUTO_FORWARDING, name, listOf(OBJECT), "I")
    }
    for (name in listOf("out", "forwarded", "service", "media")) controlHook(AUTO_FORWARDING, name, listOf(OBJECT), "Z")
    for (name in listOf("dialog", "dialogId", "sender", "origin", "mediaId", "pollId", "storyPeer", "gameId", "amount",
        "giveawayStars")) {
        controlHook(AUTO_FORWARDING, name, listOf(OBJECT), "J")
    }
    for (name in listOf("latitude", "longitude")) controlHook(AUTO_FORWARDING, name, listOf(OBJECT), "D")
    for (name in listOf("originName", "text", "phone", "emoticon", "checklist", "title", "currency")) {
        controlHook(AUTO_FORWARDING, name, listOf(OBJECT), STRING)
    }
    controlHook(AUTO_FORWARDING, "selectedAccount", emptyList(), "I")
    controlHook(AUTO_FORWARDING, "userId", listOf("I"), "J")
    controlHook(AUTO_FORWARDING, "dialogs", listOf("I", "I"), LIST)
    for (name in listOf("secret", "folder")) controlHook(AUTO_FORWARDING, name, listOf("J"), "Z")
    controlHook(AUTO_FORWARDING, "canPost", listOf("I", "J"), "Z")
    controlHook(AUTO_FORWARDING, "peerName", listOf("I", "J"), STRING)
    controlHook(AUTO_FORWARDING, "forward", listOf("I", LIST, "J"), "I")

    controlMembers(MESSAGE, "currentAccount:I", "messageOwner:$TL_MESSAGE", "getDialogId()J", "getId()I", "isOut()Z",
        "isForwarded()Z", "isMediaEmpty()Z", "getFromChatId()J", "static getPeerId($PEER)J")
    controlMembers(TL_MESSAGE, "action:$ACTION", "fwd_from:$FWD_HEADER", "date:I", "media:$MEDIA", "message:$STRING")
    controlMembers(FWD_HEADER, "from_id:$PEER", "date:I", "from_name:$STRING")
    controlMembers(MEDIA, "photo:$PHOTO", "document:$DOCUMENT", "geo:$GEO", "phone_number:$STRING", "id:I", "peer:$PEER",
        "user_id:J", "game:$TL_GAME", "title:$STRING", "total_amount:J", "currency:$STRING")
    controlMembers(PHOTO, "id:J")
    controlMembers(DOCUMENT, "id:J")
    controlMembers(MEDIA_POLL, "poll:$POLL")
    controlMembers(POLL, "id:J")
    controlMembers(GEO, "lat:D", "_long:D")
    controlMembers(MEDIA_DICE, "emoticon:$STRING", "value:I")
    controlMembers(TL_GAME, "id:J")
    controlMembers(MEDIA_GIVEAWAY, "until_date:I", "quantity:I", "months:I", "stars:J")
    controlMembers(MEDIA_GIVEAWAY_RESULTS, "until_date:I", "winners_count:I", "months:I", "stars:J")
    controlMembers(MEDIA_TODO, "todo:$TODO_LIST")
    controlMembers(TODO_LIST, "title:$TEXT_WITH_ENTITIES")
    controlMembers(TEXT_WITH_ENTITIES, "text:$STRING")
    controlMembers(ACTION_EMPTY)
    controlMembers(USER_CONFIG, "static selectedAccount:I", "static getInstance(I)$USER_CONFIG", "getClientUserId()J")
    controlMembers(CONTROLLER, "static getInstance(I)$CONTROLLER", "getDialogs(I)$LIST", "getPeerName(J)$STRING",
        "getChat(Ljava/lang/Long;)$TL_CHAT", "getUser(Ljava/lang/Long;)$TL_USER")
    controlMembers(TL_DIALOG, "id:J")
    controlMembers(DIALOG_OBJECT, "static isEncryptedDialog(J)Z", "static isFolderDialogId(J)Z")
    controlMembers(CHAT_OBJECT, "static isNotInChat($TL_CHAT)Z", "static isMonoForum($TL_CHAT)Z", "static canSendMessages($TL_CHAT)Z")
    controlMembers(USER_OBJECT, "static isReplyUser(J)Z", "static isService(J)Z", "static isDeleted($TL_USER)Z")
    controlMembers(SEND_HELPER, "static getInstance(I)$SEND_HELPER", FORWARD_SEND.substringAfter("->"))

    val owner = tgMutableClassDefByOrNull(NOTIFICATIONS_CONTROLLER)
    controlShape(owner != null, "NotificationsController is missing")
    val process = owner!!.methods.filter { it.origName == "processNewMessages" && it.origDescriptor == PROCESS_NEW_MESSAGES &&
        !AccessFlags.STATIC.isSet(it.accessFlags) }.controlSingle("processNewMessages")
    controlShape(process.implementation != null &&
        process.implementation!!.registerCount - process.numberOfParameterRegisters >= 2,
        "processNewMessages has no room for the hook")
    return process
}

/** The stubs' bodies. */
internal fun BytecodePatchContext.writeAutoForwardingStubs() {
    writeStub(AUTO_FORWARDING, "account", 2, "check-cast p0, $MESSAGE\niget v0, p0, $MESSAGE->currentAccount:I\nreturn v0")
    writeStub(AUTO_FORWARDING, "dialog", 3, """
        check-cast p0, $MESSAGE
        invoke-virtual {p0}, $MESSAGE->getDialogId()J
        move-result-wide v0
        return-wide v0
    """)
    for ((name, call) in listOf("id" to "getId()I", "out" to "isOut()Z", "forwarded" to "isForwarded()Z")) {
        writeStub(AUTO_FORWARDING, name, 2, """
            check-cast p0, $MESSAGE
            invoke-virtual {p0}, $MESSAGE->$call
            move-result v0
            return v0
        """)
    }
    writeStub(AUTO_FORWARDING, "sender", 3, """
        check-cast p0, $MESSAGE
        invoke-virtual {p0}, $MESSAGE->getFromChatId()J
        move-result-wide v0
        return-wide v0
    """)
    writeStub(AUTO_FORWARDING, "origin", 4, """
        check-cast p0, $MESSAGE
        iget-object v0, p0, $MESSAGE->messageOwner:$TL_MESSAGE
        if-eqz v0, :hush_none
        iget-object v0, v0, $TL_MESSAGE->fwd_from:$FWD_HEADER
        if-eqz v0, :hush_none
        iget-object v0, v0, $FWD_HEADER->from_id:$PEER
        if-eqz v0, :hush_none
        invoke-static {v0}, $MESSAGE->getPeerId($PEER)J
        move-result-wide v1
        return-wide v1
        :hush_none
        const-wide/16 v1, 0x0
        return-wide v1
    """)
    // When the message was sent, and when the one a forward copies was first sent: a forward keeps
    // that date, so it and the header's author name the original through every copy.
    writeStub(AUTO_FORWARDING, "date", 2, """
        check-cast p0, $MESSAGE
        iget-object v0, p0, $MESSAGE->messageOwner:$TL_MESSAGE
        if-eqz v0, :hush_none
        iget v0, v0, $TL_MESSAGE->date:I
        return v0
        :hush_none
        const/4 v0, 0x0
        return v0
    """)
    writeStub(AUTO_FORWARDING, "originDate", 2, """
        check-cast p0, $MESSAGE
        iget-object v0, p0, $MESSAGE->messageOwner:$TL_MESSAGE
        if-eqz v0, :hush_none
        iget-object v0, v0, $TL_MESSAGE->fwd_from:$FWD_HEADER
        if-eqz v0, :hush_none
        iget v0, v0, $FWD_HEADER->date:I
        return v0
        :hush_none
        const/4 v0, 0x0
        return v0
    """)
    // An author who hides their account leaves only the name they go by in the header.
    writeStub(AUTO_FORWARDING, "originName", 2, """
        check-cast p0, $MESSAGE
        iget-object v0, p0, $MESSAGE->messageOwner:$TL_MESSAGE
        if-eqz v0, :hush_none
        iget-object v0, v0, $TL_MESSAGE->fwd_from:$FWD_HEADER
        if-eqz v0, :hush_none
        iget-object v0, v0, $FWD_HEADER->from_name:$STRING
        return-object v0
        :hush_none
        const/4 v0, 0x0
        return-object v0
    """)
    // A forward keeps the text, so a copy of a text message is known by it.
    writeStub(AUTO_FORWARDING, "text", 2, """
        check-cast p0, $MESSAGE
        iget-object v0, p0, $MESSAGE->messageOwner:$TL_MESSAGE
        if-eqz v0, :hush_none
        iget-object v0, v0, $TL_MESSAGE->message:$STRING
        return-object v0
        :hush_none
        const/4 v0, 0x0
        return-object v0
    """)
    // The photo or file keeps its id through every copy, which tells an album's parts apart.
    writeStub(AUTO_FORWARDING, "mediaId", 4, """
        check-cast p0, $MESSAGE
        iget-object v0, p0, $MESSAGE->messageOwner:$TL_MESSAGE
        if-eqz v0, :hush_none
        iget-object v0, v0, $TL_MESSAGE->media:$MEDIA
        if-eqz v0, :hush_none
        iget-object v2, v0, $MEDIA->photo:$PHOTO
        if-eqz v2, :hush_document
        iget-wide v0, v2, $PHOTO->id:J
        return-wide v0
        :hush_document
        iget-object v2, v0, $MEDIA->document:$DOCUMENT
        if-eqz v2, :hush_none
        iget-wide v0, v2, $DOCUMENT->id:J
        return-wide v0
        :hush_none
        const-wide/16 v0, 0x0
        return-wide v0
    """)
    // Without a photo, a file or text, a forward still keeps the poll, place, contact or dice roll,
    // which tells two of them from one author's same second apart.
    writeStub(AUTO_FORWARDING, "pollId", 4, """
        check-cast p0, $MESSAGE
        iget-object v2, p0, $MESSAGE->messageOwner:$TL_MESSAGE
        if-eqz v2, :hush_none
        iget-object v2, v2, $TL_MESSAGE->media:$MEDIA
        instance-of v0, v2, $MEDIA_POLL
        if-eqz v0, :hush_none
        check-cast v2, $MEDIA_POLL
        iget-object v2, v2, $MEDIA_POLL->poll:$POLL
        if-eqz v2, :hush_none
        iget-wide v0, v2, $POLL->id:J
        return-wide v0
        :hush_none
        const-wide/16 v0, 0x0
        return-wide v0
    """)
    for ((name, field) in listOf("latitude" to "lat", "longitude" to "_long")) {
        writeStub(AUTO_FORWARDING, name, 4, """
            check-cast p0, $MESSAGE
            iget-object v2, p0, $MESSAGE->messageOwner:$TL_MESSAGE
            if-eqz v2, :hush_none
            iget-object v2, v2, $TL_MESSAGE->media:$MEDIA
            if-eqz v2, :hush_none
            iget-object v2, v2, $MEDIA->geo:$GEO
            if-eqz v2, :hush_none
            iget-wide v0, v2, $GEO->$field:D
            return-wide v0
            :hush_none
            const-wide/16 v0, 0x0
            return-wide v0
        """)
    }
    // Of what reaches the server, only a venue and an invoice fill the shared title, and only an invoice its currency.
    for ((name, field) in listOf("phone" to "phone_number", "title" to "title", "currency" to "currency")) {
        writeStub(AUTO_FORWARDING, name, 2, """
            check-cast p0, $MESSAGE
            iget-object v0, p0, $MESSAGE->messageOwner:$TL_MESSAGE
            if-eqz v0, :hush_none
            iget-object v0, v0, $TL_MESSAGE->media:$MEDIA
            if-eqz v0, :hush_none
            iget-object v0, v0, $MEDIA->$field:$STRING
            return-object v0
            :hush_none
            const/4 v0, 0x0
            return-object v0
        """)
    }
    writeStub(AUTO_FORWARDING, "emoticon", 3, """
        check-cast p0, $MESSAGE
        iget-object v0, p0, $MESSAGE->messageOwner:$TL_MESSAGE
        if-eqz v0, :hush_none
        iget-object v0, v0, $TL_MESSAGE->media:$MEDIA
        instance-of v1, v0, $MEDIA_DICE
        if-eqz v1, :hush_none
        check-cast v0, $MEDIA_DICE
        iget-object v0, v0, $MEDIA_DICE->emoticon:$STRING
        return-object v0
        :hush_none
        const/4 v0, 0x0
        return-object v0
    """)
    writeStub(AUTO_FORWARDING, "diceValue", 3, """
        check-cast p0, $MESSAGE
        iget-object v0, p0, $MESSAGE->messageOwner:$TL_MESSAGE
        if-eqz v0, :hush_none
        iget-object v0, v0, $TL_MESSAGE->media:$MEDIA
        instance-of v1, v0, $MEDIA_DICE
        if-eqz v1, :hush_none
        check-cast v0, $MEDIA_DICE
        iget v0, v0, $MEDIA_DICE->value:I
        return v0
        :hush_none
        const/4 v0, 0x0
        return v0
    """)
    // Only a story fills the shared id. Its older layer isn't a TL_messageMediaStory and names the
    // owner by user_id instead of peer, so neither is tested by class.
    writeStub(AUTO_FORWARDING, "storyId", 2, """
        check-cast p0, $MESSAGE
        iget-object v0, p0, $MESSAGE->messageOwner:$TL_MESSAGE
        if-eqz v0, :hush_none
        iget-object v0, v0, $TL_MESSAGE->media:$MEDIA
        if-eqz v0, :hush_none
        iget v0, v0, $MEDIA->id:I
        return v0
        :hush_none
        const/4 v0, 0x0
        return v0
    """)
    writeStub(AUTO_FORWARDING, "storyPeer", 4, """
        check-cast p0, $MESSAGE
        iget-object v2, p0, $MESSAGE->messageOwner:$TL_MESSAGE
        if-eqz v2, :hush_none
        iget-object v2, v2, $TL_MESSAGE->media:$MEDIA
        if-eqz v2, :hush_none
        iget-object v0, v2, $MEDIA->peer:$PEER
        if-eqz v0, :hush_user
        invoke-static {v0}, $MESSAGE->getPeerId($PEER)J
        move-result-wide v0
        return-wide v0
        :hush_user
        iget-wide v0, v2, $MEDIA->user_id:J
        return-wide v0
        :hush_none
        const-wide/16 v0, 0x0
        return-wide v0
    """)
    writeStub(AUTO_FORWARDING, "gameId", 4, """
        check-cast p0, $MESSAGE
        iget-object v2, p0, $MESSAGE->messageOwner:$TL_MESSAGE
        if-eqz v2, :hush_none
        iget-object v2, v2, $TL_MESSAGE->media:$MEDIA
        if-eqz v2, :hush_none
        iget-object v2, v2, $MEDIA->game:$TL_GAME
        if-eqz v2, :hush_none
        iget-wide v0, v2, $TL_GAME->id:J
        return-wide v0
        :hush_none
        const-wide/16 v0, 0x0
        return-wide v0
    """)
    // The giveaway's layer classes extend these two, so instance-of takes them too.
    for ((name, fields) in listOf("giveawayEnd" to ("until_date" to "until_date"), "giveawayCount" to ("quantity" to "winners_count"),
            "giveawayMonths" to ("months" to "months"))) {
        writeStub(AUTO_FORWARDING, name, 3, """
            check-cast p0, $MESSAGE
            iget-object v0, p0, $MESSAGE->messageOwner:$TL_MESSAGE
            if-eqz v0, :hush_none
            iget-object v0, v0, $TL_MESSAGE->media:$MEDIA
            instance-of v1, v0, $MEDIA_GIVEAWAY
            if-eqz v1, :hush_results
            check-cast v0, $MEDIA_GIVEAWAY
            iget v0, v0, $MEDIA_GIVEAWAY->${fields.first}:I
            return v0
            :hush_results
            instance-of v1, v0, $MEDIA_GIVEAWAY_RESULTS
            if-eqz v1, :hush_none
            check-cast v0, $MEDIA_GIVEAWAY_RESULTS
            iget v0, v0, $MEDIA_GIVEAWAY_RESULTS->${fields.second}:I
            return v0
            :hush_none
            const/4 v0, 0x0
            return v0
        """)
    }
    writeStub(AUTO_FORWARDING, "giveawayStars", 4, """
        check-cast p0, $MESSAGE
        iget-object v2, p0, $MESSAGE->messageOwner:$TL_MESSAGE
        if-eqz v2, :hush_none
        iget-object v2, v2, $TL_MESSAGE->media:$MEDIA
        instance-of v0, v2, $MEDIA_GIVEAWAY
        if-eqz v0, :hush_results
        check-cast v2, $MEDIA_GIVEAWAY
        iget-wide v0, v2, $MEDIA_GIVEAWAY->stars:J
        return-wide v0
        :hush_results
        instance-of v0, v2, $MEDIA_GIVEAWAY_RESULTS
        if-eqz v0, :hush_none
        check-cast v2, $MEDIA_GIVEAWAY_RESULTS
        iget-wide v0, v2, $MEDIA_GIVEAWAY_RESULTS->stars:J
        return-wide v0
        :hush_none
        const-wide/16 v0, 0x0
        return-wide v0
    """)
    writeStub(AUTO_FORWARDING, "checklist", 3, """
        check-cast p0, $MESSAGE
        iget-object v0, p0, $MESSAGE->messageOwner:$TL_MESSAGE
        if-eqz v0, :hush_none
        iget-object v0, v0, $TL_MESSAGE->media:$MEDIA
        instance-of v1, v0, $MEDIA_TODO
        if-eqz v1, :hush_none
        check-cast v0, $MEDIA_TODO
        iget-object v0, v0, $MEDIA_TODO->todo:$TODO_LIST
        if-eqz v0, :hush_none
        iget-object v0, v0, $TODO_LIST->title:$TEXT_WITH_ENTITIES
        if-eqz v0, :hush_none
        iget-object v0, v0, $TEXT_WITH_ENTITIES->text:$STRING
        return-object v0
        :hush_none
        const/4 v0, 0x0
        return-object v0
    """)
    writeStub(AUTO_FORWARDING, "amount", 4, """
        check-cast p0, $MESSAGE
        iget-object v2, p0, $MESSAGE->messageOwner:$TL_MESSAGE
        if-eqz v2, :hush_none
        iget-object v2, v2, $TL_MESSAGE->media:$MEDIA
        if-eqz v2, :hush_none
        iget-wide v0, v2, $MEDIA->total_amount:J
        return-wide v0
        :hush_none
        const-wide/16 v0, 0x0
        return-wide v0
    """)
    writeStub(AUTO_FORWARDING, "service", 2, """
        check-cast p0, $MESSAGE
        iget-object v0, p0, $MESSAGE->messageOwner:$TL_MESSAGE
        if-eqz v0, :hush_no
        iget-object v0, v0, $TL_MESSAGE->action:$ACTION
        if-eqz v0, :hush_no
        instance-of v0, v0, $ACTION_EMPTY
        if-nez v0, :hush_no
        const/4 v0, 0x1
        return v0
        :hush_no
        const/4 v0, 0x0
        return v0
    """)
    writeStub(AUTO_FORWARDING, "media", 2, """
        check-cast p0, $MESSAGE
        invoke-virtual {p0}, $MESSAGE->isMediaEmpty()Z
        move-result v0
        if-nez v0, :hush_empty
        const/4 v0, 0x1
        return v0
        :hush_empty
        const/4 v0, 0x0
        return v0
    """)
    writeStub(AUTO_FORWARDING, "selectedAccount", 1, "sget v0, $USER_CONFIG->selectedAccount:I\nreturn v0")
    writeStub(AUTO_FORWARDING, "userId", 3, """
        invoke-static {p0}, $USER_CONFIG->getInstance(I)$USER_CONFIG
        move-result-object v0
        invoke-virtual {v0}, $USER_CONFIG->getClientUserId()J
        move-result-wide v0
        return-wide v0
    """)
    writeStub(AUTO_FORWARDING, "dialogs", 3, """
        invoke-static {p0}, $CONTROLLER->getInstance(I)$CONTROLLER
        move-result-object v0
        invoke-virtual {v0, p1}, $CONTROLLER->getDialogs(I)$LIST
        move-result-object v0
        return-object v0
    """)
    writeStub(AUTO_FORWARDING, "dialogId", 3, "check-cast p0, $TL_DIALOG\niget-wide v0, p0, $TL_DIALOG->id:J\nreturn-wide v0")
    writeStub(AUTO_FORWARDING, "secret", 3, """
        invoke-static {p0, p1}, $DIALOG_OBJECT->isEncryptedDialog(J)Z
        move-result v0
        return v0
    """)
    writeStub(AUTO_FORWARDING, "folder", 3, """
        invoke-static {p0, p1}, $DIALOG_OBJECT->isFolderDialogId(J)Z
        move-result v0
        return v0
    """)
    // p0 is the account, p1-p2 the dialog id. A group or channel needs you in it and allowed to
    // send, and isn't a channel's direct messages. A user's chat is open unless it's Replies,
    // Telegram's service account or a deleted account, the ones Forward's own picker leaves out.
    writeStub(AUTO_FORWARDING, "canPost", 6, """
        invoke-static {p0}, $CONTROLLER->getInstance(I)$CONTROLLER
        move-result-object v0
        const-wide/16 v1, 0x0
        cmp-long v1, p1, v1
        if-gez v1, :hush_user
        neg-long v1, p1
        invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
        move-result-object v1
        invoke-virtual {v0, v1}, $CONTROLLER->getChat(Ljava/lang/Long;)$TL_CHAT
        move-result-object v0
        if-eqz v0, :hush_no
        invoke-static {v0}, $CHAT_OBJECT->isNotInChat($TL_CHAT)Z
        move-result v1
        if-nez v1, :hush_no
        invoke-static {v0}, $CHAT_OBJECT->isMonoForum($TL_CHAT)Z
        move-result v1
        if-nez v1, :hush_no
        invoke-static {v0}, $CHAT_OBJECT->canSendMessages($TL_CHAT)Z
        move-result v0
        return v0
        :hush_user
        invoke-static {p1, p2}, $USER_OBJECT->isReplyUser(J)Z
        move-result v1
        if-nez v1, :hush_no
        invoke-static {p1, p2}, $USER_OBJECT->isService(J)Z
        move-result v1
        if-nez v1, :hush_no
        invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
        move-result-object v1
        invoke-virtual {v0, v1}, $CONTROLLER->getUser(Ljava/lang/Long;)$TL_USER
        move-result-object v0
        if-eqz v0, :hush_no
        invoke-static {v0}, $USER_OBJECT->isDeleted($TL_USER)Z
        move-result v1
        if-nez v1, :hush_no
        const/4 v0, 0x1
        return v0
        :hush_no
        const/4 v0, 0x0
        return v0
    """)
    writeStub(AUTO_FORWARDING, "peerName", 4, """
        invoke-static {p0}, $CONTROLLER->getInstance(I)$CONTROLLER
        move-result-object v0
        invoke-virtual {v0, p1, p2}, $CONTROLLER->getPeerName(J)$STRING
        move-result-object v0
        return-object v0
    """)
    writeStub(AUTO_FORWARDING, "forward", 20, """
        invoke-static/range {p0 .. p0}, $SEND_HELPER->getInstance(I)$SEND_HELPER
        move-result-object v0
        move-object/from16 v1, p1
        move-wide/from16 v2, p2
        const/4 v4, 0x0
        const/4 v5, 0x0
        const/4 v6, 0x1
        const/4 v7, 0x0
        const/4 v8, 0x0
        const/4 v9, 0x0
        const/4 v10, -0x1
        const-wide/16 v11, 0x0
        const-wide/16 v13, 0x0
        const/4 v15, 0x0
        invoke-virtual/range {v0 .. v15}, $FORWARD_SEND
        move-result v0
        return v0
    """)
}
