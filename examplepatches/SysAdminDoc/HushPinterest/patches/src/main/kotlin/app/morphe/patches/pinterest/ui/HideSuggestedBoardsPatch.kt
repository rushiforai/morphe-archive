/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities

private const val PATCH = "Hide suggested boards"

internal const val SUGGESTED_BOARD_HOOK = "$UI_HOOKS->suggestedBoard(Ljava/util/Collection;Ljava/lang/Object;)V"

/**
 * The Save to sheet's cells are put in a list in one place, and the suggested board's add there
 * goes to the extension instead, on the same list and cell. It adds the cell unless the switch is
 * on, so off or paused the sheet is as it was. Nothing reads what add answers.
 */
@Suppress("unused")
val hideSuggestedBoardsPatch = bytecodePatch(
    name = PATCH,
    description = "Hides the board Pinterest suggests under your own boards when you save a pin, such as one it " +
        "offers to make for you. Your boards and Profile stay. Starts off. Turn it on in HushPinterest " +
        "settings > Interface.",
) {
    category("Interface")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())

    execute {
        requireStatusMethod("hideSuggestedBoards")
        requireStatusMethod("suggestedBoards")
        val add = suggestedBoardAdd(PATCH)
        mutable(add.method).replaceInstruction(add.index, "invoke-static { v${add.list}, v${add.board} }, $SUGGESTED_BOARD_HOOK")
        enableCapability("suggestedBoards")
        enableStatus("hideSuggestedBoards")
    }
}
