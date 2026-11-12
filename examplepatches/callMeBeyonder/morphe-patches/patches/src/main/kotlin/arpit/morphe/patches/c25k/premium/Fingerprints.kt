package arpit.morphe.patches.c25k.premium

import app.morphe.patcher.Fingerprint

/**
 * Every premium gate in C25K reads one of the boolean getters on
 * `com.c25k.reboot.subscription.unlocking.SubscriptionUnlockState`:
 *
 * - `hasAds()`, `hasWorkoutStats()`, `hasWorkoutsUnlocked()` in `Utils` forward to it,
 * - `RunAchievementClient` reads `getAchievementsStats()`,
 * - `MainScreenPresenter` reads `getAds()` / `getMusic()` / `getWorkoutStats()`,
 * - `SettingsMenuScreenPresenter` reads `getHeightAndWeight()` and `hasSubscription()`
 *   (which itself is computed from four of these flags),
 * - `StorageUnlockStateProvider.update()` persists all of them.
 *
 * Matching by class suffix + getter name + `()Z` keeps this immune to field renames;
 * the app ships unobfuscated (verified on 144.27).
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
