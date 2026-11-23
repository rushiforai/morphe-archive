package app.jofslash.patches.booking.tracking

import app.jofslash.patches.booking.shared.Constants.COMPATIBILITY_BOOKING
import app.jofslash.patches.booking.shared.methodOf
import app.jofslash.patches.booking.shared.returnEarly
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.AccessFlags
import org.w3c.dom.Element

/** Permissions that only serve advertising: the advertising ID and Android's ad services. */
private val AD_PERMISSIONS = setOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
    "android.permission.ACCESS_ADSERVICES_TOPICS",
)

/** Google's data transport (Firelog) backend that uploads to firebaselogging-pa.googleapis.com. */
private const val CCT_BACKEND = "backend:com.google.android.datatransport.cct.CctBackendFactory"

/** Google Tag Manager's service and its preview (debug) screen. */
private val TAG_MANAGER_COMPONENTS = setOf(
    "com.google.android.gms.tagmanager.TagManagerService",
    "com.google.android.gms.tagmanager.TagManagerPreviewActivity",
)

private const val CRASHLYTICS_DATA_COLLECTION =
    "Lcom/google/firebase/crashlytics/internal/common/DataCollectionArbiter;"
private const val FIS_CLIENT = "Lcom/google/firebase/installations/remote/FirebaseInstallationServiceClient;"
private const val FIS_EXCEPTION = "Lcom/google/firebase/installations/FirebaseInstallationsException;"
private const val FIS_STATUS = "Lcom/google/firebase/installations/FirebaseInstallationsException\$Status;"

private val blockTrackingResourcePatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val permissions = document.getElementsByTagName("uses-permission")
            for (i in permissions.length - 1 downTo 0) {
                val permission = permissions.item(i) as Element
                if (permission.getAttribute("android:name") in AD_PERMISSIONS) {
                    permission.parentNode.removeChild(permission)
                }
            }

            // Firebase Analytics (also behind Google Analytics and Tag Manager here): switched off
            // for good, so the app's own consent code can't turn it back on.
            val application = document.getElementsByTagName("application").item(0) as Element
            val metaData = application.getElementsByTagName("meta-data")
            fun setMetaData(name: String, value: String) {
                val existing = (0 until metaData.length).map { metaData.item(it) as Element }
                    .firstOrNull { it.getAttribute("android:name") == name }
                val element = existing ?: document.createElement("meta-data").also {
                    it.setAttribute("android:name", name)
                    application.appendChild(it)
                }
                element.setAttribute("android:value", value)
            }
            setMetaData("firebase_analytics_collection_deactivated", "true")
            setMetaData("firebase_analytics_collection_enabled", "false")
            setMetaData("google_analytics_adid_collection_enabled", "false")
            // Crashlytics crash reports and Firebase Sessions, by their own switches. The app turns
            // Crashlytics back on in code, so the bytecode patch below holds it off too.
            setMetaData("firebase_crashlytics_collection_enabled", "false")
            setMetaData("firebase_sessions_enabled", "false")

            // Google's data transport sends Crashlytics, Sessions, Performance, ML Kit and FCM
            // delivery logs through its "cct" backend to firebaselogging-pa.googleapis.com.
            // Without the backend, the transport drops whatever is queued for it.
            val allMetaData = document.getElementsByTagName("meta-data")
            for (i in allMetaData.length - 1 downTo 0) {
                val element = allMetaData.item(i) as Element
                if (element.getAttribute("android:name") == CCT_BACKEND) {
                    element.parentNode.removeChild(element)
                }
            }

            // Google Tag Manager only runs on Firebase Analytics events, which are off; switch off
            // its service and its preview screen (a deep link anyone can open) as well.
            for (tag in listOf("service", "activity")) {
                val components = document.getElementsByTagName(tag)
                for (i in 0 until components.length) {
                    val component = components.item(i) as Element
                    if (component.getAttribute("android:name") in TAG_MANAGER_COMPONENTS) {
                        component.setAttribute("android:enabled", "false")
                        component.setAttribute("android:exported", "false")
                    }
                }
            }
        }
    }
}

