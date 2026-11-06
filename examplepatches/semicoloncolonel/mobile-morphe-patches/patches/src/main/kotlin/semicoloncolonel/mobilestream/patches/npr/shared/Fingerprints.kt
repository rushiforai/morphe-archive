package semicoloncolonel.mobilestream.patches.npr.shared

import app.morphe.patcher.Fingerprint

// Every web view in NPR 7.10.0 (articles, modules, sign-in) uses a
// WebViewClient that calls this on page start, page finish, and link taps.
internal object WebViewPageFingerprint : Fingerprint(
    definingClass = "Lorg/npr/gdpr/OTWebViewClient;",
    name = "sendConsentToWebView",
    returnType = "V",
    parameters = listOf("Landroid/webkit/WebView;"),
)

internal const val NPR_WEB_CLEANUP = "Lsemicoloncolonel/mobilestream/extension/npr/NprWebCleanup;"
