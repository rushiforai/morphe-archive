package app.template.patches.findthefire.premium

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.returnEarly

@Suppress("unused")
val findTheFireUnlockFirePassPatch = bytecodePatch(
    name = "Unlock FirePass Premium",
    description = "Unlocks FirePass premium features in Skimboarding: spot filtering by skill level, advanced map features, and session log tools.",
) {
    compatibleWith(FIND_THE_FIRE_COMPATIBILITY)

    execute {
        EntitlementInfoIsActiveFingerprint.method.returnEarly(true)
    }
}
