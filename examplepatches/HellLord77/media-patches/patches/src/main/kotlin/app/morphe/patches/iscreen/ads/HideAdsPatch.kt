package app.morphe.patches.iscreen.ads

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.iscreen.shared.Constants.COMPATIBILITY_ISCREEN
import app.morphe.patches.iscreen.shared.morphe.com.rockstreamer.iscreen.util.PreferenceUtil
import app.morphe.util.matchSingle
import app.morphe.util.returnEarly

@Suppress("unused")
val hideAdsPatch =
    bytecodePatch(
        name = "Hide ads",
        description = "Hides all ads from app.",
        default = false,
    ) {
        compatibleWith(COMPATIBILITY_ISCREEN)

        execute {
            PreferenceUtil.IsVastShowFingerprint
                .matchSingle()
                .method
                .returnEarly(false)
            PreferenceUtil.IsBannerAdsShowFingerprint
                .matchSingle()
                .method
                .returnEarly(false)
        }
    }
