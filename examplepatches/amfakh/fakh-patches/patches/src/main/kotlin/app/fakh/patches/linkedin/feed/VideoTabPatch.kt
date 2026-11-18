package app.fakh.patches.linkedin.feed

import app.fakh.patches.linkedin.shared.Constants.COMPATIBILITY_LINKEDIN
import app.fakh.patches.linkedin.shared.Constants.EXTENSION_PACKAGE
import app.fakh.patches.linkedin.shared.markIncluded
import app.fakh.patches.linkedin.shared.sduiComponentFilterPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch

/**
 * SimpleMediaPlayer.setPlayWhenReady(reason, playWhenReady, userInitiated). The Video tab prepares the next videos
 * ahead and plays only the one on screen, so the last player told to play is that video's.
 */
private object SetPlayWhenReadyFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/media/player/simpleplayer/SimpleMediaPlayer;",
    name = "setPlayWhenReady",
    returnType = "V",
    parameters = listOf("I", "Z", "Z"),
)

@Suppress("unused")
val videoTabPatch = patch(
    name = "Video tab",
    description = "Shows the video's time above the seek bar and can go to the next video when one ends. " +
        "Adds switches in Fakh Patches.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Feed")

    // The tab's posts are remembered in the SDUI component hook, and its screen is seen by the SduiFragment hooks.
    dependsOn(sduiComponentFilterPatch)

    execute {
        markIncluded("isVideoTabIncluded")

        // At method entry every local register is free; the p registers can be above v15.
        SetPlayWhenReadyFingerprint.method.addInstructions(
            0,
            """
                move-object/from16 v0, p0
                move/from16 v1, p2
                invoke-static { v0, v1 }, $EXTENSION_PACKAGE/VideoTab;->onPlayWhenReady(Ljava/lang/Object;Z)V
            """
        )
    }
}
