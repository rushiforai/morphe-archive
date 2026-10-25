package app.template.patches.fotmob.misc.promotions

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_FOTMOB
import app.template.patches.shared.addInstructionsChecked

@Suppress("unused")
val disablePlusPromoPopupPatch = bytecodePatch(
    name = "Disable FotMob+ promo popup",
    description = "Disables the FotMob+ promo popup.",
) {
    compatibleWith(COMPATIBILITY_FOTMOB)

    execute {
        // No promo config, as when Remote Config sends none: the eligibility check answers false
        // and the RevenueCat experiment attribute is skipped.
        val reader = PlusPromoConfigFingerprint.method
        if (reader.implementation == null) {
            throw PatchException("FotMob PlusPromoConfig reader has no implementation")
        }
        reader.addInstructionsChecked(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """,
        )
    }
}
