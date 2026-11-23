package app.template.patches.digisport.misc.telemetry

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_DIGISPORT
import app.template.patches.digisport.layout.caseOf
import app.template.patches.digisport.layout.casePrologue
import app.template.patches.shared.addInstructionChecked
import app.template.patches.shared.addInstructionsWithLabelsChecked
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Element

// Digi Sport sends telemetry through Firebase Analytics, Crashlytics and Performance Monitoring
// (GDPTools switches their collection on and off) and Piano/Cxense page events (SatiManager ->
// CxenseSdk.pushEvents). Since 1.1.16 R8 renames those SDK classes too (FirebaseAnalytics keeps
// its name but logEvent is inlined), so they are found by their own strings and kept AIDL / model
// names (see Fingerprints.kt). Firebase Cloud Messaging, the app's notification topics,
// SatiManager itself and GDPTools are untouched.

/** Sets the Firebase manifest switches under `<application>`; none ships in 1.1.16. */
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

private fun Method.params() = parameterTypes.map(CharSequence::toString)

private fun Method.refs() = implementation?.instructions?.mapNotNull { (it as? ReferenceInstruction)?.reference }.orEmpty()

private fun Method.hasString(value: String) = refs().any { (it as? StringReference)?.string == value }

private fun Method.label() = "$definingClass->$name(${params().joinToString("")})$returnType"

/** Loads false into the (Z) argument p1 before the original body runs. */
private fun MutableMethod.forceArgumentOff() = addInstructionChecked(0, "const/4 p1, 0x0")

private val THROWABLES = setOf("Ljava/lang/Throwable;", "Ljava/lang/Exception;", "Ljava/lang/RuntimeException;")

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
        // 2. Crashlytics (the class of getInstance's "component is not present" error):
        // GDPTools' setCrashlyticsCollectionEnabled(true) cannot switch collection back on (the
        // Boolean overload is gone since 1.1.16; the (Z) one writes the
        // "firebase_crashlytics_collection_enabled" preference), and non-fatals, breadcrumbs and
        // pending reports are never sent. Every recordException overload is covered (1.1.16: one,
        // narrowed to RuntimeException). log is inlined into its callers, so the core's
        // log(String) (the one that stamps the breadcrumb with the time since start) returns.
        val crashlytics = mutableClassDefBy(crashlyticsGetInstanceFingerprint.method.definingClass)
        val concrete = crashlytics.methods.filter { it.implementation != null }
        concrete.singleOrNull {
            it.returnType == "V" && it.params() == listOf("Z") && it.hasString("firebase_crashlytics_collection_enabled")
        }?.forceArgumentOff()
            ?: throw PatchException("Disable telemetry: no single setCrashlyticsCollectionEnabled(Z) in ${crashlytics.type}")
        val recordException = concrete.filter { it.returnType == "V" && it.params().singleOrNull() in THROWABLES }
        if (recordException.isEmpty()) throw PatchException("Disable telemetry: no recordException in ${crashlytics.type}")
        recordException.forEach { it.returnEarly() }
        concrete.singleOrNull { method ->
            method.returnType == "V" && method.params().isEmpty() && method.refs().any {
                (it as? FieldReference)?.let { field -> field.definingClass == "Ljava/lang/Boolean;" && field.name == "TRUE" } == true
            }
        }?.returnEarly() ?: throw PatchException("Disable telemetry: no single sendUnsentReports() in ${crashlytics.type}")

        val core = crashlytics.fields.singleOrNull { it.type.startsWith("L") && it.type != crashlytics.type }?.type
            ?: throw PatchException("Disable telemetry: ${crashlytics.type} has no single core field")
        mutableClassDefBy(core).methods.singleOrNull { method ->
            method.implementation != null && method.returnType == "V" && method.params() == listOf("Ljava/lang/String;") &&
                method.refs().any { (it as? MethodReference)?.let { ref -> ref.definingClass == "Ljava/lang/System;" && ref.name == "currentTimeMillis" } == true }
        }?.returnEarly() ?: throw PatchException("Disable telemetry: no single Crashlytics core log(String) in $core")

        // 3. Performance Monitoring: GDPTools cannot switch collection back on.
        performanceCollectionFingerprint.method.forceArgumentOff()

        // 4. Piano / Cxense: SatiManager's page events are never stored for sending. pushEvents is
        // inlined into SatiManager and only posts its runnable, a case of a merged Runnable: that
        // case (the one casting its capture to Event[]) returns at once; the other cases run.
        val push = cxensePushEventsRunnableFingerprint.method
        val eventsCast = push.implementation!!.instructions.indexOfFirst {
            it.opcode == Opcode.CHECK_CAST && (it as ReferenceInstruction).reference.toString() == CXENSE_EVENT_ARRAY
        }
        val (selector, case) = push.caseOf(eventsCast)
        push.addInstructionsWithLabelsChecked(
            0,
            casePrologue(push, selector, case, "not_cxense") + """
                return-void
                :not_cxense
                nop
            """,
        )

        // 5. Firebase Analytics: every concrete measurement logEvent returns at once (backstop for
        // the manifest switch; FirebaseAnalytics.logEvent is inlined into a runnable calling it).
        val logEvents = mutableListOf<Pair<String, Method>>()
        classDefForEach { classDef ->
            classDef.methods.filter {
                it.implementation != null && it.name == MEASUREMENT_LOG_EVENT && it.returnType == "V" &&
                    it.params() == MEASUREMENT_LOG_EVENT_PARAMETERS
            }.forEach { logEvents += classDef.type to it }
        }
        if (logEvents.isEmpty()) throw PatchException("Disable telemetry: no concrete measurement logEvent")
        logEvents.forEach { (type, logEvent) ->
            mutableClassDefBy(type).methods.single {
                it.name == logEvent.name && it.params() == logEvent.params() && it.returnType == "V"
            }.returnEarly()
        }
    }
}
