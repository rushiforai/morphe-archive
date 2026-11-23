package io.github.xxlc.patches.grok

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction

@Suppress("unused")
val postDownloadAllPatch = bytecodePatch(
    name = "Download all (post)",
    description = "Add a menu item that downloads all media of the Imagine post being viewed, keeping the original Download item.",
    default = true,
) {
    compatibleWith(grokCompatibility)
    dependsOn(downloadResourcesPatch, postActionFlagsPatch)

    val enabled by enabledOption()

    execute {
        if (enabled != true) return@execute

        PostMenuFingerprint.method.apply {
            requireRegisterCount(27) // .locals 26 and one static parameter.
            val returnIndex = implementation!!.instructions.lastIndex
            check(implementation!!.instructions[returnIndex].opcode == Opcode.RETURN_OBJECT) {
                "Menu list end point does not match original smali."
            }
            requireRegisters(returnIndex, 0)
            // At method end only v0 (list) and v10 (Ly7/m2 flag) need to be preserved.
            // Clone list then insert right after Download; skip if missing (generating, error, moderated).
            addInstructionsWithLabels(
                returnIndex,
                """
                    new-instance v1, Ljava/util/ArrayList;
                    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
                    new-instance v2, ${GrokNames.DOWNLOAD_ACTION}
                    sget-object v3, ${GrokNames.DEFAULT_DOWNLOAD_STATE}
                    invoke-direct {v2, v3}, ${GrokNames.NEW_DOWNLOAD_ACTION}
                    const/4 v3, 0x1
                    iput-boolean v3, v2, ${GrokNames.DOWNLOAD_ALL_FLAG}
                    new-instance v4, ${GrokNames.MENU_ITEM}
                    invoke-direct {v4, v2, v10}, ${GrokNames.NEW_MENU_ITEM}
                    const/4 v6, 0x0
                    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;
                    move-result-object v5
                    :find_download
                    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z
                    move-result v7
                    if-eqz v7, :skip_download_all
                    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;
                    move-result-object v7
                    check-cast v7, ${GrokNames.MENU_ITEM}
                    iget-object v7, v7, ${GrokNames.MENU_ITEM_ACTION}
                    add-int/lit8 v6, v6, 0x1
                    instance-of v7, v7, ${GrokNames.DOWNLOAD_ACTION}
                    if-eqz v7, :find_download
                    :insert_download_all
                    invoke-virtual {v1, v6, v4}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
                    move-object v0, v1
                    :skip_download_all
                    nop
                """,
            )
        }

        PostMenuLabelFingerprint.method.apply {
            requireRegisterCount(10)
            // Fingerprint stores indices on original code; other label patches may have inserted at start.
            // Keep ID looked up by resource name, but re-locate index on current mutable code.
            val saveStringId = (PostMenuLabelFingerprint.instructionMatches.single().instruction as NarrowLiteralInstruction).narrowLiteral
            val labelIndex = implementation!!.instructions.withIndex().single { (_, instruction) ->
                instruction.opcode == Opcode.CONST &&
                    (instruction as? NarrowLiteralInstruction)?.narrowLiteral == saveStringId
            }.index
            requireRegisters(labelIndex, 4)
            // Original constant has been looked up by resource name via fingerprint.
            addInstructionsWithLabels(
                labelIndex + 1,
                """
                    move-object v0, p0
                    check-cast v0, ${GrokNames.DOWNLOAD_ACTION}
                    iget-boolean v0, v0, ${GrokNames.DOWNLOAD_ALL_FLAG}
                    if-eqz v0, :original_label
                    const v4, $downloadAllStringId
                    sget-object v8, ${GrokNames.DOWNLOAD_ALL_ICON}
                    :original_label
                    nop
                """,
            )
        }

        PostActionFingerprint.method.apply {
            requireRegisterCount(22)
            val sendIndex = indexOfReference(Opcode.SGET_OBJECT, GrokNames.POST_DOWNLOAD_SINGLETON)
            requireRegisters(sendIndex, 0)
            // Preserve verified registers and download callback discriminator 0xd.
            // Current media still passes through original branch after dispatching remaining media.
            addInstructionsWithLabels(
                sendIndex,
                """
                    move-object v4, v0
                    check-cast v4, ${GrokNames.DOWNLOAD_ACTION}
                    iget-boolean v4, v4, ${GrokNames.DOWNLOAD_ALL_FLAG}
                    if-eqz v4, :sd_done
                    invoke-virtual {v1}, ${GrokNames.CURRENT_POST}
                    move-result-object v4
                    if-eqz v4, :sd_done
                    invoke-virtual {v4}, ${GrokNames.POST_MEDIA}
                    move-result-object v4
                    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;
                    move-result-object v4
                    :sd_loop
                    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z
                    move-result v5
                    if-eqz v5, :sd_done
                    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;
                    move-result-object v5
                    check-cast v5, ${GrokNames.MEDIA}
                    if-eqz v3, :sd_send
                    if-eq v5, v3, :sd_loop
                    invoke-interface {v5}, ${GrokNames.GET_MEDIA_ID}
                    move-result-object v6
                    invoke-interface {v3}, ${GrokNames.GET_MEDIA_ID}
                    move-result-object v12
                    invoke-static {v6, v12}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z
                    move-result v6
                    if-nez v6, :sd_loop
                    :sd_send
                    new-instance v12, ${GrokNames.DOWNLOAD_CALLBACK}
                    move-object v13, v1
                    sget-object v14, ${GrokNames.POST_DOWNLOAD_SINGLETON}
                    move-object v15, v5
                    move-object/from16 v16, v11
                    const/16 v17, ${GrokNames.POST_DOWNLOAD_DISCRIMINATOR}
                    invoke-direct/range {v12 .. v17}, ${GrokNames.NEW_DOWNLOAD_CALLBACK}
                    invoke-static {v7, v11, v11, v12, v8}, ${GrokNames.LAUNCH_COROUTINE}
                    goto :sd_loop
                    :sd_done
                    nop
                """,
            )
        }
    }
}
