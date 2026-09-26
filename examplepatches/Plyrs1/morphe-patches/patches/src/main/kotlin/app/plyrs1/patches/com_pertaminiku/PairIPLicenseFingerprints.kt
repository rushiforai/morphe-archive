package app.plyrs1.patches.com_pertaminiku

import app.morphe.patcher.Fingerprint

/**
 * Fingerprint for com.pairip.licensecheck.LicenseContentProvider.onCreate()
 * Method signature: onCreate()Z (returns boolean)
 * 
 * This method initializes LicenseClient which contacts Google Play licensing service.
 * Patching this at index 0 with "return true" prevents the entire license check flow.
 */
object LicenseContentProviderOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseContentProvider;",
    name = "onCreate",
    returnType = "Z",
    parameters = emptyList()
)

/**
 * Fingerprint for com.pairip.licensecheck.LicenseClient.initializeLicenseCheck()
 * Method signature: initializeLicenseCheck()V (void return)
 * 
 * Contains all the heavy lifting: bind to Google Play licensing service,
 * send license request, verify response with public key, handle NOT_LICENSED.
 * Void return at index 0 skips the entire licensing handshake.
 */
object LicenseClientInitializeLicenseCheckFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "initializeLicenseCheck",
    returnType = "V",
    parameters = emptyList()
)
