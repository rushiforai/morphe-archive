package app.morphe.patches.iscreentv.update

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.iscreentv.shared.Constants.COMPATIBILITY_ISCREENTV
import app.morphe.patches.iscreentv.shared.morphe.com.rockstreamer.iscreentv.pojo.ForceUpdate
import app.morphe.util.matchSingle
import app.morphe.util.returnBoxedBooleanEarly

@Suppress("unused")
val disableUpdatePatch =
    bytecodePatch(
        name = "Disable update",
        description = "Disables forced update.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_ISCREENTV)

        execute {
            ForceUpdate.GetTvForceUpdateFingerprint
                .matchSingle()
                .method
                .returnBoxedBooleanEarly(false)
        }
    }
