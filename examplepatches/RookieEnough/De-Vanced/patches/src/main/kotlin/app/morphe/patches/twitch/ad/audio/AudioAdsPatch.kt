/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/twitch/ad/audio/AudioAdsPatch.kt
 */
package app.morphe.patches.twitch.ad.audio

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val blockAudioAdsPatch = bytecodePatch(
    name = "Block audio ads",
    description = "Blocks audio ads in streams and VODs.",
) {
    compatibleWith(AppCompatibilities.TWITCH)

    execute {
        // Upstream conditionCall depends on extension/resources; for now block unconditionally.
        AudioAdsPresenterPlayMethodFingerprint.method.addInstructions(
            0,
            "return-void",
        )
    }
}

