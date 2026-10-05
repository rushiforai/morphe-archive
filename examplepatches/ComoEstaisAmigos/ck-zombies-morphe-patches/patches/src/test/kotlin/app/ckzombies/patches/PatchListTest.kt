package app.ckzombies.patches

import app.ckzombies.patches.compat.deadServersPatch
import app.ckzombies.patches.compat.modernAndroidPatch
import app.ckzombies.patches.compat.obbMessagePatch
import app.ckzombies.patches.compat.unusedPermissionsPatch
import app.ckzombies.patches.intro.playIntroOncePatch
import app.ckzombies.patches.nativelib.hideDailyDealPatch
import app.ckzombies.patches.nativelib.unlimitedCurrencyPatch
import app.ckzombies.patches.screen.screenFitPatch
import app.ckzombies.patches.sound.soundCachePatch
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertTrue

/** What a player sees in the patch list: the names, and which ones start switched on. */
class PatchListTest {
    @Test
    fun `every patch is on by default`() {
        val patches = listOf(
            hideDailyDealPatch, modernAndroidPatch, playIntroOncePatch, unusedPermissionsPatch, screenFitPatch,
            soundCachePatch, deadServersPatch, unlimitedCurrencyPatch,
        )
        assertEquals(
            mapOf(
                "Hide Daily Deal popup" to true,
                "Modern Android compatibility" to true,
                "Play intro once" to true,
                "Remove unused permissions" to true,
                "Render at 720p" to true,
                "Smooth sound" to true,
                "Stop requests to dead servers" to true,
                "Unlimited currency" to true,
            ),
            patches.associate { it.name!! to it.default },
        )
    }

    @Test
    fun `the missing OBB message comes with either patch and neither description mentions it`() {
        assertTrue(obbMessagePatch in modernAndroidPatch.dependencies)
        assertTrue(obbMessagePatch in deadServersPatch.dependencies)
        assertFalse("OBB" in modernAndroidPatch.description!!)
        assertFalse("OBB" in deadServersPatch.description!!)
    }

    @Test
    fun `no description uses a dash as punctuation`() {
        for (patch in listOf(modernAndroidPatch, deadServersPatch, screenFitPatch, hideDailyDealPatch)) {
            assertFalse(Regex("[\u2013\u2014]").containsMatchIn(patch.description!!), patch.name)
        }
    }
}
