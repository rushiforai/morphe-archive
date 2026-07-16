package app.jouss.patches.morolingo.premium

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// LicenseClient.processResponse — Pairip license check callback
// responseCode p1: 0=LICENSED, 2=NOT_LICENSED (shows paywall/kills app), 3=ERROR
object PairipProcessResponseFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "processResponse",
    returnType = "V",
)

// LicenseResponseHelper.validateResponse — Pairip RSA signature validation
// Throws LicenseCheckException if signature doesn't match; bypassing makes any response valid
object PairipValidateResponseFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseResponseHelper;",
    name = "validateResponse",
    returnType = "V",
)

// EntitlementInfo.isActive() — RevenueCat boolean property getter
// The EntitlementInfoMapper and JS bridge both call this. Force it to return true.
object EntitlementInfoIsActiveFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/EntitlementInfo;",
    name = "isActive",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf()
)

// EntitlementInfo.getWillRenew() — RevenueCat boolean property getter
// Force subscription to appear renewable so the app treats it as a valid premium subscription.
object EntitlementInfoGetWillRenewFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/EntitlementInfo;",
    name = "getWillRenew",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf()
)

// EntitlementInfo.getVerification() — RevenueCat verification status
// Force verification to VERIFIED so the app never treats the entitlement as unverified.
object EntitlementInfoGetVerificationFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/EntitlementInfo;",
    name = "getVerification",
    returnType = "Lcom/revenuecat/purchases/VerificationResult;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf()
)

// CustomerInfo.getActiveSubscriptions() — THE KEY FIX
// The JS app's hasActiveEntitlementOrSubscription() checks activeSubscriptions.length > 0 FIRST.
// If the user never subscribed, RevenueCat returns an empty set and the app shows the paywall.
// Our EntitlementInfo.isActive() patch is useless here because there are ZERO EntitlementInfo objects.
// Patching getActiveSubscriptions() to return a non-empty set makes the JS app see an active subscription
// and call setIsPremiumUser(true), unlocking all premium features.
object CustomerInfoGetActiveSubscriptionsFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/CustomerInfo;",
    name = "getActiveSubscriptions",
    returnType = "Ljava/util/Set;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf()
)

// Superwall Entitlements.setSubscriptionStatus — The JS bridge (SuperwallReactNativeModule.setSubscriptionStatus)
// calls this to mirror the RevenueCat subscription state. If RevenueCat has no entitlements configured,
// the JS app sends an empty entitlements list, which Superwall downgrades to INACTIVE. This patch forces
// the status to always be ACTIVE with a synthetic entitlement, regardless of what the JS app sends.
object SuperwallSetSubscriptionStatusFingerprint : Fingerprint(
    definingClass = "Lcom/superwall/sdk/store/Entitlements;",
    name = "setSubscriptionStatus",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Lcom/superwall/sdk/models/entitlements/SubscriptionStatus;")
)

