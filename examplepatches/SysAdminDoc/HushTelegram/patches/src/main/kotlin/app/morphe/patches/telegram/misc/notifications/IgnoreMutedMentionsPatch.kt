/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.notifications

import app.morphe.util.names.origDescriptor
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.util.names.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.util.names.origName
import app.morphe.util.names.origType
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefByOrNull

internal const val MUTED_MENTIONS = "$EXTENSION_PACKAGE/misc/MutedMentions;"
internal const val NOTIFY_DIALOG = "$MUTED_MENTIONS->notifyDialog(Ljava/lang/Object;)J"
internal const val FROM_CHAT = "$MESSAGE_OBJECT->getFromChatId()J"
internal const val MENTIONED = "Lorg/telegram/tgnet/TLRPC\$Message;->mentioned:Z"
internal const val DIALOG_MUTED = "Lorg/telegram/messenger/MessagesController;->isDialogMuted(JJ)Z"
private const val CONTROLLER = "Lorg/telegram/messenger/MessagesController;"
private const val TL_MESSAGE = "Lorg/telegram/tgnet/TLRPC\$Message;"
private const val TOPIC = "$MESSAGE_OBJECT->getTopicId(I${TL_MESSAGE}Z)J"
private const val FORUM = "$CONTROLLER->isForum($MESSAGE_OBJECT)Z"
private val VIRTUAL = setOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE)

/** How far the sender swap may sit after the mention flag's read: the pinned-message skip comes between. */
private const val SWAP_REACH = 12

@Suppress("unused")
val ignoreMutedMentionsPatch = bytecodePatch(
    name = "Ignore mentions in muted chats",
    description = "Stops mentions and replies in groups or channels you've muted from notifying you. Chats you haven't " +
        "muted notify as before. Starts off. Turn it on in HushTelegram settings > Notifications.",
    default = true,
) {
    category("Notifications")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val sites = resolveIgnoreMutedMentions()
        // Assembled on copies first, so a refusal leaves the app untouched.
        sites.forEach { (method, indices) -> replaceSwaps(MutableMethod(ImmutableMethod.of(method)), indices) }
        writeStub(MUTED_MENTIONS, "sender", 3, """
            check-cast p0, $MESSAGE_OBJECT
            invoke-virtual {p0}, $FROM_CHAT
            move-result-wide v0
            return-wide v0
        """)
        writeStub(MUTED_MENTIONS, "chat", 3, """
            check-cast p0, $MESSAGE_OBJECT
            invoke-virtual {p0}, $MESSAGE_OBJECT->getDialogId()J
            move-result-wide v0
            return-wide v0
        """)
        // The same topic Telegram's notification code works out, then the chat list's own mute check.
        writeStub(MUTED_MENTIONS, "muted", 7, """
            check-cast p0, $MESSAGE_OBJECT
            iget v0, p0, $MESSAGE_OBJECT->currentAccount:I
            invoke-static {v0}, $CONTROLLER->getInstance(I)$CONTROLLER
            move-result-object v1
            invoke-virtual {v1, p0}, $FORUM
            move-result v2
            iget-object v3, p0, $MESSAGE_OBJECT->messageOwner:$TL_MESSAGE
            invoke-static {v0, v3, v2}, $TOPIC
            move-result-wide v2
            invoke-virtual {p0}, $MESSAGE_OBJECT->getDialogId()J
            move-result-wide v4
            invoke-virtual {v1, v4, v5, v2, v3}, $DIALOG_MUTED
            move-result v0
            return v0
        """)
        sites.forEach { (method, indices) -> replaceSwaps(method, indices) }
        enableStatus("ignoreMutedMentions")
    }
}

/** Each swap asks the extension instead, with the same message register. */
internal fun replaceSwaps(target: MutableMethod, indices: List<Int>) {
    for (index in indices) {
        val call = target.getInstruction(index)
        val message = call.namedRegisters().single()
        target.replaceInstruction(index, if (call.opcode == Opcode.INVOKE_VIRTUAL_RANGE) {
            "invoke-static/range {v$message .. v$message}, $NOTIFY_DIALOG"
        } else {
            "invoke-static {v$message}, $NOTIFY_DIALOG"
        })
    }
}

/**
 * NotificationsController decides whether a message notifies from the chat's settings, except
 * that a message with the mentioned flag swaps the chat for its sender first, by
 * MessageObject.getFromChatId(). It does that for new messages, for the unread ones it loads at
 * start and for the notification it shows. Every such swap is found by that flag's test just
 * before it.
 */
