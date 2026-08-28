package app.smashhit.patches.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import app.morphe.patcher.methodCall

/**
 * AndroidStore.smali - Master premium ownership check.
 * ownsPremiumProduct()Z checks mOwnedProducts for premium or dynamic_premium.
 * Body is replaced: always returns true.
 */
object OwnsPremiumProductFingerprint : Fingerprint(
    definingClass = "Lcom/mediocre/smashhit/AndroidStore;",
    name = "ownsPremiumProduct",
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        string("com.mediocre.smashhit.premium")
    )
)

/**
 * CommandThreadsafeModel.smali - Core product ownership check.
 * isProductOwned(String)Z checks mOwnedProducts HashSet.contains().
 * declared-synchronized method - must inject AFTER monitor-enter (index 1).
 * Body is replaced: always returns true with proper monitor-exit.
 */
object IsProductOwnedFingerprint : Fingerprint(
    definingClass = "Lcom/mediocre/smashhit/CommandThreadsafeModel;",
    name = "isProductOwned",
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(
        methodCall(
            definingClass = "Ljava/util/HashSet;",
            name = "contains"
        )
    )
)

/**
 * GooglePlaySystem.smali - Ad gating entry point.
 * OnSyncCompleted()V calls ownsPremiumProduct() then loads ads if not premium.
 * Contains string "GooglePlaySystem.OnSyncCompleted - enter".
 * Body is replaced: return immediately (skip ad loading).
 */
object OnSyncCompletedFingerprint : Fingerprint(
    definingClass = "Lcom/mediocre/smashhit/GooglePlaySystem;",
    name = "OnSyncCompleted",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        string("GooglePlaySystem.OnSyncCompleted - enter")
    )
)

/**
 * AndroidStore.smali - Purchase flow entry point.
 * startPurchaseFlow(Activity, String)V launches Google Play billing.
 * Contains string "AndroidStore.startPurchaseFlow - enter".
 * Body is replaced: return immediately (prevent Play Store from opening).
 */
object StartPurchaseFlowFingerprint : Fingerprint(
    definingClass = "Lcom/mediocre/smashhit/AndroidStore;",
    name = "startPurchaseFlow",
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;", "Ljava/lang/String;"),
    filters = listOf(
        string("AndroidStore.startPurchaseFlow - enter")
    )
)

/**
 * CommandHandler.smali - Lambda that returns hasRefreshedOwnedProducts.
 * lambda$setupCommands$1 reads AtomicBoolean.get() and calls boolToString().
 * Body is replaced: return "true".
 */
object HasRefreshedOwnedProductsFingerprint : Fingerprint(
    definingClass = "Lcom/mediocre/smashhit/CommandHandler;",
    name = "lambda\$setupCommands\$1\$com-mediocre-smashhit-CommandHandler",
    returnType = "Ljava/lang/String;",
    parameters = listOf("[Ljava/lang/String;"),
    filters = listOf(
        methodCall(
            definingClass = "Ljava/util/concurrent/atomic/AtomicBoolean;",
            name = "get"
        )
    )
)

/**
 * CommandHandler.smali - Lambda that returns isPremiumProductRestored.
 * lambda$setupCommands$41 reads AtomicBoolean.get() and calls boolToString().
 * Body is replaced: return "true".
 */
object IsPremiumProductRestoredFingerprint : Fingerprint(
    definingClass = "Lcom/mediocre/smashhit/CommandHandler;",
    name = "lambda\$setupCommands\$41\$com-mediocre-smashhit-CommandHandler",
    returnType = "Ljava/lang/String;",
    parameters = listOf("[Ljava/lang/String;"),
    filters = listOf(
        methodCall(
            definingClass = "Ljava/util/concurrent/atomic/AtomicBoolean;",
            name = "get"
        )
    )
)
