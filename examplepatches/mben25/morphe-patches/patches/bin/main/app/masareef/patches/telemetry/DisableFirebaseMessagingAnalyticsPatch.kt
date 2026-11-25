package app.masareef.patches.telemetry

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.masareef.patches.shared.Constants.COMPATIBILITY_MASAREEF

@Suppress("unused")
val disableFirebaseMessagingAnalyticsPatch = bytecodePatch(
    name = "Disable Firebase Messaging Analytics",
    description = "Disables Firebase Cloud Messaging analytics and notification tracking.",
    default = false
) {
    compatibleWith(COMPATIBILITY_MASAREEF)

    execute {
        // Disable FCM analytics logging
        runCatching {
            val messagingAnalyticsClass = mutableClassDefBy("Lcom/google/firebase/messaging/MessagingAnalytics;")
            messagingAnalyticsClass.methods
                .filter { 
                    it.name.startsWith("log") || 
                    it.name == "shouldUploadMetrics" ||
                    it.name == "shouldUploadScionMetrics"
                }
                .forEach { method ->
                    if (method.returnType == "Z") { // boolean
                        method.addInstructions(
                            0,
                            """
                                const/4 v0, 0x0
                                return v0
                            """
                        )
                    } else {
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
