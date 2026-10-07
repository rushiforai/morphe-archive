package app.twoeno.patches.spotify.misc

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.twoeno.patches.shared.Constants.COMPATIBILITY_SPOTIFY
import app.twoeno.patches.spotify.CanBindAppWidgetPermissionFingerprint

@Suppress("unused")
val fixThirdPartyLaunchersWidgetsPatch = bytecodePatch(
    name = "Fix third party launchers widgets",
    description = "Allows the Spotify widgets to be added to third party launchers.",
) {
    compatibleWith(COMPATIBILITY_SPOTIFY)

    execute {
        // Only the stock launcher has the BIND_APPWIDGET permission Spotify checks for.
        CanBindAppWidgetPermissionFingerprint.method.returnEarly(true)
    }
}
