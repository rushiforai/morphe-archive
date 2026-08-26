package morningentree.morphe.patches.obdandroid.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

internal object IsAppPurchasedFingerprint : Fingerprint(
    definingClass = "Lq5/Y;",
    name = "isAppPurchased",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    filters = listOf(
        methodCall(
            definingClass = "Landroid/content/SharedPreferences;",
            name = "getBoolean",
        ),
    ),
)

internal object SetPurchasedStateFingerprint : Fingerprint(
    definingClass = "Lq5/j0;",
    name = "d",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Z"),
    filters = listOf(
        methodCall(
            definingClass = "Lt5/c;",
            name = "k",
        ),
    ),
)

internal object OnBillingSetupFinishedFingerprint : Fingerprint(
    definingClass = "Lq5/j0;",
    name = "onBillingSetupFinished",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Lcom/android/billingclient/api/BillingResult;"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/android/billingclient/api/BillingResult;",
            name = "getResponseCode",
        ),
    ),
)
