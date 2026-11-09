/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.folders

import app.morphe.util.names.loadsInt
import app.morphe.util.names.addInstructions
import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.telegram.misc.chattypefolders.CLIENT_USER_ID
import app.morphe.patches.telegram.misc.chattypefolders.CONTROLLER_INSTANCE
import app.morphe.patches.telegram.misc.chattypefolders.LOCAL_FILTER
import app.morphe.patches.telegram.misc.chattypefolders.MESSAGES_CONTROLLER
import app.morphe.patches.telegram.misc.chattypefolders.SELECTED_ACCOUNT
import app.morphe.patches.telegram.misc.chattypefolders.STORAGE
import app.morphe.patches.telegram.misc.chattypefolders.USER_CONFIG
import app.morphe.patches.telegram.misc.chattypefolders.USER_CONFIG_INSTANCE
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.freeLocalsAt
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.patches.telegram.misc.localcontrols.requireReachable
import app.morphe.util.ControlFlow
import app.morphe.util.RegisterLiveness
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.definitionReaches
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.util.names.TelegramNames
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origSuperclass
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy
import app.morphe.util.names.tgMutableClassDefByOrNull

internal const val HIDDEN_CHATS = "$EXTENSION_PACKAGE/misc/HiddenChats;"
private const val HIDDEN_OBJECT = "Ljava/lang/Object;"
private const val HIDDEN_LIST = "Ljava/util/ArrayList;"
private const val SPARSE = "Landroid/util/SparseArray;"
internal const val BY_FOLDER = "$MESSAGES_CONTROLLER->dialogsByFolder:$SPARSE"
internal const val SELECTED_FILTERS = "$MESSAGES_CONTROLLER->selectedDialogFilter:[$LOCAL_FILTER"
internal const val FILTER_DIALOGS = "$LOCAL_FILTER->dialogs:$HIDDEN_LIST"
internal const val DIALOGS_FORWARD = "$MESSAGES_CONTROLLER->dialogsForward:$HIDDEN_LIST"
internal const val FILTER_FORWARD = "$LOCAL_FILTER->dialogsForward:$HIDDEN_LIST"
internal const val GET_ALL_DIALOGS = "$MESSAGES_CONTROLLER->getAllDialogs()$HIDDEN_LIST"
/** The field 13.2's R8 reads in place of the getAllDialogs() it inlined. */
internal const val ALL_DIALOGS_FIELD = "$MESSAGES_CONTROLLER->allDialogs:$HIDDEN_LIST"
/** The people Telegram suggests. Quick share is the one method that reads these and every chat. */
internal const val TOP_PEERS = "Lorg/telegram/messenger/MediaDataController;->hints:$HIDDEN_LIST"
private const val LIST_ADD_ALL = "$HIDDEN_LIST->addAll(Ljava/util/Collection;)Z"
internal const val SHARE_SHEET_CHATS = "$HIDDEN_CHATS->shareSheetChats($HIDDEN_LIST)$HIDDEN_LIST"
internal const val QUICK_SHARE_IDS = "$HIDDEN_CHATS->quickShareIds($HIDDEN_LIST)V"
internal const val DIALOG_ID = "Lorg/telegram/tgnet/TLRPC\$Dialog;->id:J"
internal const val GET_DIALOGS = "$MESSAGES_CONTROLLER->getDialogs(I)$HIDDEN_LIST"
internal const val PEER_NAME = "$MESSAGES_CONTROLLER->getPeerName(J)Ljava/lang/String;"
internal const val GET_USER_CONFIG = "Lorg/telegram/messenger/BaseController;->getUserConfig()$USER_CONFIG"
/**
 * Read by reflection when the switch recounts every signed-in account's folder tabs: its length is
 * the account slot count, since R8 folded MAX_ACCOUNT_COUNT away in 13.2.
 */
internal const val ACCOUNT_SLOTS = "$USER_CONFIG->Instance:[$USER_CONFIG"
private const val NOTIFICATIONS = "Lorg/telegram/messenger/NotificationCenter;"
internal const val NOTIFICATIONS_INSTANCE = "$NOTIFICATIONS->getInstance(I)$NOTIFICATIONS"
internal const val DIALOGS_NEED_RELOAD = "$NOTIFICATIONS->dialogsNeedReload:I"
internal const val POST_NOTIFICATION = "$NOTIFICATIONS->postNotificationName(I[Ljava/lang/Object;)V"
private const val SPARSE_SIZE = "$SPARSE->size()I"
private const val SPARSE_REMOVE = "$SPARSE->remove(I)V"
private val GOTOS = setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)

private const val REORDER_PINS = "Lorg/telegram/tgnet/TLRPC\$TL_messages_reorderPinnedDialogs;"
internal const val DIALOG_PINNED = "Lorg/telegram/tgnet/TLRPC\$Dialog;->pinned:Z"
internal const val DIALOG_PIN_NUM = "Lorg/telegram/tgnet/TLRPC\$Dialog;->pinnedNum:I"
internal const val PIN_ORDER = "$HIDDEN_CHATS->pinOrder(${HIDDEN_OBJECT}I$HIDDEN_OBJECT)$HIDDEN_OBJECT"
internal const val SERVER_PINS = "$HIDDEN_CHATS->serverPins(${HIDDEN_OBJECT}I$HIDDEN_OBJECT)V"
internal const val PIN_ROOM = "$HIDDEN_CHATS->pinRoom(I)I"
private const val DISPATCH_QUEUE = "Lorg/telegram/messenger/DispatchQueue;"
private const val BASE_CONTROLLER = "Lorg/telegram/messenger/BaseController;"
private const val GET_STORAGE = "$BASE_CONTROLLER->getMessagesStorage()$STORAGE"
/** Read only by the two pin checks and the controller's config, so it finds them. */
internal const val FOLDER_PIN_LIMIT = "$MESSAGES_CONTROLLER->maxFolderPinnedDialogsCountDefault:I"
/**
 * The limit's preference key, which only the config's save names. 13.2's R8 moved that save out of
 * the controller into a runnable of its own, where it reads the limit like a pin check would.
 */
private const val FOLDER_PIN_LIMIT_KEY = "maxFolderPinnedDialogsCountDefault"
/** What those checks read for the chat list itself. The archive's and the folder tabs' read is one shared branch, left alone. */
internal val MAIN_PIN_LIMITS = listOf("maxPinnedDialogsCountPremium", "maxPinnedDialogsCountDefault",
    "dialogFiltersPinnedLimitPremium", "dialogFiltersPinnedLimitDefault").map { "$MESSAGES_CONTROLLER->$it:I" }.toSet()

/** The call that hands the sorted lists to the extension: one instruction. */
internal const val HIDDEN_CHATS_SIZE = 1

/** The pinned order's swap: the call, its result and the cast back to Telegram's list. */
internal const val PIN_ORDER_SIZE = 3

/**
 * Where reorderPinnedDialogs has just read one folder's chats into [list]: [at] is the instruction
 * after the read, [controller] and [folder] the registers the read was handed.
 */
internal class PinOrderPlan(val method: MutableMethod, val at: Int, val controller: Int, val folder: Int, val list: Int)

/**
 * Where the answer to loadPinnedDialogs hands the storage the server's pins, and the registers the
 * extension takes there. 13.2 inlined unpinAllDialogsExceptNew: the answer builds [task], one of
 * the storage's merged queue tasks, with the server's ids and the folder, and posts it.
 */
internal class ServerPinsPlan(val method: MutableMethod, val controller: Int, val folder: Int, val ids: Int, val task: String) {
    /**
     * Where the call goes in [answer]: right after the storage is read, before its queue is. Looked
     * up when it's needed, since another hook can move it.
     */
    fun hookAt(answer: Method): Int = answer.controlBody().indexOfFirst { it.buildsUnpinTask(task) } - UNPIN_BUILT_AFTER
}

/** The query the unpin task runs: the pinned chats the server no longer names. */
internal const val UNPIN_QUERY = "SELECT did, folder_id FROM dialogs WHERE pinned > 0 AND did NOT IN ("
/** The unpin task's constructor: the storage, the server's ids and the folder. */
private val UNPIN_TASK_SHAPE = listOf(STORAGE, HIDDEN_LIST, "I")
/** The queue read and the new-instance come between the storage's result and the task's constructor. */
private const val UNPIN_BUILT_AFTER = 2

/** Whether [this] builds [task] the way the answer to loadPinnedDialogs does. */
internal fun Instruction.buildsUnpinTask(task: String): Boolean {
    val call = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return opcode == Opcode.INVOKE_DIRECT && call.definingClass == task && call.name == "<init>" && call.origParameterTypes == UNPIN_TASK_SHAPE
}

