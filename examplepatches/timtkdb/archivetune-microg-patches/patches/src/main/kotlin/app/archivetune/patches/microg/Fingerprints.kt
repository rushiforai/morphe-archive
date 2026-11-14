package app.archivetune.patches.microg

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

/*
 * Checked against the real ArchiveTune 15.1.0 release APKs (FOSS and GMS): the fingerprint matches exactly
 * one method in both. The APK is R8-optimized: names survive (-dontobfuscate) but lambdas are merged into
 * switch-based classes (this one lives in QueueKt$$ExternalSyntheticLambda5.invoke), so never match on the
 * defining class of a lambda.
 */

/**
 * The code in ui/screens/LoginScreen.kt that loads the Google sign-in page into the WebView:
 *
 *   resetAuthWebViewSession(...) { loadUrl(startUrl?.takeIf { it.isNotBlank() } ?: DEFAULT_LOGIN_URL) }
 *
 * Compiled: const-string "https://accounts.google.com/ServiceLogin?..." immediately followed by
 * invoke-virtual {webView, url}, WebView->loadUrl(String).
 * instructionMatches: 0 = the URL string, 1 = the loadUrl call.
 */
internal object LoginWebViewLoadUrlFingerprint : Fingerprint(
    filters = listOf(
        string("https://accounts.google.com/ServiceLogin", StringComparisonType.STARTS_WITH),
        methodCall(
            definingClass = "Landroid/webkit/WebView;",
            name = "loadUrl",
            location = MatchAfterImmediately(),
        ),
    ),
)
