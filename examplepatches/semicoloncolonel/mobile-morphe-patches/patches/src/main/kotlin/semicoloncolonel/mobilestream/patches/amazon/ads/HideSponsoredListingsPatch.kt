package semicoloncolonel.mobilestream.patches.amazon.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.amazon.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Hide sponsored listings.
//
// Amazon Shopping 32.19.0.100 shows search results and product pages as web
// pages in its own web view client, MShopWebViewClient. When a page becomes
// visible, and again when it finishes loading, a style rule hides the
// sponsored products Amazon marks in its markup. ShoppingAdsFilter has the
// list. The rule also covers products loaded later on the same page, such as
// the next page of search results.
//
// Not covered: sponsored items in the app's native screens.
// ─────────────────────────────────────────────────────────────────────────────

private const val ADS_FILTER = "Lsemicoloncolonel/mobilestream/extension/shared/misc/ShoppingAdsFilter;"
private const val WEB_VIEW_CLIENT = "Lcom/amazon/mShop/web/MShopWebViewClient;"

internal object PageCommitVisibleFingerprint : Fingerprint(
    definingClass = WEB_VIEW_CLIENT,
    name = "onPageCommitVisible",
    parameters = listOf("Landroid/webkit/WebView;", "Ljava/lang/String;"),
    returnType = "V",
)

internal object PageFinishedFingerprint : Fingerprint(
    definingClass = WEB_VIEW_CLIENT,
    name = "onPageFinished",
    parameters = listOf("Landroid/webkit/WebView;", "Ljava/lang/String;"),
    returnType = "V",
)

@Suppress("unused")
val hideSponsoredListingsPatch = bytecodePatch(
    name = "Hide sponsored listings",
    description = "Hides sponsored products in search results and on product pages.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        // (WebView, url): p1 is the WebView.
        listOf(PageCommitVisibleFingerprint, PageFinishedFingerprint).forEach {
            it.method.addInstructions(
                0,
                "invoke-static/range { p1 .. p1 }, $ADS_FILTER->hideAmazonSponsored(Landroid/webkit/WebView;)V",
            )
        }
    }
}
