/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.folders

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.telegram.misc.chattypefolders.CLIENT_USER_ID
import app.morphe.patches.telegram.misc.chattypefolders.CONTROLLER_INSTANCE
import app.morphe.patches.telegram.misc.chattypefolders.LOCAL_FILTER
import app.morphe.patches.telegram.misc.chattypefolders.LOCAL_ID
import app.morphe.patches.telegram.misc.chattypefolders.LOCAL_NAME
import app.morphe.patches.telegram.misc.chattypefolders.MESSAGES_CONTROLLER
import app.morphe.patches.telegram.misc.chattypefolders.SELECTED_ACCOUNT
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
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val LAUNCH_FOLDER = "$EXTENSION_PACKAGE/misc/LaunchFolder;"
private const val OBJECT = "Ljava/lang/Object;"
private const val STRING = "Ljava/lang/String;"
private const val BUNDLE = "Landroid/os/Bundle;"
private const val LIST = "Ljava/util/ArrayList;"
private const val IS_EMPTY = "$LIST->isEmpty()Z"
/** FilterTabsView.getStableId(selectedType), inlined: positionToStableId.get(selectedType, -1). */
private const val STABLE_ID_LOOKUP = "Landroid/util/SparseIntArray;->get(II)I"
private const val FILTER_ALL_CHATS = "Lorg/telegram/messenger/R\$string;->FilterAllChats:I"
/** The folders the tab strip numbers its tabs by. */
private const val DIALOG_FILTERS = "$MESSAGES_CONTROLLER->getDialogFilters()$LIST"
private const val FILTER_LOCKED = "$LOCAL_FILTER->locked:Z"
private const val FILTER_IS_DEFAULT = "$LOCAL_FILTER->isDefault()Z"
private const val GET_ARGUMENTS = "getArguments()$BUNDLE"
private const val GET_ACCOUNT = "getCurrentAccount()I"
private val MOVES = setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)

/** FilterTabsView.addTab(id, stableId, title, entities, noanimate, isDefault, locked), after its owner. */
private const val ADD_TAB_TAKES = "(II$STRING${LIST}ZZZ)V"
private const val ALL_CHATS_TAB = "$LAUNCH_FOLDER->allChatsTab(${OBJECT}II$STRING${LIST}III)V"
private const val TABS_ADDED = "$LAUNCH_FOLDER->tabsAdded(${OBJECT}I)Z"
private const val EDITING = "$LAUNCH_FOLDER->editing(${OBJECT}I)Z"
private const val SKIPS_DONE = "$LAUNCH_FOLDER->skipsDone(${OBJECT}I)Z"
/** A folder's stable id, the one its tab is added with. */
private const val LOCAL_STABLE = "$LOCAL_FILTER->localId:I"
private const val ARCHIVED_CHATS = "Lorg/telegram/messenger/R\$string;->ArchivedChats:I"
private const val GET_STRING = "Lorg/telegram/messenger/LocaleController;->getString(I)$STRING"
/** The folder id Telegram's archive row opens a chat list with. */
private const val ARCHIVE_FOLDER = 1

/** The call that lets the extension pick the first tab: one instruction. */
internal const val LAUNCH_FOLDER_SIZE = 1

/** What Hide All Chats adds to updateFilterTabs: the answer read after the tabs are added, two instructions. */
internal const val TABS_ADDED_SIZE = 2

/** What Hide All Chats puts first in the strip's setIsEditing: two instructions. */
internal const val EDITING_SIZE = 2

/** What Hide All Chats puts first in the chat list's Done button call: four instructions. */
internal const val SKIPS_DONE_SIZE = 4

/** What the stubs reach in this build's chat list, each a field or method reference. */
internal class LaunchRefs(
    /** DialogsActivity. */
    val list: String,
    /** Its filterTabsView. */
    val strip: String,
    /** FilterTabsView's tab list, empty until the first build. */
    val tabs: String,
    /** FilterTabsView's selected tab id, which the first tab added takes while it's -1. */
    val selected: String,
    /** DialogsActivity's viewPages. */
    val pages: String,
    /** A view page's selectedType, the index of the folder it shows. */
    val selectedType: String,
    /** BaseFragment.getArguments(). */
    val arguments: String,
    /** BaseFragment.getCurrentAccount(). */
    val account: String,
)

/**
 * Where updateFilterTabs first asks whether its folder tabs are empty, found and checked before
 * anything is edited, or [missing], why this build can't open a picked folder.
 */
