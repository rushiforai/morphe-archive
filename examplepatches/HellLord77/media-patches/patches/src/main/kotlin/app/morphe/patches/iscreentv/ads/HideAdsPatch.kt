package app.morphe.patches.iscreentv.ads

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.iscreentv.shared.Constants.COMPATIBILITY_ISCREENTV
import app.morphe.patches.iscreentv.shared.morphe.com.rockstreamer.iscreentv.utils.PreferenceUtil
import app.morphe.util.matchSingle
import app.morphe.util.returnEarly

@Suppress("unused")
val hideAdsPatch =
    bytecodePatch(
        name = "Hide ads",
        description = "Hides all ads from app.",
        default = false,
    ) {
        compatibleWith(COMPATIBILITY_ISCREENTV)

        execute {
            PreferenceUtil.IsVastShowFingerprint
                .matchSingle()
                .method
                .returnEarly(false)
        }
    }
