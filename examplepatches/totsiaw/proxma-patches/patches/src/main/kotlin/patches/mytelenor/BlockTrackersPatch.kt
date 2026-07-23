package patches.mytelenor

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/*
 * My Telenor bundles several pure-tracking SDKs that are each started from DaggerApplication.onCreate
 * through a single obfuscated initializer. This patch neutralizes three of them at their init
 * chokepoint (return-early / init no-op) so the SDK never starts — cleaner than chasing individual
 * event sites:
 *
 *   T1 Insider (useinsider) — user id/MSISDN, events, geofence/location, push & in-app messaging.
 *      Launcher Lg50/b;->a(Application,String,callback) never spawns its init coroutine.
 *   T2 TikTok Business SDK — install/app-event attribution, advertiser id.
 *      Worker Lk50/a;->d(Context) never calls TikTokBusinessSdk.initializeSdk(...).
 *   T3 Mixpanel Session Replay (recon: "Contentsquare") — full session replay: taps, screen views,
 *      UI-interaction heatmaps, user journey. Launcher Lh50/a;->g(Application) builds neither the
 *      Mixpanel instance nor the replay session.
 *
 * Deliberately LEFT ALONE (load-bearing or low-value — see notes/trackers-analytics.md):
 *   - AWS Amplify (Ld50/a;->a(Context)) — backend AppSync/API; blocking breaks app data.
 *   - FirebaseApp.initializeApp / RemoteConfig / FCM — RemoteConfig feeds the AdmobConfig the
 *     removeAdsPatch keys off, plus push; leaving it intact keeps both features working.
 *   - Google MobileAds.initialize — ads are handled separately at the Lyq/b;->c() config gate.
 *   - Firebase Crashlytics / Performance — telemetry only; blocking loses crash visibility for no gain.
 *
 * Separate from removeAdsPatch by design (independent call paths, no conflict) so users opt into each.
 */
@Suppress("unused")
val blockTrackersPatch = bytecodePatch(
    name = "Block trackers",
    description = "Stops the Insider, TikTok Business SDK and Mixpanel Session Replay trackers from " +
        "initializing (event/attribution/session-replay tracking never starts). Leaves AWS Amplify, " +
        "Firebase core/RemoteConfig/FCM and Google Ads init untouched so app data, push and the " +
        "remote ad-config the ads patch relies on keep working.",
) {
    compatibleWith(COMPATIBILITY_MYTELENOR)

    execute {
        // T1 Insider: no-op the launcher so its init coroutine is never spawned.
        insiderInitFingerprint.method.addInstructions(0, "return-void")

        // T2 TikTok: no-op the worker so TikTokBusinessSdk.initializeSdk(...) is never reached.
        tiktokInitFingerprint.method.addInstructions(0, "return-void")

        // T3 Mixpanel Session Replay: no-op the launcher so neither the instance nor replay is built.
        mixpanelInitFingerprint.method.addInstructions(0, "return-void")
    }
}
