package arpit.morphe.patches.c25k.premium

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import arpit.morphe.patches.c25k.shared.Constants.COMPATIBILITY_C25K

/**
 * C25K premium unlock (Zen Unlimited Pass).
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
 * No billing or server call is involved, so this works with a normal sideload — no root
 * mount, no signature spoof. Verified against 144.27 (versionCode 321): all eight getters
 * are `.registers 2` methods returning a single field, and the app code is unobfuscated.
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks the Zen Unlimited Pass features: removes ads and enables " +
        "workout stats, workouts, music, height/weight and achievement stats.",
    default = true
) {
    compatibleWith(COMPATIBILITY_C25K)

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
