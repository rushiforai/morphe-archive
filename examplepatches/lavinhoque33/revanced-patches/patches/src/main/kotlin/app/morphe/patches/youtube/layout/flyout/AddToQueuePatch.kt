/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/1837
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 *
 * Modified by lavinhoque33, 2026-10-24
 */

package app.morphe.patches.youtube.layout.flyout

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.shared.mapping.resourceMappingPatch
import app.morphe.patches.youtube.general.downloads.FeedFlyoutButtonsInitializerFingerprint
import app.morphe.patches.youtube.general.downloads.downloadActionsPatch
import app.morphe.patches.youtube.layout.playlistautoplay.navigationIntentHook
import app.morphe.patches.youtube.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patches.youtube.utils.extension.sharedExtensionPatch
import app.morphe.patches.youtube.utils.loadvideo.loadVideoHookPatch
import app.morphe.patches.youtube.utils.patch.PatchList.ADD_TO_QUEUE
import app.morphe.patches.youtube.utils.playlist.playlistPatch
import app.morphe.patches.youtube.utils.playservice.is_21_05_or_greater
import app.morphe.patches.youtube.utils.playservice.is_21_13_or_greater
import app.morphe.patches.youtube.utils.playservice.versionCheckPatch
import app.morphe.patches.youtube.utils.settings.ResourceUtils.addPreference
import app.morphe.patches.youtube.utils.settings.settingsPatch
import app.morphe.patches.youtube.video.information.playerStatusOverrideHook
import app.morphe.patches.youtube.video.information.videoEndMethod
import app.morphe.patches.youtube.video.information.videoInformationPatch
import app.morphe.util.Utils.printWarn
import app.morphe.util.findFreeRegister
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstructionOrThrow
import app.morphe.util.setExtensionIsPatchIncluded
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val EXTENSION_CLASS =
    "Lapp/morphe/extension/youtube/patches/AddToQueuePatch;"

private const val EXTENSION_LOCAL_QUEUE_CLASS =
    "Lapp/morphe/extension/youtube/patches/LocalQueuePatch;"

private const val EXTENSION_SLEEP_TIMER_INTERFACE =
    $$"Lapp/morphe/extension/youtube/patches/LocalQueuePatch$SleepTimerController;"

private const val EXTENSION_DOWNLOAD_ACTIONS_CLASS =
    "Lapp/morphe/extension/youtube/patches/general/DownloadActionsPatch;"

@Suppress("unused")
val addToQueuePatch = bytecodePatch(
    ADD_TO_QUEUE.title,
    ADD_TO_QUEUE.summary,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    dependsOn(
        settingsPatch,
        sharedExtensionPatch,
        downloadActionsPatch,
        playlistPatch,
        videoInformationPatch,
        loadVideoHookPatch,
        resourceMappingPatch,
        versionCheckPatch,
    )

    execute {
        if (!is_21_05_or_greater) {
            printWarn("\"${ADD_TO_QUEUE.title}\" is not supported in this version. Use YouTube 21.05 or later.")
            return@execute
        }

        addPreference(
            arrayOf(
                "PREFERENCE_SCREEN: FEED",
                "SETTINGS: ADD_TO_QUEUE",
            ),
            ADD_TO_QUEUE,
        )

        // The 'Play next in queue' runnable is hooked by the Hook download actions patch,
        // which hands it to this patch first.
        val flyoutMatches = FeedFlyoutButtonsInitializerFingerprint.instructionMatches
        val getCharSequenceReference = flyoutMatches[0].instruction.getReference<MethodReference>()!!
        val enumIntField = flyoutMatches[7].instruction.getReference<FieldReference>()!!
        val enumMethod = flyoutMatches[8].instruction.getReference<MethodReference>()!!

        hookContextualMenuItemClick(getCharSequenceReference, enumIntField, enumMethod)
        hookContextualMenuItemBuilder(getCharSequenceReference, enumIntField, enumMethod)

        navigationIntentHook(EXTENSION_LOCAL_QUEUE_CLASS, "shouldCancelNavigation")

        if (is_21_13_or_greater) {
            playerStatusOverrideHook(EXTENSION_LOCAL_QUEUE_CLASS, "shouldCancelEndOfVideo")
        } else {
            videoEndMethod.addInstructionsWithLabels(
                0,
                """
                    invoke-static {}, $EXTENSION_LOCAL_QUEUE_CLASS->shouldCancelEndOfVideo()Z
                    move-result v0
                    if-eqz v0, :continue
                    return-void
                    :continue
                    nop
                """
            )
        }

        addSleepTimerController()

        setExtensionIsPatchIncluded(EXTENSION_CLASS)
        setExtensionIsPatchIncluded(EXTENSION_LOCAL_QUEUE_CLASS)
    }
}

/**
 * Lets the contextual (popup) flyout menu entries open the queue instead of the YouTube queue.
 */
