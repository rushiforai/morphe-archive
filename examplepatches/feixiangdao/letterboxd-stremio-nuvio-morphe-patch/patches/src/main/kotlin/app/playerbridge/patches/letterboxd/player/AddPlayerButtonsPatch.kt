package app.playerbridge.patches.letterboxd.player

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.playerbridge.patches.shared.Constants.COMPATIBILITY_LETTERBOXD

private const val EXTENSION_CLASS =
    "Lapp/playerbridge/extension/PlayerBridgeExtension;"

/**
 * Adds two independent buttons to Letterboxd film pages:
 * Stremio and Nuvio.
 *
 * Both buttons reuse the IMDb ID already present in Letterboxd's film model.
 */
@Suppress("unused")
val addPlayerButtonsPatch = bytecodePatch(
    name = "Add Stremio + Nuvio buttons",
    description = "Adds separate Stremio and Nuvio buttons to Letterboxd film " +
        "pages. Both open the current film directly using its IMDb ID.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_LETTERBOXD)

    extendWith("extensions/extension.mpe")

    execute {
        UpdateDataFingerprint.method.addInstructions(
            0,
            "invoke-static { v6 }, " +
                "$EXTENSION_CLASS->cacheImdbId(Ljava/lang/Object;)V",
        )

        ConfigureTrailerFingerprint.method.addInstructions(
            0,
            "invoke-static { v1, v2, v4 }, " +
                "$EXTENSION_CLASS->onTrailerConfigured(" +
                "Landroidx/fragment/app/Fragment;" +
                "Ljava/lang/Object;" +
                "Ljava/lang/Object;" +
                ")V",
        )
    }
}
