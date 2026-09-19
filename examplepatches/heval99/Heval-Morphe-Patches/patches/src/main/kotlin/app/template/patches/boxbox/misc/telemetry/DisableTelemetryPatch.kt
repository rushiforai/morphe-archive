package app.template.patches.boxbox.misc.telemetry

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_BOXBOX
import app.morphe.util.returnEarly

/**
 * Patches every concrete method that emits telemetry instead of one representative per SDK.
 * A fingerprint that matches on name alone also hits the abstract declarations in
 * AppsFlyer's `AppsFlyerLib` interface, and `returnEarly()` on a method without a body
 * crashes the patcher - that is what broke this patch on 5.4.9. The class scan below only
 * ever touches methods with an implementation, so abstract declarations and renamed
 * internal classes (the `AFa1ySDK` implementation rotates every release) are handled.
 */
@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables AppsFlyer, Firebase Analytics and Crashlytics event logging."
) {
    compatibleWith(COMPATIBILITY_BOXBOX)

    execute {
        classDefForEach { classDef ->
            val type = classDef.type
            val appsFlyer = type.startsWith("Lcom/appsflyer/")
            val firebaseAnalytics = type.contains("FirebaseAnalytics")
            val crashlytics = type.contains("crashlytics")
            if (!appsFlyer && !firebaseAnalytics && !crashlytics) return@classDefForEach

            mutableClassDefBy(classDef).methods
                .filter { it.implementation != null }
                .filter { method ->
                    when {
                        appsFlyer || firebaseAnalytics -> method.name == "logEvent"
                        else -> (method.name == "logException" || method.name == "recordException") &&
                            method.returnType == "V" &&
                            method.parameterTypes.firstOrNull()?.toString() == "Ljava/lang/Throwable;"
                    }
                }
                .forEach { it.returnEarly() }
        }
    }
}
