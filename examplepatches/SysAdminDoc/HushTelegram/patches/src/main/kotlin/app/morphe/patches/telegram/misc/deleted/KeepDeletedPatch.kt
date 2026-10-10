/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.deleted

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.freeLocalsAt
import app.morphe.patches.telegram.misc.extension.liveAcrossInjection
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.extension.parameterRegisterNumber
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.requireThisIntact
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.patches.telegram.misc.time.EDITED_MESSAGE
import app.morphe.patches.telegram.misc.time.MESSAGE_TIME_SHOWN
import app.morphe.patches.telegram.misc.time.messageSecondsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val KEEP_DELETED = "$EXTENSION_PACKAGE/misc/KeepDeleted;"
internal const val MESSAGES_CONTROLLER = "Lorg/telegram/messenger/MessagesController;"
internal const val USER_DELETE = "Lorg/telegram/tgnet/tl/TL_update\$TL_updateDeleteMessages;"
internal const val CHANNEL_DELETE = "Lorg/telegram/tgnet/tl/TL_update\$TL_updateDeleteChannelMessages;"
internal const val USER_DELETE_MESSAGES = "$USER_DELETE->messages:Ljava/util/ArrayList;"
internal const val CHANNEL_DELETE_MESSAGES = "$CHANNEL_DELETE->messages:Ljava/util/ArrayList;"
internal const val ADD_ALL = "Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z"
internal const val DELETE_BY_PUSH = "$MESSAGES_CONTROLLER->deleteMessagesByPush(JLjava/util/ArrayList;J)V"
private const val OBJECT = "Ljava/lang/Object;"
private const val LIST = "Ljava/util/ArrayList;"
internal const val MESSAGE_OBJECT = "Lorg/telegram/messenger/MessageObject;"
internal const val GROUPED_MESSAGES = "Lorg/telegram/messenger/MessageObject\$GroupedMessages;"
internal const val NOTIFICATION_CENTER = "Lorg/telegram/messenger/NotificationCenter;"
/** The event Telegram posts when a chat's messages were replaced, with the chat and the new messages. */
internal const val REPLACE_MESSAGES = "$NOTIFICATION_CENTER->replaceMessagesObjects:I"
internal const val POST_NOTIFICATION = "$NOTIFICATION_CENTER->postNotificationName(I[Ljava/lang/Object;)V"
/** Set on a message whose bubble has to lay itself out again although it shows the same message. */
internal const val FORCE_UPDATE = "$MESSAGE_OBJECT->forceUpdate:Z"
internal const val REPLACE_IF_EXISTS = "lambda\$replaceMessageIfExists\$"
private const val PATCH = "Keep deleted messages"

private val GOTOS = setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)
private val MOVE_OBJECTS = setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)

@Suppress("unused")
val keepDeletedPatch = bytecodePatch(
    name = "Keep deleted messages",
    description = "Keeps a message on your phone when someone else deletes it, and marks it deleted next to the time. " +
        "Your own deletes still work normally. Starts off. Turn it on in HushTelegram settings > Chats.",
    default = true,
) {
    category("Conversations")
    dependsOn(settingsPatch, telegramExtensionPatch, messageSecondsPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val plan = resolveKeepDeleted()
        // Assembled on copies first, so a refusal leaves the app untouched.
        plan.applyTo(MutableMethod(ImmutableMethod.of(plan.updates)), MutableMethod(ImmutableMethod.of(plan.push)),
            MutableMethod(ImmutableMethod.of(plan.measure)))
        plan.applyTo(plan.updates, plan.push, plan.measure)
        enableStatus("keepDeleted")
    }
}

/** One of the two places the update loop collects deleted message IDs. */
internal class DeleteBranch(
    val hook: String,
    /** The instruction the hook goes in front of, just after the update is cast to its own type. */
    val insertAt: Int,
    val update: Int,
    /** The first instruction after the IDs are added, which the loop carries on from. */
    val tailStart: Int,
    /** The register the loop's last move reads, and the one it writes: the collected IDs. */
    val source: Int,
    val dest: Int,
    /** Two registers in a row that nothing reads from here on. */
    val scratch: Int,
)

