/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.blocked

import app.morphe.util.names.origDescriptor
import app.morphe.util.names.origString
import app.morphe.util.names.addInstructions
import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.requireThisIntact
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.patches.telegram.misc.notifications.NOTIFICATIONS
import app.morphe.patches.telegram.misc.notifications.runsUnder
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.branchTarget
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origType
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy
import app.morphe.util.names.tgMutableClassDefByOrNull

internal const val BLOCKED_SENDERS = "$EXTENSION_PACKAGE/misc/BlockedSenders;"
internal const val BLOCKED_TYPE = "$BLOCKED_SENDERS->type(Ljava/lang/Object;I)I"
internal const val MESSAGE_OBJECT = "Lorg/telegram/messenger/MessageObject;"
internal const val MESSAGE_TYPE = "$MESSAGE_OBJECT->type:I"
internal const val MIGRATE_TO = "Lorg/telegram/tgnet/TLRPC\$TL_messageActionChatMigrateTo;"
internal const val LISTED = "Landroid/util/SparseArray;->indexOfKey(I)I"
internal const val PEERS = "Lorg/telegram/messenger/support/LongSparseIntArray;"
internal const val BLOCKED_PEERS = "Lorg/telegram/messenger/MessagesController;->blockePeers:$PEERS"
internal const val POST = "Lorg/telegram/tgnet/TLRPC\$Message;->post:Z"
internal const val TL_MESSAGE = "Lorg/telegram/tgnet/TLRPC\$Message;"
internal const val SKIP_NOTIFICATION = "$BLOCKED_SENDERS->skipNotification(Ljava/lang/Object;Z)Z"
internal const val IMPORTED_FORWARD = "$MESSAGE_OBJECT->isImportedForward()Z"
private const val TTL_ACTION = "Lorg/telegram/tgnet/TLRPC\$TL_messageActionSetMessagesTTL;"
private const val CONTROLLER = "Lorg/telegram/messenger/MessagesController;"
internal const val BLOCKED_END = "$CONTROLLER->blockedEndReached:Z"
internal const val BLOCKED_LOADING = "$CONTROLLER->loadingBlockedPeers:Z"
internal const val BLOCKED_PAGE = "$CONTROLLER->getBlockedPeers(Z)V"
internal const val HIDE_REPLY = "$BLOCKED_SENDERS->hideReply(Ljava/lang/Object;)Z"
internal const val REPLY_MESSAGE = "$MESSAGE_OBJECT->replyMessageObject:$MESSAGE_OBJECT"
internal const val VALID_REPLY = "hasValidReplyMessageObject()Z"

/**
 * The extension calls that answer a message's type where the open chat tests it. Each patch puts
 * its own right after the read, so a test may already carry the other's when it's resolved.
 */
internal val TYPE_HOOKS = setOf(BLOCKED_TYPE, "$EXTENSION_PACKAGE/misc/MessageFilters;->type(Ljava/lang/Object;I)I")

/** How soon after the type test the open chat's next check comes. */
private const val NEXT_CHECK = 4

/** How far after the imported-forward test the timer-change test comes. */
private const val NEXT_SKIP = 8

