package app.morphe.patches.iscreentv.update

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.iscreentv.shared.Constants.COMPATIBILITY_ISCREENTV
import app.morphe.util.matchSingle
import app.morphe.util.returnBoxedBooleanEarly

@Suppress("unused")
val disableUpdatePatch = bytecodePatch(
    name = "Disable update",
    description = "Disables force update",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ISCREENTV)

    execute {
        GetTvForceUpdateFingerprint.matchSingle().method.returnBoxedBooleanEarly(false)
    }
}