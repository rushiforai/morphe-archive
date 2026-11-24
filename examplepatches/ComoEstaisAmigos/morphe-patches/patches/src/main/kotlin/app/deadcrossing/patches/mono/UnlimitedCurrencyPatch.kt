package app.deadcrossing.patches.mono

import app.deadcrossing.patches.compat.emptyYoumiSdksPatch
import app.deadcrossing.patches.shared.Constants.COMPATIBILITY
import app.deadcrossing.patches.shared.Constants.ORIGINAL_APK
import app.adebisi.patches.shared.applyByteEdits
import app.morphe.patcher.patch.patch

@Suppress("unused")
val unlimitedCurrencyPatch = patch(
    name = "Unlimited currency",
    description = "A fresh install starts with 99,999,999 Glory and 99,999,999 Gold. " +
        "If you install the patched app as an update, your current balance stays as it is.",
) {
    compatibleWith(COMPATIBILITY)
    dependsOn(emptyYoumiSdksPatch)

    execute {
        applyByteEdits(DllEdits.PATH, DllEdits.CURRENCY, ORIGINAL_APK)
    }
}
