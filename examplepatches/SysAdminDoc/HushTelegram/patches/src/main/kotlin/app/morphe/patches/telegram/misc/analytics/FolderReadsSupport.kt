/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.analytics

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.patches.telegram.misc.localcontrols.requireReachable
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import app.morphe.util.names.addInstruction
import app.morphe.util.names.loadsInt
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val FOLDER_READS = "$EXTENSION_PACKAGE/misc/FolderReads;"
private const val OBJECT = "Ljava/lang/Object;"
private const val STRING = "Ljava/lang/String;"
private const val RUNNABLE = "Ljava/lang/Runnable;"
internal const val TAB_MENU = "$FOLDER_READS->tabMenu($OBJECT)V"
private const val MARK_ALL_READ = "Lorg/telegram/messenger/R\$string;->MarkAllAsRead:I"
private const val MARK_READ_ICON = "Lorg/telegram/messenger/R\$drawable;->msg_markread:I"

/** Telegram's own item adder for a folder tab's menu: an icon, a label, a tap and whether to show it. */
private val ADD_ITEM_SHAPE = listOf("I", "Ljava/lang/CharSequence;", RUNNABLE, "Z")

/** How far after the Mark all as read label its own add call sits, in instructions. */
private const val ADD_WINDOW = 10

/** What the extension's call adds to the menu's build: one instruction. */
private const val TAB_MENU_SIZE = 1

/**
 * Where Send read receipts goes in the menu a long press on a folder tab opens (#65): [at] is right
 * after Telegram adds its own Mark all as read to the menu held in register [options], and [adder]
 * is the item adder it used.
 */
internal class FolderReadsSite(
    val menu: MutableMethod,
    val at: Int,
    val options: Int,
    val adder: MethodReference,
) {
    /** The same edit on a copy, so a smali problem shows before the app is touched. */
    fun rehearse() = insert(MutableMethod(ImmutableMethod.of(menu)))

    fun apply() = insert(menu)

    private fun insert(target: MutableMethod) {
        val before = target.implementation!!.instructions.size
        target.addInstruction(at, if (options <= 15) "invoke-static {v$options}, $TAB_MENU"
        else "invoke-static/range {v$options .. v$options}, $TAB_MENU")
        // smali drops an instruction it can't build and only logs it.
        controlShape(target.implementation!!.instructions.size - before == TAB_MENU_SIZE,
            "the folder tab item didn't compile whole")
    }
}

/** The runtime the hook calls. It's the extension's own, so a change there refuses the item. */
private fun BytecodePatchContext.requireFolderReadsRuntime() {
    controlHook(FOLDER_READS, "tabMenu", listOf(OBJECT), "V")
    controlHook(FOLDER_READS, "addItem", listOf(OBJECT, "I", STRING, RUNNABLE), "V")
}

/**
 * The menu a long press on a folder tab opens, found by the item Telegram puts in it: the one place
 * that loads the Mark all as read label and then adds an item under the mark-as-read icon. The
 * extension's call goes right after that item, so Send read receipts sits under it. Refuses with a
 * PatchException for a build that moved any of it.
 */
internal fun BytecodePatchContext.resolveFolderReads(): FolderReadsSite = try {
    requireFolderReadsRuntime()
    folderReads().also {
        // The extension calls Telegram's adder from outside its package.
        requireReachable(it.adder.toString(), false)
        it.rehearse()
    }
} catch (failed: RuntimeException) {
    // Code this build reads in a way nothing here expected, such as a jump the control flow can't follow.
    throw PatchException("Local controls: the folder tab menu can't be read " +
        "(${failed.javaClass.simpleName}: ${failed.message}) (before editing)")
}

/** The stub takes Telegram's own adder, then the menu's build asks the extension. */
internal fun BytecodePatchContext.installFolderReads(site: FolderReadsSite) {
    writeStub(FOLDER_READS, "addItem", 5, """
        check-cast p0, ${site.adder.definingClass}
        const/4 v0, 0x1
        invoke-virtual {p0, p1, p2, p3, v0}, ${site.adder}
        return-void
    """)
    site.apply()
}

private fun BytecodePatchContext.folderReads(): FolderReadsSite {
    val menus = mutableListOf<MutableMethod>()
    forEachClassMentioning(Mention.reference(MARK_ALL_READ) and Mention.reference(MARK_READ_ICON)) { cls ->
        if (!cls.origType.startsWith("Lapp/hushtelegram/")) {
            menus += tgMutableClassDefBy(cls.type).methods.filter { markAllReadAdd(it.controlBody()) >= 0 }
        }
    }
    val method = menus.controlSingle("the folder tab menu's Mark all as read")
    val body = method.controlBody()
    val add = markAllReadAdd(body)
    val registers = body[add].namedRegisters()
    controlShape(registers.size == 5, "the folder tab menu's item adder changed")
    val at = add + 1
    controlShape(at < body.size, "the folder tab menu ends at its Mark all as read")

    // The call sits between Telegram's item and whatever comes next, so nothing may arrive there on
    // its own: a jump into that place would add the item on a path that added no Mark all as read.
    val flow = ControlFlow.of(method)
    controlShape(flow.normal.indices.none { it != add && at in flow.normal[it] } && flow.exceptional.none { at in it },
        "something jumps into the folder tab menu's Mark all as read")

    return FolderReadsSite(method, at, registers[0], body[add].call()!!)
}

/**
 * In [body], where Telegram adds its own Mark all as read to a folder tab's menu: the label's load,
 * then its add call under the mark-as-read icon. -1 for a body that doesn't have them that way.
 */
private fun markAllReadAdd(body: List<Instruction>): Int {
    val label = body.indices.firstOrNull { body[it].loadsResource(MARK_ALL_READ) } ?: return -1
    for (at in label + 1 until minOf(body.size, label + 1 + ADD_WINDOW)) {
        if (body[at].opcode != Opcode.INVOKE_VIRTUAL) continue
        val call = body[at].call() ?: continue
        if (call.origParameterTypes != ADD_ITEM_SHAPE || call.origReturnType != "V") continue
        if (!body[at - 1].loadsResource(MARK_READ_ICON)) continue
        return at
    }
    return -1
}

/** Whether this instruction loads the resource [field] names, as the literal 13.2 inlined or as the field. */
private fun Instruction.loadsResource(field: String) = loadsInt() && controlRef() == field

private fun Instruction.call(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference
