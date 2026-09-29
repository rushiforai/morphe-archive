/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.showly.premium

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.all.misc.fix.spoofsignature.spoofSignaturePatch
import app.morphe.util.returnEarly
import hoodles.morphe.compatibility.Compat

val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Enables app features locked behind the subscription paywall."
) {
    compatibleWith(Compat.SHOWLY)

    dependsOn(spoofSignaturePatch)

    execute {
        IsPremiumFingerprint.method.returnEarly(true)
        GetVipFingerprint.method.returnEarly(true)
        CheckEntitlementsFingerprint.method.returnEarly()
    }
}