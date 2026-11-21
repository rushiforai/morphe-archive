package app.badfella.patches.linkedin.feed

import app.badfella.patches.linkedin.shared.Constants.COMPATIBILITY_LINKEDIN
import app.badfella.patches.linkedin.shared.Constants.EXTENSION_PACKAGE
import app.badfella.patches.linkedin.shared.markIncluded
import app.badfella.patches.linkedin.shared.settingsPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

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
val videoTabPatch = bytecodePatch(
    name = "Video tab",
    description = "Shows playback time and can advance to the next video when playback ends.",
    default = false
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)

    dependsOn(settingsPatch)

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
