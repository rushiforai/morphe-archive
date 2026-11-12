/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.folders

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.chattypefolders.CONTROLLER_INSTANCE
import app.morphe.patches.telegram.misc.chattypefolders.LOCAL_ALWAYS
import app.morphe.patches.telegram.misc.chattypefolders.LOCAL_FILTER
import app.morphe.patches.telegram.misc.chattypefolders.LOCAL_FLAGS
import app.morphe.patches.telegram.misc.chattypefolders.MESSAGES_CONTROLLER
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.requireReachable
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.util.names.tgMutableClassDefByOrNull

internal const val TAB_ICONS = "$EXTENSION_PACKAGE/misc/TabIcons;"
private const val OBJECT = "Ljava/lang/Object;"
private const val CHARS = "Ljava/lang/CharSequence;"
private const val LIST = "Ljava/util/ArrayList;"
private const val SPANNABLE = "Landroid/text/Spannable;"
internal const val TAB_TITLE = "$TAB_ICONS->title(${CHARS}I)$CHARS"
internal const val TAB_RETITLE = "$TAB_ICONS->retitle($CHARS$OBJECT)$CHARS"
internal const val TAB_PLAIN = "$TAB_ICONS->plain($CHARS)$CHARS"
private const val TEXT_EQUALS = "Landroid/text/TextUtils;->equals($CHARS$CHARS)Z"
private const val FOLDERS = "$MESSAGES_CONTROLLER->getDialogFilters()$LIST"

/** One edit: [code] in front of instruction [index] of [method], [size] instructions long. */
internal class TabIconEdit(val method: MutableMethod, val index: Int, val code: String, val size: Int)

/**
 * Where the folder tab icons go, found and checked before anything is edited, or [missing], why
 * this build can't draw them: each place the tab strip makes a tab, and each place a tab takes a new
 * title. [tab] is the tab class and [id] its id field, which the position stub reads.
 */
internal class TabIconsPlan(val edits: List<TabIconEdit>, val tab: String?, val id: String?, val missing: String?) {
    fun apply(into: (MutableMethod) -> MutableMethod = { it }) {
        for ((method, edits) in edits.groupBy { it.method }) {
            val target = into(method)
            val before = target.implementation!!.instructions.size
            // The later edit first, so the earlier index still holds.
            for (edit in edits.sortedByDescending { it.index }) target.addInstructionsAtControlFlowLabel(edit.index, edit.code)
            // smali drops an instruction it can't build and only logs it.
            fits(target.implementation!!.instructions.size - before == edits.sumOf { it.size }, "the folder tab icons didn't compile whole")
        }
    }

    /** The same edits on copies, so a register or smali problem shows before the app is touched. */
    fun rehearse() = try {
        apply { MutableMethod(ImmutableMethod.of(it)) }
    } catch (failed: RuntimeException) {
        throw NoTabIcons("the folder tab icons don't compile (${failed.javaClass.simpleName}: ${failed.message})")
    }
}

/** The runtime the hooks call, the extension's own, so a change there refuses the patch. */
internal fun BytecodePatchContext.requireTabIconsRuntime() {
    requireStatusMethod("tabIcons")
    controlHook(TAB_ICONS, "title", listOf(CHARS, "I"), CHARS)
    controlHook(TAB_ICONS, "retitle", listOf(CHARS, OBJECT), CHARS)
    controlHook(TAB_ICONS, "plain", listOf(CHARS), CHARS)
    controlHook(TAB_ICONS, "folderFlags", listOf("I", "I"), "I")
    controlHook(TAB_ICONS, "folderPicks", listOf("I", "I"), "I")
    controlHook(TAB_ICONS, "tabPosition", listOf(OBJECT), "I")
}

/** Why this build's tabs can't take icons. */
private class NoTabIcons(why: String) : Exception(why)

private fun fits(ok: Boolean, why: String) {
    if (!ok) throw NoTabIcons(why)
}

/**
 * The tab strip ([strip], the class holding the folder pick's tab list) makes each tab from the
 * strip, the tab's id, which is its folder's place in the folder list, its title and a flag. The
 * title goes through the extension right before that, so the tab measures and draws it with its
 * icon. A tab given a new title later compares it with the one it has first, so that check reads
 * the title without its icon, and the new title gets it back right before it's stored. Anything
 * else and the switch is left out.
 */
internal fun BytecodePatchContext.resolveTabIcons(strip: String): TabIconsPlan = try {
    tabIcons(strip).also { it.rehearse() }
} catch (missing: NoTabIcons) {
    TabIconsPlan(emptyList(), null, null, missing.message)
} catch (failed: RuntimeException) {
    // Code this build reads in a way nothing here expected.
    TabIconsPlan(emptyList(), null, null, "the folder tabs can't be read (${failed.javaClass.simpleName}: ${failed.message})")
}

