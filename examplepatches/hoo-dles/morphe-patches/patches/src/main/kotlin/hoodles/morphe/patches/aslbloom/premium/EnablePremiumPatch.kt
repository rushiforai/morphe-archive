package hoodles.morphe.patches.aslbloom.premium

import app.morphe.patcher.patch.bytecodePatch
import hoodles.morphe.compatibility.Compat
import hoodles.morphe.patches.shared.revenuecat.getAddProductPatch

val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Enables app features locked behind the subscription paywall."
) {
    compatibleWith(Compat.ASL_BLOOM)

    dependsOn(getAddProductPatch("premium"))
}