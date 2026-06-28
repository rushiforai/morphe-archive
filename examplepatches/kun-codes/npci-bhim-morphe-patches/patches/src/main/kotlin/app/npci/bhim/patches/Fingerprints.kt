package app.npci.bhim.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

/**
 * Fingerprint for com.pairip.SignatureCheck.verifyIntegrity(Context)
 * Verified against smali: contains const-string "SHA-256" and "Apk signature is invalid."
 */
object SignatureCheckFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        string("SHA-256"),
        string("Apk signature is invalid."),
    ),
    custom = { _, classDef ->
        classDef.type == "Lcom/pairip/SignatureCheck;"
    }
)

/**
 * Fingerprint for com.pairip.licensecheck.LicenseClient.checkLicense(Context)
 * Verified against smali: contains const-string "Skipping license check in isolated process."
 */
object LicenseCheckFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        string("Skipping license check in isolated process."),
    ),
    custom = { _, classDef ->
        classDef.type == "Lcom/pairip/licensecheck/LicenseClient;"
    }
)

/**
 * Fingerprint for Q4.Fi0zof57.sfPE() - Device details builder.
 * Verified against smali: contains const-string "safe".
 */
object DeviceDetailsBuilderFingerprint : Fingerprint(
    returnType = "Lr3z/W6XuWJ;",
    filters = listOf(
        string("safe"),
    ),
    custom = { _, classDef ->
        classDef.type == "LQ4/Fi0zof57;"
    }
)

/**
 * Fingerprint for r3z.DEaXh.isEmpty() - Device integrity check.
 * Verified against smali: method name "isEmpty" with return type Z in class Lr3z/DEaXh;
 */
object DeviceIntegrityCheckFingerprint : Fingerprint(
    returnType = "Z",
    parameters = emptyList(),
    custom = { methodDef, classDef ->
        classDef.type == "Lr3z/DEaXh;" && methodDef.name == "isEmpty"
    }
)

/**
 * Fingerprint for the root status comparison in Q4.JsDum.sfPE()
 * Verified against smali: calls getRootStatus in class LQ4/JsDum;
 */
object RootStatusComparisonFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("LQ4/JsDum;", "Lr3z/Uk0y;", "Lr3z/LIUfHTl5;"),
    filters = listOf(
        methodCall(
            name = "getRootStatus",
        ),
    ),
    custom = { _, classDef ->
        classDef.type == "LQ4/JsDum;"
    }
)

/**
 * Fingerprint for LicenseClient.startPaywallActivity(PendingIntent)
 * Verified against smali: private method, parameter Landroid/app/PendingIntent;,
 * contains const-string "paywallintent" and "activitytype".
 */
object PaywallActivityFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/app/PendingIntent;"),
    filters = listOf(
        string("paywallintent"),
        string("activitytype"),
    ),
    custom = { _, classDef ->
        classDef.type == "Lcom/pairip/licensecheck/LicenseClient;"
    }
)

/**
 * Fingerprint for LicenseClient.handleError(LicenseCheckException)
 * Verified against smali: private method, parameter Lcom/pairip/licensecheck/LicenseCheckException;,
 * contains const-string "Error while checking license: ".
 */
object HandleErrorFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Lcom/pairip/licensecheck/LicenseCheckException;"),
    filters = listOf(
        string("Error while checking license: "),
    ),
    custom = { _, classDef ->
        classDef.type == "Lcom/pairip/licensecheck/LicenseClient;"
    }
)

/**
 * Fingerprint for LicenseClient.processResponse(int, Bundle)
 * Verified against smali: private method with params (ILandroid/os/Bundle;)V,
 * contains const-string "Unexpected response code %d received.".
 * This is the decision point where response code 2 triggers the paywall.
 */
object ProcessResponseFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("I", "Landroid/os/Bundle;"),
    filters = listOf(
        string("Unexpected response code %d received."),
    ),
    custom = { _, classDef ->
        classDef.type == "Lcom/pairip/licensecheck/LicenseClient;"
    }
)

/**
 * Fingerprint for LicenseActivity.onStart()
 * Verified against smali: public method with no params returning V,
 * contains const-string "activitytype".
 * This is the entry point for the paywall/error dialog activity.
 */
object LicenseActivityOnStartFingerprint : Fingerprint(
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        string("activitytype"),
    ),
    custom = { _, classDef ->
        classDef.type == "Lcom/pairip/licensecheck/LicenseActivity;"
    }
)
