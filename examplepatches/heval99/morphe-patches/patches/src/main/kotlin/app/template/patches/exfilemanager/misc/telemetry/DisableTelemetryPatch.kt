package app.template.patches.exfilemanager.misc.telemetry

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_EXFILEMANAGER
import app.template.patches.shared.misc.telemetry.forceAnalyticsDeactivated
import com.android.tools.smali.dexlib2.AccessFlags

private const val MEASUREMENT_SDK = "Lcom/google/android/gms/measurement/api/AppMeasurementSdk;"
private const val APP_METRICA = "Lio/appmetrica/analytics/AppMetrica;"
private const val CRASHLYTICS_COLLECTION_KEY = "firebase_crashlytics_collection_enabled"

/**
 * Firebase Analytics, Firebase Crashlytics and Yandex AppMetrica.
 * 1. Firebase Analytics: the "firebase_analytics_collection_deactivated" manifest read answers true
 *    (shared with Sofascore and FotMob), and AppMeasurementSdk.logEvent returns at once.
 * 2. Crashlytics: the public class is R8-renamed; its settings holder is the only class holding the
 *    collection-enabled key. Its no-arg booleans answer false and its (Throwable) reporters return.
 * 3. AppMetrica (activated by the bundled Yandex ad SDK): every static void of the public facade
 *    returns at once (activate, activateReporter, reportEvent, ...), so it never starts and no call
 *    made before activation reaches it.
 */
@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables analytics and crash reporting.",
) {
    compatibleWith(COMPATIBILITY_EXFILEMANAGER)

    execute {
        // 1. Firebase Analytics.
        forceAnalyticsDeactivated()
        val logEvents = mutableClassDefBy(MEASUREMENT_SDK).methods.filter {
            it.name == "logEvent" && it.returnType == "V" && it.implementation != null
        }
        if (logEvents.isEmpty()) throw PatchException("$MEASUREMENT_SDK has no concrete logEvent")
        logEvents.forEach { it.returnEarly() }

        // 2. Crashlytics.
        val crashlyticsHolders = classDefByStrings(CRASHLYTICS_COLLECTION_KEY).toList()
        if (crashlyticsHolders.isEmpty()) throw PatchException("No class holds \"$CRASHLYTICS_COLLECTION_KEY\"")
        for (classDef in crashlyticsHolders) {
            val holder = mutableClassDefBy(classDef)
            holder.methods
                .filter { it.implementation != null && it.returnType == "Z" && it.parameterTypes.isEmpty() }
                .forEach { it.returnEarly(false) }
            holder.methods
                .filter {
                    it.implementation != null && it.returnType == "V" &&
                        it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/Throwable;")
                }
                .forEach { it.returnEarly() }
        }

        // 3. AppMetrica.
        val metrica = mutableClassDefByOrNull(APP_METRICA)?.methods?.filter {
            AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "V" && it.implementation != null &&
                it.name != "<clinit>"
        } ?: throw PatchException("$APP_METRICA not found")
        if (metrica.none { it.name == "activate" }) throw PatchException("$APP_METRICA.activate not found")
        metrica.forEach { it.returnEarly() }
    }
}
