package app.sledgesune.patches.syncme.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.sledgesune.patches.shared.Constants.COMPATIBILITY_SYNCME

@Suppress("unused")
val hideAdsPatch = patch(
    name = "Hide ads",
    description = "Removes all ads (banners, native, interstitial and app-open ads), " +
        "the same way the \"No Ads\" purchase does. Other Premium features stay locked.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SYNCME)

    execute {
        // Make isAdFree() always return true.
        IsAdFreeFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
    }
}
