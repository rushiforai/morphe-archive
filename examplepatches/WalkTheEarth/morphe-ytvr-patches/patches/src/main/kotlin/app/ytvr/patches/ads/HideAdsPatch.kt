package app.ytvr.patches.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.ytvr.patches.shared.Constants.COMPATIBILITY_YOUTUBE_VR

@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide ads",
    description = "Hides video ads.",
    default = true
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_VR)

    execute {
        // Prevent preroll, midroll, postroll and pause ads from being scheduled
        // by always returning an empty ad break list.
        AdBreakRendererFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Lsna;->a:Lshs;
                return-object v0
            """
        )

        // Prevent ad break responses from being requested over the network.
        AdBreakRequestFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """
        )

        // Prevent ads stored for offline playback from being loaded.
        OfflineAdsFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Lsnf;->b:Lshz;
                return-object v0
            """
        )
    }
}
