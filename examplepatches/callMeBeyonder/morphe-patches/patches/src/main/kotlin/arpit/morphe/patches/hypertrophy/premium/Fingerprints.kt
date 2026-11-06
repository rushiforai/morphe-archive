package arpit.morphe.patches.hypertrophy.premium

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Matches the app's `WebViewClient` subclass — the only class that overrides
 * `onPageFinished` and logs with the `onPageFinished: ` tag.
 *
 * RP Hypertrophy is a WebView shell around `https://training.rpstrength.com`: the
 * subscription state that gates the whole UI is fetched by the web app from
 * `apps.rpstrength.com/user/subscriptions`, never by native code. Adding a
 * `shouldInterceptRequest` override to this class lets the patch answer that one
 * request without touching the rest of the page load.
 *
 * The class name is R8-obfuscated, so the fingerprint anchors on the Android
 * override signature plus an app-specific string instead of the class name.
 */
object WebViewClientFingerprint : Fingerprint(
    name = "onPageFinished",
    parameters = listOf("Landroid/webkit/WebView;", "Ljava/lang/String;"),
    returnType = "V",
    strings = listOf("onPageFinished: "),
)

/**
 * Matches `com.pairip.licensecheck.LicenseClient.checkLicense(Context)`.
 *
 * On a `NOT_LICENSED` verdict (any re-signed sideload) PairIP starts its paywall
 * activity and schedules an app shutdown, so the check has to be neutralized for
 * the patched build to stay open. This build has no PairIP signature check and no
 * VM payload — only the licensing client.
 */
object LicenseCheckFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf(
        "Cannot check license with null context.",
        "Skipping license check in isolated process.",
    ),
)
