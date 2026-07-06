package app.paresh.patches.cricbuzz.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.paresh.patches.cricbuzz.shared.Constants.COMPATIBILITY_CRICBUZZ

@Suppress("unused")
val cricbuzzDisableAdsPatch = bytecodePatch(
    name = "Cricbuzz Disable Ads",
    description = "Removes all ads including banner, interstitial, video, and app open ads."
) {
    compatibleWith(COMPATIBILITY_CRICBUZZ)

    execute {
        ShouldShowAdsFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """)
    }
}
