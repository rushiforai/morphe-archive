package app.template.patches.fotmob.misc.promotions

import app.morphe.patcher.patch.PatchException
import app.template.patches.fotmob.controls.FotMobControlsCategory
import app.template.patches.fotmob.controls.fotMobControls
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.shared.hevalcontrols.hevalReturnNull

internal val DISABLE_PLUS_PROMO_POPUP = HevalFeature(
    id = "fotmob.disable_plus_promo_popup",
    calm = true,
    name = "Disable FotMob+ promo popup",
    description = "Disables the FotMob+ promo popup.",
    category = FotMobControlsCategory.POPUPS,
)

// A Patch settings feature (2026-11-03): on by default, like the always-on patch it replaced; off,
// the Remote Config reader runs its stock code.
@Suppress("unused")
val disablePlusPromoPopupPatch = fotMobControls.featurePatch(DISABLE_PLUS_PROMO_POPUP) {
    // No promo config, as when Remote Config sends none: the eligibility check answers false and
    // the RevenueCat experiment attribute is skipped.
    val reader = PlusPromoConfigFingerprint.method
    if (reader.implementation == null) {
        throw PatchException("FotMob PlusPromoConfig reader has no implementation")
    }
    reader.hevalReturnNull(DISABLE_PLUS_PROMO_POPUP.id)
}
