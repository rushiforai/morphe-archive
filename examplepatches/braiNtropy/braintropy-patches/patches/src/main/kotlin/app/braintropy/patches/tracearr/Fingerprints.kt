package app.braintropy.patches.tracearr

import app.morphe.patcher.Fingerprint

/**
 * Fingerprints for com.tracearr.mobile v2.2.0.
 *
 * The app ships with Google Play Automatic Integrity Protection (Pairip)
 * license check: the manifest sets com.pairip.application.Application as the
 * application class (a subclass of the real MainApplication), whose
 * attachBaseContext calls LicenseClient.checkLicense. On an install that did
 * not come from Play (or a device without a license), the licensing service
 * returns a paywall intent and the app forwards to the Google Play buy page
 * via LicenseActivity. Class and member names are not obfuscated.
 */

/**
 * The single entry point of the Pairip license check. Called from
 * com.pairip.application.Application.attachBaseContext (and from
 * LicenseContentProvider.onCreate where declared). No-op'ing it disables
 * the entire check; all failure paths (paywall redirect, error dialog)
 * live behind it.
 */
object LicenseCheckFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "checkLicense",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;")
)
