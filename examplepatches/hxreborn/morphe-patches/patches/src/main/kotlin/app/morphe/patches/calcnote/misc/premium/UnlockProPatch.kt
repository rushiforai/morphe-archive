/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.calcnote.misc.premium

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.calcnote.misc.fix.signature.spoofSignaturePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.shared.misc.revenuecat.grantRevenueCatEntitlements

private const val ENTITLEMENT = "pro"
private const val PRODUCT = "calcnote_pro_plan"

@Suppress("unused")
val unlockProPatch = bytecodePatch(
    name = "Unlock pro",
    description = "Unlocks Pro features and removes ads.",
) {
    compatibleWith(AppCompatibilities.CALCNOTE)
    extendWith("extensions/extension.mpe")

    dependsOn(spoofSignaturePatch)

    execute {
        grantRevenueCatEntitlements(ENTITLEMENT to PRODUCT)
    }
}
