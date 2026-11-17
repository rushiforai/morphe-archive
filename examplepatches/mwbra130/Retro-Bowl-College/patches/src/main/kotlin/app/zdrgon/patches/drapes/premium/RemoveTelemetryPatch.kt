package app.zdrgon.patches.drapes.premium

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.zdrgon.patches.drapes.shared.Constants.COMPATIBILITY_DRAPES
import java.util.logging.Logger
import org.w3c.dom.Element

/**
 * Drapes — Remove telemetry.
 *
 * Census (verified 2026-11-16 against the exact 3.9.3 XAPK): the
 * app code never calls an analytics API directly — there is not one
 * call site into FirebaseAnalytics or FirebaseCrashlytics from app
 * classes. The telemetry is the Firebase SDKs' automatic collection,
 * bundled and auto-initialized: Firebase Analytics / AppMeasurement
 * (auto events, sessions, device data, uploaded by the measurement
 * service, job service and receiver declared in the manifest),
 * Crashlytics (crash/ANR reports keyed to a per-install ID), and
 * advertising-ID collection (the manifest declares both AD_ID
 * permissions and AdMob is bundled). No third-party analytics SDKs
 * (no Amplitude, Sentry, Adjust, AppMetrica, ...) and no install
 * referrer library.
 *
 * The cut is manifest-level, using the switches the SDKs themselves
 * honor:
 * 1. firebase_analytics_collection_enabled=false and
 *    google_analytics_adid_collection_enabled=false meta-data:
 *    Analytics collects nothing and never reads the ad ID.
 * 2. firebase_crashlytics_collection_enabled=false meta-data:
 *    Crashlytics sends no reports.
 * 3. The three AppMeasurement components are disabled, so the
 *    upload machinery cannot run in the background at all.
 * 4. Both AD_ID permissions are removed, so no SDK in the app can
 *    obtain the advertising ID.
 *
 * Deliberately left alone: Firebase Auth, Firestore and FCM —
 * sign-in, favorites sync and push are app function, and the
 * FirebaseInitProvider that initializes them stays untouched.
 *
 * Every edit is verified as it is applied: a build whose manifest
 * differs fails the patch instead of silently shipping with part
 * of the telemetry still live.
 */
@Suppress("unused")
val removeTelemetryPatch = resourcePatch(
    name = "Remove telemetry",
    description = "Disables Firebase Analytics and Crashlytics collection, stops the " +
        "AppMeasurement upload services, and removes the advertising ID permissions. " +
        "Sign-in, favorites sync and all other features are unaffected. Drapes 3.9.3 only.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DRAPES)

    execute {
        val logger = Logger.getLogger(this::class.java.name)

        val collectionFlags = linkedMapOf(
            "firebase_analytics_collection_enabled" to "false",
            "firebase_crashlytics_collection_enabled" to "false",
            "google_analytics_adid_collection_enabled" to "false",
        )
        val measurementComponents = setOf(
            "com.google.android.gms.measurement.AppMeasurementService",
            "com.google.android.gms.measurement.AppMeasurementJobService",
            "com.google.android.gms.measurement.AppMeasurementReceiver",
        )
        val adIdPermissions = setOf(
            "com.google.android.gms.permission.AD_ID",
            "android.permission.ACCESS_ADSERVICES_AD_ID",
        )

        document("AndroidManifest.xml").use { doc ->
            // 1 + 2. Collection flags on the <application> element.
            val applications = doc.getElementsByTagName("application")
            if (applications.length != 1) {
                throw PatchException("Drapes telemetry: expected exactly one <application> element, found ${applications.length}.")
            }
            val application = applications.item(0) as Element
            val existing = mutableMapOf<String, Element>()
            val metaData = application.getElementsByTagName("meta-data")
            for (i in 0 until metaData.length) {
                val el = metaData.item(i) as Element
                existing[el.getAttribute("android:name")] = el
            }
            for ((key, value) in collectionFlags) {
                val el = existing[key] ?: doc.createElement("meta-data").also {
                    it.setAttribute("android:name", key)
                    application.appendChild(it)
                }
                el.setAttribute("android:value", value)
            }

            // 3. Disable the AppMeasurement upload components.
            var disabled = 0
            for (tag in listOf("service", "receiver", "activity", "provider")) {
                val elements = doc.getElementsByTagName(tag)
                for (i in 0 until elements.length) {
                    val el = elements.item(i) as Element
                    if (el.getAttribute("android:name") in measurementComponents) {
                        el.setAttribute("android:enabled", "false")
                        disabled++
                    }
                }
            }
            if (disabled != measurementComponents.size) {
                throw PatchException(
                    "Drapes telemetry: disabled $disabled of ${measurementComponents.size} " +
                        "AppMeasurement components; refusing to ship with the upload " +
                        "machinery partly enabled."
                )
            }

            // 4. Remove the advertising ID permissions.
            val toRemove = mutableListOf<Element>()
            val permissions = doc.getElementsByTagName("uses-permission")
            for (i in 0 until permissions.length) {
                val el = permissions.item(i) as Element
                if (el.getAttribute("android:name") in adIdPermissions) toRemove += el
            }
            if (toRemove.size != adIdPermissions.size) {
                throw PatchException(
                    "Drapes telemetry: found ${toRemove.size} of ${adIdPermissions.size} " +
                        "advertising ID permissions; refusing to ship a partial removal."
                )
            }
            toRemove.forEach { it.parentNode.removeChild(it) }

            logger.info("Drapes telemetry: collection flags set, $disabled AppMeasurement components disabled, ${toRemove.size} AD_ID permissions removed.")
        }
    }
}