@Suppress("unused")
val hideBlockedInGroupsPatch = bytecodePatch(
    name = "Hide blocked users in groups",
    description = "Leaves messages from people you've blocked out of groups and supergroups you open, and keeps them " +
        "from notifying you. Nothing is deleted. Starts off. Turn it on in HushTelegram settings > Conversations.",
    default = true,
) {
    category("Conversations")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val sites = resolveHideBlockedInGroups()
        val (notify, answer) = resolveBlockedNotificationSkip()
        val (reply, yes) = resolveBlockedReplyQuote()
        // Assembled on copies first, so a refusal leaves the app untouched.
        sites.forEach { (method, indices) -> insertTypeChecks(MutableMethod(ImmutableMethod.of(method)), indices, BLOCKED_TYPE) }
        insertNotificationSkip(MutableMethod(ImmutableMethod.of(notify)), answer)
        insertReplyCheck(MutableMethod(ImmutableMethod.of(reply)), yes)
        writeStub(BLOCKED_SENDERS, "chat", 3, """
            check-cast p0, $MESSAGE_OBJECT
            invoke-virtual {p0}, $MESSAGE_OBJECT->getDialogId()J
            move-result-wide v0
            return-wide v0
        """)
        writeStub(BLOCKED_SENDERS, "sender", 3, """
            check-cast p0, $MESSAGE_OBJECT
            invoke-virtual {p0}, $MESSAGE_OBJECT->getFromChatId()J
            move-result-wide v0
            return-wide v0
        """)
        writeStub(BLOCKED_SENDERS, "post", 2, """
            check-cast p0, $MESSAGE_OBJECT
            iget-object v0, p0, $MESSAGE_OBJECT->messageOwner:$TL_MESSAGE
            iget-boolean v0, v0, $POST
            return v0
        """)
        writeStub(BLOCKED_SENDERS, "blocked", 4, """
            check-cast p0, $MESSAGE_OBJECT
            iget v0, p0, $MESSAGE_OBJECT->currentAccount:I
            invoke-static {v0}, $CONTROLLER->getInstance(I)$CONTROLLER
            move-result-object v0
            iget-object v0, v0, $BLOCKED_PEERS
            invoke-virtual {v0, p1, p2}, $PEERS->indexOfKey(J)I
            move-result v0
            if-ltz v0, :hush_free
            const/4 v0, 0x1
            return v0
            :hush_free
            const/4 v0, 0x0
            return v0
        """)
        // Telegram's own next page: what its Blocked users page asks for as it scrolls.
        writeStub(BLOCKED_SENDERS, "loadMoreBlocked", 3, """
            check-cast p0, $MESSAGE_OBJECT
            iget v0, p0, $MESSAGE_OBJECT->currentAccount:I
            invoke-static {v0}, $CONTROLLER->getInstance(I)$CONTROLLER
            move-result-object v0
            iget-boolean v1, v0, $BLOCKED_END
            if-nez v1, :hush_done
            iget-boolean v1, v0, $BLOCKED_LOADING
            if-nez v1, :hush_done
            const/4 v1, 0x0
            invoke-virtual {v0, v1}, $BLOCKED_PAGE
            const/4 v1, 0x1
            return v1
            :hush_done
            const/4 v1, 0x0
            return v1
        """)
        writeStub(BLOCKED_SENDERS, "quoted", 2, """
            check-cast p0, $MESSAGE_OBJECT
            iget-object v0, p0, $REPLY_MESSAGE
            return-object v0
        """)
        sites.forEach { (method, indices) -> insertTypeChecks(method, indices, BLOCKED_TYPE) }
        insertNotificationSkip(notify, answer)
        insertReplyCheck(reply, yes)
        enableStatus("hideBlockedInGroups")
    }
}

/** After each type read the extension may answer -1, which the chat's own test then skips. */
internal fun insertTypeChecks(target: MutableMethod, reads: List<Int>, hook: String) {
    val body = target.controlBody()
    for (read in reads.sortedDescending()) {
        val (type, message) = body[read].namedRegisters()
        target.addInstructions(read + 1, """
            invoke-static {v$message, v$type}, $hook
            move-result v$type
        """)
    }
}

/** After Telegram's imported-forward answer the extension may say to skip the notification too. */
internal fun insertNotificationSkip(target: MutableMethod, answer: Int) {
    val (skip) = target.controlBody()[answer].namedRegisters()
    val (message) = target.controlBody()[answer - 1].namedRegisters()
    target.addInstructions(answer + 1, """
        invoke-static {v$message, v$skip}, $SKIP_NOTIFICATION
        move-result v$skip
    """)
}

