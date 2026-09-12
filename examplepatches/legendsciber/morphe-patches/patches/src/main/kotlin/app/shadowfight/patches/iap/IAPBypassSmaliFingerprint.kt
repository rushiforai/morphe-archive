package app.shadowfight.patches.iap

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * SecurityManager.VerifyStep() — game's anti-tamper check that verifies
 * APK signature, installer ID, debug/emulator state. Intercepted to
 * always call NotifyOnSuccess(), bypassing all checks.
 */
object IAPBypassSecurityVerifyStepFingerprint : Fingerprint(
    definingClass = "Lcom/nekki/utils/security/SecurityManager;",
    name = "VerifyStep",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = emptyList()
)

/**
 * BillingClientImpl.launchBillingFlow — .locals 32, huge method with
 * complex exception table (1864 lines). Helper method approach required.
 * Fingerprint pins definingClass + name + exact params + method calls.
 */
object IAPBypassLaunchBillingFlowFingerprint : Fingerprint(
    definingClass = "Lcom/android/billingclient/api/BillingClientImpl;",
    name = "launchBillingFlow",
    returnType = "Lcom/android/billingclient/api/BillingResult;",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf(
        "Landroid/app/Activity;",
        "Lcom/android/billingclient/api/BillingFlowParams;"
    )
)

/**
 * BillingClientImpl.acknowledgePurchase(AcknowledgePurchaseParams, AcknowledgePurchaseResponseListener)
 * — intercepts to return OK immediately, preventing billing error on acknowledge.
 */
object IAPBypassAcknowledgePurchaseFingerprint : Fingerprint(
    definingClass = "Lcom/android/billingclient/api/BillingClientImpl;",
    name = "acknowledgePurchase",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf(
        "Lcom/android/billingclient/api/AcknowledgePurchaseParams;",
        "Lcom/android/billingclient/api/AcknowledgePurchaseResponseListener;"
    ),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/android/billingclient/api/BillingClientImpl;",
            name = "isReady"
        )
    )
)

/**
 * BillingClientImpl.consumeAsync(ConsumeParams, ConsumeResponseListener)
 * — intercepts to return OK + token immediately.
 */
object IAPBypassConsumeAsyncFingerprint : Fingerprint(
    definingClass = "Lcom/android/billingclient/api/BillingClientImpl;",
    name = "consumeAsync",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf(
        "Lcom/android/billingclient/api/ConsumeParams;",
        "Lcom/android/billingclient/api/ConsumeResponseListener;"
    ),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/android/billingclient/api/BillingClientImpl;",
            name = "isReady"
        )
    )
)

/**
 * BillingClientImpl.queryProductDetailsAsync(QueryProductDetailsParams, ProductDetailsResponseListener)
 * — intercepts to return fake ProductDetails for each requested SKU.
 */
object IAPBypassQueryProductDetailsAsyncFingerprint : Fingerprint(
    definingClass = "Lcom/android/billingclient/api/BillingClientImpl;",
    name = "queryProductDetailsAsync",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf(
        "Lcom/android/billingclient/api/QueryProductDetailsParams;",
        "Lcom/android/billingclient/api/ProductDetailsResponseListener;"
    ),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/android/billingclient/api/BillingClientImpl;",
            name = "isReady"
        )
    )
)

/**
 * BillingClientImpl.queryPurchasesAsync(QueryPurchasesParams, PurchasesResponseListener)
 * — intercepts to return OK with empty purchase list.
 * Method is `public final` in SF2 billing 7.1.1.
 */
object IAPBypassQueryPurchasesAsyncFingerprint : Fingerprint(
    definingClass = "Lcom/android/billingclient/api/BillingClientImpl;",
    name = "queryPurchasesAsync",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(
        "Lcom/android/billingclient/api/QueryPurchasesParams;",
        "Lcom/android/billingclient/api/PurchasesResponseListener;"
    )
)

/**
 * BillingClientImpl.startConnection(BillingClientStateListener)
 * — fakes billing connection by setting zzb=2 (CONNECTED) and calling
 * onBillingSetupFinished(OK) immediately. This makes C++ code see a
 * properly connected billing client.
 */
object IAPBypassStartConnectionFingerprint : Fingerprint(
    definingClass = "Lcom/android/billingclient/api/BillingClientImpl;",
    name = "startConnection",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf(
        "Lcom/android/billingclient/api/BillingClientStateListener;"
    )
)