internal class LaunchFolderPlan(val tabs: MutableMethod?, val at: Int, val self: Int, val refs: LaunchRefs?, val missing: String?) {
    fun apply(into: (MutableMethod) -> MutableMethod = { it }) {
        val method = tabs?.let(into) ?: return
        val before = method.implementation!!.instructions.size
        method.addInstructions(at, "invoke-static/range {v$self .. v$self}, $LAUNCH_FOLDER->firstTabs($OBJECT)V")
        // smali drops an instruction it can't build and only logs it.
        fits(method.implementation!!.instructions.size - before == LAUNCH_FOLDER_SIZE, "the folder pick didn't compile whole")
    }

    /**
     * The same edit on a copy, so a smali problem shows before the app is touched. A snippet smali
     * refuses outright comes back as no class, which the patcher trips over as an empty collection
     * or a null, so any failure on the copy is a reason to leave the switch out.
     */
    fun rehearse() = try {
        apply { MutableMethod(ImmutableMethod.of(it)) }
    } catch (failed: RuntimeException) {
        throw Unpicked("the folder pick doesn't compile (${failed.javaClass.simpleName}: ${failed.message})")
    }
}

/** The runtime the hook and the settings page call. It's the extension's own, so a change there refuses the patch. */
internal fun BytecodePatchContext.requireLaunchFolderRuntime() {
    requireStatusMethod("launchFolder")
    controlHook(LAUNCH_FOLDER, "firstTabs", listOf(OBJECT), "V")
    controlHook(LAUNCH_FOLDER, "tabsEmpty", listOf(OBJECT), "Z")
    controlHook(LAUNCH_FOLDER, "arguments", listOf(OBJECT), BUNDLE)
    controlHook(LAUNCH_FOLDER, "account", listOf(OBJECT), "I")
    controlHook(LAUNCH_FOLDER, "select", listOf(OBJECT, "I"), "Z")
    controlHook(LAUNCH_FOLDER, "selectedAccount", emptyList(), "I")
    controlHook(LAUNCH_FOLDER, "userId", listOf("I"), "J")
    controlHook(LAUNCH_FOLDER, "folderCount", listOf("I"), "I")
    for ((name, result) in listOf("folderId" to "I", "folderName" to STRING, "folderLocked" to "Z", "folderDefault" to "Z")) {
        controlHook(LAUNCH_FOLDER, name, listOf("I", "I"), result)
    }
}

/** Why this build's chat list can't take a picked folder. */
private class Unpicked(why: String) : Exception(why)

private fun fits(ok: Boolean, why: String) {
    if (!ok) throw Unpicked(why)
}

/**
 * DialogsActivity.updateFilterTabs keeps the folder tabs in step with the folder list. The first
 * time it builds them, the tabs are empty and their selected id is -1, so the first tab added takes
 * it. The hook goes right after updateFilterTabs asks whether the tabs are empty, before any is
 * added: the extension sets the selected id and the first page's folder to the picked one, and
 * Telegram's own code then selects that tab and shows its chats. Anything else and the switch is
 * left out.
 */
internal fun BytecodePatchContext.resolveLaunchFolder(): LaunchFolderPlan = try {
    // Rehearsed here, so an edit that doesn't fit this build leaves the switch out rather than the patch.
    firstTabs().also { it.rehearse() }
} catch (unpicked: Unpicked) {
    LaunchFolderPlan(null, 0, 0, null, unpicked.message)
} catch (failed: RuntimeException) {
    // Code this build reads in a way nothing here expected, such as a cast the control flow can't follow.
    LaunchFolderPlan(null, 0, 0, null, "the folder tabs' build can't be read (${failed.javaClass.simpleName}: ${failed.message})")
}

/** DialogsActivity.updateFilterTabs, each one this build has: the chat list is the class that holds it. */
internal fun BytecodePatchContext.folderTabBuilds(): List<MutableMethod> {
    val owners = mutableListOf<String>()
    forEachClassMentioning(Mention.allReferences(listOf(FILTER_ALL_CHATS, DIALOG_FILTERS))) { cls ->
        if (!cls.type.startsWith("Lapp/hushtelegram/") && cls.methods.any { it.isTabBuild() }) owners += cls.type
    }
    return owners.flatMap { owner -> mutableClassDefBy(owner).methods.filter { it.isTabBuild() } }
}

