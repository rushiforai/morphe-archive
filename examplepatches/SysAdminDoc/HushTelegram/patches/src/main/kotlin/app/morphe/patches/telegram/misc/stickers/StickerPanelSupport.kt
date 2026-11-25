/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.stickers

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.requireThisIntact
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import app.morphe.util.names.addInstructions
import app.morphe.util.names.origType
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val STICKER_PANEL = "$EXTENSION_PACKAGE/misc/StickerPanel;"
internal const val PANEL_COLUMN = "$STICKER_PANEL->column(I)I"
internal const val PANEL_CELL = "$STICKER_PANEL->cell(Ljava/lang/Object;)V"
internal const val PANEL_HEIGHT = "$STICKER_PANEL->height(Ljava/lang/Object;I)I"
internal const val PANEL_CAP = "$STICKER_PANEL->cap(Ljava/lang/Object;I)I"

/** 72f, 82f and 66f: Telegram's sticker column, sticker cell height and largest sticker, in dp. */
internal const val COLUMN_DP = 0x42900000
internal const val HEIGHT_DP = 0x42a40000
internal const val CAP_DP = 0x42840000

private const val DP = "Lorg/telegram/messenger/AndroidUtilities;->dp(F)I"
private const val SET_IMAGE_COORDS = "Lorg/telegram/messenger/ImageReceiver;->setImageCoords(FFFF)V"
private const val MIN = "Ljava/lang/Math;->min(II)I"
private const val MEASURED_HEIGHT = "Landroid/view/View;->getMeasuredHeight()I"
/** A section the panel's grid adapter looks for when it finds a position's tab. */
private const val TRENDING = "trend2"
private const val CELL_OBJECT = "Ljava/lang/Object;"

/** One hook going in at [at] of [method], before the instruction that stands there now. */
internal class PanelEdit(val method: MutableMethod, val at: Int, val smali: String)

/**
 * The sticker panel's hooks: where its grid counts its columns, where the grid and its search make
 * their sticker cells, where those cells measure their height and where a sticker cell caps its
 * sticker. Or [missing], why this build's panel can't take another size.
 */
internal class StickerPanelPlan(val edits: List<PanelEdit>, val missing: String?) {
    /** The same edits on copies, so a smali problem refuses before the app is touched. */
    fun rehearse() {
        edits.groupBy { it.method }.forEach { (method, own) -> edit(MutableMethod(ImmutableMethod.of(method)), own) }
    }

    fun apply() {
        edits.groupBy { it.method }.forEach { (method, own) -> edit(method, own) }
    }

    /** Last first, so the earlier indices still name the instructions they were read from. */
    private fun edit(target: MutableMethod, own: List<PanelEdit>) {
        own.sortedByDescending { it.at }.forEach { target.addInstructions(it.at, it.smali) }
    }
}

private class Refused(why: String) : Exception(why)

private fun refuse(why: String): Nothing = throw Refused(why)

/**
 * EmojiView, the panel under the message box, lays its stickers out in a grid whose adapter counts
 * the columns as the panel's width over dp(72), in two places, and the panel's search lays its
 * results out with that same count. Both adapters make their sticker cells as a subclass of
 * StickerEmojiCell that measures itself dp(82) tall, and StickerEmojiCell draws its sticker at most
 * dp(66) across. The runtime answers each of those sizes instead, and grows the cell sizes only for
 * the cells the two adapters hand it, since R8 merged the panel's cell class with the masks sheet's.
 */
internal fun BytecodePatchContext.resolveStickerPanel(): StickerPanelPlan {
    try {
        requireStatusMethod("stickerPanelSize")
        controlHook(STICKER_PANEL, "column", listOf("I"), "I")
        controlHook(STICKER_PANEL, "cell", listOf(CELL_OBJECT), "V")
        controlHook(STICKER_PANEL, "height", listOf(CELL_OBJECT, "I"), "I")
        controlHook(STICKER_PANEL, "cap", listOf(CELL_OBJECT, "I"), "I")
    } catch (changed: PatchException) {
        return StickerPanelPlan(emptyList(), "the sticker panel's runtime hooks changed (${changed.message})")
    }
    return try {
        StickerPanelPlan(panelEdits(), null)
    } catch (refused: Refused) {
        StickerPanelPlan(emptyList(), refused.message)
    } catch (refused: PatchException) {
        StickerPanelPlan(emptyList(), refused.message)
    }
}