internal class KeepDeletedPlan(
    val updates: MutableMethod,
    val branches: List<DeleteBranch>,
    val push: MutableMethod,
    val pushResult: Int,
    val measure: MutableMethod,
    val measuredMessage: Int,
    /** The bubble's own layout, which measures the time again when a message is marked. Not edited. */
    val layout: Method,
) {
    /** Each hook goes in the method it was found for, the later one in the update loop first. */
    fun applyTo(updates: MutableMethod, push: MutableMethod, measure: MutableMethod) {
        for (branch in branches.sortedByDescending { it.insertAt }) {
            val a = branch.scratch
            updates.addInstructionsAtControlFlowLabel(
                branch.insertAt,
                """
                    move-object/from16 v$a, v${branch.update}
                    move-object/from16 v${a + 1}, p0
                    invoke-static/range {v$a .. v${a + 1}}, $KEEP_DELETED->${branch.hook}($OBJECT$OBJECT)Z
                    move-result v$a
                    if-eqz v$a, :hush_stock
                    move-object/from16 v${branch.source}, v${branch.dest}
                    goto/32 :hush_tail
                    :hush_stock
                    nop
                """.trimIndent(),
                ExternalLabel("hush_tail", updates.getInstruction(branch.tailStart)),
            )
        }
        val first = push.localRegisterCount()
        push.addInstructionsAtControlFlowLabel(
            0,
            """
                invoke-static/range {v$first .. v${first + 5}}, $KEEP_DELETED->push(${OBJECT}J${LIST}J)Z
                move-result v$pushResult
                if-eqz v$pushResult, :hush_stock
                return-void
                :hush_stock
                nop
            """.trimIndent(),
        )
        measure.addInstructionsAtControlFlowLabel(
            0, "invoke-static/range {v$measuredMessage .. v$measuredMessage}, $KEEP_DELETED->measuring($OBJECT)V",
        )
    }
}

/** What the extension reaches by name, with the class and member each one lives on. */
private class Api(val owner: String, val name: String, val parameters: String, val result: String, val static: Boolean = false)

private const val BASE_CONTROLLER = "Lorg/telegram/messenger/BaseController;"
private const val STORAGE = "Lorg/telegram/messenger/MessagesStorage;"
private const val QUEUE = "Lorg/telegram/messenger/DispatchQueue;"
private const val DATABASE = "Lorg/telegram/SQLite/SQLiteDatabase;"
private const val CURSOR = "Lorg/telegram/SQLite/SQLiteCursor;"
private const val BUFFER = "Lorg/telegram/tgnet/NativeByteBuffer;"
private const val TL_MESSAGE = "Lorg/telegram/tgnet/TLRPC\$Message;"
private const val TL_MEDIA = "Lorg/telegram/tgnet/TLRPC\$MessageMedia;"
private const val TL_CHAT = "Lorg/telegram/tgnet/TLRPC\$Chat;"
private const val USER_CONFIG = "Lorg/telegram/messenger/UserConfig;"
private const val CHAT_OBJECT = "Lorg/telegram/messenger/ChatObject;"
internal const val NOTIFICATIONS = "Lorg/telegram/messenger/NotificationsController;"
internal const val NOTIFICATION_CLEANUP = "removeDeletedMessagesFromNotifications"

