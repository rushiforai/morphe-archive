package app.template.patches.boxbox.misc.telemetry

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_BOXBOX
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.iface.Method

// Stable class name: the measurement dynamite loader looks this local service up by name.
private const val MEASUREMENT_SERVICE =
    "Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;"

// IAppMeasurementDynamiteService.logEvent(origin, name, params, ..., timestamp).
private val MEASUREMENT_LOG_EVENT_PARAMETERS = listOf(
    "Ljava/lang/String;", "Ljava/lang/String;", "Landroid/os/Bundle;", "Z", "Z", "J",
)

/**
 * Patches every concrete method that emits telemetry instead of one representative per SDK.
 * A fingerprint that matches on name alone also hits the abstract declarations in
 * AppsFlyer's `AppsFlyerLib` interface, and `returnEarly()` on a method without a body
 * crashes the patcher - that is what broke this patch on 5.4.9. The class scan below only
 * ever touches methods with an implementation, so abstract declarations and renamed
 * internal classes (the `AFa1ySDK` implementation rotates every release) are handled.
 *
 * Firebase Analytics: R8 inlines `FirebaseAnalytics.logEvent` into the app's call sites
 * (the method no longer exists in 5.4.9 or 5.4.16), so every app-logged event reaches the
 * measurement dynamite service interface `logEvent(String, String, Bundle, Z, Z, J)`. It has
 * two implementations - the local `AppMeasurementDynamiteService` and the R8-renamed Binder
 * proxy to Play services' copy - and both are matched by that exact shape. Events the
 * measurement service generates itself (sessions, screen views) do not pass through here.
 */
@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables AppsFlyer event logging, app-logged Firebase Analytics events and Crashlytics exception reporting."
) {
    compatibleWith(COMPATIBILITY_BOXBOX)

    execute {
        val patchedMeasurementClasses = mutableListOf<String>()

        classDefForEach { classDef ->
            val type = classDef.type
            val appsFlyer = type.startsWith("Lcom/appsflyer/")
            val crashlytics = type.contains("crashlytics")
            val measurement = classDef.methods.any { method ->
                method.isMeasurementLogEvent() && method.implementation != null
            }
            if (!appsFlyer && !crashlytics && !measurement) return@classDefForEach

            mutableClassDefBy(classDef).methods
                .filter { it.implementation != null }
                .filter { method ->
                    when {
                        appsFlyer -> method.name == "logEvent"
                        crashlytics -> (method.name == "logException" || method.name == "recordException") &&
                            method.returnType == "V" &&
                            method.parameterTypes.firstOrNull()?.toString() == "Ljava/lang/Throwable;"
                        else -> method.isMeasurementLogEvent()
                    }
                }
                .forEach { it.returnEarly() }

            if (measurement) patchedMeasurementClasses += type
        }

        // Mandatory anchor: the local service keeps its name, so if it is not among the
        // patched classes the shape drifted and the Firebase branch would silently no-op.
        if (MEASUREMENT_SERVICE !in patchedMeasurementClasses) {
            error(
                "BoxBox: measurement logEvent(String, String, Bundle, Z, Z, J) not found on " +
                    "$MEASUREMENT_SERVICE; patched $patchedMeasurementClasses"
            )
        }
    }
}

private fun Method.isMeasurementLogEvent() =
    name == "logEvent" && returnType == "V" &&
        parameterTypes.map(CharSequence::toString) == MEASUREMENT_LOG_EVENT_PARAMETERS
