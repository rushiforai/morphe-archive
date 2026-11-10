package app.morphe.patches.addatimes.ui

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.addatimes.shared.Constants.COMPATIBILITY_ADDATIMES
import app.morphe.patches.addatimes.shared.Constants.COMPATIBILITY_ADDATIMESTV
import app.morphe.patches.addatimes.shared.morphe.com.addatimes.addatimes.data.model.get.ContentUserData
import app.morphe.util.matchSingle
import app.morphe.util.returnEarly

@Suppress("unused")
val playButtonPatch =
    bytecodePatch(
        name = "Play button",
        description = "Change the play button label.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_ADDATIMES, COMPATIBILITY_ADDATIMESTV)

        execute {
            ContentUserData.GetPlayButtonLabelFingerprint
                .matchSingle()
                .method
                .returnEarly("Play")
        }
    }
