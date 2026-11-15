package app.template.patches.amazon.disableautoplay

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

/**
 * MShopWebView.initialize() — called once per WebView instantiation (via <init>).
 * Unique by the mashService().setWebViewSettings(WebView) interface call sequence,
 * which only appears in this private method.
 * Sets setMediaPlaybackRequiresUserGesture(true) as the WebSettings baseline.
 */
internal val MShopWebViewInitializeFingerprint = Fingerprint(
    definingClass = "Lcom/amazon/mShop/web/MShopWebView;",
    name = "initialize",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/amazon/mShop/mash/api/MShopMASHService;",
            name = "setWebViewSettings",
        ),
    ),
)

internal val MShopWebViewClientOnPageFinishedFingerprint = Fingerprint(
    definingClass = "Lcom/amazon/mShop/web/MShopWebViewClient;",
    name = "onPageFinished",
    returnType = "V",
    parameters = listOf("Landroid/webkit/WebView;", "Ljava/lang/String;"),
    strings = listOf("onPageFinished_withDuration"),
)

internal val MShopWebViewContainerOnPageFinishedFingerprint = Fingerprint(
    definingClass = "Lcom/amazon/mShop/web/MShopWebViewContainer;",
    name = "onPageFinished",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
    strings = listOf("about:blank"),
)

internal val InteractionWebFragmentPostShownFingerprint = Fingerprint(
    definingClass = "Lcom/amazon/mShop/web/InteractionWebFragment;",
    name = "onFragmentPostShown",
    returnType = "V",
    parameters = emptyList(),
    strings = listOf("No animation associated with "),
)
