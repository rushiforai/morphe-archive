package app.paresh.patches.alarmo.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

// UtilFunctionsKt.l(SharedPreferences) — isPremiumUser check
object IsPremiumUserFingerprint : Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf("Landroid/content/SharedPreferences;"),
    filters = listOf(
        string("is_premium_user"),
    )
)

// LicenseClient.processResponse — pairip license check callback
object PairipProcessResponseFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "processResponse",
    returnType = "V",
)

// LicenseResponseHelper.validateResponse — pairip signature validation
object PairipValidateResponseFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseResponseHelper;",
    name = "validateResponse",
    returnType = "V",
)
