package app.ckzorigins.patches.mono

import app.ckzorigins.patches.shared.applyByteEdits
import app.morphe.patcher.patch.patch

/**
 * InventoryShopItem.OnPurchase grants an ammo refill after a Glu-credit weapon
 * buy, then PopupManager.ShowInfoPopup with "You received a free ammo refill
 * for buying this weapon!". Glu credits no longer drop from play, so that
 * dialog is noise once unlimited ammo or unlimited currency is on. Unnamed:
 * [unlimitedAmmoPatch] and [unlimitedCurrencyPatch] both depend on it. The
 * AddConsumable grant is left in place.
 */
internal val disableAmmoRefillPopupPatch = patch {
    execute {
        applyByteEdits(DllEdits.PATH, DllEdits.AMMO_REFILL_POPUP)
    }
}
