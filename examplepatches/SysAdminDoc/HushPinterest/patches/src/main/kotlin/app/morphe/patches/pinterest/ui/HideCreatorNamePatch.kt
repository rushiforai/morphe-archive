/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.freeLocalsAt
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val PATCH = "Hide creator name on pins"

/** The row under a pin's buttons with the creator's avatar and name. It keeps its name. */
internal const val CREATOR_ATTRIBUTION = "Lcom/pinterest/activity/pin/view/PinCloseupCreatorAttributionView;"

/** Pinterest's avatar view. It keeps its name. */
internal const val GESTALT_AVATAR = "Lcom/pinterest/gestalt/avatar/GestaltAvatar;"

private const val SET_PADDING = "Landroid/view/View;->setPaddingRelative(IIII)V"

internal const val CREATOR_NAME_HOOK = "$UI_HOOKS->creatorName(Landroid/view/View;)V"

/**
 * Where the creator row's state has been drawn: the method that collects it, the instruction every
 * branch of that drawing meets at, the register holding the row, the avatar's field and a free local.
 */
internal class CreatorRow(val method: Method, val at: Int, val view: Int, val avatar: String, val scratch: Int)

/**
 * The row's state collector draws the avatar, the name and its badges along a few branches, then
 * all of them meet to pad the row's outer layout: it reads that layout and the row's top padding
 * from the row, and hands them to setPaddingRelative with a zero bottom. That meeting point is found
 * by its shape, since the collector's own class is renamed every build, and it is checked to be the
 * only one. The row's constructor pads the same layout from locals, not the row's fields.
 */
internal fun BytecodePatchContext.creatorRow(): CreatorRow {
    val row = classDefByOrNull(CREATOR_ATTRIBUTION) ?: throw PatchException("$PATCH: $CREATOR_ATTRIBUTION is missing")
    val avatar = row.fields.filter { it.type == GESTALT_AVATAR }.one("$PATCH: the creator row's avatar field")
    val sites = mutableListOf<Pair<Method, Int>>()
    classDefForEach { owner ->
        for (method in owner.methods) {
            val body = method.instructions()
            if (body.none { (it as? ReferenceInstruction)?.reference.let { r -> r is FieldReference && r.definingClass == CREATOR_ATTRIBUTION } }) continue
            body.indices.filterTo(mutableListOf()) { padsRow(body, it) }.forEach { sites += method to it }
        }
    }
    val (method, at) = sites.one("$PATCH: the point where the creator row's state has been drawn")
    val view = (method.instructions()[at] as TwoRegisterInstruction).registerB
    if (view > 15) throw PatchException("$PATCH: the creator row is in v$view, past what an iget can name")
    val scratch = method.freeLocalsAt(PATCH, at, 1, highest = 15, reads = listOf(view)).single()
    return CreatorRow(method, at, view, avatar.name, scratch)
}

private fun field(instruction: Instruction?) = (instruction as? ReferenceInstruction)?.reference as? FieldReference

/**
 * True when [at] starts the row's padding: the row's layout and its top padding read from the same
 * register, a zero, then setPaddingRelative on the layout with that top and the zero as its bottom.
 * 14.45.0 works out the start and end sizes earlier, so only these two reads sit next to the call,
 * and the top's read can overwrite the row's own register.
 */
private fun padsRow(body: List<Instruction>, at: Int): Boolean {
    if (at + 3 >= body.size) return false
    val layout = body[at]
    val top = body[at + 1]
    val zero = body[at + 2]
    val pad = body[at + 3]
    if (layout.opcode != Opcode.IGET_OBJECT || top.opcode != Opcode.IGET) return false
    val reads = listOf(layout, top).map { field(it) }
    if (reads.any { it == null || it.definingClass != CREATOR_ATTRIBUTION }) return false
    if (reads[0]!!.type != "Landroid/widget/LinearLayout;" || reads[1]!!.type != "I") return false
    if ((layout as TwoRegisterInstruction).registerB != (top as TwoRegisterInstruction).registerB) return false
    if (zero.opcode != Opcode.CONST_4 || pad.opcode != Opcode.INVOKE_VIRTUAL) return false
    if (((pad as ReferenceInstruction).reference as? MethodReference)?.toString() != SET_PADDING) return false
    val call = pad as FiveRegisterInstruction
    return call.registerCount == 5 && call.registerC == layout.registerA && call.registerE == top.registerA &&
        call.registerG == (zero as OneRegisterInstruction).registerA && (zero as NarrowLiteralInstruction).narrowLiteral == 0
}

@Suppress("unused")
val hideCreatorNamePatch = bytecodePatch(
    name = PATCH,
    description = "Hides the creator's name and badge under a pin you open and keeps their picture, which still opens " +
        "their profile. Starts off. Turn it on in HushPinterest settings > Interface.",
) {
    category("Pin page")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())
    execute {
        requireStatusMethod("hideCreatorName")
        requireStatusMethod("creatorName")
        val row = creatorRow()
        mutable(row.method).addInstructionsAtControlFlowLabel(row.at, """
            iget-object v${row.scratch}, v${row.view}, $CREATOR_ATTRIBUTION->${row.avatar}:$GESTALT_AVATAR
            invoke-static { v${row.scratch} }, $CREATOR_NAME_HOOK
        """)
        enableCapability("creatorName")
        enableStatus("hideCreatorName")
    }
}
