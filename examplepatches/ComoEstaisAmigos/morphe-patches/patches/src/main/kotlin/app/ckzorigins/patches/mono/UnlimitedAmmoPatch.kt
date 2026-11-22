package app.ckzorigins.patches.mono

import app.ckzorigins.patches.shared.Constants.COMPATIBILITY
import app.ckzorigins.patches.shared.applyByteEdits
import app.morphe.patcher.patch.patch

/**
 * Nops the clip/backpack decrement in Firearm and Launcher, and lets Human::Reload
 * run even when the clip is already full.
 */
@Suppress("unused")
val unlimitedAmmoPatch = patch(
    name = "Unlimited ammo",
    description = "Ammo never decreases, and reloading still works.",
) {
    compatibleWith(COMPATIBILITY)
    dependsOn(gluBackupPatch, disableAmmoRefillPopupPatch)

    execute {
        applyByteEdits(DllEdits.PATH, DllEdits.AMMO)
    }
}
