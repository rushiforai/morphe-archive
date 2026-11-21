package app.template.patches.spotify.misc

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.SPOTIFY_COMPATIBILITY
import app.template.patches.shared.returnEarly
import app.template.patches.spotify.shared.CanBindAppWidgetPermissionFingerprint
import app.template.patches.spotify.shared.CanBindAppWidgetPermissionNoFlagsFingerprint

// Allows the Spotify widgets to be added to third party launchers.
//
// Spotify gates widget binding behind the BIND_APPWIDGET permission check,
// which in practice only the stock launcher passes. The patch makes the check
// return true, so any launcher can host the widgets.
//
// Fail-safe: the widget fix is optional — when neither permission-check shape
// matches the build, a warning is printed and the rest of the patching
// continues. Only the boolean permission helper is short-circuited.

@Suppress("unused")
val spotifyFixThirdPartyLaunchersWidgetsPatch = bytecodePatch(
    name = "Fix third party launchers widgets",
    description = "Allows the Spotify widgets to be added to third party launchers.",
    default = true,
) {
    compatibleWith(SPOTIFY_COMPATIBILITY)

    execute {
        // Only the stock launcher has the BIND_APPWIDGET permission Spotify checks for.
        val match = CanBindAppWidgetPermissionFingerprint.matchAllOrNull()?.firstOrNull()
            ?: CanBindAppWidgetPermissionNoFlagsFingerprint.matchAllOrNull()?.firstOrNull()

        if (match == null) {
            // Do not fail the whole patching for this optional fix.
            println(
                "[Proteus] Spotify: the BIND_APPWIDGET permission check was not found, " +
                    "skipping the widget fix",
            )
            return@execute
        }

        match.method.returnEarly(true)
    }
}