private fun BytecodePatchContext.tabIcons(strip: String): TabIconsPlan {
    val owner = tgMutableClassDefByOrNull(strip)
    fits(owner != null, "the folder tab strip is missing")
    fun makesTab(reference: MethodReference?) = reference != null && reference.name == "<init>" &&
        reference.parameterTypes.map(CharSequence::toString).let { it.size == 4 && it[0] == strip && it[1] == "I" &&
            it[2] in listOf(SPANNABLE, CHARS) && it[3] == "Z" }
    val edits = mutableListOf<TabIconEdit>()
    val makers = mutableListOf<MethodReference>()
    for (method in owner!!.methods) {
        method.controlBody().forEachIndexed { index, instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            if (instruction.opcode != Opcode.INVOKE_DIRECT || !makesTab(reference)) return@forEachIndexed
            val (_, _, idAt, titleAt) = instruction.namedRegisters()
            fits(idAt <= 15 && titleAt <= 15, "the folder tab's title keeps its registers out of reach")
            val type = reference!!.parameterTypes[2].toString()
            val cast = if (type == CHARS) "" else "\ncheck-cast v$titleAt, $type"
            edits += TabIconEdit(method, index, "invoke-static {v$titleAt, v$idAt}, $TAB_TITLE\nmove-result-object v$titleAt$cast",
                if (type == CHARS) 2 else 3)
            makers += reference
        }
    }
    fits(edits.isNotEmpty(), "the folder tab strip makes no tabs this build's way")
    val tab = makers.map { it.definingClass }.distinct().singleOrNull()
    val made = makers.map { it.toString() }.distinct().singleOrNull()
    fits(tab != null && made != null, "the folder tab strip makes more than one kind of tab")

    // The tab's constructor keeps its id and its title, each in a field of its own.
    val tabClass = tgMutableClassDefByOrNull(tab!!)
    fits(tabClass != null, "the folder tab class is missing")
    val init = tabClass!!.methods.singleOrNull { it.toString() == made }
    fits(init?.implementation != null, "the folder tab's constructor is missing")
    val self = init!!.implementation!!.registerCount - 5
    fun stored(opcode: Opcode, register: Int) = init.controlBody().filter { it.opcode == opcode &&
        (it as TwoRegisterInstruction).registerA == register && it.registerB == self }.mapNotNull { it.controlField() }
    val id = stored(Opcode.IPUT, self + 2).singleOrNull()
    val title = stored(Opcode.IPUT_OBJECT, self + 3).singleOrNull()
    fits(id != null && title != null && title.type == CHARS, "the folder tab keeps its id or title another way")
    val idField = id.toString()
    val titleField = title.toString()

    // Every other method that stores a title: the check against the old one, and the last store.
    for (method in tabClass.methods) {
        if (method.toString() == made || AccessFlags.STATIC.isSet(method.accessFlags)) continue
        val body = method.controlBody()
        val stores = body.indices.filter { body[it].opcode == Opcode.IPUT_OBJECT && body[it].controlField()?.toString() == titleField }
        if (stores.isEmpty()) continue
        val last = body[stores.last()] as TwoRegisterInstruction
        fits(last.registerA <= 15 && last.registerB <= 15, "the folder tab's new title keeps its registers out of reach")
        edits += TabIconEdit(method, stores.last(), "invoke-static {v${last.registerA}, v${last.registerB}}, $TAB_RETITLE\n" +
            "move-result-object v${last.registerA}", 2)
        val checks = body.indices.filter { index ->
            index > 0 && index < stores.first() && body[index].controlRef() == TEXT_EQUALS && body[index - 1].opcode == Opcode.IGET_OBJECT &&
                body[index - 1].controlField()?.toString() == titleField &&
                (body[index - 1] as TwoRegisterInstruction).registerA in body[index].namedRegisters()
        }
        fits(checks.size == 1, "the folder tab's title check changed")
        val old = (body[checks.single() - 1] as TwoRegisterInstruction).registerA
        fits(old <= 15, "the folder tab's title check keeps its registers out of reach")
        edits += TabIconEdit(method, checks.single(), "invoke-static {v$old}, $TAB_PLAIN\nmove-result-object v$old", 2)
    }

    // The position stub reads the tab's id, and the flag stubs the folder's own fields.
    for (reference in listOf(idField, LOCAL_FLAGS, LOCAL_ALWAYS)) {
        try {
            requireReachable(reference, false)
        } catch (failed: PatchException) {
            throw NoTabIcons("$reference isn't reachable from the extension")
        }
    }
    return TabIconsPlan(edits, tab, idField, null)
}

/** Gives TabIcons' stubs this build's folder flags, always shown chats and tab id. */
internal fun BytecodePatchContext.writeTabIconsStubs(plan: TabIconsPlan) {
    val folderAt = """
        invoke-static {p0}, $CONTROLLER_INSTANCE
        move-result-object v0
        invoke-virtual {v0}, $FOLDERS
        move-result-object v0
        invoke-virtual {v0, p1}, $LIST->get(I)$OBJECT
        move-result-object v0
        check-cast v0, $LOCAL_FILTER
    """
    writeStub(TAB_ICONS, "folderFlags", 3, "$folderAt\niget v0, v0, $LOCAL_FLAGS\nreturn v0")
    writeStub(TAB_ICONS, "folderPicks", 3, "$folderAt\niget-object v0, v0, $LOCAL_ALWAYS\n" +
        "invoke-virtual {v0}, $LIST->size()I\nmove-result v0\nreturn v0")
    writeStub(TAB_ICONS, "tabPosition", 1, """
        check-cast p0, ${plan.tab}
        iget p0, p0, ${plan.id}
        return p0
    """)
}
