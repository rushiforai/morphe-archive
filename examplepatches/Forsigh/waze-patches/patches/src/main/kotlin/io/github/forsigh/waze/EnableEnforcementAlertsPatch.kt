package io.github.forsigh.waze

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import io.github.forsigh.waze.WazeConstants.COMPATIBILITY_WAZE

/**
 * PROVENANCE: extended with the police key ported from bearinmindcat/morphe-patches
 * (GPLv3, release v2.5.5) - see `CREDITS.md`.
 */
@Suppress("unused")
val enableEnforcementAlertsPatch = bytecodePatch(
    name = "Enable police & enforcement alerts",
    description = "Turns police and enforcement alerts on.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WAZE)

    // The emitter patch is what actually writes the keys recorded below. Depending on it means this
    // patch can be ticked alone and still produce a build where the override exists — without the
    // dependency the key is collected and never written, which looks exactly like a working patch.
    dependsOn(configOverridesPatch)

    execute {
        recordBoolean(
                "enf", true,
                "CONFIG_VALUE_ALERTS_ENABLE_ENFORCEMENT_ALERTS",
            )
        // The police flag is a String (com/waze/config/d) key: "yes" switches police alerts on.
        recordString("enf", "CONFIG_VALUE_ALERTS_ENABLE_ENFORCEMENT_POLICE" to "yes")
        println("enableEnforcementAlertsPatch: police and enforcement alerts forced on")
    }
}
