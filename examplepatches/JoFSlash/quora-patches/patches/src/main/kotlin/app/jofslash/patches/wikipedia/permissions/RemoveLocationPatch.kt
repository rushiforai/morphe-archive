package app.jofslash.patches.wikipedia.permissions

import app.jofslash.patches.wikipedia.shared.Constants.COMPATIBILITY_WIKIPEDIA
import app.jofslash.patches.wikipedia.shared.editManifest
import app.jofslash.patches.wikipedia.shared.removeNamed
import app.morphe.patcher.patch.resourcePatch

@Suppress("unused")
val removeLocationAccessPatch = resourcePatch(
    name = "Remove location access",
    description = "Removes the location permissions, so the app can never ask for or read your location. " +
            "Only Places (articles about what is near you) uses it: the map still opens and you can move " +
            "it by hand, but it can't jump to where you are.",
    default = false
) {
    category("Privacy")
    compatibleWith(COMPATIBILITY_WIKIPEDIA)

    execute {
        editManifest {
            it.removeNamed(
                "uses-permission",
                setOf(
                    "android.permission.ACCESS_COARSE_LOCATION",
                    "android.permission.ACCESS_FINE_LOCATION",
                )
            )
        }
    }
}
