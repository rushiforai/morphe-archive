package patches.foodpanda

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.instanceOf
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

// pandapro membership is a Kotlin sealed class `UserSubscriptionStatus`, tested app-wide via
// `instanceof UserSubscriptionStatus.Subscribed`. The Subscribed base survives obfuscation as the
// stable first-party type `Lcom/deliveryhero/subscription/api/o;` (its package + sealed role are
// readable even though the short class name is R8-minified). We anchor on that type, never on the
// minified holder classes (`ob40`, `pmx`, `ege0`, `C6999ph`), which churn every release.
internal const val SUBSCRIBED_TYPE = "Lcom/deliveryhero/subscription/api/o;"
internal const val SUBSCRIBED_BENEFITS_TYPE = "Lcom/deliveryhero/subscription/api/SubscribedBenefits;"

/**
 * Every `isSubscribed()`-style predicate in the app, i.e. a method whose returned value IS
 * `Boolean.valueOf(status instanceof UserSubscriptionStatus.Subscribed)`.
 *
 * This exact idiom is the SubscriptionStatusApi implementation (`ob40.b`, the suspend
 * `isSubscribed(): Boolean`) plus its sibling isSubscribed lambdas (`pmx`, `ege0`, …) — all
 * verified to emit `instance-of <Subscribed>` followed by `Boolean.valueOf(Z)` whose boxed result is
 * `return-object`ed. Matched with `matchAllOrNull()`; each match is then re-verified in the patch to
 * be predicate-only before being forced to TRUE (see UnlockPremiumPatch).
 *
 * Name-agnostic anchors (all stable across releases):
 *   1. `returnType = "Ljava/lang/Object;"` — every genuine member is a Kotlin `suspend fun`/lambda
 *      returning a BOXED `Boolean` (JVM erases to `Object`). This is the first-line exclusion of the
 *      analytics map-builders that merely CONTAIN the idiom: e.g. `c640.a(Continuation)` builds a
 *      `{subscribedUser: bool, subscriptionType: …}` map and returns `Ljava/io/Serializable;`
 *      (a `java.util.Map`). It puts the boxed boolean into `Map.put(...)`, it does NOT return it — so
 *      forcing an early boxed-Boolean return there made the Account screen's `check-cast … Map`
 *      (`i1u.g`) throw `Boolean cannot be cast to Map`. A different return type keeps such methods out.
 *   2. `instance-of ..., Lcom/deliveryhero/subscription/api/o;`  (the Subscribed sealed type), then
 *   3. `Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;`     (the box of that boolean).
 * No obfuscated identifier is referenced.
 *
 * NOTE: filters 2+3 alone match some map-builders (they contain the idiom too); the `returnType`
 * above plus the predicate-shape re-check in the patch are what make the unlock predicate-only.
 */
internal val isSubscribedFingerprint = Fingerprint(
    // suspend fun / lambda returning a boxed Boolean -> erased to Object. Map-builders that merely
    // contain the instanceof-Subscribed idiom return Serializable/Map and are excluded here.
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        instanceOf(SUBSCRIBED_TYPE),
        methodCall(
            definingClass = "Ljava/lang/Boolean;",
            name = "valueOf",
            returnType = "Ljava/lang/Boolean;",
        ),
    ),
)

/**
 * `UserSubscriptionStatus.Subscribed.hasBenefits()` — obfuscated `Lcom/deliveryhero/subscription/
 * api/o;->a()Z`, which is just `getSubscribedBenefits() != null`.
 *
 * Anchored name-agnostically on the stable, non-minified return type `SubscribedBenefits` of the
 * getter it calls, plus the exact method shape (public final, no params, returns Z). Forcing this
 * true (a supplement to the primary isSubscribed unlock) makes the "has benefits" entitlement gate
 * pass once a user is treated as Subscribed.
 */
internal val hasBenefitsFingerprint = Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
    filters = listOf(
        methodCall(returnType = SUBSCRIBED_BENEFITS_TYPE),
    ),
)

/**
 * The master DeliveryHero MAS (Mobile App Security) gate: `w9u.a(Continuation)` — obfuscated
 * `Lw9u;->a(Ltx9;)Ljava/lang/Object;`, a Kotlin `suspend fun` returning a boxed `Boolean` where
 * TRUE = device/app trusted and FALSE = launch `com.deliveryhero.app.security.ui.BlockedActivity`
 * ("This device or application is not supported. Please re-install…"). Every foreground activity is
 * run through this gate; a re-signed / sideloaded build fails the app-id / installer-source / root
 * integrity checks, so the gate returns FALSE and the block screen fires.
 *
 * Anchored entirely on NON-obfuscated DeliveryHero-MAS references, so it survives R8 renames — we
 * never key on the minified holder `w9u`. Ordered filters mirror the verified instruction order:
 *   1. `new-instance ..., Lcom/deliveryhero/app/security/MasEvaluationException;` (the MAS exception
 *      this method constructs on failure — a first-party, non-minified class), then
 *   2. const-string `"MAS eval"`, then
 *   3. const-string `"MAS evaluation failed."`.
 * Combined with the exact method shape (public final, one obfuscated `Continuation` param -> "L",
 * returns `Ljava/lang/Object;`) this pins the gate uniquely.
 */
internal val masGateFingerprint = Fingerprint(
    returnType = "Ljava/lang/Object;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("L"), // Ltx9; = kotlin Continuation, obfuscated -> "L"
    filters = listOf(
        newInstance("Lcom/deliveryhero/app/security/MasEvaluationException;"),
        string("MAS eval"),
        string("MAS evaluation failed."),
    ),
)
