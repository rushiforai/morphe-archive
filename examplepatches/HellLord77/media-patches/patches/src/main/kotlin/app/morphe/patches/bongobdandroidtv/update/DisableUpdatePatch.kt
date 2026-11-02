package app.morphe.patches.bongobdandroidtv.update

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.bongobdandroidtv.shared.Constants.COMPATIBILITY_BONGOANDROIDTV
import app.morphe.util.matchSingle
import app.morphe.util.returnEarly

@Suppress("unused")
val disableUpdatePatch =
    bytecodePatch(
        name = "Disable update",
        description = "Disables forced update.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_BONGOANDROIDTV)

        execute {
            ForceUpdateFieldAccessFingerprint.matchSingle().method.returnEarly(false)
        }
    }
