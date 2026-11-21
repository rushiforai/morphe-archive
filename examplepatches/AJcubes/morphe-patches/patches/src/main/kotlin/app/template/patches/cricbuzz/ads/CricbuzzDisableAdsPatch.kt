package app.template.patches.cricbuzz.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.CRICBUZZ_COMPATIBILITY

@Suppress("unused")
val cricbuzzDisableAdsPatch = bytecodePatch(
    name = "Cricbuzz Disable Ads",
    description = "Removes all ads including banner, interstitial, video, and app open ads (always up to date with latest version!)"
) {
    compatibleWith(CRICBUZZ_COMPATIBILITY)

    execute {
        ShouldShowAdsFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """)
    }
}