private fun BytecodePatchContext.firstTabs(): LaunchFolderPlan {
    val builds = folderTabBuilds()
    fits(builds.size == 1, "the folder tabs' build is missing or ambiguous")
    val method = builds.single()
    val list = method.definingClass
    val body = method.controlBody()

    // filterTabsView, its tab list, isEmpty and the answer: the first build's question.
    val empty = body.indexOfFirst { it.opcode == Opcode.INVOKE_VIRTUAL && it.controlRef() == IS_EMPTY }
    fits(empty >= 2 && empty + 2 < body.size, "the folder tabs' first build changed")
    val readStrip = body[empty - 2] as? TwoRegisterInstruction
    val readTabs = body[empty - 1] as? TwoRegisterInstruction
    val stripField = body[empty - 2].controlField()
    val tabsField = body[empty - 1].controlField()
    fits(readStrip != null && readTabs != null && stripField != null && tabsField != null &&
        body[empty - 2].opcode == Opcode.IGET_OBJECT && stripField.definingClass == list &&
        body[empty - 1].opcode == Opcode.IGET_OBJECT && tabsField.type == LIST && readTabs.registerB == readStrip.registerA &&
        body[empty].namedRegisters() == listOf(readTabs.registerA) && body[empty + 1].opcode == Opcode.MOVE_RESULT,
        "the folder tabs' first build changed")
    val strip = tabsField!!.definingClass
    fits(extends(stripField!!.type, strip), "the chat list's folder tabs aren't Telegram's tab strip")
    val self = readStrip!!.registerB
    val at = empty + 2
    val flow = try {
        ControlFlow.of(method)
    } catch (failed: IllegalArgumentException) {
        throw Unpicked("the folder tabs' build can't be read (${failed.message})")
    }
    fits(holdsThis(method, flow, self, at), "the folder tabs' first build doesn't read the chat list's own tabs")
    // Only the answer itself leads on, so the pick runs every time the question is asked.
    fits(flow.normal.withIndex().none { (index, next) -> index != empty + 1 && at in next } && flow.exceptional.none { at in it },
        "something jumps into the folder tabs' first build")

    // getCurrentTabId() hands back the selected id the first tab added takes while it's -1.
    val current = classDefByOrNull(strip)?.methods?.filter {
        it.name == "getCurrentTabId" && it.parameterTypes.isEmpty() && it.returnType == "I" && !AccessFlags.STATIC.isSet(it.accessFlags)
    }.orEmpty()
    val reads = current.singleOrNull()?.controlBody().orEmpty()
    fits(reads.size == 2 && reads[0].opcode == Opcode.IGET && reads[0].controlField()?.let { it.definingClass == strip && it.type == "I" } == true &&
        reads[1].opcode == Opcode.RETURN, "the tab strip's selected tab changed")
    val selected = reads[0].controlRef()!!

    // A page's selectedType is what the strip's stable id is looked up with, as getStableId(selectedType).
    val lookedUp = body.indices.mapNotNull { index ->
        val read = body[index]
        val field = read.controlField()
        if (read.opcode != Opcode.IGET || field?.type != "I") return@mapNotNull null
        val value = (read as TwoRegisterInstruction).registerA
        val used = body.drop(index + 1).take(3).any {
            it.opcode == Opcode.INVOKE_VIRTUAL && it.controlRef() == STABLE_ID_LOOKUP && it.namedRegisters().getOrNull(1) == value
        }
        if (used) field.toString() else null
    }.distinct()
    fits(lookedUp.size == 1, "the chat list's page selection changed")
    val selectedType = lookedUp.single()
    val page = selectedType.substringBefore("->")
    val pages = body.filter { it.opcode == Opcode.IGET_OBJECT && it.controlField()?.let { f -> f.definingClass == list && f.type == "[$page" } == true }
        .mapNotNull { it.controlRef() }.distinct()
    fits(pages.size == 1 && body.any { it.opcode == Opcode.IPUT && it.controlRef() == selectedType }, "the chat list's page selection changed")

    val arguments = inherited(list, GET_ARGUMENTS)
    val account = inherited(list, GET_ACCOUNT)
    fits(arguments != null && account != null, "the chat list's account or arguments can't be read")

    for ((reference, static) in listOf(stripField.toString() to false, tabsField.toString() to false, selected to false,
        pages.single() to false, selectedType to false, arguments!! to false, account!! to false, SELECTED_ACCOUNT to true,
        USER_CONFIG_INSTANCE to true, CLIENT_USER_ID to false, CONTROLLER_INSTANCE to true, DIALOG_FILTERS to false,
        LOCAL_ID to false, LOCAL_NAME to false, FILTER_LOCKED to false, FILTER_IS_DEFAULT to false)) {
        try {
            requireReachable(reference, static)
        } catch (failed: PatchException) {
            throw Unpicked("$reference isn't reachable from the extension")
        }
    }
    val refs = LaunchRefs(list, stripField.toString(), tabsField.toString(), selected, pages.single(), selectedType, arguments, account)
    return LaunchFolderPlan(method, at, self, refs, null)
}