/** Each read of the chat list's own pin limit in [this], looked up the same way. */
internal fun Method.mainPinLimitReads(): List<Int> {
    val body = controlBody()
    return body.indices.filter { body[it].opcode == Opcode.IGET && body[it].controlRef() in MAIN_PIN_LIMITS }
}

/**
 * Where sortDialogs starts dropping the folders left empty, and where the pinned order reads its
 * folder's chats, found and checked before anything is edited, or [missing], why this build can't
 * hide chats.
 */
internal class HiddenChatsPlan(val sort: MutableMethod?, val at: Int, val controller: Int, val missing: String?, val pins: PinOrderPlan? = null,
    val serverPins: ServerPinsPlan? = null, val pinLimits: List<MutableMethod> = emptyList(), val pinGaps: List<String> = emptyList()) {
    fun apply(into: (MutableMethod) -> MutableMethod = { it }) {
        val method = sort?.let(into) ?: return
        val before = method.implementation!!.instructions.size
        // At a label: the paths that skip the forward list's own entry come in here too.
        method.addInstructionsAtControlFlowLabel(at,
            "invoke-static/range {v$controller .. v$controller}, $HIDDEN_CHATS->prune($HIDDEN_OBJECT)V")
        // smali drops an instruction it can't build and only logs it.
        hiddenFits(method.implementation!!.instructions.size - before == HIDDEN_CHATS_SIZE, "the hidden chats call didn't compile whole")
        val pin = pins ?: return
        val reorder = into(pin.method)
        val stock = reorder.implementation!!.instructions.count { it.opcode != Opcode.NOP }
        // Nothing jumps onto [at], so a plain insert runs on the read's only way on.
        reorder.addInstructions(pin.at, """
            invoke-static {v${pin.controller}, v${pin.folder}, v${pin.list}}, $PIN_ORDER
            move-result-object v${pin.list}
            check-cast v${pin.list}, $HIDDEN_LIST
        """)
        hiddenFits(reorder.implementation!!.instructions.count { it.opcode != Opcode.NOP } - stock == PIN_ORDER_SIZE,
            "the pinned order's swap didn't compile whole")
        serverPins?.let { plan ->
            val answer = into(plan.method)
            val untouched = answer.implementation!!.instructions.count { it.opcode != Opcode.NOP }
            // Between the storage read's result and the call: nothing jumps there, and the branch past Telegram's resort lands before the read.
            answer.addInstructions(plan.hookAt(answer), "invoke-static {v${plan.controller}, v${plan.folder}, v${plan.ids}}, $SERVER_PINS")
            hiddenFits(answer.implementation!!.instructions.count { it.opcode != Opcode.NOP } - untouched == 1, "the server's pins call didn't compile whole")
        }
        for (reader in pinLimits.map(into)) {
            val untouched = reader.implementation!!.instructions.count { it.opcode != Opcode.NOP }
            val reads = reader.mainPinLimitReads()
            // Last first, so the earlier index stays good. The read has just written over the controller, so the limit is all there is to hand on.
            for (read in reads.asReversed()) {
                val limit = (reader.controlBody()[read] as TwoRegisterInstruction).registerA
                reader.addInstructions(read + 1, """
                    invoke-static/range {v$limit .. v$limit}, $PIN_ROOM
                    move-result v$limit
                """)
            }
            hiddenFits(reader.implementation!!.instructions.count { it.opcode != Opcode.NOP } - untouched == reads.size * 2, "the pin limit's call didn't compile whole")
        }
    }

    /** The same edit on a copy, so a smali problem shows before the app is touched. */
    fun rehearse() = try {
        apply { MutableMethod(ImmutableMethod.of(it)) }
    } catch (failed: RuntimeException) {
        throw Unhidden("the hidden chats call doesn't compile (${failed.javaClass.simpleName}: ${failed.message})")
    }
}

/** The runtime the hook and the settings page call. It's the extension's own, so a change there refuses the patch. */
internal fun BytecodePatchContext.requireHiddenChatsRuntime() {
    requireStatusMethod("hiddenChats")
    controlHook(HIDDEN_CHATS, "prune", listOf(HIDDEN_OBJECT), "V")
    controlHook(HIDDEN_CHATS, "controllerUser", listOf(HIDDEN_OBJECT), "J")
    controlHook(HIDDEN_CHATS, "folders", listOf(HIDDEN_OBJECT), SPARSE)
    controlHook(HIDDEN_CHATS, "selectedFilters", listOf(HIDDEN_OBJECT), "[$HIDDEN_OBJECT")
    controlHook(HIDDEN_CHATS, "filterDialogs", listOf(HIDDEN_OBJECT), HIDDEN_LIST)
    controlHook(HIDDEN_CHATS, "forwardList", listOf(HIDDEN_OBJECT), HIDDEN_LIST)
    controlHook(HIDDEN_CHATS, "filterForward", listOf(HIDDEN_OBJECT), HIDDEN_LIST)
    controlHook(HIDDEN_CHATS, "shareSheetChats", listOf(HIDDEN_LIST), HIDDEN_LIST)
    controlHook(HIDDEN_CHATS, "quickShareIds", listOf(HIDDEN_LIST), "V")
    controlHook(HIDDEN_CHATS, "dialogId", listOf(HIDDEN_OBJECT), "J")
    controlHook(HIDDEN_CHATS, "pinOrder", listOf(HIDDEN_OBJECT, "I", HIDDEN_OBJECT), HIDDEN_OBJECT)
    controlHook(HIDDEN_CHATS, "serverPins", listOf(HIDDEN_OBJECT, "I", HIDDEN_OBJECT), "V")
    controlHook(HIDDEN_CHATS, "pinRoom", listOf("I"), "I")
    controlHook(HIDDEN_CHATS, "unpin", listOf(HIDDEN_OBJECT), "V")
    controlHook(HIDDEN_CHATS, "pinned", listOf(HIDDEN_OBJECT), "Z")
    controlHook(HIDDEN_CHATS, "pinnedNum", listOf(HIDDEN_OBJECT), "I")
    controlHook(HIDDEN_CHATS, "selectedAccount", emptyList(), "I")
    controlHook(HIDDEN_CHATS, "userId", listOf("I"), "J")
    controlHook(HIDDEN_CHATS, "dialogs", listOf("I", "I"), HIDDEN_LIST)
    controlHook(HIDDEN_CHATS, "peerName", listOf("I", "J"), "Ljava/lang/String;")
    controlHook(HIDDEN_CHATS, "resort", listOf("I"), "V")
    controlHook(HIDDEN_CHATS, "menuItem", listOf(HIDDEN_OBJECT, HIDDEN_OBJECT), "V")
    controlHook(HIDDEN_CHATS, "menuShown", listOf(HIDDEN_OBJECT), "V")
    controlHook(HIDDEN_CHATS, "menuChoice", listOf(HIDDEN_OBJECT, "I"), "I")
    controlHook(HIDDEN_CHATS, "addMenuItem", listOf(HIDDEN_OBJECT, "I", "I", "Ljava/lang/String;"), HIDDEN_OBJECT)
    controlHook(HIDDEN_CHATS, "selectedChats", listOf(HIDDEN_OBJECT), HIDDEN_LIST)
    requireStatusMethod("hiddenUnread")
    controlHook(HIDDEN_CHATS, "uncounted", listOf(HIDDEN_OBJECT, "J"), "Z")
    controlHook(HIDDEN_CHATS, "recount", listOf("I"), "V")
    controlHook(HIDDEN_CHATS, "onStorageThread", listOf("I", "Ljava/lang/Runnable;"), "V")
}

/** Why this build's chat list can't hide chats. */
private class Unhidden(why: String) : Exception(why)

private fun hiddenFits(ok: Boolean, why: String) {
    if (!ok) throw Unhidden(why)
}

/**
 * MessagesController.sortDialogs fills every folder's chat list, the archive's included, and the
 * folder tabs' lists, then walks the folders and drops the ones left empty. The hook goes right
 * before that walk starts, so the extension takes the hidden chats out of the full lists and a
 * folder holding only hidden chats goes with the empty ones. Anything else and the switch is left out.
 */
internal fun BytecodePatchContext.resolveHiddenChats(): HiddenChatsPlan = try {
    // Rehearsed here, so an edit that doesn't fit this build leaves the switch out rather than the patch.
    emptyFolderWalk().also { it.rehearse() }
} catch (unhidden: Unhidden) {
    HiddenChatsPlan(null, 0, 0, unhidden.message)
} catch (failed: RuntimeException) {
    // Code this build reads in a way nothing here expected, such as a branch the control flow can't follow.
    HiddenChatsPlan(null, 0, 0, "the chat sort can't be read (${failed.javaClass.simpleName}: ${failed.message})")
}

