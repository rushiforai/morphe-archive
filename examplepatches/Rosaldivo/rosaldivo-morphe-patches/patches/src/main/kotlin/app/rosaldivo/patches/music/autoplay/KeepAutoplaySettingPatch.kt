/*
 * Copyright 2026 Rosaldivo.
 * https://github.com/Rosaldivo/rosaldivo-morphe-patches
 *
 * Licensed under the GNU General Public License v3.0.
 */

package app.rosaldivo.patches.music.autoplay

// Commented out, so the patch is not part of the bundle. It is no longer needed: the saved autoplay
// setting is not what brings the mix back (see `NoMixForSingleSongPatch`), and 9.40 and newer set the
// "user has changed autoplay" flag themselves. It only fixed 9.3x, where turning autoplay off in
// Settings > Playback was undone when the next track started.
// The fingerprint it used, `ApplyDefaultAutoplayModeFingerprint`, is kept.

/*
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.rosaldivo.patches.music.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC_AUTOPLAY
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

@Suppress("unused")
val keepAutoplaySettingPatch = bytecodePatch(
    name = "Keep autoplay setting",
    description = "Fixes the autoplay setting (Settings > Playback > Autoplay) turning itself " +
            "back on when a new track starts."
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC_AUTOPLAY)

    execute {
        ApplyDefaultAutoplayModeFingerprint.let {
            // Make the "user has changed autoplay" check always true, so the saved
            // setting is used and is never replaced with the server's default.
            val moveResultIndex = it.instructionMatches.last().index
            val register = it.method.getInstruction<OneRegisterInstruction>(moveResultIndex).registerA

            it.method.addInstruction(moveResultIndex + 1, "const/4 v$register, 0x1")
        }
    }
}
*/
