package app.zdrgon.patches.rokuremote.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.rokuremote.shared.Constants.COMPATIBILITY_ROKU_REMOTE

/**
 * Roku Remote — Enable Pro.
 *
 * The app sells Pro two ways: a "remote_pro" subscription (weekly /
 * monthly / yearly) and a one-time "remote_pro_lifetime" product. Both
 * feed a single local entitlement: the billing sync writes the
 * SharedPreferences boolean "X_PREMIUM_ENABLED", and every premium
 * check in the app — the two ad slots, the paywall, the feature gates —
 * reads it through one static method:
 *
 *   helpers/q.d()Z -> prefs.getBoolean("X_PREMIUM_ENABLED", false)
 *
 * This patch pins that reader to true, so the app runs with its Pro
 * state on: ads never load and Pro features unlock, in the same state
 * the lifetime purchase produces. The pin is at the reader, so it does
 * not matter what the billing sync stores at startup — the stored
 * value is simply never consulted.
 *
 * The patch creates no purchase and touches nothing in the billing
 * library; it only changes the app's own answer to its own question.
 * The paywall screen still opens if tapped, but the app already
 * believes Pro is active.
 */
@Suppress("unused")
val enableProPatch = bytecodePatch(
    name = "Enable Pro",
    description = "Turns on the app's Pro state (no ads, Pro features) as if the lifetime plan were active.",
    default = true
) {
    compatibleWith(COMPATIBILITY_ROKU_REMOTE)

    execute {
        PremiumEnabledFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent()
        )
    }
}
