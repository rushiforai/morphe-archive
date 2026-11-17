package app.template.patches.aiscore.telemetry

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_AISCORE
import app.template.patches.shared.addInstructionsWithLabelsChecked
import com.android.tools.smali.dexlib2.AccessFlags
import org.w3c.dom.Element

private const val TIKTOK_SDK = "Lcom/tiktok/TikTokBusinessSdk;"
private const val TIKTOK_CONFIG = "Lcom/tiktok/TikTokBusinessSdk\$TTConfig;"
private const val TIKTOK_CALLBACK = "Lcom/tiktok/TikTokBusinessSdk\$TTInitCallback;"

// The app's single analytics funnel: static void (Bundle, String) that logs to Firebase and
// forwards to Facebook App Events and TikTok. The log tag "FirebaseLogEvent" is its only string.
internal object LogEventFunnelFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(string("FirebaseLogEvent")),
)

/**
 * Firebase Analytics, ad-ID, Crashlytics, Performance and the Facebook SDK's auto-logging are all
 * switched off through manifest meta-data. Messaging, Installations, Auth and Remote Config are
 * left alone (push notifications still work).
 */
private val disableTelemetryManifestPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_AISCORE)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val applications = doc.getElementsByTagName("application")
            if (applications.length == 0) throw PatchException("AndroidManifest.xml has no <application>")
            val application = applications.item(0) as Element

            val existing = buildMap {
                val metas = application.getElementsByTagName("meta-data")
                for (i in 0 until metas.length) {
                    val meta = metas.item(i) as? Element ?: continue
                    if (meta.parentNode != application) continue
                    put(meta.getAttribute("android:name"), meta)
                }
            }

            for ((name, value) in mapOf(
                "firebase_analytics_collection_enabled" to "false",
                "google_analytics_adid_collection_enabled" to "false",
                "firebase_crashlytics_collection_enabled" to "false",
                "firebase_performance_collection_deactivated" to "true",
                "com.facebook.sdk.AutoLogAppEventsEnabled" to "false",
                "com.facebook.sdk.AdvertiserIDCollectionEnabled" to "false",
                "com.facebook.sdk.CodelessDebugLogEnabled" to "false",
            )) {
                val meta = existing[name] ?: doc.createElement("meta-data").also {
                    it.setAttribute("android:name", name)
                    application.appendChild(it)
                }
                meta.setAttribute("android:value", value)
            }
        }
    }
}

/**
 * Drops the app's event funnel and makes the TikTok Business SDK report a failed start. TikTok's
 * init is not a plain no-op: the app's init coroutine waits for the callback and a readiness gate
 * buffers events, so the callback is failed with -1 and the app takes its own failure path (the
 * coroutine completes, buffered events are dropped, the SDK stays uninitialised).
 */
@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables analytics and ad tracking.",
) {
    compatibleWith(COMPATIBILITY_AISCORE)

    dependsOn(disableTelemetryManifestPatch)

    execute {
        // 1. Analytics funnel (static void, so returnEarly() applies).
        val funnels = LogEventFunnelFingerprint.matchAllOrNull().orEmpty()
        if (funnels.size != 1) {
            throw PatchException("Disable telemetry: expected one \"FirebaseLogEvent\" method, found ${funnels.map { it.method.name }}")
        }
        val funnel = funnels.single().method
        if (!AccessFlags.STATIC.isSet(funnel.accessFlags) ||
            funnel.parameterTypes.map(CharSequence::toString) != listOf("Landroid/os/Bundle;", "Ljava/lang/String;")
        ) {
            throw PatchException("Disable telemetry: ${funnel.definingClass}->${funnel.name} is not the (Bundle, String) funnel")
        }
        funnels.single().method.returnEarly()

        // 2. TikTok Business SDK: fail the init callback instead of starting the SDK.
        val initialize = mutableClassDefBy(TIKTOK_SDK).methods.singleOrNull {
            it.name == "initializeSdk" && it.implementation != null &&
                it.parameterTypes.map(CharSequence::toString) == listOf(TIKTOK_CONFIG, TIKTOK_CALLBACK)
        } ?: throw PatchException("Disable telemetry: $TIKTOK_SDK->initializeSdk(TTConfig, TTInitCallback) not found")
        initialize.addInstructionsWithLabelsChecked(
            0,
            """
                if-eqz p1, :done
                const/4 v0, -0x1
                const-string v1, "disabled"
                invoke-interface {p1, v0, v1}, $TIKTOK_CALLBACK->fail(ILjava/lang/String;)V
                :done
                return-void
            """,
        )
    }
}
