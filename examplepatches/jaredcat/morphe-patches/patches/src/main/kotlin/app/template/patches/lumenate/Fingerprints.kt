package app.template.patches.lumenate

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Lumenate 7.1.1 (com.lumenate.lumenateaa) entitlement fingerprints.
 *
 * Central gate (from decompiled sources):
 * - SubscriptionManager companion `g0$a.a(CustomerInfo, SharedPreferences)`
 *   checks RevenueCat entitlement `"unlocked"` and returns `ProcessedCustomerInfo`
 * - `Lumenate$a.g(boolean, Boolean)` writes the app-wide `Lumenate.q` premium flag
 * - `ProcessedCustomerInfo.b()` exposes `subscribed`
 *
 * Class names `g0` / `M` are R8-obfuscated for this build only — fingerprints are
 * version-pinned via unique string literals so mismatches fail loudly.
 */
object IsSubscriberFingerprint : Fingerprint(
    definingClass = "Lcom/lumenate/lumenate/subscription/g0\$a;",
    name = "a",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Lcom/lumenate/lumenate/subscription/M;",
    parameters = listOf(
        "Lcom/revenuecat/purchases/CustomerInfo;",
        "Landroid/content/SharedPreferences;",
    ),
    // Use `strings` (unordered). `filters`/`string()` match sequentially in bytecode
    // order; Status appears before Boolean in g0$a.a so ordered filters failed.
    strings = listOf(
        "unlocked",
        "errorRetrievalBoolean",
        "errorRetrievalStatus",
        "isSubscriber? customer info: ",
    ),
)

object SetFullAppAccessFingerprint : Fingerprint(
    definingClass = "Lcom/lumenate/lumenate/Lumenate\$a;",
    name = "g",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Z", "Ljava/lang/Boolean;"),
)

object ProcessedCustomerInfoSubscribedFingerprint : Fingerprint(
    // R8 name `M` is build-specific; full class path + empty-arg `b()Z` is unique in 7.1.1.
    definingClass = "Lcom/lumenate/lumenate/subscription/M;",
    name = "b",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
)

/**
 * Lazy LiveData factory for the premium flag (`Lumenate.v()` → `new J(Boolean.FALSE)`).
 * Forcing TRUE avoids a free-tier flash before SubscriptionManager callbacks run.
 */
object PremiumLiveDataInitFingerprint : Fingerprint(
    definingClass = "Lcom/lumenate/lumenate/Lumenate;",
    name = "v",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Landroidx/lifecycle/J;",
    parameters = listOf(),
)
