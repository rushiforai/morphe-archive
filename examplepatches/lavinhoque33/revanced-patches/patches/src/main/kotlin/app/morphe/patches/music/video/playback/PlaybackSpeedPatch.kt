/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/3295
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

// Modified by lavinhoque33, 2026-10-24: port of Morphe's music "Playback speed" ExoPlayer hooks (speed override and
// "Change pitch with speed"), built on the pitch hook added on 2026-10-17.
package app.morphe.patches.music.video.playback

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.music.utils.extension.Constants.VIDEO_PATH
import app.morphe.patches.music.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.morphe.patches.music.video.information.videoInformationPatch
import app.morphe.patches.music.video.information.videoTimeHook
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val EXTENSION_PLAYBACK_SPEED_CLASS_DESCRIPTOR =
    "$VIDEO_PATH/PlaybackSpeedPatch;"
private const val EXTENSION_EXOPLAYER_INTERFACE =
    "Lapp/morphe/extension/shared/patches/ExoPlayerInterface;"

/**
 * Matches method {androidx.media3.common.PlaybackParameters}.toString()
 */
internal object MusicPlaybackParametersToStringFingerprint : Fingerprint(
    name = "toString",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(definingClass = "this", opcode = Opcode.IGET, type = "F"),
        fieldAccess(opcode = Opcode.IGET, type = "F")
    ),
    strings = listOf(
        "PlaybackParameters(speed=%.2f, pitch=%.2f)"
    )
)

/**
 * Matches method {androidx.media3.exoplayer.ExoPlayerImpl.setPlaybackParameters(PlaybackParameters p1)}
 */
internal fun getMusicPlaybackParametersSetterFingerprint(playbackParametersType: String) =
    object : Fingerprint(
        accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
        returnType = "V",
        parameters = listOf(playbackParametersType),
        custom = { methodDef, classDef ->
            methodDef.implementation != null
                    && classDef.interfaces.contains("Landroidx/media3/exoplayer/ExoPlayer;")
        }
    ) {}

/**
 * Matches the constructors of the ExoPlayerImpl class that holds setPlaybackParameters.
 */
internal fun getMusicExoPlayerImplFingerprint(playbackParametersType: String) =
    object : Fingerprint(
        classFingerprint = getMusicPlaybackParametersSetterFingerprint(playbackParametersType),
        name = "<init>",
        filters = listOf(
            methodCall(
                opcode = Opcode.INVOKE_DIRECT,
                name = "<init>"
            )
        )
    ) {}

/**
 * Hooks every PlaybackParameters passed to ExoPlayer.setPlaybackParameters (speed changes from the speed menu,
 * remembered speed and new tracks), so the extension can override the speed and the pitch, and adds a way
 * for the extension to set the parameters of every live ExoPlayer directly, to apply a changed setting
 * without waiting for the next track.
 */
internal val playbackSpeedPatch = bytecodePatch(
    description = "Hooks ExoPlayer playback parameters to override the speed and optionally change pitch with speed."
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)

    dependsOn(videoInformationPatch)

    execute {
        val playbackParametersType = MusicPlaybackParametersToStringFingerprint.classDef.type

        // The PlaybackParameters primary constructor with 2 arguments (speed, pitch).
        val playbackParametersConstructorReference = "$playbackParametersType-><init>(FF)V"

        // The toString() method reads the speed field before the pitch field.
        val speedAndPitchFields = MusicPlaybackParametersToStringFingerprint.instructionMatches.let {
            it.first().instruction.let { i -> (i as ReferenceInstruction).reference as FieldReference } to
                    it.last().instruction.let { i -> (i as ReferenceInstruction).reference as FieldReference }
        }
        val speedField = speedAndPitchFields.first
        val pitchField = speedAndPitchFields.second

        val setterFingerprint = getMusicPlaybackParametersSetterFingerprint(playbackParametersType)
        val setterMethod = setterFingerprint.method

        // A reference to the setPlaybackParameters implementation, to call from the helper method.
        val setterReference = "${setterMethod.definingClass}->${setterMethod.name}($playbackParametersType)V"

        // Need to construct a new PlaybackParameters instance as it has final fields.
        setterMethod.addInstructions(
            0,
            """
                iget v0, p1, $speedField
                iget v1, p1, $pitchField
                invoke-static { v0, v1 }, $EXTENSION_PLAYBACK_SPEED_CLASS_DESCRIPTOR->overridePlaybackPitch(FF)F
                move-result v1
                invoke-static { v0 }, $EXTENSION_PLAYBACK_SPEED_CLASS_DESCRIPTOR->overridePlaybackSpeed(F)F
                move-result v0
                new-instance p1, $playbackParametersType
                invoke-direct { p1, v0, v1 }, $playbackParametersConstructorReference
            """
        )

        // Capture each ExoPlayerImpl instance at its constructor.
        // More than one instance can be active at the same time, such as when crossfading.
        getMusicExoPlayerImplFingerprint(playbackParametersType).matchAll().forEach {
            val firstMatch = it.instructionMatches.first()
            val register = (firstMatch.instruction as FiveRegisterInstruction).registerC

            it.method.addInstruction(
                firstMatch.index + 1,
                "invoke-static { v$register }, " +
                        "$EXTENSION_PLAYBACK_SPEED_CLASS_DESCRIPTOR->" +
                        "initializeExoPlayer($EXTENSION_EXOPLAYER_INTERFACE)V"
            )
        }

        setterFingerprint.classDef.apply {
            // Add the interface and helper method that let the extension set the playback parameters directly.
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
                            invoke-virtual { p0, v0 }, $setterReference
                            return-void
                        """
                    )
                }
            )
        }

        // Apply a changed speed setting while a track is playing.
        videoTimeHook(EXTENSION_PLAYBACK_SPEED_CLASS_DESCRIPTOR, "setVideoTime")
    }
}