private fun BytecodePatchContext.emptyFolderWalk(): HiddenChatsPlan {
    val controller = tgMutableClassDefByOrNull(MESSAGES_CONTROLLER)
    val sorts = controller?.methods?.filter {
        it.origName == "sortDialogs" && it.origReturnType == "V" && it.parameterTypes.size == 1 && !AccessFlags.STATIC.isSet(it.accessFlags)
    }.orEmpty()
    hiddenFits(sorts.size == 1, "the chat sort is missing or ambiguous")
    val method = sorts.single()
    val body = method.controlBody()

    // The one remove the walk makes: dialogsByFolder.remove(key), on the field it just read.
    val removes = body.indices.filter { index ->
        val read = body.getOrNull(index - 1)
        body[index].opcode == Opcode.INVOKE_VIRTUAL && body[index].controlRef() == SPARSE_REMOVE &&
            read?.opcode == Opcode.IGET_OBJECT && read.controlRef() == BY_FOLDER &&
            body[index].namedRegisters().firstOrNull() == (read as TwoRegisterInstruction).registerA
    }
    hiddenFits(removes.size == 1, "the chat sort no longer drops empty folders the same way")
    val flow = try {
        ControlFlow.of(method)
    } catch (failed: IllegalArgumentException) {
        throw Unhidden("the chat sort can't be read (${failed.message})")
    }
    // Back to the walk's head, which reads dialogsByFolder and asks its size.
    val back = (removes.single() + 1 until body.size).firstOrNull { body[it].opcode in GOTOS }
    hiddenFits(back != null && flow.normal[back].size == 1, "the empty folder walk changed")
    val head = flow.normal[back!!].single()
    val readFolders = body[head] as? TwoRegisterInstruction
    hiddenFits(head in 1 until removes.single() && body[head].opcode == Opcode.IGET_OBJECT && body[head].controlRef() == BY_FOLDER &&
        body.getOrNull(head + 1)?.controlRef() == SPARSE_SIZE && body[head + 1].namedRegisters() == listOf(readFolders!!.registerA),
        "the empty folder walk changed")
    val self = readFolders!!.registerB
    // The walk's counter starts right before its head, and nothing but that start changes the controller's register on the way.
    val at = head - 1
    val start = body[at]
    hiddenFits(start.opcode in setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.MOVE, Opcode.MOVE_FROM16) &&
        (start as OneRegisterInstruction).registerA != self && flow.normal[at] == listOf(head),
        "the empty folder walk's start changed")
    // Only the start leads into the head from before it, so the call runs once for each sort.
    hiddenFits(flow.normal.withIndex().none { (index, next) -> head in next && index != at && index < head } &&
        flow.exceptional.none { head in it || at in it }, "something jumps into the empty folder walk")

    // Without the pinned order a hidden pinned chat would come unpinned everywhere, so it's both or neither.
    val pins = pinOrderRead()

    // Each of these only closes a small gap, so a build that moved one still hides chats and says what it lost.
    val gaps = mutableListOf<String>()
    val serverPins = try {
        serverPinsCall()
    } catch (gap: Unhidden) {
        gaps += gap.message.orEmpty()
        null
    }
    val pinLimits = try {
        pinLimitReaders()
    } catch (gap: Unhidden) {
        gaps += gap.message.orEmpty()
        emptyList()
    }

    for ((reference, static) in listOf(BY_FOLDER to false, SELECTED_FILTERS to false, FILTER_DIALOGS to false, DIALOGS_FORWARD to false,
        FILTER_FORWARD to false, DIALOG_ID to false,
        DIALOG_PINNED to false, DIALOG_PIN_NUM to false,
        GET_DIALOGS to false, PEER_NAME to false, GET_USER_CONFIG to false, CLIENT_USER_ID to false, SELECTED_ACCOUNT to true,
        USER_CONFIG_INSTANCE to true, ACCOUNT_SLOTS to true, CONTROLLER_INSTANCE to true, NOTIFICATIONS_INSTANCE to true,
        DIALOGS_NEED_RELOAD to true, POST_NOTIFICATION to false, method.toString() to false)) {
        try {
            requireReachable(reference, static)
        } catch (failed: PatchException) {
            throw Unhidden("$reference isn't reachable from the extension")
        }
    }
    return HiddenChatsPlan(method, at, self, null, pins, serverPins, pinLimits, gaps)
}

/**
 * The answer to loadPinnedDialogs unpins the pinned chats the sorted list holds and the server no
 * longer names, then hands the storage what the server named. The sorted list has no hidden chats,
 * so the extension gets the same list right before the unpin is queued and does the same for them.
 */
private fun BytecodePatchContext.serverPinsCall(): ServerPinsPlan {
    val tasks = mutableListOf<ClassDef>()
    forEachClassMentioning(Mention.string(UNPIN_QUERY)) { cls ->
        if (cls.methods.any { m -> m.controlBody().any { it.controlString() == UNPIN_QUERY } }) tasks += cls
    }
    hiddenFits(tasks.size == 1, "the server's pins are no longer unpinned in one place")
    val task = tasks.single()
    unpinCaseChecked(task)

    val answers = mutableListOf<Pair<ClassDef, Method>>()
    forEachClassMentioning(Mention.type(task.type)) { cls ->
        cls.methods.filter { m -> m.controlBody().any { it.buildsUnpinTask(task.type) } }.mapTo(answers) { cls to it }
    }
    hiddenFits(answers.size == 1, "the server's pins are no longer handled in one place")
    val (owner, found) = answers.single()
    val method = tgMutableClassDefBy(owner).methods.single { it.name == found.name &&
        it.parameterTypes.map(CharSequence::toString) == found.parameterTypes.map(CharSequence::toString) && it.returnType == found.returnType }
    val body = method.controlBody()
    hiddenFits(body.count { it.buildsUnpinTask(task.type) } == 1, "the server's pins are no longer handed over once")
    // getMessagesStorage, its result, the storage's queue, the task, the task built, then posted.
    val built = body.indexOfFirst { it.buildsUnpinTask(task.type) }
    val at = built - UNPIN_BUILT_AFTER
    val read = body.getOrNull(at - 2)
    val result = body.getOrNull(at - 1) as? OneRegisterInstruction
    val queue = body.getOrNull(at) as? TwoRegisterInstruction
    val made = body.getOrNull(at + 1) as? OneRegisterInstruction
    val handed = body[built].namedRegisters()
    val post = body.getOrNull(built + 1)
    hiddenFits(read?.opcode == Opcode.INVOKE_VIRTUAL && read.controlRef() == GET_STORAGE && read.namedRegisters().size == 1 &&
        result != null && body[at - 1].opcode == Opcode.MOVE_RESULT_OBJECT &&
        queue != null && body[at].opcode == Opcode.IGET_OBJECT && body[at].controlField()?.origDefiningClass == STORAGE &&
        body[at].controlField()?.origType == DISPATCH_QUEUE && queue.registerB == result.registerA &&
        made != null && body[at + 1].opcode == Opcode.NEW_INSTANCE && (body[at + 1] as ReferenceInstruction).reference.toString() == task.type &&
        handed.size == 4 && handed[0] == made.registerA && handed[1] == result.registerA &&
        post?.opcode == Opcode.INVOKE_VIRTUAL && post.controlRef() == TelegramNames.of(this).asRead(POST_RUNNABLE) &&
        post.namedRegisters() == listOf(queue.registerA, made.registerA), "the server's pins call changed")
    val controller = read!!.namedRegisters().single()
    val (_, storage, ids, folder) = handed
    // The ids and the folder hold what the task gets from the hook on: only the storage, its queue and the task are written on the way.
    hiddenFits(listOf(controller, storage, ids, folder).distinct().size == 4 && ids !in setOf(queue!!.registerA, made!!.registerA) &&
        folder !in setOf(queue.registerA, made.registerA) && listOf(controller, folder, ids).all { it in 0..15 },
        "the server's pins registers don't fit the call")
    val flow = try {
        ControlFlow.of(method)
    } catch (failed: IllegalArgumentException) {
        throw Unhidden("the server's pins can't be read (${failed.message})")
    }
    hiddenFits((at - 1..built + 1).all { index -> flow.normal.withIndex().none { (from, next) -> index in next && from != index - 1 } } &&
        flow.exceptional.none { next -> (at..built + 1).any { it in next } }, "something jumps into the server's pins call")
    return ServerPinsPlan(method, controller, folder, ids, task.type)
}

/**
 * R8 merged several of the storage's queue tasks into [task], which picks its work by a case the
 * constructor sets. Throws unless the constructor the answer uses picks the case that runs the
 * unpin query, and no other case reaches it.
 */
