/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.myscriptmath.misc.premium

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.shared.misc.revenuecat.grantRevenueCatLifetimeEntitlement

private const val ENTITLEMENT = "MyScript Math – Full Access"
private const val PRODUCT = "msmath_standard_lifetime"

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium",
    description = "Unlocks all features after the free trial ends.",
) {
    compatibleWith(AppCompatibilities.MYSCRIPT_MATH)
    extendWith("extensions/extension.mpe")

    execute {
        grantRevenueCatLifetimeEntitlement(ENTITLEMENT, PRODUCT)
    }
}
