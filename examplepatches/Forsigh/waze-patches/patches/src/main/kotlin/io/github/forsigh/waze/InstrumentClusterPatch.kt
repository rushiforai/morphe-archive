package io.github.forsigh.waze

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import io.github.forsigh.waze.WazeConstants.COMPATIBILITY_WAZE

/**
 * Instrument cluster support (opt-in, default off).
 *
 * Waze ships a full cluster experience gated behind server config: the enable flag is read in
 * `com.waze.car_lib.e.b` (the cluster start gate; the cluster screen classes in `com.waze.car_lib.e`
 * then decide "starting cluster map"), and three content flags toggle what the cluster shows.
 * Cars with a digital cluster (AA FEATURE_CLUSTER) get the Waze map / alerts / instructions and ETA
 * only when Waze's server allows it for that car - this row forces the whole set on.
 */
@Suppress("unused")
val instrumentClusterPatch = bytecodePatch(
    name = "Instrument cluster support",
    description = "Shows the map and alerts on the car's cluster screen.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    category("Experimental")

    dependsOn(configOverridesPatch)

    val large by booleanOption(
        "large", true,
        title = "Large cluster layout",
        description = "Uses the bigger layout on the cluster. Stock: small.",
    )

    execute {
        recordBoolean(
            "clu", true,
            "CONFIG_VALUE_CAR_LIB_INSTRUMENT_CLUSTER_ENABLED",
            "CONFIG_VALUE_CAR_LIB_INSTRUMENT_CLUSTER_ALERTS_ENABLED",
            "CONFIG_VALUE_CAR_LIB_INSTRUMENT_CLUSTER_INSTRUCTIONS_AND_ETA_ENABLED",
            "CONFIG_VALUE_CAR_LIB_INSTRUMENT_CLUSTER_MAP_POIS_ENABLED",
        )
        if (large == true) recordBoolean("clu", true, "CONFIG_VALUE_AAOS_LCV_SUPPORT_ENABLED")
        println("instrumentClusterPatch: cluster map, alerts, instructions/ETA and map POIs forced on, large = ${if (large == true) "on" else "stock"}")
    }
}