internal fun BytecodePatchContext.resolveIgnoreMutedMentions(): List<Pair<MutableMethod, List<Int>>> {
    requireStatusMethod("ignoreMutedMentions")
    controlHook(MUTED_MENTIONS, "notifyDialog", listOf("Ljava/lang/Object;"), "J")
    controlHook(MUTED_MENTIONS, "sender", listOf("Ljava/lang/Object;"), "J")
    controlHook(MUTED_MENTIONS, "chat", listOf("Ljava/lang/Object;"), "J")
    controlHook(MUTED_MENTIONS, "muted", listOf("Ljava/lang/Object;"), "Z")

    val notifications = tgMutableClassDefByOrNull(NOTIFICATIONS)
    controlShape(notifications != null, "NotificationsController is missing")
    val sites = notifications!!.methods.mapNotNull { method ->
        val body = method.controlBody()
        val swaps = body.indices.filter { at ->
            body[at].opcode in VIRTUAL && body[at].controlRef() == FROM_CHAT && body.getOrNull(at + 1)?.opcode == Opcode.MOVE_RESULT_WIDE &&
                (maxOf(0, at - SWAP_REACH) until at).any { read ->
                    body[read].opcode == Opcode.IGET_BOOLEAN && body[read].controlRef() == MENTIONED &&
                        body[read + 1].opcode == Opcode.IF_EQZ && body[read + 1].namedRegisters() == listOf(body[read].namedRegisters().first())
                }
        }
        if (swaps.isEmpty()) null else method to swaps
    }
    // A lambda's body runs under its maker's name, so the new-message path can be told apart.
    val names = runsUnder(notifications)
    fun newMessages(method: Method) = names(method).any { it.contains("processNewMessages") }
    controlShape(sites.count { newMessages(it.first) } == 1 &&
        sites.single { newMessages(it.first) }.second.size == 1, "new messages no longer swap a mention to its sender")

    val message = tgClassDefByOrNull(MESSAGE_OBJECT)
    controlShape(message != null && listOf("getFromChatId()J", "getDialogId()J").all { wanted -> message.methods.any { signature(it) == wanted && callable(it, false) } } &&
        message.methods.any { "${it.origName}${it.origDescriptor}" == "getTopicId(I${TL_MESSAGE}Z)J" && callable(it, true) } &&
        message.fields.any { it.origName == "currentAccount" && it.origType == "I" && !AccessFlags.STATIC.isSet(it.accessFlags) } &&
        message.fields.any { it.origName == "messageOwner" && it.origType == TL_MESSAGE && !AccessFlags.STATIC.isSet(it.accessFlags) },
        "a message no longer says its sender, chat and topic")
    val controller = tgClassDefByOrNull(CONTROLLER)
    controlShape(controller != null && controller.methods.any { signature(it) == "getInstance(I)$CONTROLLER" && callable(it, true) } &&
        controller.methods.any { signature(it) == "isForum($MESSAGE_OBJECT)Z" && callable(it, false) } &&
        controller.methods.any { signature(it) == "isDialogMuted(JJ)Z" && callable(it, false) },
        "MessagesController no longer says whether a chat is muted")
    return sites
}

/**
 * The source names each method of [owner] runs under: its own, and for a lambda's body, the names
 * of the methods making that lambda. 13.2 moves a lambda's body into an unnamed static method of
 * the same class, which the lambda's run() calls, so the body no longer carries its maker's name.
 */
internal fun BytecodePatchContext.runsUnder(owner: ClassDef): (Method) -> Set<String> {
    val makers = mutableMapOf<String, MutableSet<String>>()
    for (maker in owner.methods) for (made in maker.implementation?.instructions ?: emptyList()) {
        if (made.opcode != Opcode.NEW_INSTANCE) continue
        val type = ((made as ReferenceInstruction).reference as TypeReference).type
        val lambda = (if (type == owner.type) null else classDefByOrNull(type)) ?: continue
        for (run in lambda.methods) for (call in run.implementation?.instructions ?: emptyList()) {
            val body = (call as? ReferenceInstruction)?.reference as? MethodReference ?: continue
            if (call.opcode in STATIC_CALLS && body.definingClass == owner.type) makers.getOrPut(body.toString()) { mutableSetOf() } += maker.origName
        }
    }
    return { method -> setOf(method.origName) + makers[method.toString()].orEmpty() }
}

private val STATIC_CALLS = setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE)

private fun signature(m: Method) = "${m.origName}${m.origDescriptor}"
private fun callable(m: Method, static: Boolean) = AccessFlags.PUBLIC.isSet(m.accessFlags) && AccessFlags.STATIC.isSet(m.accessFlags) == static
