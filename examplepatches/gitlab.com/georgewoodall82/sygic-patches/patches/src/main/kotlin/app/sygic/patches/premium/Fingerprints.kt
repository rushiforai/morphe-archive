package app.sygic.patches.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

/**
 * Fingerprints for Sygic GPS Truck & Caravan 26.1.9 (261119003).
 *
 * Verified with androguard (verify.py, 27 PASS) against
 * Sygic+GPS+Truck+&+Caravan_26.1.9_APKPure.apk.
 *
 * Unlike Songsterr, Sygic barely obfuscates Java: class/method names are
 * stable. The real license check lives in native libAura.so
 * (nProcessStoreResponse, nGetProductRecordSet, nCheckLicenseKey,
 * HasAALicense are native, no DEX code). These fingerprints target the
 * Java billing bridge around it:
 *
 * - GoogleInAppPurchaseHelper: talks to Play Billing, then forwards to
 *   SygicMain.ProcessStoreResponse -> native nProcessStoreResponse.
 * - LowStoreFeatureBase: isEnabled() always true; isSupported() checks
 *   isBillingSupported().
 * - SygicMain.Store*: thin delegates to LowStoreFeature.
 * - SidebarServiceImpl.checkLicense -> native nCheckLicenseKey.
 *
 * Filters use stable log strings so a wrong-version match fails fast
 * instead of patching the wrong method.
 */

// --- Google Play billing bridge ---

object BillingSupportedFingerprint : Fingerprint(
    definingClass = "Lcom/sygic/aura/helpers/GoogleInAppPurchaseHelper;",
    name = "isBillingSupported",
    returnType = "Z",
    parameters = listOf(),
    isStatic = false,
    filters = listOf(
        string("isBillingSupported() - "),
    ),
)

object SubscriptionsSupportedFingerprint : Fingerprint(
    definingClass = "Lcom/sygic/aura/helpers/GoogleInAppPurchaseHelper;",
    name = "areSubscriptionsSupported",
    returnType = "Z",
    parameters = listOf(),
    isStatic = false,
    filters = listOf(
        string("areSubscriptionsSupported() responseCode: "),
    ),
)

object BuyDoneFingerprint : Fingerprint(
    definingClass = "Lcom/sygic/aura/helpers/GoogleInAppPurchaseHelper;",
    name = "buyDone",
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;"),
    isStatic = false,
    filters = listOf(
        string("buyDone: "),
    ),
)

// handlePurchases(I, List, Z)Z forwards to native ProcessStoreResponse.
// Do NOT returnEarly this one: its internal ProcessStoreResponse call is
// what informs native code. Patched separately only if needed.
object HandlePurchasesFingerprint : Fingerprint(
    definingClass = "Lcom/sygic/aura/helpers/GoogleInAppPurchaseHelper;",
    name = "handlePurchases",
    returnType = "Z",
    parameters = listOf("I", "Ljava/util/List;", "Z"),
    isStatic = false,
    filters = listOf(
        string("handlePurchases: responseCode: "),
        methodCall(
            definingClass = "Lcom/sygic/aura/SygicMain;",
            name = "ProcessStoreResponse",
        ),
    ),
)

// --- Store feature layer ---

object StoreBaseSupportedFingerprint : Fingerprint(
    definingClass = "Lcom/sygic/aura/feature/store/LowStoreFeatureBase;",
    name = "isSupported",
    returnType = "Z",
    parameters = listOf(),
    isStatic = false,
    filters = listOf(
        methodCall(
            definingClass = "Lcom/sygic/aura/feature/store/InAppPurchase;",
            name = "isBillingSupported",
        ),
    ),
)

object StoreBaseBuyDoneFingerprint : Fingerprint(
    definingClass = "Lcom/sygic/aura/feature/store/LowStoreFeatureBase;",
    name = "buyDone",
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;"),
    isStatic = false,
)

// --- SygicMain entry points (what UI code calls) ---

object SygicStoreEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/sygic/aura/SygicMain;",
    name = "StoreIsEnabled",
    returnType = "Z",
    parameters = listOf(),
    isStatic = false,
)

object SygicStoreSupportedFingerprint : Fingerprint(
    definingClass = "Lcom/sygic/aura/SygicMain;",
    name = "StoreIsSupported",
    returnType = "Z",
    parameters = listOf(),
    isStatic = false,
)

object SygicStoreBuyDoneFingerprint : Fingerprint(
    definingClass = "Lcom/sygic/aura/SygicMain;",
    name = "StoreBuyDone",
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;"),
    isStatic = false,
)

// --- Sidebar license (B2B path) ---

object SidebarLicenseFingerprint : Fingerprint(
    definingClass = "Lcom/sygic/aura/sidebar/SidebarServiceImpl;",
    name = "checkLicense",
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;"),
    isStatic = false,
    filters = listOf(
        methodCall(
            definingClass = "Lcom/sygic/aura/sidebar/SidebarServiceImpl;",
            name = "nCheckLicenseKey",
        ),
    ),
)
