// patches/src/main/kotlin/app/w3s/patches/w3schools/misc/pairip/Fingerprints.kt
package app.w3s.patches.w3schools.misc.pairip

import app.morphe.patcher.Fingerprint

internal object PairipCheckLicenseFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "checkLicense",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

internal object PairipInitializeLicenseCheckFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "initializeLicenseCheck",
    returnType = "V",
    parameters = emptyList(),
)

internal object PairipConnectToLicensingServiceFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "connectToLicensingService",
    returnType = "V",
    parameters = emptyList(),
)
