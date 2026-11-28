package semicoloncolonel.mobilestream.patches.yahoofinance.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.yahoofinance.shared.Constants
import semicoloncolonel.mobilestream.patches.yahoofinance.shared.methodByShape
import semicoloncolonel.mobilestream.patches.yahoofinance.shared.offFlags
import semicoloncolonel.mobilestream.patches.yahoofinance.shared.onArticlePageFinished

// Yahoo Finance 26.22.2 and 26.23.0 — Hide Plus upsells. The flags behind the Yahoo
// Finance Plus (AlphaSpace) banners and sheets, Stock Picks, the sidebar,
// Smart Asset and Portfolio Analytics upsells, the Insights Edge card, and the
// Coinbase "Trade Now" referral button read as off. Paid features stay locked.
// The "Premium perks" row on Account reads its flag (premiumPerksHub) too.
// The list is in FinanceFlags.UPSELLS.
//
// The "Upgrade to Yahoo Finance Premium" card on Account has no flag. Its
// composable, m(int, int, Composer, Modifier, Function0) in account/v2/compose,
// returns before drawing. R8 renames its class between releases (f in
// 26.22.2, e in 26.23.0), so it is found by its signature.
//
// In articles, the "Trade on Coinbase" referral link and its trading
// disclosure are hidden by ArticleCleanup.hideReferrals.

private const val ACCOUNT_COMPOSE = "Lcom/yahoo/mobile/client/android/finance/account/v2/compose/"

@Suppress("unused")
val hidePlusUpsellsPatch = bytecodePatch(
    name = "Hide Plus upsells",
    description = "Removes the Yahoo Finance Plus banners, sheets, and cards, and the Coinbase referral button. Locked features still show the paywall when tapped.",
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        offFlags("upsellOff")
        onArticlePageFinished("hideReferrals")
        methodByShape(
            ACCOUNT_COMPOSE, "m",
            listOf("I", "I", "Landroidx/compose/runtime/", "Landroidx/compose/ui/", "Lkotlin/jvm/functions/Function0;"),
            "V",
        ).addInstructions(0, "return-void")
    }
}
