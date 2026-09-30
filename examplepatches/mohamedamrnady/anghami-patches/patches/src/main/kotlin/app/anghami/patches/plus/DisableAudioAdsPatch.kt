package app.anghami.patches.plus

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.anghami.patches.shared.Constants.COMPATIBILITY_ANGHAMI_8_0_28

/**
 * Treats every song as ad-free at the song-flag level.
 *
 * - PlayQueue.getDisableAds -> true
 * - AdSettings.noAd(Song) (static) / getNoAd(Song) -> true
 *
 * Client flag only; popup/banner UI is covered by the popup and upsell
 * patches.
 */
@Suppress("unused")
val disableAudioAdsPatch = bytecodePatch(
    name = "Disable audio ads",
    description = "Forces AdSettings.noAd=true and PlayQueue.getDisableAds=true so songs are treated as ad-free locally. Client flag only.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ANGHAMI_8_0_28)

    execute {
        GetDisableAdsFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
        NoAdStaticFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
        GetNoAdFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
    }
}
