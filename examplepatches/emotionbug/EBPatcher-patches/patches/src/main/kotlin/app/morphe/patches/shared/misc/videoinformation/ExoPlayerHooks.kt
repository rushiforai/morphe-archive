/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 */

package app.morphe.patches.shared.misc.videoinformation

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

// EBPatcher: extracted unchanged from Morphe v1.48.0 for Music-only dependency closure.
internal const val EXTENSION_EXOPLAYER_INTERFACE = "Lapp/morphe/extension/shared/patches/ExoPlayerInterface;"

context(patchContext: BytecodePatchContext)
internal fun addExoPlayerHooks(extensionClass: String) {
    val playbackParametersType = PlaybackParametersToStringFingerprint.classDef.type

    // The PlaybackParameters primary constructor with 2 arguments (speed, pitch).
    val playbackParametersConstructorReference = "$playbackParametersType-><init>(FF)V"

    // The toString() method reads the speed field before the pitch field.
    val playbackParametersSpeedField: FieldReference
    val playbackParametersPitchField: FieldReference
    PlaybackParametersToStringFingerprint.instructionMatches.let {
        playbackParametersSpeedField = it.first().getFieldAccessed()
        playbackParametersPitchField = it.last().getFieldAccessed()
    }

    val setPlaybackParametersFingerprint = getPlaybackParametersSetterFingerprint(playbackParametersType)
    val setPlaybackParametersMethod = setPlaybackParametersFingerprint.method

    // A reference to the setPlaybackParameters implementation, to call from the helper method.
    val setPlaybackParametersReference = "${setPlaybackParametersMethod.definingClass}->" +
            "${setPlaybackParametersMethod.name}($playbackParametersType)V"

    // Every speed the app sets passes through here, including when a new track loads.
    // Need to construct new PlaybackParameters instance as it has final fields.
    setPlaybackParametersMethod.addInstructions(
        0,
        """
            iget v0, p1, $playbackParametersSpeedField
            iget v1, p1, $playbackParametersPitchField
            invoke-static { v0, v1 }, $extensionClass->overridePlaybackPitch(FF)F
            move-result v1
            invoke-static { v0 }, $extensionClass->overridePlaybackSpeed(F)F
            move-result v0
            new-instance p1, $playbackParametersType
            invoke-direct { p1, v0, v1 }, $playbackParametersConstructorReference
        """
    )

    // Capture each ExoPlayerImpl instance at its constructor.
    // More than one instance can be active at the same time, such as when crossfading.
    getExoPlayerImplFingerprint(playbackParametersType).matchAll().forEach {
        val firstInstructionMatch = it.instructionMatches.first()
        val register = firstInstructionMatch.getInstruction<FiveRegisterInstruction>().registerC
        it.method.addInstruction(
            firstInstructionMatch.index + 1,
            "invoke-static { v$register }, $extensionClass->" +
                    "initializeExoPlayer($EXTENSION_EXOPLAYER_INTERFACE)V"
        )
    }

    setPlaybackParametersFingerprint.classDef.apply {
        // Add interface and helper method to allow extension code
        // to directly set the ExoPlayer playback parameters.
        interfaces.add(EXTENSION_EXOPLAYER_INTERFACE)

        methods.add(
            ImmutableMethod(
                type,
                "patch_setPlaybackParameters",
                listOf(
                    ImmutableMethodParameter("F", null, null),
                    ImmutableMethodParameter("F", null, null),
                ),
                "V",
                AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
                null,
                null,
                MutableMethodImplementation(4),
            ).toMutable().apply {
                addInstructions(
                    0,
                    """
                        new-instance v0, $playbackParametersType
                        invoke-direct { v0, p1, p2 }, $playbackParametersConstructorReference
                        invoke-virtual { p0, v0 }, $setPlaybackParametersReference
                        return-void
                    """
                )
            }
        )
    }
}
