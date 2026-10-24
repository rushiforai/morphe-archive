package io.github.forsigh.waze

import app.morphe.patcher.patch.bytecodePatch
import io.github.forsigh.waze.WazeConstants.COMPATIBILITY_WAZE

/**
 * Smoother Android Auto map (opt-in, default off).
 *
 * The car map is fed by the car's GPS through the projection link, and three of Waze's own
 * switches govern how that feed is handled:
 *
 *  - `CAR_LIB_CAR_GPS_FILTERING_ENABLED` gates the car-GPS filtering stage (read in
 *    `com.waze.location.g`, applied in `com.waze.location.k`),
 *  - `AAP_USE_NORMAL_CAR_GPS_UPDATE_RATE` selects the update-rate policy the projection
 *    (AAP) path uses (wired through the `com.waze.modules` chain),
 *  - `CAR_LIB_LISTEN_TO_CAR_COMPASS` makes the car map take heading from the car's compass
 *    (read in `com.waze.car_lib.h.c`).
 *  - 5.25.90.900 renamed the update-rate switch to `GPS_ALIGN_AAP_AND_DEVICE_UPDATE_RATE`
 *    (read in `com.waze.location.af`) and 5.26.0.0 dropped it, so the emitter skips that one; both are recorded, and the
 *    emitter skips whichever the build does not declare.
 *
 * All of them are server-controlled; which side of each switch a given device gets is why one
 * head unit can feel smooth and another choppy. This row forces them on (read-path, like every
 * other override) as the one app-side lever for the car-map feel.
 */
@Suppress("unused")
val aaSmootherMapPatch = bytecodePatch(
    name = "Smoother Android Auto map",
    description = "Smooths map movement on Android Auto.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    category("Android Auto")

    // The emitter patch is what actually writes the keys recorded below; ticking this row alone
    // must still produce a build carrying the overrides.
    dependsOn(configOverridesPatch)

    execute {
        recordBoolean(
            "aas", true,
            "CONFIG_VALUE_CAR_LIB_CAR_GPS_FILTERING_ENABLED",
            "CONFIG_VALUE_AAP_USE_NORMAL_CAR_GPS_UPDATE_RATE",
            "CONFIG_VALUE_GPS_ALIGN_AAP_AND_DEVICE_UPDATE_RATE",
            "CONFIG_VALUE_CAR_LIB_LISTEN_TO_CAR_COMPASS",
        )
        println("aaSmootherMapPatch: forcing car-GPS filtering, normal car-GPS rate and car compass")
    }
}
