/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val PATCH = "Expand board list"

internal const val SAVE_SHEET_HEIGHT_HOOK = "$UI_HOOKS->saveSheetHeight(I)I"

/**
 * The Save to sheet's height answers its percentage through the extension, right before its only
 * return and on every way into it. The extension answers 100 while the switch is on, which opens
 * the sheet all the way, and the height it was given otherwise.
 */
@Suppress("unused")
val expandBoardListPatch = bytecodePatch(
    name = PATCH,
    description = "Opens the Save to sheet all the way up when you save a pin, so more of your boards show " +
        "without dragging it. Starts off. Turn it on in HushPinterest settings > Interface.",
) {
    category("Interface")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())

    execute {
        requireStatusMethod("expandBoardList")
        requireStatusMethod("boardListHeight")
        val height = mutable(boardPickerHeight(PATCH))
        val (index, answer) = height.instructions().withIndex().filter { (_, instruction) ->
            instruction.opcode == Opcode.RETURN
        }.one("$PATCH: Save to sheet height return")
        val percent = (answer as OneRegisterInstruction).registerA
        height.addInstructionsAtControlFlowLabel(index, """
            invoke-static/range { v$percent .. v$percent }, $SAVE_SHEET_HEIGHT_HOOK
            move-result v$percent
        """)
        enableCapability("boardListHeight")
        enableStatus("expandBoardList")
    }
}
