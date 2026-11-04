package app.morphe.patches.oraimohealth.launch

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.oraimohealth.shared.COMPATIBILITY_ORAIMO_HEALTH

/**
 * Fingerprint matching run() in LaunchActivity.
 */
object LaunchActivityRunFingerprint : Fingerprint(
    definingClass = "Lcom/transsion/oraimohealth/module/launch/LaunchActivity;",
    name = "run",
    returnType = "V",
    parameters = emptyList()
)

/**
 * Bytecode patch that removes the splash screen countdown timer (0 sec wait)
 * for instant application startup.
 */
@Suppress("unused")
val instantLaunchPatch = bytecodePatch(
    name = "Instant Launch",
    description = "Removes the splash screen countdown timer (0 sec wait) for instant application startup.",
    default = true
) {
    compatibleWith(COMPATIBILITY_ORAIMO_HEALTH)

    execute {
        val launchImmediately = """
            invoke-virtual {p0}, Lcom/transsion/oraimohealth/module/launch/LaunchActivity;->k3()V
            return-void
        """

        LaunchActivityRunFingerprint.method.addInstructions(0, launchImmediately)
    }
}
