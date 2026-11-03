package app.template.patches.forzafootball.misc.telemetry

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.forzafootball.shared.returnUnit
import app.template.patches.shared.Constants.COMPATIBILITY_FORZA_FOOTBALL
import app.template.patches.shared.misc.telemetry.forceAnalyticsDeactivated
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// The concrete AppsFlyer implementation subclasses the public AppsFlyerLib, which only declares
// abstract methods. These are the entry points that send data (as in the FotMob patch); the push
// APIs are left alone.
private const val APPSFLYER_LIB = "Lcom/appsflyer/AppsFlyerLib;"
private val APPSFLYER_METHODS = setOf("start", "logEvent", "logSession", "logAdRevenue")

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables analytics, tracking and crash reporting.",
) {
    compatibleWith(COMPATIBILITY_FORZA_FOOTBALL)

    execute {
        // 1. Firebase Analytics: the "firebase_analytics_collection_deactivated" manifest switch
        // reads as true (shared helper), so measurement never starts. Done in bytecode, so the
        // resource table is not re-encoded.
        forceAnalyticsDeactivated()

        // 2. Sentry: the startup initializer returns Unit before it reads its config or calls
        // SentryAndroid.init.
        SentryInitializerCreateFingerprint.method.returnUnit()

        // 3. AppsFlyer: start, every logEvent overload, logSession and logAdRevenue return at
        // once on every concrete implementation, so the SDK never sends.
        var appsFlyerStart = 0
        var appsFlyerLogEvent = 0
        classDefForEach { classDef ->
            if (classDef.superclass != APPSFLYER_LIB) return@classDefForEach
            mutableClassDefBy(classDef).methods
                .filter { it.name in APPSFLYER_METHODS && it.returnType == "V" && it.implementation != null }
                .forEach {
                    if (it.name == "start") appsFlyerStart++
                    if (it.name == "logEvent") appsFlyerLogEvent++
                    it.returnEarly()
                }
        }
        if (appsFlyerStart == 0 || appsFlyerLogEvent == 0) {
            throw PatchException("No AppsFlyerLib implementation of start() and logEvent() found")
        }

        // 4. Crashlytics: automatic data collection reads as off, so no crash report is sent.
        // The arbiter is the synchronized no-arg boolean that calls the source logger (dex marks
        // Java synchronized methods DECLARED_SYNCHRONIZED).
        val logger = CrashlyticsArbiterLogFingerprint.match()
        val arbiters = mutableClassDefBy(logger.classDef).methods.filter { method ->
            method.returnType == "Z" && method.parameterTypes.isEmpty() &&
                AccessFlags.DECLARED_SYNCHRONIZED.isSet(method.accessFlags) &&
                method.implementation?.instructions?.any {
                    val call = (it as? ReferenceInstruction)?.reference as? MethodReference
                    call?.definingClass == logger.classDef.type && call.name == logger.method.name &&
                        call.parameterTypes.map(CharSequence::toString) == listOf("Z")
                } == true
        }
        val arbiter = arbiters.singleOrNull()
            ?: throw PatchException("Expected one Crashlytics collection getter, found ${arbiters.map { it.name }}")
        arbiter.returnEarly(false)
    }
}
