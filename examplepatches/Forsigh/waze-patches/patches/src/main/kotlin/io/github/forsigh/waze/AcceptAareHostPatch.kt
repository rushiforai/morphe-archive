package io.github.forsigh.waze

import app.morphe.patcher.patch.bytecodePatch
import io.github.forsigh.waze.WazeConstants.COMPATIBILITY_WAZE

/**
 * Accept AARE (and any other non-Google host) as Waze's car host.
 *
 * Waze's car surface is Car App Library, and Waze ships its own `HostValidator` (androidx class,
 * compiled into classes2.dex) that only allows the packages it was built with - Google's
 * `com.google.android.projection.gearhead` and `com.google.android.apps.maps`. AARE presents
 * `net.prototux.aare` with its own certificate, so `HostValidator.isValidHost()` returns false and
 * the session never starts ("Unrecognized host with uid ...").
 *
 * There is no need to touch the library. Waze's own entry point,
 * `com.waze.car_lib.WazeCarAppService.createHostValidator()`, is written as:
 *
 *     if (!ConfigValues.CONFIG_VALUE_CAR_LIB_VALIDATE_HOST_CONNECTIONS.get().booleanValue())
 *         return HostValidator.ALLOW_ALL_HOSTS_VALIDATOR;
 *     ... builder().addAllowedHost(gearhead, digest).addAllowedHost(maps, digest).build()
 *
 * (verified against 5.28.4.900, classes5.dex, offset 0x38e550: sget-object on the config key,
 * if-nez, then sget-object ALLOW_ALL_HOSTS_VALIDATOR). Flipping that config value off makes Waze
 * pick its own allow-all validator - cleaner than forcing isValidHost to return true, because no
 * library bytecode is touched, nothing is left unreachable for the verifier to argue about, and
 * this is the path Waze itself takes when host validation is disabled.
 *
 * Widen acceptance only: a normal Android Auto session with Google's gearhead still validates the
 * same way, and audio routing is untouched (separate mechanism).
 *
 * Testing note (measured on the Xiaomi 17 and AARE 1.6.0, 2026-11-25): with the row applied, AARE
 * binds `com.waze.car_lib.WazeCarAppService` and negotiates library 1.9.0-alpha03 (API 5..9,
 * negotiated 8), and the map renders. Do not verify with `pm force-stop com.waze`: that sets
 * Android's stopped flag and the car side answers "Could not start Waze beta" until Waze is
 * launched once normally. A plain launch, or `kill -9`, leaves the flag clear.
 */
@Suppress("unused")
val acceptAareHostPatch = bytecodePatch(
    name = "Accept AARE as car host",
    description = "Lets AARE and other non-Google hosts show Waze's car screen.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    category("Android Auto")

    dependsOn(configOverridesPatch)

    execute {
        recordBoolean("aare", false, "CONFIG_VALUE_CAR_LIB_VALIDATE_HOST_CONNECTIONS")
        println(
            "acceptAareHostPatch: host validation off -> WazeCarAppService returns " +
                "ALLOW_ALL_HOSTS_VALIDATOR (AARE, gearhead and any other host accepted)",
        )
    }
}
