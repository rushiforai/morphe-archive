package arpit.morphe.patches.c10k.premium

import app.morphe.patcher.Fingerprint

/**
 * Every premium gate in Couch to 10K reads one of the boolean getters on
 * `com.c25k.reboot.subscription.unlocking.SubscriptionUnlockState`
 * (the `com.c25k.reboot` module is shared across the Zen Labs running apps):
 *
 * - `Utils.hasAds()`, `hasWorkoutStats()` and `hasWorkoutsUnlocked()` forward to it,
 * - `AppUnlockStateProvider.hasSubscription()` is computed from `getMusic()`,
 *   `getAchievementsStats()`, `getMenuBuyProductItem()` and
 *   `getSettingsMenuUnsubscribeOption()`,
 * - `MainScreenPresenter` reads `getAds()` / `getMusic()` / `getWorkoutStats()`,
 * - `SettingsMenuScreenPresenter` reads `getHeightAndWeight()`,
 * - `RunAchievementClient` reads `getAchievementsStats()`,
 * - `StorageUnlockStateProvider.update()` persists all of them.
 *
 * Matching by class suffix + getter name + `()Z` keeps this immune to field renames;
 * the app ships unobfuscated (verified on 117.19, versionCode 316).
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
