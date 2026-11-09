package arpit.morphe.patches.crossrope.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import arpit.morphe.patches.crossrope.shared.Constants.COMPATIBILITY_CROSSROPE

/**
 * Unlocks Crossrope Premium.
 *
 * Crossrope is a native Kotlin app whose account state lives in `SharedPreferences`.
 * Two client-side gates decide what a signed-in account may open:
 *
 * 1. `isPremium()` on the session class, which ORs the `is_premium` and
 *    `just_bought_premium` keys. Roughly two dozen screens call it.
 * 2. The membership tier, read from the `membership_tier` preference and mapped to
 *    `LU5/A` (`free` / `lite` / `Standard`). The feature-flag store `Le6/V0;`
 *    branches on that enum in `b(Le6/T0;)Z`, which is what actually gates workouts,
 *    classes, programs, benchmarks, counting and the profile tab.
 *
 * The boolean alone is not enough: with only `isPremium()` forced true, opening a
 * premium program day still lands on `PremiumActivity`, which then reports
 * "You're already premium" and closes — a dead end. Forcing the tier to `Standard`
 * is what opens those flows, so both methods are patched.
 *
 * Google Play Billing stays untouched: purchases, restore and the billing client are
 * not modified. The patch only changes what the *client* believes about the account,
 * so content the backend refuses to serve to free accounts — for example media URLs
 * issued per entitlement — remains gated and can still fail to load.
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Reports the account as premium by forcing the stored " +
        "`is_premium` check to true and the `membership_tier` getter to the " +
        "`Standard` tier, which unlocks the paid workout, class, program, " +
        "benchmark and profile surfaces. Billing is untouched; media the server " +
        "refuses to serve to free accounts may still fail to load.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CROSSROPE)

    execute {
        val flagged = PremiumFlagFingerprint.method

        // The injected body reuses `v0` as its return register, so the method must
        // have at least one local. R8 only emits locals in a method body, and this
        // accessor always reads two preference keys, so a missing local means the
        // fingerprint matched the wrong method — fail loudly instead of emitting
        // invalid smali.
        val flagRegisters = flagged.implementation?.registerCount ?: 0
        check(flagRegisters >= 1) {
            "isPremium() has $flagRegisters registers; the patch needs at least one " +
                "local to return true."
        }

        flagged.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )

        val tier = MembershipTierFingerprint.method

        // `LU5/A;->C` is the `Standard` tier, the enum ordinal that makes
        // `Le6/V0;->b(Le6/T0;)Z` return true for every feature flag.
        val tierRegisters = tier.implementation?.registerCount ?: 0
        check(tierRegisters >= 1) {
            "membership tier getter has $tierRegisters registers; the patch needs at " +
                "least one local to return the Standard tier."
        }

        tier.addInstructions(
            0,
            """
                sget-object v0, LU5/A;->C:LU5/A;
                return-object v0
            """,
        )
    }
}
