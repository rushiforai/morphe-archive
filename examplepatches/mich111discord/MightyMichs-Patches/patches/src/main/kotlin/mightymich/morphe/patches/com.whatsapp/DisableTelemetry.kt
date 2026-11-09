package mightymich.morphe.patches.com.whatsapp

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Usage data",
    description = "Limit diagnostic and analytics data WhatsApp sends.",
    default = true,
) {
    compatibleWith(WhatsAppCompatibility.WHATSAPP)

    execute {
        val markers = listOf("WamEvent", "FieldStats", "FacebookAnalytics")
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
                    if (method.returnType != "V") continue
                    val n = method.name
                    if (n != "log" && n != "track" && n != "record" &&
                        n != "logEvent" && !n.startsWith("log")
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
