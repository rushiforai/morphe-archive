/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.quranify.misc.premium

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.quranify.misc.integrity.bypassIntegrityCheckPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.shared.misc.pairip.removePairipProtectionPatch
import app.morphe.patches.shared.misc.revenuecat.grantRevenueCatEntitlements

private const val ENTITLEMENT = "Quranify Premium"
private const val PRODUCT = "quranify_premium"

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium",
    description = "Unlocks downloading every surah, lyrics and tafsir, Android Auto, " +
        "background playback controls, and insights.",
) {
    dependsOn(bypassIntegrityCheckPatch, removePairipProtectionPatch)
    compatibleWith(AppCompatibilities.QURANIFY)
    extendWith("extensions/extension.mpe")

    execute {
        grantRevenueCatEntitlements(ENTITLEMENT to PRODUCT)
    }
}
