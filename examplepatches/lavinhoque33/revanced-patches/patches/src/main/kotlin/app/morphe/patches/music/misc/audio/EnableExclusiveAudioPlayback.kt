/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/3850
 *
 * Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 *
 * Modified by lavinhoque33, 2026-10-24
 */

package app.morphe.patches.music.misc.audio

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.music.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

@Suppress("unused")
val enableExclusiveAudioPlaybackPatch = bytecodePatch(
    name = "Enable exclusive audio playback",
    description = "Enables the option to play audio without video.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)

    execute {
        // The methods keep the same purpose across versions, but their instructions differ between older
        // and newer app versions, so the newer shape is tried first and the older one is the fallback.
        val allowExclusiveAudioPlayback = firstMatching(
            AllowExclusiveAudioPlaybackFingerprint,
            AllowExclusiveAudioPlaybackLegacyFingerprint
        )
        allowExclusiveAudioPlayback.method.returnEarly(true)

        // YTM tries to skip podcast episodes marked FEATURE_AVAILABILITY_BLOCKED ("Audio-only not available")
        // and stops playback if the skip request returns "action unavailable" (11). Bypass that restriction
        // so playback can start from Android Auto without pressing Play on the phone.
        // The phone's Audio/Video switch also uses this restriction check, so force false only here.
        val externalAudioRestriction = firstMatching(
            ExternalAudioRestrictionFingerprint,
            ExternalAudioRestrictionLegacyFingerprint
        )
        val restrictionMethod = externalAudioRestriction.method
        val index = externalAudioRestriction.instructionMatches[1].index
        val register = restrictionMethod.getInstruction<OneRegisterInstruction>(index).registerA

        restrictionMethod.replaceInstruction(index, "const/16 v$register, 0x0")
    }
}

context(_: BytecodePatchContext)
private fun firstMatching(preferred: Fingerprint, fallback: Fingerprint): Fingerprint =
    if (runCatching { preferred.method }.isSuccess) preferred else fallback
