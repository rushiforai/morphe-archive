package app.severit.patches.strava.theme

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.decode
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.patch.stringOption
import app.severit.patches.strava.shared.Constants.COMPATIBILITY_STRAVA
import java.util.logging.Logger

private val logger = Logger.getLogger("CustomRouteColorPatch")

/**
 * Map line colors of Strava 480.15. The map screens read these by resource id and pass them
 * to Mapbox, in light and dark theme:
 * - `map_polyline_primary`: route / activity / segment line on the map screens.
 * - `map_polyline_secondary`, `map_polyline_tertiary`: lighter companion lines, such as
 *   segments shown while recording.
 * - `map_polyline_record`: the live line while recording an activity.
 */
private const val PRIMARY = "map_polyline_primary"
private const val SECONDARY = "map_polyline_secondary"
private const val TERTIARY = "map_polyline_tertiary"
private const val RECORD = "map_polyline_record"

@Suppress("unused")
val customRouteColorPatch = patch(
    name = "Custom map route color",
    description = "Changes the color of route and activity lines drawn on maps, " +
        "independently of the accent color.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_STRAVA)

    val routeColor by stringOption(
        key = "routeColor",
        default = "#E53935",
        values = COLOR_PRESETS,
        title = "Route color",
        description = "Hex color (#RRGGBB) of route and activity lines on maps. " +
            "Lighter secondary lines are generated from it.",
        required = true,
    ) { AccentPalette.parseRgb(it) != null }

    val recordingColor by stringOption(
        key = "recordingColor",
        default = null,
        values = COLOR_PRESETS,
        title = "Recording line color",
        description = "Hex color (#RRGGBB) of the live line while recording. " +
            "Leave empty to keep Strava's blue.",
    ) { it.isNullOrBlank() || AccentPalette.parseRgb(it) != null }

    // Runs after every patch's execute block, so the accent color patch
    // cannot remap these colors afterwards (for example when the route is Strava orange).
    finalize {
        val route = AccentPalette.parseRgb(routeColor)
            ?: throw PatchException("Invalid route color: $routeColor (expected #RRGGBB)")
        val recording = recordingColor?.takeIf { it.isNotBlank() }?.let {
            AccentPalette.parseRgb(it) ?: throw PatchException("Invalid recording color: $it (expected #RRGGBB)")
        }

        // Same steps as Strava's own: secondary is orange o5 (40% tint), tertiary is o6 (60% tint).
        val colors = buildMap {
            put(PRIMARY, route)
            put(SECONDARY, tint(route, 0.4))
            put(TERTIARY, tint(route, 0.6))
            if (recording != null) put(RECORD, recording)
        }

        var count = 0
        decode("res/values*/colors.xml").forEach { path ->
            val file = resourceFile(path)
            var text = file.readText()
            colors.forEach { (name, rgb) ->
                val element = Regex("""(<color\s+name="$name"\s*>)[^<]*(</color>)""")
                text = element.replace(text) { match ->
                    count++
                    "${match.groupValues[1]}#ff${"%06x".format(rgb)}${match.groupValues[2]}"
                }
            }
            file.writeText(text)
        }

        if (count == 0) throw PatchException("No map line colors found. This Strava version may use other names.")
        logger.info("Set $count map line colors")
    }
}