/** Before the reply header's yes the extension may answer no, as for a reply to a deleted message. */
internal fun insertReplyCheck(target: MutableMethod, yes: Int) {
    val (answer) = target.controlBody()[yes].namedRegisters()
    target.addInstructionsWithLabels(yes, """
        invoke-static {p0}, $HIDE_REPLY
        move-result v$answer
        if-eqz v$answer, :hush_stock
        const/4 v$answer, 0x0
        return v$answer
    """, ExternalLabel("hush_stock", target.getInstruction(yes)))
}

/**
 * A message's answer to whether its reply header has a message to show. The chat's message cell
 * asks it before it measures, draws or takes a tap on the header, and a reply to a deleted message
 * gets no header from a no here. Returns the method and the index of its one `const/4 1` before
 * the matching `return`.
 */
internal fun BytecodePatchContext.resolveBlockedReplyQuote(): Pair<MutableMethod, Int> {
    controlHook(BLOCKED_SENDERS, "hideReply", listOf("Ljava/lang/Object;"), "Z")
    controlHook(BLOCKED_SENDERS, "quoted", listOf("Ljava/lang/Object;"), "Ljava/lang/Object;")
    val message = tgMutableClassDefByOrNull(MESSAGE_OBJECT)
    controlShape(message != null && message.fields.any { it.origString() == REPLY_MESSAGE && !AccessFlags.STATIC.isSet(it.accessFlags) },
        "a message no longer keeps the message it replies to")
    val valid = message!!.methods.filter { signature(it) == VALID_REPLY && callable(it, false) }.controlSingle("the reply header's check")
    val body = valid.controlBody()
    controlShape(body.any { it.opcode == Opcode.IGET_OBJECT && it.controlRef() == REPLY_MESSAGE }, "the reply header's check no longer looks at the message replied to")
    val yes = body.indices.filter { at ->
        body[at].opcode == Opcode.CONST_4 && (body[at] as NarrowLiteralInstruction).narrowLiteral == 1 &&
            body.getOrNull(at + 1)?.opcode == Opcode.RETURN && body[at + 1].namedRegisters() == body[at].namedRegisters()
    }.controlSingle("the reply header's yes")
    val flow = ControlFlow.of(valid)
    controlShape(yes > 0 && flow.normal.indices.filter { yes in flow.normal[it] } == listOf(yes - 1), "something jumps into the reply header's yes")
    valid.requireThisIntact("the reply header's check", listOf(yes))
    return valid to yes
}

/**
 * NotificationsController's new-message loop first skips imported forwards, timer changes and
 * silent joins, all by one jump to the same place. A message skipped there never notifies, and
 * the chat's unread count is Telegram's as before. Returns the loop and the index of the
 * imported-forward answer's move-result.
 */
internal fun BytecodePatchContext.resolveBlockedNotificationSkip(): Pair<MutableMethod, Int> {
    controlHook(BLOCKED_SENDERS, "skipNotification", listOf("Ljava/lang/Object;", "Z"), "Z")
    val notifications = tgMutableClassDefByOrNull(NOTIFICATIONS)
    controlShape(notifications != null, "NotificationsController is missing")
    val names = runsUnder(notifications!!)
    val sites = notifications.methods.filter { method -> names(method).any { it.contains("processNewMessages") } }.flatMap { method ->
        val body = method.controlBody()
        body.indices.filter { at ->
            body[at].opcode == Opcode.INVOKE_VIRTUAL && body[at].controlRef() == IMPORTED_FORWARD &&
                body.getOrNull(at + 1)?.opcode == Opcode.MOVE_RESULT && body.getOrNull(at + 2)?.opcode == Opcode.IF_NEZ &&
                body[at + 2].namedRegisters() == body[at + 1].namedRegisters()
        }.map { method to it + 1 }
    }
    val (method, answer) = sites.controlSingle("the new-message notification skip")
    val body = method.controlBody()
    val (message) = body[answer - 1].namedRegisters()
    val (skip) = body[answer].namedRegisters()
    controlShape(message != skip && message <= 15 && skip <= 15, "the new-message notification skip can't be passed to the extension as it is")
    val refuse: (String) -> Nothing = { why -> controlShape(false, "the new-message notification skip: $why"); error(why) }
    val skipTo = body.branchTarget(answer + 1, refuse)
    val timer = (answer + 2 until minOf(body.size - 1, answer + 2 + NEXT_SKIP)).firstOrNull {
        body[it].opcode == Opcode.INSTANCE_OF && body[it].controlRef() == TTL_ACTION && body[it + 1].opcode == Opcode.IF_NEZ
    }
    controlShape(timer != null && body.branchTarget(timer + 1, refuse) == skipTo, "new messages no longer skip timer changes the way they skip imported forwards")
    val flow = ControlFlow.of(method)
    controlShape(flow.normal.indices.filter { answer + 1 in flow.normal[it] } == listOf(answer), "something jumps into the new-message notification skip")
    return method to answer
}

