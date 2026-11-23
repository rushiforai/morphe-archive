package app.ckzorigins.patches.mono

import app.ckzorigins.patches.shared.Constants.COMPATIBILITY
import app.ckzorigins.patches.shared.applyByteEdits
import app.morphe.patcher.patch.patch

/**
 * Shows the low-ammo HUD, and `0 / backpack`, for as long as the weapon reloads.
 *
 * HudController.Update prints GetAmmoInClip as the ammo label and turns ReloadLabel
 * on when the cached clip is under 40% of GetAmmoClipSize. With unlimited ammo the
 * clip stays full, so that label never appears.
 *
 * The HUD path writes 0 into _cachedWeaponAmmo while Human.get_IsReloading, then
 * prints that cache and leaves the stock 40% test in place. Firearm._ammo is not
 * written.
 */
internal val reloadHudPatch = patch {
    dependsOn(gluBackupPatch)

    execute {
        applyByteEdits(DllEdits.PATH, DllEdits.HUD_RELOAD)
    }
}

/**
 * Nops the clip/backpack decrement in Firearm and Launcher, and lets Human::Reload
 * run even when the clip is already full. [reloadHudPatch] makes the HUD print 0
 * during that animation and keeps the RELOAD label on screen, the state the game
 * otherwise only shows when the clip runs low.
 */
@Suppress("unused")
val unlimitedAmmoPatch = patch(
    name = "Unlimited ammo",
    description = "Ammo never decreases, and reloading still works.",
) {
    compatibleWith(COMPATIBILITY)
    dependsOn(gluBackupPatch, disableAmmoRefillPopupPatch, reloadHudPatch)

    execute {
        applyByteEdits(DllEdits.PATH, DllEdits.AMMO)
    }
}
