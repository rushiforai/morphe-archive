package app.template.patches.filetreesize.unlockpro

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

object PremiumUpgradeFingerprint : Fingerprint(
    definingClass = "Lz5;",
    name = "onQueryPurchasesResponse",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf(
        "Lcom/android/billingclient/api/BillingResult;",
        "Ljava/util/List;"
    ),
    filters = listOf(
        string("premium_upgrade")
    )
)