package arpit.morphe.patches.c262.premium

import app.morphe.patcher.Fingerprint

/**
 * Every premium gate in Marathon 26.2 reads one of the boolean getters on
 * `com.c25k.reboot.subscription.unlocking.SubscriptionUnlockState`
 * (the `com.c25k.reboot` module is shared across the Zen Labs running apps):
 *
 * - `Utils.hasAds()`, `hasWorkoutStats()` and `hasWorkoutsUnlocked()` forward to it,
 * - `AppUnlockStateProvider.hasSubscription()` is computed from `getMusic()`,
 *   `getAchievementsStats()`, `getMenuBuyProductItem()` and
 *   `getSettingsMenuUnsubscribeOption()`,
 * - the `fitnessplans` pages call `Utils.hasSubscription()` to decide between member
 *   content and the sales page,
 * - `MainScreenPresenter` reads `getAds()` / `getMusic()` / `getWorkoutStats()`,
 * - `StorageUnlockStateProvider.update()` persists all of them.
 *
 * Matching by class suffix + getter name + `()Z` keeps this immune to field renames;
 * the app ships unobfuscated (verified on 2.58, versionCode 91).
 */
private fun unlockStateGetter(name: String) = Fingerprint(
    definingClass = "/SubscriptionUnlockState;",
    name = name,
    returnType = "Z",
    parameters = emptyList(),
)

val adsUnlockStateFingerprint = unlockStateGetter("getAds")

val workoutStatsUnlockStateFingerprint = unlockStateGetter("getWorkoutStats")

val heightAndWeightUnlockStateFingerprint = unlockStateGetter("getHeightAndWeight")

val workoutsUnlockedUnlockStateFingerprint = unlockStateGetter("getWorkoutsUnlocked")

val musicUnlockStateFingerprint = unlockStateGetter("getMusic")

val achievementsStatsUnlockStateFingerprint = unlockStateGetter("getAchievementsStats")

val menuBuyProductItemUnlockStateFingerprint = unlockStateGetter("getMenuBuyProductItem")

val settingsMenuUnsubscribeOptionUnlockStateFingerprint =
    unlockStateGetter("getSettingsMenuUnsubscribeOption")
