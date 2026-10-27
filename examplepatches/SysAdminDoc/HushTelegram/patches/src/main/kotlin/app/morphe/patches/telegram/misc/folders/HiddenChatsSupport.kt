/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.folders

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.chattypefolders.CLIENT_USER_ID
import app.morphe.patches.telegram.misc.chattypefolders.CONTROLLER_INSTANCE
import app.morphe.patches.telegram.misc.chattypefolders.LOCAL_FILTER
import app.morphe.patches.telegram.misc.chattypefolders.MESSAGES_CONTROLLER
import app.morphe.patches.telegram.misc.chattypefolders.SELECTED_ACCOUNT
import app.morphe.patches.telegram.misc.chattypefolders.USER_CONFIG
import app.morphe.patches.telegram.misc.chattypefolders.USER_CONFIG_INSTANCE
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.patches.telegram.misc.localcontrols.requireReachable
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val HIDDEN_CHATS = "$EXTENSION_PACKAGE/misc/HiddenChats;"
private const val HIDDEN_OBJECT = "Ljava/lang/Object;"
private const val HIDDEN_LIST = "Ljava/util/ArrayList;"
private const val SPARSE = "Landroid/util/SparseArray;"
internal const val BY_FOLDER = "$MESSAGES_CONTROLLER->dialogsByFolder:$SPARSE"
internal const val SELECTED_FILTERS = "$MESSAGES_CONTROLLER->selectedDialogFilter:[$LOCAL_FILTER"
internal const val FILTER_DIALOGS = "$LOCAL_FILTER->dialogs:$HIDDEN_LIST"
internal const val DIALOG_ID = "Lorg/telegram/tgnet/TLRPC\$Dialog;->id:J"
internal const val GET_DIALOGS = "$MESSAGES_CONTROLLER->getDialogs(I)$HIDDEN_LIST"
internal const val PEER_NAME = "$MESSAGES_CONTROLLER->getPeerName(J)Ljava/lang/String;"
internal const val GET_USER_CONFIG = "Lorg/telegram/messenger/BaseController;->getUserConfig()$USER_CONFIG"
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
 * Where sortDialogs starts dropping the folders left empty, and where the pinned order reads its
 * folder's chats, found and checked before anything is edited, or [missing], why this build can't
 * hide chats.
 */
