package app.template.patches.amazon.sortbyratingscount

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.AMAZON_IN_COMPATIBILITY
import app.template.patches.shared.Constants.AMAZON_SHOPPING_COMPATIBILITY

private const val HELPER = "Lapp/template/extension/extension/SortByRatingsHelper;"

@Suppress("unused")
val amazonSortByRatingsCountPatch = bytecodePatch(
    name = "Sort by number of ratings",
    description = "Adds a 'Sort: Most rated' button on Amazon search/listing pages that re-orders loaded results by ratings count, descending.",
    default = false,
) {
    compatibleWith(AMAZON_SHOPPING_COMPATIBILITY, AMAZON_IN_COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        // Non-jumpstarted: p1=WebView, p2=url.
        // Same register layout as PriceChartsPatch's onPageFinished hook.
        MShopWebViewClientOnPageFinishedFingerprint.method.addInstructions(
            0,
            "invoke-static {p1, p2}, $HELPER->injectSortByRatings(Landroid/webkit/WebView;Ljava/lang/String;)V",
        )

        // Jumpstarted + all: .locals 4, mWebView -> v0, url -> v1 via getNavRequestUrl.
        // Same register layout as PriceChartsPatch's onFragmentPostShown hook.
        InteractionWebFragmentPostShownFingerprint.method.addInstructions(
            0,
            """
                iget-object v0, p0, Lcom/amazon/mobile/mash/MASHWebFragment;->mWebView:Lcom/amazon/mobile/mash/MASHWebView;
                invoke-virtual {p0}, Lcom/amazon/mobile/mash/MASHWebFragment;->getNavRequestUrl()Ljava/lang/String;
                move-result-object v1
                invoke-static {v0, v1}, $HELPER->injectSortByRatings(Landroid/webkit/WebView;Ljava/lang/String;)V
            """.trimIndent(),
        )
    }
}
