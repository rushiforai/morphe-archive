package app.fblite.patches.video

import app.fblite.patches.font.AttachBaseContextFingerprint
import app.fblite.patches.settings.morpheSettingsPatch
import app.fblite.patches.shared.Constants.COMPATIBILITY_FACEBOOK_LITE_530
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch

private const val EXTENSION_CLASS = "Lapp/fblite/extension/video/VideoFeatures;"

/**
 * Videos play in native FbVideoView views inside MainActivity. The extension watches that activity
 * and adds a download button over the playing video and moves on to the next reel when one ends.
 * Both can be switched off in the settings screen.
 */
@Suppress("unused")
val videoToolsPatch = bytecodePatch(
    name = "Video download and auto next reel",
    description = "Adds a button to download the playing video, and moves to the next reel when one ends. " +
        "Both are switched in the Morphe settings screen.",
    default = true
) {
    compatibleWith(COMPATIBILITY_FACEBOOK_LITE_530)

    dependsOn(morpheSettingsPatch)

    extendWith("extensions/extension.mpe")

    execute {
        AttachBaseContextFingerprint.method.addInstruction(
            0,
            // p0 is the Application; attachBaseContext has 31 locals, so it needs the range form.
            "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->install(Landroid/app/Application;)V"
        )
    }
}
