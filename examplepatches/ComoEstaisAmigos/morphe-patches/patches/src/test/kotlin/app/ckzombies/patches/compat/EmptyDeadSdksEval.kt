package app.ckzombies.patches.compat

import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

/**
 * What would have caught a patch that stubbed the Glu wrappers and left the SDK
 * URL constants in classes.dex.
 *
 * After [deadServersPatch] the wrappers return before they touch these packages,
 * and [emptyDeadSdks] drops the method/field string constants.
 * [rewriteOriginalDexThroughDexPool] drops the original DEX so emptied hosts
 * are not left in its string pool. A later scan that still lists these hosts
 * is a class the empty set missed.
 */
class EmptyDeadSdksEval {
    @Test
    fun `every SDK host sits under an emptied prefix`() {
        val byHost = mapOf(
            "75.101.249.15" to "Lcom/urbanairship/",
            "ad.flurry.com" to "Lcom/flurry/",
            "data.flurry.com" to "Lcom/flurry/",
            "api2.playhaven.com" to "Lcom/playhaven/",
            "test.urbanairship.com" to "Lcom/urbanairship/",
            "boxoffice.urbanairship.com" to "Lcom/urbanairship/",
            "combine.urbanairship.com" to "Lcom/urbanairship/",
            "go.urbanairship.com" to "Lcom/urbanairship/",
            "market.android.com" to "Lcom/flurry/",
            "s3.amazonaws.com/tapjoy" to "Lcom/tapjoy/",
            "ws.tapjoyads.com" to "Lcom/tapjoy/",
        )
        val prefixes = DEAD_SDK_PREFIXES.map { it.first }.toSet()
        for ((host, prefix) in byHost) {
            assertTrue(prefix in prefixes, host)
        }
        assertEquals(11, byHost.size)
    }

    @Test
    fun `Urban Airship IP is InternalOptions not a Glu C2 host`() {
        assertEquals(
            "Lcom/urbanairship/",
            DEAD_SDK_PREFIXES.single { it.first == "Lcom/urbanairship/" }.first,
        )
    }

    @Test
    fun `TapjoyConnect is the only Tapjoy type that keeps its body`() {
        assertEquals(TAPJOY_CONNECT, DEAD_SDK_KEEP.single())
        assertTrue(TAPJOY_CONNECT.startsWith("Lcom/tapjoy/"))
    }
}
