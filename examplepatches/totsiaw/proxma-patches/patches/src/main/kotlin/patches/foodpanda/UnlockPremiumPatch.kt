package patches.foodpanda

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/*
 * foodpanda pandapro (premium) unlock.
 *
 * There is no single `isPandaPro()` boolean — the whole app decides membership by testing
 * `status instanceof UserSubscriptionStatus.Subscribed` (the sealed type that survives obfuscation
 * as `Lcom/deliveryhero/subscription/api/o;`). The cleanest, name-agnostic lever is the family of
 * `Boolean.valueOf(status instanceof Subscribed)` predicates — the SubscriptionStatusApi impl
 * (`ob40.b`, suspend `isSubscribed()`) and its sibling lambdas (`pmx`, `ege0`, …). We match all of
 * them and force TRUE, flipping every consumer that asks the API "is the user subscribed?".
 *
 * These are suspend/lambda methods that return a BOXED result (`Ljava/lang/Object;`), so we return
 * `Boolean.TRUE` (return-object). Returning a real Boolean at method entry is a valid synchronous
 * completion for a suspend fn (it is not COROUTINE_SUSPENDED), so the caller sees the result TRUE.
 *
 * CRASH GUARD: the idiom `instance-of Subscribed` + `Boolean.valueOf` also appears inside methods
 * that DON'T return that boolean — notably an analytics map-builder (`c640.a`) that puts the boxed
 * boolean into a `Map` and returns the map (`Ljava/io/Serializable;`). The Account tab (`i1u.g`)
 * casts that result to `java.util.Map`, so injecting a boxed-Boolean return there threw
 * `Boolean cannot be cast to Map`. Below, every match is re-verified to be predicate-only (the
 * matched `valueOf` result is the method's `return-object` value) before it is touched.
 *
 * As a supplement we also force `Subscribed.hasBenefits()` (`.../api/o;->a()Z`) true, so the
 * entitlement gate that reads `subscribedBenefits != null` passes once the user is treated as
 * subscribed. (Deeper source-of-truth lever — forging a `Subscribed.Active` in the repository
 * `fc40.d` — is intentionally NOT attempted; it is structural and reserved as a fallback per the
 * findings notes.)
 *
 * NOTE (server-side): pandapro benefits (free delivery, discounts, exclusive vouchers) are enforced
 * by the backend at pricing/checkout. This client patch flips the app's local pro state / UI /
 * entitlement display; it will not by itself make the server apply benefits to an account that is
 * not actually subscribed.
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium (foodpanda)",
    description = "Unlocks foodpanda pandapro — forces every `isSubscribed()` check " +
        "(status instanceof UserSubscriptionStatus.Subscribed) to report subscribed and forces " +
        "Subscribed.hasBenefits() true, so the app's pro state, UI and entitlement gates unlock. " +
        "Server-enforced benefits (free delivery, vouchers) still require a real subscription.",
) {
    compatibleWith(COMPATIBILITY_FOODPANDA)

    execute {
        // PRIMARY: force every `Boolean.valueOf(status instanceof Subscribed)` predicate to TRUE.
        val subscribedMatches = isSubscribedFingerprint.matchAllOrNull()
            ?: error(
                "foodpanda: no `Boolean.valueOf(status instanceof " +
                    "$SUBSCRIBED_TYPE)` methods found — subscription API shape changed",
            )

        subscribedMatches.forEach { match ->
            val method = match.method

            // GUARD (crash fix): only patch methods that are genuine boolean predicates — where the
            // matched `Boolean.valueOf(status instanceof Subscribed)` result IS the method's returned
            // value (`valueOf -> move-result-object rX -> return-object rX`). Some methods merely
            // CONTAIN this idiom but return something else: e.g. `c640.a(Continuation)` boxes the
            // boolean into an analytics map (`Map.put("subscribedUser", …)`) and returns the MAP
            // (`Ljava/io/Serializable;`). The Account tab (`i1u.g`) awaits that call and does
            // `check-cast … Ljava/util/Map;`; injecting `return Boolean.TRUE` there caused the live
            // `java.lang.Boolean cannot be cast to java.util.Map` crash. The `returnType` filter on
            // the fingerprint already screens such map-builders out (they don't return Object); this
            // re-check is the decisive, name-independent guarantee even if that filter ever widens.
            //
            // instructionMatches[1] is the `Boolean.valueOf(Z)` call (filter index 1). We require the
            // two instructions after it to be `move-result-object rX` then `return-object rX`.
            val valueOfIndex = match.instructionMatches[1].index
            val insns = method.implementation!!.instructions.toList()
            val moveResult = insns.getOrNull(valueOfIndex + 1)
            val returnInsn = insns.getOrNull(valueOfIndex + 2)
            val isPredicateReturn = moveResult is OneRegisterInstruction &&
                moveResult.opcode == Opcode.MOVE_RESULT_OBJECT &&
                returnInsn is OneRegisterInstruction &&
                returnInsn.opcode == Opcode.RETURN_OBJECT &&
                moveResult.registerA == returnInsn.registerA
            if (!isPredicateReturn) {
                // Not an isSubscribed()-style predicate (the boxed boolean is consumed elsewhere,
                // e.g. put into a map). Skip — forcing a boxed-Boolean return would corrupt the real
                // (Map/other) return value and crash consumers that cast it.
                return@forEach
            }

            // Genuine predicate: suspend fn / lambda whose result is the boxed boolean -> force TRUE.
            // Returning a completed Boolean.TRUE synchronously is a valid suspend completion.
            method.addInstructions(
                0,
                """
                    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                    return-object v0
                """.trimIndent(),
            )
        }

        // SECONDARY (supplement): Subscribed.hasBenefits() -> always true.
        hasBenefitsFingerprint.matchAllOrNull()?.forEach { match ->
            match.method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """.trimIndent(),
            )
        }
    }
}
