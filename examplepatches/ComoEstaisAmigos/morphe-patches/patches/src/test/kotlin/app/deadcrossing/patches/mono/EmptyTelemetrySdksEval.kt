package app.deadcrossing.patches.mono

import app.adebisi.patches.shared.toHex
import app.deadcrossing.patches.compat.YOUMI_PREFIX
import app.deadcrossing.patches.nativelib.NativeEdits
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

/**
 * What would have caught a patch that stubbed the Feelingtouch wrappers and left
 * the SDK URL constants in classes.dex.
 *
 * After [disableTelemetryPatch] the wrappers return before they touch these
 * packages, and [emptyTelemetrySdks] drops the method/field string constants.
 * Youmi is emptied even when this patch is off. ads.feelingtouch.com lives in
 * AdsTransportConfig and as UTF-16 in Assembly-CSharp-firstpass.dll, not under
 * an emptied third-party prefix; FIRSTPASS_URLS is that rewrite.
 */
class EmptyTelemetrySdksEval {
    @Test
    fun `every SDK host sits under an emptied prefix`() {
        val byHost = mapOf(
            "www.chartboost.com" to "Lcom/chartboost/",
            "ws.tapjoyads.com" to "Lcom/tapjoy/",
            "s3.amazonaws.com/tapjoy" to "Lcom/tapjoy/",
            "a.applovin.com" to "Lcom/applovin/",
            "api.sponsorpay.com" to "Lcom/sponsorpay/",
            "data.flurry.com" to "Lcom/flurry/",
            "ad.flurry.com" to "Lcom/flurry/",
            "engine.aarki.net" to "Lcom/aarki/",
            "inmobisdk-a.akamaihd.net" to "Lcom/inmobi/",
            "e.apsalar.com" to "Lcom/apsalar/",
            "googleads.g.doubleclick.net" to "Lcom/google/ads/",
        )
        val prefixes = TELEMETRY_SDK_PREFIXES.map { it.first }.toSet()
        for ((host, prefix) in byHost) {
            assertTrue(prefix in prefixes, host)
        }
        assertEquals(11, byHost.size)
    }

    @Test
    fun `feelingtouch ads RPC is stubbed not left as a live host`() {
        assertTrue(ADS_TRANSPORT_URLS.any { it.contains("ads.feelingtouch.com") })
        assertTrue("uploadActiveUserRecord" in NET_UTILS_ADS_METHODS)
        assertTrue("uploadInstallRecord" in NET_UTILS_ADS_METHODS)
        assertTrue("submitClick" in NET_UTILS_ADS_METHODS)
        assertTrue(TELEMETRY_SDK_PREFIXES.none { it.first.startsWith("Lcom/feelingtouch/rpc/") })
        assertEquals(6, DllEdits.FIRSTPASS_URLS.size)
        assertTrue(
            DllEdits.FIRSTPASS_URLS.count {
                "ads.feelingtouch.com".toByteArray(Charsets.UTF_16LE).toHex() in it.old.toHex()
            } == 4,
        )
    }

    @Test
    fun `unity hardware stats host is a native string not an emptied SDK prefix`() {
        assertTrue("stats.unity3d.com".toByteArray().toHex() in NativeEdits.UNITY_HWSTATS[0].old.toHex())
        assertTrue(TELEMETRY_SDK_PREFIXES.none { it.first.startsWith("Lcom/unity3d/") })
    }

    @Test
    fun `Play billing is not emptied`() {
        assertTrue(TELEMETRY_SDK_PREFIXES.none { it.first.startsWith("Lcom/android/vending/") })
        assertTrue(TELEMETRY_SDK_PREFIXES.none { it.first.startsWith("Lcom/feelingtouch/unityandroid/pay/") })
        assertTrue(TELEMETRY_SDK_PREFIXES.none { it.first == YOUMI_PREFIX })
    }
}
