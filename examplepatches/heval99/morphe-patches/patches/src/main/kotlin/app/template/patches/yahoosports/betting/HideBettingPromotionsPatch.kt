package app.template.patches.yahoosports.betting

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_YAHOO_SPORTS

/**
 * The sportsbook (BetMGM) image banner. Its view hides itself in its constructor and only shows
 * once the controller delivers a promotion, so a controller that never loads one leaves it GONE.
 */
@Suppress("unused")
val hideBettingPromotionsPatch = bytecodePatch(
    name = "Hide betting promotions",
    description = "Hides sportsbook promotions."
) {
    compatibleWith(COMPATIBILITY_YAHOO_SPORTS)

    execute {
        // The server bettingPromo banner is never requested.
        BettingImageBannerBindFingerprint.method.returnEarly()
    }
}
