package app.template.patches.amazon.removeads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.AMAZON_BUSINESS_COMPATIBILITY
import app.template.patches.shared.Constants.AMAZON_IN_COMPATIBILITY
import app.template.patches.shared.Constants.AMAZON_SHOPPING_COMPATIBILITY

private const val HELPER = "Lapp/template/extension/extension/AmazonHelper;"

@Suppress("unused")
val amazonRemoveAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Hides sponsored and ad content in Amazon Shopping via CSS injection.",
    default = true,
) {
    compatibleWith(AMAZON_SHOPPING_COMPATIBILITY, AMAZON_BUSINESS_COMPATIBILITY, AMAZON_IN_COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        // Normal page loads: p1=WebView
        MShopWebViewClientOnPageFinishedFingerprint.method.addInstructions(
            0,
            "invoke-static {p1}, $HELPER->injectAdBlock(Landroid/webkit/WebView;)V",
        )

        // Container-routed page loads (.locals 1, v0 free; p1=url kept intact)
        MShopWebViewContainerOnPageFinishedFingerprint.method.addInstructions(
            0,
            """
                iget-object v0, p0, Lcom/amazon/mShop/web/MShopWebViewContainer;->mWebView:Lcom/amazon/mShop/web/MShopWebView;
                invoke-static {v0}, $HELPER->injectAdBlock(Landroid/webkit/WebView;)V
            """.trimIndent(),
        )

        // Early assignment hook: p1=MShopWebView
        InteractionWebFragmentSetWebViewFingerprint.method.addInstructions(
            0,
            "invoke-static {p1}, $HELPER->injectAdBlock(Landroid/webkit/WebView;)V",
        )

        // Post-load / jumpstarted fragment visibility (.locals 4, v0 free)
        InteractionWebFragmentPostShownFingerprint.method.addInstructions(
            0,
            """
                iget-object v0, p0, Lcom/amazon/mobile/mash/MASHWebFragment;->mWebView:Lcom/amazon/mobile/mash/MASHWebView;
                invoke-static {v0}, $HELPER->injectAdBlock(Landroid/webkit/WebView;)V
            """.trimIndent(),
        )
    }
}
