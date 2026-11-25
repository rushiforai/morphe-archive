package app.masareef.patches.telemetry

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.masareef.patches.shared.Constants.COMPATIBILITY_MASAREEF

@Suppress("unused")
val disableFacebookAnalyticsPatch = bytecodePatch(
    name = "Disable Facebook Analytics",
    description = "Disables Facebook App Events tracking and analytics.",
    default = false
) {
    compatibleWith(COMPATIBILITY_MASAREEF)

    execute {
        // Disable AppEventsLogger initialization
        arrayOf(
            "Lcom/facebook/appevents/AppEventsLogger;",
            "Lcom/facebook/appevents/AppEventsLoggerImpl;",
        ).forEach { className ->
            runCatching {
                val clazz = mutableClassDefBy(className)
                
                // Find and disable logEvent methods
                clazz.methods
                    .filter { it.name.startsWith("logEvent") || it.name == "logPurchase" }
                    .forEach { method ->
                        method.addInstructions(
                            0,
                            """
                                return-void
                            """
                        )
                    }
                
                // Find and disable flush methods
                clazz.methods
                    .filter { it.name == "flush" }
                    .forEach { method ->
                        method.addInstructions(
                            0,
                            """
                                return-void
                            """
                        )
                    }
            }
        }
    }
}
