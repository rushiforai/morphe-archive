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
val warungLifeIncomeMultiplierPatch = rawResourcePatch(
    name = "Sales income multiplier",
    description = "Makes every sale to a customer pay several times its price.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WARUNGLIFE)
    category("Mods")
    dependsOn(gameScriptPatch)

    val multiplier = intOption(
        key = "multiplier",
        default = 2,
        values = listOf(2, 3, 4, 5, 10, 20, 50, 100).associateBy { "${it}x" },
        title = "Multiplier",
        description = "How many times the price a sale pays.",
        required = true,
    ) { value -> value != null && value in 2..100 }

    execute {
        editGameScript { script -> script.multiplySale(multiplier.value!!) }
    }
}
