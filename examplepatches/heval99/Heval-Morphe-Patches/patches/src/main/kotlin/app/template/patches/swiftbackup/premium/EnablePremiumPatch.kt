package app.template.patches.swiftbackup.premium

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_SWIFTBACKUP
import app.morphe.util.returnEarly

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks the premium features."
) {
    compatibleWith(COMPATIBILITY_SWIFTBACKUP)

    execute {
        PremiumStateFingerprint.methodOrNull?.returnEarly(true)
    }
}
