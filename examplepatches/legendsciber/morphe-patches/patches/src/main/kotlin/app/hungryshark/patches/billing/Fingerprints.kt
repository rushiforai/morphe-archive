package app.hungryshark.patches.billing

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

private const val LAUNCH_BILLING_FLOW =
    "Lcom/android/billingclient/api/BillingClient;->launchBillingFlow(Landroid/app/Activity;Lcom/android/billingclient/api/BillingFlowParams;)Lcom/android/billingclient/api/BillingResult;"

object PurchaseProductFingerprint : Fingerprint(
    definingClass = "Lcom/ubisoft/orion/monetisationcore/billing/GoogleBillingService;",
    name = "purchaseProduct",
    accessFlags = listOf(AccessFlags.PRIVATE),
    returnType = "V",
    parameters = listOf(
        "Lcom/android/billingclient/api/ProductDetails;",
        "Lcom/android/billingclient/api/BillingFlowParams;",
    ),
    filters = listOf(methodCall(smali = LAUNCH_BILLING_FLOW)),
)
