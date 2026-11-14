package semicoloncolonel.mobilestream.patches.walmart.misc

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.walmart.shared.Constants
import semicoloncolonel.mobilestream.patches.walmart.shared.filterWalmartTempoModules
import semicoloncolonel.mobilestream.patches.walmart.shared.forceWalmartFlagsOff

// ─────────────────────────────────────────────────────────────────────────────
// Hide Walmart+ promotions.
//
// Walmart 26.42.2 advertises Walmart+ in two ways:
//
// Server-driven modules: banners in the home carousel, search, item pages,
// and the membership pages arrive as Tempo modules (WalmartPlusBanner, the
// early-access event banners, FreeTrialModule, the acquisition banner and
// bottom sheet, MembershipUpgradeBanner, and the interstitial). They are
// dropped from the page's module list as the page is read.
//
// Flags: the sign-up banners, splashes, and free-trial offers in the cart,
// checkout, thank-you page, wallet, returns, and the auto-playing membership
// video each have a switch read through getBoolean. The keys in
// ShoppingAdsFilter.isWalmartPlusKey read as off.
//
// Not touched: member benefits, the activity and streaming trackers, account
// status, and managing a membership.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val hideWalmartPlusPromotionsPatch = bytecodePatch(
    name = "Hide Walmart+ promotions",
    description = "Removes Walmart+ sign-up banners, free-trial offers, splashes, and the auto-playing membership video.",
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        forceWalmartFlagsOff("isWalmartPlusKey")
        filterWalmartTempoModules("walmartPlusModules")
    }
}
