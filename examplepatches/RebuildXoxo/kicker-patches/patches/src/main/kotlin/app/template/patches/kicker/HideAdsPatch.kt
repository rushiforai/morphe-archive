package app.template.patches.kicker

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.template.patches.shared.Constants.COMPATIBILITY_KICKER

@Suppress("unused")
val hideAdsPatch = patch(
    name = "Hide ads",
    description = "Stops kicker from treating banners, interstitials, and the splash placement as eligible ads.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_KICKER)

    execute {
        AdsEligibleFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )
    }
}
