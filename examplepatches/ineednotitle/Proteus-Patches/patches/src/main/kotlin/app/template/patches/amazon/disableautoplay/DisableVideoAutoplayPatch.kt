package app.template.patches.amazon.disableautoplay

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.AMAZON_BUSINESS_COMPATIBILITY
import app.template.patches.shared.Constants.AMAZON_IN_COMPATIBILITY
import app.template.patches.shared.Constants.AMAZON_SHOPPING_COMPATIBILITY

private const val HELPER = "Lapp/template/extension/extension/AmazonHelper;"

/**
 * Combines the WebSettings user-gesture gate at WebView initialization with an
 * injected DOM/JS autoplay blocker (`AmazonHelper.injectDisableVideoAutoplay`)
 * matching amznkiller's `video_autoplay.js` strategy, so muted `<video autoplay>`
 * elements and scripted `.play()` calls stay paused until a user gesture occurs.
 */
@Suppress("unused")
val amazonDisableVideoAutoplayPatch = bytecodePatch(
    name = "Disable video autoplay",
    description = "Prevents videos from autoplaying in Amazon's in-app WebView pages.",
    default = true,
) {
    compatibleWith(AMAZON_SHOPPING_COMPATIBILITY, AMAZON_BUSINESS_COMPATIBILITY, AMAZON_IN_COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        MShopWebViewInitializeFingerprint.method.addInstructions(
            0,
            """
                invoke-virtual {p0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;
                move-result-object v0
                const/4 v1, 0x1
                invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setMediaPlaybackRequiresUserGesture(Z)V
            """.trimIndent(),
        )

        // Normal page loads: p1=WebView
        MShopWebViewClientOnPageFinishedFingerprint.method.addInstructions(
            0,
            "invoke-static {p1}, $HELPER->injectDisableVideoAutoplay(Landroid/webkit/WebView;)V",
        )

        // Container-routed page loads (.locals 1, v0 free; p1=url kept intact)
        MShopWebViewContainerOnPageFinishedFingerprint.method.addInstructions(
            0,
            """
                iget-object v0, p0, Lcom/amazon/mShop/web/MShopWebViewContainer;->mWebView:Lcom/amazon/mShop/web/MShopWebView;
                invoke-static {v0}, $HELPER->injectDisableVideoAutoplay(Landroid/webkit/WebView;)V
            """.trimIndent(),
        )

        // Jumpstarted + tab-shown fragment pages (.locals 4, v0 free)
        InteractionWebFragmentPostShownFingerprint.method.addInstructions(
            0,
            """
                iget-object v0, p0, Lcom/amazon/mobile/mash/MASHWebFragment;->mWebView:Lcom/amazon/mobile/mash/MASHWebView;
                invoke-static {v0}, $HELPER->injectDisableVideoAutoplay(Landroid/webkit/WebView;)V
            """.trimIndent(),
        )
    }
}
