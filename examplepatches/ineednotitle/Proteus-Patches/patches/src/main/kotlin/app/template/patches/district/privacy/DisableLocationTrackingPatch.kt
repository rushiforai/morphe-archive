package app.template.patches.district.privacy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.template.patches.shared.Constants.DISTRICT_COMPATIBILITY
import app.morphe.patcher.patch.bytecodePatch

/**
 * Block location tracking — District by Zomato.
 *
 * Verified against District 2.76.0 (versionCode 1000027600, Oct 2026).
 *
 * District acquires GPS exclusively through its in-house wrapper
 * Lcom/edition/location/e; ("LocationKit"): it is the only class in all nine
 * dexes that builds a GMS LocationRequest and hands it to
 * Lcom/google/android/gms/internal/location/j; (->b = requestLocationUpdates).
 * Everything above it — LocationFetchManager, the locationkit cache, the
 * "Been here" history — consumes what this wrapper produces.
 *
 * THE TWO SPLICES:
 *   1. i(fragmentHost) — the composition-subscribed pattern: requests the
 *      location subscription (LocationRequest + callback) when a host
 *      fragment/screen enters. Killed → no continuous/passive updates,
 *      no background tracking of where you are ("Been here" stops learning).
 *   2. b(Context, Continuation) — the suspending one-shot fetch
 *      (fetchAndUpdateGpsLocation). Returns null immediately; every call
 *      site already guards null as "Location not available" — verified
 *      fail-open path in LocationFetchManager (toast + graceful fallback).
 *
 * WHAT KEEPS WORKING (deliberately untouched):
 *   - Manual city / area search & selection (com/application/zomato/…/locationSnippet)
 *   - Cached/last-seen city you already picked; maps SDK, static tiles
 *   - Location PERMISSION plumbing (f(Activity), g(…), h(…)) and the
 *     "enable location" onboarding screens — so the app never hard-crashes;
 *     it simply never receives a fresh fix.
 *
 * The app will behave as if GPS is always unavailable: choose your city
 * manually. That's exactly the intended trade of this patch.
 */
@Suppress("unused")
val districtDisableLocationTrackingPatch = bytecodePatch(
    name = "Block location tracking",
    description = "Stops District by Zomato from acquiring GPS fixes " +
        "(continuous updates + one-shot fetch). Manual city selection still works.",
    default = true,
) {
    compatibleWith(DISTRICT_COMPATIBILITY)

    execute {
        // 1. Continuous fused-location subscriptions — silence the request loop.
        DistrictLocationUpdatesFingerprint.method.addInstructions(0, "return-void")

        // 2. One-shot suspending GPS fetch — resolve to null, the guarded
        //    "location unavailable" path everywhere it is consumed.
        DistrictLocationFetchFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """
        )

        println("District location block: fused updates + one-shot fetch neutralized; manual city selection preserved.")
    }
}