/**
 * An open chat lists a message unless its type is negative, Telegram's mark for a message it
 * can't show: once when a page of messages loads (followed by the migrated-group check) and once
 * in each branch that adds new messages (followed by the already-listed lookup). Telegram does its
 * bookkeeping of IDs and dates before that test, so a message skipped there leaves paging,
 * unread counts and the message database alone.
 */
internal fun BytecodePatchContext.resolveHideBlockedInGroups(): List<Pair<MutableMethod, List<Int>>> {
    requireStatusMethod("hideBlockedInGroups")
    controlHook(BLOCKED_SENDERS, "type", listOf("Ljava/lang/Object;", "I"), "I")
    for (stub in listOf("chat", "sender")) controlHook(BLOCKED_SENDERS, stub, listOf("Ljava/lang/Object;"), "J")
    controlHook(BLOCKED_SENDERS, "post", listOf("Ljava/lang/Object;"), "Z")
    controlHook(BLOCKED_SENDERS, "blocked", listOf("Ljava/lang/Object;", "J"), "Z")
    controlHook(BLOCKED_SENDERS, "loadMoreBlocked", listOf("Ljava/lang/Object;"), "Z")
    val sites = resolveOpenChatTypeReads()

    val controller = tgClassDefByOrNull(CONTROLLER)
    controlShape(controller != null && controller.methods.any { origSig(it) == "getInstance(I)$CONTROLLER" && callable(it, true) } &&
        controller.fields.any { it.origString() == BLOCKED_PEERS && AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags) },
        "MessagesController no longer keeps the blocked list")
    controlShape(controller!!.methods.any { origSig(it) == "getBlockedPeers(Z)V" && callable(it, false) } &&
        listOf(BLOCKED_END, BLOCKED_LOADING).all { wanted ->
            controller.fields.any { it.origString() == wanted && AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags) }
        }, "MessagesController no longer loads the blocked list a page at a time")
    controlShape(tgClassDefByOrNull(PEERS)?.methods?.any { origSig(it) == "indexOfKey(J)I" && callable(it, false) } == true,
        "the blocked list can no longer be looked up")
    return sites
}

/**
 * The open chat's three type tests, each as the method and the index of its `iget type`, and
 * what a message says of itself that both Hide blocked users and Hide messages by keyword ask:
 * its chat, sender, account, text and whether it's a channel post.
 */
