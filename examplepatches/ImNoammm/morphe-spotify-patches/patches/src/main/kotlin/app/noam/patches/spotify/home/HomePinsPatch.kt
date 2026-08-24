package app.noam.patches.spotify.home

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.noam.patches.spotify.misc.settings.settingsPatch
import app.noam.patches.spotify.shared.Constants

private const val GRID_INNER_CLASS =
    "Lcom/spotify/home/evopage/element/shortcut/ShortcutsGridElementUI\$createView\$1\$gridLayoutManager\$1;"

@Suppress("unused")
val homePinsPatch = bytecodePatch(
    name = "Pin shortcuts on Home",
    description = "Keeps chosen playlists at the front of the shortcuts grid on Home. The order is " +
        "kept on the device, so it does not depend on what the server sends. Set it under " +
        "Settings, Morphe.",
    default = true,
) {
    compatibleWith(Constants.SPOTIFY_PACKAGE)

    dependsOn(settingsPatch)

    execute {
        val gridType = classDefBy(GRID_INNER_CLASS).fields
            .map { it.type }
            .first { it.startsWith("Lp/") }

        mutableClassDefBy(gridType).methods
            .first {
                it.name == "a" && it.parameterTypes.size == 2 &&
                    it.parameterTypes[0] == "Ljava/lang/Object;"
            }
            .addInstruction(
                0,
                "invoke-static/range { p0 .. p1 }, ${Constants.HOME_PINS_CLASS}->" +
                    "bind(Ljava/lang/Object;Ljava/lang/Object;)V",
            )
    }
}
