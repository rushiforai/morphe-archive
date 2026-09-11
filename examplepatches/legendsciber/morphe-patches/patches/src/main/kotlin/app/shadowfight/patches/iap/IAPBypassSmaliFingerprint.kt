package app.shadowfight.patches.iap

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * BillingClientImpl.launchBillingFlow — the base implementation called
 * at runtime when the game's C++ code invokes launchBillingFlow via JNI.
 * Intercepted to prevent Google Play from opening and instead trigger
 * the purchase callback with a fake Purchase.
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
 * zzbm.onPurchasesUpdated — Unity JNI bridge callback that receives
 * purchase results from Google Play Billing. Intercepted to inject a
 * fake Purchase and call nativeOnPurchasesUpdated directly, bypassing
 * Google Play while triggering the game's C# purchase completion flow.
 */
object IAPBypassOnPurchasesUpdatedFingerprint : Fingerprint(
    definingClass = "Lcom/android/billingclient/api/zzbm;",
    name = "onPurchasesUpdated",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(
        "Lcom/android/billingclient/api/BillingResult;",
        "Ljava/util/List;"
    )
)

/**
 * zzbm.onQueryPurchasesResponse — Unity JNI bridge callback that receives
 * query-purchase results. Intercepted to inject the same fake Purchase so
 * the C++ side sees a valid purchase when verifying via queryPurchasesAsync.
 */
object IAPBypassOnQueryPurchasesResponseFingerprint : Fingerprint(
    definingClass = "Lcom/android/billingclient/api/zzbm;",
    name = "onQueryPurchasesResponse",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(
        "Lcom/android/billingclient/api/BillingResult;",
        "Ljava/util/List;"
    )
)

/**
 * BillingClientImpl.queryPurchasesAsync(QueryPurchasesParams, PurchasesResponseListener)
 * — intercepts the query to return fake OK result with empty list, preventing
 * the "connection error" that occurs when zzaI checks isReady() (false without
 * Google Play connection).
 */
object IAPBypassQueryPurchasesAsyncParamsFingerprint : Fingerprint(
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
 * BillingClientImpl.queryPurchasesAsync(String, PurchasesResponseListener)
 * — intercepts the query to return fake OK result with empty list.
 */
object IAPBypassQueryPurchasesAsyncStringFingerprint : Fingerprint(
    definingClass = "Lcom/android/billingclient/api/BillingClientImpl;",
    name = "queryPurchasesAsync",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(
        "Ljava/lang/String;",
        "Lcom/android/billingclient/api/PurchasesResponseListener;"
    )
)

/**
 * BillingClientImpl.isReady() — returns true to make the game think
 * the billing client is connected to Google Play, preventing
 * "connection error" when the game checks billing state.
 */
object IAPBypassIsReadyFingerprint : Fingerprint(
    definingClass = "Lcom/android/billingclient/api/BillingClientImpl;",
    name = "isReady",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList()
)

/**
 * BillingClientStateListener.onBillingSetupFinished callback interface
 * used by startConnection interception.
 */

/**
 * BillingClientImpl.startConnection(BillingClientStateListener)
 * — intercepts to call listener.onBillingSetupFinished(OK) immediately,
 * making the game think billing is connected.
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

/**
 * BillingClientImpl.querySkuDetailsAsync(SkuDetailsParams, SkuDetailsResponseListener)
 * — intercepts to return fake OK result with empty list, preventing
 * connection error when querying product details.
 */
object IAPBypassQuerySkuDetailsAsyncFingerprint : Fingerprint(
    definingClass = "Lcom/android/billingclient/api/BillingClientImpl;",
    name = "querySkuDetailsAsync",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf(
        "Lcom/android/billingclient/api/SkuDetailsParams;",
        "Lcom/android/billingclient/api/SkuDetailsResponseListener;"
    )
)

/**
 * SecurityManager.VerifyStep() — game's anti-tamper check that verifies
 * APK signature, installer ID, debug/emulator state. When APK is
 * repackaged by Morphe, signature check fails and C++ code disables
 * billing (showing "connection error" on any purchase attempt).
 * Intercepted to always call NotifyOnSuccess(), bypassing all checks.
 */
object IAPBypassSecurityVerifyStepFingerprint : Fingerprint(
    definingClass = "Lcom/nekki/utils/security/SecurityManager;",
    name = "VerifyStep",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = emptyList()
)
