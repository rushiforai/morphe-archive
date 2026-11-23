package io.github.xxlc.patches.grok

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

@Suppress("unused")
val copyPromptPatch = bytecodePatch(
    name = "Copy prompt",
    description = "Add a post menu item with the copy icon that copies the current media prompt. It appears only for finished, non-moderated media (so the Retry action stays visible for failed or moderated generations) and only when the prompt is not empty. The 1.2.59 model has no seed, so seeds are not copied. Not tested on a device.",
    default = true,
) {
    compatibleWith(grokCompatibility)
    dependsOn(downloadResourcesPatch, postActionFlagsPatch)
    extendWith("extensions/extension.mpe")
    val enabled by enabledOption(default = true)

    execute {
        if (enabled != true) return@execute
        postMenuForExtraAction().method.appendCopyPromptAction()
        postLabelForExtraAction().method.labelCopyPromptAction(stringId("grok_xxlc_copy_prompt"))
        postHandlerForExtraAction().method.apply {
            requireRegisterCount(22)
            val mediaIndex = indexOfReference(Opcode.INVOKE_VIRTUAL, GrokNames.FIND_CURRENT_MEDIA)
            requireRegisters(mediaIndex, 1, 2)
            // After first three move-objects: v0/v1/v2 live, v5/v6 not yet live.
            // Both non-Copy branch and original code preserve p0..p3.
            addInstructionsWithLabels(
                mediaIndex,
                """
                    instance-of v5, v0, ${GrokNames.DOWNLOAD_ACTION}
                    if-eqz v5, :d2_copy_handler_original
                    move-object v5, v0
                    check-cast v5, ${GrokNames.DOWNLOAD_ACTION}
                    iget-boolean v5, v5, ${GrokNames.COPY_PROMPT_FLAG}
                    if-eqz v5, :d2_copy_handler_original
                    invoke-virtual {v1}, ${GrokNames.CURRENT_POST_STATE}
                    move-result-object v5
                    if-eqz v5, :d2_copy_handler_original
                    iget-object v6, v5, ${GrokNames.CURRENT_PROMPT}
                    iget-object v5, v1, ${GrokNames.POST_CONTEXT}
                    invoke-static {v5, v6}, Lio/github/xxlc/extension/grok/ClipboardHelper;->copyPrompt(Landroid/content/Context;Ljava/lang/String;)V
                    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;
                    return-object v0
                    :d2_copy_handler_original
                    nop
                """,
            )
        }
    }
}
