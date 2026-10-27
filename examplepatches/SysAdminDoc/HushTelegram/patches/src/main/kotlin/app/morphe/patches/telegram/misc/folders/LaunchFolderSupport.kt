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

/** The call that lets the extension pick the first tab: one instruction. */
internal const val LAUNCH_FOLDER_SIZE = 1

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
