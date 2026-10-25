package app.template.patches.digisport.misc.telemetry

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_DIGISPORT
import app.template.patches.shared.addInstructionChecked
import org.w3c.dom.Element

// Digi Sport sends telemetry through Firebase Analytics, Crashlytics and Performance Monitoring
// (GDPTools switches their collection on and off) and Piano/Cxense page events (SatiManager ->
// CxenseSdk.pushEvents). All four SDKs keep their public class and method names. Firebase Cloud
// Messaging, the app's notification topics, SatiManager itself and GDPTools are untouched.
private const val CRASHLYTICS = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;"
private const val PERFORMANCE = "Lcom/google/firebase/perf/FirebasePerformance;"
private const val ANALYTICS = "Lcom/google/firebase/analytics/FirebaseAnalytics;"
private const val CXENSE = "Lio/piano/android/cxense/CxenseSdk;"

/** Sets the Firebase manifest switches under `<application>`; none ships in 1.1.15. */
private val disableTelemetryManifestPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_DIGISPORT)

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
                "firebase_analytics_collection_deactivated" to "true",
                "firebase_performance_collection_deactivated" to "true",
                "firebase_crashlytics_collection_enabled" to "false",
            )) {
                // Overwrite in place should a later build ship one of them.
                val meta = existing[name] ?: doc.createElement("meta-data").also {
                    it.setAttribute("android:name", name)
                    application.appendChild(it)
                }
                meta.setAttribute("android:value", value)
            }
        }
    }
}

private fun BytecodePatchContext.concreteMethods(type: String, name: String): List<MutableMethod> {
    val methods = mutableClassDefByOrNull(type)?.methods
        ?: throw PatchException("Disable telemetry: $type not found")
    return methods.filter { it.name == name && it.returnType == "V" && it.implementation != null }
}

private fun MutableMethod.params() = parameterTypes.map(CharSequence::toString)

/** The single concrete void [type].[name]([parameters]), or a loud failure. */
private fun BytecodePatchContext.requireMethod(type: String, name: String, vararg parameters: String) =
    concreteMethods(type, name).singleOrNull { it.params() == parameters.toList() }
        ?: throw PatchException("Disable telemetry: no concrete $type->$name(${parameters.joinToString("")})V")

/**
 * Forces the collection switch [type].[name] off: the (Z) overload loads false and the (Boolean)
 * overload loads Boolean.FALSE into the argument before the original body runs.
 */
private fun BytecodePatchContext.forceCollectionOff(type: String, name: String) {
    requireMethod(type, name, "Z").addInstructionChecked(0, "const/4 p1, 0x0")
    requireMethod(type, name, "Ljava/lang/Boolean;")
        .addInstructionChecked(0, "sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;")
}

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables analytics and crash reporting.",
) {
    compatibleWith(COMPATIBILITY_DIGISPORT)

    // 1. Firebase manifest switches: Analytics and Performance deactivated, Crashlytics off by
    // default.
    dependsOn(disableTelemetryManifestPatch)

    execute {
        // 2. Crashlytics: GDPTools.setCrashlytics(true) cannot switch collection back on, and
        // non-fatals, breadcrumbs and pending reports are never sent. Every recordException
        // overload is covered (1.1.15: (Throwable) and (Throwable, CustomKeysAndValues)).
        forceCollectionOff(CRASHLYTICS, "setCrashlyticsCollectionEnabled")
        val recordException = concreteMethods(CRASHLYTICS, "recordException")
        if (recordException.none { it.params() == listOf("Ljava/lang/Throwable;") }) {
            throw PatchException("Disable telemetry: no concrete $CRASHLYTICS->recordException(Throwable)V")
        }
        recordException.forEach { it.returnEarly() }
        requireMethod(CRASHLYTICS, "log", "Ljava/lang/String;").returnEarly()
        requireMethod(CRASHLYTICS, "sendUnsentReports").returnEarly()

        // 3. Performance Monitoring: GDPTools cannot switch collection back on. The (Z) overload
        // only boxes and forwards to the (Boolean) one.
        forceCollectionOff(PERFORMANCE, "setPerformanceCollectionEnabled")

        // 4. Piano / Cxense: SatiManager's page events are never queued for sending. pushEvents
        // has a single (varargs Event[]) overload.
        val pushEvents = concreteMethods(CXENSE, "pushEvents")
        if (pushEvents.isEmpty()) throw PatchException("Disable telemetry: no concrete $CXENSE->pushEvents")
        pushEvents.forEach { it.returnEarly() }

        // 5. Firebase Analytics: logEvent returns at once (backstop for the manifest switch).
        requireMethod(ANALYTICS, "logEvent", "Ljava/lang/String;", "Landroid/os/Bundle;").returnEarly()
    }
}
