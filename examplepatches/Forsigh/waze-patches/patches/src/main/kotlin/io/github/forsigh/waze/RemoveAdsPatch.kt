package io.github.forsigh.waze

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import io.github.forsigh.waze.WazeConstants.COMPATIBILITY_WAZE

/**
 * PROVENANCE: extended with keys ported from bearinmindcat/morphe-patches (GPLv3, release
 * v2.5.5) - see `CREDITS.md`.
 */
@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Removes ads.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    category("Privacy & Updates")

    // The emitter patch is what actually writes the keys recorded below. Depending on it means this
    // patch can be ticked alone and still produce a build where the override exists — without the
    // dependency the key is collected and never written, which looks exactly like a working patch.
    dependsOn(configOverridesPatch)

    val beacons by booleanOption(
        "beacons", true,
        title = "Block beacon popups",
        description = "Waze's promotional beacon popups. Stock: shown.",
    )

    execute {
        // All Boolean (com/waze/config/b) keys, so must hook the Boolean getter.
        recordBoolean(
                "ads", false,
                "CONFIG_VALUE_AD_EVENTS_FEATURE_ENABLED",
                "CONFIG_VALUE_ADS_AI_BADGE_ENABLED",
                "CONFIG_VALUE_ADS_INVENTORY_PREDICTION_ENABLED",
                "CONFIG_VALUE_ADS_ALLOW_PROFILE_TARGETING",
                "CONFIG_VALUE_ADS_ALLOW_PROFILE_TARGETING_DEFAULT",
                "CONFIG_VALUE_GOOGLE_ADS_FEATURE_ENABLED",
                "CONFIG_VALUE_GOOGLE_ADS_IN_CAR_ENABLED",
                "CONFIG_VALUE_GOOGLE_ADS_DISCOVERY_PINS_ENABLED",
            )
        if (beacons == true) recordBoolean("ads", true, "CONFIG_VALUE_BEACONS_POPUP_OPTOUT")
        // Long keys: pin limits to zero, the "takeover" ad timer to about once a lifetime,
        // partner pins ("external POIs") off.
        recordLong(
                "ads",
                "CONFIG_VALUE_GOOGLE_ADS_MAX_CONCURRENT_PINS" to 0L,
                "CONFIG_VALUE_GOOGLE_ADS_IN_CAR_MAX_CONCURRENT_PINS" to 0L,
                "CONFIG_VALUE_ZSPEED_MIN_TAKEOVER_REQUEST_INTERVAL_SEC" to 2_000_000_000L,
                "CONFIG_VALUE_EXTERNALPOI_MAX_POIS_DISPLAY" to 0L,
            )
        // The promotional splash screens Waze's server can switch on at start.
        recordString("ads", "CONFIG_VALUE_APP_LAUNCH_DYNAMIC_SPLASH_SCREEN_SHOW_FREQUENCY" to "OFF")
        println("removeAdsPatch: map, in-car and takeover ads forced off")
    }
}
