package app.deadcrossing.patches

import app.ckzombies.patches.compat.unusedPermissionsPatch as zombiesUnusedPermissionsPatch
import app.deadcrossing.patches.compat.emptyYoumiSdksPatch
import app.deadcrossing.patches.compat.modernAndroidPatch
import app.deadcrossing.patches.compat.unusedPermissionsPatch
import app.deadcrossing.patches.mono.disableTelemetryPatch
import app.deadcrossing.patches.mono.unlimitedCurrencyPatch
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertNull
import kotlin.test.assertTrue

private val PATCHES = listOf(
    unlimitedCurrencyPatch,
    disableTelemetryPatch,
    modernAndroidPatch,
    unusedPermissionsPatch,
)

class PatchListTest {
    @Test
    fun `every Dead Crossing patch is on by default`() {
        assertEquals(
            mapOf(
                "Unlimited currency" to true,
                "Disable telemetry" to true,
                "Modern Android compatibility" to true,
                "Remove unused permissions" to true,
            ),
            PATCHES.associate { it.name!! to it.default },
        )
    }

    @Test
    fun `youmi empty is unnamed and every visible patch depends on it`() {
        assertNull(emptyYoumiSdksPatch.name)
        for (patch in PATCHES) {
            assertTrue(emptyYoumiSdksPatch in patch.dependencies, patch.name)
        }
    }

    @Test
    fun `disable telemetry waits for modern android to copy libunity`() {
        assertTrue(modernAndroidPatch in disableTelemetryPatch.dependencies)
        assertFalse(disableTelemetryPatch in modernAndroidPatch.dependencies)
    }

    @Test
    fun `no description uses a dash as punctuation`() {
        for (patch in PATCHES) {
            val description = patch.description ?: continue
            assertFalse(Regex("[\u2013\u2014]").containsMatchIn(description), patch.name)
        }
    }

    @Test
    fun `no description names the game`() {
        for (patch in PATCHES) {
            val description = patch.description ?: continue
            assertFalse("Dead Crossing" in description, patch.name)
            assertFalse("Feelingtouch" in description, patch.name)
        }
    }

    @Test
    fun `currency and modern android match the other games and telemetry stays short`() {
        assertEquals(
            "A fresh install starts with 99,999,999 Glory and 99,999,999 Gold. " +
                "If you install the patched app as an update, your current balance stays as it is.",
            unlimitedCurrencyPatch.description,
        )
        assertEquals(
            "Fixes the crash at launch on current Android and targets API 25 so that Android 14 and later " +
                "install the game normally.",
            modernAndroidPatch.description,
        )
        assertEquals(zombiesUnusedPermissionsPatch.name, unusedPermissionsPatch.name)
        assertEquals(zombiesUnusedPermissionsPatch.description, unusedPermissionsPatch.description)
        assertEquals(
            "Stops the game from sending usage data to analytics and ad services.",
            disableTelemetryPatch.description,
        )
        assertFalse("Youmi" in disableTelemetryPatch.description!!, disableTelemetryPatch.name)
        assertFalse("clamp" in disableTelemetryPatch.description!!, disableTelemetryPatch.name)
        assertFalse("method bodies" in disableTelemetryPatch.description!!, disableTelemetryPatch.name)
    }
}
