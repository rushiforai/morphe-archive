package app.template.patches.everythingwidgets.license

import app.morphe.patcher.Fingerprint

/**
 * Fingerprints for Everything Widgets 2.1.014 (versionCode 63) — Pairip
 * license stack.
 *
 * Anchoring: every fingerprint pins definingClass exactly; the app is locked
 * to version 2.1.014 + official cert via EVERYTHING_WIDGETS_COMPATIBILITY, so
 * class-name pinning is sound. All smali paths below were hand-verified in a
 * full apktool decompile of the original 2.1.014 APK (16 MB, 3 dexes).
 *
 * Pairip layout in this build (license-check-only; NO libpairipcore native
 * protection — lib/ has just androidx datastore/graphics libs):
 *   com/pairip/licensecheck/LicenseContentProvider.smali  :87 onCreate
 *   com/pairip/licensecheck/LicenseClient.smali           :1435 initializeLicenseCheck
 *   com/pairip/licensecheck/LicenseClient.smali           :1001 processResponse
 *   com/pairip/licensecheck/LicenseResponseHelper.smali   :360  validateResponse
 *   com/pairip/licensecheck/LicenseActivity.smali         :322  onStart
 *
 * Boot path: LicenseContentProvider.onCreate -> new LicenseClient ->
 * initializeLicenseCheck -> connectToLicensingService -> Play licensing
 * service -> processResponse(code, bundle) -> response==0 && validateResponse
 * (signature check) succeed -> "licensed"; anything else -> LicenseActivity
 * paywall dialog and/or app close.
 */

/**
 * LicenseContentProvider.onCreate()Z — the autostart seam. The merged
 * manifest registers pairip's ContentProvider; killing its onCreate kills the
 * entire license client before any service bind. Provider onCreate must
 * return a boolean (true = attached OK).
 */
object EwLicenseProviderOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseContentProvider;",
    name = "onCreate",
    returnType = "Z",
    parameters = emptyList()
)

/**
 * LicenseClient.initializeLicenseCheck()V — public entry; belt-and-braces
 * kill in case the provider seam is bypassed (e.g. any eager Application
 * init calling the client directly).
 */
object EwInitializeLicenseCheckFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "initializeLicenseCheck",
    returnType = "V",
    parameters = emptyList()
)

/**
 * LicenseClient.processResponse(responseCode, bundle)V — the verdict
 * switch. Signature-spoof splice forces `responseCode = 0` (LICENSED) at
 * method entry: any response — including NOT_LICENSED from a re-signed APK —
 * is treated as licensed. This is the "Play Store signature spoof": the
 * app-side verdict no longer depends on the signing key the store knows.
 */
object EwProcessResponseFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "processResponse",
    returnType = "V",
    parameters = listOf("I", "Landroid/os/Bundle;")
)

/**
 * LicenseResponseHelper.validateResponse(bundle, publicKey)V — the RSA
 * signature verification of the license payload. Killed so a patched key
 * can't trip license-response validation if a response ever reaches it.
 */
object EwValidateResponseFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseResponseHelper;",
    name = "validateResponse",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;", "Ljava/lang/String;")
)

/**
 * LicenseActivity.onStart()V — the "please buy this app" paywall activity.
 * Belt-and-braces: if anything ever launches it (dialog/paywall paths), it
 * instantly finishes itself instead of blocking the user.
 */
object EwLicenseActivityOnStartFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseActivity;",
    name = "onStart",
    returnType = "V",
    parameters = emptyList()
)
