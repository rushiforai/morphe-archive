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
val warungLifeDailyBonusPatch = rawResourcePatch(
    name = "Daily bonus",
    description = "Adds money to your wallet at the start of every day.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WARUNGLIFE)
    category("Mods")
    dependsOn(gameScriptPatch)

    val amount = intOption(
        key = "amount",
        default = 1_000_000,
        values = listOf(10_000, 50_000, 100_000, 200_000, 1_000_000, 2_000_000).associateBy { "Rp$it" },
        title = "Amount",
        description = "The money added at the start of each day, in rupiah.",
        required = true,
    ) { value -> value != null && value > 0 }

    execute {
        editGameScript { script -> script.addDailyBonus(amount.value!!) }
    }
}
