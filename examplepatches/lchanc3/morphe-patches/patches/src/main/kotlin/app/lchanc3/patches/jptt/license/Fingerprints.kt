package app.lchanc3.patches.jptt.license

import app.morphe.patcher.Fingerprint

internal const val LICENSE_CLIENT_CLASS = "Lcom/pairip/licensecheck/LicenseClient;"

/**
 * `LicenseClient.initializeLicenseCheck()`, where every route into PairIP's
 * license check meets.
 *
 * 3.8.4's `LicenseContentProvider.onCreate()` calls it directly. 3.8.5 added
 * `LicenseClient.checkLicense(Context)`, which only posts it to the main thread,
 * and calls that from the provider *and* from
 * `com.pairip.application.Application.attachBaseContext()` -- which runs before
 * anything else the app does. Stopping it here covers both versions and every
 * caller, including any the native protection makes.
 */
internal object InitializeLicenseCheckFingerprint : Fingerprint(
    definingClass = LICENSE_CLIENT_CLASS,
    name = "initializeLicenseCheck",
    returnType = "V",
    parameters = emptyList(),
)

/**
 * `LicenseClient.startErrorDialogActivity()`, which puts up the "Something went
 * wrong / Check that Google Play is enabled" dialog whose only button closes the
 * app. Silenced in its own right, so that a check reached by a route this patch
 * does not know about still cannot take the app down.
 */
internal object StartErrorDialogActivityFingerprint : Fingerprint(
    definingClass = LICENSE_CLIENT_CLASS,
    name = "startErrorDialogActivity",
    returnType = "V",
    parameters = emptyList(),
)

/** `LicenseClient.scheduleAppShutdown()`, the other way a failed check ends the app. */
internal object ScheduleAppShutdownFingerprint : Fingerprint(
    definingClass = LICENSE_CLIENT_CLASS,
    name = "scheduleAppShutdown",
    returnType = "V",
    parameters = emptyList(),
)

/** `LicenseClient.scheduleRepeatedLicenseCheck()`, which re-checks while the app runs. */
internal object ScheduleRepeatedLicenseCheckFingerprint : Fingerprint(
    definingClass = LICENSE_CLIENT_CLASS,
    name = "scheduleRepeatedLicenseCheck",
    returnType = "V",
    parameters = listOf("Lcom/pairip/licensecheck/RepeatedCheckMetadata;"),
)

/** `LicenseClient.startPaywallActivity()`, the same idea with a payment screen. */
internal object StartPaywallActivityFingerprint : Fingerprint(
    definingClass = LICENSE_CLIENT_CLASS,
    name = "startPaywallActivity",
    returnType = "V",
    parameters = listOf("Landroid/app/PendingIntent;"),
)
