package app.template.patches.lumenate

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Lumenate 7.1.3 (com.lumenate.lumenateaa) entitlement fingerprints.
 *
 * Central gate (from decompiled sources):
 * - SubscriptionManager companion `g0$a.a(CustomerInfo, SharedPreferences)`
 *   checks RevenueCat entitlement `"unlocked"` and returns `ProcessedCustomerInfo`
 * - `Lumenate$a.g(boolean, Boolean)` writes the app-wide `Lumenate.q` premium flag
 * - `ProcessedCustomerInfo.b()` exposes `subscribed`
 * - `Lumenate.u()` seeds LiveData with `Boolean.FALSE` (was `v()`/`J` in 7.1.1)
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
    // R8 name `M` is build-specific; full class path + empty-arg `b()Z` is unique in 7.1.3.
    definingClass = "Lcom/lumenate/lumenate/subscription/M;",
    name = "b",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
)

/**
 * Lazy LiveData factory for the premium flag (`Lumenate.u()` → `new I(Boolean.FALSE)`).
 * Forcing TRUE avoids a free-tier flash before SubscriptionManager callbacks run.
 * Renamed from `v()`/`J` in 7.1.1.
 */
object PremiumLiveDataInitFingerprint : Fingerprint(
    definingClass = "Lcom/lumenate/lumenate/Lumenate;",
    name = "u",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Landroidx/lifecycle/I;",
    parameters = listOf(),
)

/**
 * Application onCreate — force `Lumenate.q = true` before any Activity snapshots it
 * (OpenAIWelcomeActivity Begin lock, landing favourite overlays).
 */
object LumenateOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/lumenate/lumenate/Lumenate;",
    name = "onCreate",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf(),
)

/**
 * Guide Begin click: `OpenAIWelcomeActivity.d0(premium, activity, view)`.
 * When premium is false → Paywall / UnlockAllContent ("Deepen Your Journey").
 */
object GuideBeginClickFingerprint : Fingerprint(
    definingClass = "Lcom/lumenate/lumenate/chatgpt/OpenAIWelcomeActivity;",
    name = "d0",
    // Kotlin synthetic: PRIVATE in DEX (jadx shows "Access modifiers changed from: private")
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Z", "Lcom/lumenate/lumenate/chatgpt/OpenAIWelcomeActivity;", "Landroid/view/View;"),
)

/**
 * Session landing free-tier favourite/download wiring (`F1`). Redirect to premium
 * wiring (`I1`) so favourites work even if a screen still took the free branch.
 */
object SessionLandingLockFavoritesFingerprint : Fingerprint(
    definingClass = "Lcom/lumenate/lumenate/landing/b;",
    name = "F1",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(),
)

/**
 * Demo landing toast overlays for favourite / download when not premium.
 * Unique literal: "Unlock the app to access this feature!"
 */
object DemoFavoriteUnlockToastFingerprint : Fingerprint(
    definingClass = "Lcom/lumenate/lumenate/landing/LandingDemoExperience\$f;",
    name = "onClick",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Landroid/view/View;"),
    strings = listOf("Unlock the app to access this feature!"),
)

object DemoDownloadUnlockToastFingerprint : Fingerprint(
    definingClass = "Lcom/lumenate/lumenate/landing/LandingDemoExperience\$h;",
    name = "onClick",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Landroid/view/View;"),
    strings = listOf("Unlock the app to access this feature!"),
)
