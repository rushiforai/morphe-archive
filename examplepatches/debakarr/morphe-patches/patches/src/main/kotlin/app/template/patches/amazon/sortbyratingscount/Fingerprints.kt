package app.template.patches.amazon.sortbyratingscount

import app.morphe.patcher.Fingerprint

// Non-jumpstarted page loads — same hook as RemoveAds / PriceCharts,
// verified against com.amazon.mShop.android.shopping v32.13.x.
internal val MShopWebViewClientOnPageFinishedFingerprint = Fingerprint(
    definingClass = "Lcom/amazon/mShop/web/MShopWebViewClient;",
    name = "onPageFinished",
    returnType = "V",
    parameters = listOf("Landroid/webkit/WebView;", "Ljava/lang/String;"),
    strings = listOf("onPageFinished_withDuration"),
)

// Fires when any page (incl. jumpstarted) becomes visible — same hook as
// PriceCharts. Proven register layout: .locals 4, mWebView -> v0, url -> v1.
internal val InteractionWebFragmentPostShownFingerprint = Fingerprint(
    definingClass = "Lcom/amazon/mShop/web/InteractionWebFragment;",
    name = "onFragmentPostShown",
    returnType = "V",
    parameters = emptyList(),
    strings = listOf("No animation associated with "),
)
