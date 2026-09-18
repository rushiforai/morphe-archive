package app.dantheman.patches.billing

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

private const val BILLING_MANAGER = "Lcom/halfbrick/mortar/BillingManager;"

object DoPurchaseFingerprint : Fingerprint(
    definingClass = BILLING_MANAGER,
    name = "DoPurchase",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(
        fieldAccess(smali = "$BILLING_MANAGER->mCurrentPurchaseSKU:Ljava/lang/String;"),
        methodCall(
            definingClass = "Lcom/halfbrick/mortar/MortarGameActivity;",
            name = "runOnUiThread"
        )
    )
)

object GetProductInfoFingerprint : Fingerprint(
    definingClass = BILLING_MANAGER,
    name = "GetProductInfo",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(
        string("TestSKU "),
        methodCall(
            definingClass = BILLING_MANAGER,
            name = "queryProductDetailsAsync"
        )
    )
)
