package app.ckzombies.patches

import app.ckzombies.patches.compat.deadServersPatch
import app.ckzombies.patches.compat.modernAndroidPatch
import app.ckzombies.patches.compat.obbMessagePatch
import app.ckzombies.patches.compat.unusedPermissionsPatch
import app.ckzombies.patches.intro.playIntroOncePatch
import app.ckzombies.patches.nativelib.hiddenWeaponsPatch
import app.ckzombies.patches.nativelib.hideDailyDealPatch
import app.ckzombies.patches.nativelib.unlimitedCurrencyPatch
import app.ckzombies.patches.screen.screenFitPatch
import app.ckzombies.patches.sound.soundCachePatch
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertNull
import kotlin.test.assertTrue

/** Every patch the player can pick. */
private val PATCHES = listOf(
    hiddenWeaponsPatch, hideDailyDealPatch, modernAndroidPatch, playIntroOncePatch, unusedPermissionsPatch,
    screenFitPatch, soundCachePatch, deadServersPatch, unlimitedCurrencyPatch,
)

/** What a player sees in the patch list: the names, and which ones start switched on. */
class PatchListTest {
    @Test
    fun `every patch is on by default`() {
        assertEquals(
            mapOf(
                "Show hidden weapons" to true,
                "Hide Daily Deal popup" to true,
                "Modern Android compatibility" to true,
                "Play intro once" to true,
                "Remove unused permissions" to true,
                "Render menus at 720p" to true,
                "Smooth sound" to true,
                "Stop requests to dead servers" to true,
                "Unlimited currency" to true,
            ),
            PATCHES.associate { it.name!! to it.default },
        )
    }

    @Test
    fun `the missing OBB message comes with every patch and no description mentions it`() {
        assertNull(obbMessagePatch.name, "the OBB message is not a patch of its own")
        for (patch in PATCHES) {
            assertTrue(obbMessagePatch in patch.dependencies, patch.name)
            assertFalse("OBB" in patch.description!!, patch.name)
        }
    }

    @Test
    fun `no description uses a dash as punctuation`() {
        for (patch in PATCHES) {
            assertFalse(Regex("[\u2013\u2014]").containsMatchIn(patch.description!!), patch.name)
        }
    }
}
