package app.hillclimb.patches.ad

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.hillclimb.patches.shared.Constants.COMPATIBILITY_HILLCLIMB

private const val MAIN_ACTIVITY = "Lcom/fingersoft/game/MainActivity;"

@Suppress("unused")
val hillClimbRewardedVideoPatch = bytecodePatch(
    name = "Hill Climb Racing Instant Rewarded Video Rewards",
    description = "Rewarded ads pay out instantly: the engine is told a rewarded video is available and receives the started and completed callbacks straight away, so no video plays and every reward is granted offline.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_HILLCLIMB)

    execute {
        HasVideoCampaignsFingerprint.method.addInstructions(0, """
            const/4 p0, 0x1
            return p0
        """.trimIndent())

        PlayRewardedVideoAdFingerprint.method.addInstructions(0, """
            invoke-static {}, $MAIN_ACTIVITY->onVideoStartedSuccess()V
            invoke-static {}, $MAIN_ACTIVITY->onVideoCompletedSuccess()V
            return-void
        """.trimIndent())
    }
}