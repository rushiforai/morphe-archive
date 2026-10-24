/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.wallmaa.misc.premium

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.shared.misc.revenuecat.grantRevenueCatLifetimeEntitlement

private const val ENTITLEMENT = "pro"
private const val PRODUCT = "pro_lifetime_launch"

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium",
    description = "Unlocks every collection and removes ads and the download and apply limits.",
) {
    compatibleWith(AppCompatibilities.WALLMAA)
    extendWith("extensions/extension.mpe")

    execute {
        grantRevenueCatLifetimeEntitlement(ENTITLEMENT, PRODUCT)
    }
}
