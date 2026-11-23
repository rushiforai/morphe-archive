package io.github.xxlc.patches.grok

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode

// Only access .method in execute with BytecodePatchContext; find insertion points on mutable code.
internal fun postMenuForExtraAction(): Fingerprint = Fingerprint(
    definingClass = GrokNames.POST_MENU,
    name = GrokNames.POST_MENU_METHOD,
    isStatic = true,
    returnType = "Ljava/util/List;",
    parameters = listOf(GrokNames.POST_STATE),
)

internal fun postLabelForExtraAction(): Fingerprint = Fingerprint(
    definingClass = GrokNames.POST_MENU_LABEL,
    name = GrokNames.POST_MENU_LABEL_METHOD,
    isStatic = true,
    returnType = GrokNames.MENU_LABEL,
    parameters = listOf(GrokNames.MENU_ACTION),
)

internal fun postHandlerForExtraAction(): Fingerprint = Fingerprint(
    definingClass = GrokNames.POST_HANDLER,
    name = GrokNames.POST_ACTION_METHOD,
    isStatic = false,
    returnType = "Ljava/lang/Object;",
    parameters = listOf(GrokNames.MENU_ACTION, GrokNames.MEDIA_ID, GrokNames.POST_CONTINUATION),
)

internal fun MutableMethod.appendCopyPromptAction() {
    requireRegisterCount(27)
    val returnIndex = implementation!!.instructions.lastIndex
    check(implementation!!.instructions[returnIndex].opcode == Opcode.RETURN_OBJECT) {
        "Menu list end point does not match original smali."
    }
    requireRegisters(returnIndex, 0)
    // v0 is list; preserve p0=v26 and v10/v24 of original path.
    // v1..v6 are dead at final return; block creates its own list copy.
    // Only add when current media is finished and unmoderated (Ll70/f0;->D != null and
    // Le8/o;->s() == false): on error/generating D returns null; moderated media is still Le8/o; but
    // s() returns true, where the app displays Retry so Copy prompt must not be inserted.
    addInstructionsWithLabels(
        returnIndex,
        """
            move-object/from16 v5, p0
            invoke-static {v5}, ${GrokNames.COMPLETED_MEDIA}
            move-result-object v5
            if-eqz v5, :d2_copy_menu_done
            invoke-interface {v5}, ${GrokNames.MEDIA_MODERATED}
            move-result v5
            if-nez v5, :d2_copy_menu_done
            move-object/from16 v5, p0
            iget-object v5, v5, ${GrokNames.CURRENT_PROMPT}
            invoke-static {v5}, Lio/github/xxlc/extension/grok/ClipboardHelper;->canCopy(Ljava/lang/String;)Z
            move-result v5
            if-eqz v5, :d2_copy_menu_done
            new-instance v1, Ljava/util/ArrayList;
            invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
            new-instance v2, ${GrokNames.DOWNLOAD_ACTION}
            sget-object v3, ${GrokNames.DEFAULT_DOWNLOAD_STATE}
            invoke-direct {v2, v3}, ${GrokNames.NEW_DOWNLOAD_ACTION}
            const/4 v3, 0x1
            iput-boolean v3, v2, ${GrokNames.COPY_PROMPT_FLAG}
            const/4 v6, 0x1
            new-instance v4, ${GrokNames.MENU_ITEM}
            invoke-direct {v4, v2, v6}, ${GrokNames.NEW_MENU_ITEM}
            invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
            move-object v0, v1
            :d2_copy_menu_done
            nop
        """,
    )
}

internal fun MutableMethod.labelCopyPromptAction(stringId: Int) {
    requireRegisterCount(10)
    // At entry only p0=v9 is live. Original path re-initializes v0 before reading.
    addInstructionsWithLabels(
        0,
        """
            instance-of v0, p0, ${GrokNames.DOWNLOAD_ACTION}
            if-eqz v0, :d2_copy_label_original
            move-object v0, p0
            check-cast v0, ${GrokNames.DOWNLOAD_ACTION}
            iget-boolean v0, v0, ${GrokNames.COPY_PROMPT_FLAG}
            if-eqz v0, :d2_copy_label_original
            new-instance v3, ${GrokNames.MENU_LABEL}
            const/4 v7, 0x0
            sget-object v8, ${GrokNames.COPY_ICON}
            const/16 v6, 0xc
            const v4, $stringId
            const/4 v5, 0x0
            invoke-direct/range {v3 .. v8}, ${GrokNames.NEW_MENU_LABEL}
            return-object v3
            :d2_copy_label_original
            nop
        """,
    )
}
