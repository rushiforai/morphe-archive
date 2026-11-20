/*
 * Copyright 2026 Rosaldivo.
 * https://github.com/Rosaldivo/rosaldivo-morphe-patches
 *
 * Licensed under the GNU General Public License v3.0.
 */

package app.rosaldivo.patches.music.autoplay

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/**
 * Applies the server's default autoplay mode when a new queue loads. The method is:
 *
 * ```
 * if (prefs.getBoolean("has_user_changed_default_autoplay_mode", false)) {
 *     setAutoplay(prefs.getBoolean("autoplay_enabled", true))   // Keep the user's choice.
 *     return
 * }
 * // Otherwise overwrite "autoplay_enabled" with the server default (usually ON).
 * ```
 *
 * The Up next switch sets the "has_user_changed" flag, but the switch in Settings > Playback
 * (9.3x) only stores "autoplay_enabled". Turning autoplay off there is then undone as soon as
 * the next track starts.
 *
 * The other method that reads the flag (the Up next switch listener) takes parameters.
 */
internal object ApplyDefaultAutoplayModeFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        string("has_user_changed_default_autoplay_mode"),
        // SharedPreferences.getBoolean() result.
        opcode(Opcode.MOVE_RESULT, location = MatchAfterWithin(3))
    ),
    strings = listOf("autoplay_enabled")
)

/**
 * Returns a lane of the queue (0 is the songs, 1 is the autoplay songs) as a list-like object
 * with `size()` and `remove(int)`. Method of the queue manager, whose static initializer holds its
 * class path.
 */
internal object QueueLaneFingerprint : Fingerprint(
    classFingerprint = Fingerprint(
        name = "<clinit>",
        returnType = "V",
        parameters = listOf(),
        filters = listOf(
            string("com/google/android/libraries/youtube/player/features/queue/PlaybackQueueManager")
        )
    ),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "L",
    parameters = listOf("I"),
    filters = listOf(
        opcode(Opcode.CHECK_CAST)
    )
)

/**
 * Requests more songs for the queue (the next page, the previous page or the radio continuation).
 * Takes the type of the continuation and a callback. The class is the only one with its class path.
 */
internal object QueueContinuationRequestFingerprint : Fingerprint(
    classFingerprint = Fingerprint(
        name = "<clinit>",
        returnType = "V",
        parameters = listOf(),
        filters = listOf(
            string("com/google/android/apps/youtube/music/player/queue/MusicPlaybackQueueContinuationRequester")
        )
    ),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("L", "L")
)

/**
 * Called whenever the queue changes, with the index of the song playing. Asks for more songs when
 * the queue is short, or tells the queue it is not loading when it is long enough.
 * The only method of the queue class that takes a single int.
 */
internal object QueueLoadMoreFingerprint : Fingerprint(
    classFingerprint = Fingerprint(
        name = "<clinit>",
        returnType = "V",
        parameters = listOf(),
        filters = listOf(
            string("com/google/android/apps/youtube/music/player/queue/MusicPlaybackQueue")
        )
    ),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("I")
)

/**
 * Called with every server response that fills the queue, with the response as the first parameter,
 * to remember the continuations it brings (next page, previous page, radio). It reads the three
 * continuation types from the static fields of their class, which the other method of the queue class
 * with the same parameters does not.
 */
internal object QueueResponseFingerprint : Fingerprint(
    classFingerprint = Fingerprint(
        name = "<clinit>",
        returnType = "V",
        parameters = listOf(),
        filters = listOf(
            string("com/google/android/apps/youtube/music/player/queue/MusicPlaybackQueue")
        )
    ),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("L", "L"),
    custom = custom@{ method, _ ->
        val instructions = method.implementation?.instructions ?: return@custom false
        val enumFields = instructions
            .filter { it.opcode == Opcode.SGET_OBJECT }
            .mapNotNull { ((it as ReferenceInstruction).reference as? FieldReference) }
            .filter { it.definingClass == it.type }
            .map { it.name }
            .toSet()
        return@custom enumFields.size >= 3
    }
)
