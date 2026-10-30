package app.braintropy.patches.rphypertrophy

import app.morphe.patcher.Fingerprint

/**
 * The app's WebViewClient (Llm0; in 1.6.0): the only class overriding
 * onPageFinished while keeping its debug logging strings in place.
 */
internal object WebViewClientFingerprint : Fingerprint(
    name = "onPageFinished",
    strings = listOf("onPageFinished: ", "webView")
)
