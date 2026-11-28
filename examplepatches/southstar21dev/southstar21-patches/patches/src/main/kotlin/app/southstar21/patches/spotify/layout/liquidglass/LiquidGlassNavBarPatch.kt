package app.southstar21.patches.spotify.layout.liquidglass

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.intOption
import app.southstar21.patches.spotify.misc.extension.markSpotifyPatchIncluded
import app.southstar21.patches.spotify.misc.extension.spotifySharedExtensionPatch
import app.southstar21.patches.spotify.shared.Constants.COMPATIBILITY_SPOTIFY

private const val EXTENSION_CLASS =
    "Lapp/southstar21/extension/spotify/liquidglass/LiquidGlassNavBarPatch;"

private fun extensionMethod(name: String, returnType: String) = Fingerprint(
    definingClass = EXTENSION_CLASS,
    name = name,
    returnType = returnType,
    parameters = listOf(),
)

@Suppress("unused")
val spotifyLiquidGlassNavBarPatch = bytecodePatch(
    name = "Liquid Glass navigation bar",
    description = "Turns the bottom tab bar and the mini player above it into floating iOS 26 style " +
            "Liquid Glass with live background blur and edge refraction. " +
            "Refraction needs Android 13+, blur needs Android 12+, older versions get a tinted pill.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SPOTIFY)

    dependsOn(spotifySharedExtensionPatch)

    val blurRadius by intOption(
        key = "blurRadius",
        default = 4,
        values = mapOf(
            "Clear" to 2,
            "Default" to 4,
            "Frosted" to 12,
        ),
        title = "Blur radius",
        description = "Blur applied to content behind the bar, in dp.",
        required = true,
    ) { it!! in 0..40 }

    val refractionStrength by intOption(
        key = "refractionStrength",
        default = 100,
        values = mapOf(
            "Off" to 0,
            "Subtle" to 30,
            "Medium" to 60,
            "Default" to 100,
        ),
        title = "Refraction strength",
        description = "How strongly the glass edge bends the content behind it, from 0 to 100.",
        required = true,
    ) { it!! in 0..100 }

    val southstar21Style by booleanOption(
        key = "southstar21Style",
        default = true,
        title = "southstar21 style",
        description = "Thicker glass, and a press swells the selection into a magnifying drop of glass " +
                "that wobbles and stretches as you drag it.",
        required = true,
    )

    execute {
        extensionMethod("blurRadiusDp", "I").method.addInstructions(
            0,
            """
                const/16 v0, $blurRadius
                return v0
            """
        )
        extensionMethod("refractionPercent", "I").method.addInstructions(
            0,
            """
                const/16 v0, $refractionStrength
                return v0
            """
        )
        extensionMethod("southstar21Style", "Z").method.addInstructions(
            0,
            """
                const/4 v0, ${if (southstar21Style == true) 1 else 0}
                return v0
            """
        )

        markSpotifyPatchIncluded(EXTENSION_CLASS)
    }
}