private fun unpinCaseChecked(task: ClassDef) {
    val inits = task.methods.filter { it.name == "<init>" && it.origParameterTypes == UNPIN_TASK_SHAPE }
    hiddenFits(inits.size == 1, "the unpin task's constructor is missing or ambiguous")
    val init = inits.single().controlBody()
    // The case: a constant the constructor stores in one of the task's int fields.
    val cases = init.indices.mapNotNull { index ->
        val store = init[index] as? TwoRegisterInstruction ?: return@mapNotNull null
        val field = init[index].controlField()
        if (init[index].opcode != Opcode.IPUT || field?.definingClass != task.type || field.type != "I") return@mapNotNull null
        val set = (index - 1 downTo 0).firstOrNull { (init[it] as? OneRegisterInstruction)?.registerA == store.registerA && init[it].opcode.setsRegister() }
        val literal = set?.let { init[it] as? NarrowLiteralInstruction }
        if (literal == null || init[set].opcode !in setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST)) null else field to literal.narrowLiteral
    }
    hiddenFits(cases.size == 1, "the unpin task no longer picks its case as it's built")
    val (caseField, case) = cases.single()
    val runs = task.methods.filter { it.name == "run" && it.parameterTypes.isEmpty() && it.returnType == "V" }
    hiddenFits(runs.size == 1, "the unpin task's run is missing")
    val run = runs.single()
    val body = run.controlBody()
    val switch = body.indexOfFirst { it.opcode == Opcode.PACKED_SWITCH || it.opcode == Opcode.SPARSE_SWITCH }
    val selector = body.getOrNull(switch - 1)
    hiddenFits(switch > 0 && selector?.opcode == Opcode.IGET && selector.controlField()?.toString() == caseField.toString() &&
        body[switch].namedRegisters() == listOf((selector as OneRegisterInstruction).registerA), "the unpin task no longer switches on its case")
    val address = IntArray(body.size + 1)
    for (index in body.indices) address[index + 1] = address[index] + body[index].codeUnits
    fun at(offset: Int) = body.indices.firstOrNull { address[it] == address[switch] + offset }
    val payload = at((body[switch] as OffsetInstruction).codeOffset)?.let { body[it] as? SwitchPayload }
    val starts = payload?.switchElements?.associate { it.key to at(it.offset) }
    val start = starts?.get(case)
    hiddenFits(start != null && starts.values.all { it != null }, "the unpin task's case is missing")
    val query = body.indices.filter { body[it].controlString() == UNPIN_QUERY }
    val flow = ControlFlow.of(run)
    fun reached(from: Int): Set<Int> {
        val seen = mutableSetOf<Int>()
        val pending = ArrayDeque(listOf(from))
        while (pending.isNotEmpty()) {
            val index = pending.removeFirst()
            if (seen.add(index)) pending.addAll(flow.normal[index] + flow.exceptional[index])
        }
        return seen
    }
    val others = starts!!.filterKeys { it != case }.values.filterNotNull() + (switch + 1)
    hiddenFits(query.size == 1 && query.single() in reached(start!!) && others.none { query.single() in reached(it) },
        "the unpin task's case no longer runs the unpin query alone")
}

/**
 * The two pickers that don't read the sorted forward list, or not only that: the share sheet walks
 * every chat, and quick share every chat plus the people Telegram suggests. Each is found and
 * checked alone, so a build that moved one still hides chats and says which picker lists them.
 */
internal class HiddenPickersPlan(val shareSheet: MutableMethod?, val quickShare: MutableMethod?, val gaps: List<String>) {
    fun apply(into: (MutableMethod) -> MutableMethod = { it }) {
        shareSheet?.let(into)?.let { sheet ->
            val past = sheet.allChatsReadEnd(sheet.allChatsRead())
            val chats = (sheet.controlBody()[past - 1] as OneRegisterInstruction).registerA
            // Past the read's result, on the only way on: the method has just read the forward list's first chat.
            sheet.addInstructions(past, """
                invoke-static/range {v$chats .. v$chats}, $SHARE_SHEET_CHATS
                move-result-object v$chats
            """)
        }
        quickShare?.let(into)?.let { quick ->
            val added = quick.idsAdded()
            val ids = quick.controlBody()[added].namedRegisters().first()
            quick.addInstructions(added + 1, "invoke-static/range {v$ids .. v$ids}, $QUICK_SHARE_IDS")
        }
    }
}

/** The read of every chat in [this], looked up when it's needed, since another hook can move it. */
internal fun Method.allChatsRead(): Int = controlBody().indexOfFirst { it.isAllChatsRead() }

/** A call of getAllDialogs(), or in 13.2 a read of the field it returned. */
internal fun Instruction.isAllChatsRead() = (opcode == Opcode.INVOKE_VIRTUAL && controlRef() == GET_ALL_DIALOGS) ||
    (opcode == Opcode.IGET_OBJECT && controlRef() == ALL_DIALOGS_FIELD)

/** Right past the read at [read] and its result: after the move-result of a call, after a field read itself. */
internal fun Method.allChatsReadEnd(read: Int): Int = if (controlBody()[read].opcode == Opcode.IGET_OBJECT) read + 1 else read + 2

/** Where the archive's ids join the rest in [this], the last addition to quick share's list. */
internal fun Method.idsAdded(): Int = controlBody().indexOfFirst { it.opcode == Opcode.INVOKE_VIRTUAL && it.controlRef() == LIST_ADD_ALL }

internal fun BytecodePatchContext.resolveHiddenPickers(): HiddenPickersPlan {
    val gaps = mutableListOf<String>()
    val sheet = try {
        val method = oneMethodReading(DIALOGS_FORWARD, "the share sheet")
        val body = method.controlBody()
        val read = method.allChatsRead()
        hiddenFits(body.count { it.controlRef() == GET_ALL_DIALOGS || it.controlRef() == ALL_DIALOGS_FIELD } == 1 &&
            (body[read].opcode == Opcode.IGET_OBJECT || body.getOrNull(read + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT),
            "the share sheet's read of every chat changed")
        nothingJumpsTo(method, method.allChatsReadEnd(read), "the share sheet's read of every chat")
        method
    } catch (gap: Unhidden) {
        gaps += gap.message.orEmpty()
        null
    }
    val quick = try {
        val method = oneMethodReading(TOP_PEERS, "quick share")
        val body = method.controlBody()
        val added = method.idsAdded()
        hiddenFits(body.count { it.controlRef() == LIST_ADD_ALL } == 1 && added > method.allChatsRead() &&
            body.getOrNull(added + 1)?.opcode !in setOf(Opcode.MOVE_RESULT, null), "quick share's list changed")
        nothingJumpsTo(method, added + 1, "quick share's list")
        method
    } catch (gap: Unhidden) {
        gaps += gap.message.orEmpty()
        null
    }
    return HiddenPickersPlan(sheet, quick, gaps)
}

/** The one method outside the controller that reads [first] and every chat. */
private fun BytecodePatchContext.oneMethodReading(first: String, what: String): MutableMethod {
    val readers = mutableListOf<Pair<String, String>>()
    val mentions = Mention.reference(first) and (Mention.reference(GET_ALL_DIALOGS) or Mention.reference(ALL_DIALOGS_FIELD))
    forEachClassMentioning(mentions) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/") || cls.origType == MESSAGES_CONTROLLER) return@forEachClassMentioning
        cls.methods.filter { m ->
            val body = m.controlBody()
            body.any { it.controlRef() == first } && body.any { it.isAllChatsRead() }
        }.forEach { readers += cls.type to it.toString() }
    }
    hiddenFits(readers.size == 1, "$what is no longer one method")
    val (type, method) = readers.single()
    return tgMutableClassDefBy(type).methods.single { it.toString() == method }
}

private fun nothingJumpsTo(method: Method, at: Int, what: String) {
    val flow = try {
        ControlFlow.of(method)
    } catch (failed: IllegalArgumentException) {
        throw Unhidden("$what can't be read (${failed.message})")
    }
    hiddenFits(flow.normal.withIndex().none { (index, next) -> at in next && index != at - 1 } && flow.exceptional.none { at in it },
        "something jumps into $what")
}

/**
 * The two pin checks, the long press menu's and the pin action's, compare the pins in the list on
 * screen with a limit each reads in its own branch for the chat list. Those branches only run with
 * no folder tab open, so the limit is the only thing that has to change.
 */