private val API = listOf(
    Api(BASE_CONTROLLER, "getMessagesStorage", "", STORAGE),
    Api(BASE_CONTROLLER, "getNotificationsController", "", NOTIFICATIONS),
    Api(BASE_CONTROLLER, "getUserConfig", "", USER_CONFIG),
    Api(BASE_CONTROLLER, "getNotificationCenter", "", NOTIFICATION_CENTER),
    Api(NOTIFICATION_CENTER, "postNotificationName", "I[$OBJECT", "V"),
    Api(MESSAGES_CONTROLLER, "deleteMessagesByPush", "J${LIST}J", "V"),
    Api(MESSAGES_CONTROLLER, "getChat", "Ljava/lang/Long;", TL_CHAT),
    Api(MESSAGES_CONTROLLER, "getInstance", "I", MESSAGES_CONTROLLER, static = true),
    Api(STORAGE, "getChat", "J", TL_CHAT),
    Api(CHAT_OBJECT, "isChannel", TL_CHAT, "Z", static = true),
    Api(STORAGE, "getStorageQueue", "", QUEUE),
    Api(STORAGE, "getDatabase", "", DATABASE),
    Api(QUEUE, "postRunnable", "Ljava/lang/Runnable;", "Z"),
    Api(DATABASE, "queryFinalized", "Ljava/lang/String;[Ljava/lang/Object;", CURSOR),
    Api(CURSOR, "next", "", "Z"),
    Api(CURSOR, "longValue", "I", "J"),
    Api(CURSOR, "intValue", "I", "I"),
    Api(CURSOR, "byteBufferValue", "I", BUFFER),
    Api(CURSOR, "dispose", "", "V"),
    Api(BUFFER, "readInt32", "Z", "I"),
    Api(BUFFER, "reuse", "", "V"),
    Api(TL_MESSAGE, "TLdeserialize", "Lorg/telegram/tgnet/InputSerializedData;IZ", TL_MESSAGE, static = true),
    Api(USER_CONFIG, "getInstance", "I", USER_CONFIG, static = true),
    Api(USER_CONFIG, "getClientUserId", "", "J"),
    Api(USER_CONFIG, "isClientActivated", "", "Z"),
    Api(MESSAGE_OBJECT, "getDialogId", "", "J"),
    Api(MESSAGE_OBJECT, "getId", "", "I"),
)

private val FIELDS = listOf(
    Triple(TL_MESSAGE, "out", "Z"),
    Triple(TL_MESSAGE, "ttl_period", "I"),
    Triple(TL_MESSAGE, "noforwards", "Z"),
    Triple(TL_MESSAGE, "media", TL_MEDIA),
    Triple(TL_MEDIA, "ttl_seconds", "I"),
    Triple(TL_CHAT, "noforwards", "Z"),
    Triple(USER_DELETE, "messages", LIST),
    Triple(CHANNEL_DELETE, "messages", LIST),
    Triple(CHANNEL_DELETE, "channel_id", "J"),
    Triple(MESSAGE_OBJECT, "currentAccount", "I"),
    Triple(MESSAGE_OBJECT, "forceUpdate", "Z"),
)

/** Telegram's numbers the extension reads by name: the account slots and the replaced messages event. */
private val STATIC_FIELDS = listOf(
    Triple(USER_CONFIG, "MAX_ACCOUNT_COUNT", "I"),
    Triple(NOTIFICATION_CENTER, "replaceMessagesObjects", "I"),
)

/** Every type the extension reaches by name, for a test to load. */
internal val KEEP_DELETED_TYPES: Set<String> = (API.map { it.owner } + FIELDS.map { it.first } + STATIC_FIELDS.map { it.first } +
    listOf(MESSAGES_CONTROLLER, STORAGE, NOTIFICATIONS)).toSet()

/**
 * The extension reads Telegram's storage and message objects by name, and the patch refuses a build
 * where any of them has moved. The table query is Telegram's own, so its columns are checked
 * against the table's creation and the lookup Telegram's own deletion starts with.
 */
private fun BytecodePatchContext.requireTelegramNames() {
    for (api in API) {
        val owner = classDefByOrNull(api.owner)
        controlShape(owner != null && AccessFlags.PUBLIC.isSet(owner.accessFlags) && owner.methods.any {
            it.name == api.name && it.parameterTypes.joinToString("") == api.parameters && it.returnType == api.result &&
                AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) == api.static
        }, "${api.owner}->${api.name} is no longer a public method Keep deleted messages can call")
    }
    for ((owner, name, type) in FIELDS) {
        val cls = classDefByOrNull(owner)
        controlShape(cls != null && AccessFlags.PUBLIC.isSet(cls.accessFlags) && cls.fields.any {
            it.name == name && it.type == type && AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags)
        }, "$owner->$name is no longer a public field Keep deleted messages can read")
    }
    for ((owner, name, type) in STATIC_FIELDS) {
        val cls = classDefByOrNull(owner)
        controlShape(cls != null && AccessFlags.PUBLIC.isSet(cls.accessFlags) && cls.fields.any {
            it.name == name && it.type == type && AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags)
        }, "$owner->$name is no longer a public static field Keep deleted messages can read")
    }
    val storage = classDefByOrNull(STORAGE)
    val strings = (storage?.methods ?: emptyList()).flatMap { m -> m.controlBody().mapNotNull { it.controlString() } }
    controlShape(strings.any { it.startsWith("CREATE TABLE messages_v2(") && listOf("mid INTEGER", "uid INTEGER", "out INTEGER", "ttl INTEGER",
        "data BLOB", "is_channel INTEGER").all { column -> column in it } }, "the stored messages table changed")
    controlShape(strings.any { it.contains("FROM messages_v2 WHERE mid IN(") || it.endsWith(") AND is_channel = 0") },
        "Telegram's own deletion no longer looks messages up by ID outside channels")
}

