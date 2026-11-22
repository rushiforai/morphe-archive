package app.ckzorigins.patches.mono

import app.ckzorigins.patches.compat.modernAndroidPatch
import app.ckzorigins.patches.intro.playIntroOncePatch
import app.ckzorigins.patches.shared.toHex
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertNull
import kotlin.test.assertTrue

/**
 * What would have caught leaving the shop Info dialog after a Glu-credit weapon
 * buy. The dialog is InventoryShopItem.OnPurchase calling
 * PopupManager.ShowInfoPopup with "You received a free ammo refill for buying
 * this weapon!" after AddConsumable("AmmoRefill", 1).
 *
 * After [disableAmmoRefillPopupPatch] that ShowInfoPopup sequence is 26 nops. The
 * grant stays. Either [unlimitedAmmoPatch] or [unlimitedCurrencyPatch] applies
 * the unnamed patch; telemetry, Modern Android, and intro do not.
 */
class DisableAmmoRefillPopupEval {
    @Test
    fun `the popup call sits after AddConsumable and is replaced with nops`() {
        val edit = DllEdits.AMMO_REFILL_POPUP.single()
        assertEquals(0xA63D5, edit.offset)
        assertEquals(26, edit.old.size)
        assertEquals("28", edit.old.toHex().substring(0, 2))
        assertEquals("6f44200006", edit.old.toHex().substring(40, 50))
        assertEquals("26", edit.old.toHex().substring(50, 52))
        assertTrue(edit.new.all { it == 0.toByte() })
        assertEquals(edit.old.size, edit.new.size)
    }

    @Test
    fun `ammo and currency apply the unnamed disable, other Origins patches do not`() {
        assertNull(disableAmmoRefillPopupPatch.name)
        assertTrue(disableAmmoRefillPopupPatch in unlimitedAmmoPatch.dependencies)
        assertTrue(disableAmmoRefillPopupPatch in unlimitedCurrencyPatch.dependencies)
        assertFalse(disableAmmoRefillPopupPatch in disableTelemetryPatch.dependencies)
        assertFalse(disableAmmoRefillPopupPatch in modernAndroidPatch.dependencies)
        assertFalse(disableAmmoRefillPopupPatch in playIntroOncePatch.dependencies)
        assertFalse(disableAmmoRefillPopupPatch in gluBackupPatch.dependencies)
    }

    @Test
    fun `the popup edit is not one of the 194 extracted edits`() {
        assertEquals(
            194,
            DllEdits.AMMO.size + DllEdits.CURRENCY_BODIES.size + DllEdits.CURRENCY_RVA.size,
        )
        assertEquals(1, DllEdits.AMMO_REFILL_POPUP.size)
        assertTrue(DllEdits.AMMO.none { it.offset == 0xA63D5 })
        assertTrue(DllEdits.CURRENCY_BODIES.none { it.offset == 0xA63D5 })
        assertTrue(DllEdits.CURRENCY_RVA.none { it.offset == 0xA63D5 })
    }
}