/** What Hide All Chats' stubs reach beyond the folder pick's, each a method reference. */
internal class AllChatsRefs(
    /** FilterTabsView.addTab. */
    val addTab: String,
    /** FilterTabsView.getCurrentTabStableId(). */
    val stable: String,
    /** FilterTabsView.selectTabWithStableId(int). */
    val selectStable: String,
    /** BaseFragment.presentFragment(BaseFragment). */
    val present: String,
)

/**
 * Where Hide All Chats goes, found and checked before anything is edited, or [missing], why this
 * build can't leave All Chats out: updateFilterTabs' call adding All Chats ([allChats]) and its
 * question whether the page moves ([update], read from register [answer]), the strip's
 * setIsEditing and the chat list's Done button call.
 */
internal class AllChatsPlan(
    val tabs: MutableMethod?,
    val allChats: Int,
    val update: Int,
    val answer: Int,
    val self: Int,
    val editing: MutableMethod?,
    val done: MutableMethod?,
    val refs: AllChatsRefs?,
    val missing: String?,
) {
    fun apply(into: (MutableMethod) -> MutableMethod = { it }) {
        val build = tabs?.let(into) ?: return
        val edit = into(editing!!)
        val shown = into(done!!)
        val add = build.implementation!!.instructions[allChats] as RegisterRangeInstruction
        val before = build.implementation!!.instructions.size
        // The later edit first, so the earlier index still holds.
        build.addInstructions(update, """
            invoke-static {v$self, v$answer}, $TABS_ADDED
            move-result v$answer
        """)
        build.replaceInstruction(allChats, "invoke-static/range {v${add.startRegister} .. v${add.startRegister + 7}}, $ALL_CHATS_TAB")
        // smali drops an instruction it can't build and only logs it.
        fits(build.implementation!!.instructions.size - before == TABS_ADDED_SIZE &&
            build.getInstruction(allChats).opcode == Opcode.INVOKE_STATIC_RANGE, "the tabs without All Chats didn't compile whole")

        val editingAt = edit.implementation!!.registerCount - 2
        val editBefore = edit.implementation!!.instructions.size
        edit.addInstructions(0, """
            invoke-static/range {v$editingAt .. v${editingAt + 1}}, $EDITING
            move-result v${editingAt + 1}
        """)
        fits(edit.implementation!!.instructions.size - editBefore == EDITING_SIZE, "the tab drag guard didn't compile whole")

        val shownAt = shown.implementation!!.registerCount - 2
        val shownBefore = shown.implementation!!.instructions.size
        shown.addInstructionsWithLabels(0, """
            invoke-static/range {v$shownAt .. v${shownAt + 1}}, $SKIPS_DONE
            move-result v0
            if-eqz v0, :hush_stock
            return-void
        """, ExternalLabel("hush_stock", shown.getInstruction(0)))
        fits(shown.implementation!!.instructions.size - shownBefore == SKIPS_DONE_SIZE, "the Done button guard didn't compile whole")
    }

    /** The same edits on copies, as [LaunchFolderPlan.rehearse] does. */
    fun rehearse() = try {
        apply { MutableMethod(ImmutableMethod.of(it)) }
    } catch (failed: RuntimeException) {
        throw Unpicked("leaving All Chats out doesn't compile (${failed.javaClass.simpleName}: ${failed.message})")
    }
}