/**
 * The runtime's questions and the three places they go: the update loop's two collections of deleted
 * IDs, the push deletion's entry, and the start of the bubble's time measuring.
 */
internal fun BytecodePatchContext.resolveKeepDeleted(): KeepDeletedPlan {
    requireStatusMethod("keepDeleted")
    controlHook(KEEP_DELETED, "userUpdate", listOf(OBJECT, OBJECT), "Z")
    controlHook(KEEP_DELETED, "channelUpdate", listOf(OBJECT, OBJECT), "Z")
    controlHook(KEEP_DELETED, "push", listOf(OBJECT, "J", LIST, "J"), "Z")
    controlHook(KEEP_DELETED, "measuring", listOf(OBJECT), "V")
    controlHook(KEEP_DELETED, "labelled", listOf("Ljava/lang/String;"), "Ljava/lang/String;")
    requireTelegramNames()

    val controller = mutableClassDefByOrNull(MESSAGES_CONTROLLER)
    controlShape(controller != null, "MessagesController is missing")

    // The update loop: the one method that adds both kinds of deleted IDs to the list it collects.
    val updates = controller!!.methods.filter { m ->
        val refs = m.controlBody().mapNotNull { it.controlRef() }.toSet()
        USER_DELETE_MESSAGES in refs && CHANNEL_DELETE_MESSAGES in refs
    }.controlSingle("update loop")
    controlShape(!AccessFlags.STATIC.isSet(updates.accessFlags), "the update loop is static")
    val branches = listOf(
        resolveBranch(updates, USER_DELETE, USER_DELETE_MESSAGES, "userUpdate"),
        resolveBranch(updates, CHANNEL_DELETE, CHANNEL_DELETE_MESSAGES, "channelUpdate"),
    )
    updates.requireThisIntact(PATCH, branches.map { it.insertAt })
    requireNotificationCleanup(updates)

    // The push deletion, whose own entry the extension answers first.
    val push = controller.methods.filter { m ->
        m.name == "deleteMessagesByPush" && m.parameterTypes.map(CharSequence::toString) == listOf("J", LIST, "J") &&
            m.returnType == "V" && !AccessFlags.STATIC.isSet(m.accessFlags)
    }.controlSingle("push deletion")
    // It posts its work to the storage queue, and that work, a lambda of its own, marks the messages deleted.
    val pushRefs = push.controlBody().mapNotNull { it.controlRef() }
    controlShape("$STORAGE->getStorageQueue()$QUEUE" in pushRefs && "$QUEUE->postRunnable(Ljava/lang/Runnable;)Z" in pushRefs,
        "the push deletion no longer posts its work to the storage queue")
    controlShape(controller.methods.any { m ->
        m.name.startsWith("lambda\$deleteMessagesByPush\$") && m.controlBody().any { it.controlRef()?.startsWith("$STORAGE->markMessagesAsDeleted(") == true }
    }, "the push deletion no longer marks messages deleted in the storage")
    controlShape(push.localRegisterCount() >= 1, "the push deletion has no register for the answer")
    controlShape(ControlFlow.of(push).normal.none { 0 in it }, "something jumps back to the start of the push deletion")
    val pushResult = push.freeLocalsAt(PATCH, 0, 1, highest = 255).single()

    // The bubble's time measuring, found by what Message times with seconds left in it.
    val measures = mutableListOf<Pair<String, String>>()
    classDefForEach { cls ->
        if (cls.type.startsWith("Lapp/hushtelegram/")) return@classDefForEach
        cls.methods.forEach { m ->
            if (m.parameterTypes.map(CharSequence::toString) == listOf(MESSAGE_OBJECT) && m.returnType == "V" &&
                !AccessFlags.STATIC.isSet(m.accessFlags)) {
                val refs = m.controlBody().mapNotNull { it.controlRef() }.toSet()
                if (EDITED_MESSAGE in refs && MESSAGE_TIME_SHOWN in refs) measures += cls.type to m.name
            }
        }
    }
    val (type, name) = measures.controlSingle("message time measuring")
    val bubble = mutableClassDefBy(type)
    val measure = bubble.methods.single { it.name == name && it.parameterTypes.size == 1 &&
        it.parameterTypes[0].toString() == MESSAGE_OBJECT && it.returnType == "V" }
    controlShape(ControlFlow.of(measure).normal.none { 0 in it }, "something jumps back to the start of the message time measuring")
    val layout = requireRedraw(bubble, measure)
    return KeepDeletedPlan(updates, branches, push, pushResult, measure, measure.parameterRegisterNumber(0), layout)
}

