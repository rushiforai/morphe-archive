package app.ckzorigins.patches.mono

import app.ckzorigins.patches.shared.Constants.COMPATIBILITY
import app.ckzorigins.patches.shared.applyByteEdits
import app.morphe.patcher.patch.patch

@Suppress("unused")
val unlimitedCurrencyPatch = patch(
    name = "Unlimited currency",
    description = "A fresh install starts with 999,999,999 Glu credits and 999,999,999 Cash. " +
        "If you install the patched app as an update, your current balance stays as it is.",
) {
    compatibleWith(COMPATIBILITY)
    dependsOn(gluBackupPatch, disableAmmoRefillPopupPatch)

    execute {
        applyByteEdits(DllEdits.PATH, DllEdits.CURRENCY_BODIES + DllEdits.CURRENCY_RVA)
    }
}
