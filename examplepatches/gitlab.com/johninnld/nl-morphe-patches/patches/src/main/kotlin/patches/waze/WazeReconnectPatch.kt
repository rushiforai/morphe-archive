package patches.waze

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.intOption
import patches.waze.CatalogCompatibility.COMPATIBILITY_WAZE

/** Projection-only subset of Forsigh/waze-patches' Keep Waze alive (GPLv3). */
@Suppress("unused")
val wazeCarReconnectPatch = bytecodePatch(
    name = "Car reconnect grace period",
    description = "Defers Android Auto projection shutdown for brief disconnections. Leaves the phone background timeout unchanged.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    dependsOn(wazeConfigOverridesPatch)

    val minutes by intOption(
        key = "minutes", default = 2, title = "Reconnect grace period (minutes)",
        description = "1 to 10 minutes. Also editable in Customization; restart Waze/reconnect to apply.",
        required = true,
    )

    execute {
        val duration = minutes ?: throw PatchException("Choose a reconnect grace period")
        if (duration !in 1..10) throw PatchException("Reconnect grace period must be 1 to 10 minutes")
        keepWazeConfig("carReconnect", "CONFIG_VALUE_AAP_SHUTDOWN_DEFERRING_ENABLED", true)
        keepWazeConfig("carReconnect", "CONFIG_VALUE_AAP_SHUTDOWN_DELAY_ON_MAIN_SERVICE_DESTROY_MS", duration * 60_000)
    }
}
