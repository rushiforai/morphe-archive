package app.jofslash.patches.quora.ads

import app.morphe.patcher.Fingerprint

private const val WEB_VIEW_CLIENT = "Lcom/quora/android/fragments/qwvf/QWebViewClient;"

internal object PageFinishedFingerprint : Fingerprint(
    definingClass = WEB_VIEW_CLIENT,
    name = "onPageFinished",
    returnType = "V",
    parameters = listOf("Landroid/webkit/WebView;", "Ljava/lang/String;"),
)

internal object InterceptRequestFingerprint : Fingerprint(
    definingClass = WEB_VIEW_CLIENT,
    name = "shouldInterceptRequest",
    returnType = "Landroid/webkit/WebResourceResponse;",
    parameters = listOf("Landroid/webkit/WebView;", "Landroid/webkit/WebResourceRequest;"),
)
