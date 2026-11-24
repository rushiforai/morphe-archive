package arpit.morphe.patches.gymday.premium

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import arpit.morphe.patches.gymday.shared.Constants.COMPATIBILITY_GYMDAY

/**
 * Unlocks Gym Day Premium.
 *
 * The app keeps its entitlement in a single SharedPreferences boolean
 * (`"PREMIUM_ENABLED"`). It is set from the RevenueCat `"premium"` entitlement in
 * `MainApplication.onReceived` and in the post-purchase coroutine, and every
 * premium decision in the app reads it through one `()Z` getter — 34 call sites in
 * 22 classes:
 *
 * - opening bundled premium schedules and their workouts;
 * - creating more than one custom schedule / workout;
 * - schedule and exercise statistics range navigation, tracked-exercise selection;
 * - body measurement types, exercise and workout notes, set notes;
 * - AI-generated exercise tips (gated client-side only; the OpenAI proxy uses a
 *   shipped static API key and carries no user identity);
 * - coach weeks, export data, Google sign-in, photo upload, plate calculator;
 * - the "go premium" prompts in Settings and onboarding.
 *
 * Forcing the getter to `true` is immune to RevenueCat's server round-trips: a
 * later `CustomerInfo` callback may still write `false` into the preference, but
 * nothing reads it any more. No purchase, receipt or network call is involved.
 *
 * Side effect: the paywall screen reports the premium state too, so it renders as
 * already subscribed. That is cosmetic — the gates are all upstream of it.
 *
 * Verified against 1.62.0 (versionCode 124): the getter is `.method public f()Z`,
 * `.registers 4`, zero parameters, and no caller inlines its body (`"PREMIUM_ENABLED"`
 * appears twice in the APK, both in the getter/setter class).
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks the premium surfaces gated by the app's local " +
        "PREMIUM_ENABLED flag: premium schedules and workouts, unlimited custom " +
        "schedules/workouts, statistics ranges, notes, AI exercise tips, coach " +
        "weeks, export, sign-in, photo upload and the plate calculator.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GYMDAY)

    execute {
        PremiumGateFingerprint.method.returnEarly(true)
    }
}