/** Hide All Chats' runtime, the extension's own like the folder pick's. */
internal fun BytecodePatchContext.requireAllChatsRuntime() {
    requireStatusMethod("hideAllChats")
    controlHook(LAUNCH_FOLDER, "allChatsTab", listOf(OBJECT, "I", "I", STRING, LIST, "I", "I", "I"), "V")
    controlHook(LAUNCH_FOLDER, "tabsAdded", listOf(OBJECT, "I"), "Z")
    controlHook(LAUNCH_FOLDER, "editing", listOf(OBJECT, "I"), "Z")
    controlHook(LAUNCH_FOLDER, "skipsDone", listOf(OBJECT, "I"), "Z")
    controlHook(LAUNCH_FOLDER, "strip", listOf(OBJECT), OBJECT)
    for (name in listOf("selectedType", "selectedId", "currentStable")) controlHook(LAUNCH_FOLDER, name, listOf(OBJECT), "I")
    controlHook(LAUNCH_FOLDER, "selectByStable", listOf(OBJECT, "I"), "Z")
    controlHook(LAUNCH_FOLDER, "folderStable", listOf("I", "I"), "I")
    controlHook(LAUNCH_FOLDER, "addTab", listOf(OBJECT, "I", "I", STRING, LIST, "Z", "Z", "Z"), "V")
    controlHook(LAUNCH_FOLDER, "presentArchive", listOf(OBJECT), "Z")
    controlHook(LAUNCH_FOLDER, "telegramArchiveTitle", emptyList(), STRING)
}

/**
 * updateFilterTabs adds All Chats from the default folder, then the others. With the switch on
 * the extension stands in for the All Chats call and may leave it out. Once every tab is added,
 * updateFilterTabs asks whether the page moves to another folder, comparing places that All Chats'
 * absence shifts by one, so the extension answers that and sets the selected tab. Dragging tabs
 * writes the folder order by place too, so the strip's setIsEditing and the chat list's Done
 * button ask first. Built on the folder pick's plan, which has to be there: anything else and the
 * switch is left out.
 */
internal fun BytecodePatchContext.resolveAllChats(launch: LaunchFolderPlan): AllChatsPlan = try {
    if (launch.missing != null) throw Unpicked("the folder pick isn't there to build on")
    allChats(launch).also { it.rehearse() }
} catch (unpicked: Unpicked) {
    AllChatsPlan(null, 0, 0, 0, 0, null, null, null, unpicked.message)
} catch (failed: RuntimeException) {
    AllChatsPlan(null, 0, 0, 0, 0, null, null, null, "the folder tabs' build can't be read (${failed.javaClass.simpleName}: ${failed.message})")
}