internal class HiddenChatsPlan(val sort: MutableMethod?, val at: Int, val controller: Int, val missing: String?, val pins: PinOrderPlan? = null) {
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
    controlHook(HIDDEN_CHATS, "dialogId", listOf(HIDDEN_OBJECT), "J")
    controlHook(HIDDEN_CHATS, "pinOrder", listOf(HIDDEN_OBJECT, "I", HIDDEN_OBJECT), HIDDEN_OBJECT)
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
    val controller = mutableClassDefByOrNull(MESSAGES_CONTROLLER)
    val sorts = controller?.methods?.filter {
        it.name == "sortDialogs" && it.returnType == "V" && it.parameterTypes.size == 1 && !AccessFlags.STATIC.isSet(it.accessFlags)
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

    for ((reference, static) in listOf(BY_FOLDER to false, SELECTED_FILTERS to false, FILTER_DIALOGS to false, DIALOG_ID to false,
        DIALOG_PINNED to false, DIALOG_PIN_NUM to false,
        GET_DIALOGS to false, PEER_NAME to false, GET_USER_CONFIG to false, CLIENT_USER_ID to false, SELECTED_ACCOUNT to true,
        USER_CONFIG_INSTANCE to true, CONTROLLER_INSTANCE to true, NOTIFICATIONS_INSTANCE to true, DIALOGS_NEED_RELOAD to true,
        POST_NOTIFICATION to false, method.toString() to false)) {
        try {
            requireReachable(reference, static)
        } catch (failed: PatchException) {
            throw Unhidden("$reference isn't reachable from the extension")
        }
    }
    return HiddenChatsPlan(method, at, self, null, pins)
}

/**
 * MessagesController.reorderPinnedDialogs sends the server, as the whole pinned order, the pinned
 * chats in the list getDialogs(folder) hands it, which the sort left the hidden ones out of. The
 * swap goes right after that read, the method's only one.
 */
private fun BytecodePatchContext.pinOrderRead(): PinOrderPlan {
    val methods = mutableClassDefBy(MESSAGES_CONTROLLER).methods.filter { m ->
        !AccessFlags.STATIC.isSet(m.accessFlags) && m.returnType == "V" &&
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

internal const val MENU_ITEM = "$HIDDEN_CHATS->menuItem($HIDDEN_OBJECT$HIDDEN_OBJECT)V"
internal const val MENU_SHOWN = "$HIDDEN_CHATS->menuShown($HIDDEN_OBJECT)V"
internal const val MENU_CHOICE = "$HIDDEN_CHATS->menuChoice(${HIDDEN_OBJECT}I)I"
private const val BLOCK_ICON = "Lorg/telegram/messenger/R\$drawable;->msg_block:I"
private const val BLOCK_LABEL = "Lorg/telegram/messenger/R\$string;->BlockUser:I"
private const val LIST_SIZE = "$HIDDEN_LIST->size()I"
private const val SUB_ITEM_TAKES = "(IILjava/lang/String;)"
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
    val creates = mutableClassDefBy(list).methods.filter { m ->
        !AccessFlags.STATIC.isSet(m.accessFlags) && m.returnType == "V" && m.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;") &&
            m.controlBody().let { body -> body.any { it.controlRef() == BLOCK_ICON } && body.any { it.controlRef() == BLOCK_LABEL } }
    }
    hiddenFits(creates.size == 1, "the long press menu is missing or ambiguous")
    val create = creates.single()
    val body = create.controlBody()

    // more.addSubItem(block, R.drawable.msg_block, text), its result kept in a field of the chat list.
    val icon = body.indexOfFirst { it.opcode == Opcode.SGET && it.controlRef() == BLOCK_ICON }
    val add = (icon + 1 until body.size).firstOrNull { body[it].opcode == Opcode.INVOKE_VIRTUAL }
    hiddenFits(icon >= 0 && add != null && add >= 1 && add + 2 < body.size, "the long press menu's Block item changed")
    val call = body[add!!]
    val handed = call.namedRegisters()
    val addSubItem = call.controlRef()
    val id = body[add - 1]
    val result = body[add + 1]
    val store = body[add + 2]
    hiddenFits(addSubItem != null && SUB_ITEM_TAKES in addSubItem && addSubItem.substringAfter(")").startsWith("L") &&
        handed.size == 4 && handed[2] == (body[icon] as OneRegisterInstruction).registerA &&
        id.opcode in CONSTS && (id as WideLiteralInstruction).wideLiteral == BLOCK_ID && (id as OneRegisterInstruction).registerA == handed[1] &&
        result.opcode == Opcode.MOVE_RESULT_OBJECT && store.opcode == Opcode.IPUT_OBJECT && store.controlField()?.definingClass == list &&
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
    val counters = mutableClassDefBy(list).methods.singleOrNull { it.toString() == asked.single() && !AccessFlags.STATIC.isSet(it.accessFlags) }
    hiddenFits(counters != null && startsClean(counters), "the long press menu's item check changed")
    // selectedDialogs, the list whose size the check reads.
    val countersBody = counters!!.controlBody()
    val selected = countersBody.indices.firstNotNullOfOrNull { index ->
        val read = countersBody[index]
        val field = read.controlField()
        val size = countersBody.getOrNull(index + 1)
        if (read.opcode == Opcode.IGET_OBJECT && field?.definingClass == list && field.type == HIDDEN_LIST &&
            size?.opcode == Opcode.INVOKE_VIRTUAL && size.controlRef() == LIST_SIZE &&
            size.namedRegisters() == listOf((read as TwoRegisterInstruction).registerA)) field.toString() else null
    }
    hiddenFits(selected != null, "the long press menu's selection changed")

    // The action bar's click handler: a class of its own holding the chat list, reading the selection, telling the more menu's ids apart.
    val clicks = mutableListOf<Pair<String, String>>()
    forEachClassMentioning(Mention.allReferences(listOf(selected!!))) { cls ->
        if (cls.type.startsWith("Lapp/hushtelegram/") || cls.type == list) return@forEachClassMentioning
        cls.methods.filter { it.isMenuClick(cls.type, list, selected) }.forEach { clicks += cls.type to it.toString() }
    }
    hiddenFits(clicks.size == 1, "the long press menu's click handler is missing or ambiguous")
    val (owner, handler) = clicks.single()
    val click = mutableClassDefBy(owner).methods.single { it.toString() == handler }
    hiddenFits(startsClean(click), "something jumps back to the start of the long press menu's click handler")
    val listener = click.controlBody().first { it.opcode == Opcode.IGET_OBJECT && it.controlField()?.let { f -> f.definingClass == owner && f.type == list } == true }
        .controlRef()!!

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
            body.any { it.opcode == Opcode.IGET_OBJECT && it.controlField()?.let { f -> f.definingClass == type && f.type == list } == true } &&
                body.any { it.opcode == Opcode.IGET_OBJECT && it.controlRef() == selected } &&
                literals.containsAll(MORE_IDS) && -1L in literals
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
        iget-object v0, v0, ${refs.selected}
        return-object v0
    """)
}

/** Gives HiddenChats' stubs this build's chat lists, account and refresh. [sort] is sortDialogs itself. */
internal fun BytecodePatchContext.writeHiddenChatsStubs(sort: String) {
    writeStub(HIDDEN_CHATS, "controllerUser", 3, """
        check-cast p0, $MESSAGES_CONTROLLER
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