@Suppress("unused")
val blockTrackingPatch = bytecodePatch(
    name = "Block tracking",
    description = "Stops analytics and marketing trackers: AppsFlyer, Firebase and Google Analytics, Firebase " +
            "Crashlytics, Sessions, Installations and logging, Google Tag Manager, Embrace, the ID5 advertising " +
            "ID, and Booking's own C360 and \"squeaks\" usage reports. Also removes the advertising ID " +
            "permissions. Security, payment and sign-in checks are left alone.",
    default = true
) {
    category("Privacy")
    compatibleWith(COMPATIBILITY_BOOKING)

    dependsOn(blockTrackingResourcePatch)

    execute {
        // AppsFlyer (install attribution and marketing events) is only started here, once you
        // allow marketing cookies. Without it the app uses its built-in "no AppsFlyer" tracker,
        // the same as when you decline.
        methodOf("Lcom/booking/di/marketing/AppsFlyerProviderImpl;", "enableAppsFlyer").returnEarly()

        // Embrace (sessions, network calls, logs and traces sent to embrace.io). The app falls back
        // to its no-op tracker when creating the Embrace tracker fails, so make it fail.
        methodOf("Lcom/booking/observability/internal/embrace/EmbraceTracker;", "<init>").addInstructions(
            0,
            """
                new-instance v0, Ljava/lang/IllegalStateException;
                const-string v1, "Embrace is blocked"
                invoke-direct { v0, v1 }, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V
                throw v0
            """
        )

        // Booking's C360 customer tracking: both managers only queue events to send later.
        methodOf("Lcom/booking/c360tracking/C360TrackingManager;", "track").returnEarly()
        methodOf("Lcom/booking/c360tracking/C360TrackingPAcManager;", "track").returnEarly()

        // Squeaks, Booking's usage and error reports: every report is sent through this.
        methodOf("Lcom/booking/core/squeaks/Squeak\$Builder;", "send").returnEarly()

        // ID5 builds a shared advertising ID from your hashed email and advertising ID. Answer its
        // consent check with "not given", so it never asks for one.
        methodOf("Lcom/booking/nativeads/id5/data/eligibility/DefaultID5ConsentProvider;", "awaitCurrentState")
            .addInstructions(
                0,
                """
                    sget-object v0, Lcom/booking/nativeads/id5/domain/eligibility/ID5ConsentState;->NOT_GIVEN:Lcom/booking/nativeads/id5/domain/eligibility/ID5ConsentState;
                    return-object v0
                """
            )

        // Firebase Crashlytics. The app calls setCrashlyticsCollectionEnabled(true) at start,
        // which beats the manifest switch, so answer Crashlytics' own "may I collect" check with
        // no. Without it Crashlytics doesn't fetch its settings, doesn't send reports and doesn't
        // ask Firebase Sessions to log sessions.
        methodOf(CRASHLYTICS_DATA_COLLECTION, "isAutomaticDataCollectionEnabled").returnEarly()

        // Firebase Installations (firebaseinstallations.googleapis.com) registers an install ID
        // for Crashlytics, Sessions, Remote Config and push. Every request opens its connection
        // here; fail it as "service unavailable", as when Google can't be reached. The install
        // ID is still made on the phone, and push registration (FCM) goes on without the
        // Installations token, as it does when that service is down.
        methodOf(FIS_CLIENT, "openHttpURLConnection").apply {
            val code = implementation ?: throw PatchException("$FIS_CLIENT->openHttpURLConnection has no code")
            val parameterRegisters = parameterTypes.size + if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
            if (code.registerCount - parameterRegisters < 3) {
                throw PatchException("$FIS_CLIENT->openHttpURLConnection has too few registers")
            }
            addInstructions(
                0,
                """
                    new-instance v0, $FIS_EXCEPTION
                    const-string v1, "Firebase Installations is blocked"
                    sget-object v2, $FIS_STATUS->UNAVAILABLE:$FIS_STATUS
                    invoke-direct { v0, v1, v2 }, $FIS_EXCEPTION-><init>(Ljava/lang/String;$FIS_STATUS)V
                    throw v0
                """
            )
        }

        // Booking's side of Tag Manager: the marketing events (search, hotel, book, confirmation
        // with price and reservation ID) it hands to Firebase Analytics for Tag Manager, and the
        // event data it fetches for them from Booking at start.
        methodOf("Lcom/booking/tagmanagerservices/TagManagerMarketingTracker;", "logEvent").returnEarly()
        methodOf("Lcom/booking/tagmanagerservices/init/TagManagerInitialisable;", "initialize").returnEarly()
    }
}