internal fun BytecodePatchContext.resolveOpenChatTypeReads(): List<Pair<MutableMethod, List<Int>>> {
    val loads = mutableListOf<Triple<String, String, Int>>()
    val adds = mutableListOf<Triple<String, String, Int>>()
    forEachClassMentioning(Mention.reference(MESSAGE_TYPE) and (Mention.reference(MIGRATE_TO) or Mention.reference(LISTED))) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        cls.methods.forEach { method ->
            val body = method.controlBody()
            for ((read, test) in typeTests(body)) {
                val next = body.subList(test + 1, minOf(body.size, test + 1 + NEXT_CHECK))
                if (next.any { it.opcode == Opcode.INSTANCE_OF && it.controlRef() == MIGRATE_TO }) loads += Triple(cls.type, signature(method), read)
                if (next.any { it.opcode == Opcode.INVOKE_VIRTUAL && it.controlRef() == LISTED }) adds += Triple(cls.type, signature(method), read)
            }
        }
    }
    val load = loads.controlSingle("the open chat's loaded-page type test")
    val added = adds.filter { it.first == load.first }
    controlShape(added.size == 2 && added.map { it.second }.distinct().size == 1, "the open chat no longer tests new messages' type in both branches")

    val chat = tgMutableClassDefBy(load.first)
    val sites = listOf(load).plus(added).groupBy({ it.second }, { it.third }).map { (wanted, reads) ->
        chat.methods.single { signature(it) == wanted } to reads
    }
    for ((method, reads) in sites) {
        val body = method.controlBody()
        val flow = ControlFlow.of(method)
        for (read in reads) {
            val (type, message) = body[read].namedRegisters()
            controlShape(type != message && type <= 15 && message <= 15, "an open chat's type test can't be passed to the extension as it is")
            controlShape(flow.normal.indices.filter { read + 1 in flow.normal[it] } == listOf(read), "something jumps into an open chat's type test")
        }
    }

    val message = tgClassDefByOrNull(MESSAGE_OBJECT)
    controlShape(message != null && listOf("getDialogId()J", "getFromChatId()J", "isOut()Z").all { wanted -> message.methods.any { origSig(it) == wanted && callable(it, false) } } &&
        message.fields.any { it.origName == "currentAccount" && it.origType == "I" && !AccessFlags.STATIC.isSet(it.accessFlags) } &&
        message.fields.any { it.origName == "messageOwner" && it.origType == TL_MESSAGE && !AccessFlags.STATIC.isSet(it.accessFlags) },
        "a message no longer says its chat, sender and account")
    val owner = tgClassDefByOrNull(TL_MESSAGE)?.fields
    controlShape(owner?.any { it.origName == "post" && it.origType == "Z" && !AccessFlags.STATIC.isSet(it.accessFlags) } == true,
        "a message no longer says whether it's a channel post")
    controlShape(owner?.any { it.origName == "message" && it.origType == "Ljava/lang/String;" && !AccessFlags.STATIC.isSet(it.accessFlags) } == true,
        "a message no longer keeps its text")
    return sites
}

/**
 * Each `iget type` on a message whose test skips it when negative, with the index of that test:
 * the next instruction, or the one after the type hooks a patch already put between them.
 */
private fun typeTests(body: List<Instruction>): List<Pair<Int, Int>> = body.indices.mapNotNull { at ->
    if (body[at].opcode != Opcode.IGET || body[at].controlRef() != MESSAGE_TYPE) return@mapNotNull null
    val (type, message) = body[at].namedRegisters()
    var test = at + 1
    while (body.getOrNull(test)?.opcode == Opcode.INVOKE_STATIC && body[test].controlRef() in TYPE_HOOKS &&
        body[test].namedRegisters() == listOf(message, type) && body.getOrNull(test + 1)?.opcode == Opcode.MOVE_RESULT &&
        body[test + 1].namedRegisters() == listOf(type)) test += 2
    if (body.getOrNull(test)?.opcode == Opcode.IF_LTZ && body[test].namedRegisters() == listOf(type)) at to test else null
}

private fun signature(m: Method) = "${m.origName}${m.origDescriptor}"
private fun callable(m: Method, static: Boolean) = AccessFlags.PUBLIC.isSet(m.accessFlags) && AccessFlags.STATIC.isSet(m.accessFlags) == static
private fun origSig(m: Method) = "${m.origName}(${m.origParameterTypes.joinToString("")})${m.origReturnType}"
