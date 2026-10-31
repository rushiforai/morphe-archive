package app.apppatches.patches.universalcopy

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

private const val PAIRIP_LICENSE_CLIENT = "Lcom/pairip/licensecheck/LicenseClient;"

/**
 * Billing entitlement check shared by every [pj0] activity. It scans the Play
 * Billing purchase list for the UC Plus SKUs and flips the premium flag.
 *
 * The class name is obfuscated and changes between builds, so match it by the
 * entitlement SKU strings instead.
 */
internal object PlusPurchaseCheckFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Ljava/util/List;"),
    accessFlags = listOf(AccessFlags.PUBLIC),
    strings = listOf("uc_ocr", "uc_monthly", "uc_yearly", "uc_plus_")
)

/**
 * PairIP entry point called from PairIP's Application wrapper.
 */
internal object PairIpCheckLicenseFingerprint : Fingerprint(
    definingClass = PAIRIP_LICENSE_CLIENT,
    name = "checkLicense",
    parameters = listOf("Landroid/content/Context;"),
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC)
)

/**
 * PairIP entry point called from the LicenseContentProvider registered in the
 * manifest. It bypasses the same check when the app process starts.
 */
internal object PairIpInitializeLicenseCheckFingerprint : Fingerprint(
    definingClass = PAIRIP_LICENSE_CLIENT,
    name = "initializeLicenseCheck",
    parameters = emptyList(),
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC)
)
