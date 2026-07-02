package app.pausefix.patches.youtube.playback

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import app.morphe.patcher.opcode

/**
 * Fingerprint for the method called when a new video starts loading/playing.
 *
 * This is the ONLY fingerprint we use. Rather than trying to find and hook
 * the pause method (which is unreliable due to obfuscation), we hook the
 * playback start method and pass the player object to our extension.
 * The extension then uses reflection to auto-resume playback when
 * YouTube's bug auto-pauses it.
 */
object PlaybackStartFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    // Returns void — it's a setup/initialization method
    returnType = "V",

    // Filter based on the initialization sequence
    filters = listOf(
        opcode(Opcode.INVOKE_VIRTUAL),
        opcode(Opcode.MOVE_RESULT_OBJECT),
        opcode(Opcode.INVOKE_VIRTUAL),
    ),

    custom = { method, classDef ->
        // The class should have a String field (for video ID storage)
        // and the method should take at least one object parameter
        classDef.fields.any { it.type == "Ljava/lang/String;" } &&
            method.parameterTypes.any { it.startsWith("L") } &&
            method.implementation != null
    }
)
