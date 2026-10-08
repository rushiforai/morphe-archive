/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.blocked

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
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
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val BLOCKED_SENDERS = "$EXTENSION_PACKAGE/misc/BlockedSenders;"
internal const val BLOCKED_TYPE = "$BLOCKED_SENDERS->type(Ljava/lang/Object;I)I"
internal const val MESSAGE_OBJECT = "Lorg/telegram/messenger/MessageObject;"
internal const val MESSAGE_TYPE = "$MESSAGE_OBJECT->type:I"
internal const val MIGRATE_TO = "Lorg/telegram/tgnet/TLRPC\$TL_messageActionChatMigrateTo;"
internal const val LISTED = "Landroid/util/SparseArray;->indexOfKey(I)I"
internal const val PEERS = "Lorg/telegram/messenger/support/LongSparseIntArray;"
internal const val BLOCKED_PEERS = "Lorg/telegram/messenger/MessagesController;->blockePeers:$PEERS"
internal const val POST = "Lorg/telegram/tgnet/TLRPC\$Message;->post:Z"
private const val CONTROLLER = "Lorg/telegram/messenger/MessagesController;"
private const val TL_MESSAGE = "Lorg/telegram/tgnet/TLRPC\$Message;"

/** How soon after the type test the open chat's next check comes. */
private const val NEXT_CHECK = 4

@Suppress("unused")
val hideBlockedInGroupsPatch = bytecodePatch(
    name = "Hide blocked users in groups",
    description = "Adds a switch, off by default, that leaves messages from people you've blocked out of groups and supergroups you open. Private chats and channel posts stay as they are, and nothing is deleted.",
    default = true,
) {
    category("Chats")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val sites = resolveHideBlockedInGroups()
        // Assembled on copies first, so a refusal leaves the app untouched.
        sites.forEach { (method, indices) -> insertTypeChecks(MutableMethod(ImmutableMethod.of(method)), indices) }
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
        sites.forEach { (method, indices) -> insertTypeChecks(method, indices) }
        enableStatus("hideBlockedInGroups")
    }
}

/** After each type read the extension may answer -1, which the chat's own test then skips. */
internal fun insertTypeChecks(target: MutableMethod, reads: List<Int>) {
    val body = target.controlBody()
    for (read in reads.sortedDescending()) {
        val (type, message) = body[read].namedRegisters()
        target.addInstructions(read + 1, """
            invoke-static {v$message, v$type}, $BLOCKED_TYPE
            move-result v$type
        """)
    }
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

    val loads = mutableListOf<Triple<String, String, Int>>()
    val adds = mutableListOf<Triple<String, String, Int>>()
    classDefForEach { cls ->
        if (cls.type.startsWith("Lapp/hushtelegram/")) return@classDefForEach
        cls.methods.forEach { method ->
            val body = method.controlBody()
            for (read in typeTests(body)) {
                val next = body.subList(read + 2, minOf(body.size, read + 2 + NEXT_CHECK))
                if (next.any { it.opcode == Opcode.INSTANCE_OF && it.controlRef() == MIGRATE_TO }) loads += Triple(cls.type, signature(method), read)
                if (next.any { it.opcode == Opcode.INVOKE_VIRTUAL && it.controlRef() == LISTED }) adds += Triple(cls.type, signature(method), read)
            }
        }
    }
    val load = loads.controlSingle("the open chat's loaded-page type test")
    val added = adds.filter { it.first == load.first }
    controlShape(added.size == 2 && added.map { it.second }.distinct().size == 1, "the open chat no longer tests new messages' type in both branches")

    val chat = mutableClassDefBy(load.first)
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

    val message = classDefByOrNull(MESSAGE_OBJECT)
    controlShape(message != null && listOf("getDialogId()J", "getFromChatId()J").all { wanted -> message.methods.any { signature(it) == wanted && callable(it, false) } } &&
        message.fields.any { it.name == "currentAccount" && it.type == "I" && !AccessFlags.STATIC.isSet(it.accessFlags) } &&
        message.fields.any { it.name == "messageOwner" && it.type == TL_MESSAGE && !AccessFlags.STATIC.isSet(it.accessFlags) },
        "a message no longer says its chat, sender and account")
    controlShape(classDefByOrNull(TL_MESSAGE)?.fields?.any { it.name == "post" && it.type == "Z" && !AccessFlags.STATIC.isSet(it.accessFlags) } == true,
        "a message no longer says whether it's a channel post")
    val controller = classDefByOrNull(CONTROLLER)
    controlShape(controller != null && controller.methods.any { signature(it) == "getInstance(I)$CONTROLLER" && callable(it, true) } &&
        controller.fields.any { "${it.definingClass}->${it.name}:${it.type}" == BLOCKED_PEERS && AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags) },
        "MessagesController no longer keeps the blocked list")
    controlShape(classDefByOrNull(PEERS)?.methods?.any { signature(it) == "indexOfKey(J)I" && callable(it, false) } == true,
        "the blocked list can no longer be looked up")
    return sites
}

/** Each `iget type` on a message whose next instruction skips it when negative. */
private fun typeTests(body: List<Instruction>) = body.indices.filter { at ->
    body[at].opcode == Opcode.IGET && body[at].controlRef() == MESSAGE_TYPE && body.getOrNull(at + 1)?.opcode == Opcode.IF_LTZ &&
        body[at + 1].namedRegisters() == listOf(body[at].namedRegisters().first())
}

private fun signature(m: Method) = "${m.name}(${m.parameterTypes.joinToString("")})${m.returnType}"
private fun callable(m: Method, static: Boolean) = AccessFlags.PUBLIC.isSet(m.accessFlags) && AccessFlags.STATIC.isSet(m.accessFlags) == static
