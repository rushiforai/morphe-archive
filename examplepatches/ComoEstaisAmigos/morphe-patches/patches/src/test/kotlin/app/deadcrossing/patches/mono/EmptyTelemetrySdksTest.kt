package app.deadcrossing.patches.mono

import app.deadcrossing.patches.compat.YOUMI_PREFIX
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class EmptyTelemetrySdksTest {
    @Test
    fun `each SDK prefix has a locked class count and Youmi is not in the list`() {
        assertEquals(
            listOf(
                "Lcom/chartboost/" to 211,
                "Lcom/tapjoy/" to 166,
                "Lcom/applovin/" to 146,
                "Lcom/sponsorpay/" to 76,
                "Lcom/flurry/" to 50,
                "Lcom/aarki/" to 37,
                "Lcom/inmobi/" to 28,
                "Lcom/apsalar/" to 25,
                "Lcom/google/ads/" to 197,
            ),
            TELEMETRY_SDK_PREFIXES,
        )
        assertEquals(936, TELEMETRY_SDK_PREFIXES.sumOf { it.second })
        assertFalse(TELEMETRY_SDK_PREFIXES.any { it.first == YOUMI_PREFIX })
        assertFalse(TELEMETRY_SDK_PREFIXES.any { it.first.startsWith("Lcom/android/vending/") })
        assertFalse(TELEMETRY_SDK_PREFIXES.any { it.first.startsWith("Lcom/feelingtouch/unityandroid/pay/") })
    }

    @Test
    fun `wrappers stay in feelingtouch and billing is not an emptied prefix`() {
        assertEquals(2, TELEMETRY_WRAPPERS.size)
        for (type in TELEMETRY_WRAPPERS) {
            assertTrue(type.startsWith("Lcom/feelingtouch/"), type)
        }
        assertTrue("Lcom/feelingtouch/unityandroid/OfferWallUtil;" in TELEMETRY_WRAPPERS)
        assertTrue("Lcom/feelingtouch/felad/FelAdManager;" in TELEMETRY_WRAPPERS)
        assertEquals(13, TELEMETRY_ACTIVITY_METHODS.size)
        assertTrue("showTapjoy" in TELEMETRY_ACTIVITY_METHODS)
        assertFalse("pay" in TELEMETRY_ACTIVITY_METHODS)
        assertFalse("onCreate" in TELEMETRY_ACTIVITY_METHODS)
    }

    @Test
    fun `boot SDK invokes match the onCreate and onResume cuts`() {
        assertEquals(7, BOOT_SDK_INVOKES.size)
        assertTrue(("Lcom/feelingtouch/felad/FelAdManager;" to "initFullScreenAds") in BOOT_SDK_INVOKES)
        assertTrue(("Lcom/feelingtouch/unityandroid/OfferWallUtil;" to "initTapjoy") in BOOT_SDK_INVOKES)
        assertTrue(("Lnet/youmi/android/appoffers/YoumiOffersManager;" to "init") in BOOT_SDK_INVOKES)
        assertTrue(("Lcom/feelingtouch/unityandroid/net/NetUtils;" to "SubmitGameStart") in BOOT_SDK_INVOKES)
        assertFalse(BOOT_SDK_INVOKES.any { it.second == "initCheckout" })
        assertFalse(BOOT_SDK_INVOKES.any { it.first.startsWith("Lcom/feelingtouch/unityandroid/pay/") })
    }

    @Test
    fun `NetUtils ad uploads are the four return-void methods`() {
        assertEquals(NET_UTILS, "Lcom/feelingtouch/unityandroid/net/NetUtils;")
        assertEquals(
            listOf(
                "SubmitGameStart",
                "uploadInstallRecord",
                "uploadActiveUserRecord",
                "submitClick",
            ),
            NET_UTILS_ADS_METHODS,
        )
        assertTrue("SubmitGameStart" in NET_UTILS_ADS_METHODS)
        assertFalse("initCheckout" in NET_UTILS_ADS_METHODS)
        assertFalse("getIcon" in NET_UTILS_ADS_METHODS)
    }

    @Test
    fun `AdsTransportConfig URLs are the feelingtouch ads hosts`() {
        assertEquals(ADS_TRANSPORT, "Lcom/feelingtouch/rpc/ads/AdsTransport;")
        assertEquals(ADS_TRANSPORT_CONFIG, "Lcom/feelingtouch/rpc/config/AdsTransportConfig;")
        assertEquals(2, ADS_TRANSPORT_URLS.size)
        assertTrue(ADS_TRANSPORT_URLS.any { "ads.feelingtouch.com" in it })
        assertTrue(ADS_TRANSPORT_URLS.any { "amazonads.feelingtouch.com" in it })
        assertFalse(ADS_TRANSPORT_URLS.any { "gamebox.feelingtouch.com" in it })
    }

    @Test
    fun `Apsalar getDeviceId is stubbed back after the SDK is emptied`() {
        assertTrue(TELEMETRY_SDK_PREFIXES.any { it.first == "Lcom/apsalar/" })
        assertEquals("Lcom/apsalar/sdk/Apsalar;", APSALAR)
        assertEquals("getDeviceId", APSALAR_DEVICE_ID)
    }

    @Test
    fun `ad meta-data and activities are dropped without touching IAP`() {
        assertEquals(12, TELEMETRY_META_KEYS.size)
        assertEquals(8, TELEMETRY_CONST_STRING_KEYS.size)
        assertTrue(TELEMETRY_CONST_STRING_KEYS.all { it in TELEMETRY_META_KEYS })
        assertFalse("IAP_KEY" in TELEMETRY_META_KEYS)
        assertFalse("YOUMI_APP_ID" in TELEMETRY_META_KEYS)
        assertEquals(13, TELEMETRY_ACTIVITIES.size)
        assertTrue(TELEMETRY_ACTIVITIES.any { it.startsWith("com.chartboost.") })
        assertTrue(TELEMETRY_ACTIVITIES.any { it.startsWith("com.tapjoy.") })
        assertTrue(TELEMETRY_ACTIVITIES.any { it.startsWith("com.aarki.") })
        assertTrue("com.apsalar.sdk.Activity" in TELEMETRY_ACTIVITIES)
        assertFalse(TELEMETRY_ACTIVITIES.any { it.contains("unityandroid") })
        assertFalse(TELEMETRY_ACTIVITIES.any { it.contains("youmi") })
        assertFalse(TELEMETRY_ACTIVITIES.any { it.contains("DeadCrossing") })
    }
}
