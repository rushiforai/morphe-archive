package app.zdrgon.patches.aodnotify.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.aodnotify.shared.Constants.COMPATIBILITY_AODNOTIFY

/**
 * aodNotify — Enable Pro.
 *
 * The app sells Pro three ways: a "sub_weekly" subscription
 * ($2.99/week), a "sub_yearly" subscription ($4.99/year) and a
 * one-time "aod_onetime" product ($6.99) — plus coffee donations
 * that grant Pro too. Locally there is no tier: every product feeds
 * one entitlement, the default SharedPreferences boolean "100",
 * and every premium check in the app (the settings gates, the
 * custom app/contact colors, the premium light effects, the house
 * promo suppression) reads that stored boolean directly.
 *
 * The stored value is produced at exactly one conditional point:
 * the purchase sync ends in SettingsHome.C(Z), which writes its
 * argument to "100", and its only caller passes "owns any
 * qualifying purchase" as computed from Play's purchase list. When
 * a subscription lapses, that sync is also what writes false again.
 *
 * This patch forces the sync's argument to true (v4 is the boolean
 * parameter register — the method's own first test is `if-eqz v4`),
 * so every sync persists "100" = true through the app's own write
 * path, exactly the state a genuine one-time purchase produces,
 * with the one-time tier's permanence: the only writer that can
 * store false can now only store true, so no later sync, lapse or
 * offline start can revoke it.
 *
 * The patch creates no purchase and touches nothing in the billing
 * library; it only changes the answer the app's sync hands to the
 * app's own storage.
 */
@Suppress("unused")
val enableProPatch = bytecodePatch(
    name = "Enable Pro",
    description = "Turns on the app's Pro state (no promo ads, premium light effects, custom app and contact colors, every setting) with the permanence of the one-time purchase.",
    default = true
) {
    compatibleWith(COMPATIBILITY_AODNOTIFY)

    execute {
        ProStateSyncFingerprint.method.addInstructions(
            0,
            """
                const/4 v4, 0x1
            """.trimIndent()
        )
    }
}