private fun BytecodePatchContext.allChats(launch: LaunchFolderPlan): AllChatsPlan {
    val method = launch.tabs!!
    val launchRefs = launch.refs!!
    val list = launchRefs.list
    val strip = launchRefs.tabs.substringBefore("->")
    val self = launch.self
    val body = method.controlBody()
    val flow = ControlFlow.of(method)
    fun calls(index: Int, owner: String, takes: String) = body[index].controlRef()?.let { it.startsWith("$owner->") && it.endsWith(takes) } == true

    // All Chats is the tab added right after its label is read, ahead of the other folders' call.
    val label = body.indexOfFirst { it.opcode == Opcode.SGET && it.controlRef() == FILTER_ALL_CHATS }
    val adds = body.indices.filter { body[it].opcode == Opcode.INVOKE_VIRTUAL_RANGE && calls(it, strip, ADD_TAB_TAKES) }
    fits(label > launch.at && adds.size == 2 && adds[0] > label && body[adds[0]].controlRef() == body[adds[1]].controlRef() &&
        (body[adds[0]] as RegisterRangeInstruction).registerCount == 8, "the All Chats tab's call changed")
    val allChats = adds[0]

    // The question once the tabs are added: the empty tabs' answer, which a moved page sets too,
    // decides whether the chat list shows the selected tab's chats.
    val answer = (body[launch.at - 1] as OneRegisterInstruction).registerA
    val update = body.indices.filter { index ->
        val test = body[index]
        val target = (flow.normal[index] - (index + 1)).singleOrNull()
        index > adds[1] && test.opcode == Opcode.IF_EQZ && (test as OneRegisterInstruction).registerA == answer && target != null &&
            target > 0 && body[target - 1].opcode == Opcode.INVOKE_VIRTUAL && calls(target - 1, list, "(Z)V") &&
            body[target - 1].namedRegisters().first() == self
    }.singleOrNull()
    fits(update != null && update - 1 > adds[1], "the folder tabs' page update changed")
    val updateAt = update!!
    fits(self <= 15 && answer <= 15, "the folder tabs' page update keeps its registers out of reach")
    fits(updateAt in flow.normal[updateAt - 1] && flow.normal.withIndex().none { (index, next) -> index != updateAt - 1 && updateAt in next } &&
        flow.exceptional.none { updateAt in it }, "something jumps into the folder tabs' page update")
    fits(holdsThis(method, flow, self, updateAt), "the folder tabs' page update doesn't read the chat list's own tabs")

    // The strip's editing switch, which the chat list always follows with its Done button.
    val pairs = body.indices.filter { index ->
        index + 1 < body.size && body[index].opcode == Opcode.INVOKE_VIRTUAL && body[index].controlRef() == "$strip->setIsEditing(Z)V" &&
            body[index + 1].opcode == Opcode.INVOKE_VIRTUAL && calls(index + 1, list, "(Z)V") &&
            body[index + 1].namedRegisters() == listOf(self, body[index].namedRegisters()[1])
    }
    fits(pairs.size == 1, "the tab strip's editing changed")
    val editing = startsHook(strip, body[pairs.single()].controlRef()!!, "the tab strip's editing")
    val done = startsHook(list, body[pairs.single() + 1].controlRef()!!, "the chat list's Done button")
    fits(done.implementation!!.registerCount > 2, "the chat list's Done button has no register to answer in")

    // The stable id the strip selects tabs by, read right after it's asked for.
    val stableAt = body.indices.firstOrNull { body[it].opcode == Opcode.INVOKE_VIRTUAL && calls(it, strip, "->getCurrentTabStableId()I") } ?: -1
    fits(stableAt >= 0 && body.getOrNull(stableAt + 1)?.opcode == Opcode.MOVE_RESULT, "the folder tabs' stable id changed")
    val stableId = (body[stableAt + 1] as OneRegisterInstruction).registerA
    val selects = body.indices.filter { it > stableAt + 1 && body[it].opcode == Opcode.INVOKE_VIRTUAL && calls(it, strip, "(I)Z") &&
        body[it].namedRegisters().getOrNull(1) == stableId }.map { body[it].controlRef()!! }.distinct()
    fits(selects.size == 1, "the folder tabs' stable id selection changed")

    val base = launchRefs.arguments.substringBefore("->")
    val present = inherited(list, "presentFragment($base)Z")
    fits(present != null, "the chat list can't open another one")
    val refs = AllChatsRefs(body[allChats].controlRef()!!, body[stableAt].controlRef()!!, selects.single(), present!!)
    for ((reference, static) in listOf(refs.addTab to false, refs.stable to false, refs.selectStable to false, present to false,
        "$list-><init>($BUNDLE)V" to false, LOCAL_STABLE to false, ARCHIVED_CHATS to true, GET_STRING to true)) {
        try {
            requireReachable(reference, static)
        } catch (failed: PatchException) {
            throw Unpicked("$reference isn't reachable from the extension")
        }
    }
    return AllChatsPlan(method, allChats, update, answer, self, editing, done, refs, null)
}

/** [reference], an instance method on [owner] taking one boolean, that nothing jumps back to the start of. */
private fun BytecodePatchContext.startsHook(owner: String, reference: String, what: String): MutableMethod {
    val method = mutableClassDefByOrNull(owner)?.methods?.singleOrNull { it.toString() == reference }
    fits(method != null && !AccessFlags.STATIC.isSet(method.accessFlags) && method.implementation != null &&
        method.parameterTypes.map(CharSequence::toString) == listOf("Z") && method.returnType == "V", "$what changed")
    val flow = ControlFlow.of(method!!)
    fits(flow.normal.none { 0 in it } && flow.exceptional.none { 0 in it }, "something jumps back to the start of $what")
    return method
}

private fun Method.isTabBuild() = !AccessFlags.STATIC.isSet(accessFlags) && returnType == "V" &&
    parameterTypes.map(CharSequence::toString) == listOf("Z", "Z") && controlBody().let { body ->
        body.any { it.controlRef() == DIALOG_FILTERS } && body.any { it.controlRef() == FILTER_ALL_CHATS } &&
            body.any { it.controlRef()?.endsWith("->getCurrentTabStableId()I") == true }
    }

/** Whether [type] is [base] or a class under it, as far as Telegram's classes go. */
private fun BytecodePatchContext.extends(type: String, base: String): Boolean {
    var at: String? = type
    repeat(12) {
        if (at == base) return true
        at = at?.let { classDefByOrNull(it)?.superclass } ?: return false
    }
    return false
}

