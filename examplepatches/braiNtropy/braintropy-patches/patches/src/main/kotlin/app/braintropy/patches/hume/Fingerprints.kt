package app.braintropy.patches.hume

import app.morphe.patcher.Fingerprint

/**
 * Fingerprints for com.elink.fittrackhealth.pro (Hume).
 *
 * Hume is a Flutter app. These are the Helium paywall SDK's entitlement
 * checks — not the Hume Plus gate itself (that is the Play Billing
 * purchase stream; see UnlockPremiumPatch). The Helium SDK is not
 * obfuscated, so the methods are matched by exact class/name/signature.
 */
internal object HasAnyActiveSubscriptionFingerprint : Fingerprint(
    definingClass = "Lcom/tryhelium/paywall/core/HeliumImpl;",
    name = "hasAnyActiveSubscription",
    parameters = listOf("Z", "Lkotlin/coroutines/Continuation;"),
    returnType = "Ljava/lang/Object;"
)

internal object HasAnyEntitlementFingerprint : Fingerprint(
    definingClass = "Lcom/tryhelium/paywall/core/HeliumImpl;",
    name = "hasAnyEntitlement",
    parameters = listOf("Lkotlin/coroutines/Continuation;"),
    returnType = "Ljava/lang/Object;"
)

internal object HasEntitlementForPaywallFingerprint : Fingerprint(
    definingClass = "Lcom/tryhelium/paywall/core/HeliumImpl;",
    name = "hasEntitlementForPaywall",
    parameters = listOf("Ljava/lang/String;", "Lkotlin/coroutines/Continuation;"),
    returnType = "Ljava/lang/Object;"
)

internal object HasEntitlementForPaywallSyncFingerprint : Fingerprint(
    definingClass = "Lcom/tryhelium/paywall/core/HeliumImpl;",
    name = "hasEntitlementForPaywallSync",
    parameters = listOf("Ljava/lang/String;"),
    returnType = "Ljava/lang/Boolean;"
)

/**
 * package_info_plus methods through which the Dart code learns the app's
 * signing-cert SHA-256 and installer package. The backend rejects logins
 * from unknown signatures, so a re-signed install must report the original
 * release values.
 */
internal object GetBuildSignatureFingerprint : Fingerprint(
    definingClass = "Ldev/fluttercommunity/plus/packageinfo/PackageInfoPlugin;",
    name = "getBuildSignature",
    parameters = listOf("Landroid/content/pm/PackageManager;"),
    returnType = "Ljava/lang/String;"
)

internal object GetInstallerPackageNameFingerprint : Fingerprint(
    definingClass = "Ldev/fluttercommunity/plus/packageinfo/PackageInfoPlugin;",
    name = "getInstallerPackageName",
    parameters = emptyList(),
    returnType = "Ljava/lang/String;"
)

/**
 * play-services-basement helper that hashes the app's signing certificate.
 * Every Google API call (identitytoolkit, Firebase Installations, Remote
 * Config) reports this hash in its X-Android-Cert header; Hume's Firebase
 * project API key only allows the original release certificate and rejects
 * anything else ("Requests from this Android client application are
 * blocked"), which the app surfaces as a fake network error at login.
 */
internal object GetPackageCertificateHashBytesFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/common/util/AndroidUtilsLight;",
    name = "getPackageCertificateHashBytes",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
    returnType = "[B"
)

/**
 * Not patched itself; matched only to reach BillingClientImpl's classDef,
 * to which the patch adds the braintropyFeedPurchases helper methods.
 */
internal object QueryPurchasesFingerprint : Fingerprint(
    definingClass = "Lcom/android/billingclient/api/BillingClientImpl;",
    name = "queryPurchasesAsync",
    parameters = listOf(
        "Lcom/android/billingclient/api/QueryPurchasesParams;",
        "Lcom/android/billingclient/api/PurchasesResponseListener;"
    ),
    returnType = "V"
)

/**
 * Connect time spawns the BraintropyFeedLoop thread that re-feeds the
 * fake purchases to the client's PurchasesUpdatedListener (the only
 * native source of the Dart purchaseStream). The method has only one
 * local register, so the feed itself lives in the helper classes and
 * this just starts the loop.
 */
internal object StartConnectionFingerprint : Fingerprint(
    definingClass = "Lcom/android/billingclient/api/BillingClientImpl;",
    name = "startConnection",
    parameters = listOf("Lcom/android/billingclient/api/BillingClientStateListener;"),
    returnType = "V"
)

/**
 * Product-details queries happen when the paywall opens, i.e. after login
 * — the manual-path chance to feed the purchase stream if the repo missed
 * every timed feed. 9 registers / 3 params; the prepended helper call
 * uses no locals.
 */
internal object QueryProductDetailsFingerprint : Fingerprint(
    definingClass = "Lcom/android/billingclient/api/BillingClientImpl;",
    name = "queryProductDetailsAsync",
    parameters = listOf(
        "Lcom/android/billingclient/api/QueryProductDetailsParams;",
        "Lcom/android/billingclient/api/ProductDetailsResponseListener;"
    ),
    returnType = "V"
)
