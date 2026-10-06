package app.hillclimb.patches.billing

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

private const val BILLING_HANDLE = "Lcom/fingersoft/billing/NewBillingHandle;"

object StartPurchaseFingerprint : Fingerprint(
    definingClass = BILLING_HANDLE,
    name = "StartPurchase",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(
        methodCall(definingClass = BILLING_HANDLE, name = "replaceGetOrDefault"),
        string("Starting purchase of : "),
        methodCall(definingClass = "Lcom/android/billingclient/api/BillingClient;", name = "launchBillingFlow")
    )
)
