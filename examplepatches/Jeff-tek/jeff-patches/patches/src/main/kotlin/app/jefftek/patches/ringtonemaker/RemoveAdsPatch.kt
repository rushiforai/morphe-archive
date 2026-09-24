package app.jefftek.patches.ringtonemaker

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.jefftek.patches.shared.Constants.COMPATIBILITY_RINGTONE_MAKER

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Removes splash, interstitial and banner ads from MP3 Cutter and Ringtone Maker.",
    default = true
) {
    compatibleWith(COMPATIBILITY_RINGTONE_MAKER)

    execute {
        // Master ads-enabled switch: return false = ads disabled everywhere.
        AdsEnabledFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )

        // Force the "no ads" flag in BaseBannerAdActivity, hiding the banner
        // container in every activity that extends it.
        BannerDisplayFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                iput-boolean v0, p0, Lcom/inshot/videotomp3/BaseBannerAdActivity;->D:Z
            """
        )
    }
}
