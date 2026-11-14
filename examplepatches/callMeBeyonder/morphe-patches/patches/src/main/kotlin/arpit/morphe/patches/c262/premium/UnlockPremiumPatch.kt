package arpit.morphe.patches.c262.premium

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import arpit.morphe.patches.c262.shared.Constants.COMPATIBILITY_C262

/**
 * Marathon 26.2 premium unlock (Zen Unlimited Pass).
 *
 * The app keeps its entitlement in a local `SubscriptionUnlockState` data class and every
 * feature gate reads one of its boolean getters, so the patch simply makes those getters
 * report the state the app itself writes after a real purchase
 * (`AppUnlockingBehavior.unlockSubscriptionFeatures()`):
 *
 * ```
 * SubscriptionUnlockState(ads=false, workoutStats=true, heightAndWeight=true,
 *                         workoutsUnlocked=true, music=true, achievementsStats=true,
 *                         menuBuyProductItem=false, settingsMenuUnsubscribeOption=true)
 * ```
 *
 * Only four of those flags differ from this build's free state
 * (`CurrentAppUnlockState` already reports `ads=false`, `workoutStats=true`,
 * `heightAndWeight=true` and `achievementsStats=true`), so the observable unlock is the
 * workout weeks, the music mixes, the member Fitness Plans page and the Settings
 * "Unsubscribe" entry. The other getters are patched because that is the state a real
 * purchase produces.
 *
 * No billing or server call is involved, so this works with a normal sideload — no root
 * mount, no signature spoof. Verified against 2.58 (versionCode 91): all eight getters
 * are `.registers 2` methods returning a single field, and the app code is unobfuscated.
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks the Zen Unlimited Pass: every plan week, the Zen Powered " +
        "Music Mixes, the member Fitness Plans page and the Settings Unsubscribe " +
        "entry, and hides the drawer's buy-product item. Billing is untouched.",
    default = true
) {
    compatibleWith(COMPATIBILITY_C262)

    execute {
        listOf(
            adsUnlockStateFingerprint to false,
            workoutStatsUnlockStateFingerprint to true,
            heightAndWeightUnlockStateFingerprint to true,
            workoutsUnlockedUnlockStateFingerprint to true,
            musicUnlockStateFingerprint to true,
            achievementsStatsUnlockStateFingerprint to true,
            menuBuyProductItemUnlockStateFingerprint to false,
            settingsMenuUnsubscribeOptionUnlockStateFingerprint to true,
        ).forEach { (fingerprint, value) ->
            fingerprint.method.returnEarly(value)
        }
    }
}
