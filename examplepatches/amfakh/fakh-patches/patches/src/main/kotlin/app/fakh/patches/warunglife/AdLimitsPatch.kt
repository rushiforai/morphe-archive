/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.warunglife

import app.fakh.patches.warunglife.shared.Constants.COMPATIBILITY_WARUNGLIFE
import app.fakh.patches.warunglife.shared.editGameScript
import app.fakh.patches.warunglife.shared.gameScriptPatch
import app.morphe.patcher.patch.rawResourcePatch

/** The limit the ad rewards are raised to: energy refills per day and discounts per upgrade. */
private const val UNLIMITED = 100

@Suppress("unused")
val warungLifeAdLimitsPatch = rawResourcePatch(
    name = "Unlimited ad rewards",
    description = "Lets you use the energy refill and the upgrade discount of rewarded ads as often as you like, " +
        "instead of once a day and six times per upgrade.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WARUNGLIFE)
    category("Mods")
    dependsOn(gameScriptPatch)

    execute {
        editGameScript { script ->
            val unlimited = script.intConstant(UNLIMITED)
            script.setConstant("MAKS_IKLAN_ENERGI", unlimited)
            script.setConstant("MAKS_IKLAN_UPGRADE", unlimited)
        }
    }
}