context(_: BytecodePatchContext)
private fun hookContextualMenuItemClick(
    getCharSequenceReference: MethodReference,
    enumIntField: FieldReference,
    enumMethod: MethodReference,
) {
    ContextualMenuItemBuilderOnClickFingerprint.let {
        val buttonInfoField = it.instructionMatches[0].instruction.getReference<FieldReference>()!!
        val buttonInfoType = it.instructionMatches[1].instruction.let { instruction ->
            (instruction as ReferenceInstruction).reference
        }

        it.method.apply {
            val register = findFreeRegister(0)

            addInstructionsWithLabels(
                0,
                """
                    iget-object v$register, p0, $buttonInfoField
                    check-cast v$register, $buttonInfoType
                    invoke-static { v$register }, $getCharSequenceReference
                    move-result-object v$register
                    iget v$register, v$register, $enumIntField
                    invoke-static { v$register }, $enumMethod
                    move-result-object v$register
                    invoke-virtual { v$register }, Ljava/lang/Enum;->name()Ljava/lang/String;
                    move-result-object v$register
                    invoke-static { v$register }, $EXTENSION_CLASS->replaceOnItemClick(Ljava/lang/Object;)Z
                    move-result v$register
                    if-eqz v$register, :continue
                    return-void
                    :continue
                    nop
                """
            )
        }
    }
}

/**
 * Records the entries of the contextual (popup) flyout menu, so their rows can be matched to their names.
 */
context(_: BytecodePatchContext)
private fun hookContextualMenuItemBuilder(
    getCharSequenceReference: MethodReference,
    enumIntField: FieldReference,
    enumMethod: MethodReference,
) {
    ContextualMenuItemBuilderFingerprint.let {
        val buttonInfoMatch = it.instructionMatches[3]
        val buttonInfoRegister = (buttonInfoMatch.instruction as FiveRegisterInstruction).registerC
        val textViewRegister = (it.instructionMatches[2].instruction as FiveRegisterInstruction).registerC

        it.method.apply {
            // Hide feed flyout menu finds this method by the opcodes from the text view cast
            // to the 'add-int/2addr' after the button info call, so the hook goes after them.
            val insertIndex = indexOfFirstInstructionOrThrow(buttonInfoMatch.index, Opcode.ADD_INT_2ADDR) + 1
            val freeRegister = findFreeRegister(insertIndex, buttonInfoRegister, textViewRegister)

            addInstructions(
                insertIndex,
                """
                    invoke-static { v$buttonInfoRegister }, $getCharSequenceReference
                    move-result-object v$freeRegister
                    iget v$freeRegister, v$freeRegister, $enumIntField
                    invoke-static { v$freeRegister }, $enumMethod
                    move-result-object v$freeRegister
                    invoke-static { v$freeRegister, v$textViewRegister }, $EXTENSION_DOWNLOAD_ACTIONS_CLASS->setCurrentFlyoutButton(Ljava/lang/Enum;Ljava/lang/Object;)V
                """
            )
        }
    }
}

/**
 * The sleep timer can be set to stop playback at the end of the video,
 * and then the next queued video must not start.
 */
context(context: BytecodePatchContext)
private fun addSleepTimerController() {
    val cancelMethod = SleepTimerCancelMethodFingerprint.methodOrNull
    val videoEndedMethod = SleepTimerVideoEndedEventFingerprint.methodOrNull
    if (cancelMethod == null || videoEndedMethod == null) {
        printWarn(
            "\"${ADD_TO_QUEUE.title}\": the sleep timer was not found, " +
                    "so the queue can start a video after the sleep timer ends the current one."
        )
        return
    }

    val stateField = cancelMethod
        .getInstruction<ReferenceInstruction>(cancelMethod.indexOfFirstInstructionOrThrow(Opcode.IGET_OBJECT))
        .reference as FieldReference
    val endOfVideoField = videoEndedMethod
        .getInstruction<ReferenceInstruction>(videoEndedMethod.indexOfFirstInstructionOrThrow(Opcode.SGET_OBJECT))
        .reference as FieldReference

    context.mutableClassDefBy(cancelMethod.definingClass).apply {
        interfaces.add(EXTENSION_SLEEP_TIMER_INTERFACE)

        methods.add(
            ImmutableMethod(
                type,
                "patch_isSetToEndOfVideo",
                listOf(),
                "Z",
                AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
                null,
                null,
                MutableMethodImplementation(3),
            ).toMutable().apply {
                addInstructionsWithLabels(
                    0,
                    """
                        iget-object v0, p0, $stateField
                        sget-object v1, $endOfVideoField
                        if-ne v0, v1, :false
                        const/4 v0, 0x1
                        return v0
                        :false
                        const/4 v0, 0x0
                        return v0
                    """
                )
            }
        )
    }

    SleepTimerConstructorFingerprint.matchAll().forEach { match ->
        match.method.addInstruction(
            match.instructionMatches.first().index + 1,
            "invoke-static { p0 }, $EXTENSION_LOCAL_QUEUE_CLASS->" +
                    "setSleepTimerController($EXTENSION_SLEEP_TIMER_INTERFACE)V"
        )
    }
}
