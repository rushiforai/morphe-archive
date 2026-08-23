package app.noam.patches.spotify.lyrics

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.noam.patches.spotify.misc.settings.settingsPatch
import app.noam.patches.spotify.shared.Constants

@Suppress("unused")
val beautifulLyricsPatch = bytecodePatch(
    name = "Beautiful lyrics",
    description = "Draws the full screen lyrics larger, with more space between the lines and a " +
        "gradient behind them, closer to the desktop player. Turned on under Settings, Morphe.",
    default = true,
) {
    compatibleWith(Constants.SPOTIFY_PACKAGE)

    dependsOn(settingsPatch)

    execute {
        // Restyling happens once the page has been laid out, so hooking its creation is enough.
        LyricsPageOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, ${Constants.BEAUTIFUL_LYRICS_CLASS}->" +
                "onLyricsCreated(Landroid/app/Activity;)V",
        )
    }
}
