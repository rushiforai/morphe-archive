package app.template.patches.district.privacy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.template.patches.shared.Constants.DISTRICT_COMPATIBILITY
import app.morphe.patcher.patch.bytecodePatch

/**
 * Block analytics & data collection — District by Zomato.
 *
 * Verified against District 2.76.0 (versionCode 1000027600, Oct 2026).
 *
 * WHAT THIS PATCH SILENCES (all verified in 2.76.0 smali, see Fingerprints.kt):
 *   1. Firebase Analytics in-app events — EventsUtil.b (init/tracking/c.smali)
 *      is the sole fan-out used by the entire UIKit event pipeline.
 *   2. AppsFlyer in-app events — same method, second hop
 *      (AppsFlyerLib->logEvent).
 *   3. AppsFlyer session/install/UA beacons — AFb1tSDK.start()* is
 *      prologue-killed so the SDK never comes alive (DistrictApp.onCreate
 *      inits AppsFlyer directly; we sever at the SDK entry instead of
 *      touching onCreate, which must stay intact).
 *   4. CleverTap profile identity + device fingerprint —
 *      init/clevertap/b.a stamps "Application"/"AppVersion"/"DeviceModel"/
 *      "Mobile"/"OSVersion"/"Platform" before pushEvent; blocked at the one
 *      wrapper that owns those writes.
 *   5. CleverTap profile-properties pushes — init/clevertap/b.b.
 *   6. In-house crash logger — every caught Throwable in the app is enqueued
 *      through commons/crashlogger/d.a/b/c; the enqueue is killed so those
 *      reports never leave the device through the app's own pipe.
 *
 * LIMITS (honest small print):
 *   - Firebase Crashlytics' OWN automatic crash capture is wired by the SDK's
 *     ContentProvider bootstrap, not by app code we can sever without risking
 *     stability; the app's voluntary reporting channel (crashlogger) is dead.
 *   - CleverTap's passive "device reachable" bookkeeping lives inside its
 *     auto-init ContentProvider; all app-driven events/profile writes are dead.
 *
 * HOW IT FAILS: every splice is a prologue return on a fire-and-forget void
 * sink — followers of the dead pipes either no-op downstream or hit guards
 * ("Location not available" style banners). Nothing hot-path loops on them.
 */
@Suppress("unused")
val districtDisableAnalyticsPatch = bytecodePatch(
    name = "Block analytics & data collection",
    description = "Neutralizes Firebase Analytics, AppsFlyer, CleverTap event " +
        "fan-out and the in-house crash-report enqueue of District by Zomato.",
    default = true,
) {
    compatibleWith(DISTRICT_COMPATIBILITY)

    execute {
        // 1. Firebase Analytics + AppsFlyer in-app event fan-out.
        DistrictEventsTrackFingerprint.method.addInstructions(0, "return-void")

        // 2. FIREBASE_EVENT_EXCEPTION error ladder.
        DistrictEventsExceptionFingerprint.method.addInstructions(0, "return-void")

        // 3. CleverTap identity/device-fingerprint write + pushEvent flush.
        DistrictCleverTapIdentityFingerprint.method.addInstructions(0, "return-void")

        // 4. CleverTap bare event-properties push.
        DistrictCleverTapEventFingerprint.method.addInstructions(0, "return-void")

        // 5. AppsFlyer SDK session bootstrap (both overloads present in 2.76.0).
        DistrictAppsFlyerStartFingerprint.method.addInstructions(0, "return-void")
        DistrictAppsFlyerStartKeyFingerprint.method.addInstructions(0, "return-void")

        // 6. In-house crash-report enqueue (all three variants).
        DistrictCrashLogThrowableFingerprint.method.addInstructions(0, "return-void")
        DistrictCrashLogMessageFingerprint.method.addInstructions(0, "return-void")
        DistrictCrashLogTagFingerprint.method.addInstructions(0, "return-void")

        println("District analytics block: 9 choke points neutralized (Firebase, AppsFlyer, CleverTap, crashlogger).")
    }
}
