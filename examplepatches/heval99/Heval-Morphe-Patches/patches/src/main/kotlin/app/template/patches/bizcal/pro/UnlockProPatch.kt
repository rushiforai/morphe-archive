// Based on o0b/morphe-patches (GPL-3.0), patches/src/main/kotlin/app/template/patches/businesscalendar2/pro/
// BusinessCalendar2UnlockProPatch.kt: force getCompleteProStatus and getForceProStatus to true.
package app.template.patches.bizcal.pro

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_BUSINESSCALENDAR

@Suppress("unused")
val unlockProPatch = bytecodePatch(
    name = "Unlock Pro",
    description = "Unlocks Pro features."
) {
    compatibleWith(COMPATIBILITY_BUSINESSCALENDAR)

    execute {
        // Read side only: the setters, Play Billing and the trial logic stay as they are, and
        // no write (billing re-check, trial reset) can take the unlock away again.
        CompleteProStatusFingerprint.method.returnEarly(true)
        ForceProStatusFingerprint.method.returnEarly(true)
    }
}
