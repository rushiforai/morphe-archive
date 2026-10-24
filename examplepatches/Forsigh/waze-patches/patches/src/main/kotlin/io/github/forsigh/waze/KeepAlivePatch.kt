package io.github.forsigh.waze

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.intOption
import app.morphe.patcher.patch.stringOption
import io.github.forsigh.waze.WazeConstants.COMPATIBILITY_WAZE

/**
 * Keep Waze alive (opt-in, default off).
 *
 * One row for the three places Waze closes itself, because from the outside it is one wish:
 *
 *  - phone: `CONFIG_VALUE_POWER_BACKGROUND_TIMEOUT_MS` is Waze's own background timeout when no
 *    route is running. Waze's cap is 10 minutes; it still closes when you close it.
 *  - Android Auto projection: `CONFIG_VALUE_AAP_SHUTDOWN_DEFERRING_ENABLED` (the `deferShutdown`
 *    gate in `com.waze.car_lib.bo`) plus `CONFIG_VALUE_AAP_SHUTDOWN_DELAY_ON_MAIN_SERVICE_DESTROY_MS`,
 *    the window `com.waze.car_lib.bh.f()` waits before shutting the service down. A reconnect
 *    inside the window cancels the shutdown, so re-entering the car resumes instead of cold-starting.
 *  - Android Automotive: `CONFIG_VALUE_AAOS_KEEP_APP_ALIVE_ON_MAIN_SERVICE_DESTROY` (read in
 *    `com.waze.car_lib.bo` and `com.waze.bw.a.a.b`) survives the car unit restarting Waze's main
 *    service. Harmless on a projection-only setup.
 *
 * The `where` option picks the surface; `minutes` drives both time-based gates.
 *
 * PROVENANCE: the phone timeout is ported from bearinmindcat/morphe-patches (GPLv3, v2.5.5) -
 * see `CREDITS.md`.
 */
@Suppress("unused")
val keepAlivePatch = bytecodePatch(
    name = "Keep Waze alive",
    description = "Stops Waze closing when you leave it.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    category("Experimental")

    dependsOn(configOverridesPatch)

    val where by stringOption(
        "where", "everywhere",
        mapOf(
            "Everywhere" to "everywhere",
            "Phone only" to "phone",
            "Android Auto only" to "auto",
            "Car unit only" to "car",
        ),
        title = "Where",
        description = "Which surface stays alive.",
    )

    val minutes by intOption(
        key = "minutes", default = 10,
        title = "Minutes alive",
        description = "Phone background timeout and the Android Auto shutdown delay. Waze's own cap is 10.",
    )

    execute {
        val w = where ?: "everywhere"
        val m = minutes ?: 10

        if (w == "everywhere" || w == "phone") {
            recordLong("ka", "CONFIG_VALUE_POWER_BACKGROUND_TIMEOUT_MS" to m * 60_000L)
        }
        if (w == "everywhere" || w == "auto") {
            recordBoolean("ka", true, "CONFIG_VALUE_AAP_SHUTDOWN_DEFERRING_ENABLED")
            recordLong("ka", "CONFIG_VALUE_AAP_SHUTDOWN_DELAY_ON_MAIN_SERVICE_DESTROY_MS" to m * 60_000L)
        }
        if (w == "everywhere" || w == "car") {
            recordBoolean("ka", true, "CONFIG_VALUE_AAOS_KEEP_APP_ALIVE_ON_MAIN_SERVICE_DESTROY")
        }

        println("keepAlivePatch: $w, $m minute(s)")
    }
}
