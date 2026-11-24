package app.ckzorigins.patches.mono

import app.adebisi.patches.shared.emptySdkPrefixes
import app.adebisi.patches.shared.rewriteOriginalDexThroughDexPool
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class EmptyTelemetrySdksTest {
    @Test
    fun `each SDK prefix has a locked class count and TapjoyConnect is kept`() {
        assertEquals(
            listOf(
                "Lcom/flurry/" to 940,
                "Lcom/tapjoy/" to 71,
                "Lcom/chartboost/" to 186,
                "Lcom/facebook/" to 17,
                "Lcom/amazon/device/ads/" to 126,
                "Lcom/kontagent/" to 66,
                "Lcom/mobileapptracker/" to 9,
                "Lcom/playhaven/" to 80,
                "Lcom/google/analytics/" to 81,
                "Lcom/glu/plugins/NotificationReceiver" to 5,
            ),
            TELEMETRY_SDK_PREFIXES,
        )
        assertEquals(setOf(TAPJOY_CONNECT), TELEMETRY_SDK_KEEP)
        assertEquals("Lcom/tapjoy/TapjoyConnect;", TAPJOY_CONNECT)
        val emptied = TELEMETRY_SDK_PREFIXES.sumOf { it.second }
        assertEquals(1581, emptied)
        assertEquals("emptySdkPrefixes", ::emptySdkPrefixes.name)
        assertEquals("rewriteOriginalDexThroughDexPool", ::rewriteOriginalDexThroughDexPool.name)
    }

    @Test
    fun `wrappers stay in glu plugins and Amazon IAP is not an emptied prefix`() {
        assertEquals(9, TELEMETRY_WRAPPERS.size)
        for (type in TELEMETRY_WRAPPERS) {
            assertTrue(type.startsWith("Lcom/glu/plugins/"), type)
            assertFalse(type.startsWith("Lcom/glu/plugins/amazon/"), type)
        }
        assertTrue("Lcom/glu/plugins/AmazonGlu;" in TELEMETRY_WRAPPERS)
        assertFalse(TELEMETRY_SDK_PREFIXES.any { it.first.startsWith("Lcom/amazon/inapp/") })
        assertFalse(TELEMETRY_SDK_PREFIXES.any { it.first.startsWith("Lcom/amazon/ags/") })
    }
}
