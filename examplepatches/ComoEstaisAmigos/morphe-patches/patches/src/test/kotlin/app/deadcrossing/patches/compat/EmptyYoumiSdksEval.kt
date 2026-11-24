package app.deadcrossing.patches.compat

import app.deadcrossing.patches.mono.TELEMETRY_SDK_PREFIXES
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

/**
 * What would have caught a patch that stubbed Youmi wrappers and left the SDK
 * URL constants in classes.dex.
 *
 * After [emptyYoumiSdksPatch] the activity and YOUMI_* meta-data are gone from
 * the manifest and [emptyYoumiSdks] drops the method/field string constants.
 * [rewriteOriginalDexThroughDexPool] drops the original DEX so emptied hosts
 * are not left in its string pool. A later scan that still lists these hosts
 * is a class the empty set missed.
 */
class EmptyYoumiSdksEval {
    @Test
    fun `every Youmi host sits under the emptied prefix`() {
        val byHost = mapOf(
            "au.youmi.net" to YOUMI_PREFIX,
            "aos.wall.youmi.net" to YOUMI_PREFIX,
            "youmi.net" to YOUMI_PREFIX,
        )
        for ((host, prefix) in byHost) {
            assertEquals(YOUMI_PREFIX, prefix, host)
        }
        assertEquals(3, byHost.size)
    }

    @Test
    fun `Youmi is not part of the telemetry toggle`() {
        assertTrue(TELEMETRY_SDK_PREFIXES.none { it.first.startsWith("Lnet/youmi/") })
        assertTrue(TELEMETRY_SDK_PREFIXES.none { it.first == YOUMI_PREFIX })
    }
}