private fun BytecodePatchContext.pinLimitReaders(): List<MutableMethod> {
    val readers = mutableListOf<Pair<String, String>>()
    forEachClassMentioning(Mention.allReferences(listOf(FOLDER_PIN_LIMIT))) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/") || cls.origType == MESSAGES_CONTROLLER) return@forEachClassMentioning
        cls.methods.filter { m ->
            val body = m.controlBody()
            body.any { it.opcode == Opcode.IGET && it.controlRef() == FOLDER_PIN_LIMIT } && body.none { it.controlString() == FOLDER_PIN_LIMIT_KEY }
        }.forEach { readers += cls.type to it.toString() }
    }
    hiddenFits(readers.size == 2, "the pin checks are no longer two")
    return readers.map { (type, method) ->
        val reader = tgMutableClassDefBy(type).methods.single { it.toString() == method }
        hiddenFits(reader.mainPinLimitReads().size == 2, "a pin check's limit reads changed")
        reader
    }
}

/**
 * MessagesController.reorderPinnedDialogs sends the server, as the whole pinned order, the pinned
 * chats in the list getDialogs(folder) hands it, which the sort left the hidden ones out of. The
 * swap goes right after that read, the method's only one.
 */
private fun BytecodePatchContext.pinOrderRead(): PinOrderPlan {
    val methods = tgMutableClassDefBy(MESSAGES_CONTROLLER).methods.filter { m ->
        !AccessFlags.STATIC.isSet(m.accessFlags) && m.origReturnType == "V" &&
            m.controlBody().any { it.opcode == Opcode.NEW_INSTANCE && it.controlRef() == REORDER_PINS }
    }
    hiddenFits(methods.size == 1, "the pinned order is missing or ambiguous")
    val method = methods.single()
    val body = method.controlBody()
    val reads = body.indices.filter { body[it].opcode == Opcode.INVOKE_VIRTUAL && body[it].controlRef() == GET_DIALOGS }
    hiddenFits(reads.size == 1, "the pinned order no longer reads one folder's chats")
    val read = reads.single()
    val handed = body[read].namedRegisters()
    val result = body.getOrNull(read + 1)
    hiddenFits(handed.size == 2 && result?.opcode == Opcode.MOVE_RESULT_OBJECT, "the pinned order's chat read changed")
    val list = (result as OneRegisterInstruction).registerA
    // The read's registers still hold the controller and the folder after it, and fit the call's 4-bit form.
    hiddenFits(list !in handed && (handed + list).all { it in 0..15 }, "the pinned order's registers don't fit the swap")
    val at = read + 2
    val flow = try {
        ControlFlow.of(method)
    } catch (failed: IllegalArgumentException) {
        throw Unhidden("the pinned order can't be read (${failed.message})")
    }
    hiddenFits(at < body.size && flow.normal.withIndex().none { (index, next) -> at in next && index != read + 1 } &&
        flow.exceptional.none { at in it }, "something jumps into the pinned order's chat read")
    return PinOrderPlan(method, at, handed[0], handed[1], list)
}

internal const val UNCOUNTED = "$HIDDEN_CHATS->uncounted(${HIDDEN_OBJECT}J)Z"
internal const val STORAGE_INSTANCE = "$STORAGE->getInstance(I)$STORAGE"
internal const val RECOUNT = "$STORAGE->resetAllUnreadCounters(Z)V"
internal const val STORAGE_QUEUE = "$STORAGE->getStorageQueue()Lorg/telegram/messenger/DispatchQueue;"
internal const val POST_RUNNABLE = "Lorg/telegram/messenger/DispatchQueue;->postRunnable(Ljava/lang/Runnable;)Z"
private const val CURSOR = "Lorg/telegram/SQLite/SQLiteCursor;"
private const val QUERY = "Lorg/telegram/SQLite/SQLiteDatabase;->queryFinalized(Ljava/lang/String;[Ljava/lang/Object;)$CURSOR"
private const val CURSOR_NEXT = "$CURSOR->next()Z"
private const val CURSOR_LONG = "$CURSOR->longValue(I)J"
private const val UNREAD_ROWS = "SELECT did, folder_id, unread_count, unread_count_i FROM dialogs"
private const val SPARSE_COUNTS = "Lorg/telegram/messenger/support/LongSparseIntArray;"
private const val KEY_AT = "$SPARSE_COUNTS->keyAt(I)J"
private const val VALUE_AT = "$SPARSE_COUNTS->valueAt(I)I"
private const val WITH_UNREAD = "$STORAGE->dialogsWithUnread:"
private val MOVE_OBJECTS = setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)
private val COPIES = MOVE_OBJECTS + setOf(Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.MOVE_16)
private val COUNT_TESTS = setOf(Opcode.IF_EQ, Opcode.IF_NE, Opcode.IF_LT, Opcode.IF_GE, Opcode.IF_GT, Opcode.IF_LE,
    Opcode.IF_EQZ, Opcode.IF_NEZ, Opcode.IF_LTZ, Opcode.IF_GEZ, Opcode.IF_GTZ, Opcode.IF_LEZ)

/** A chat's skip: the hook, its answer and the jump past the count. */
internal const val UNCOUNTED_SIZE = 3

/**
 * Where one of MessagesStorage's unread counts has just read a chat's id into [chat] and [chat]+1:
 * a hidden chat goes on at [to] instead of [at]. [storage] holds the MessagesStorage there and
 * [scratch] is free to take the hook's answer.
 */
internal class CountSkip(val method: MutableMethod, val at: Int, val to: Int, val storage: Int, val chat: Int, val scratch: Int)

/**
 * The skips in calcUnreadCounters and updateFiltersReadCounter, found and checked before anything
 * is edited, or [missing], why this build's unread counts can't leave the hidden chats out.
 */
internal class UnreadCountsPlan(val skips: List<CountSkip>, val missing: String?) {
    fun apply(into: (MutableMethod) -> MutableMethod = { it }) {
        for (skip in skips) {
            val method = into(skip.method)
            val stock = method.implementation!!.instructions.count { it.opcode != Opcode.NOP }
            // Nothing but the read jumps onto [at], so every chat the count reads is asked about.
            method.addInstructionsWithLabels(skip.at, """
                invoke-static {v${skip.storage}, v${skip.chat}, v${skip.chat + 1}}, $UNCOUNTED
                move-result v${skip.scratch}
                if-nez v${skip.scratch}, :hush_uncounted
            """, ExternalLabel("hush_uncounted", method.getInstruction(skip.to)))
            // smali drops an instruction it can't build and only logs it.
            hiddenFits(method.implementation!!.instructions.count { it.opcode != Opcode.NOP } - stock == UNCOUNTED_SIZE,
                "the unread count's skip didn't compile whole")
        }
    }

    /** The same edits on copies, so a smali problem shows before the app is touched. */
    fun rehearse() = try {
        apply { MutableMethod(ImmutableMethod.of(it)) }
    } catch (failed: RuntimeException) {
        throw Unhidden("the unread count's skip doesn't compile (${failed.javaClass.simpleName}: ${failed.message})")
    }
}

/**
 * MessagesStorage keeps the unread counts of the folder tabs, All Chats and the archive in two
 * places. calcUnreadCounters rebuilds them from a walk over the unread chats in the database, and a
 * hidden chat goes on to the walk's next row. updateFiltersReadCounter adds or drops the chats whose
 * unread state changed, and a hidden chat takes the way of one whose count didn't change. Both skips
 * or neither, and anything else leaves the hidden chats in the counts.
 */
internal fun BytecodePatchContext.resolveUnreadCounts(): UnreadCountsPlan = try {
    UnreadCountsPlan(listOf(unreadRowSkip(), readChangeSkip()), null).also {
        // The hook hands controllerUser this MessagesStorage, and the settings page's recount reaches it by account.
        hiddenFits(tgMutableClassDefBy(STORAGE).origSuperclass == BASE_CONTROLLER, "MessagesStorage no longer reads its account the same way")
        for ((reference, static) in listOf(STORAGE_INSTANCE to true, RECOUNT to false, STORAGE_QUEUE to false, POST_RUNNABLE to false)) {
            try {
                requireReachable(reference, static)
            } catch (failed: PatchException) {
                throw Unhidden("$reference isn't reachable from the extension")
            }
        }
        it.rehearse()
    }
} catch (unhidden: Unhidden) {
    UnreadCountsPlan(emptyList(), unhidden.message)
} catch (failed: RuntimeException) {
    UnreadCountsPlan(emptyList(), "the unread counts can't be read (${failed.javaClass.simpleName}: ${failed.message})")
}

private fun BytecodePatchContext.storageMethod(name: String, parameters: List<String>): MutableMethod {
    val found = tgMutableClassDefByOrNull(STORAGE)?.methods?.filter {
        it.origName == name && it.origReturnType == "V" && !AccessFlags.STATIC.isSet(it.accessFlags) &&
            it.parameterTypes.map(CharSequence::toString) == parameters
    }.orEmpty()
    hiddenFits(found.size == 1, "MessagesStorage.$name is missing or ambiguous")
    return found.single()
}

