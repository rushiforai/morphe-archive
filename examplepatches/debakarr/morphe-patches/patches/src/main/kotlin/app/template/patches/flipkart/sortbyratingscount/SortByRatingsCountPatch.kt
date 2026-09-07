package app.template.patches.flipkart.sortbyratingscount

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.FLIPKART_COMPATIBILITY

private const val HELPER = "Lapp/template/extension/extension/SortByRatingsHelper;"

@Suppress("unused")
val flipkartSortByRatingsCountPatch = bytecodePatch(
    name = "Sort by number of ratings",
    description = "Adds a 'Sort: Most rated' button on Flipkart listing pages (WebView-rendered surfaces) that re-orders loaded results by ratings count.",
    default = false,
) {
    compatibleWith(FLIPKART_COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        // p1=WebView, p2=url. Update Fingerprints.kt to the real
        // WebViewClient subclass first — see the TODO there.
        // If Flipkart search is fully native, this hook never fires and you
        // need a native comparator hook instead (see README).
        FlipkartWebViewClientOnPageFinishedFingerprint.method.addInstructions(
            0,
            "invoke-static {p1, p2}, $HELPER->injectSortByRatings(Landroid/webkit/WebView;Ljava/lang/String;)V",
        )
    }
}
