package app.ckzorigins.patches

import app.ckzorigins.patches.compat.bundleObbPatch
import app.ckzorigins.patches.compat.modernAndroidPatch
import app.ckzorigins.patches.compat.unusedPermissionsPatch
import app.ckzorigins.patches.intro.playIntroOncePatch
import app.ckzorigins.patches.mono.disableTelemetryPatch
import app.ckzorigins.patches.mono.gluBackupPatch
import app.ckzorigins.patches.mono.disableAmmoRefillPopupPatch
import app.ckzorigins.patches.mono.reloadHudPatch
import app.ckzorigins.patches.mono.unlimitedAmmoPatch
import app.ckzorigins.patches.mono.unlimitedCurrencyPatch
import app.ckzombies.patches.compat.unusedPermissionsPatch as zombiesUnusedPermissionsPatch
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertNull
import kotlin.test.assertTrue

private val PATCHES = listOf(
    unlimitedAmmoPatch,
    unlimitedCurrencyPatch,
    disableTelemetryPatch,
    modernAndroidPatch,
    playIntroOncePatch,
    unusedPermissionsPatch,
)

class PatchListTest {
    @Test
    fun `every Origins patch is on by default`() {
        assertEquals(
            mapOf(
                "Unlimited ammo" to true,
                "Unlimited currency" to true,
                "Disable telemetry" to true,
                "Modern Android compatibility" to true,
                "Play intro once" to true,
                "Remove unused permissions" to true,
            ),
            PATCHES.associate { it.name!! to it.default },
        )
    }

    @Test
    fun `glu backup is unnamed and every visible patch depends on it`() {
        assertNull(gluBackupPatch.name)
        for (patch in PATCHES) {
            assertTrue(gluBackupPatch in patch.dependencies, patch.name)
        }
    }

    @Test
    fun `reload hud is unnamed and rides with ammo`() {
        assertNull(reloadHudPatch.name)
        assertTrue(reloadHudPatch in unlimitedAmmoPatch.dependencies)
        for (patch in PATCHES) {
            if (patch === unlimitedAmmoPatch) continue
            assertFalse(reloadHudPatch in patch.dependencies, patch.name)
        }
    }

    @Test
    fun `ammo refill popup is unnamed and rides with ammo and currency`() {
        assertNull(disableAmmoRefillPopupPatch.name)
        assertTrue(disableAmmoRefillPopupPatch in unlimitedAmmoPatch.dependencies)
        assertTrue(disableAmmoRefillPopupPatch in unlimitedCurrencyPatch.dependencies)
        for (patch in PATCHES) {
            if (patch === unlimitedAmmoPatch || patch === unlimitedCurrencyPatch) continue
            assertFalse(disableAmmoRefillPopupPatch in patch.dependencies, patch.name)
        }
    }

    @Test
    fun `the OBB copy is unnamed and rides with glu backup`() {
        assertNull(bundleObbPatch.name)
        assertTrue(bundleObbPatch in gluBackupPatch.dependencies)
        for (patch in PATCHES) {
            assertFalse(bundleObbPatch in patch.dependencies, patch.name)
        }
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
            assertFalse("Origins" in description, patch.name)
            assertFalse("Contract Killer" in description, patch.name)
        }
    }

    @Test
    fun `currency and modern android match NR and telemetry does not mention backup`() {
        assertEquals(
            "Ammo never decreases, and reloading still works.",
            unlimitedAmmoPatch.description,
        )
        assertEquals(
            "A fresh install starts with 999,999,999 Glu credits and 999,999,999 Cash. " +
                "If you install the patched app as an update, your current balance stays as it is.",
            unlimitedCurrencyPatch.description,
        )
        assertEquals(
            "Fixes the crash at launch on current Android and targets API 25 so that Android 14 and later " +
                "install the game normally.",
            modernAndroidPatch.description,
        )
        assertEquals(
            "Plays the intro video on the first launch after installing, and skips it after that.",
            playIntroOncePatch.description,
        )
        assertEquals(zombiesUnusedPermissionsPatch.name, unusedPermissionsPatch.name)
        assertEquals(zombiesUnusedPermissionsPatch.description, unusedPermissionsPatch.description)
        val telemetry = disableTelemetryPatch.description!!
        assertEquals(
            "Stops the game from sending usage data to analytics and ad services, " +
                "and from contacting Glu's servers at launch.",
            telemetry,
        )
        assertFalse("backup" in telemetry, disableTelemetryPatch.name)
        assertFalse("clamp" in telemetry, disableTelemetryPatch.name)
        assertFalse("method bodies" in telemetry, disableTelemetryPatch.name)
        assertFalse("Tune" in unlimitedCurrencyPatch.description!!, unlimitedCurrencyPatch.name)
    }
}
