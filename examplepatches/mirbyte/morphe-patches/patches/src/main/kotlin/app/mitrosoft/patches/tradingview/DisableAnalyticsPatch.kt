package app.mitrosoft.patches.tradingview

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.mitrosoft.patches.shared.Constants.COMPATIBILITY_TRADINGVIEW

@Suppress("unused")
val disableAnalyticsPatch = bytecodePatch(
    name = "Disable analytics",
    description = "Drops analytics, tracking, and funnel events.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TRADINGVIEW)

    execute {
        listOf(
            AnalyticsServiceSendEventFingerprint,
            AnalyticsServiceSetUserIdFingerprint,
            AnalyticsServiceSetUserPropertyFingerprint,
            AnalyticsServiceStartTraceFingerprint,
            AnalyticsServiceStopTraceFingerprint,
            AnalyticsServiceStartTrackScreenFingerprint,
            AnalyticsServiceStopTrackScreenFingerprint,
            SnowPlowServiceLogEventFingerprint,
            SnowPlowServiceLogGeneralEventFingerprint,
            SnowPlowServiceConfigureFingerprint,
            SnowPlowServiceSetUserIdFingerprint,
            SnowPlowServiceSetDomainUserIdFingerprint,
            SnowPlowServiceSetLanguageFingerprint,
            SnowPlowTrackerTrackFingerprint,
            SnowPlowTrackerConfigureFingerprint,
            FirebaseLogEventFingerprint,
            FirebaseSetUserIdFingerprint,
            FirebaseSetUserPropertyFingerprint,
            FirebaseStartTraceFingerprint,
            FirebaseStopTraceFingerprint,
            FirebaseStartTrackScreenFingerprint,
            FunnelServiceTrackFingerprint,
            FunnelServiceAddFunnelFingerprint,
            ScreenTimeAddSpentTimeFingerprint,
        ).forEach { it.method.returnEarly() }
    }
}