private fun flowOf(method: MutableMethod) = try {
    ControlFlow.of(method)
} catch (failed: IllegalArgumentException) {
    throw Unhidden("the unread counts can't be read (${failed.message})")
}

/** calcUnreadCounters' walk: the unread chats' query, its cursor's next row, and the chat's id from that row. */
private fun BytecodePatchContext.unreadRowSkip(): CountSkip {
    val method = storageMethod("calcUnreadCounters", listOf("Z"))
    val body = method.controlBody()
    val queries = body.indices.filter { body[it].opcode == Opcode.CONST_STRING && body[it].controlString()?.startsWith(UNREAD_ROWS) == true }
    hiddenFits(queries.size == 1, "the unread count's query is missing or ambiguous")
    val query = queries.single()
    val run = (query + 1 until body.size).firstOrNull { body[it].opcode == Opcode.INVOKE_VIRTUAL }
    hiddenFits(run != null && body[run].controlRef() == QUERY && body[run].namedRegisters().getOrNull(1) == (body[query] as OneRegisterInstruction).registerA &&
        body.getOrNull(run + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT, "the unread count's query changed")
    val cursor = (body[run!! + 1] as OneRegisterInstruction).registerA
    val head = run + 2
    hiddenFits(body.getOrNull(head)?.opcode == Opcode.INVOKE_VIRTUAL && body[head].controlRef() == CURSOR_NEXT &&
        body[head].namedRegisters() == listOf(cursor), "the unread count's row walk changed")
    // The row's chat id, the walk's one long column, read before anything else of the row's is counted.
    val read = (head + 1 until body.size).firstOrNull { body[it].controlRef() == CURSOR_LONG }
    hiddenFits(read != null && body[read].opcode == Opcode.INVOKE_VIRTUAL && body[read].namedRegisters().firstOrNull() == cursor &&
        body.getOrNull(read + 1)?.opcode == Opcode.MOVE_RESULT_WIDE, "the unread count's chat read changed")
    val chat = (body[read!! + 1] as OneRegisterInstruction).registerA
    val at = read + 2
    val flow = flowOf(method)
    // The head is the walk's: later code comes back to it for the next row.
    hiddenFits(flow.normal.withIndex().any { (index, next) -> index > at && head in next }, "the unread count's row walk changed")
    // Back at the head, the walk reads nothing the row's start wrote, so the next row starts as it would have.
    val live = RegisterLiveness.of(method).liveInto(head)
    hiddenFits((head until at).none { index -> live.any { body[index].writesRegister(it) } },
        "the unread count's row walk keeps a register its start writes")
    return countSkip(method, flow, at, head, chat)
}

/**
 * updateFiltersReadCounter: the changed chat's id, read right before the split between a chat just
 * read and one with new messages. A hidden chat goes on the way a chat whose count didn't change
 * does, past everything the method adds to or takes from the counts.
 */
private fun BytecodePatchContext.readChangeSkip(): CountSkip {
    val method = storageMethod("updateFiltersReadCounter", listOf(SPARSE_COUNTS, SPARSE_COUNTS, "Z"))
    val body = method.controlBody()
    val read = method.localRegisterCount() + 3
    val splits = body.indices.filter { index ->
        index >= 2 && body[index - 2].opcode == Opcode.INVOKE_VIRTUAL && body[index - 2].controlRef() == KEY_AT &&
            body[index - 1].opcode == Opcode.MOVE_RESULT_WIDE && body[index].opcode == Opcode.IF_EQZ && body[index].namedRegisters() == listOf(read)
    }
    hiddenFits(splits.size == 1, "the read counter's split is missing or ambiguous")
    val at = splits.single()
    val chat = (body[at - 1] as OneRegisterInstruction).registerA
    // The read side's first step takes the chat out of dialogsWithUnread (or dialogsWithMentions).
    val side = at + 1
    val take = body.getOrNull(side + 1)
    val drop = body.getOrNull(side + 2)
    val unread = take?.controlField()
    hiddenFits(body.getOrNull(side)?.opcode == Opcode.IF_NEZ && take?.opcode == Opcode.IGET_OBJECT && unread != null &&
        take.controlRef()!!.startsWith(WITH_UNREAD) && drop?.opcode == Opcode.INVOKE_VIRTUAL &&
        drop.namedRegisters() == listOf((take as TwoRegisterInstruction).registerA, chat, chat + 1) &&
        drop.controlRef()!!.let { it.startsWith("${unread.type}->") && it.endsWith("(J)V") },
        "the read counter's read side changed")
    // A changed chat's way starts by keeping a register the id is about to overwrite.
    val copy = at - 3
    val kept = body.getOrNull(copy)?.namedRegisters().orEmpty()
    hiddenFits(copy >= 0 && body[copy].opcode in COPIES && kept.size == 2 && kept[1] in listOf(chat, chat + 1) && kept[0] !in listOf(chat, chat + 1),
        "the read counter's changed chat no longer starts the same way")
    val value = (copy - 1 downTo 0).firstOrNull { body[it].controlRef() == VALUE_AT }
    hiddenFits(value != null && body[value].opcode == Opcode.INVOKE_VIRTUAL && body.getOrNull(value + 1)?.opcode == Opcode.MOVE_RESULT,
        "the read counter's count read changed")
    val counted = value!! + 1
    val count = (body[counted] as OneRegisterInstruction).registerA
    val flow = flowOf(method)
    // The unchanged chat's way, where a test of the count goes: the same copy, then on to the next chat.
    val unchanged = body.indices.filter { index ->
        index != copy && body[index].opcode == body[copy].opcode && body[index].namedRegisters() == kept &&
            (counted until copy).any { body[it].opcode in COUNT_TESTS && count in body[it].namedRegisters() && index in flow.normal[it] }
    }
    hiddenFits(unchanged.size == 1, "the read counter's unchanged chat is missing or ambiguous")
    val to = unchanged.single() + 1
    // Past the copy, that way reads nothing a changed chat's start leaves different.
    val live = RegisterLiveness.of(method).liveInto(to)
    hiddenFits(chat !in live && chat + 1 !in live && flow.definitionReaches(counted, copy, kept[1]) &&
        flow.definitionReaches(counted, unchanged.single(), kept[1]) &&
        (live - kept[0]).all { flow.definitionReaches(counted, to, it) && flow.definitionReaches(counted, at, it) },
        "the read counter's next chat keeps a register a changed chat writes")
    return countSkip(method, flow, at, to, chat).also {
        hiddenFits((take as TwoRegisterInstruction).registerB == it.storage, "the read counter's storage register changed")
    }
}

private fun countSkip(method: MutableMethod, flow: ControlFlow, at: Int, to: Int, chat: Int): CountSkip {
    hiddenFits(flow.normal.withIndex().none { (index, next) -> at in next && index != at - 1 } && flow.exceptional.none { at in it },
        "something jumps into the unread count's chat read")
    // `this`, as the method's first instruction copies it or as it came, still the same at the skip.
    val self = method.localRegisterCount()
    val first = method.controlBody().first()
    val copy = first.namedRegisters()
    val storage = if (first.opcode in MOVE_OBJECTS && copy.size == 2 && copy[1] == self) copy[0] else self
    hiddenFits(flow.definitionReaches(0, at, storage), "the unread count's storage register changed")
    // The hook's 4-bit form.
    hiddenFits(storage in 0..15 && chat in 0..14 && storage != chat && storage != chat + 1, "the unread count's registers don't fit the skip")
    val scratch = try {
        method.freeLocalsAt("the unread count's skip", at, 1, listOf(to), highest = 255).single()
    } catch (failed: PatchException) {
        throw Unhidden(failed.message ?: "the unread count's skip has no free register")
    }
    hiddenFits(scratch != storage && scratch != chat && scratch != chat + 1, "the unread count's skip has no free register")
    return CountSkip(method, at, to, storage, chat, scratch)
}

internal const val MENU_ITEM = "$HIDDEN_CHATS->menuItem($HIDDEN_OBJECT$HIDDEN_OBJECT)V"
internal const val MENU_SHOWN = "$HIDDEN_CHATS->menuShown($HIDDEN_OBJECT)V"
internal const val MENU_CHOICE = "$HIDDEN_CHATS->menuChoice(${HIDDEN_OBJECT}I)I"
private const val BLOCK_ICON = "Lorg/telegram/messenger/R\$drawable;->msg_block:I"
private const val BLOCK_LABEL = "Lorg/telegram/messenger/R\$string;->BlockUser:I"
private const val LIST_SIZE = "$HIDDEN_LIST->size()I"
/** addSubItem(id, icon, text): 13.2's R8 folded the String overload into the CharSequence one. */
private val SUB_ITEM_TAKES = listOf("(IILjava/lang/String;)", "(IILjava/lang/CharSequence;)")
private val CONSTS = setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST)

