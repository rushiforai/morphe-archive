package app.template.patches.kidsdoctorgames

import app.morphe.patcher.Fingerprint

internal object HasTrustedActiveSharedSubscriptionFingerprint : Fingerprint(
    definingClass = "Lcom/bimiboo/pass/SharedSubClient;",
    name = "hasTrustedActiveSharedSubscription",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;", "[Ljava/lang/String;", "Z"),
)

internal object QueryPackageFingerprint : Fingerprint(
    definingClass = "Lcom/bimiboo/pass/SharedSubClient;",
    name = "queryPackage",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
)

internal object TrustedActiveSharedSubscriptionExpiryFingerprint : Fingerprint(
    definingClass = "Lcom/bimiboo/pass/SharedSubClient;",
    name = "trustedActiveSharedSubscriptionExpiry",
    returnType = "J",
    parameters = listOf("Landroid/content/Context;", "[Ljava/lang/String;", "Z"),
)

internal object QueryPackageExpiryFingerprint : Fingerprint(
    definingClass = "Lcom/bimiboo/pass/SharedSubClient;",
    name = "queryPackageExpiry",
    returnType = "J",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
)

internal object SharedSubStoreIsActiveFingerprint : Fingerprint(
    definingClass = "Lcom/bimiboo/pass/SharedSubStore;",
    name = "isActive",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
)

internal object SharedSubStoreExpiresAtFingerprint : Fingerprint(
    definingClass = "Lcom/bimiboo/pass/SharedSubStore;",
    name = "expiresAt",
    returnType = "J",
    parameters = listOf("Landroid/content/Context;"),
)

internal object SharedSubTrustPolicyIsTrustedFingerprint : Fingerprint(
    definingClass = "Lcom/bimiboo/pass/SharedSubTrustPolicy;",
    name = "isTrusted",
    returnType = "Z",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "[Ljava/lang/String;",
        "Z",
    ),
)

internal object BbIdCrossAppTrustIsTrustedFingerprint : Fingerprint(
    definingClass = "Lcom/bimiboo/bimibooid/crossapp/BbIdCrossAppTrust;",
    name = "isTrusted",
    returnType = "Z",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "[Ljava/lang/String;",
        "Z",
    ),
)

internal object PurchaseGetPurchaseStateFingerprint : Fingerprint(
    definingClass = "Lcom/android/billingclient/api/Purchase;",
    name = "getPurchaseState",
    returnType = "I",
    parameters = emptyList(),
)

internal object PurchaseIsAcknowledgedFingerprint : Fingerprint(
    definingClass = "Lcom/android/billingclient/api/Purchase;",
    name = "isAcknowledged",
    returnType = "Z",
    parameters = emptyList(),
)

internal object UnityPlayerActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/unity3d/player/UnityPlayerActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

internal object UnityPlayerActivityOnResumeFingerprint : Fingerprint(
    definingClass = "Lcom/unity3d/player/UnityPlayerActivity;",
    name = "onResume",
    returnType = "V",
    parameters = emptyList(),
)
