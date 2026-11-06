package app.zdrgon.patches.alarmy.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.alarmy.shared.Constants.COMPATIBILITY_ALARMY

/**
 * Alarmy — Enable Premium.
 *
 * Alarmy sells premium as Play Billing subscriptions (plus a lifetime
 * product). Purchases are validated on Delightroom's backend, which
 * returns the entitlement as a PremiumStateDto; the app maps that to a
 * local immutable state object, Lym/e; (PremiumState), caches it, and
 * from then on every feature asks the STATE — never the server —
 * whether premium is on:
 *
 *   Lym/e;->d()Z   isPremium()         (~59 call sites, 14 dexes)
 *   Lym/e;->e()Z   isRemoveAdPremium() (~25 call sites, 11 dexes)
 *
 * This patch pins both gates to true at their entry, so the app runs
 * with its premium state on — premium features unlocked and ads off,
 * the same answers a lifetime entitlement produces — regardless of
 * what the stored state says or what any later sync writes. It creates
 * no purchase, forges no receipt, and touches nothing in the billing
 * library; it only changes the app's own answer to its own question.
 *
 * Alarmy 26.42.0 carries no PairIP (the manifest names AlarmyApp
 * directly, there is no libpairipcore.so), so nothing else is needed
 * for a re-signed build to launch.
 */
@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Turns on the app's premium state (premium features, no ads) as if a lifetime premium were active.",
    default = true
) {
    compatibleWith(COMPATIBILITY_ALARMY)

    execute {
        IsPremiumFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent()
        )

        IsRemoveAdPremiumFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent()
        )
    }
}
