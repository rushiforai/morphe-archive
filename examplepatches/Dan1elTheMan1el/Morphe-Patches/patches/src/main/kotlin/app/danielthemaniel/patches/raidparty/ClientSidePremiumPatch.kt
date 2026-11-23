package app.danielthemaniel.patches.raidparty

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private const val USER = "Lnet/tinywhale/pokemon/models/User;"

/**
 * Forces Raid Party to treat the current account as premium on the client only.
 *
 * Premium state lives on the User.shared singleton as the int field `premium`
 * (isPremium() == premium == 1). That value originates from the server:
 * purchasing posts the Google receipt to api2.goraidparty.com/user/receipt,
 * which validates it and returns an updated User JSON. Every API call also
 * carries the account token, so the backend always knows the real status.
 *
 * This patch short-circuits the two client-side readers so the app's own UI
 * and local gates behave as premium, without touching billing or the server:
 *
 *   - isPremium() -> true  : removes banner ads (LobbyActivity/PartyActivity
 *     only call loadAd() when !isPremium()), hides the premium upsell button
 *     and ViewPremiumLock overlays, and drops the non-premium join wait
 *     (Room.getShouldWait).
 *   - getPremium() -> 1    : shows the profile as premium and opens the
 *     premium-hosting / boss-subscription screens.
 *
 * WHAT THIS DOES NOT DO (server-authoritative, cannot be forged client-side):
 *   - Boss-subscription push notifications (EditBossesFragment.submit POSTs to
 *     the server, which decides whether to send FCM by the account's real flag).
 *   - Server-honored premium-only room hosting / joining.
 *   - Your premium badge as seen by OTHER users.
 * Those require a genuine subscription. This is strictly a local unlock.
 */
@Suppress("unused")
val clientSidePremiumPatch = bytecodePatch(
    name = "Client-Side Premium",
    description = "Removes ads, the join wait, and premium UI locks by forcing the local premium flag. " +
        "Server features (boss-subscription notifications, premium visible to others) are unaffected.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_RAIDPARTY)

    execute {
        val userClass = mutableClassDefBy(USER)

        // isPremium()Z -> return true
        userClass.methods
            .find { it.name == "isPremium" && it.parameterTypes.isEmpty() && it.returnType == "Z" }
            ?.addInstructions(
                0,
                """
                const/4 v0, 0x1
                return v0
                """.trimIndent(),
            )

        // getPremium()I -> return 1
        userClass.methods
            .find { it.name == "getPremium" && it.parameterTypes.isEmpty() && it.returnType == "I" }
            ?.addInstructions(
                0,
                """
                const/4 v0, 0x1
                return v0
                """.trimIndent(),
            )
    }
}
