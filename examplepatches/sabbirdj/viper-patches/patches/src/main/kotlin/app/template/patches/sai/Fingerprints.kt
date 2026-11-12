package app.template.patches.sai

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

/**
 * SAI (com.mtv.sai) premium is decided by RevenueCat. The app reads the
 * "SAI Premium" entitlement from the RevenueCat CustomerInfo entitlements map
 * in three places and turns it into a boolean. All three must be forced to
 * true for premium to activate (verified on SAI 2.4.3, versionCode 49).
 *
 * The entitlement object itself comes from RevenueCat's servers, so these
 * fingerprints match on the local boolean derivation, not on the server data.
 * The boolean register forced by each patch (v1 / v1 / v3) is correct for
 * SAI 2.4.3; the patches are pinned to that version in Constants.
 *
 * Every fingerprint pins its defining class and method name. Without that,
 * the patcher searches every method in the app, and the generic single-letter
 * names (ck0, fk0, dk0, h, invoke) can match the wrong method. Pinning makes
 * each fingerprint land on exactly the method it was written for.
 */

/**
 * ck0.invoke — the callback that turns the entitlement into
 * Finished(hasActiveEntitlement=...).
 *
 * Instruction order in the method:
 *   const-string "SAI Premium"
 *   ... map lookup, isActive check ...
 *   invoke-virtual {p0, p1}, Lfk0;->h(Lcm1;)V
 *   new-instance p1, Las6;
 *   invoke-direct {p1, v1}, Las6;-><init>(Z)V
 */
object SaiPremiumCk0Fingerprint : Fingerprint(
    definingClass = "Lck0;",
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        string("SAI Premium"),
        methodCall(
            name = "h",
            parameters = listOf("L"),
        ),
        methodCall(
            name = "<init>",
            parameters = listOf("Z"),
        ),
    )
)

/**
 * fk0.h — the central publisher of the premium state. It wraps the boolean
 * with Boolean.valueOf and publishes it to the UI state.
 *
 * Instruction order in the method:
 *   const-string "SAI Premium"
 *   ... map lookup, isActive check ...
 *   invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
 */
object SaiPremiumFk0Fingerprint : Fingerprint(
    definingClass = "Lfk0;",
    name = "h",
    returnType = "V",
    parameters = listOf("Lcm1;"),
    filters = listOf(
        string("SAI Premium"),
        methodCall(
            definingClass = "Ljava/lang/Boolean;",
            name = "valueOf",
            parameters = listOf("Z"),
            returnType = "Ljava/lang/Boolean;",
        ),
    )
)

/**
 * dk0 — a second entitlement reader. It calls fk0.h and then branches:
 * premium -> returns the premium object, otherwise reads the entitlements
 * map key set.
 *
 * Instruction order in the method:
 *   const-string "SAI Premium"
 *   ... map lookup, isActive check ...
 *   invoke-virtual {p0, p2}, Lfk0;->h(Lcm1;)V
 *   if-eqz v3, :cond_1
 *   ... (premium branch) ...
 *   invoke-virtual {p0}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;
 */
object SaiPremiumDk0Fingerprint : Fingerprint(
    definingClass = "Ldk0;",
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;"),
    filters = listOf(
        string("SAI Premium"),
        methodCall(
            name = "h",
            parameters = listOf("L"),
        ),
        methodCall(
            name = "keySet",
            returnType = "Ljava/util/Set;",
        ),
    )
)
