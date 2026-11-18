package patches.spotify.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import patches.spotify.COMPATIBILITY_SPOTIFY
import patches.spotify.shared.EXTENSION
import patches.spotify.shared.EXTENSION_PACKAGE

private const val SETTINGS_SCREEN = "Lp/rs51;"
private const val FILTER = "$EXTENSION_PACKAGE/spotify/SettingsFilter;"

/**
 * Removes the settings sections that only lead to a Premium wall: advertising, download quality,
 * downloads and streaming, offline, storage and the DJ. Every settings page is modelled as a list
 * of sections; filtering that list leaves every other settings row untouched.
 */
@Suppress("unused")
val hidePremiumSettingsSectionsPatch = bytecodePatch(
    name = "Hide premium settings sections",
    description = "Removes Advertising, Download quality, Downloads and streaming, Offline, Storage " +
        "and DJ sections from Settings. Playback, account, social and car settings stay.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SPOTIFY)
    extendWith(EXTENSION)

    execute {
        val owner = mutableClassDefBy(SETTINGS_SCREEN)
        val constructor = owner.methods.singleOrNull { method ->
            method.name == "<init>" &&
                method.returnType == "V" &&
                method.parameterTypes.map(CharSequence::toString) ==
                listOf("Lp/ugx;", "Lp/t121;", "Lp/s810;", "Ljava/util/List;", "Ljava/util/List;")
        } ?: throw IllegalStateException("Spotify settings screen model changed")

        constructor.addInstructions(
            0,
            """
                invoke-static {p4}, $FILTER->filterSections(Ljava/util/List;)Ljava/util/List;
                move-result-object p4
                invoke-static {p5}, $FILTER->filterSections(Ljava/util/List;)Ljava/util/List;
                move-result-object p5
            """,
        )
    }
}
