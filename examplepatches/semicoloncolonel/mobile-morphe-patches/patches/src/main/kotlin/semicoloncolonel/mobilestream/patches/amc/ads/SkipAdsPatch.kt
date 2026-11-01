package semicoloncolonel.mobilestream.patches.amc.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.amc.shared.Constants

// AMC+ inserts ads server-side with Brightcove SSAI. The true[X] and
// Brightline interactive ads are rendered from those same SSAI ad pods.
// This sends every video down the path AMC+ already uses for live and
// offline playback, which hands the Video to the player without an
// SSAIComponent, so no VMAP is requested and no ad pods are scheduled.
// The player UI already treats a null ssaiComponent as "no ad timeline".
@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Plays AMC+ videos without Brightcove's server-side ad insertion, which also " +
        "removes the true[X] and Brightline interactive ads. Experimental; test on-device.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        SetVideoToPlayerFingerprint.method.addInstructions(
            0,
            """
                iget-object v0, p0, Lcom/brightcove/player/appcompat/BrightcovePlayerFragment;->baseVideoView:Lcom/brightcove/player/view/BaseVideoView;
                invoke-virtual {v0, p2}, Lcom/brightcove/player/view/BaseVideoView;->add(Lcom/brightcove/player/model/Video;)V
                return-void
            """
        )
    }
}
