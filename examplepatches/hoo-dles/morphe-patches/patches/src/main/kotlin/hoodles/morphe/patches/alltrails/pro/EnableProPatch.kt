/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.alltrails.pro

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import hoodles.morphe.compatibility.Compat

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Peak membership",
    description = "Enables some app features locked behind the subscription paywall. Not all premium functionality is available."
) {
    compatibleWith(Compat.ALL_TRAILS)

    execute {
        IsProFingerprint.method.returnEarly(true)
        GetSubscriptionTierFingerprint.method.returnEarly("peak")
    }
}