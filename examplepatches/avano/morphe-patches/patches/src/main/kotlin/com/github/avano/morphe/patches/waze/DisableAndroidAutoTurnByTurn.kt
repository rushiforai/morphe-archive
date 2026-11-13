package com.github.avano.morphe.patches.waze

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.returnEarly

internal object UpdateTripFingerprint : Fingerprint(
    definingClass = "Landroidx/car/app/navigation/NavigationManager;",
    name = "updateTrip",
    returnType = "V",
    parameters = listOf("Landroidx/car/app/navigation/model/Trip;"),
)

@Suppress("unused")
val disableCarTripUpdatesPatch = patch(
    name = "Disable Android Auto turn-by-turn",
    description = "Stops Waze from turn-by-turn updates to the car's instrument cluster.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY)

    // Make NavigationManager.updateTrip(Trip) a no-op by returning early from the method
    execute {
        UpdateTripFingerprint.method.returnEarly()
    }
}
