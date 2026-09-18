package app.template.patches.fairemail.premium

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_FAIREMAIL
import app.morphe.util.returnEarly

@Suppress("unused")
val enableProPatch = bytecodePatch(
    name = "Enable Pro",
    description = "Unlocks the FairEmail pro features."
) {
    compatibleWith(COMPATIBILITY_FAIREMAIL)

    execute {
        BillingIsProFingerprint.methodOrNull?.returnEarly(true)
    }
}
