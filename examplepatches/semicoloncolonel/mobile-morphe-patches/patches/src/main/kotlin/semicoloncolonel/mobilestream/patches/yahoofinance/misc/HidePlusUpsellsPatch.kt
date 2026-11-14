package semicoloncolonel.mobilestream.patches.yahoofinance.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.yahoofinance.shared.Constants
import semicoloncolonel.mobilestream.patches.yahoofinance.shared.offFlags
import semicoloncolonel.mobilestream.patches.yahoofinance.shared.onArticlePageFinished

// Yahoo Finance 26.22.2 — Hide Plus upsells. The flags behind the Yahoo
// Finance Plus (AlphaSpace) banners and sheets, Stock Picks, the sidebar,
// Smart Asset and Portfolio Analytics upsells, the Insights Edge card, and the
// Coinbase "Trade Now" referral button read as off. Paid features stay locked.
// The "Premium perks" row on Account reads its flag (premiumPerksHub) too.
// The list is in FinanceFlags.UPSELLS.
//
// The "Upgrade to Yahoo Finance Premium" card on Account has no flag. Its
// composable (account/v2/compose/f.m, R8-renamed) returns before drawing.
//
// In articles, the "Trade on Coinbase" referral link and its trading
// disclosure are hidden by ArticleCleanup.hideReferrals.

internal object AccountUpgradeCardFingerprint : Fingerprint(
    definingClass = "Lcom/yahoo/mobile/client/android/finance/account/v2/compose/f;",
    name = "m",
    parameters = listOf(
        "I",
        "I",
        "Landroidx/compose/runtime/l;",
        "Landroidx/compose/ui/s;",
        "Lkotlin/jvm/functions/Function0;",
    ),
    returnType = "V",
)

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
        AccountUpgradeCardFingerprint.method.addInstructions(0, "return-void")
    }
}
