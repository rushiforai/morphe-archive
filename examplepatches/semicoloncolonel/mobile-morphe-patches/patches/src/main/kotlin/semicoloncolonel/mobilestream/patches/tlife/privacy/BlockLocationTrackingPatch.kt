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

@Suppress("unused")
val blockLocationTrackingPatch = bytecodePatch(
    name = "Block location tracking",
    description = "Stops Radar, which sends your location to Radar's servers every 30 seconds " +
        "while T-Life runs. May affect store check-in and location-based offers.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val count = forEachMatchingMethod(
            { it.type == "Lio/radar/sdk/Radar;" },
            { it.name == "initialize" && it.returnType == "V" },
        ) { it.returnEarly("return-void") }
        if (count == 0) throw PatchException("Radar initialize not found")
    }
}
