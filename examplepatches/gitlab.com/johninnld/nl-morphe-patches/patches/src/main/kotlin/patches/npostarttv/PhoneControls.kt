package patches.npostarttv

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import patches.atv.exact

context(context: BytecodePatchContext)
internal fun hidePhoneAds() {
    exact("Lnl/npo/player/library/sterads/presentation/ads/ImaAdManager;",
        "getAdsLoader(Landroid/content/Context;Z)Lnl/npo/player/library/bx/f;", 12, 22)
        .addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
    exact("Lnl/npo/player/library/sw/a;",
        "getPreRollAdUrl()Ljava/lang/String;", 1, 2)
        .addInstructions(0, "const/4 p0, 0x0\nreturn-object p0")
    exact("Lnl/npo/player/library/domain/streamLink/model/StreamLinkAssets;",
        "getPreRollAdUrl()Ljava/lang/String;", 1, 2)
        .addInstructions(0, "const/4 p0, 0x0\nreturn-object p0")
    exact("Lnl/npo/player/library/data/offline/model/OnDiskSourceConfig;",
        "getPreRollAdUrl()Ljava/lang/String;", 1, 2)
        .addInstructions(0, "const/4 p0, 0x0\nreturn-object p0")
    exact("Lnl/npo/player/library/data/extensions/NPOSourceConfigKt\$copyInternal\$newSourceConfig\$1;",
        "getPreRollAdUrl()Ljava/lang/String;", 1, 2)
        .addInstructions(0, "const/4 p0, 0x0\nreturn-object p0")
    exact("Lnl/npo/player/library/tv/a;",
        "getPreRollAdUrl()Ljava/lang/String;", 1, 2)
        .addInstructions(0, "const/4 p0, 0x0\nreturn-object p0")
}

context(context: BytecodePatchContext)
internal fun disablePhoneTracking() {
    exact("Lnl/npo/player/library/v10/d;",
        "<init>(Lnl/npo/tag/sdk/internal/domain/model/TagContext;Lnl/npo/player/library/fx/b;Lnl/npo/player/library/v10/e;Lio/sentry/v3;Lnl/npo/player/library/w10/h;Lnl/npo/player/library/w10/c;Lnl/npo/player/library/u10/a;Lnl/npo/player/library/t10/c;Ljava/util/Set;Lnl/npo/player/library/eu/d;Lnl/npo/player/library/i10/b;Lio/sentry/android/core/s0;Lnl/npo/player/library/sp/j0;)V", 14, 39)
        .addInstructions(0, "invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;\nmove-result-object p9")
    exact("Lnl/npo/player/library/v10/d;",
        "a(Lnl/npo/tag/sdk/model/EventType;Lnl/npo/tag/sdk/model/PageEvent;)V", 9, 12)
        .addInstructions(0, "return-void")
    exact("Lnl/npo/player/library/q10/c;",
        "a(Lnl/npo/tag/sdk/model/TagEvent;ILnl/npo/player/library/oq/c;)Ljava/lang/Object;", 18, 157)
        .addInstructions(0, "sget-object v0, Lnl/npo/player/library/hq/d0;->a:Lnl/npo/player/library/hq/d0;\nreturn-object v0")
    exact("Lnl/npo/player/library/t10/c;",
        "b(Lnl/npo/player/library/oq/c;)Ljava/lang/Object;", 17, 104)
        .addInstructions(0, "sget-object v0, Lnl/npo/player/library/hq/d0;->a:Lnl/npo/player/library/hq/d0;\nreturn-object v0")
    exact("Lnl/npo/player/library/npotag/model/PlayerPageTrackerImpl;",
        "getSessionData(Lnl/npo/player/library/mq/c;)Ljava/lang/Object;", 3, 12)
        .addInstructions(0, "const-string v0, \"\"\nreturn-object v0")
    exact("Lnl/npo/player/library/data/streamLink/model/StreamInfoRequest;",
        "getSter()Lnl/npo/player/library/domain/streamLink/model/StreamInfoSterData;", 1, 2)
        .addInstructions(0, "const/4 p0, 0x0\nreturn-object p0")
    exact("Lio/sentry/s6;",
        "isEnabled()Z", 1, 2)
        .addInstructions(0, "const/4 p0, 0x0\nreturn p0")
    exact("Lcom/bitmovin/player/analytics/internal/AnalyticsConfiguratorKt;",
        "configureAnalytics(Lcom/bitmovin/player/api/Player;Landroid/content/Context;Lcom/bitmovin/player/api/analytics/AnalyticsPlayerConfig;)Lcom/bitmovin/player/api/Player;", 12, 45)
        .addInstructions(0, "return-object p0")
    exact("Lcom/bitmovin/player/analytics/internal/AnalyticsConfiguratorKt;",
        "configureAnalytics(Lcom/bitmovin/player/api/source/Source;Lcom/bitmovin/player/api/analytics/AnalyticsSourceConfig;)Lcom/bitmovin/player/api/source/Source;", 3, 12)
        .addInstructions(0, "return-object p0")
    exact("Lnl/npo/player/library/sterads/presentation/ads/ImaAdManager;",
        "supplyOptionalConfiguration()Lnl/npo/player/library/aw/l;", 1, 2)
        .addInstructions(0, "const/4 p0, 0x0\nreturn-object p0")
    exact("Lnl/npo/player/library/jm/p2;",
        "a(Lnl/npo/player/library/jm/n3;I)V", 5, 6)
        .addInstructions(0, "return-void")
    exact("Lnl/npo/player/library/ak/a;",
        "M(Lnl/npo/player/library/qk/a;)V", 11, 62)
        .addInstructions(0, "return-void")
    exact("Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/AlarmManagerSchedulerBroadcastReceiver;",
        "onReceive(Landroid/content/Context;Landroid/content/Intent;)V", 8, 12)
        .addInstructions(0, "return-void")
    exact("Lnl/npo/player/library/el/a;",
        "d(Lnl/npo/player/library/ea/x;JLjava/lang/Throwable;)V", 8, 43)
        .addInstructions(0, "return-void")
    exact("Lnl/npo/player/library/p7/x0;",
        "c(Lnl/npo/player/library/ks/c;)Lnl/npo/player/library/nm/k;", 20, 212)
        .addInstructions(0, "new-instance v0, Lnl/npo/player/library/nm/k;\nconst/16 v1, 0x193\nconst/4 v2, 0x0\nconst-wide/16 v3, 0x0\ninvoke-direct {v0, v1, v2, v3, v4}, Lnl/npo/player/library/nm/k;-><init>(ILjava/net/URL;J)V\nreturn-object v0")
}
