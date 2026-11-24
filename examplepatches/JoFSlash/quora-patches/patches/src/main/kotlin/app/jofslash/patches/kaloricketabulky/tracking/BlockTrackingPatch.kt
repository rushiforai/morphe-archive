package app.jofslash.patches.kaloricketabulky.tracking

import app.jofslash.patches.kaloricketabulky.shared.Constants.APP
import app.jofslash.patches.kaloricketabulky.shared.Constants.COMPATIBILITY_KALORICKE_TABULKY
import app.jofslash.patches.kaloricketabulky.shared.editManifest
import app.jofslash.patches.kaloricketabulky.shared.elements
import app.jofslash.patches.kaloricketabulky.shared.methodOf
import app.jofslash.patches.kaloricketabulky.shared.methodsOf
import app.jofslash.patches.kaloricketabulky.shared.methodsWhere
import app.jofslash.patches.kaloricketabulky.shared.returnEarly
import app.jofslash.patches.kaloricketabulky.shared.setApplicationMetaData
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch

private const val ANALYTICS_MANAGER = "$APP/tool/analytics/AnalyticsManager;"
private const val APP_CLASS = "$APP/App;"
private const val REVENUE_CAT_REPOSITORY = "$APP/repository/RevenueCatRepository;"
private const val KOCHAVA_TRACKER = "Lcom/kochava/tracker/Tracker;"

/** Google's data transport (Firelog) backend that uploads to firebaselogging-pa.googleapis.com. */
private const val CCT_BACKEND = "backend:com.google.android.datatransport.cct.CctBackendFactory"

private val blockTrackingResourcePatch = resourcePatch {
    execute {
        editManifest { document ->
            // Firebase Analytics, switched off for good, so nothing in the app can turn it back on.
            document.setApplicationMetaData("firebase_analytics_collection_deactivated", "true")
            document.setApplicationMetaData("firebase_analytics_collection_enabled", "false")
            document.setApplicationMetaData("google_analytics_adid_collection_enabled", "false")
            // Crashlytics crash reports and Firebase Sessions, by their own switches. The app
            // doesn't turn them on in code.
            document.setApplicationMetaData("firebase_crashlytics_collection_enabled", "false")
            document.setApplicationMetaData("firebase_sessions_enabled", "false")
            // The Facebook SDK stays for signing in with Facebook, but logs no app events by itself
            // and doesn't read the advertising ID.
            document.setApplicationMetaData("com.facebook.sdk.AutoLogAppEventsEnabled", "false")
            document.setApplicationMetaData("com.facebook.sdk.AdvertiserIDCollectionEnabled", "false")

            // Google's data transport sends Crashlytics, Sessions and push delivery logs through
            // its "cct" backend. Without the backend, the transport drops whatever is queued for it.
            val backends = document.elements("meta-data").filter { it.getAttribute("android:name") == CCT_BACKEND }
            if (backends.isEmpty()) throw PatchException("Couldn't find $CCT_BACKEND in the manifest")
            backends.forEach { it.parentNode.removeChild(it) }
        }
    }
}

@Suppress("unused")
val blockTrackingPatch = bytecodePatch(
    name = "Block tracking",
    description = "Stops the analytics and marketing trackers: Firebase and Google Analytics, Firebase " +
            "Crashlytics and Sessions, Facebook app events, and Kochava install and purchase tracking. " +
            "Signing in, syncing your diary and Premium purchases keep working.",
    default = true
) {
    category("Privacy")
    compatibleWith(COMPATIBILITY_KALORICKE_TABULKY)

    dependsOn(blockTrackingResourcePatch)

    execute {
        // Every event the app reports goes through AnalyticsManager to Firebase, Facebook or
        // Kochava, and it also hands your user ID and profile (birth year, sex, height, weight, BMI, goal) to Firebase and
        // Crashlytics. Each of these sinks now does nothing; the screens that call them don't
        // notice.
        listOf(
            "logFirebaseEvent",
            "logFacebookEvent",
            "logKochavaEvent",
            "logKochavaEventWithParams",
            "logKochavaSubscriptionEvent",
            "setUserInfoFirebase",
            "setUserInfoCrashlytics",
        ).forEach { name -> methodsOf(ANALYTICS_MANAGER, name).forEach { it.returnEarly() } }

        // Kochava (install attribution) is started in App.onCreate with the app's GUID, through
        // Tracker.startWithAppGuid, which R8 renamed and narrowed to (App, String). Not started, it
        // sends nothing; the app's other calls to it only queue work for a tracker that never runs.
        methodsWhere(KOCHAVA_TRACKER, "startWithAppGuid(App, String)") {
            it.returnType == "V" && it.parameterTypes.map { type -> type.toString() } == listOf(APP_CLASS, "Ljava/lang/String;")
        }.forEach { it.returnEarly() }

        // Passes the Kochava device ID to RevenueCat as an attribution attribute.
        methodOf(REVENUE_CAT_REPOSITORY, "setupKochavaAttributes").returnEarly()
    }
}
