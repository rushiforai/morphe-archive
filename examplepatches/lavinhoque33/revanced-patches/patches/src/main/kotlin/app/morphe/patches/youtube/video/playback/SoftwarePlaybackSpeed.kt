/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-24.
 */
package app.morphe.patches.youtube.video.playback

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.getReference
import app.morphe.patches.youtube.utils.playservice.is_21_04_or_greater
import app.morphe.util.Utils.printWarn
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.findInstructionIndicesReversedOrThrow
import app.morphe.util.getFiveRegisters
import app.morphe.util.getWalkerMethod
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** The renderer can still clamp a rate after the watch menu's limiter has accepted it. */
context(_: BytecodePatchContext)
internal fun installSoftwarePlaybackSpeed(extension: String) {
    val hooks = runCatching {
        val platformSetter = Fingerprint(
            returnType = "V",
            parameters = emptyList(),
            strings = listOf(if (is_21_04_or_greater) "AudioTrackAudioOutput" else "DefaultAudioSink"),
            filters = listOf(
                methodCall(smali = "Landroid/media/AudioTrack;->setPlaybackParams(Landroid/media/PlaybackParams;)V"),
            ),
        )
        val softwareSetter = Fingerprint(
            definingClass = platformSetter.classDef.type,
            returnType = "V",
            parameters = listOf("L"),
            filters = listOf(
                literal(0.1f.toRawBits().toLong()),
                literal(8f.toRawBits().toLong()),
                methodCall(opcode = Opcode.INVOKE_STATIC, parameters = listOf("F", "F", "F"), returnType = "F"),
                methodCall(opcode = Opcode.INVOKE_STATIC, parameters = listOf("F", "F", "F"), returnType = "F"),
            ),
        )
        val speedClamp = softwareSetter.instructionMatches[2]
        val pitchClamp = softwareSetter.instructionMatches[3]
        check(speedClamp.methodReference == pitchClamp.methodReference) { "Unexpected software speed clamp" }

        val setter = softwareSetter.method
        val platformCheck = setter.indexOfFirstInstructionOrThrow {
            val reference = getReference<MethodReference>()
            opcode == Opcode.INVOKE_DIRECT && reference != null && reference.definingClass == setter.definingClass &&
                reference.parameterTypes.isEmpty() && reference.returnType == "Z"
        }
        val gate = setter.getWalkerMethod(platformCheck)
        Triple(softwareSetter, speedClamp.index, gate)
    }.getOrElse {
        printWarn("Custom playback speed: could not resolve the software audio path: ${it.message}")
        return
    }

    val (setter, speedClampIndex, platformGate) = hooks
    val registers = setter.method.getFiveRegisters(speedClampIndex)
    // Keep the original pitch clamp and all stock-rate behavior when custom speed is off.
    setter.method.replaceInstruction(
        speedClampIndex,
        "invoke-static { $registers }, $extension->limitSoftwareSpeed(FFF)F",
    )

    platformGate.findInstructionIndicesReversedOrThrow(Opcode.RETURN).forEach { index ->
        val register = platformGate.getInstruction<OneRegisterInstruction>(index).registerA
        platformGate.addInstructionsAtControlFlowLabel(
            index,
            """
                invoke-static { v$register }, $extension->usePlatformPlaybackRate(Z)Z
                move-result v$register
            """.trimIndent(),
        )
    }
}
