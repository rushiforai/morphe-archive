/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.deleted

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableCapability
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.freeLocalsAt
import app.morphe.patches.telegram.misc.extension.liveAcrossInjection
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.extension.parameterRegisterNumber
import app.morphe.patches.telegram.misc.extension.patchLog
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.requireThisIntact
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.patches.telegram.misc.time.MESSAGE_TIME_SHOWN
import app.morphe.patches.telegram.misc.time.messageTimePatch
import app.morphe.patches.telegram.misc.time.timeFormatting
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.definitionReaches
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.iface.value.IntEncodedValue
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.util.names.TelegramNames
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origType
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy
import app.morphe.util.names.tgMutableClassDefByOrNull

internal const val KEEP_DELETED = "$EXTENSION_PACKAGE/misc/KeepDeleted;"
internal const val KEEP_EDITS = "$EXTENSION_PACKAGE/misc/KeepEdits;"
internal const val USER_EDIT = "Lorg/telegram/tgnet/tl/TL_update\$TL_updateEditMessage;"
internal const val CHANNEL_EDIT = "Lorg/telegram/tgnet/tl/TL_update\$TL_updateEditChannelMessage;"
internal const val MESSAGES_CONTROLLER = "Lorg/telegram/messenger/MessagesController;"
internal const val USER_DELETE = "Lorg/telegram/tgnet/tl/TL_update\$TL_updateDeleteMessages;"
internal const val CHANNEL_DELETE = "Lorg/telegram/tgnet/tl/TL_update\$TL_updateDeleteChannelMessages;"
internal const val USER_DELETE_MESSAGES = "$USER_DELETE->messages:Ljava/util/ArrayList;"
internal const val CHANNEL_DELETE_MESSAGES = "$CHANNEL_DELETE->messages:Ljava/util/ArrayList;"
internal const val ADD_ALL = "Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z"
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
private const val CHAR_SEQUENCE = "Ljava/lang/CharSequence;"
internal const val PAINTED = "$KEEP_DELETED->painted($CHAR_SEQUENCE)$CHAR_SEQUENCE"
private const val STATIC_LAYOUT = "Landroid/text/StaticLayout;-><init>($CHAR_SEQUENCE"

private val GOTOS = setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)
private val MOVE_OBJECTS = setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)
private val INVOKE_DIRECTS = setOf(Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE)

@Suppress("unused")
val keepDeletedPatch = bytecodePatch(
    name = "Keep deleted messages",
    description = "Keeps a message on your phone when someone else deletes it, and marks it deleted next to the time. " +
        "Your own deletes still work normally. Starts off. Turn it on in HushTelegram settings > Conversations.",
    default = true,
) {
    category("Conversations")
    dependsOn(settingsPatch, telegramExtensionPatch, messageTimePatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val plan = resolveKeepDeleted()
        val timed = resolveKeepTimedMedia()
        // Assembled on copies first, so a refusal leaves the app untouched.
        val measure = MutableMethod(ImmutableMethod.of(plan.measure))
        plan.applyTo(MutableMethod(ImmutableMethod.of(plan.updates)), MutableMethod(ImmutableMethod.of(plan.push)),
            measure, if (plan.start === plan.measure) measure else MutableMethod(ImmutableMethod.of(plan.start)))
        plan.applyTo(plan.updates, plan.push, plan.measure, plan.start)
        if (plan.red != null) {
            enableCapability("redDeletedLabel")
        } else {
            patchLog.warning("Keep deleted messages: ${plan.redMissing}. The patch goes on with the deleted label in the time's own color.")
        }
        if (plan.editsMissing == null) {
            enableCapability("keepEditHistory")
        } else {
            patchLog.warning("Keep deleted messages: ${plan.editsMissing}. The patch goes on without Keep edit history.")
        }
        if (timed.missing == null) {
            applyKeepTimedMedia(timed)
            enableCapability("keepTimedMedia")
        } else {
            patchLog.warning("Keep deleted messages: ${timed.missing}. The patch goes on without Keep view-once and timed media.")
        }
        enableStatus("keepDeleted")
    }
}

