package app.pablobaro.patches.spotify.misc

import app.morphe.patcher.patch.bytecodePatch
import app.pablobaro.patches.shared.Constants.COMPATIBILITY_SPOTIFY
import app.pablobaro.patches.shared.returnEarly
import app.pablobaro.patches.spotify.CanBindAppWidgetPermissionFingerprint
import app.pablobaro.patches.spotify.CanBindAppWidgetPermissionNoFlagsFingerprint
import java.util.logging.Logger

@Suppress("unused")
val fixThirdPartyLaunchersWidgetsPatch = bytecodePatch(
    name = "Fix third party launchers widgets",
    description = "Allows the Spotify widgets to be added to third party launchers.",
) {
    compatibleWith(COMPATIBILITY_SPOTIFY)

    finalize {
        // Runs in finalize, after every Spicetify patch has executed: those verify Spotify's
        // classes against pinned hashes, which must see the classes before this patch edits them.
        // Only the stock launcher has the BIND_APPWIDGET permission Spotify checks for.
        val match = CanBindAppWidgetPermissionFingerprint.matchOrNull()
            ?: CanBindAppWidgetPermissionNoFlagsFingerprint.matchOrNull()

        if (match == null) {
            // Do not fail the whole patching for this optional fix.
            Logger.getLogger(this::class.java.name).warning(
                "The BIND_APPWIDGET permission check was not found, skipping the widget fix"
            )
            return@finalize
        }

        match.method.returnEarly(true)
    }
}
