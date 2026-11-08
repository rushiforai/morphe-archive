package app.morphe.patches.instants

import app.morphe.patcher.patch.resourcePatch
import java.util.Base64

/**
 * Replaces the launcher icon with a "W" icon.
 *
 * The app icon is an adaptive icon (`mipmap/moonshot_launcher_icon`) made of a background and a
 * foreground (`mipmap/moonshot_launcher_foreground`, one PNG per density). Nothing else in the app
 * uses the foreground, so replacing its PNGs is enough. The new foreground is opaque and covers the
 * whole canvas, so the original background underneath is no longer visible.
 */
@Suppress("unused")
val instantsIconPatch = resourcePatch {
    compatibleWith(INSTANTS_COMPATIBILITY)

    execute {
        // One image per density: the system picks the closest one, so all are replaced.
        INSTANTS_ICON_FOREGROUND.forEach { (density, data) ->
            get("res/mipmap-$density/moonshot_launcher_foreground.png")
                .writeBytes(Base64.getDecoder().decode(data))
        }
    }
}
