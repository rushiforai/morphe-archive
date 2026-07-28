package app.template.patches.pairip

import app.morphe.patcher.Fingerprint

/**
 * Matches PairIP's license-check entry point.
 *
 * `com.pairip.licensecheck.LicenseClient` is Google Play's PairIP app-protection
 * wrapper (added when the app is built for Play distribution). Its class/method names
 * are NOT obfuscated, so an exact class + method match is stable across app versions.
 *
 * `initializeLicenseCheck()` is the single choke point for the whole subsystem:
 *  - `com.pairip.application.Application.attachBaseContext` -> `LicenseClient.checkLicense`
 *    (static) -> `initializeLicenseCheck`.
 *  - `com.pairip.licensecheck.LicenseContentProvider.onCreate` -> `initializeLicenseCheck`.
 *
 * Every wall path (`startPaywallActivity` via `processResponse`, and
 * `startErrorDialogActivity` via `handleError`) descends from this method, so
 * neutralizing it disables the "get it on Google Play" redirect at the root.
 */
object PairipLicenseCheckFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "initializeLicenseCheck",
    returnType = "V",
    parameters = emptyList(),
)
