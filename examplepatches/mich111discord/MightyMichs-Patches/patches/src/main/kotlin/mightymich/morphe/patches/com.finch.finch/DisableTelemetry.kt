package mightymich.morphe.patches.com.finch.finch

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * Best-effort telemetry reduction for Finch.
 *
 * App ships Sentry, Amplitude, and Adjust. Full Flutter-side mute needs
 * libapp.so work; here we no-op common Java/Kotlin log/track entry points
 * when fingerprints match.
 */
@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Reduces Adjust / analytics style callbacks where possible. " +
        "Flutter Sentry/Amplitude may still run partially.",
    default = false,
) {
    compatibleWith(FinchCompatibility.FINCH)

    execute {
        val markers = listOf(
            "com.adjust.sdk",
            "AdjustInstance",
            "ActivityHandler",
        )
        for (marker in markers) {
            val defs = try {
                classDefByStrings(marker)
            } catch (_: Exception) {
                emptyList()
            }
            for (def in defs) {
                if (!def.type.contains("adjust")) continue
                val clazz = try {
                    mutableClassDefBy(def)
                } catch (_: Exception) {
                    continue
                }
                for (method in clazz.methods) {
                    if (method.returnType != "V") continue
                    val n = method.name
                    if (n !in setOf(
                            "trackEvent",
                            "trackSession",
                            "sendReferrer",
                            "trackMeasurementConsent",
                        )
                    ) {
                        continue
                    }
                    try {
                        method.addInstructions(0, "return-void")
                    } catch (_: Exception) {
                    }
                }
            }
        }
    }
}
