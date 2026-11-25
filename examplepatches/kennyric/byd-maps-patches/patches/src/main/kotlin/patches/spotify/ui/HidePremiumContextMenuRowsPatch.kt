package patches.spotify.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import patches.spotify.COMPATIBILITY_SPOTIFY
import patches.spotify.ContextMenuViewModelConstructorFingerprint
import patches.spotify.shared.EXTENSION
import patches.spotify.shared.EXTENSION_PACKAGE
import patches.spotify.shared.parameterRegister

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/spotify/ContextMenuFilter;"

/**
 * Removes the Download and Jam rows from context menus. These are the rows Spotify decorates with
 * its Premium badge; they cannot do anything for a Free account, so leaving them out is purely a
 * UI change. Playlist, album and track actions remain.
 */
@Suppress("unused")
val hidePremiumContextMenuRowsPatch = bytecodePatch(
    name = "Hide premium context-menu rows",
    description = "Removes Download and Start a Jam (and the related premium-only Jam rows) from " +
        "song, album and playlist context menus. Playback, library and sharing actions stay.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SPOTIFY)
    extendWith(EXTENSION)

    execute {
        val constructor = ContextMenuViewModelConstructorFingerprint.method
        val listIndex = constructor.parameterTypes.indexOfFirst { it.toString() == "Ljava/util/List;" }
        check(listIndex >= 0) { "Spotify context-menu item list changed" }

        val register = constructor.parameterRegister(listIndex)
        constructor.addInstructions(
            0,
            """
                invoke-static/range { v$register .. v$register }, $EXTENSION_CLASS->filter(Ljava/util/List;)Ljava/util/List;
                move-result-object v$register
            """,
        )
    }
}
