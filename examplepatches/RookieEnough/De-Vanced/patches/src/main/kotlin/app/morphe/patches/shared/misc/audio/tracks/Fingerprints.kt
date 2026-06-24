/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/shared/misc/audio/tracks/Fingerprints.kt
 */
package app.morphe.patches.shared.misc.audio.tracks

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import com.android.tools.smali.dexlib2.AccessFlags

internal object FormatStreamModelToStringFingerprint : Fingerprint(
    name = "toString",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/String;",
    strings = listOf(
        // Strings are partial matches.
        "isDefaultAudioTrack=",
        "audioTrackId="
    )
)

internal object SelectAudioStreamFingerprint : Fingerprint(
    filters = listOf(
        literal(45666189L)
    )
)
