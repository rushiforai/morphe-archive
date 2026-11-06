/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/3471
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 *
 * modified by lavinhoque33, 2026-10-17: collected from Morphe's
 * music/layout/hide/general/Fingerprints.kt (pill container).
 * Resource literals use the fork's resourceMappingPatch based resourceLiteral.
 * Modified by lavinhoque33, 2026-10-24: the queue fingerprints are shared with the ported Jam patch
 * (music/interaction/jam/Fingerprints.kt) again, like Morphe.
 */

package app.morphe.patches.music.misc.audiovideoswitch

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patches.shared.mapping.ResourceType
import app.morphe.patches.shared.mapping.resourceLiteral
import com.android.tools.smali.dexlib2.Opcode

/** Every inflation site of the Song/Video pill container in the watch page. */
internal object AudioVideoSwitchPillContainerFingerprint : Fingerprint(
    filters = listOf(
        resourceLiteral(ResourceType.ID, "audio_video_switch_pill_container"),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            name = "findViewById"
        ),
        opcode(Opcode.MOVE_RESULT_OBJECT, location = MatchAfterImmediately())
    )
)
