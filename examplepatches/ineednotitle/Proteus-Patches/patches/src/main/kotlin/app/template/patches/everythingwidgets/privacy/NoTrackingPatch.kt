package app.template.patches.everythingwidgets.privacy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.EVERYTHING_WIDGETS_COMPATIBILITY

/**
 * Remove tracking & analytics — Everything Widgets.
 *
 * Verified against 2.1.014 (versionCode 63).
 *
 * WHAT THIS PATCH SILENCES:
 *   1. Facebook SDK — FacebookInitProvider.onCreate returns early: the
 *      entire FB implicit-collection pipeline (attribution/advertising-id
 *      read, install/activate pings) never boots.
 *   2. OneSignal — initWithContext() neutralized: the push vendor's device
 *      tags/analytics sync never initializes. TRADE-OFF (accepted): OneSignal
 *      push notifications for the app stop working.
 *   3. Firebase — collection opted out AT THE SDK SWITCHES, injected at the
 *      head of ApplicationClass.onCreate:
 *         FirebaseCrashlytics.setCrashlyticsCollectionEnabled(false)
 *         FirebasePerformance.setPerformanceCollectionEnabled(false)
 *         FirebaseAnalytics.setAnalyticsCollectionEnabled(false)
 *      Init stays alive (weather/speed-test widgets call
 *      FirebasePerfUrlConnection.instrument — killing init would break them);
 *      with collection switches off those instrument calls become local no-ops.
 *
 * FAIL-OPEN NOTES: every splice is a prologue return or a documented SDK
 * opt-out; nothing loops on the dead pipes (donation/local features immune).
 */
@Suppress("unused")
val everythingWidgetsNoTrackingPatch = bytecodePatch(
    name = "Remove tracking & analytics",
    description = "Kills Facebook auto-init and OneSignal, and opts Firebase " +
        "Crashlytics/Performance/Analytics out of collection at boot, in " +
        "Everything Widgets. Widget functionality is unaffected; OneSignal " +
        "push notifications stop.",
    default = true,
) {
    compatibleWith(EVERYTHING_WIDGETS_COMPATIBILITY)

    execute {
        // 1. Facebook can never bootstrap itself.
        EwFacebookInitProviderFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // 2. OneSignal never initializes (push notifications stop — by design).
        EwOneSignalInitFingerprint.method.addInstructions(0, "return-void")

        // 3. Firebase collection switches off, at the earliest safe app seam.
        //    v0/v1 are within `.locals 5` in 2.1.014's ApplicationClass.onCreate.
        EwApplicationOnCreateFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0

                invoke-static {}, Lcom/google/firebase/crashlytics/FirebaseCrashlytics;->getInstance()Lcom/google/firebase/crashlytics/FirebaseCrashlytics;
                move-result-object v1
                invoke-virtual {v1, v0}, Lcom/google/firebase/crashlytics/FirebaseCrashlytics;->setCrashlyticsCollectionEnabled(Z)V

                invoke-static {}, Lcom/google/firebase/perf/FirebasePerformance;->getInstance()Lcom/google/firebase/perf/FirebasePerformance;
                move-result-object v1
                invoke-virtual {v1, v0}, Lcom/google/firebase/perf/FirebasePerformance;->setPerformanceCollectionEnabled(Z)V

                invoke-static {p0}, Lcom/google/firebase/analytics/FirebaseAnalytics;->getInstance(Landroid/content/Context;)Lcom/google/firebase/analytics/FirebaseAnalytics;
                move-result-object v1
                invoke-virtual {v1, v0}, Lcom/google/firebase/analytics/FirebaseAnalytics;->setAnalyticsCollectionEnabled(Z)V
            """
        )

        println("Everything Widgets tracking block: FB init killed, OneSignal killed, Firebase collection switches off.")
    }
}
