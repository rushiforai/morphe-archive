package app.zdrgon.patches.olx.misc

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.zdrgon.patches.olx.shared.Constants.COMPATIBILITY_OLX
import java.util.logging.Logger
import org.w3c.dom.Element

/**
 * OLX Pakistan — Remove telemetry.
 *
 * Census (18.13.1, full detail in the workdir RECON.md):
 * - Firebase Analytics (collection on; ad-id collection on),
 *   Firebase Crashlytics, Firebase Performance, Firebase Sessions
 *   and the datatransport/CCT upload plumbing that ships their
 *   reports out.
 * - MoEngage (core/inapp/pushbase/campaigns): analytics events,
 *   device attributes, in-app campaigns, marketing push.
 * - Facebook AppEvents: the manifest already disables auto-logging;
 *   the SDK stays for Facebook login (app function).
 * - Install Referrer API + advertising ID: their only consumers are
 *   the reporting SDKs above.
 *
 * What this patch cuts, and why the cut stops where it does:
 * - Firebase Analytics is deactivated and Crashlytics/Performance
 *   collection and ad-id collection are turned off in the manifest,
 *   and the three datatransport upload components are disabled, so
 *   Firebase reporting has neither collection nor a ride out.
 * - MoEngage's in-app campaign activity, its push-open tracker and
 *   its debugger activity are disabled: no campaign promos, no
 *   push-open tracking.
 * - MoEngage's core init is deliberately NOT removed: the app
 *   registers the SDK instance at startup and the very next startup
 *   code throws ("SDK not initialized for default instance") if it
 *   is missing — proven in OlxApplication.onCreate — so removing
 *   init would crash the app on launch. Its push delivery is also
 *   app function (offer/chat notifications ride the app's own FCM
 *   service, which is untouched).
 *
 * Search, chat, Firebase Auth, FCM messaging and Remote Config are
 * app function and are left alone.
 */
@Suppress("unused")
val removeTelemetryPatch = resourcePatch(
    name = "Remove telemetry",
    description = "Turns off Firebase Analytics, Crashlytics and Performance reporting " +
        "and ad-id collection, disables the Firebase report-upload plumbing, and " +
        "disables MoEngage in-app campaigns and push-open tracking. Search, chat, " +
        "sign-in and notifications are unaffected. OLX Pakistan 18.13.1 only.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_OLX)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        document("AndroidManifest.xml").use { doc ->
            val applications = doc.getElementsByTagName("application")
            if (applications.length != 1) {
                throw PatchException(
                    "OLX telemetry: expected exactly one <application> element, " +
                        "found ${applications.length}."
                )
            }
            val app = applications.item(0) as Element
            val metaData = app.getElementsByTagName("meta-data")
            val byName = HashMap<String, Element>()
            for (i in 0 until metaData.length) {
                val el = metaData.item(i) as Element
                byName[el.getAttribute("android:name")] = el
            }
            val flags = mapOf(
                "firebase_analytics_collection_deactivated" to "true",
                "firebase_crashlytics_collection_enabled" to "false",
                "firebase_performance_collection_enabled" to "false",
                "google_analytics_adid_collection_enabled" to "false",
            )
            for ((name, value) in flags) {
                val existing = byName[name]
                if (existing != null) {
                    existing.setAttribute("android:value", value)
                } else {
                    val el = doc.createElement("meta-data")
                    el.setAttribute("android:name", name)
                    el.setAttribute("android:value", value)
                    app.appendChild(el)
                }
            }

            // Disable the reporting-only components. A missing
            // component is a hard failure: a build that changed the
            // manifest must not silently ship with them enabled.
            val disable = setOf(
                // Firebase report upload plumbing.
                "com.google.android.datatransport.runtime.backends.TransportBackendDiscovery",
                "com.google.android.datatransport.runtime.scheduling.jobscheduling.JobInfoSchedulerService",
                "com.google.android.datatransport.runtime.scheduling.jobscheduling.AlarmManagerSchedulerBroadcastReceiver",
                // MoEngage campaign promos, push-open tracking, debugger.
                "com.moengage.inapp.internal.activity.MoEInAppActivity",
                "com.moengage.pushbase.activities.PushTracker",
                "com.moengage.sdk.debugger.MoEDebuggerActivity",
            )
            var disabled = 0
            for (tag in listOf("activity", "service", "receiver", "provider")) {
                val nodes = doc.getElementsByTagName(tag)
                for (i in 0 until nodes.length) {
                    val el = nodes.item(i) as Element
                    if (el.getAttribute("android:name") in disable) {
                        el.setAttribute("android:enabled", "false")
                        disabled++
                    }
                }
            }
            if (disabled != disable.size) {
                throw PatchException(
                    "OLX telemetry: expected to disable ${disable.size} components, " +
                        "found $disabled."
                )
            }
            logger.info("OLX telemetry: Firebase collection flags set; $disabled reporting components disabled.")
        }
    }
}
