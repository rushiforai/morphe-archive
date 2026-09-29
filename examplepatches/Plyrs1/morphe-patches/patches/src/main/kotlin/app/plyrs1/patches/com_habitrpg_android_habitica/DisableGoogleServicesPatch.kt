package app.plyrs1.patches.com_habitrpg_android_habitica

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.plyrs1.patches.shared.Constants.COMPATIBILITY_HABITICA
import org.w3c.dom.Element

/**
 * Manifest resource modifications for Disable Google Services:
 * - Injects telemetry suppression meta-data tags into <application>
 * - Disables Google DataTransport background services and alarm receiver
 * - Disables Firebase Cloud Messaging (FCM) service
 */
private val disableGoogleServicesManifestPatch = resourcePatch(
    name = null,
    description = "Internal: Telemetry suppression metadata and service disabling in AndroidManifest.xml",
    default = true
) {
    compatibleWith(COMPATIBILITY_HABITICA)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val manifest = doc.documentElement
            val application = manifest.getElementsByTagName("application").item(0) as Element

            // 1. Meta-data flags
            val metaDataFlags = mapOf(
                "firebase_crashlytics_collection_enabled" to "false",
                "firebase_analytics_collection_enabled" to "false",
                "firebase_performance_collection_enabled" to "false",
                "firebase_sessions_enabled" to "false"
            )

            val existingMetaData = application.getElementsByTagName("meta-data")
            val existingMetaMap = mutableMapOf<String, Element>()
            for (i in 0 until existingMetaData.length) {
                val elem = existingMetaData.item(i) as? Element ?: continue
                val name = elem.getAttribute("android:name")
                if (name.isNotEmpty()) {
                    existingMetaMap[name] = elem
                }
            }

            for ((name, value) in metaDataFlags) {
                val elem = existingMetaMap[name]
                if (elem != null) {
                    elem.setAttribute("android:value", value)
                } else {
                    val newElem = doc.createElement("meta-data")
                    newElem.setAttribute("android:name", name)
                    newElem.setAttribute("android:value", value)
                    application.appendChild(newElem)
                }
            }

            // 2. Disable DataTransport services and FCM service
            val servicesToDisable = setOf(
                "com.google.android.datatransport.runtime.backends.TransportBackendDiscovery",
                "com.google.android.datatransport.runtime.scheduling.jobscheduling.JobInfoSchedulerService",
                "com.habitrpg.android.habitica.helpers.notifications.HabiticaFirebaseMessagingService"
            )
            val services = application.getElementsByTagName("service")
            for (i in 0 until services.length) {
                val s = services.item(i) as? Element ?: continue
                if (s.getAttribute("android:name") in servicesToDisable) {
                    s.setAttribute("android:enabled", "false")
                }
            }

            // 3. Disable DataTransport alarm receiver
            val receiversToDisable = setOf(
                "com.google.android.datatransport.runtime.scheduling.jobscheduling.AlarmManagerSchedulerBroadcastReceiver"
            )
            val receivers = application.getElementsByTagName("receiver")
            for (i in 0 until receivers.length) {
                val r = receivers.item(i) as? Element ?: continue
                if (r.getAttribute("android:name") in receiversToDisable) {
                    r.setAttribute("android:enabled", "false")
                }
            }
        }
    }
}

@Suppress("unused")
val disableGoogleServicesPatch = bytecodePatch(
    name = "Disable Google Services",
    description = "Disables Firebase Crashlytics, Performance Monitoring, Sessions, Installations, " +
            "Remote Config network fetch, DataTransport telemetry pipeline, FCM push notifications, AdMob stub, " +
            "and bypasses the privacy preferences dialog. " +
            "Retains local Remote Config defaults for feature flags and preserves all Habitica API traffic.",
    default = true
) {
    compatibleWith(COMPATIBILITY_HABITICA)
    dependsOn(disableGoogleServicesManifestPatch)

    execute {
        // 1. Analytics gateway methods -> return-void
        AnalyticsInitializeFingerprint.method.addInstructions(0, "return-void")
        AnalyticsLogExceptionFingerprint.method.addInstructions(0, "return-void")
        AnalyticsLogErrorFingerprint.method.addInstructions(0, "return-void")
        AnalyticsSetUserIDFingerprint.method.addInstructions(0, "return-void")
        AnalyticsClearUserIDFingerprint.method.addInstructions(0, "return-void")
        AnalyticsSetConsentFingerprint.method.addInstructions(0, "return-void")

        // 2. HabiticaBaseApplication lifecycle initializations -> return-void
        SetupNotificationsFingerprint.method.addInstructions(0, "return-void")
        SetupAdHandlerFingerprint.method.addInstructions(0, "return-void")

        // 3. setupRemoteConfig: initialize RemoteConfig and set local XML defaults, then return-void
        SetupRemoteConfigFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, Lcom/google/firebase/remoteconfig/a;->n()Lcom/google/firebase/remoteconfig/a;
                move-result-object v0
                const v1, 0x7f16000d
                invoke-virtual {v0, v1}, Lcom/google/firebase/remoteconfig/a;->w(I)Lcom/google/android/gms/tasks/Task;
                return-void
            """
        )

        // 4. PrivacyPreferencesActivity: call super.onCreate, finish immediately, and return
        PrivacyPreferencesActivityOnCreateFingerprint.method.addInstructions(
            0,
            """
                invoke-super {p0, p1}, Lcom/habitrpg/android/habitica/ui/activities/Hilt_PrivacyPreferencesActivity;->onCreate(Landroid/os/Bundle;)V
                invoke-virtual {p0}, Landroid/app/Activity;->finish()V
                return-void
            """
        )
    }
}