/** A hook in the update loop, where [insertAt] is the instruction it goes in front of. */
internal sealed interface LoopHook {
    val insertAt: Int
}

/** One of the two places the update loop collects deleted message IDs. */
internal class DeleteBranch(
    val hook: String,
    /** The instruction the hook goes in front of, just after the update is cast to its own type. */
    override val insertAt: Int,
    val update: Int,
    /** The first instruction after the IDs are added, which the loop carries on from. */
    val tailStart: Int,
    /** The register the loop's last move reads, and the one it writes: the collected IDs. */
    val source: Int,
    val dest: Int,
    /** Two registers in a row that nothing reads from here on. */
    val scratch: Int,
) : LoopHook

/** One of the two edit updates the update loop reads, with the hook right after its new message is read. */
internal class EditHook(
    val type: String,
    override val insertAt: Int,
    /** The register holding the edited message. */
    val message: Int,
    /** Two registers in a row that nothing reads from here on. */
    val scratch: Int,
) : LoopHook

internal class KeepDeletedPlan(
    val updates: MutableMethod,
    val branches: List<DeleteBranch>,
    val push: MutableMethod,
    val pushResult: Int,
    /** The push deletion takes the IDs last (13.2), so the hook is the overload that does too. */
    val pushIdsLast: Boolean,
    val measure: MutableMethod,
    /** Where the times are formatted and the extension is told the message: [measure] itself up to 13.1. */
    val start: MutableMethod,
    /** The register in [start] holding the message being measured. */
    val measuredMessage: Int,
    /** The bubble's own layout, which measures the time again when a message is marked. Not edited. */
    val layout: Method,
    /** Where the label goes red, or null with [redMissing] saying why this build can't. */
    val red: RedLabel?,
    val redMissing: String?,
    /** Where the update loop hands each edit over, empty with [editsMissing] saying why this build can't. */
    val edits: List<EditHook>,
    val editsMissing: String?,
) {
    /** Each hook goes in the method it was found for, the later one in the update loop first. */
    fun applyTo(updates: MutableMethod, push: MutableMethod, measure: MutableMethod, start: MutableMethod) {
        for (hook in (branches + edits).sortedByDescending { it.insertAt }) {
            if (hook is EditHook) {
                val a = hook.scratch
                updates.addInstructionsAtControlFlowLabel(
                    hook.insertAt,
                    """
                        move-object/from16 v$a, v${hook.message}
                        move-object/from16 v${a + 1}, p0
                        invoke-static/range {v$a .. v${a + 1}}, $KEEP_EDITS->edited($OBJECT$OBJECT)V
                    """.trimIndent(),
                )
                continue
            }
            val branch = hook as DeleteBranch
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
                invoke-static/range {v$first .. v${first + 5}}, $KEEP_DELETED->${pushHook(pushIdsLast)}
                move-result v$pushResult
                if-eqz v$pushResult, :hush_stock
                return-void
                :hush_stock
                nop
            """.trimIndent(),
        )
        if (red != null) {
            val self = measure.localRegisterCount()
            for (at in red.returns.sortedByDescending { it.index }) {
                measure.addInstructionsAtControlFlowLabel(
                    at.index,
                    """
                        move-object/from16 v${at.bubble}, v$self
                        iget-object v${at.text}, v${at.bubble}, ${red.field}
                        invoke-static {v${at.text}}, $PAINTED
                        move-result-object v${at.text}
                        iput-object v${at.text}, v${at.bubble}, ${red.field}
                    """.trimIndent(),
                )
            }
        }
        start.addInstructionsAtControlFlowLabel(
            0, "invoke-static/range {v$measuredMessage .. v$measuredMessage}, $KEEP_DELETED->measuring($OBJECT)V",
        )
    }
}

/** One return of the measuring, and two registers in v0 to v15 that nothing reads past it. */
internal class RedReturn(val index: Int, val bubble: Int, val text: Int)

/** The bubble's time text field, and each return of the measuring the label is painted in front of. */
internal class RedLabel(val field: String, val returns: List<RedReturn>)

/** Why this build can't have a part the patch goes on without: the red label, or the edit history. */
private class Unbuilt(why: String) : Exception(why)

private fun need(ok: Boolean, why: String) {
    if (!ok) throw Unbuilt(why)
}

/** The edited message's fields Keep edit history reads by name. */
private val EDIT_FIELDS = listOf(
    Triple(TL_MESSAGE, "id", "I"),
    Triple(TL_MESSAGE, "message", "Ljava/lang/String;"),
    Triple(TL_MESSAGE, "edit_date", "I"),
    Triple(TL_MESSAGE, "dialog_id", "J"),
)

/**
 * The update loop casts each edit update to its own type and reads the new message right away.
 * The hook goes after that read, so the extension gets the message before Telegram stores it. A
 * build where that can't be found keeps the rest of the patch, without the edit history.
 *
 * @return the two hooks, and null; or nothing and why there's none
 */
internal fun BytecodePatchContext.resolveEdits(updates: MutableMethod, branches: List<DeleteBranch>): Pair<List<EditHook>, String?> = try {
    Pair(editHooks(updates, branches), null)
} catch (missing: Unbuilt) {
    Pair(emptyList(), missing.message)
} catch (missing: PatchException) {
    Pair(emptyList(), missing.message)
}

private fun BytecodePatchContext.editHooks(updates: MutableMethod, branches: List<DeleteBranch>): List<EditHook> {
    for ((owner, name, type) in EDIT_FIELDS) {
        val cls = tgClassDefByOrNull(owner)
        need(cls != null && AccessFlags.PUBLIC.isSet(cls.accessFlags) && cls.fields.any {
            it.origName == name && it.origType == type && AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags)
        }, "$owner->$name is no longer a public field Keep edit history can read")
    }
    need(tgClassDefByOrNull(MESSAGE_OBJECT)?.methods?.any {
        it.origName == "getDialogId" && it.parameterTypes.joinToString("") == TL_MESSAGE && it.origReturnType == "J" &&
            AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags)
    } == true, "MessageObject no longer finds a message's chat for Keep edit history")
    val body = updates.controlBody()
    val flow = ControlFlow.of(updates)
    val hooks = listOf(USER_EDIT, CHANNEL_EDIT).map { type ->
        val field = "$type->message:$TL_MESSAGE"
        val reads = body.indices.filter { body[it].opcode == Opcode.IGET_OBJECT && body[it].controlRef() == field }
        need(reads.size == 1, "the update loop no longer reads $type's message once")
        val iget = reads.single()
        need(iget > 0 && body[iget - 1].opcode == Opcode.CHECK_CAST && body[iget - 1].controlRef() == type,
            "$type isn't cast right before its message is read")
        val insertAt = iget + 1
        need(insertAt < body.size && flow.normal.indices.none { it != iget && insertAt in flow.normal[it] },
            "something jumps past the read of $type's message")
        need(branches.none { insertAt in it.insertAt..it.tailStart }, "$type's message is read inside a deletion branch")
        val live = updates.liveAcrossInjection(insertAt)
        val free = (0 until updates.localRegisterCount()).filter { it !in live }
        val scratch = free.firstOrNull { it + 1 in free && it + 1 <= 255 }
        need(scratch != null, "the update loop has no two registers in a row free after $type's message is read")
        EditHook(type, insertAt, (body[iget] as TwoRegisterInstruction).registerA, scratch!!)
    }
    updates.requireThisIntact(PATCH, hooks.map { it.insertAt })
    return hooks
}

/**
 * The bubble keeps its finished time text in one CharSequence field of its own, which the measuring
 * builds and the bubble's layout draws, spans and all. The text goes to the extension right before
 * each return of the measuring, once nothing changes it again, and comes back with the label red.
 * Color leaves the measured width alone. A build where that can't be found keeps the label in the
 * time's own color, and the rest of the patch goes ahead.
 *
 * @return the plan, and null; or null and why there's none
 */
internal fun resolveRedLabel(bubble: ClassDef, measure: Method): Pair<RedLabel?, String?> = try {
    Pair(redLabel(bubble, measure), null)
} catch (missing: Unbuilt) {
    Pair(null, missing.message)
} catch (missing: PatchException) {
    Pair(null, missing.message)
}

private fun redLabel(bubble: ClassDef, measure: Method): RedLabel {
    val body = measure.controlBody()
    val written = body.filter { it.opcode == Opcode.IPUT_OBJECT }.mapNotNull { it.controlField() }
        .filter { it.origDefiningClass == bubble.origType && it.origType == CHAR_SEQUENCE }.map { it.toString() }.distinct()
    need(written.size == 1, "the message time measuring no longer keeps its time text in one field")
    val field = written.single()
    need(bubble.fields.any { it.toString() == field && !AccessFlags.STATIC.isSet(it.accessFlags) },
        "the time text isn't a field of the bubble itself")
    need(bubble.methods.any { m ->
        m.controlBody().let { code ->
            code.any { it.opcode == Opcode.IGET_OBJECT && it.controlRef() == field } &&
                code.any { it.opcode in INVOKE_DIRECTS && it.controlRef()?.startsWith(STATIC_LAYOUT) == true }
        }
    }, "the bubble no longer lays its time text out with its spans")
    val returns = body.indices.filter { body[it].opcode == Opcode.RETURN_VOID }
    need(returns.isNotEmpty(), "the message time measuring has no return")
    measure.requireThisIntact(PATCH, returns)
    return RedLabel(field, returns.map { at ->
        val (bubbleRegister, text) = measure.freeLocalsAt(PATCH, at, 2)
        RedReturn(at, bubbleRegister, text)
    })
}

/** What the extension reaches by name, with the class and member each one lives on. */
private class Api(val owner: String, val name: String, val parameters: String, val result: String, val static: Boolean = false,
    /** The same parameters as a build where R8 reordered them, which the extension also calls. */
    val reordered: String? = null)

/** The push deletion's parameters: dialog, IDs and channel, or with the IDs last where R8 moved them (13.2). */
private val PUSH_PARAMETERS = listOf("J", LIST, "J")
private val PUSH_PARAMETERS_IDS_LAST = listOf("J", "J", LIST)

/** The extension's push answer taking the push deletion's own parameter order, after the controller. */
internal fun pushHook(idsLast: Boolean) = if (idsLast) "pushIdsLast(${OBJECT}JJ$LIST)Z" else "push(${OBJECT}J${LIST}J)Z"

private const val BASE_CONTROLLER = "Lorg/telegram/messenger/BaseController;"
private const val STORAGE = "Lorg/telegram/messenger/MessagesStorage;"
private const val QUEUE = "Lorg/telegram/messenger/DispatchQueue;"
private const val DATABASE = "Lorg/telegram/SQLite/SQLiteDatabase;"
private const val CURSOR = "Lorg/telegram/SQLite/SQLiteCursor;"
private const val BUFFER = "Lorg/telegram/tgnet/NativeByteBuffer;"
private const val TL_MESSAGE = "Lorg/telegram/tgnet/TLRPC\$Message;"
private const val TL_MEDIA = "Lorg/telegram/tgnet/TLRPC\$MessageMedia;"
private const val TL_CHAT = "Lorg/telegram/tgnet/TLRPC\$Chat;"
private const val TL_PHOTO = "Lorg/telegram/tgnet/TLRPC\$Photo;"
private const val TL_PHOTO_SIZE = "Lorg/telegram/tgnet/TLRPC\$PhotoSize;"
private const val TL_DOCUMENT = "Lorg/telegram/tgnet/TLRPC\$Document;"
private const val FILE_LOADER = "Lorg/telegram/messenger/FileLoader;"
private const val IMAGE_LOCATION = "Lorg/telegram/messenger/ImageLocation;"
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
    Api(MESSAGES_CONTROLLER, "deleteMessagesByPush", "J${LIST}J", "V", reordered = "JJ$LIST"),
    Api(MESSAGES_CONTROLLER, "getChat", "Ljava/lang/Long;", TL_CHAT),
    Api(MESSAGES_CONTROLLER, "getInstance", "I", MESSAGES_CONTROLLER, static = true),
    Api(STORAGE, "getChat", "J", TL_CHAT),
    Api(CHAT_OBJECT, "isChannel", TL_CHAT, "Z", static = true),
    Api(STORAGE, "getStorageQueue", "", QUEUE),
    Api(STORAGE, "getDatabase", "", DATABASE),
    // R8 turned the queue's boolean answer into void in 13.2; the extension reads either.
    Api(QUEUE, "postRunnable", "Ljava/lang/Runnable;", "V"),
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
    // A kept photo or file downloads as it's kept (#2), the way Telegram's own download asks for it.
    Api(BASE_CONTROLLER, "getFileLoader", "", FILE_LOADER),
    Api(FILE_LOADER, "loadFile", "$IMAGE_LOCATION${OBJECT}Ljava/lang/String;II", "V"),
    Api(FILE_LOADER, "loadFile", "$TL_DOCUMENT${OBJECT}II", "V"),
    Api(IMAGE_LOCATION, "getForPhoto", "$TL_PHOTO_SIZE$TL_PHOTO", IMAGE_LOCATION, static = true),
    Api(IMAGE_LOCATION, "getForDocument", "$TL_PHOTO_SIZE$TL_DOCUMENT", IMAGE_LOCATION, static = true),
)

private val FIELDS = listOf(
    Triple(TL_MESSAGE, "out", "Z"),
    Triple(TL_MESSAGE, "ttl_period", "I"),
    Triple(TL_MESSAGE, "noforwards", "Z"),
    Triple(TL_MESSAGE, "media", TL_MEDIA),
    Triple(TL_MEDIA, "ttl_seconds", "I"),
    Triple(TL_MEDIA, "photo", TL_PHOTO),
    Triple(TL_MEDIA, "document", TL_DOCUMENT),
    Triple(TL_PHOTO, "sizes", LIST),
    Triple(TL_DOCUMENT, "size", "J"),
    Triple(TL_DOCUMENT, "thumbs", LIST),
    Triple(TL_CHAT, "noforwards", "Z"),
    Triple(USER_DELETE, "messages", LIST),
    Triple(CHANNEL_DELETE, "messages", LIST),
    Triple(CHANNEL_DELETE, "channel_id", "J"),
    Triple(MESSAGE_OBJECT, "currentAccount", "I"),
    Triple(MESSAGE_OBJECT, "forceUpdate", "Z"),
)

/**
 * Telegram's statics the extension reads by name: the per-account table, whose length is the account
 * slots since R8 folded MAX_ACCOUNT_COUNT away (13.2), and the replaced messages event.
 */
private val STATIC_FIELDS = listOf(
    Triple(USER_CONFIG, "Instance", "[$USER_CONFIG"),
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
        val owner = tgClassDefByOrNull(api.owner)
        controlShape(owner != null && AccessFlags.PUBLIC.isSet(owner.accessFlags) && owner.methods.any {
            // Parameter types by their source names: R8 renamed ImageLocation's class in 13.2.
            it.origName == api.name && it.origParameterTypes.joinToString("").let { p -> p == api.parameters || p == api.reordered } &&
                it.origReturnType == api.result &&
                AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) == api.static
        }, "${api.owner}->${api.name} is no longer a public method Keep deleted messages can call")
    }
    for ((owner, name, type) in FIELDS) {
        val cls = tgClassDefByOrNull(owner)
        controlShape(cls != null && AccessFlags.PUBLIC.isSet(cls.accessFlags) && cls.fields.any {
            it.origName == name && it.origType == type && AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags)
        }, "$owner->$name is no longer a public field Keep deleted messages can read")
    }
    for ((owner, name, type) in STATIC_FIELDS) {
        val cls = tgClassDefByOrNull(owner)
        controlShape(cls != null && AccessFlags.PUBLIC.isSet(cls.accessFlags) && cls.fields.any {
            it.origName == name && it.origType == type && AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags)
        }, "$owner->$name is no longer a public static field Keep deleted messages can read")
    }
    val storage = tgClassDefByOrNull(STORAGE)
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
    controlHook(KEEP_DELETED, "pushIdsLast", listOf(OBJECT, "J", "J", LIST), "Z")
    controlHook(KEEP_DELETED, "measuring", listOf(OBJECT), "V")
    controlHook(KEEP_DELETED, "labelled", listOf("Ljava/lang/String;"), "Ljava/lang/String;")
    controlHook(KEEP_DELETED, "painted", listOf(CHAR_SEQUENCE), CHAR_SEQUENCE)
    requireStatusMethod("redDeletedLabel")
    controlHook(KEEP_EDITS, "edited", listOf(OBJECT, OBJECT), "V")
    requireStatusMethod("keepEditHistory")
    requireTelegramNames()

    val controller = tgMutableClassDefByOrNull(MESSAGES_CONTROLLER)
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
    val (edits, editsMissing) = resolveEdits(updates, branches)

    // The push deletion, whose own entry the extension answers first.
    val push = controller.methods.filter { m ->
        m.origName == "deleteMessagesByPush" && m.parameterTypes.map(CharSequence::toString).let { it == PUSH_PARAMETERS || it == PUSH_PARAMETERS_IDS_LAST } &&
            m.origReturnType == "V" && !AccessFlags.STATIC.isSet(m.accessFlags)
    }.controlSingle("push deletion")
    val idsLast = push.parameterTypes.map(CharSequence::toString) == PUSH_PARAMETERS_IDS_LAST
    // It posts its work to the storage queue (13.2 reads the queue's field where the getter was), and
    // that work marks the messages deleted: a lambda of the controller's, or the runnable's own run()
    // where R8 moved the lambda's body into it (13.2).
    val pushBody = push.controlBody()
    val pushRefs = pushBody.mapNotNull { it.controlRef() }
    controlShape(("$STORAGE->getStorageQueue()$QUEUE" in pushRefs || "$STORAGE->storageQueue:$QUEUE" in pushRefs) &&
        ("$QUEUE->postRunnable(Ljava/lang/Runnable;)Z" in pushRefs || "$QUEUE->postRunnable(Ljava/lang/Runnable;)V" in pushRefs),
        "the push deletion no longer posts its work to the storage queue")
    val marks: (Method) -> Boolean = { m -> m.controlBody().any { it.controlRef()?.startsWith("$STORAGE->markMessagesAsDeleted(") == true } }
    val names = TelegramNames.of(this)
    val posted = pushBody.filter { it.opcode == Opcode.NEW_INSTANCE }
        .mapNotNull { ((it as ReferenceInstruction).reference as? TypeReference)?.type }
        .mapNotNull { tgClassDefByOrNull(names.origType(it)) }
    controlShape(controller.methods.any { m -> m.origName.startsWith("lambda\$deleteMessagesByPush\$") && marks(m) } ||
        posted.any { runnable -> runnable.methods.any { it.name == "run" && it.parameterTypes.isEmpty() && marks(it) } },
        "the push deletion no longer marks messages deleted in the storage")
    controlShape(push.localRegisterCount() >= 1, "the push deletion has no register for the answer")
    controlShape(ControlFlow.of(push).normal.none { 0 in it }, "something jumps back to the start of the push deletion")
    val pushResult = push.freeLocalsAt(PATCH, 0, 1, highest = 255).single()

    // The bubble's time formatting, found by what Message times with seconds left in it.
    val (type, format) = timeFormatting(MESSAGE_TIME_SHOWN)
    val bubble = tgMutableClassDefBy(type)
    val (measure, message) = if (format.origParameterTypes == listOf(MESSAGE_OBJECT) && format.origReturnType == "V" &&
        !AccessFlags.STATIC.isSet(format.accessFlags)) {
        format to format.parameterRegisterNumber(0)
    } else {
        measuringAround(bubble, format)
    }
    controlShape(ControlFlow.of(format).normal.none { 0 in it }, "something jumps back to the start of the message time formatting")
    val layout = requireRedraw(bubble, measure)
    val (red, redMissing) = resolveRedLabel(bubble, measure)
    return KeepDeletedPlan(updates, branches, push, pushResult, idsLast, measure, format, message, layout, red, redMissing,
        edits, editsMissing)
}

/**
 * 13.2: the bubble's measuring, `(MessageObject)V`, calls [format] once and hands it its own message
 * as one of two. A message preview elsewhere calls [format] too, so the extension is told the message
 * at the start of [format], from that parameter, and never keeps a measured bubble's message for it.
 *
 * @return the measuring, and the register in [format] that holds the message being measured
 */
private fun measuringAround(bubble: MutableClass, format: MutableMethod): Pair<MutableMethod, Int> {
    val calls: (Instruction) -> Boolean = { instruction ->
        ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.let {
            it.definingClass == format.definingClass && it.name == format.name && it.returnType == format.returnType &&
                it.parameterTypes.map(CharSequence::toString) == format.parameterTypes.map(CharSequence::toString)
        } == true
    }
    val measure = bubble.methods.filter { m ->
        m.origParameterTypes == listOf(MESSAGE_OBJECT) && m.origReturnType == "V" && !AccessFlags.STATIC.isSet(m.accessFlags) &&
            m.controlBody().any(calls)
    }.controlSingle("the message time measuring")
    val body = measure.controlBody()
    val call = body.indices.filter { calls(body[it]) }.controlSingle("the measuring's time formatting")
    val arguments = body[call].namedRegisters()
    val own = measure.parameterRegisterNumber(0)
    controlShape(body.none { it.opcode.setsRegister() && it.namedRegisters().firstOrNull().let { r -> r == own ||
        it.opcode.setsWideRegister() && r != null && r + 1 == own } }, "the message time measuring writes over its message")
    val flow = ControlFlow.of(measure)
    // The register a parameter goes in, counting `this` and the wide parameters in front of it.
    val static = AccessFlags.STATIC.isSet(format.accessFlags)
    val types = format.parameterTypes.map(CharSequence::toString)
    fun slot(index: Int) = (if (static) 0 else 1) + types.take(index).sumOf { if (it == "J" || it == "D") 2 else 1 }
    val holder = types.indices.filter { index ->
        val register = arguments.getOrNull(slot(index))
        format.origParameterTypes[index] == MESSAGE_OBJECT && register != null && (register == own || body.indices.any { at ->
            body[at].opcode in MOVE_OBJECTS && body[at].namedRegisters() == listOf(register, own) &&
                flow.definitionReaches(at, call, register)
        })
    }.controlSingle("the measured message in the time formatting")
    return measure to format.parameterRegisterNumber(holder)
}

/** A message's chat, read off the message (13.1) or, as 13.2 inlined it, off its stored message. */
internal val DIALOG_ID_READS = setOf("$MESSAGE_OBJECT->getDialogId()J", "$MESSAGE_OBJECT->getDialogId(Lorg/telegram/tgnet/TLRPC\$Message;)J")

private val CONSTS = setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST, Opcode.CONST_HIGH16)
private val ENDS = setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32, Opcode.THROW, Opcode.RETURN_VOID, Opcode.RETURN,
    Opcode.RETURN_WIDE, Opcode.RETURN_OBJECT)

/**
 * The value of NotificationCenter's event [name] where it's a constant, which R8 reads in place of
 * the field on 13.2; null where the event is counted out at startup.
 */
internal fun BytecodePatchContext.constantEvent(name: String): Int? =
    tgClassDefByOrNull(NOTIFICATION_CENTER)?.fields?.singleOrNull { it.origName == name }
        ?.takeIf { AccessFlags.STATIC.isSet(it.accessFlags) && AccessFlags.FINAL.isSet(it.accessFlags) }
        ?.let { (it.initialValue as? IntEncodedValue)?.value }

/**
 * Where Telegram's storage posts the replaced messages event after replacing a stored message, as
 * the method and the post's index, or null. 13.1 posts it from a lambda of the storage's. 13.2 moved
 * that body into a merged runnable that replaceMessageIfExists queues, which posts another to the UI
 * thread, and that one posts the event.
 */
internal fun BytecodePatchContext.storageReplacedPost(): Pair<Method, Int>? {
    val storage = tgClassDefByOrNull(STORAGE) ?: return null
    val event = constantEvent("replaceMessagesObjects")
    val names = TelegramNames.of(this)
    val candidates = storage.methods.filter { it.origName.startsWith(REPLACE_IF_EXISTS) && !AccessFlags.STATIC.isSet(it.accessFlags) }
        .toMutableList<Method>()
    var from: List<Method> = storage.methods.filter { it.origName == "replaceMessageIfExists" }
    repeat(2) {
        from = from.flatMap { m -> m.controlBody().filter { it.opcode == Opcode.NEW_INSTANCE } }
            .mapNotNull { ((it as ReferenceInstruction).reference as? TypeReference)?.type }.distinct()
            .mapNotNull { tgClassDefByOrNull(names.origType(it)) }
            .flatMap { runnable -> runnable.methods.filter { it.name == "run" && it.parameterTypes.isEmpty() && it.returnType == "V" } }
        candidates += from
    }
    for (method in candidates) {
        val body = method.controlBody()
        body.indices.firstOrNull { postsReplaced(body, it, event) }?.let { return method to it }
    }
    return null
}

/**
 * Whether [body] posts the replaced messages event at [post]: the event, the field or its
 * constant, is what the post is handed, and the chat is read in the same straight stretch.
 */
private fun postsReplaced(body: List<Instruction>, post: Int, event: Int?): Boolean {
    if (body[post].controlRef() != POST_NOTIFICATION) return false
    val id = body[post].namedRegisters().getOrNull(1) ?: return false
    val start = (post - 1 downTo 0).firstOrNull { body[it].opcode in ENDS }?.plus(1) ?: 0
    val stretch = start until post
    val set = stretch.lastOrNull { body[it].opcode.setsRegister() && body[it].namedRegisters().firstOrNull() == id } ?: return false
    val loaded = body[set].let { it.controlRef() == REPLACE_MESSAGES ||
        (event != null && it.opcode in CONSTS && (it as NarrowLiteralInstruction).narrowLiteral == event) }
    return loaded && stretch.any { body[it].controlRef() in DIALOG_ID_READS }
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
    controlShape(storageReplacedPost() != null, "Telegram's storage no longer tells the open chat that a message was replaced")
    val measured = "${measure.definingClass}->${measure.name}($MESSAGE_OBJECT)V"
    return bubble.methods.filter { m ->
        m.origParameterTypes.take(2) == listOf(MESSAGE_OBJECT, GROUPED_MESSAGES) && m.origReturnType == "V" &&
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
    val notifications = tgClassDefByOrNull(NOTIFICATIONS)
    val cleanups = notifications?.methods?.filter {
        it.origName == NOTIFICATION_CLEANUP && it.parameterTypes.size == 2 && it.parameterTypes[1].toString() == "Z" && it.origReturnType == "V"
    }.orEmpty()
    controlShape(notifications != null && AccessFlags.PUBLIC.isSet(notifications.accessFlags) && cleanups.size == 1 &&
        AccessFlags.PUBLIC.isSet(cleanups.single().accessFlags) && !AccessFlags.STATIC.isSet(cleanups.single().accessFlags),
        "Telegram's notification cleanup for deleted messages changed")
    val sparseType = cleanups.single().parameterTypes[0].toString()
    val sparse = tgClassDefByOrNull(sparseType)
    val puts = sparse?.methods?.filter {
        it.parameterTypes.map(CharSequence::toString) == listOf(OBJECT, "J") && it.origReturnType == "V" &&
            AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags)
    }.orEmpty()
    controlShape(sparse != null && AccessFlags.PUBLIC.isSet(sparse.accessFlags) && puts.size == 1 && sparse.methods.any {
        it.origName == "<init>" && it.parameterTypes.isEmpty() && AccessFlags.PUBLIC.isSet(it.accessFlags)
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
