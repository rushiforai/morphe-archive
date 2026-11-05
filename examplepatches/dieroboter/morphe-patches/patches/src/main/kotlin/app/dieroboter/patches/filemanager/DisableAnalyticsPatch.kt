package app.dieroboter.patches.filemanager

import app.morphe.patcher.patch.bytecodePatch
import app.dieroboter.patches.shared.Constants.COMPATIBILITY_FILE_MANAGER

private const val APP_ANALYTICS = "Lax/b8/a;"
private const val FIREBASE_ANALYTICS = "Lcom/google/firebase/analytics/FirebaseAnalytics;"
private const val APP_REPORTER = "Lcom/alphainventor/filemanager/ApplicationReporter;"

private const val STRING = "Ljava/lang/String;"
private const val BUNDLE = "Landroid/os/Bundle;"

/**
 * Disable analytics and telemetry (File Manager 3.8.5).
 *
 * The developer already set firebase_analytics_collection_enabled=false in
 * the manifest, but the reporting plumbing remains and is what this patch
 * removes:
 *
 * - The app's own analytics forwarder (ax/b8/a): its event method c() is
 *   the single funnel through which app code logs Firebase events. Its
 *   initializer b(Context) is deliberately kept - it creates and stores
 *   the FirebaseAnalytics instance - only the sink is no-oped.
 * - Firebase Analytics itself: the event method and the user-property
 *   method (R8-renamed a and c on the kept facade class) are no-oped, so
 *   nothing reaches the measurement SDK even from a caller that bypasses
 *   the app's forwarder.
 * - The developer crash reporter (ApplicationReporter, the
 *   socialnmobile-commons ReporterService implementation): its
 *   initializeService() is no-oped so the reporting service never starts.
 *   Its init(Context) is kept - it also wires the app context and the
 *   shared logger other code uses; only the reporting start is a sink.
 *
 * Deliberately not touched: Firebase Remote Config (the forwarder's
 * sibling wrapper). It is the
 * app's configuration channel - feature values and defaults are read from
 * it all over the app - not an event pipeline, and its fetch is woven
 * into an initializer whose stored defaults other methods rely on.
 *
 * 4 methods in total, all void, all prepended with return-void by
 * [noOpMethod]; every target is asserted to match exactly one method.
 */
@Suppress("unused")
val disableAnalyticsPatch = bytecodePatch(
    name = "Disable analytics and telemetry",
    description = "Stops the app's event reporting: its own analytics forwarder and Firebase " +
        "Analytics' event and user-property methods are no-oped, and the developer crash " +
        "reporter is never started. Firebase Analytics collection was already disabled by " +
        "the developer; this removes the remaining plumbing. Remote Config is left running - " +
        "it is the app's configuration channel, not an event pipeline.",
    default = true
) {
    compatibleWith(COMPATIBILITY_FILE_MANAGER)

    execute {
        noOpMethod(APP_ANALYTICS, "c", STRING + BUNDLE)
        noOpMethod(FIREBASE_ANALYTICS, "a", STRING + BUNDLE)
        noOpMethod(FIREBASE_ANALYTICS, "c", STRING + STRING)
        noOpMethod(APP_REPORTER, "initializeService")
    }
}
