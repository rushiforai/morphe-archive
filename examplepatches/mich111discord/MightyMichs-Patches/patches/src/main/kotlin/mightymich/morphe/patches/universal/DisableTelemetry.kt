package mightymich.morphe.patches.universal

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Universal: neutralize common telemetry / analytics SDKs by no-oping track/log methods.
 *
 * Targets well-known class/method name patterns (not obfuscated SDK surface):
 * Firebase Analytics, Facebook AppEvents, Amplitude, Mixpanel, AppsFlyer,
 * Adjust, Segment, Flurry, GameAnalytics, Unity Analytics, etc.
 *
 * Best-effort: silently skips missing SDKs. Will not catch fully custom trackers.
 */
@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable all telemetry",
    description = "No-ops common analytics/telemetry SDK methods (Firebase, Facebook, " +
        "AppsFlyer, Adjust, Amplitude, Mixpanel, …). Best-effort universal.",
    default = false
) {
    execute {
        // definingClass substring (slash form) → method name prefixes / exact names
        val targets = listOf(
            // Firebase Analytics
            "Lcom/google/firebase/analytics/" to setOf(
                "logEvent", "setUserId", "setUserProperty", "setCurrentScreen",
                "setAnalyticsCollectionEnabled", "resetAnalyticsData"
            ),
            "Lcom/google/android/gms/analytics/" to setOf(
                "send", "set", "setScreenName"
            ),
            // Facebook
            "Lcom/facebook/appevents/" to setOf(
                "logEvent", "logPurchase", "logPushNotificationOpen",
                "activateApp", "deactivateApp", "setUserID", "clearUserID"
            ),
            // AppsFlyer
            "Lcom/appsflyer/" to setOf(
                "logEvent", "start", "startTracking", "trackEvent",
                "setCustomerUserId", "setAdditionalData"
            ),
            // Adjust
            "Lcom/adjust/sdk/" to setOf(
                "trackEvent", "trackSession", "setEnabled", "gdprForgetMe"
            ),
            // Amplitude
            "Lcom/amplitude/" to setOf(
                "logEvent", "track", "identify", "setUserId", "uploadEvents"
            ),
            // Mixpanel
            "Lcom/mixpanel/android/" to setOf(
                "track", "identify", "people", "flush", "timeEvent"
            ),
            // Segment
            "Lcom/segment/analytics/" to setOf(
                "track", "identify", "screen", "group", "alias", "flush"
            ),
            // Flurry
            "Lcom/flurry/android/" to setOf(
                "logEvent", "endTimedEvent", "setUserId"
            ),
            // Unity / Game analytics-ish
            "Lcom/unity3d/services/core/device/" to setOf(
                "sendEvent", "logEvent"
            ),
            // AppMetrica (Yandex)
            "Lcom/yandex/metrica/" to setOf(
                "reportEvent", "reportError", "setUserProfileID"
            ),
            // Tenjin / Branch lite hooks
            "Lcom/tenjin/" to setOf("eventWithName", "transaction"),
            "Lio/branch/referral/" to setOf("logEvent", "userCompletedAction"),
            // Generic "TrackingManager" style (many apps)
            // handled below via method-name only for void methods
        )

        val methodNameOnly = setOf(
            "logEvent", "trackEvent", "track", "sendEvent",
            "reportEvent", "logPurchase", "logAdImpression"
        )

        var patched = 0

        for (classDef in classes) {
            val type = classDef.type
            val sdkMethods = targets.firstOrNull { type.startsWith(it.first) }?.second

            for (method in classDef.methods) {
                val impl = method.implementation ?: continue
                val name = method.name
                val isVoid = method.returnType == "V"
                val isStaticOrPublic =
                    AccessFlags.STATIC.isSet(method.accessFlags) ||
                        AccessFlags.PUBLIC.isSet(method.accessFlags)

                val hit = when {
                    sdkMethods != null && sdkMethods.any { name == it || name.startsWith(it) } -> true
                    // Heuristic: public/static void logEvent/trackEvent in *analytics* packages
                    isVoid && isStaticOrPublic && name in methodNameOnly &&
                        (type.contains("analytics", ignoreCase = true) ||
                            type.contains("tracking", ignoreCase = true) ||
                            type.contains("telemetry", ignoreCase = true)) -> true
                    else -> false
                }

                if (!hit) continue

                try {
                    when (method.returnType) {
                        "V" -> method.addInstructions(0, "return-void")
                        "Z" -> method.addInstructions(
                            0,
                            """
                                const/4 v0, 0x0
                                return v0
                            """
                        )
                        "I", "J", "F", "D" -> method.addInstructions(
                            0,
                            """
                                const/4 v0, 0x0
                                return v0
                            """
                        )
                        else -> {
                            // reference return → null
                            method.addInstructions(
                                0,
                                """
                                    const/4 v0, 0x0
                                    return-object v0
                                """
                            )
                        }
                    }
                    patched++
                } catch (_: Exception) {
                    // skip broken methods
                }
            }
        }

        // Do not fail if nothing found – app may have no known SDKs
        if (patched == 0) {
            // soft success
        }
    }
}
