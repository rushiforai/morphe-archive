package app.template.patches.wemuslim.misc.telemetry

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_WEMUSLIM
import app.template.patches.wemuslim.misc.encryption.bypassNativeEncryptionPatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import org.w3c.dom.Element

private const val FIREBASE_ANALYTICS = "Lcom/google/firebase/analytics/FirebaseAnalytics;"
private const val MEASUREMENT_INTERNAL = "Lcom/google/android/gms/internal/measurement/"
private const val APP_MEASUREMENT_SDK = "Lcom/google/android/gms/measurement/api/AppMeasurementSdk;"
private const val APPSFLYER_LIB = "Lcom/appsflyer/AppsFlyerLib;"
private const val ADJUST = "Lcom/adjust/sdk/Adjust;"
private const val BUNDLE = "Landroid/os/Bundle;"
private const val STRING = "Ljava/lang/String;"

// R8 renamed or inlined FirebaseAnalytics.logEvent and renamed FirebaseCrashlytics itself, so both
// SDKs are switched off through their manifest keys; the stock manifest sets none.
// FirebaseInitProvider and Remote Config, which drive the app's ad and feature switches, are left
// alone, as are the app's own YCTrack / tech-trace events to its own server.
private val disableCollectionPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_WEMUSLIM)

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
                "google_analytics_adid_collection_enabled" to "false",
                "firebase_crashlytics_collection_enabled" to "false",
            )) {
                // Overwrite in place should a later build ship one of these keys.
                val meta = existing[name] ?: doc.createElement("meta-data").also {
                    it.setAttribute("android:name", name)
                    application.appendChild(it)
                }
                meta.setAttribute("android:value", value)
            }
        }
    }
}

/** Every concrete method of [owner] named one of [names]; each name must have at least one. */
private fun BytecodePatchContext.concrete(owner: ClassDef, vararg names: String): List<MutableMethod> {
    val methods = mutableClassDefBy(owner).methods.filter { it.name in names && it.implementation != null }
    for (name in names) {
        if (methods.none { it.name == name }) throw PatchException("Disable telemetry: no concrete ${owner.type}->$name")
    }
    return methods
}

/**
 * Turns off Firebase Analytics, advertising ID collection and Crashlytics uploads, and makes the
 * AppsFlyer and Adjust attribution SDKs never start or send events.
 */
@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables analytics and crash reporting.",
) {
    compatibleWith(COMPATIBILITY_WEMUSLIM)

    dependsOn(disableCollectionPatch)
    dependsOn(bypassNativeEncryptionPatch)

    execute {
        // 1. Firebase Analytics: logEvent is R8-renamed (3.5.0: FirebaseAnalytics.OooO00o(Bundle,
        // String)) or inlined into the app's callers (3.5.4). Either way it ends in the measurement
        // client FirebaseAnalytics holds (zzfb in 3.5.0, zzez in 3.5.4), the type of its one
        // instance field, whose single (String, Bundle) void logs the event.
        val clients = classDefBy(FIREBASE_ANALYTICS).fields
            .filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type.startsWith(MEASUREMENT_INTERNAL) }
            .map { it.type }
            .distinct()
        val client = clients.singleOrNull()
            ?: throw PatchException("Disable telemetry: expected one $MEASUREMENT_INTERNAL client field on $FIREBASE_ANALYTICS, found $clients")
        val logEvents = mutableClassDefBy(client).methods.filter { method ->
            method.returnType == "V" && method.implementation != null &&
                !AccessFlags.STATIC.isSet(method.accessFlags) &&
                method.parameterTypes.map(CharSequence::toString) == listOf(STRING, BUNDLE)
        }
        val logEvent = logEvents.singleOrNull()
            ?: throw PatchException("Disable telemetry: expected one (String, Bundle) logEvent on $client, found ${logEvents.size}")
        logEvent.returnEarly()

        // 2. The measurement API other Firebase SDKs log through keeps its public names.
        concrete(classDefBy(APP_MEASUREMENT_SDK), "logEvent", "logEventNoInterceptor", "setUserProperty")
            .forEach { it.returnEarly() }

        // 3. AppsFlyer: AppsFlyerLib is abstract; its implementation (internal AFa1tSDK in 3.5.0,
        // AFa1zSDK in 3.5.4) is the concrete subclass. It never starts, logs sessions, events or ad
        // revenue. init() returns the instance unchanged so the app's builder chain goes on;
        // deferred deep links through AppsFlyer (OneLink invites) no longer resolve. The SDK in
        // 3.5.4 dropped setCustomerIdAndLogSession, so that one is patched only where it exists.
        val appsFlyerImpls = mutableListOf<ClassDef>()
        classDefForEach { classDef ->
            if (classDef.superclass == APPSFLYER_LIB && !AccessFlags.ABSTRACT.isSet(classDef.accessFlags)) {
                appsFlyerImpls += classDef
            }
        }
        if (appsFlyerImpls.isEmpty()) throw PatchException("Disable telemetry: no concrete $APPSFLYER_LIB subclass")
        for (impl in appsFlyerImpls) {
            val optional = mutableClassDefBy(impl).methods.filter {
                it.name == "setCustomerIdAndLogSession" && it.implementation != null
            }
            (concrete(impl, "start", "logEvent", "logSession", "logAdRevenue") + optional)
                .filter { it.returnType == "V" }
                .forEach { it.returnEarly() }
            concrete(impl, "init")
                .filter { it.returnType == APPSFLYER_LIB }
                .ifEmpty { throw PatchException("Disable telemetry: ${impl.type}->init does not return $APPSFLYER_LIB") }
                .forEach { it.addInstructions(0, "return-object p0") }
        }

        // 4. Adjust: the SDK is never initialized and events / ad revenue are dropped. getAdid
        // only queues its (fire-and-forget) callback when the SDK is not running.
        concrete(classDefBy(ADJUST), "initSdk", "trackEvent", "trackAdRevenue")
            .filter { it.returnType == "V" }
            .forEach { it.returnEarly() }
    }
}
