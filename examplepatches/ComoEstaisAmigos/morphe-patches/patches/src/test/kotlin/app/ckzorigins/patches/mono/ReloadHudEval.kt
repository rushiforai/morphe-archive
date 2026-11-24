package app.ckzorigins.patches.mono

import app.ckzorigins.patches.compat.modernAndroidPatch
import app.ckzorigins.patches.intro.playIntroOncePatch
import app.adebisi.patches.shared.toHex
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertNull
import kotlin.test.assertTrue

/**
 * What would have caught a HUD that still printed GetAmmoInClip during reload,
 * or that wrote the real clip back into _cachedWeaponAmmo so ReloadLabel's
 * stock 40% test never fired.
 *
 * HudController.Update shows ReloadLabel when _cachedWeaponAmmo is under 40%
 * of GetAmmoClipSize, and prints GetAmmoInClip into AmmoLabel. Unlimited ammo
 * keeps the clip full, so that path never runs unless the HUD display copy is
 * 0 while Human.get_IsReloading. Firearm.GetAmmoInClip (ldfld _ammo) stays.
 */
class ReloadHudEval {
    @Test
    fun `the preamble stores 0 while reloading then Concat reads that cache`() {
        val preamble = DllEdits.HUD_RELOAD[0]
        val concat = DllEdits.HUD_RELOAD[1]
        val cacheStore = DllEdits.HUD_RELOAD[2]
        assertEquals(0x9BE55, preamble.offset)
        assertEquals(0x9BE82, concat.offset)
        assertEquals(0x9BEC2, cacheStore.offset)

        val preambleNew = preamble.new.toHex()
        assertTrue(preambleNew.startsWith("02027b34150004"), "ldarg.0 ldarg.0 ldfld _player")
        assertTrue("6f77120006" in preambleNew, "callvirt Human.get_IsReloading")
        assertTrue("2c03162b06" in preambleNew, "brfalse.s; ldc.i4.0; br.s")
        assertTrue(preambleNew.contains("7d45150004"), "stfld _cachedWeaponAmmo")
        assertEquals("066f91140006", preamble.old.toHex().substring(12, 24))
        assertFalse("066f91140006" in concat.new.toHex(), "Concat still calls GetAmmoInClip")
        assertEquals("027b45150004", concat.new.toHex())
        assertEquals("066f91140006", concat.old.toHex())
        assertTrue(cacheStore.new.all { it == 0.toByte() })
        assertEquals("02066f911400067d45150004", cacheStore.old.toHex())
        assertTrue(DllEdits.HUD_RELOAD.none { it.offset == 0x9BEF2 })
        assertTrue(DllEdits.AMMO.none { it.offset in setOf(0x9BE55, 0x9BE82, 0x9BEC2) })
    }

    @Test
    fun `ammo applies the unnamed hud, other Origins patches do not`() {
        assertNull(reloadHudPatch.name)
        assertTrue(reloadHudPatch in unlimitedAmmoPatch.dependencies)
        assertFalse(reloadHudPatch in unlimitedCurrencyPatch.dependencies)
        assertFalse(reloadHudPatch in disableTelemetryPatch.dependencies)
        assertFalse(reloadHudPatch in modernAndroidPatch.dependencies)
        assertFalse(reloadHudPatch in playIntroOncePatch.dependencies)
        assertFalse(reloadHudPatch in disableAmmoRefillPopupPatch.dependencies)
    }

    @Test
    fun `the hud edit is not one of the 194 extracted edits`() {
        assertEquals(
            194,
            DllEdits.AMMO.size + DllEdits.CURRENCY_BODIES.size + DllEdits.CURRENCY_RVA.size,
        )
        assertEquals(3, DllEdits.HUD_RELOAD.size)
        assertTrue(DllEdits.AMMO.none { it.offset == 0x9BE55 })
        assertTrue(DllEdits.CURRENCY_BODIES.none { it.offset == 0x9BE55 })
        assertTrue(DllEdits.CURRENCY_RVA.none { it.offset == 0x9BE55 })
    }
}
