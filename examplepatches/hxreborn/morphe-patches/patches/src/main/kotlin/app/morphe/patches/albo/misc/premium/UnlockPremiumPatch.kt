/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.albo.misc.premium

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.shared.misc.pairip.removePairipProtectionPatch
import app.morphe.patches.shared.misc.revenuecat.grantRevenueCatEntitlements

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium",
    description = "Unlocks Pro and Max features. Import limits are not included.",
) {
    compatibleWith(AppCompatibilities.ALBO)
    dependsOn(removePairipProtectionPatch)
    extendWith("extensions/extension.mpe")

    execute {
        grantRevenueCatEntitlements("Pro" to "albo_pro_monthly", "max" to "albo_max_monthly")
    }
}
