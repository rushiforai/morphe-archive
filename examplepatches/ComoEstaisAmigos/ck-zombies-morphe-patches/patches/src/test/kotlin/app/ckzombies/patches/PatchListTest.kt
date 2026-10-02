package app.ckzombies.patches

import app.ckzombies.patches.compat.deadServersPatch
import app.ckzombies.patches.compat.modernAndroidPatch
import app.ckzombies.patches.compat.obbMessagePatch
import app.ckzombies.patches.compat.unusedPermissionsPatch
import app.ckzombies.patches.intro.playIntroOncePatch
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
    fun `every patch is on by default except rendering at 720p`() {
        val patches = listOf(
            modernAndroidPatch, playIntroOncePatch, unusedPermissionsPatch, screenFitPatch, soundCachePatch,
            deadServersPatch, unlimitedCurrencyPatch,
        )
        assertEquals(
            mapOf(
                "Modern Android compatibility" to true,
                "Play intro once" to true,
                "Remove unused permissions" to true,
                "Render at 720p" to false,
                "Smooth sound" to true,
                "Stop requests to dead servers" to true,
                "Unlimited currency" to true,
            ),
            patches.associate { it.name!! to it.default },
        )
    }

    @Test
    fun `the missing OBB message comes with either patch and is described by Modern Android compatibility`() {
        assertTrue(obbMessagePatch in modernAndroidPatch.dependencies)
        assertTrue(obbMessagePatch in deadServersPatch.dependencies)
        assertTrue("If the OBB is missing" in modernAndroidPatch.description!!)
        assertFalse("OBB" in deadServersPatch.description!!)
    }

    @Test
    fun `no description uses a dash as punctuation`() {
        for (patch in listOf(modernAndroidPatch, deadServersPatch, screenFitPatch)) {
            assertFalse(Regex("[\u2013\u2014]").containsMatchIn(patch.description!!), patch.name)
        }
    }
}
