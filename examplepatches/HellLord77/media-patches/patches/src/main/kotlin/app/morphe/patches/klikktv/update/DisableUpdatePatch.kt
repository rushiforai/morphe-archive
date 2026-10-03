package app.morphe.patches.klikktv.update

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.klikktv.shared.Constants.COMPATIBILITY_KLIKKTV
import app.morphe.patches.klikktv.shared.patches.activity.splashScreen.isUpdateAvailableFieldAccessPatch

@Suppress("unused")
val disableUpdatePatch = bytecodePatch(
    name = "Disable update",
    description = "Force update to be not available.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_KLIKKTV)

    dependsOn(isUpdateAvailableFieldAccessPatch)
}