package anxyis.morphe.patches.pure.deprotect

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import anxyis.morphe.patches.pure.shared.ALIGHT_5270
import anxyis.morphe.patches.pure.shared.clearBody
import anxyis.morphe.patches.pure.shared.matchSingle
import anxyis.morphe.patches.pure.shared.requireMethod

/**
 * StartupLauncher.launch() neutralization.
 *
 * FACT: stock kJ/Kui.<clinit>, android/app/AppComponentFactory.<clinit>
 * (synthetic), androidx/core/app/CoreComponentFactory.<clinit> each call
 * StartupLauncher.launch()V first thing. Tanryu deletes the invoke (3
 * hunks). We instead neutralize launch() itself (clearBody + return-void):
 * identical runtime effect, and it also covers the reflective/other callers
 * without touching 3 call-site methods. The clinit call sites are left
 * calling a no-op (verified harmless: our pipeline's no-engine build boots
 * with the equivalent state).
 */
private object StartupLaunch : Fingerprint(
    definingClass = "Lcom/pairip/StartupLauncher;",
    name = "launch",
    returnType = "V",
    parameters = listOf(),
)

@Suppress("unused")
val startupLauncherKillPatch = bytecodePatch(
    name = "Skip startup lock",
    description = "Skips the startup block so the app opens straight into pro mode.",
) {
    compatibleWith(ALIGHT_5270)
    execute {
        StartupLaunch.matchSingle()
        val m = requireMethod("Lcom/pairip/StartupLauncher;", "launch", emptyList(), "V")
        m.clearBody()
        m.addInstructions(0, "return-void")
    }
}
