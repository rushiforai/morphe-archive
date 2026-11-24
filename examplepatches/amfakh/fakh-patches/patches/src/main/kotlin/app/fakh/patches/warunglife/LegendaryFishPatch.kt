/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.warunglife

import app.fakh.patches.warunglife.shared.Constants.COMPATIBILITY_WARUNGLIFE
import app.fakh.patches.warunglife.shared.editGameScript
import app.fakh.patches.warunglife.shared.gameScriptPatch
import app.morphe.patcher.patch.intOption
import app.morphe.patcher.patch.rawResourcePatch

@Suppress("unused")
val warungLifeLegendaryFishPatch = rawResourcePatch(
    name = "Legendary fish chance",
    description = "Makes the legendary fish (Ikan dewa) bite more often than the usual 0.6% of catches.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WARUNGLIFE)
    category("Mods")
    dependsOn(gameScriptPatch)

    val chance = intOption(
        key = "chance",
        default = 75,
        values = listOf(5, 10, 25, 50, 75, 100).associateBy { "$it%" },
        title = "Chance (%)",
        description = "The chance in percent that a fish that bites is the legendary fish. The game's own chance " +
            "is 0.6%.",
        required = true,
    ) { value -> value != null && value in 5..100 }

    execute {
        editGameScript { script -> script.setLegendaryChance(chance.value!!) }
    }
}
