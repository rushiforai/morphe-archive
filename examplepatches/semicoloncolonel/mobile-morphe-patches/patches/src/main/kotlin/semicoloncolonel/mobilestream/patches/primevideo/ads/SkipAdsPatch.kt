package semicoloncolonel.mobilestream.patches.primevideo.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.primevideo.misc.renameSharedPermissionsPatch
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
//
// From 3.0.481.1947 Amazon also serves server-inserted sessions (issue 89):
// the ads are part of the video stream, played by the legacy player's
// ServerInsertedAdEnabledPlaybackStateMachine. An empty plan there leaves the
// ads in the stream and takes away the timeline map that converts stream time
// to the title's own time, so the ads play as part of the title, seeking to
// the start replays the pre-roll, and the subtitles drift by the ads' length.
// For those sessions the patch keeps Amazon's plan and skips each break as it
// starts (ServerInsertedAdSkipper): its clips are marked played and the player
// seeks to the break's end, the same seek Amazon uses for a break already seen.
internal object PrepareAdPlanGetAdPlanFingerprint : Fingerprint(
    returnType = "Lcom/amazon/avod/media/ads/AdPlan;",
    custom = { method, classDef ->
        method.name == "getAdPlan" &&
            classDef.type == "Lcom/amazon/avod/playback/session/workflow/tasks/PrepareAdPlan;"
    },
)

internal object ServerInsertedAdBreakEnterFingerprint : Fingerprint(
    definingClass = "Lcom/amazon/avod/media/ads/internal/state/ServerInsertedAdBreakState;",
    name = "enter",
    returnType = "V",
)

internal object ShouldUseXpPlayerFingerprint : Fingerprint(
    definingClass = "Lcom/amazon/video/xp/configs/XPPlayerMigrationConfig;",
    name = "shouldUseXpPlayer",
    returnType = "Z",
)

private const val SKIPPER = "Lsemicoloncolonel/mobilestream/extension/primevideo/ads/ServerInsertedAdSkipper;"

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Removes ad breaks, including the ads Amazon builds into the video stream.",
) {
    category("Ads")
    compatibleWith(Constants.COMPATIBILITY)

    // A re-signed Prime Video that keeps Amazon's permission names blocks
    // installing other Amazon apps, so every Prime Video patch renames them.
    dependsOn(renameSharedPermissionsPatch)
    extendWith("extensions/extension.mpe")

    execute {
        // getAdPlan has .locals 12, so v0 is free and p5, the session's
        // AdEnabledPlaybackManager, is past v15 and needs the range form.
        PrepareAdPlanGetAdPlanFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static/range { p5 .. p5 }, $SKIPPER->isServerInserted(Ljava/lang/Object;)Z
                move-result v0
                if-nez v0, :server_inserted
                sget-object v0, Lcom/amazon/avod/media/ads/internal/EmptyAdPlan;->INSTANCE:Lcom/amazon/avod/media/ads/internal/EmptyAdPlan;
                return-object v0
                :server_inserted
                nop
            """.trimIndent(),
        )

        // enter(Trigger): p0 is the break state, p1 its AdBreakTrigger. A
        // build without the class has no server-inserted sessions either.
        ServerInsertedAdBreakEnterFingerprint.methodOrNull?.addInstructions(
            0,
            "invoke-static/range { p0 .. p1 }, $SKIPPER->onAdBreakStart(Ljava/lang/Object;Ljava/lang/Object;)V",
        )

        // shouldUseXpPlayer is static with three parameters, so v0 is free.
        ShouldUseXpPlayerFingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
    }
}
