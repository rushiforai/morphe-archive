package app.ckzorigins.patches.mono

import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertNotNull
import kotlin.test.assertTrue

/**
 * What would have caught a patch that stubbed the Glu wrappers and left the SDK
 * URL constants in classes.dex.
 *
 * After [disableTelemetryPatch] the wrappers return before they touch these
 * packages, and [emptyTelemetrySdks] drops the method/field string constants.
 * A later scan that still lists these hosts is a class the empty set missed,
 * or Amazon IAP (`gp/mas`), which is kept on purpose.
 */
class EmptyTelemetrySdksEval {
    @Test
    fun `every SDK host sits under an emptied prefix`() {
        val byHost = mapOf(
            "adlog.flurry.com" to "Lcom/flurry/",
            "ads.flurry.com" to "Lcom/flurry/",
            "data.flurry.com" to "Lcom/flurry/",
            "ws.tapjoyads.com" to "Lcom/tapjoy/",
            "s3.amazonaws.com/tapjoy" to "Lcom/tapjoy/",
            "www.chartboost.com" to "Lcom/chartboost/",
            "graph.facebook.com" to "Lcom/facebook/",
            "m.facebook.com" to "Lcom/facebook/",
            "api.facebook.com" to "Lcom/facebook/",
            "amazon-adsystem.amazon.com" to "Lcom/amazon/device/ads/",
            "z-ecx.images-amazon.com" to "Lcom/amazon/device/ads/",
            "www.amazon.com/gp/aw/aap" to "Lcom/amazon/device/ads/",
            "api.geo.kontagent.net" to "Lcom/kontagent/",
            "fb-mobile-api.kontagent.net" to "Lcom/kontagent/",
            "engine.mobileapptracking.com" to "Lcom/mobileapptracker/",
            "play.google.com/store/apps/details" to "Lcom/playhaven/",
            "www.google-analytics.com" to "Lcom/google/analytics/",
            "ssl.google-analytics.com" to "Lcom/google/analytics/",
            "gluservices.s3.amazonaws.com/PushNotifications" to
                "Lcom/glu/plugins/NotificationReceiver",
        )
        val prefixes = TELEMETRY_SDK_PREFIXES.map { it.first }.toSet()
        for ((host, prefix) in byHost) {
            assertTrue(prefix in prefixes, host)
        }
        assertEquals(19, byHost.size)
    }

    @Test
    fun `Amazon Appstore mas link is IAP and is not emptied`() {
        assertNotNull(TELEMETRY_SDK_PREFIXES.find { it.first == "Lcom/amazon/device/ads/" })
        assertTrue(TELEMETRY_SDK_PREFIXES.none { it.first.startsWith("Lcom/amazon/inapp/") })
    }

    @Test
    fun `TapjoyConnect is the only Tapjoy type that keeps its body`() {
        assertEquals(TAPJOY_CONNECT, TELEMETRY_SDK_KEEP.single())
        assertTrue(TAPJOY_CONNECT.startsWith("Lcom/tapjoy/"))
    }

    /**
     * 20.11.2026 20:19:37: Disable telemetry emptied Tune, then Modern Android
     * matched `MobileAppTrackerDeviceIdFingerprint` and threw PatchException.
     */
    @Test
    fun `Tune and PlayHaven are emptied so Modern Android cannot fingerprint them after telemetry`() {
        val prefixes = TELEMETRY_SDK_PREFIXES.map { it.first }
        assertTrue("Lcom/mobileapptracker/" in prefixes)
        assertTrue("Lcom/playhaven/" in prefixes)
    }
}
