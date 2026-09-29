/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.sleep.premium

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import hoodles.morphe.compatibility.Compat

val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Enables app features locked behind the subscription paywall."
) {
    compatibleWith(Compat.SLEEP)

    execute {
        HasUnlockFingerprint.method.returnEarly(true)
        IsUnlockAckedFingerprint.method.returnEarly(true)
        IsTrialFingerprint.method.returnEarly(false)
    }
}