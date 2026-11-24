package io.github.forsigh.waze

import app.morphe.patcher.patch.bytecodePatch
import io.github.forsigh.waze.WazeConstants.COMPATIBILITY_WAZE

/**
 * Live drive sharing (opt-in).
 *
 * Waze ships a share-a-live-drive-link feature that the client keeps off behind
 * CONFIG_VALUE_SHARE_DRIVE_FEATURE_ENABLED and exposes nowhere in the UI. Forcing it true puts the
 * entry point back; the service behind it is Waze's own, so it needs no provisioning.
 */
@Suppress("unused")
val liveDriveSharingPatch = bytecodePatch(
    name = "Live drive sharing",
    description = "Adds the hidden share-your-drive link.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    category("Driving & Voice")

    dependsOn(configOverridesPatch)

    execute {
        // The map entry point ANDs these two; forcing only the feature flag left the button hidden
        // whenever the server's entry-point switch is off.
        recordBoolean(
            "lds", true,
            "CONFIG_VALUE_SHARE_DRIVE_FEATURE_ENABLED",
            "CONFIG_VALUE_SHARE_DRIVE_BUTTON_BACK_ENTRY_POINT_ENABLED",
        )
        println("liveDriveSharingPatch: share drive enabled")
    }
}