/**
 * A bubble already on screen measured its time before its message was kept. The extension draws
 * it again the way Telegram redraws an edited message: it marks the message for a fresh layout and
 * posts the replaced messages event with the chat and the messages, the event Telegram's own
 * storage posts after replacing a stored message. The chat screen puts each message back in its
 * row, and the bubble's layout, which reads the mark and clears it, measures the time again.
 *
 * @return the bubble's layout
 */
internal fun BytecodePatchContext.requireRedraw(bubble: ClassDef, measure: Method): Method {
    controlShape(classDefByOrNull(STORAGE)?.methods?.any { m ->
        m.name.startsWith(REPLACE_IF_EXISTS) && !AccessFlags.STATIC.isSet(m.accessFlags) &&
            m.controlBody().mapNotNull { it.controlRef() }.let { refs ->
                REPLACE_MESSAGES in refs && "$MESSAGE_OBJECT->getDialogId()J" in refs && POST_NOTIFICATION in refs
            }
    } == true, "Telegram's storage no longer tells the open chat that a message was replaced")
    val measured = "${measure.definingClass}->${measure.name}($MESSAGE_OBJECT)V"
    return bubble.methods.filter { m ->
        m.parameterTypes.map(CharSequence::toString).take(2) == listOf(MESSAGE_OBJECT, GROUPED_MESSAGES) && m.returnType == "V" &&
            !AccessFlags.STATIC.isSet(m.accessFlags) && m.controlBody().let { body ->
                body.any { it.opcode == Opcode.IGET_BOOLEAN && it.controlRef() == FORCE_UPDATE } &&
                    body.any { it.opcode == Opcode.IPUT_BOOLEAN && it.controlRef() == FORCE_UPDATE } &&
                    body.any { it.controlRef() == measured }
            }
    }.controlSingle("the bubble's fresh layout for a marked message")
}

/**
 * A message handed back after its update was taken still needs the notification cleanup the update
 * loop would have run. That cleanup takes androidx's LongSparseArray, which R8 renames, so the
 * extension takes the type from the cleanup's signature and fills it with the one public
 * (Object, long) put the type has. The update loop fills its own deleted lists with that same put.
 *
 * @return the renamed sparse array type
 */