/** DialogsActivity's long press menu ids: block, then pin2, add_to_folder and remove_from_folder in the more menu. */
private const val BLOCK_ID = 0x6aL
private val MORE_IDS = listOf(BLOCK_ID, 0x6cL, 0x6dL, 0x6eL)

/** What the long press item's stubs reach in this build, each a field or method reference. */
internal class HideMenuRefs(
    /** ActionBarMenuItem.addSubItem(id, icon, text). */
    val addSubItem: String,
    /** The action bar click handler's chat list. */
    val listener: String,
    /** DialogsActivity.selectedDialogs, the chat ids a long press picked. */
    val selected: String,
)

/**
 * Where the long press menu gets Hide from chat list: [create] right after its Block item, with
 * the chat list in [list] and the more menu in [more]; the start of [counters], which runs on each
 * change of selection; and the start of the action bar's [click] handler. Or [missing], why this
 * build's menu can't take it.
 */
internal class HideMenuPlan(
    val create: MutableMethod?, val at: Int, val list: Int, val more: Int,
    val counters: MutableMethod?, val click: MutableMethod?,
    val refs: HideMenuRefs?, val missing: String?,
) {
    fun apply(into: (MutableMethod) -> MutableMethod = { it }) {
        val create = create?.let(into) ?: return
        val counters = into(counters!!)
        val click = into(click!!)
        // Nothing jumps onto [at], so a plain insert runs on the Block item's only way on.
        edit(create, "the long press item", 1) {
            it.addInstructions(at, "invoke-static {v$list, v$more}, $MENU_ITEM")
        }
        // At the start, where nothing jumps back to and the receiver and id are still their own registers.
        val counted = counters.localRegisterCount()
        edit(counters, "the long press item's visibility", 1) {
            it.addInstructions(0, "invoke-static/range {v$counted .. v$counted}, $MENU_SHOWN")
        }
        val self = click.localRegisterCount()
        edit(click, "the long press item's tap", 2) {
            it.addInstructions(0, """
                invoke-static/range {v$self .. v${self + 1}}, $MENU_CHOICE
                move-result v${self + 1}
            """)
        }
    }

    private fun edit(method: MutableMethod, what: String, size: Int, change: (MutableMethod) -> Unit) {
        val stock = method.implementation!!.instructions.count { it.opcode != Opcode.NOP }
        change(method)
        // smali drops an instruction it can't build and only logs it.
        hiddenFits(method.implementation!!.instructions.count { it.opcode != Opcode.NOP } - stock == size, "$what didn't compile whole")
    }

    /** The same edits on copies, so a smali problem shows before the app is touched. */
    fun rehearse() = try {
        apply { MutableMethod(ImmutableMethod.of(it)) }
    } catch (failed: RuntimeException) {
        throw Unhidden("the long press item doesn't compile (${failed.javaClass.simpleName}: ${failed.message})")
    }
}

/**
 * DialogsActivity.createActionMode builds the long press menu once, its more menu ending with
 * Block, and then asks updateCounters which items fit the selection. Hide from chat list goes in
 * after Block, updateCounters shows it while the switch is on, and the action bar's click handler
 * hands a tap on it to the extension first. Anything else and the hiding goes on without the item.
 */
internal fun BytecodePatchContext.resolveHideMenu(): HideMenuPlan = try {
    hideMenu().also { it.rehearse() }
} catch (unhidden: Unhidden) {
    HideMenuPlan(null, 0, 0, 0, null, null, null, unhidden.message)
} catch (failed: RuntimeException) {
    HideMenuPlan(null, 0, 0, 0, null, null, null, "the long press menu can't be read (${failed.javaClass.simpleName}: ${failed.message})")
}

private fun BytecodePatchContext.hideMenu(): HideMenuPlan {
    val builds = folderTabBuilds()
    hiddenFits(builds.size == 1, "the chat list is missing or ambiguous")
    val list = builds.single().definingClass
    val creates = tgMutableClassDefBy(list).methods.filter { m ->
        !AccessFlags.STATIC.isSet(m.accessFlags) && m.origReturnType == "V" && m.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;") &&
            m.controlBody().let { body -> body.any { it.controlRef() == BLOCK_ICON } && body.any { it.controlRef() == BLOCK_LABEL } }
    }
    hiddenFits(creates.size == 1, "the long press menu is missing or ambiguous")
    val create = creates.single()
    val body = create.controlBody()

    // more.addSubItem(block, R.drawable.msg_block, text), its result kept in a field of the chat list.
    val icon = body.indexOfFirst { it.loadsInt() && it.controlRef() == BLOCK_ICON }
    val add = (icon + 1 until body.size).firstOrNull { body[it].opcode == Opcode.INVOKE_VIRTUAL }
    hiddenFits(icon >= 0 && add != null && add >= 1 && add + 2 < body.size, "the long press menu's Block item changed")
    val call = body[add!!]
    val handed = call.namedRegisters()
    val addSubItem = call.controlRef()
    // 13.1 loads the id right before the call; 13.2 loads the icon, a const now, last, the id just before it.
    val id = body[if (icon == add - 1) add - 2 else add - 1]
    val result = body[add + 1]
    val store = body[add + 2]
    hiddenFits(addSubItem != null && SUB_ITEM_TAKES.any { it in addSubItem } && addSubItem.substringAfter(")").startsWith("L") &&
        handed.size == 4 && handed[2] == (body[icon] as OneRegisterInstruction).registerA &&
        id.opcode in CONSTS && (id as WideLiteralInstruction).wideLiteral == BLOCK_ID && (id as OneRegisterInstruction).registerA == handed[1] &&
        result.opcode == Opcode.MOVE_RESULT_OBJECT && store.opcode == Opcode.IPUT_OBJECT && store.controlField()?.origDefiningClass == list &&
        (store as TwoRegisterInstruction).registerA == (result as OneRegisterInstruction).registerA,
        "the long press menu's Block item changed")
    val more = handed[0]
    val self = (store as TwoRegisterInstruction).registerB
    // The chat list's own register, never written, and both fit the call's 4-bit form; the item's result doesn't land on the menu.
    hiddenFits(self == create.localRegisterCount() && body.none { it.writesRegister(self) } &&
        more != (result as OneRegisterInstruction).registerA && more in 0..15 && self in 0..15,
        "the long press menu's registers don't fit the item")
    val at = add + 3
    val flow = try {
        ControlFlow.of(create)
    } catch (failed: IllegalArgumentException) {
        throw Unhidden("the long press menu can't be read (${failed.message})")
    }
    hiddenFits(flow.normal.withIndex().none { (index, next) -> at in next && index != add + 2 } && flow.exceptional.none { at in it },
        "something jumps into the long press menu's Block item")

    // The one check of the selection createActionMode makes on its way out.
    val asked = body.filter { it.opcode == Opcode.INVOKE_VIRTUAL }.mapNotNull { it.controlRef() }
        .filter { it.startsWith("$list->") && it.endsWith("(Z)V") }.distinct()
    hiddenFits(asked.size == 1, "the long press menu no longer checks its items")
    val counters = tgMutableClassDefBy(list).methods.singleOrNull { it.toString() == asked.single() && !AccessFlags.STATIC.isSet(it.accessFlags) }
    hiddenFits(counters != null && startsClean(counters), "the long press menu's item check changed")
    // selectedDialogs, the list whose size the check reads.
    val countersBody = counters!!.controlBody()
    val selected = countersBody.indices.firstNotNullOfOrNull { index ->
        val read = countersBody[index]
        val field = read.controlField()
        val size = countersBody.getOrNull(index + 1)
        if (read.opcode == Opcode.IGET_OBJECT && field?.origDefiningClass == list && field.origType == HIDDEN_LIST &&
            size?.opcode == Opcode.INVOKE_VIRTUAL && size.controlRef() == LIST_SIZE &&
            size.namedRegisters() == listOf((read as TwoRegisterInstruction).registerA)) field.toString() else null
    }
    hiddenFits(selected != null, "the long press menu's selection changed")

    // The action bar's click handler: a class of its own holding the chat list, reading the selection, telling the more menu's ids apart.
    val clicks = mutableListOf<Pair<String, String>>()
    forEachClassMentioning(Mention.allReferences(listOf(selected!!))) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/") || cls.origType == list) return@forEachClassMentioning
        cls.methods.filter { it.isMenuClick(cls.type, list, selected) }.forEach { clicks += cls.type to it.toString() }
    }
    hiddenFits(clicks.size == 1, "the long press menu's click handler is missing or ambiguous")
    val (owner, handler) = clicks.single()
    val click = tgMutableClassDefBy(owner).methods.single { it.toString() == handler }
    hiddenFits(startsClean(click), "something jumps back to the start of the long press menu's click handler")
    val listener = menuClickOwner(click.controlBody(), owner, list)!!

    for (reference in listOf(addSubItem!!, listener, selected)) {
        try {
            requireReachable(reference, false)
        } catch (failed: PatchException) {
            throw Unhidden("$reference isn't reachable from the extension")
        }
    }
    return HideMenuPlan(create, at, self, more, counters, click, HideMenuRefs(addSubItem, listener, selected), null)
}

