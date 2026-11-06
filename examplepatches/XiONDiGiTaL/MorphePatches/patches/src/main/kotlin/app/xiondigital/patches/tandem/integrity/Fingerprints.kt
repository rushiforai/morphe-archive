package app.xiondigital.patches.tandem.integrity

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * `com.pairip.SignatureCheck.verifyIntegrity(Context)` in Tandem 6.38.0.
 *
 * PairIP's own classes are not obfuscated, so this needs no string filter: Tandem's manifest
 * declares `com.pairip.application.Application`, whose `attachBaseContext` calls this method
 * before `super.attachBaseContext`. The body hashes the installed APK's signing certificate and
 * throws `SignatureTamperedException("Apk signature is invalid.")` on a mismatch, which is exactly
 * what happens after this patch framework re-signs the APK.
 */
internal object PairIpVerifyIntegrityFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/SignatureCheck;",
    name = "verifyIntegrity",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

/**
 * `com.pairip.licensecheck.LicenseClient.checkLicense(Context)` in Tandem 6.38.0.
 *
 * Called from the same `attachBaseContext`, right after the signature check. It binds Google
 * Play's licensing service, which a sideloaded build cannot satisfy. `isIsolatedProcess()` shows
 * the method is designed to be skippable — it already returns early without doing anything when
 * there is no usable context.
 */
internal object PairIpLicenseCheckFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "checkLicense",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

/**
 * `com.pairip.licensecheck.LicenseClient.startPaywallActivity(PendingIntent)`.
 *
 * The paywall itself: it fires the pending intent Play's licensing response carries (the store
 * listing) and then calls `closeApp()`, which finishes the task and kills the process. Sidestepping
 * the checks is not enough on its own — anything that reaches this method still throws the user out
 * of the app and into Play.
 */
internal object PairIpLicensePaywallFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "startPaywallActivity",
    accessFlags = listOf(AccessFlags.PRIVATE),
    returnType = "V",
    parameters = listOf("Landroid/app/PendingIntent;"),
)

/** `com.pairip.licensecheck.LicenseClient.startErrorDialogActivity()` — the failure twin of the paywall. */
internal object PairIpLicenseErrorDialogFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "startErrorDialogActivity",
    accessFlags = listOf(AccessFlags.PRIVATE),
    returnType = "V",
    parameters = emptyList(),
)

/**
 * `com.pairip.licensecheck.LicenseClient.scheduleAppShutdown()`.
 *
 * Arms a 30-second delayed `exitAction` whenever a check fails softly, so the app keeps working
 * just long enough for the user to think it started and then disappears.
 */
internal object PairIpLicenseShutdownFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "scheduleAppShutdown",
    accessFlags = listOf(AccessFlags.PRIVATE),
    returnType = "V",
    parameters = emptyList(),
)

/**
 * `com.pairip.licensecheck.LicenseActivity.onStart()`.
 *
 * The only screen in the licence flow: it reads `activitytype` from its intent and shows either the
 * paywall or the error dialog. Making it finish immediately means a licence activity that is
 * started from anywhere — including the runtime that PairIP decodes at startup, which no dex
 * fingerprint can see — never puts a Play prompt in front of the user.
 */
internal object PairIpLicenseActivityStartFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseActivity;",
    name = "onStart",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = emptyList(),
)

/**
 * `com.pairip.licensecheck.LicenseClient.connectToLicensingService()` — the 6.12.0 licence entry.
 *
 * 6.12.0's PairIP has no `checkLicense(Context)`: the client is an instance built with
 * `LicenseClient(Context)` and this is the method that binds Play's licensing service from it. Same
 * purpose as `checkLicense` in 6.38.0, so it gets the same no-op treatment. Optional: the newer
 * build does not declare it.
 */
internal object PairIpLicenseServiceConnectFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "connectToLicensingService",
    accessFlags = listOf(AccessFlags.PRIVATE),
    returnType = "V",
    parameters = emptyList(),
)

/**
 * `com.pairip.licensecheck.LicenseActivity.showPaywallAndCloseApp()` — 6.12.0's paywall.
 *
 * The counterpart of 6.38.0's `LicenseClient.startPaywallActivity(PendingIntent)`, moved into the
 * activity that shows it: it fires the store listing and closes the app. Optional, for the same
 * reason as the fingerprint above.
 */
internal object PairIpLicensePaywallActivityFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseActivity;",
    name = "showPaywallAndCloseApp",
    accessFlags = listOf(AccessFlags.PRIVATE),
    returnType = "V",
    parameters = emptyList(),
)
