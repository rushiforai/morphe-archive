// WebViewClientFingerprint.kt
package app.template.patches.bplace

import app.morphe.patcher.Fingerprint

object WebViewClientFingerprint : Fingerprint(
    definingClass = "Landroid/webkit/WebView;",
    returnType = "V",
    parameters = listOf("Landroid/webkit/WebViewClient;"),
)