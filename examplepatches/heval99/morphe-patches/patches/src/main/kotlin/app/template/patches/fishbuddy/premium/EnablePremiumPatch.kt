package app.template.patches.fishbuddy.premium

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_FISHBUDDY
import app.morphe.util.returnEarly

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks premium features."
) {
    compatibleWith(COMPATIBILITY_FISHBUDDY)

    execute {
        UserHasPremiumFingerprint.method.returnEarly(value = true)
    }
}