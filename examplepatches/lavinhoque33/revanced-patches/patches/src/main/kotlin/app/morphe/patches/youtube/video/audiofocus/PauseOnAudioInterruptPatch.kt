/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-20.
 */

package app.morphe.patches.youtube.video.audiofocus

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.youtube.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patches.youtube.utils.extension.sharedExtensionPatch
import app.morphe.patches.youtube.utils.patch.PatchList.PAUSE_ON_AUDIO_INTERRUPT
import app.morphe.patches.youtube.utils.settings.ResourceUtils.addPreference
import app.morphe.patches.youtube.utils.settings.settingsPatch
import app.morphe.util.Utils.printWarn
import app.morphe.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction22t
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField

private const val EXTENSION = "Lapp/morphe/extension/youtube/patches/playback/PauseOnAudioInterruptPatch;"
private const val PAUSED_FIELD = "morphePausedForDuck"

private data class DuckBranch(
    val method: MutableMethod,
    val modeField: FieldReference,
    val comparison: BuilderInstruction22t,
    val listenerRegister: Int,
)

private data class FocusRelease(val method: MutableMethod, val listenerField: FieldReference)
private data class FocusRequest(val method: MutableMethod, val flagWriteIndex: Int, val flagRegister: Int)

private fun BytecodePatchContext.findDuckBranch(): DuckBranch? {
    val match = YoutubeAudioFocusListenerFingerprint.matchOrNull() ?: return null
    val method = match.method
    val implementation = method.implementation ?: return null
    if (implementation.registerCount < 4) return null

    val instructions = implementation.instructions
    val (duckLog, pauseLog, volumeLog) = match.instructionMatches
    val branchIndex = (duckLog.index until pauseLog.index).singleOrNull { index ->
        val branch = instructions[index] as? BuilderInstruction22t ?: return@singleOrNull false
        branch.opcode == Opcode.IF_NE && branch.target.location.index in (pauseLog.index + 1)..volumeLog.index
    } ?: return null

    val branch = instructions[branchIndex] as BuilderInstruction22t
    val modeRead = instructions[branchIndex - 1]
    val modeField = modeRead.getReference<FieldReference>() ?: return null
    if (modeRead.opcode != Opcode.IGET || modeField.type != "I" ||
        (modeRead as TwoRegisterInstruction).registerA != branch.registerA
    ) return null

    // Fallthrough calls the listener's pause bookkeeping before invoking the player pause.
    val pauseCall = instructions[branchIndex + 1]
    val pauseMethod = pauseCall.getReference<MethodReference>() ?: return null
    if (pauseCall.opcode != Opcode.INVOKE_VIRTUAL || pauseMethod.definingClass != method.definingClass ||
        pauseMethod.parameterTypes != listOf("Z") || pauseMethod.returnType != "V"
    ) return null

    val listenerRegister = (pauseCall as FiveRegisterInstruction).registerC
    if (listenerRegister == branch.registerA || listenerRegister == branch.registerB) return null

    return DuckBranch(method, modeField, branch, listenerRegister)
}

private fun BytecodePatchContext.findFocusRelease(duck: DuckBranch): FocusRelease? {
    val match = YoutubeAudioFocusAbandonFingerprint.matchOrNull() ?: return null
    val method = match.method
    val implementation = method.implementation ?: return null
    if (method.definingClass != duck.modeField.definingClass || implementation.registerCount < 3) return null

    val abandonIndex = match.instructionMatches.last().index
    val listenerRead = implementation.instructions[abandonIndex - 1]
    val listenerField = listenerRead.getReference<FieldReference>() ?: return null
    val abandon = implementation.instructions[abandonIndex] as? FiveRegisterInstruction ?: return null
    if (listenerRead.opcode != Opcode.IGET_OBJECT || listenerField.definingClass != method.definingClass ||
        listenerField.type != duck.method.definingClass ||
        (listenerRead as TwoRegisterInstruction).registerA != abandon.registerD
    ) return null

    return FocusRelease(method, listenerField)
}

