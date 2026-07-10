package app.template.patches.thenx

import app.morphe.patcher.Fingerprint

object ThenxEntitlementInfosActiveFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/EntitlementInfos;",
    name = "getActive",
    parameters = emptyList(),
    returnType = "Ljava/util/Map;"
)

object ThenxEntitlementInfosAllFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/EntitlementInfos;",
    name = "getAll",
    parameters = emptyList(),
    returnType = "Ljava/util/Map;"
)

object ThenxEntitlementInfoIsActiveFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/EntitlementInfo;",
    name = "isActive",
    parameters = emptyList(),
    returnType = "Z"
)

object ThenxCustomerInfoActiveSubscriptionsFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/CustomerInfo;",
    name = "getActiveSubscriptions",
    parameters = emptyList(),
    returnType = "Ljava/util/Set;"
)

object ThenxCustomerInfoAllPurchasedProductIdsFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/CustomerInfo;",
    name = "getAllPurchasedProductIds",
    parameters = emptyList(),
    returnType = "Ljava/util/Set;"
)

/**
 * R8-renamed getter for [UserApiModel.isPro] (confirmed via dexdump: o0 → isPro field).
 * App gates paywall / premium UI primarily through this Boolean.
 */
object ThenxUserApiModelIsProFingerprint : Fingerprint(
    definingClass = "Lcom/sysops/thenx/data/model2023/model/UserApiModel;",
    name = "o0",
    parameters = emptyList(),
    returnType = "Ljava/lang/Boolean;"
)

/** R8-renamed getter for ExerciseApiModel.hasAccess. */
object ThenxExerciseHasAccessFingerprint : Fingerprint(
    definingClass = "Lcom/sysops/thenx/data/model2023/model/ExerciseApiModel;",
    name = "d",
    parameters = emptyList(),
    returnType = "Ljava/lang/Boolean;"
)

/** R8-renamed getter for WorkoutApiModel.hasAccess. */
object ThenxWorkoutHasAccessFingerprint : Fingerprint(
    definingClass = "Lcom/sysops/thenx/data/model2023/model/WorkoutApiModel;",
    name = "c",
    parameters = emptyList(),
    returnType = "Ljava/lang/Boolean;"
)

/**
 * Coroutine that treats empty active entitlements as free.
 * Forces Map.isEmpty result to false after RC getActive.
 */
object ThenxCustomerInfoActiveCheckFingerprint : Fingerprint(
    definingClass = "Lve/c\$o\$a;",
    name = "invokeSuspend",
    parameters = listOf("Ljava/lang/Object;"),
    returnType = "Ljava/lang/Object;"
)

/** MyUserCompoundModel.plan — Settings subtitle uses plan name/interval. */
object ThenxMyUserPlanFingerprint : Fingerprint(
    definingClass = "Lcom/sysops/thenx/data/model2023/model/compound/MyUserCompoundModel;",
    name = "b",
    parameters = emptyList(),
    returnType = "Lcom/sysops/thenx/data/model2023/model/PlanApiModel;"
)

/** MyUserCompoundModel.subscription — Membership screen needs non-null sub. */
object ThenxMyUserSubscriptionFingerprint : Fingerprint(
    definingClass = "Lcom/sysops/thenx/data/model2023/model/compound/MyUserCompoundModel;",
    name = "c",
    parameters = emptyList(),
    returnType = "Lcom/sysops/thenx/data/model2023/model/SubscriptionApiModel;"
)
