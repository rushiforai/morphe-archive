/**
 * Copyright 2026 Psylos
 * Private SoundCloud patch.
 */

package psylos.morphe.patches.soundcloud.download

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.indexOfFirstInstructionOrThrow
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import hoodles.morphe.patches.soundcloud.shared.Constants
import psylos.morphe.patches.soundcloud.shared.DownloadPatchStatusFingerprint
import psylos.morphe.patches.soundcloud.shared.PRIVATE_EXTENSION
import psylos.morphe.patches.soundcloud.shared.SettingsScreenFingerprint
import psylos.morphe.patches.soundcloud.shared.soundcloudPrivateSettingsPatch

private const val HOOK = "${PRIVATE_EXTENSION}DownloadButtonHook;"

private fun Instruction.methodReferenceOrNull() =
    (this as? ReferenceInstruction)?.reference as? MethodReference

private fun Instruction.fieldReferenceOrNull() =
    (this as? ReferenceInstruction)?.reference as? FieldReference

private fun Instruction.typeReferenceOrNull() =
    (this as? ReferenceInstruction)?.reference as? TypeReference

private fun Iterable<Instruction>.lastIndexBefore(
    endExclusive: Int,
    predicate: (Instruction) -> Boolean,
): Int {
    val list = this.toList()
    for (index in endExclusive - 1 downTo 0) {
        if (predicate(list[index])) return index
    }
    throw PatchException("Could not find expected SoundCloud instruction")
}

