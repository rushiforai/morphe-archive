package app.pausefix.patches.youtube.playback

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * Descriptor for the runtime extension class that contains the auto-resume logic.
 * This class is compiled into the patched APK via the extensions module.
 */
private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/pausefix/extension/FixAutoPlayPausePatch;"

/**
 * Morphe patch that fixes the YouTube auto-pause bug.
 *
 * When logged into YouTube, videos may auto-pause immediately after opening
 * and keep re-pausing when the user tries to play. This patch intercepts
 * the playback initialization method and passes the player object to our
 * extension, which then monitors for auto-pause and forces playback to resume.
 *
 * Strategy: Instead of trying to find and hook the pause method (unreliable
 * due to obfuscation), we hook the playback START method and use reflection
 * to auto-resume after the bug fires its pause.
 */
@Suppress("unused")
val fixAutoPlayPausePatch = bytecodePatch(
    name = "Fix Auto-Play Pause",
    description = "Fixes YouTube videos auto-pausing immediately after opening when logged in.",
) {
    compatibleWith("com.google.android.youtube")

    // Include the runtime extension code in the patched APK
    extendWith("extensions/extension.rve")

    execute {
        // Hook the playback initialization method.
        // Pass 'this' (p0) — the player/controller object — to our extension
        // so it can use reflection to force-resume playback after the auto-pause.
        PlaybackStartFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p0}, $EXTENSION_CLASS_DESCRIPTOR->onVideoStarted(Ljava/lang/Object;)V
            """
        )
    }
}
