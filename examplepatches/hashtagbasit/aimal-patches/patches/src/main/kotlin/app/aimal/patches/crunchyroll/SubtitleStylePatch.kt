package app.aimal.patches.crunchyroll

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val subtitleStylePatch = bytecodePatch(
    name = "Subtitle styling",
    description = "Adds subtitle size, font and outline controls to the player.",
    default = true,
) {
    compatibleWith(CRUNCHYROLL)

    extendWith("extensions/extension.mpe")

    execute {
        // Crunchyroll renders subtitles with libass, straight to bitmaps, so by
        // the time they reach a View there is no text left to restyle. The whole
        // ASS script does pass through here as a String on its way to the native
        // library though, and ASS carries its styling as plain text — so the
        // script is rewritten in place and libass renders the result.
        //
        // p1 is the script; the extension returns the rewritten one, or the
        // original untouched if anything goes wrong.
        SubtitlesLoadTrackFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p1 }, Lapp/aimal/extension/crunchyroll/SubtitleStyler;->restyle(Ljava/lang/String;)Ljava/lang/String;
                move-result-object p1
            """,
        )
    }
}
