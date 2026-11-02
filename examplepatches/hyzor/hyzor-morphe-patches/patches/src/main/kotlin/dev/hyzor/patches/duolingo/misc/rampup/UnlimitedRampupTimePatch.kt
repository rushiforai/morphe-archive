package dev.hyzor.patches.duolingo.misc.rampup

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import dev.hyzor.patches.duolingo.shared.Constants.DUOLINGO
import dev.hyzor.patches.duolingo.shared.integrity.disableLoginIntegrityPatch
import dev.hyzor.patches.util.constructor

private const val SECONDS_PER_HOUR = 3600

/**
 * The RampUp challenge timer is carried by the session state objects: a `Tick` (the per-second
 * timer update) and a `Paused` (timer stopped) each hold the remaining seconds. Both constructors take
 * the seconds as their first parameter, so overwriting it with an hour keeps the timer from ever
 * reaching zero.
 */
@Suppress("unused")
val unlimitedRampupTimePatch = bytecodePatch(
    name = "Unlimited RampUp time",
    description = "The timer for RampUp challenges will never decrease.",
    default = false,
) {
    compatibleWith(DUOLINGO)

    dependsOn(disableLoginIntegrityPatch)

    execute {
        val stateClasses = listOf(
            "Lcom/duolingo/data/session/state/RampupTimerState\$Paused;",
            "Lcom/duolingo/data/session/state/RampupTimerState\$Tick;",
        )

        stateClasses.forEach { className ->
            val clazz = mutableClassDefBy(className)
            val constructor = clazz.constructor
            if (constructor.parameterTypes.firstOrNull()?.toString() != "I") {
                throw PatchException(
                    "Expected ${clazz.type}-><init> to take the remaining seconds as its first int parameter",
                )
            }

            constructor.addInstructions(0, "const p1, $SECONDS_PER_HOUR")
        }
    }
}
