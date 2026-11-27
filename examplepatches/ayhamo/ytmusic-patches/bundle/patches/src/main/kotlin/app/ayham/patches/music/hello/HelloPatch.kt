package app.ayham.patches.music.hello

import app.ayham.patches.music.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.patch

private const val EXTENSION_CLASS = "Lapp/ayham/extension/music/HelloPatch;"

internal object MusicActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/apps/youtube/music/activities/MusicActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

/**
 * Pipeline check: shows a toast when the main screen opens.
 */
@Suppress("unused")
val helloPatch = patch(
    name = "Hello",
    description = "Shows a toast when YouTube Music opens, to check that this bundle is applied. For testing.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)

    extendWith("extensions/extension.mpe")

    execute {
        MusicActivityOnCreateFingerprint.method.addInstruction(
            0,
            // The register of 'this' can be above v15, so the range format is needed.
            "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->onCreate(Landroid/app/Activity;)V",
        )
    }
}
