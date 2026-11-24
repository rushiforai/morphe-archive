/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.warunglife

import app.fakh.patches.warunglife.shared.Constants.COMPATIBILITY_WARUNGLIFE
import app.fakh.patches.warunglife.shared.editGameScript
import app.fakh.patches.warunglife.shared.gameScriptPatch
import app.morphe.patcher.patch.rawResourcePatch

@Suppress("unused")
val warungLifeTesterOutfitPatch = rawResourcePatch(
    name = "Unlock tester outfit",
    description = "Unlocks the Kaos & sarung outfit that is a reward for the game's testers.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WARUNGLIFE)
    category("Mods")
    dependsOn(gameScriptPatch)

    execute {
        editGameScript { it.unlockTesterOutfit() }
    }
}
