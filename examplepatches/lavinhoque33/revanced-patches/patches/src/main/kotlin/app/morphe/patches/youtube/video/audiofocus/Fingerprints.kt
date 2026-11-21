/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-20.
 */

package app.morphe.patches.youtube.video.audiofocus

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

private const val AUDIO_MANAGER = "Landroid/media/AudioManager;"
private const val FOCUS_LISTENER = "Landroid/media/AudioManager\$OnAudioFocusChangeListener;"
internal const val NATIVE_DUCK_PAUSE = "AUDIO_FOCUS_LOSS_TRANSIENT_CAN_DUCK; pausing instead."
internal const val NATIVE_DUCK_VOLUME = "AudioFocus loss; Will lower volume"

internal object YoutubeAudioFocusListenerFingerprint : Fingerprint(
    name = "onAudioFocusChange",
    returnType = "V",
    parameters = listOf("I"),
    filters = listOf(string("AudioFocus DUCK"), string(NATIVE_DUCK_PAUSE), string(NATIVE_DUCK_VOLUME)),
    custom = { _, classDef -> FOCUS_LISTENER in classDef.interfaces },
)

internal object YoutubeAudioFocusCompatBuilderFingerprint : Fingerprint(
    returnType = "L",
    parameters = emptyList(),
    filters = listOf(
        opcode(Opcode.IGET_BOOLEAN),
        methodCall(
            opcode = Opcode.INVOKE_DIRECT,
            name = "<init>",
            parameters = listOf(FOCUS_LISTENER, "Landroid/os/Handler;", "Landroidx/media/AudioAttributesCompat;", "Z"),
        ),
        string("Can't build an AudioFocusRequestCompat instance without a listener"),
    ),
)

internal object YoutubeAudioFocusRequestFingerprint : Fingerprint(
    name = "run",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        string("AudioFocus Requested"),
        methodCall(opcode = Opcode.INVOKE_VIRTUAL, returnType = "V", parameters = listOf(FOCUS_LISTENER)),
    ),
)

internal object YoutubeAudioFocusAbandonFingerprint : Fingerprint(
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        string("AudioFocus Abandoned"),
        methodCall(
            definingClass = AUDIO_MANAGER,
            name = "abandonAudioFocus",
            returnType = "I",
            parameters = listOf(FOCUS_LISTENER),
        ),
    ),
)
