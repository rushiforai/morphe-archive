package patches.negentwee

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val fixPairipStartup = bytecodePatch(
    name = "Fix PairIP startup",
    description = "Stops 9292's local Play licensing entry point from redirecting re-signed builds to Play and scheduling shutdown. Preserves native application initialization, journeys, tickets and payment checks.",
) {
    dependsOn(originalInput)
    compatibleWith(negentwee)
    execute {
        exact("Lcom/pairip/licensecheck/LicenseClient;",
            "checkLicense(Landroid/content/Context;)V", 9, 3, 16)
            .addInstructions(0, "return-void")
    }
}
