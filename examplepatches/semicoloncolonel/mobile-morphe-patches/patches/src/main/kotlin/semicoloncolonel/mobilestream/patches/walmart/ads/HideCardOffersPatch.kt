package semicoloncolonel.mobilestream.patches.walmart.ads

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.walmart.shared.Constants
import semicoloncolonel.mobilestream.patches.walmart.shared.filterWalmartTempoModules
import semicoloncolonel.mobilestream.patches.walmart.shared.forceWalmartFlagsOff

// ─────────────────────────────────────────────────────────────────────────────
// Hide card offers.
//
// Walmart 26.42.2 advertises its OnePay debit card, the OnePay and Capital One
// credit cards, and OnePay Later in two ways:
//
// Flags: each promotion has a switch read through the config API's
// getBoolean(key, default). The keys in ShoppingAdsFilter.isWalmartCardOfferKey
// read as off: the item page banner and pre-qualification, the cart and
// checkout pre-qualification and card banners, the thank-you banners, the
// account and wallet banners, and the Services tab splash.
//
// Server-driven modules: on Tempo pages the banners arrive as modules
// (OneDebitCardBannerModule, OneCreditCardBannerModule, CapitalOneBannerModule,
// ThankYouOneBannerModule). They are dropped from the page's module list in
// the ContentLayout and PageLayout constructors, so no gap is left.
//
// Not touched: paying with OnePay or a linked card, and managing them in the
// wallet.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val hideCardOffersPatch = bytecodePatch(
    name = "Hide card offers",
    description = "Removes Walmart's banners and prompts for the OnePay debit card, its credit cards, and OnePay Later.",
) {
    category("Ads")
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        forceWalmartFlagsOff("isWalmartCardOfferKey")
        filterWalmartTempoModules("walmartCardOfferModules")
    }
}