/** Whether nothing jumps back to [method]'s first instruction, so a call put there runs once, with the parameters as they came. */
private fun startsClean(method: MutableMethod): Boolean {
    val flow = try {
        ControlFlow.of(method)
    } catch (failed: IllegalArgumentException) {
        return false
    }
    return flow.normal.none { 0 in it } && flow.exceptional.none { 0 in it }
}

private fun com.android.tools.smali.dexlib2.iface.Method.isMenuClick(type: String, list: String, selected: String) =
    !AccessFlags.STATIC.isSet(accessFlags) && returnType == "V" && parameterTypes.map(CharSequence::toString) == listOf("I") &&
        controlBody().let { body ->
            val literals = body.filter { it.opcode in CONSTS }.map { (it as WideLiteralInstruction).wideLiteral }.toSet()
            menuClickOwner(body, type, list) != null &&
                body.any { it.opcode == Opcode.IGET_OBJECT && it.controlRef() == selected } &&
                literals.containsAll(MORE_IDS) && -1L in literals
        }

/**
 * The handler's own field that holds the chat list: one typed as the chat list, or, where R8 merged
 * the action bar handlers into one class that keeps its owner as an Object and switches on a tag
 * (13.2 Play), that Object field, read by a body that casts to the chat list.
 */
private fun menuClickOwner(body: List<Instruction>, type: String, list: String): String? {
    fun own(fieldType: String) = body.firstOrNull { it.opcode == Opcode.IGET_OBJECT && it.controlField()?.let { f -> f.origDefiningClass == type && f.origType == fieldType } == true }
    own(list)?.let { return it.controlRef() }
    val merged = own("Ljava/lang/Object;") ?: return null
    return merged.controlRef().takeIf { body.any { it.opcode == Opcode.CHECK_CAST && it.controlRef() == list } }
}

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction.writesRegister(register: Int): Boolean {
    val target = (this as? OneRegisterInstruction)?.registerA ?: return false
    return opcode.setsRegister() && (target == register || opcode.setsWideRegister() && target + 1 == register)
}

/** Gives the long press item's stubs this build's more menu and selection. */
internal fun BytecodePatchContext.writeHideMenuStubs(refs: HideMenuRefs) {
    writeStub(HIDDEN_CHATS, "addMenuItem", 5, """
        check-cast p0, ${refs.addSubItem.substringBefore("->")}
        invoke-virtual {p0, p1, p2, p3}, ${refs.addSubItem}
        move-result-object v0
        return-object v0
    """)
    writeStub(HIDDEN_CHATS, "selectedChats", 3, """
        check-cast p0, ${refs.listener.substringBefore("->")}
        iget-object v0, p0, ${refs.listener}
        if-nez v0, :hush_read
        const/4 v1, 0x0
        return-object v1
        :hush_read
        check-cast v0, ${refs.selected.substringBefore("->")}
        iget-object v0, v0, ${refs.selected}
        return-object v0
    """)
}

/** Gives HiddenChats' stubs this build's chat lists, account and refresh. [sort] is sortDialogs itself. */
internal fun BytecodePatchContext.writeHiddenChatsStubs(sort: String) {
    // Handed MessagesController by the sort and MessagesStorage by the unread counts, both BaseControllers.
    writeStub(HIDDEN_CHATS, "controllerUser", 3, """
        check-cast p0, $BASE_CONTROLLER
        invoke-virtual {p0}, $GET_USER_CONFIG
        move-result-object v0
        invoke-virtual {v0}, $CLIENT_USER_ID
        move-result-wide v0
        return-wide v0
    """)
    writeStub(HIDDEN_CHATS, "folders", 2, """
        check-cast p0, $MESSAGES_CONTROLLER
        iget-object v0, p0, $BY_FOLDER
        return-object v0
    """)
    writeStub(HIDDEN_CHATS, "selectedFilters", 2, """
        check-cast p0, $MESSAGES_CONTROLLER
        iget-object v0, p0, $SELECTED_FILTERS
        return-object v0
    """)
    writeStub(HIDDEN_CHATS, "filterDialogs", 2, """
        check-cast p0, $LOCAL_FILTER
        iget-object v0, p0, $FILTER_DIALOGS
        return-object v0
    """)
    writeStub(HIDDEN_CHATS, "forwardList", 2, """
        check-cast p0, $MESSAGES_CONTROLLER
        iget-object v0, p0, $DIALOGS_FORWARD
        return-object v0
    """)
    writeStub(HIDDEN_CHATS, "filterForward", 2, """
        check-cast p0, $LOCAL_FILTER
        iget-object v0, p0, $FILTER_FORWARD
        return-object v0
    """)
    writeStub(HIDDEN_CHATS, "dialogId", 3, """
        check-cast p0, ${DIALOG_ID.substringBefore("->")}
        iget-wide v0, p0, $DIALOG_ID
        return-wide v0
    """)
    writeStub(HIDDEN_CHATS, "pinned", 2, """
        check-cast p0, ${DIALOG_PINNED.substringBefore("->")}
        iget-boolean v0, p0, $DIALOG_PINNED
        return v0
    """)
    writeStub(HIDDEN_CHATS, "pinnedNum", 2, """
        check-cast p0, ${DIALOG_PIN_NUM.substringBefore("->")}
        iget v0, p0, $DIALOG_PIN_NUM
        return v0
    """)
    writeStub(HIDDEN_CHATS, "unpin", 2, """
        check-cast p0, ${DIALOG_PINNED.substringBefore("->")}
        const/4 v0, 0x0
        iput-boolean v0, p0, $DIALOG_PINNED
        iput v0, p0, $DIALOG_PIN_NUM
        return-void
    """)
    writeStub(HIDDEN_CHATS, "selectedAccount", 1, """
        sget v0, $SELECTED_ACCOUNT
        return v0
    """)
    writeStub(HIDDEN_CHATS, "userId", 3, """
        invoke-static {p0}, $USER_CONFIG_INSTANCE
        move-result-object v0
        invoke-virtual {v0}, $CLIENT_USER_ID
        move-result-wide v0
        return-wide v0
    """)
    writeStub(HIDDEN_CHATS, "dialogs", 3, """
        invoke-static {p0}, $CONTROLLER_INSTANCE
        move-result-object v0
        invoke-virtual {v0, p1}, $GET_DIALOGS
        move-result-object v0
        return-object v0
    """)
    writeStub(HIDDEN_CHATS, "peerName", 4, """
        invoke-static {p0}, $CONTROLLER_INSTANCE
        move-result-object v0
        invoke-virtual {v0, p1, p2}, $PEER_NAME
        move-result-object v0
        return-object v0
    """)
    writeStub(HIDDEN_CHATS, "resort", 4, """
        invoke-static {p0}, $CONTROLLER_INSTANCE
        move-result-object v0
        const/4 v1, 0x0
        invoke-virtual {v0, v1}, $sort
        invoke-static {p0}, $NOTIFICATIONS_INSTANCE
        move-result-object v0
        sget v1, $DIALOGS_NEED_RELOAD
        const/4 v2, 0x0
        new-array v2, v2, [Ljava/lang/Object;
        invoke-virtual {v0, v1, v2}, $POST_NOTIFICATION
        return-void
    """)
}

/**
 * Gives HiddenChats.recount this build's rebuild of every folder tab's unread count, false being
 * every folder and not only the ones that leave muted chats out, and onStorageThread the queue it
 * runs on.
 */
internal fun BytecodePatchContext.writeRecountStub() {
    writeStub(HIDDEN_CHATS, "recount", 3, """
        invoke-static {p0}, $STORAGE_INSTANCE
        move-result-object v0
        const/4 v1, 0x0
        invoke-virtual {v0, v1}, $RECOUNT
        return-void
    """)
    writeStub(HIDDEN_CHATS, "onStorageThread", 3, """
        invoke-static {p0}, $STORAGE_INSTANCE
        move-result-object v0
        invoke-virtual {v0}, $STORAGE_QUEUE
        move-result-object v0
        invoke-virtual {v0, p1}, $POST_RUNNABLE
        return-void
    """)
}
