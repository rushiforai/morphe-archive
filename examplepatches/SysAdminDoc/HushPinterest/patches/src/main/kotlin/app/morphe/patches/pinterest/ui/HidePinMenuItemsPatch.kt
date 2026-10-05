/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.freeLocalsAt
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal val FILTERABLE_PIN_MENU_TITLES = setOf(
    "overflow_menu_add_to_collage", "overflow_menu_remix_collage",
    "contextmenu_visual_search_image", "overflow_menu_pin_boost",
)

/** The menu still creates its own rows and actions. Only the requested optional rows are folded. */
@Suppress("unused")
val hidePinMenuItemsPatch = bytecodePatch(
    name = "Filter pin menu",
    description = "Adds separate switches for collage, visual-search and Promote pin menu entries. Download, share and copy-link actions remain available.",
    default = false,
) {
    category("Interface")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())
    execute {
        requireStatusMethod("hidePinMenuItems")
        requireStatusMethod("pinMenuItems")
        val modal = classDefBy(PIN_MENU)
        val viewType = modal.fields.filter { it.name == "modalView" }.one("Pin menu view field").type
        val view = mutableClassDefBy(viewType)
        val constructor = view.methods.filter { it.name == "<init>" && it.implementation != null }
            .one("Pin menu view constructor")
        val instructions = constructor.instructions()
        data class Row(val at: Int, val view: Int, val scratch: Int, val key: String)
        val rows = mutableListOf<Row>()
        for ((index, instruction) in instructions.withIndex()) {
            val title = ((instruction as? ReferenceInstruction)?.reference as? FieldReference)
                ?.takeIf { it.name in FILTERABLE_PIN_MENU_TITLES && it.type == "I" } ?: continue
            if (instruction.opcode != Opcode.SGET) continue
            val id = (instruction as OneRegisterInstruction).registerA
            val callIndex = (index + 1 until minOf(index + 20, instructions.size)).firstOrNull { next ->
                val candidate = instructions[next]
                val call = ((candidate as? ReferenceInstruction)?.reference as? MethodReference)
                call?.definingClass == viewType && call.returnType == "Landroid/widget/RelativeLayout;" &&
                    call.parameterTypes.getOrNull(0)?.toString() == viewType &&
                    call.parameterTypes.getOrNull(1)?.toString() == "I" &&
                    when (candidate) {
                        is FiveRegisterInstruction -> candidate.registerD == id
                        is RegisterRangeInstruction -> candidate.startRegister + 1 == id
                        else -> false
                    }
            } ?: throw PatchException("No native pin-menu row factory follows ${title.name}")
            val result = instructions.getOrNull(callIndex + 1)
            if (result?.opcode != Opcode.MOVE_RESULT_OBJECT) throw PatchException("Pin-menu row has no object result")
            val rowRegister = (result as OneRegisterInstruction).registerA
            if (rowRegister > 15) throw PatchException("Pin-menu row register exceeds the hook invocation format")
            val at = callIndex + 2
            val scratch = constructor.freeLocalsAt("Pin-menu ${title.name}", at, 1).single()
            rows += Row(at, rowRegister, scratch, title.name)
        }
        val found = rows.map { it.key }.toSet()
        if (found != FILTERABLE_PIN_MENU_TITLES) {
            throw PatchException("Pin-menu title anchors are incomplete: missing ${FILTERABLE_PIN_MENU_TITLES - found}")
        }
        rows.sortedByDescending { it.at }.forEach { row ->
            constructor.addInstructions(row.at, """
                const-string v${row.scratch}, "${row.key}"
                invoke-static { v${row.view}, v${row.scratch} }, $INTERFACE_CONTROLS->pinMenuItem(Landroid/view/View;Ljava/lang/String;)V
            """)
        }
        enableCapability("pinMenuItems")
        enableStatus("hidePinMenuItems")
    }
}
