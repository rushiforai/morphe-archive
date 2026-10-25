package app.template.patches.guardian.misc.telemetry

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.Match
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_GUARDIAN
import app.template.patches.shared.addInstructionChecked
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.AccessFlags
import org.w3c.dom.Element

// Firebase Analytics' documented manifest kill switch. It also stops the automatic events
// (first_open, session_start, screen_view) the logEvent hook cannot reach. The stock 6.238
// manifest ships firebase_*_collection_enabled=false (the app switches collection on after
// consent) but not this one.
private const val ANALYTICS_DEACTIVATED_KEY = "firebase_analytics_collection_deactivated"

/** Sets the Firebase Analytics manifest switch under `<application>`. */
private val disableAnalyticsManifestPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_GUARDIAN)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val applications = doc.getElementsByTagName("application")
            if (applications.length == 0) throw PatchException("AndroidManifest.xml has no <application>")
            val application = applications.item(0) as Element

            // Overwrite in place should a later build ship the key; only direct children count.
            val metas = application.getElementsByTagName("meta-data")
            val meta = (0 until metas.length)
                .mapNotNull { metas.item(it) as? Element }
                .firstOrNull { it.parentNode == application && it.getAttribute("android:name") == ANALYTICS_DEACTIVATED_KEY }
                ?: doc.createElement("meta-data").also {
                    it.setAttribute("android:name", ANALYTICS_DEACTIVATED_KEY)
                    application.appendChild(it)
                }
            meta.setAttribute("android:value", "true")
        }
    }
}

/** The fingerprint's single match, or a loud failure naming every match. */
private fun BytecodePatchContext.single(fingerprint: Fingerprint, label: String): Match {
    val matches = fingerprint.matchAllOrNull().orEmpty()
    return matches.singleOrNull() ?: throw PatchException(
        "Disable telemetry: expected one $label, found " +
            matches.map { "${it.classDef.type}->${it.method.name}" },
    )
}

/** The single concrete method of [methods] that returns V and takes exactly [parameters]. */
private fun List<MutableMethod>.singleVoid(label: String, vararg parameters: String): MutableMethod {
    val found = filter { method ->
        method.returnType == "V" && method.implementation != null &&
            method.parameterTypes.map(CharSequence::toString) == parameters.toList()
    }
    return found.singleOrNull() ?: throw PatchException(
        "Disable telemetry: expected one concrete $label(${parameters.joinToString("")})V, found ${found.map { it.name }}",
    )
}

private fun MutableMethod.isStatic() = AccessFlags.STATIC.isSet(accessFlags)

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables analytics, tracking and crash reporting.",
) {
    compatibleWith(COMPATIBILITY_GUARDIAN)

    // 1. Firebase Analytics' manifest switch, for the automatic events.
    dependsOn(disableAnalyticsManifestPatch)

    execute {
        // 2. SdkManager's gate answers false for every SDK, the app's own "no consent" path:
        // InitializeAvailableSdks deinitialises each one (Firebase Analytics and Crashlytics
        // collection off, Adjust.disable, Braze disableSdk + wipeData) and Comscore, Nielsen,
        // Adjust, Braze, Permutive, Confiant, APS and Teads never start. Podcasts get their
        // ad-free URL, as for premium users. The consent check itself is left alone.
        val sdk = single(SdkToStringFingerprint, "Sdk descriptor toString").classDef.type
        single(sdkGateFingerprint(sdk), "SdkManager gate ($sdk)Z").method.returnEarly(false)

        // 3. Ophan: the uploader returns at once, so OphanCoroutineWorker treats the batch as
        // sent and deletes the queued events instead of retrying them.
        single(OphanSubmitFingerprint, "Ophan uploader").method.returnEarly()

        // 4. Firebase Analytics: the post-consent task switches collection back on outside the
        // gate. setAnalyticsCollectionEnabled always gets false, and logEvent returns at once.
        val analytics = mutableClassDefByOrNull(FIREBASE_ANALYTICS)?.methods?.toList()
            ?: throw PatchException("Disable telemetry: $FIREBASE_ANALYTICS not found")
        analytics.filterNot { it.isStatic() }
            .singleVoid("FirebaseAnalytics.setAnalyticsCollectionEnabled", "Z")
            .addInstructionChecked(0, "const/4 p1, 0x0")
        analytics.singleVoid("FirebaseAnalytics.logEvent", "Landroid/os/Bundle;", STRING).returnEarly()

        // 5. Crashlytics (R8-renamed, found through getInstance()): collection cannot be switched
        // on, so crash reports stay on the device, and custom log lines are dropped.
        val crashlytics = single(CrashlyticsGetInstanceFingerprint, "FirebaseCrashlytics.getInstance")
            .classDef.methods.filterNot { it.isStatic() }
        crashlytics.singleVoid("FirebaseCrashlytics.setCrashlyticsCollectionEnabled", "Z")
            .addInstructionChecked(0, "const/4 p1, 0x0")
        crashlytics.singleVoid("FirebaseCrashlytics.log", STRING).returnEarly()

        // 6. The push "received" beacon returns Boolean.FALSE (its HTTP status) without a request.
        // Its caller only checks for COROUTINE_SUSPENDED, and the notification is already shown.
        single(PushReceivedBeaconFingerprint, "push received beacon").method.apply {
            val locals = implementation!!.registerCount - parameterTypes.size - (if (isStatic()) 0 else 1)
            if (locals < 1) throw PatchException("Disable telemetry: the push beacon has no local register")
            addInstructionsChecked(
                0,
                """
                    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                    return-object v0
                """
            )
        }
    }
}
