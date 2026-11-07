package app.apppatches.patches.universalcopy

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

private const val PAIRIP_LICENSE_CLIENT = "Lcom/pairip/licensecheck/LicenseClient;"

/**
 * Entitlement check shared by every activity. It reads the Play Billing
 * purchase list, persists the premium status and updates the activity UI.
 * The class name is obfuscated, so match it by the preference keys.
 */
internal object PlusStatusCheckFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Ljava/util/ArrayList;"),
    accessFlags = listOf(AccessFlags.PUBLIC),
    strings = listOf("uc_premium_status", "uc_premium_confirmed_at")
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
