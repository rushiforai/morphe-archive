package app.azk.stremio.aniskip

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch

private const val EXTENSION_CLASS = "Lapp/azk/stremio/aniskip/AniSkipBridge;"
private const val MOD_VERSION = "1.1.1"
private const val REPOSITORY_URL = "https://github.com/AzukiSensei/aniskip-stremio"

/** Adds the AniSkip overlay bridge whenever Stremio attaches a Media3 player. */
val aniSkipPatch = bytecodePatch(
    name = "Stremio AniSkip",
    description = "Adds intro, outro and recap skip controls for anime playback in Stremio.\n\n" +
        "AniSkip v$MOD_VERSION\n" +
        "Repository: $REPOSITORY_URL",
    default = true,
) {
    val debugOption = booleanOption(
        key = "debug",
        default = false,
        title = "Activer le mode debug",
        description = "Ouvre le journal AniSkip au démarrage du lecteur pour diagnostiquer le titre, la saison, l’épisode et les requêtes API.",
    )

    compatibleWith(Constants.STREMIO_COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        val hookName = if (debugOption.value == true) "onPlayerSetDebug" else "onPlayerSet"
        PlayerViewSetPlayerFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p0, p1}, $EXTENSION_CLASS->$hookName(Landroid/view/View;Landroidx/media3/common/Player;)V
            """.trimIndent(),
        )
    }
}
