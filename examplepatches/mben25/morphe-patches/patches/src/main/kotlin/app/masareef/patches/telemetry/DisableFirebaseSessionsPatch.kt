package app.masareef.patches.telemetry

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.masareef.patches.shared.Constants.COMPATIBILITY_MASAREEF

@Suppress("unused")
val disableFirebaseSessionsPatch = bytecodePatch(
    name = "Disable Firebase Sessions",
    description = "Disables Firebase Sessions tracking and telemetry.",
    default = false
) {
    compatibleWith(COMPATIBILITY_MASAREEF)

    execute {
        // Disable Firebase Sessions
        runCatching {
            val firebaseSessionsClass = mutableClassDefBy("Lcom/google/firebase/sessions/FirebaseSessions;")
            firebaseSessionsClass.methods
                .filter { it.name == "register" || it.name == "checkForAutoDataCollectionEnabled" }
                .forEach { method ->
                    if (method.returnType == "Z") {
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
        
        // Disable session publisher
        runCatching {
            val sessionPublisherClass = mutableClassDefBy("Lcom/google/firebase/sessions/SessionFirelogPublisher;")
            sessionPublisherClass.methods
                .filter { it.name.contains("log") || it.name.contains("publish") }
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