/** [member] on the first of [type] and its parent classes that declares it public, not static and with a body, or null. */
private fun BytecodePatchContext.inherited(type: String, member: String): String? {
    var at: String? = type
    repeat(12) {
        val cls = at?.let { classDefByOrNull(it) } ?: return null
        val found = cls.methods.any {
            "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" == member &&
                AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags) && !AccessFlags.ABSTRACT.isSet(it.accessFlags)
        }
        if (found) return "${cls.type}->$member"
        at = cls.superclass
    }
    return null
}

/**
 * Whether [register] still holds `this` when [use] runs: it's this's own register, or a copy the
 * first instruction makes, and no write to it can reach [use].
 */
private fun holdsThis(method: Method, flow: ControlFlow, register: Int, use: Int): Boolean {
    val own = method.localRegisterCount()
    val copied = register != own
    if (copied) {
        val first = flow.instructions.first()
        if (first.opcode !in MOVES || first.namedRegisters() != listOf(register, own)) return false
        // A loop back to the copy after this's own register was reused.
        if (0 in flow.after { _, instruction -> instruction.writes(own) }) return false
    }
    return use !in flow.after { index, instruction -> (!copied || index != 0) && instruction.writes(register) }
}

/** Every instruction that can run after one that [writes]. */
private fun ControlFlow.after(writes: (Int, Instruction) -> Boolean): Set<Int> {
    val pending = ArrayDeque<Int>()
    instructions.forEachIndexed { index, instruction -> if (writes(index, instruction)) pending.addAll(normal[index]) }
    val reached = mutableSetOf<Int>()
    while (pending.isNotEmpty()) {
        val next = pending.removeFirst()
        if (reached.add(next)) pending.addAll(normal[next] + exceptional[next])
    }
    return reached
}

private fun Instruction.writes(register: Int): Boolean {
    val target = (this as? OneRegisterInstruction)?.registerA ?: return false
    return opcode.setsRegister() && (target == register || opcode.setsWideRegister() && target + 1 == register)
}

/** Gives LaunchFolder's stubs this build's chat list, account and folder members. */
internal fun BytecodePatchContext.writeLaunchFolderStubs(refs: LaunchRefs) {
    writeStub(LAUNCH_FOLDER, "tabsEmpty", 2, """
        check-cast p0, ${refs.list}
        iget-object v0, p0, ${refs.strip}
        if-eqz v0, :hush_none
        iget-object v0, v0, ${refs.tabs}
        invoke-virtual {v0}, $IS_EMPTY
        move-result v0
        return v0
        :hush_none
        const/4 v0, 0x0
        return v0
    """)
    writeStub(LAUNCH_FOLDER, "arguments", 1, """
        check-cast p0, ${refs.arguments.substringBefore("->")}
        invoke-virtual {p0}, ${refs.arguments}
        move-result-object p0
        return-object p0
    """)
    writeStub(LAUNCH_FOLDER, "account", 1, """
        check-cast p0, ${refs.account.substringBefore("->")}
        invoke-virtual {p0}, ${refs.account}
        move-result p0
        return p0
    """)
    // viewPages[0].selectedType and the strip's selected id, both or neither.
    writeStub(LAUNCH_FOLDER, "select", 5, """
        check-cast p0, ${refs.list}
        const/4 v2, 0x0
        iget-object v0, p0, ${refs.pages}
        if-eqz v0, :hush_none
        array-length v1, v0
        if-eqz v1, :hush_none
        aget-object v0, v0, v2
        if-eqz v0, :hush_none
        iget-object v1, p0, ${refs.strip}
        if-eqz v1, :hush_none
        iput p1, v0, ${refs.selectedType}
        iput p1, v1, ${refs.selected}
        const/4 v2, 0x1
        :hush_none
        return v2
    """)
    writeStub(LAUNCH_FOLDER, "selectedAccount", 1, """
        sget v0, $SELECTED_ACCOUNT
        return v0
    """)
    writeStub(LAUNCH_FOLDER, "userId", 3, """
        invoke-static {p0}, $USER_CONFIG_INSTANCE
        move-result-object v0
        invoke-virtual {v0}, $CLIENT_USER_ID
        move-result-wide v0
        return-wide v0
    """)
    writeStub(LAUNCH_FOLDER, "folderCount", 1, """
        invoke-static {p0}, $CONTROLLER_INSTANCE
        move-result-object p0
        invoke-virtual {p0}, $DIALOG_FILTERS
        move-result-object p0
        invoke-virtual {p0}, $LIST->size()I
        move-result p0
        return p0
    """)
    val folderAt = """
        invoke-static {p0}, $CONTROLLER_INSTANCE
        move-result-object v0
        invoke-virtual {v0}, $DIALOG_FILTERS
        move-result-object v0
        invoke-virtual {v0, p1}, $LIST->get(I)$OBJECT
        move-result-object v0
        check-cast v0, $LOCAL_FILTER
    """
    for ((stub, read) in listOf(
        "folderId" to "iget v0, v0, $LOCAL_ID\n return v0",
        "folderName" to "iget-object v0, v0, $LOCAL_NAME\n return-object v0",
        "folderLocked" to "iget-boolean v0, v0, $FILTER_LOCKED\n return v0",
        "folderDefault" to "invoke-virtual {v0}, $FILTER_IS_DEFAULT\n move-result v0\n return v0",
    )) {
        writeStub(LAUNCH_FOLDER, stub, 3, folderAt + read)
    }
}

