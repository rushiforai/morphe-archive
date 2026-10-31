package io.github.forsigh.waze

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import io.github.forsigh.waze.WazeConstants.COMPATIBILITY_WAZE

/**
 * Auto zoom.
 *
 * Waze already ships this preference itself: `CONFIG_VALUE_ROUTING_AUTO_ZOOM` is a String config
 * whose settings row (`com/waze/settings/fh.smali`) cycles the values "no" / "yes" / "speed".
 * The map reads the same key as a StateFlow (`com/waze/map/gb.smali`).
 *
 * So this patch does not invent a feature - it pins the existing one. Hooking the READ getter
 * (rather than seeding a config file) is what makes the choice stick: Waze re-syncs config from
 * the server, which reverts a written value but cannot bypass a getter that returns ours.
 */
@Suppress("unused")
val autoZoomPatch = bytecodePatch(
    name = "Auto zoom",
    description = "Keeps your auto-zoom choice from being reset.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    category("Map & Alerts")

    // The emitter patch is what actually writes the keys recorded below. Depending on it means this
    // patch can be ticked alone and still produce a build where the override exists — without the
    // dependency the key is collected and never written, which looks exactly like a working patch.
    dependsOn(configOverridesPatch)

    val mode by stringOption(
        "mode", "speed", mapOf("no" to "no", "yes" to "yes", "speed" to "speed"),
        title = "Auto-zoom mode",
        description = "speed = zoom out progressively with speed, yes = always on, no = off.",
    )

    execute {
        recordString("azm", "CONFIG_VALUE_ROUTING_AUTO_ZOOM" to (mode ?: "speed"))
    }
}