internal fun BytecodePatchContext.requireNotificationCleanup(updates: Method): String {
    val notifications = classDefByOrNull(NOTIFICATIONS)
    val cleanups = notifications?.methods?.filter {
        it.name == NOTIFICATION_CLEANUP && it.parameterTypes.size == 2 && it.parameterTypes[1].toString() == "Z" && it.returnType == "V"
    }.orEmpty()
    controlShape(notifications != null && AccessFlags.PUBLIC.isSet(notifications.accessFlags) && cleanups.size == 1 &&
        AccessFlags.PUBLIC.isSet(cleanups.single().accessFlags) && !AccessFlags.STATIC.isSet(cleanups.single().accessFlags),
        "Telegram's notification cleanup for deleted messages changed")
    val sparseType = cleanups.single().parameterTypes[0].toString()
    val sparse = classDefByOrNull(sparseType)
    val puts = sparse?.methods?.filter {
        it.parameterTypes.map(CharSequence::toString) == listOf(OBJECT, "J") && it.returnType == "V" &&
            AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags)
    }.orEmpty()
    controlShape(sparse != null && AccessFlags.PUBLIC.isSet(sparse.accessFlags) && puts.size == 1 && sparse.methods.any {
        it.name == "<init>" && it.parameterTypes.isEmpty() && AccessFlags.PUBLIC.isSet(it.accessFlags)
    }, "the notification cleanup's sparse array no longer has one public put and a public empty constructor")
    val put = "$sparseType->${puts.single().name}(${OBJECT}J)V"
    controlShape(updates.controlBody().any { it.controlRef() == put },
        "the update loop no longer fills its deleted lists with the sparse array's put")
    return sparseType
}

/**
 * One branch of the update loop. It casts the update to its own type, adds the update's message IDs
 * to the list kept for that chat, and ends with a move that stores the collected lists and a jump
 * back to the loop. The hook goes in front of the work, and taking the update jumps to those
 * trailing moves with the collected lists as they were.
 */
private fun resolveBranch(method: MutableMethod, updateType: String, messagesField: String, hook: String): DeleteBranch {
    val body = method.controlBody()
    val iget = body.indices.filter { body[it].controlRef() == messagesField }.controlSingle("$updateType's messages read")
    val cast = (iget downTo 0).firstOrNull { body[it].opcode == Opcode.CHECK_CAST && body[it].controlRef() == updateType }
    controlShape(cast != null && iget - cast < 40, "$updateType isn't cast just before its messages are read")
    val update = (body[cast!!] as OneRegisterInstruction).registerA
    val read = (body[iget] as OneRegisterInstruction).registerA
    val addAll = iget + 1
    controlShape(body[addAll].opcode == Opcode.INVOKE_VIRTUAL && body[addAll].controlRef() == ADD_ALL &&
        (body[addAll] as FiveRegisterInstruction).let {
            it.registerCount == 2 && it.registerD == read
        }, "$updateType's messages aren't added to the collected list right away")
    val jump = (addAll + 1 until body.size).firstOrNull { body[it].opcode in GOTOS }
    controlShape(jump != null && jump - addAll in 2..4, "$updateType's branch doesn't end in a jump back to the loop")
    val tail = (addAll + 1 until jump!!).map { body[it] }
    controlShape(tail.all { it.opcode in MOVE_OBJECTS }, "$updateType's branch does more than store the collected lists after adding")
    val last = tail.last() as TwoRegisterInstruction
    val dest = last.registerA
    val source = last.registerB
    controlShape(source <= 255 && source != dest, "$updateType's branch stores the collected lists in registers a hook can't restore")
    controlShape((cast + 1 until iget).any { (body[it].opcode == Opcode.IF_NEZ) && (body[it] as OneRegisterInstruction).registerA == dest },
        "$updateType's branch doesn't create the collected lists when there are none")
    // Whatever the earlier trailing moves read has to be what it was before the branch's own work.
    val needed = tail.dropLast(1).map { (it as TwoRegisterInstruction).registerB }.toSet()
    val spoiled = (cast + 1..addAll).filter { i ->
        val written = (body[i] as? OneRegisterInstruction)?.registerA
        body[i].opcode.setsRegister() && written != null && (written in needed || (body[i].opcode.setsWideRegister() && written + 1 in needed))
    }
    controlShape(spoiled.isEmpty(), "$updateType's branch changes a register its trailing moves read")

    val insertAt = cast + 1
    controlShape(insertAt < addAll, "$updateType's branch has no room for a hook")
    val tailStart = addAll + 1
    val live = method.liveAcrossInjection(insertAt, listOf(tailStart))
    val free = (0 until method.localRegisterCount()).filter { it !in live }
    val scratch = free.firstOrNull { it + 1 in free && it + 1 <= 255 }
    controlShape(scratch != null, "$updateType's branch has no two registers in a row that nothing reads afterwards")
    return DeleteBranch(hook, insertAt, update, tailStart, source, dest, scratch!!)
}
