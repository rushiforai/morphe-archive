package semicoloncolonel.mobilestream.patches.tlife.privacy

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.shared.misc.forEachMatchingMethod
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly
import semicoloncolonel.mobilestream.patches.tlife.shared.Constants

// T-Life 12.3.1 starts Radar after sign-in: a location update every 30
// seconds at high accuracy, every update synced to Radar's servers, tagged
// with the device ID, plus geofences and IP geolocation. Radar is never
// initialized, and every Radar call then returns at once or reports an
// error to its callback, which the app already handles.
//
// From 12.4.0 the Radar class is renamed and moved out of io.radar.sdk, so it
// is found by its public method names, which the build keeps.

private val RADAR_METHODS = setOf("initialize", "autocomplete", "trackOnce")

@Suppress("unused")
val blockLocationTrackingPatch = bytecodePatch(
    name = "Block location tracking",
    description = "Stops Radar, which sends your location to its servers every 30 seconds.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val count = forEachMatchingMethod(
            { classDef ->
                classDef.type == "Lio/radar/sdk/Radar;" ||
                    classDef.methods.map { it.name }.toSet().containsAll(RADAR_METHODS)
            },
            { it.name == "initialize" && it.returnType == "V" },
        ) { it.returnEarly("return-void") }
        if (count == 0) throw PatchException("Radar initialize not found")
    }
}
