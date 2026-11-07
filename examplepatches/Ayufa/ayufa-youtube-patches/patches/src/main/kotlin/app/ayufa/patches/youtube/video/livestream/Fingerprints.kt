package app.ayufa.patches.youtube.video.livestream

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

/**
 * Matches the method that reports media progress. Its first matched
 * instruction calls the constructor of the media progress event, whose
 * first parameter is the current playback time in milliseconds. Hooking
 * the start of that constructor gives a callback about once per second
 * during playback.
 *
 * Same fingerprint as MorpheApp/morphe-patches
 * (patches/shared/misc/videoinformation/Fingerprints.kt,
 * PlayerControllerSetTimeReferenceFingerprint), GPL-3.0.
 */
internal object MediaProgressFingerprint : Fingerprint(
    filters = listOf(
        methodCall(
            opcode = Opcode.INVOKE_DIRECT_RANGE,
            name = "<init>",
            parameters = listOf("J", "J", "J", "J", "J", "J", "J", "Z", "Ljava/lang/String;")
        ),
        string(
            "Media progress reported outside media playback: ",
            comparison = StringComparisonType.CONTAINS
        )
    )
)