private fun BytecodePatchContext.panelEdits(): List<PanelEdit> {
    val edits = mutableListOf<PanelEdit>()

    // The grid adapter: width / dp(72) into its column count, in every place it works the count out.
    val grids = mutableListOf<Pair<String, List<Pair<String, ColumnSite>>>>()
    forEachClassMentioning(Mention.literal(COLUMN_DP) and Mention.string(TRENDING)) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        if (cls.methods.none { m -> m.controlBody().any { it.controlString() == TRENDING } }) return@forEachClassMentioning
        val sites = cls.methods.flatMap { m -> columnSites(cls.type, m).map { m.toString() to it } }
        if (sites.isNotEmpty()) grids += cls.type to sites
    }
    if (grids.size != 1) refuse("the sticker panel no longer counts its columns in one class (${grids.size})")
    val (grid, columns) = grids.single()
    if (columns.map { it.second.field }.toSet().size != 1) refuse("the sticker panel's column counts go to different fields")
    for ((signature, site) in columns) {
        val method = tgMutableClassDefBy(grid).methods.single { it.toString() == signature }
        requireOnlyFallThrough(method, site.at, "the sticker panel's column width")
        edits += PanelEdit(method, site.at, """
            invoke-static/range {v${site.width} .. v${site.width}}, $PANEL_COLUMN
            move-result v${site.width}
        """)
    }

    // The panel itself, which every one of its adapters holds as its enclosing instance.
    val outer = tgClassDefByOrNull(grid)!!.fields
        .filter { !AccessFlags.STATIC.isSet(it.accessFlags) && AccessFlags.SYNTHETIC.isSet(it.accessFlags) && it.type.startsWith("L") }
        .map { it.type }.distinct()
    if (outer.size != 1) refuse("the sticker panel's grid no longer holds the panel (${outer.size})")
    val panel = outer.single()

    // StickerEmojiCell: the one class that caps its sticker at dp(66) of its measured size before it places it.
    val caps = mutableListOf<Triple<String, String, Int>>()
    forEachClassMentioning(Mention.literal(CAP_DP) and Mention.reference(SET_IMAGE_COORDS)) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        for (m in cls.methods) capSites(m).forEach { caps += Triple(cls.type, m.toString(), it) }
    }
    if (caps.size != 1) refuse("a sticker cell no longer caps its sticker in one place (${caps.size})")
    val (cellBase, capSignature, capAt) = caps.single()
    val capMethod = tgMutableClassDefBy(cellBase).methods.single { it.toString() == capSignature }
    val capRegister = capMethod.controlBody()[capAt - 1].namedRegisters().single()
    val self = capMethod.localRegisterCount()
    capMethod.requireThisIntact("Sticker panel size", listOf(capAt))
    if (capMethod.controlBody()[capAt].namedRegisters().firstOrNull() != self) refuse("a sticker cell no longer measures itself right after its cap")
    if (self > 15 || capRegister > 15) refuse("a sticker cell's cap can't be passed to the extension as it is")
    requireOnlyFallThrough(capMethod, capAt, "a sticker cell's cap")
    edits += PanelEdit(capMethod, capAt, """
        invoke-static {v$self, v$capRegister}, $PANEL_CAP
        move-result v$capRegister
    """)

    // The adapters that make the panel's sticker cells: the grid and its search, each a class inside the panel.
    val cellTypes = subclassesOf(cellBase)
    val creators = mutableListOf<Triple<String, String, CellSite>>()
    forEachClassMentioning(Mention.anyOf(cellTypes.map { Mention.type(it) })) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        if (cls.fields.none { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == panel }) return@forEachClassMentioning
        for (m in cls.methods) {
            if (m.parameterTypes.map(CharSequence::toString) != listOf("Landroid/view/ViewGroup;", "I") || !m.returnType.startsWith("L")) continue
            cellSites(m, cellTypes).forEach { creators += Triple(cls.type, m.toString(), it) }
        }
    }
    val adapters = creators.map { it.first }.distinct()
    if (grid !in adapters || adapters.size != 2) refuse("the sticker panel and its search no longer make their own sticker cells (${adapters.size})")
    for ((owner, signature, site) in creators) {
        val method = tgMutableClassDefBy(owner).methods.single { it.toString() == signature }
        // Right after the cell is built, on the way from its constructor only: the other cell kinds
        // jump past to where the cell goes into its holder.
        edits += PanelEdit(method, site.init + 1, "invoke-static/range {v${site.cell} .. v${site.cell}}, $PANEL_CELL")
    }

    // Each cell class measures itself dp(82) tall.
    for (cellType in creators.map { it.third.type }.distinct()) {
        val measure = tgMutableClassDefBy(cellType).methods.filter {
            it.name == "onMeasure" && it.parameterTypes.map(CharSequence::toString) == listOf("I", "I") && it.returnType == "V"
        }
        val heights = measure.flatMap { m -> dpSites(m.controlBody(), HEIGHT_DP).map { m to it } }
        if (heights.isEmpty()) refuse("the sticker panel's cell no longer measures itself dp(82) tall")
        for ((method, at) in heights) {
            val height = method.controlBody()[at - 1].namedRegisters().single()
            val cell = method.localRegisterCount()
            method.requireThisIntact("Sticker panel size", listOf(at))
            if (cell > 15 || height > 15) refuse("a sticker cell's height can't be passed to the extension as it is")
            requireOnlyFallThrough(method, at, "a sticker cell's height")
            edits += PanelEdit(method, at, """
                invoke-static {v$cell, v$height}, $PANEL_HEIGHT
                move-result v$height
            """)
        }
    }
    return edits
}

