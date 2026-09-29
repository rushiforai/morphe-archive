package hoodles.morphe.patches.duolingo.misc.rampup

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import hoodles.morphe.compatibility.Compat
import hoodles.morphe.patches.duolingo.shared.integrity.disableLoginIntegrityPatch
import hoodles.morphe.util.constructor

@Suppress("unused")
val unlimitedRampupTimePatch = bytecodePatch(
    name = "Unlimited RampUp time",
    description = "The timer for RampUp challenges will never decrease.",
    default = false
) {
    compatibleWith(Compat.DUOLINGO)

    dependsOn(disableLoginIntegrityPatch)

    execute {
        val timeInSec = 3600

        val stateClasses = listOf(
            "Lcom/duolingo/data/session/state/RampupTimerState\$Paused;",
            "Lcom/duolingo/data/session/state/RampupTimerState\$Tick;"
        )

        stateClasses.forEach { className ->
            val clazz = mutableClassDefBy(className)
            clazz.constructor.addInstructions(0,
                "const p1, $timeInSec")
        }
    }
}