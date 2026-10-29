package app.mightymorphing.patches.joey

import app.mightymorphing.patches.shared.Constants.JOEY
import app.mightymorphing.patches.shared.insertAt
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val disableTooltipsPatch = bytecodePatch(
    name = "Disable tooltips",
    description = "Turns off the first-run tips Joey shows.",
) {
    compatibleWith(JOEY)

    execute {
        TutorialSeenFingerprint.method.insertAt(
            0,
            """
            const/4 v0, 0x1
            return v0
            """,
        )
    }
}
