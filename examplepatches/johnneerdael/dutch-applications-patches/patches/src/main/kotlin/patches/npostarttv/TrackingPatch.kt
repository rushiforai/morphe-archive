package patches.npostarttv

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import patches.atv.exact

@Suppress("unused")
val disableTrackingPatch = bytecodePatch(
    name = "Disable tracking",
    description = "Stops NPO Tag/Topspin/DAM, STER targeting, Bitmovin/Sentry collection, Cast diagnostics and Google telemetry collection/uploads, including queued batches. Preserves playback, authentication and functional Cast controls.",
    default = true,
) {
    compatibleWith(npoTv, npoPhone)
    dependsOn(originalInput, startupCompatibility, trackingResources, trackingEgress)
    execute {
        if (packageMetadata.isNpoPhone) {
            disablePhoneTracking()
            return@execute
        }
        // tagConstructor
        exact("Lnl/npo/player/library/z00/d;",
            "<init>(Lnl/npo/tag/sdk/internal/domain/model/TagContext;Lnl/npo/player/library/ow/b;Lnl/npo/player/library/z00/e;Lio/sentry/x3;Lnl/npo/player/library/a10/h;Lnl/npo/player/library/a10/c;Lnl/npo/player/library/y00/a;Lnl/npo/player/library/x00/c;Ljava/util/Set;Lnl/npo/player/library/l00/a;Lnl/npo/player/library/m00/b;Lio/sentry/android/core/q0;Lnl/npo/player/library/cp/l0;)V",
            14, 39).addInstructions(0, "invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;\nmove-result-object p9")
        // tagIngress
        exact("Lnl/npo/player/library/z00/d;",
            "a(Lnl/npo/tag/sdk/model/EventType;Lnl/npo/tag/sdk/model/PageEvent;)V",
            9, 12).addInstructions(0, "return-void")
        // topspin
        exact("Lnl/npo/player/library/u00/c;",
            "a(Lnl/npo/tag/sdk/model/TagEvent;ILnl/npo/player/library/wp/c;)Ljava/lang/Object;",
            18, 157).addInstructions(0, "sget-object v0, Lnl/npo/player/library/qp/c0;->a:Lnl/npo/player/library/qp/c0;\nreturn-object v0")
        // dam
        exact("Lnl/npo/player/library/x00/c;",
            "b(Lnl/npo/player/library/wp/c;)Ljava/lang/Object;",
            17, 104).addInstructions(0, "sget-object v0, Lnl/npo/player/library/qp/c0;->a:Lnl/npo/player/library/qp/c0;\nreturn-object v0")
        // session
        exact("Lnl/npo/player/library/npotag/model/PlayerPageTrackerImpl;",
            "getSessionData(Lnl/npo/player/library/up/c;)Ljava/lang/Object;",
            3, 12).addInstructions(0, "const-string v0, \"\"\nreturn-object v0")
        // ster
        exact("Lnl/npo/player/library/data/streamLink/model/StreamInfoRequest;",
            "getSter()Lnl/npo/player/library/domain/streamLink/model/StreamInfoSterData;",
            1, 2).addInstructions(0, "const/4 p0, 0x0\nreturn-object p0")
        // sentry
        exact("Lio/sentry/u6;",
            "isEnabled()Z",
            1, 2).addInstructions(0, "const/4 p0, 0x0\nreturn p0")
        // analytics
        exact("Lcom/bitmovin/player/analytics/internal/AnalyticsConfiguratorKt;",
            "configureAnalytics(Lcom/bitmovin/player/api/Player;Landroid/content/Context;Lcom/bitmovin/player/api/analytics/AnalyticsPlayerConfig;)Lcom/bitmovin/player/api/Player;",
            12, 45).addInstructions(0, "return-object p0")
        // analytics
        exact("Lcom/bitmovin/player/analytics/internal/AnalyticsConfiguratorKt;",
            "configureAnalytics(Lcom/bitmovin/player/api/source/Source;Lcom/bitmovin/player/api/analytics/AnalyticsSourceConfig;)Lcom/bitmovin/player/api/source/Source;",
            3, 12).addInstructions(0, "return-object p0")
    }
}
