package app.riky.patches.chefkoch

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.riky.patches.shared.Constants.COMPATIBILITY_CHEFKOCH

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Hides banner, native, interstitial and sponsored ad tiles by treating " +
        "the user as ad-free, the same state a Chefkoch PLUS subscriber has. Also skips " +
        "the ad-consent (CMP) prompt.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CHEFKOCH)

    execute {
        // selectIsAdfree() is the single gate every Admo/Offerista/Consent selector
        // adapter delegates to. Forcing it true removes all ad surfaces client-side.
        SelectIsAdfreeFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )
    }
}