/** Gives LaunchFolder's Hide All Chats stubs this build's tab strip, pages and archive. */
internal fun BytecodePatchContext.writeAllChatsStubs(launch: LaunchRefs, refs: AllChatsRefs) {
    writeStub(LAUNCH_FOLDER, "strip", 1, """
        check-cast p0, ${launch.list}
        iget-object p0, p0, ${launch.strip}
        return-object p0
    """)
    writeStub(LAUNCH_FOLDER, "selectedType", 3, """
        check-cast p0, ${launch.list}
        const/4 v0, -0x1
        iget-object v1, p0, ${launch.pages}
        if-eqz v1, :hush_none
        array-length p0, v1
        if-eqz p0, :hush_none
        const/4 p0, 0x0
        aget-object v1, v1, p0
        if-eqz v1, :hush_none
        iget v0, v1, ${launch.selectedType}
        :hush_none
        return v0
    """)
    writeStub(LAUNCH_FOLDER, "selectedId", 2, """
        check-cast p0, ${launch.list}
        const/4 v0, -0x1
        iget-object p0, p0, ${launch.strip}
        if-eqz p0, :hush_none
        iget v0, p0, ${launch.selected}
        :hush_none
        return v0
    """)
    writeStub(LAUNCH_FOLDER, "currentStable", 2, """
        check-cast p0, ${launch.list}
        const/4 v0, -0x1
        iget-object p0, p0, ${launch.strip}
        if-eqz p0, :hush_none
        invoke-virtual {p0}, ${refs.stable}
        move-result v0
        :hush_none
        return v0
    """)
    writeStub(LAUNCH_FOLDER, "selectByStable", 3, """
        check-cast p0, ${launch.list}
        const/4 v0, 0x0
        iget-object p0, p0, ${launch.strip}
        if-eqz p0, :hush_none
        invoke-virtual {p0, p1}, ${refs.selectStable}
        move-result v0
        :hush_none
        return v0
    """)
    writeStub(LAUNCH_FOLDER, "folderStable", 3, """
        invoke-static {p0}, $CONTROLLER_INSTANCE
        move-result-object v0
        invoke-virtual {v0}, $DIALOG_FILTERS
        move-result-object v0
        invoke-virtual {v0, p1}, $LIST->get(I)$OBJECT
        move-result-object v0
        check-cast v0, $LOCAL_FILTER
        iget v0, v0, $LOCAL_STABLE
        return v0
    """)
    writeStub(LAUNCH_FOLDER, "addTab", 8, """
        check-cast p0, ${refs.addTab.substringBefore("->")}
        invoke-virtual/range {p0 .. p7}, ${refs.addTab}
        return-void
    """)
    writeStub(LAUNCH_FOLDER, "presentArchive", 4, """
        new-instance v0, $BUNDLE
        invoke-direct {v0}, $BUNDLE-><init>()V
        const-string v1, "folderId"
        const/4 v2, $ARCHIVE_FOLDER
        invoke-virtual {v0, v1, v2}, $BUNDLE->putInt(${STRING}I)V
        new-instance v1, ${launch.list}
        invoke-direct {v1, v0}, ${launch.list}-><init>($BUNDLE)V
        check-cast p0, ${refs.present.substringBefore("->")}
        invoke-virtual {p0, v1}, ${refs.present}
        move-result v0
        return v0
    """)
    writeStub(LAUNCH_FOLDER, "telegramArchiveTitle", 1, """
        sget v0, $ARCHIVED_CHATS
        invoke-static {v0}, $GET_STRING
        move-result-object v0
        return-object v0
    """)
}
