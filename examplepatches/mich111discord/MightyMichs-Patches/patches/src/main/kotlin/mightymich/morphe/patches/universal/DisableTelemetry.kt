package mightymich.morphe.patches.universal

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * Universal best-effort: no-op common analytics entry points found by string markers.
 */
@Suppress("unused")
val disableAllTelemetryPatch = bytecodePatch(
    name = "Disable all telemetry",
    description = "Best-effort disable of Firebase/AppsFlyer/Mixpanel/Segment style track methods.",
    default = false
) {
    execute {
        val markers = listOf(
            "FirebaseAnalytics",
            "AppEventsLogger",
            "AppsFlyerLib",
            "MixpanelAPI",
            "logEvent"
        )
        val methodNames = setOf(
            "logEvent", "trackEvent", "track", "sendEvent",
            "logPurchase", "setUserId", "setUserProperty"
        )

        for (marker in markers) {
            val defs = try {
                classDefByStrings(marker)
            } catch (_: Exception) {
                emptyList()
            }
            for (def in defs) {
                val clazz = try {
                    mutableClassDefBy(def)
                } catch (_: Exception) {
                    continue
                }
                for (method in clazz.methods) {
                    if (method.implementation == null) continue
                    if (method.name !in methodNames) continue
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
                            else -> { /* leave non-void alone */ }
                        }
                    } catch (_: Exception) {
                    }
                }
            }
        }
    }
}
