package app.fblite.patches.video

import app.fblite.patches.font.AttachBaseContextFingerprint
import app.fblite.patches.settings.morpheSettingsPatch
import app.fblite.patches.shared.Constants.COMPATIBILITY_FACEBOOK_LITE
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private const val EXTENSION_CLASS = "Lapp/fblite/extension/video/VideoFeatures;"
private const val FEATURES_CLASS = "Lapp/fblite/extension/settings/PatchedFeatures;"

/**
 * Smali that tells the extension which features were patched in. It runs first in Application.attachBaseContext, where
 * v0 is free (the method has 31 locals and nothing has set them yet).
 */
internal fun featureMarks(vararg keys: String): String = keys.joinToString("\n") { key ->
    "const-string v0, \"$key\"\ninvoke-static { v0 }, $FEATURES_CLASS->mark(Ljava/lang/String;)V"
}

/**
 * Installs the extension's watcher of the video screens. It has no name, so it is not listed: the video patches
 * (download and auto next reel, seek bar, double tap, creator page skipping) depend on it, and each one switches on its
 * own feature.
 */
internal val videoFeaturesBasePatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_FACEBOOK_LITE)

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

/**
 * Videos play in native FbVideoView views inside MainActivity. The extension watches that activity
 * and adds a download button over the playing video and moves on to the next reel when one ends.
 * Both can be switched off in the settings screen. The download joins the DASH picture and sound tracks of
 * the chosen quality into one MP4, and falls back to the SD file.
 */
@Suppress("unused")
val videoToolsPatch = bytecodePatch(
    name = "Video download and auto next reel",
    description = "Adds a button to download the playing video in HD or SD (you choose the quality), and moves to " +
        "the next reel when one ends. These are switched in the Morphe settings screen.",
    default = true
) {
    compatibleWith(COMPATIBILITY_FACEBOOK_LITE)

    dependsOn(videoFeaturesBasePatch)

    extendWith("extensions/extension.mpe")

    execute {
        AttachBaseContextFingerprint.method.addInstructions(
            0,
            featureMarks("video_download", "ask_download_quality", "auto_next_reel")
        )
    }
}
