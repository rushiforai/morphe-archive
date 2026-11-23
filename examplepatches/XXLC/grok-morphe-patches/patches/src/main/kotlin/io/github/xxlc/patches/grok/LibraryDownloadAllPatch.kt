package io.github.xxlc.patches.grok

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val STATE_CLASS = "Lio/github/xxlc/extension/grok/DownloadAllState;"
private const val LIBRARY_CONTEXT = "Le9/h;->l:Landroid/content/Context;"

@Suppress("unused")
val libraryDownloadAllPatch = bytecodePatch(
    name = "Download all (library)",
    description = "Add a button that downloads all media of the selected Imagine posts, keeping the original Download button.",
    default = true,
) {
    compatibleWith(grokCompatibility)
    dependsOn(downloadResourcesPatch)
    extendWith("extensions/extension.mpe")

    val enabled by enabledOption()

    execute {
        if (enabled != true) return@execute

        LibraryClickFingerprint.method.apply {
            requireRegisterCount(4) // .locals 3 and p0; v2 only loaded with null after insertion; prelude only uses v0, v1.
            val downloadIndex = indexOfReference(Opcode.SGET_OBJECT, GrokNames.LIBRARY_DOWNLOAD_SINGLETON)
            requireRegisters(downloadIndex, 0)
            // Original switch branch must execute flag-clearing operation when Download is pressed.
            addInstructionsAtControlFlowLabel(
                downloadIndex,
                """
                    const/4 v0, 0x0
                    sput-boolean v0, $STATE_CLASS->all:Z
                """,
            )
            // 0x7f lies outside 0x0..0x1c range; intercept separately before original packed-switch.
            // Normal path re-initializes v0, v1 in original code.
            addInstructionsWithLabels(
                0,
                """
                    iget-byte v0, p0, ${GrokNames.LIBRARY_CLICK_KIND}
                    const/16 v1, ${GrokNames.LIBRARY_DOWNLOAD_ALL_DISCRIMINATOR}
                    if-ne v0, v1, :original_click
                    iget-object v1, p0, ${GrokNames.LIBRARY_CLICK_ACTION}
                    const/4 v0, 0x1
                    sput-boolean v0, $STATE_CLASS->all:Z
                    sget-object v0, ${GrokNames.LIBRARY_DOWNLOAD_SINGLETON}
                    invoke-interface {v1, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;
                    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;
                    return-object v0
                    :original_click
                    nop
                """,
            )
        }

        LibraryButtonsFingerprint.method.apply {
            requireRegisterCount(34)
            val instructions = implementation!!.instructions
            val saveIndex = LibraryButtonsFingerprint.instructionMatches.first().index
            requireRegisters(saveIndex, 0)
            // Four calls share the same signature; pick the first call after save resource.
            val buttonIndex = instructions.withIndex().first { (index, instruction) ->
                index > saveIndex && instruction.opcode == Opcode.INVOKE_STATIC_RANGE &&
                    (instruction as? ReferenceInstruction)?.reference?.toString() ==
                    GrokNames.DRAW_LIBRARY_BUTTON
            }.index
            // Lock onto exact Download 0x13 callback between save and button draw call.
            val callbackIndex = instructions.withIndex().single { (index, instruction) ->
                index in (saveIndex + 1) until buttonIndex && instruction.opcode == Opcode.INVOKE_DIRECT &&
                    (instruction as? ReferenceInstruction)?.reference?.toString() ==
                    GrokNames.NEW_LIBRARY_CLICK
            }.index
            requireRegisters(callbackIndex, 3, 10, 0)
            requireRegisters(callbackIndex - 1, 0)
            check(instructions[callbackIndex - 1].opcode == Opcode.CONST_16 &&
                (instructions[callbackIndex - 1] as? NarrowLiteralInstruction)?.narrowLiteral == GrokNames.LIBRARY_DOWNLOAD_DISCRIMINATOR) {
                "Download button callback does not match original smali."
            }
            requireRegisters(buttonIndex, 16, 17, 18, 19, 20, 21, 22)
            // Insert after original Download draw call, keeping same layout and enabled state.
            addInstructionsWithLabels(
                buttonIndex + 1,
                """
                    sget-object v20, ${GrokNames.DOWNLOAD_ALL_ICON}
                    const v0, $downloadAllStringId
                    invoke-static {v0, v6}, ${GrokNames.GET_STRING}
                    move-result-object v17
                    invoke-static {v4, v1}, ${GrokNames.BUTTON_MODIFIER}
                    move-result-object v19
                    invoke-virtual {v6, v10}, ${GrokNames.COMPOSER_CHANGED}
                    move-result v0
                    invoke-virtual {v6}, ${GrokNames.COMPOSER_REMEMBERED}
                    move-result-object v3
                    if-nez v0, :sd_all_a
                    if-ne v3, v5, :sd_all_b
                    :sd_all_a
                    new-instance v3, ${GrokNames.LIBRARY_CLICK}
                    const/16 v0, ${GrokNames.LIBRARY_DOWNLOAD_ALL_DISCRIMINATOR}
                    invoke-direct {v3, v10, v0}, ${GrokNames.NEW_LIBRARY_CLICK}
                    invoke-virtual {v6, v3}, ${GrokNames.COMPOSER_UPDATE}
                    :sd_all_b
                    move-object/from16 v18, v3
                    check-cast v18, Lkotlin/jvm/functions/Function0;
                    move-object/from16 v21, v6
                    invoke-static/range {v16 .. v22}, ${GrokNames.DRAW_LIBRARY_BUTTON}
                """,
            )
        }

        LibrarySelectionFingerprint.method.apply {
            requireRegisterCount(47) // .locals 45, preserve register count.
            val postIndex = indexOfReference(Opcode.IGET_OBJECT, GrokNames.SELECTED_POST_VALUE)
            val singleIndex = indexOfReference(Opcode.NEW_INSTANCE, GrokNames.LIBRARY_DOWNLOAD_REQUEST)
            val resetIndex = indexOfReference(Opcode.IGET_OBJECT, GrokNames.LIBRARY_DOWNLOAD_PROCESSOR)
            requireRegisters(postIndex, 6, 6)
            requireRegisters(singleIndex, 6)
            requireRegisters(resetIndex, 2, 1)
            // v7 is overwritten immediately after processor; used temporarily to pass Context.
            check(implementation!!.instructions[resetIndex + 1].opcode == Opcode.IGET_OBJECT) {
                "Instruction overwriting v7 after processor does not match original smali."
            }
            requireRegisters(resetIndex + 1, 7, 1)

            // Obtain :cond_2f target from if-eqz v8 immediately after constructor Lw7/b1.
            val nextPostBranch = implementation!!.instructions[singleIndex + 3] as BuilderOffsetInstruction
            check(nextPostBranch.opcode == Opcode.IF_EQZ) {
                "Branch advancing to next post does not match original smali."
            }
            requireRegisters(singleIndex + 3, 8)
            val nextPostIndex = nextPostBranch.target.location.index

            // Insert backwards from end to start so unused indices are not shifted.
            // :goto_e is a jump target, so keep label on flag-clearing code.
            addInstructionsAtControlFlowLabel(
                resetIndex,
                """
                    const/4 v2, 0x0
                    sput-boolean v2, $STATE_CLASS->all:Z
                """,
            )
            // Insert before newly added flag-clearing block: v3 is collected request list,
            // v2/v7 are overwritten immediately after; v1 holds handler with public Context.
            // Avoid touching coroutine loop or increasing register count.
            addInstructionsAtControlFlowLabel(
                resetIndex,
                """
                    sget-object v2, ${GrokNames.LIBRARY_DOWNLOAD_SINGLETON}
                    if-ne v0, v2, :d2_library_notify_done
                    sget-boolean v2, $STATE_CLASS->all:Z
                    if-eqz v2, :d2_library_notify_done
                    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I
                    move-result v2
                    if-lez v2, :d2_library_notify_done
                    iget-object v7, v1, $LIBRARY_CONTEXT
                    invoke-static {v7, v2}, Lio/github/xxlc/extension/grok/Notify;->queued(Landroid/content/Context;I)V
                    :d2_library_notify_done
                    nop
                """,
            )
            // :cond_35 is also a jump target; loop must run before single-media branch.
            // v7, v10, v11 are dead at :cond_35; v8 (media), v9, and v12 remain live, so do not overwrite.
            addInstructionsAtControlFlowLabel(
                singleIndex,
                """
                    check-cast v0, ${GrokNames.LIBRARY_SELECTION_EVENT}
                    iget-object v7, v0, ${GrokNames.SELECTION_ACTION}
                    sget-object v10, ${GrokNames.LIBRARY_DOWNLOAD_SINGLETON}
                    if-ne v7, v10, :single_b1
                    sget-boolean v7, $STATE_CLASS->all:Z
                    if-eqz v7, :single_b1
                    invoke-virtual/range {v32 .. v32}, ${GrokNames.POST_MEDIA}
                    move-result-object v7
                    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;
                    move-result-object v7
                    :all_loop
                    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z
                    move-result v10
                    if-eqz v10, :next_post
                    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;
                    move-result-object v10
                    check-cast v10, ${GrokNames.MEDIA}
                    new-instance v11, ${GrokNames.LIBRARY_DOWNLOAD_REQUEST}
                    invoke-direct {v11, v4, v10}, ${GrokNames.NEW_LIBRARY_DOWNLOAD_REQUEST}
                    invoke-virtual {v3, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
                    goto :all_loop
                    :single_b1
                    nop
                """,
                ExternalLabel("next_post", nextPostIndex),
            )
            addInstruction(postIndex + 1, "move-object/from16 v32, v6")
        }
    }
}