@Suppress("unused")
val downloadButtonHookPatch = bytecodePatch(
    name = "Download button hook",
    description =
        "Routes SoundCloud download buttons to a configured external app using the public track or playlist URL.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(soundcloudPrivateSettingsPatch)

    execute {
        // Makes the matching controls visible in the shared settings dialog.
        DownloadPatchStatusFingerprint.method.returnEarly(true)

        // Settings: hide SoundCloud's native offline-listening row while the private hook is enabled.
        SettingsScreenFingerprint.method.apply {
            val visibilityIndex = indexOfFirstInstructionOrThrow {
                opcode == Opcode.INSTANCE_OF &&
                    typeReferenceOrNull()?.type ==
                    "Lcom/soundcloud/android/settings/main/OfflineSyncSettingState${'$'}Visible;"
            }
            val visibilityRegister =
                getInstruction<TwoRegisterInstruction>(visibilityIndex).registerA
            addInstructions(
                visibilityIndex + 1,
                """
                    invoke-static {v$visibilityRegister}, $HOOK->filterNativeDownloadUiVisibility(Z)Z
                    move-result v$visibilityRegister
                """.trimIndent(),
            )
        }

        // Playlist page: replace the native offline action with ACTION_SEND.
        PlaylistPageDownloadClickFingerprint.method.apply {
            val permalinkIndex = indexOfFirstInstructionOrThrow {
                methodReferenceOrNull()?.let {
                    it.definingClass ==
                        "Lcom/soundcloud/android/foundation/domain/playlists/PlaylistItem;" &&
                        it.name == "getPermalinkUrl"
                } == true
            }
            val insertIndex = permalinkIndex + 2
            val continueInstruction = instructions[insertIndex]
            addInstructionsWithLabels(
                insertIndex,
                """
                    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;
                    move-result-object v1
                    invoke-static {v1, p1}, $HOOK->tryShare(Landroid/content/Context;Ljava/lang/String;)Z
                    move-result v1
                    if-eqz v1, :continue
                    return-void
                """.trimIndent(),
                ExternalLabel("continue", continueInstruction),
            )
        }

        // Track page: remember the public URL by TrackUrn.
        TrackUrlFingerprint.method.apply {
            val keyIndex = indexOfFirstInstructionOrThrow {
                fieldReferenceOrNull()?.let {
                    it.definingClass.endsWith("TrackDetailsPagePresenter${'$'}fetchData${'$'}2;") &&
                        it.type == "Lcom/soundcloud/android/foundation/domain/TrackUrn;"
                } == true
            }
            val keyRegister = getInstruction<TwoRegisterInstruction>(keyIndex).registerA
            val permalinkIndex = indexOfFirstInstructionOrThrow {
                methodReferenceOrNull()?.let {
                    it.definingClass ==
                        "Lcom/soundcloud/android/foundation/domain/tracks/TrackItem;" &&
                        it.name == "getPermalinkUrl"
                } == true
            }
            val urlRegister =
                getInstruction<OneRegisterInstruction>(permalinkIndex + 1).registerA
            addInstructions(
                permalinkIndex + 2,
                "invoke-static {v$keyRegister, v$urlRegister}, " +
                    "$HOOK->rememberUrl(Ljava/lang/Object;Ljava/lang/String;)V",
            )
        }

        // Track page click: consume the click when the external-share hook is enabled.
        TrackDownloadClickFingerprint.method.apply {
            val keyIndex = indexOfFirstInstructionOrThrow {
                fieldReferenceOrNull()?.let {
                    it.definingClass ==
                        "Lcom/soundcloud/android/trackpage/TrackPageView${'$'}DownloadClick;" &&
                        it.name == "a"
                } == true
            }
            val keyRegister = getInstruction<TwoRegisterInstruction>(keyIndex).registerA
            val contextIndex = indexOfFirstInstructionOrThrow {
                methodReferenceOrNull()?.let {
                    it.definingClass == "Landroidx/fragment/app/Fragment;" &&
                        it.name == "requireContext"
                } == true
            }
            val contextRegister =
                getInstruction<OneRegisterInstruction>(contextIndex + 1).registerA
            val insertIndex = contextIndex + 2
            val continueInstruction = instructions[insertIndex]
            addInstructionsWithLabels(
                insertIndex,
                """
                    invoke-static {v$contextRegister, v$keyRegister}, $HOOK->tryShareRemembered(Landroid/content/Context;Ljava/lang/Object;)Z
                    move-result v$contextRegister
                    if-eqz v$contextRegister, :continue
                    return-void
                """.trimIndent(),
                ExternalLabel("continue", continueInstruction),
            )
        }

        // Track page state: present the action as a normal download action while the hook is enabled.
        TrackPageStateFingerprint.method.apply {
            val downloadItemIndex = indexOfFirstInstructionOrThrow {
                opcode == Opcode.NEW_INSTANCE &&
                    typeReferenceOrNull()?.type ==
                    "Lcom/soundcloud/android/trackpage/EngagementsItem${'$'}Download;"
            }
            val stateCastIndex = instructions.lastIndexBefore(downloadItemIndex) {
                it.opcode == Opcode.CHECK_CAST &&
                    it.typeReferenceOrNull()?.type ==
                    "Lcom/soundcloud/android/ui/components/buttons/DownloadActionButton${'$'}State;"
            }
            val stateRegister =
                getInstruction<OneRegisterInstruction>(stateCastIndex).registerA
            addInstructions(
                stateCastIndex + 1,
                """
                    invoke-static {v$stateRegister}, $HOOK->normalizeDownloadState(Lcom/soundcloud/android/ui/components/buttons/DownloadActionButton${'$'}State;)Lcom/soundcloud/android/ui/components/buttons/DownloadActionButton${'$'}State;
                    move-result-object v$stateRegister
                """.trimIndent(),
            )
        }

        // Playlist page state: normalize the download button before ViewState creation.
        PlaylistRendererFingerprint.method.apply {
            val viewStateIndex = indexOfFirstInstructionOrThrow {
                opcode == Opcode.NEW_INSTANCE &&
                    typeReferenceOrNull()?.type ==
                    "Lcom/soundcloud/android/ui/components/buttons/DownloadActionButton${'$'}ViewState;"
            }
            val stateRegister =
                getInstruction<OneRegisterInstruction>(viewStateIndex - 1).registerA
            addInstructions(
                viewStateIndex,
                """
                    invoke-static {v$stateRegister}, $HOOK->normalizeDownloadState(Lcom/soundcloud/android/ui/components/buttons/DownloadActionButton${'$'}State;)Lcom/soundcloud/android/ui/components/buttons/DownloadActionButton${'$'}State;
                    move-result-object v$stateRegister
                """.trimIndent(),
            )
        }

        // Library: remove the native Downloads link while the external hook is active.
        LibraryLinksFingerprint.method.apply {
            val artistViewIndex = indexOfFirstInstructionOrThrow {
                fieldReferenceOrNull()?.let {
                    it.definingClass ==
                        "Lcom/soundcloud/android/features/library/LibraryLinksViewHolder;" &&
                        it.name == "b"
                } == true
            }
            val fieldInstruction =
                getInstruction<TwoRegisterInstruction>(artistViewIndex)
            val targetRegister = fieldInstruction.registerA
            val holderRegister = fieldInstruction.registerB
            addInstructions(
                artistViewIndex,
                """
                    iget-object v$targetRegister, v$holderRegister, Lcom/soundcloud/android/features/library/LibraryLinksViewHolder;->a:Lcom/soundcloud/android/ui/components/actionlists/ActionListItem;
                    invoke-static {v$targetRegister}, $HOOK->applyLibraryDownloadsVisibility(Landroid/view/View;)V
                """.trimIndent(),
            )
        }

        // Playlist bottom sheet: route both Download and Downloaded actions externally.
        PlaylistBottomSheetClickFingerprint.method.apply {
            val targets = listOf(
                indexOfFirstInstructionOrThrow {
                    fieldReferenceOrNull()?.let {
                        it.definingClass ==
                            "Lcom/soundcloud/android/features/bottomsheet/playlist/" +
                                "PlaylistMenuItem${'$'}Download;" && it.name == "e"
                    } == true
                },
                indexOfFirstInstructionOrThrow {
                    fieldReferenceOrNull()?.let {
                        it.definingClass ==
                            "Lcom/soundcloud/android/features/bottomsheet/playlist/" +
                                "PlaylistMenuItem${'$'}Downloaded;" && it.name == "e"
                    } == true
                },
            )

            targets.sortedDescending().forEach { targetIndex ->
                val continueInstruction = instructions[targetIndex]
                addInstructionsWithLabels(
                    targetIndex,
                    """
                        invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;
                        move-result-object v4
                        invoke-static {v4, v1}, $HOOK->tryShareRemembered(Landroid/content/Context;Ljava/lang/Object;)Z
                        move-result v4
                        if-eqz v4, :continue
                        invoke-virtual {v2}, Landroidx/fragment/app/DialogFragment;->dismissAllowingStateLoss()V
                        sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
                        return-object v0
                    """.trimIndent(),
                    ExternalLabel("continue", continueInstruction),
                )
            }
        }

        // Playlist loader: cache the public URL by PlaylistUrn for bottom-sheet actions.
        PlaylistUrlFingerprint.method.apply {
            val keyCallIndex = indexOfFirstInstructionOrThrow {
                methodReferenceOrNull()?.let {
                    it.definingClass ==
                        "Lcom/soundcloud/android/foundation/domain/playlists/PlaylistItem;" &&
                        it.name == "getPlaylistUrn"
                } == true
            }
            val keyRegister =
                getInstruction<OneRegisterInstruction>(keyCallIndex + 1).registerA
            val urlCallIndex = indexOfFirstInstructionOrThrow {
                methodReferenceOrNull()?.let {
                    it.definingClass ==
                        "Lcom/soundcloud/android/foundation/domain/playlists/PlaylistItem;" &&
                        it.name == "getPermalinkUrl"
                } == true
            }
            val urlRegister =
                getInstruction<OneRegisterInstruction>(urlCallIndex + 1).registerA
            addInstructions(
                urlCallIndex + 2,
                "invoke-static {v$keyRegister, v$urlRegister}, " +
                    "$HOOK->rememberUrl(Ljava/lang/Object;Ljava/lang/String;)V",
            )
        }

        // Playlist "Downloaded" menu item: retain the download label/icon for the external action.
        PlaylistDownloadedConstructorFingerprint.method.apply {
            val labelRegister = getInstruction<OneRegisterInstruction>(0).registerA
            val iconRegister = getInstruction<OneRegisterInstruction>(1).registerA
            val insertIndex = 2
            val continueInstruction = instructions[insertIndex]
            addInstructionsWithLabels(
                insertIndex,
                """
                    invoke-static {}, $HOOK->isEnabled()Z
                    move-result v2
                    if-eqz v2, :continue
                    sget v$labelRegister, Lcom/soundcloud/android/features/bottomsheet/playlist/R${'$'}string;->download_playlist:I
                    sget v$iconRegister, Lcom/soundcloud/android/ui/components/R${'$'}drawable;->ic_actions_download_initial:I
                """.trimIndent(),
                ExternalLabel("continue", continueInstruction),
            )
        }

        // Track "Remove from downloads" item: retain the add/download label and icon.
        TrackRemoveDownloadConstructorFingerprint.method.apply {
            val labelRegister = getInstruction<OneRegisterInstruction>(0).registerA
            val iconRegister = getInstruction<OneRegisterInstruction>(1).registerA
            val insertIndex = 2
            val continueInstruction = instructions[insertIndex]
            addInstructionsWithLabels(
                insertIndex,
                """
                    invoke-static {}, $HOOK->isEnabled()Z
                    move-result v2
                    if-eqz v2, :continue
                    sget v$labelRegister, Lcom/soundcloud/android/features/bottomsheet/track/R${'$'}string;->menu_add_to_downloads:I
                    sget v$iconRegister, Lcom/soundcloud/android/ui/components/R${'$'}drawable;->ic_actions_download_initial:I
                """.trimIndent(),
                ExternalLabel("continue", continueInstruction),
            )
        }

        // Track bottom sheet: route both downloaded and selective-download actions externally.
        TrackBottomSheetClickFingerprint.method.apply {
            val removeIndex = indexOfFirstInstructionOrThrow {
                fieldReferenceOrNull()?.let {
                    it.definingClass ==
                        "Lcom/soundcloud/android/features/bottomsheet/track/" +
                            "TrackMenuItem${'$'}RemoveFromDownload;" && it.name == "e"
                } == true
            }
            val selectiveIndex = indexOfFirstInstructionOrThrow {
                fieldReferenceOrNull()?.let {
                    it.definingClass ==
                        "Lcom/soundcloud/android/features/bottomsheet/track/" +
                            "TrackMenuItem${'$'}SelectiveDownload;" && it.name == "e"
                } == true
            }

            // Higher index first, so the lower insertion point remains stable.
            val selectiveContinue = instructions[selectiveIndex]
            addInstructionsWithLabels(
                selectiveIndex,
                """
                    iget-object v2, v3, Lcom/soundcloud/android/features/bottomsheet/track/TrackBottomSheetViewModel;->z:Ljava/lang/String;
                    invoke-virtual {v8}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;
                    move-result-object v3
                    invoke-static {v3, v2}, $HOOK->tryShare(Landroid/content/Context;Ljava/lang/String;)Z
                    move-result v3
                    if-eqz v3, :continue
                    invoke-virtual {v8}, Landroidx/fragment/app/DialogFragment;->dismissAllowingStateLoss()V
                    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
                    return-object v0
                """.trimIndent(),
                ExternalLabel("continue", selectiveContinue),
            )

            val removeContinue = instructions[removeIndex]
            addInstructionsWithLabels(
                removeIndex,
                """
                    iget-object v2, v3, Lcom/soundcloud/android/features/bottomsheet/track/TrackBottomSheetViewModel;->z:Ljava/lang/String;
                    invoke-virtual {v8}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;
                    move-result-object v1
                    invoke-static {v1, v2}, $HOOK->tryShare(Landroid/content/Context;Ljava/lang/String;)Z
                    move-result v1
                    if-eqz v1, :continue
                    invoke-virtual {v8}, Landroidx/fragment/app/DialogFragment;->dismissAllowingStateLoss()V
                    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
                    return-object v0
                """.trimIndent(),
                ExternalLabel("continue", removeContinue),
            )
        }
    }
}
