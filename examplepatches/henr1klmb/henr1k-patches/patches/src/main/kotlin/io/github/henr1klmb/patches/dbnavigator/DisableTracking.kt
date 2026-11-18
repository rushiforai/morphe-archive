package io.github.henr1klmb.patches.dbnavigator

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch

@Suppress("unused")
val disableTrackingPatch = patch(
    name = "Disable tracking",
    description = "Disables Tracking and Analytics.",
) {
    compatibleWith(DB_NAVIGATOR_COMPATIBILITY)

    execute {
        AdjustInitFingerprint.method.addInstructions(
            0,
            "return-void",
        )

        InstanaInitFingerprint.method.addInstructions(
            0,
            "return-void",
        )

        OptimizelyInitFingerprint.method.addInstructions(
            0,
            "return-void",
        )

        QualtricsInitFingerprint.method.addInstructions(
            0,
            "return-void",
        )

        TealiumInitFingerprint.method.addInstructions(
            0,
            "return-void",
        )
    }
}