/** A column count's width: the hook's index, right after dp(72)'s result, its register, and the count's field. */
private class ColumnSite(val at: Int, val width: Int, val field: String)

/** `const/high16 72f`, dp, its result, `div-int` of the width by it and an `iput` of the count into [owner]. */
private fun columnSites(owner: String, method: Method): List<ColumnSite> {
    val body = method.controlBody()
    return dpSites(body, COLUMN_DP).mapNotNull { at ->
        val width = body[at - 1].namedRegisters().single()
        val divide = body.getOrNull(at) ?: return@mapNotNull null
        val count = when (divide.opcode) {
            Opcode.DIV_INT_2ADDR -> divide.namedRegisters().takeIf { it[1] == width }?.get(0)
            Opcode.DIV_INT -> divide.namedRegisters().takeIf { it[2] == width }?.get(0)
            else -> null
        } ?: return@mapNotNull null
        val store = body.getOrNull(at + 1) ?: return@mapNotNull null
        val field = store.controlField()
        if (store.opcode != Opcode.IPUT || store.namedRegisters()[0] != count || field == null ||
            field.definingClass != owner || field.type != "I") return@mapNotNull null
        ColumnSite(at, width, field.toString())
    }
}

/** Each index right after `const/high16 [literal]`, an AndroidUtilities.dp call on it and its `move-result`. */
private fun dpSites(body: List<Instruction>, literal: Int): List<Int> = body.indices.filter { at ->
    val load = body[at]
    at + 3 <= body.size && load.opcode == Opcode.CONST_HIGH16 && (load as NarrowLiteralInstruction).narrowLiteral == literal &&
        body[at + 1].controlRef() == DP && body[at + 1].namedRegisters() == listOf((load as OneRegisterInstruction).registerA) &&
        body[at + 2].opcode == Opcode.MOVE_RESULT
}.map { it + 3 }

/**
 * dp(66), then the smaller of it and the smaller of the cell's measured height and width, which the
 * method then places the sticker's image in. The index right after dp's result, where the cell's
 * measured height is asked for.
 */
private fun capSites(method: Method): List<Int> {
    val body = method.controlBody()
    if (body.none { it.controlRef() == SET_IMAGE_COORDS }) return emptyList()
    return dpSites(body, CAP_DP).filter { at ->
        val cap = body[at - 1].namedRegisters().single()
        body.getOrNull(at)?.controlRef() == MEASURED_HEIGHT &&
            body.subList(at, minOf(body.size, at + 8)).any { it.controlRef() == MIN && cap in it.namedRegisters() }
    }
}

/** A cell made in an adapter: its class, the register that holds it and its constructor's index. */
private class CellSite(val type: String, val cell: Int, val init: Int)

/** Each `new-instance` of one of [types] and the constructor call right after it on the same register. */
private fun cellSites(method: Method, types: Set<String>): List<CellSite> {
    val body = method.controlBody()
    return body.indices.mapNotNull { at ->
        val made = body[at]
        val type = ((made as? ReferenceInstruction)?.reference as? TypeReference)?.type ?: return@mapNotNull null
        if (made.opcode != Opcode.NEW_INSTANCE || type !in types) return@mapNotNull null
        val cell = made.namedRegisters().single()
        // Only loads of the constructor's other arguments come between.
        var init = at + 1
        while (init < body.size && body[init].opcode in ARGUMENT_LOADS && body[init].namedRegisters().first() != cell) init++
        val call = body.getOrNull(init) ?: return@mapNotNull null
        val built = (call as? ReferenceInstruction)?.reference as? MethodReference
        if ((call.opcode != Opcode.INVOKE_DIRECT && call.opcode != Opcode.INVOKE_DIRECT_RANGE) || built == null ||
            built.definingClass != type || built.name != "<init>" || call.namedRegisters().firstOrNull() != cell) return@mapNotNull null
        if (init + 1 >= body.size) return@mapNotNull null
        CellSite(type, cell, init)
    }
}

private val ARGUMENT_LOADS = setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST, Opcode.CONST_HIGH16, Opcode.MOVE_OBJECT,
    Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.IGET_OBJECT, Opcode.IGET_BOOLEAN, Opcode.SGET_OBJECT)

/** [base] and every class of the app that extends it, however far down. */
private fun BytecodePatchContext.subclassesOf(base: String): Set<String> {
    val parents = HashMap<String, String>()
    classDefForEach { cls -> cls.superclass?.let { parents[cls.type] = it } }
    return parents.keys.filterTo(mutableSetOf(base)) { type ->
        var at: String? = type
        var depth = 0
        while (at != null && at != base && depth++ < 32) at = parents[at]
        at == base
    }
}

/** Refuses unless only the instruction before [at] leads to it, so nothing jumps past a hook going in there. */
private fun requireOnlyFallThrough(method: Method, at: Int, what: String) {
    val flow = ControlFlow.of(method)
    if (flow.normal.indices.filter { at in flow.normal[it] } != listOf(at - 1)) refuse("something jumps into $what")
}
