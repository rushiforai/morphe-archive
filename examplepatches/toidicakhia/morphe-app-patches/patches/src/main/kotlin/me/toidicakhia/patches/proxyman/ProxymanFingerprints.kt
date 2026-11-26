package me.toidicakhia.patches.proxyman

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

private const val PAIRIP_LICENSE_CLIENT = "Lcom/pairip/licensecheck/LicenseClient;"

/**
 * LicenseEntitlement.toString(), which prints the entitlement's premium flag,
 * active plan and status. The obfuscated data class name changes between
 * builds, so match the generated toString() by its output strings.
 */
internal object LicenseEntitlementToStringFingerprint : Fingerprint(
    name = "toString",
    parameters = emptyList(),
    returnType = "Ljava/lang/String;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    strings = listOf(
        "LicenseEntitlement(isPremium=",
        ", activePlan=",
        ", status="
    )
)

/**
 * PairIP entry point called from the generated Application's
 * attachBaseContext(). Repacked APKs are not recognized as Play installs, so
 * the check must be disabled before the app can start.
 */
internal object PairIpCheckLicenseFingerprint : Fingerprint(
    definingClass = PAIRIP_LICENSE_CLIENT,
    name = "checkLicense",
    parameters = listOf("Landroid/content/Context;"),
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC)
)

/**
 * PairIP's content-provider entry point, used when the provider is registered
 * in the manifest. Disabling it keeps the same check from running twice.
 */
internal object PairIpInitializeLicenseCheckFingerprint : Fingerprint(
    definingClass = PAIRIP_LICENSE_CLIENT,
    name = "initializeLicenseCheck",
    parameters = emptyList(),
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC)
)
