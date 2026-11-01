package semicoloncolonel.mobilestream.patches.primevideo.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.primevideo.shared.Constants

// Prime Video phone 3.0.477.1447 has two players and picks one per playback.
//
// The legacy AIV player schedules ads in Java (com.amazon.avod.media.ads).
// PrepareAdPlan, a step of every legacy playback session, asks the
// AdPlanFactory for the title's AdPlan (the breaks and their ad clips). Amazon
// ships its own EmptyAdPlan.INSTANCE, the plan used when a session has no ads.
// The patch has getAdPlan() return that, so no ad break is ever scheduled.
//
// The newer XP player schedules ads in its JavaScript engine
// (assets/ATVTerraformPlayerBundleBytecode.hbc) and never asks for an AdPlan.
// Amazon moves accounts to it with a server-side experiment, and every route
// into playback asks XPPlayerMigrationConfig.shouldUseXpPlayer(VideoType,
// PlaybackOptions, isAutoplay) which player to use. The patch has that return
// false, so every title plays in the legacy player. On-device, a title with a
// pre-roll and three mid-roll breaks then played with no ad time at all.
//
// The playback request itself is left alone: VideoSpecification's
// shouldShowAds flag also shapes what the server returns, and asking the
// server for an ad-free stream is not this patch's job.
internal object PrepareAdPlanGetAdPlanFingerprint : Fingerprint(
    returnType = "Lcom/amazon/avod/media/ads/AdPlan;",
    custom = { method, classDef ->
        method.name == "getAdPlan" &&
            classDef.type == "Lcom/amazon/avod/playback/session/workflow/tasks/PrepareAdPlan;"
    },
)

internal object ShouldUseXpPlayerFingerprint : Fingerprint(
    definingClass = "Lcom/amazon/video/xp/configs/XPPlayerMigrationConfig;",
    name = "shouldUseXpPlayer",
    returnType = "Z",
)

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Plays every Prime Video title in the phone app's older player and gives it " +
        "Amazon's own empty ad plan, so no ad break is scheduled. The newer player's features, " +
        "such as its X-Ray views, are not available. The stream request is not changed.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        // getAdPlan has .locals 12.
        PrepareAdPlanGetAdPlanFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Lcom/amazon/avod/media/ads/internal/EmptyAdPlan;->INSTANCE:Lcom/amazon/avod/media/ads/internal/EmptyAdPlan;
                return-object v0
            """.trimIndent(),
        )

        // shouldUseXpPlayer is static with three parameters, so v0 is free.
        ShouldUseXpPlayerFingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
    }
}
