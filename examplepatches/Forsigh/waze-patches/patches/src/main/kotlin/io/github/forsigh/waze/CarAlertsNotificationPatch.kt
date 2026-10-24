package io.github.forsigh.waze

import app.morphe.patcher.patch.bytecodePatch
import io.github.forsigh.waze.WazeConstants.COMPATIBILITY_WAZE

/**
 * Alerts as car notifications (opt-in, default off).
 *
 * `CONFIG_VALUE_CAR_LIB_ALERTS_USING_NOTIFICATION` selects the car notification presenter
 * (`com.waze.car_lib.a.h`, the notificationManager; presenter wiring in `com.waze.car_lib.a.f`)
 * instead of the in-map-only alert surface. Forcing it on makes police and hazard alerts also
 * arrive as car notifications.
 */
@Suppress("unused")
val carAlertsNotificationPatch = bytecodePatch(
    name = "Car alerts as notifications",
    description = "Shows car alerts as notifications.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    category("Android Auto")

    dependsOn(configOverridesPatch)

    execute {
        recordBoolean("can", true, "CONFIG_VALUE_CAR_LIB_ALERTS_USING_NOTIFICATION")
        println("carAlertsNotificationPatch: car notification alerts forced on")
    }
}
