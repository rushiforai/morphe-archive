package app.spicetify.patches.spotify.theme

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.spicetify.patches.spotify.spotifyCompatibility

@Suppress("unused")
val themePatch = resourcePatch(
    name = "Theme colors",
    description = "Changes selected background and accent color resources; defaults to AMOLED black. " +
        "Some screens, hardcoded colors, and animations retain Spotify's colors.",
    default = false,
) {
    compatibleWith(spotifyCompatibility)

    val backgroundColor by stringOption(
        key = "backgroundColor",
        default = "#FF000000",
        title = "Primary background color",
        description = "Background color in #RRGGBB or #AARRGGBB format.",
        required = true,
    )
    val accentColor by stringOption(
        key = "accentColor",
        default = "#FF1ED760",
        title = "Accent color",
        description = "Accent color in #RRGGBB or #AARRGGBB format.",
        required = true,
    )
    val pressedAccentColor by stringOption(
        key = "pressedAccentColor",
        default = "#FF1ABC54",
        title = "Pressed accent color",
        description = "Pressed accent color in #RRGGBB or #AARRGGBB format.",
        required = true,
    )

    execute {
        // setOptions catches option validator errors and silently retains defaults.
        // Validate the submitted values here so invalid colors fail the patch.
        val colors = ThemeColors(
            background = requireNotNull(backgroundColor) { "Primary background color is required." },
            accent = requireNotNull(accentColor) { "Accent color is required." },
            pressedAccent = requireNotNull(pressedAccentColor) { "Pressed accent color is required." },
        )
        document("res/values/colors.xml").use { applyThemeColors(it, colors) }
    }
}