private fun BytecodePatchContext.findFocusRequest(duck: DuckBranch, release: FocusRelease): FocusRequest? {
    val builder = YoutubeAudioFocusCompatBuilderFingerprint.matchOrNull() ?: return null
    val (flagRead, constructor) = builder.instructionMatches
    val flag = flagRead.instruction.getReference<FieldReference>() ?: return null
    val create = constructor.instruction as? FiveRegisterInstruction ?: return null
    if (flag.definingClass != builder.method.definingClass || flag.type != "Z" ||
        flagRead.index + 1 != constructor.index ||
        (flagRead.instruction as TwoRegisterInstruction).registerA != create.registerG
    ) return null

    val request = YoutubeAudioFocusRequestFingerprint.matchOrNull() ?: return null
    val method = request.method
    val instructions = method.implementation?.instructions ?: return null
    val setterIndex = request.instructionMatches.last().index
    val setter = instructions[setterIndex].getReference<MethodReference>() ?: return null
    if (setter.definingClass != flag.definingClass ||
        instructions.getOrNull(setterIndex - 1)?.getReference<FieldReference>() != release.listenerField ||
        instructions.getOrNull(setterIndex + 1)?.getReference<FieldReference>() != duck.modeField
    ) return null

    val writeIndex = (setterIndex + 2 until instructions.lastIndex).singleOrNull { index ->
        instructions[index].opcode == Opcode.IPUT_BOOLEAN &&
                instructions[index].getReference<FieldReference>() == flag &&
                instructions[index + 1].getReference<MethodReference>() == builder.method
    } ?: return null
    val flagWrite = instructions[writeIndex] as TwoRegisterInstruction
    val build = instructions[writeIndex + 1] as? FiveRegisterInstruction ?: return null
    if (build.registerC != flagWrite.registerB) return null

    return FocusRequest(method, writeIndex, flagWrite.registerA)
}

private fun DuckBranch.install(state: String) {
    val branchIndex = comparison.location.index
    val mode = comparison.registerA
    val pauseMode = comparison.registerB
    val stockPause = method.getInstruction(branchIndex + 1)
    val stockVolume = method.getInstruction(comparison.target.location.index)

    // Stock IF_NE jumps to "Will lower volume"; equality already pauses. Keep that native pause,
    // and let only the volume edge consult our policy. The mode register is dead on the volume edge.
    method.addInstructionsWithLabels(
        branchIndex + 1,
        """
            if-eq v$mode, v$pauseMode, :native_pause
            iget-boolean v$mode, v$listenerRegister, $state
            invoke-static { v$mode }, $EXTENSION->shouldPauseOnDuck(Z)Z
            move-result v$mode
            if-eqz v$mode, :native_volume
            iput-boolean v$mode, v$listenerRegister, $state
            move v$mode, v$pauseMode
        """,
        ExternalLabel("native_volume", stockVolume),
        ExternalLabel("native_pause", stockPause),
    )
    method.removeInstruction(branchIndex)

    // Real permanent loss and native gain events end the episode. Never rewrite the callback value.
    method.addInstructionsWithLabels(
        0,
        """
            invoke-static/range { p1 .. p1 }, $EXTENSION->endsInterruption(I)Z
            move-result v0
            if-eqz v0, :native_callback
            move-object/from16 v1, p0
            const/4 v0, 0x0
            iput-boolean v0, v1, $state
        """,
        ExternalLabel("native_callback", method.getInstruction(0)),
    )
}

private fun FocusRelease.install(state: String) {
    // A focus session can end without a callback. A fresh listener also starts with the default false.
    method.addInstructions(
        0,
        """
            move-object/from16 v0, p0
            iget-object v0, v0, $listenerField
            const/4 v1, 0x0
            iput-boolean v1, v0, $state
        """,
    )
}

@Suppress("unused")
val pauseOnAudioInterruptPatch = bytecodePatch(PAUSE_ON_AUDIO_INTERRUPT.title, PAUSE_ON_AUDIO_INTERRUPT.summary) {
    dependsOn(sharedExtensionPatch, settingsPatch)
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val warning = "Pause on audio interruptions: native playback audio-focus hooks not found; skipping."
        val duck = findDuckBranch() ?: return@execute printWarn(warning)
        val release = findFocusRelease(duck) ?: return@execute printWarn(warning)
        val request = findFocusRequest(duck, release) ?: return@execute printWarn(warning)

        val listener = mutableClassDefBy(duck.method.definingClass)
        val state = "${listener.type}->$PAUSED_FIELD:Z"
        listener.instanceFields.add(
            ImmutableField(
                listener.type,
                PAUSED_FIELD,
                "Z",
                AccessFlags.PUBLIC.value or AccessFlags.VOLATILE.value or AccessFlags.SYNTHETIC.value,
                null,
                null,
                null,
            ).toMutable(),
        )
        val flag = request.flagRegister
        request.method.addInstructionsAtControlFlowLabel(
            request.flagWriteIndex,
            """
                invoke-static { v$flag }, $EXTENSION->willPauseWhenDucked(Z)Z
                move-result v$flag
            """,
        )
        duck.install(state)
        release.install(state)
        addPreference(
            arrayOf("PREFERENCE_SCREEN: VIDEO", "SETTINGS: PAUSE_ON_AUDIO_INTERRUPT"),
            PAUSE_ON_AUDIO_INTERRUPT,
        )
    }
}
