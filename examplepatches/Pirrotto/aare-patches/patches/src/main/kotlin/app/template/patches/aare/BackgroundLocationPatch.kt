package app.template.patches.aare

import app.morphe.patcher.patch.patch
import app.template.patches.shared.Constants.COMPATIBILITY_AARE
import app.template.patches.shared.addManifestPermission

private const val BACKGROUND_LOCATION = "android.permission.ACCESS_BACKGROUND_LOCATION"

/**
 * AARE asks for the location foreground-service type so the hosted navigation app keeps GPS while
 * the phone is locked (ProjectionService.goForeground()). When the projection starts in the
 * background, for example from the car's Bluetooth connection, Android 14+ refuses that type unless
 * the app holds ACCESS_BACKGROUND_LOCATION, which AARE does not declare. AARE then runs without it
 * and the navigation app (e.g. Vela Maps) loses location as soon as the screen turns off.
 *
 * Declaring the permission lets the user pick "Allow all the time" for AARE in the system settings,
 * which makes the location type available after a background start too.
 */
@Suppress("unused")
val backgroundLocationPatch = patch(
    name = "Background location",
    description = "Declares the background location permission, so that after choosing " +
        "\"Allow all the time\" for AARE in the system settings, navigation apps keep GPS " +
        "with the phone locked even when AARE starts the car connection in the background.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_AARE)

    // Its switch on the Settings screen shows the permission and opens it.
    dependsOn(settingsPatch)

    execute {
        addManifestPermission(BACKGROUND_LOCATION)
        registerSetting("background_location")
    }
}
