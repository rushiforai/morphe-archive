package arpit.morphe.patches.pushups100.premium

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import arpit.morphe.patches.pushups100.shared.Constants.COMPATIBILITY_PUSHUPS100

/**
 * 0-100 Pushups premium unlock (Zen Unlimited Pass).
 *
 * Unlike the Zen Labs running apps, this one has no `SubscriptionUnlockState`; it holds
 * a single boolean in `SubscriptionState` and exposes it through
 * `AppSubscriptionStateProvider`. Forcing that flag to true is exactly what a real
 * purchase produces:
 *
 * - `SettingsFactory` adds the "Unsubscribe" row instead of the buy row,
 * - `HomeActivity` skips the banner ad, hides the promo item and opens the Zen music
 *   player instead of the sales screen,
 * - `FitnessPlansActivity.isProVersion()` reports pro, so the plans pages open as a
 *   subscriber,
 * - `ChallengeAchievementClient.hasSubscription()` reports active.
 *
 * Google Play Billing is untouched: nothing is purchased, restored or written to
 * preferences, so an account that never paid is never reported to the store.
 *
 * Verified against 5.3.3 (versionCode 95): both methods are `.registers 2` boolean
 * accessors and the app ships unobfuscated.
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Reports an active Zen Unlimited Pass: unlocks the Fitness Plans, " +
        "the Zen music player and the Settings Unsubscribe entry, and removes the home " +
        "banner ad and promo item. Billing is untouched.",
    default = true
) {
    compatibleWith(COMPATIBILITY_PUSHUPS100)

    execute {
        subscriptionStateProviderFingerprint.method.returnEarly(true)
        subscriptionStateIsActiveFingerprint.method.returnEarly(true)
    }
}
