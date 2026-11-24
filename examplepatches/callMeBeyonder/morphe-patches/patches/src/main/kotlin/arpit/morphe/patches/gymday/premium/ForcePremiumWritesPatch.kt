package arpit.morphe.patches.gymday.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import arpit.morphe.patches.gymday.shared.Constants.COMPATIBILITY_GYMDAY

/**
 * Forces every write of the `PREMIUM_ENABLED` preference to `true`.
 *
 * Gym Day has exactly one writer for the premium flag: a `(Z)V` method that calls
 * `SharedPreferences.Editor.putBoolean("PREMIUM_ENABLED", z)`. RevenueCat's
 * `UpdatedCustomerInfoListener` (`MainApplication.onReceived`) and the purchase
 * coroutine (`PremiumViewModel$purchase$2`) pass the computed entitlement state
 * into it, so a server callback can overwrite the pref with `false` at any launch.
 *
 * Overwriting the boolean parameter with `0x1` at method entry makes both paths
 * store `true`; the server verdict can no longer clear the flag. This is defence
 * in depth next to [unlockPremiumPatch]: that patch bypasses the read and already
 * makes the stored value irrelevant, while this one also keeps the persisted state
 * consistent for code that reads the preference directly.
 *
 * Verified against 1.62.0 (versionCode 124): the writer is `.method public Q(Z)V`,
 * `.registers 3` (so `p1` is the single `Z` parameter and no register-count change
 * is needed), and `putBoolean` is its only editor write of a boolean
 * (`"PREMIUM_ENABLED"` occurs twice in the APK, here and in the getter).
 */
@Suppress("unused")
val forcePremiumWritesPatch = bytecodePatch(
    name = "Force Premium Writes",
    description = "Stores true on every write of the PREMIUM_ENABLED preference, so " +
        "RevenueCat entitlement callbacks and the purchase coroutine can never " +
        "clear the local premium flag.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_GYMDAY)

    execute {
        val setter = PremiumPrefWriterFingerprint.method

        // `p1` is the method's only parameter (`Z`); `.registers 3` leaves it at
        // register 2, so writing it needs no FreeRegisterProvider or register bump.
        setter.addInstructions(0, "const/4 p1, 0x1")
    }
}
