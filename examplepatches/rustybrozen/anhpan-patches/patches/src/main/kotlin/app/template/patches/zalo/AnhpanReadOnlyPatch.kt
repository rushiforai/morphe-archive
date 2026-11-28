package app.template.patches.zalo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction


internal object ChatInputBarInitFingerprint : Fingerprint(
    definingClass = "Lcom/zing/zalo/ui/chat/widget/inputbar/ChatInputBar;",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "Lz34;", "Ls64;", "Lnh7;"),
)

internal object ReactionPickerInitFingerprint : Fingerprint(
    definingClass = "Lcom/zing/zalo/ui/widget/reaction/ReactionPickerView;",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Z", "Ljava/lang/String;", "Lytk;", "Ljava/lang/String;"),
)

internal object ChatRowReactionBarFingerprint : Fingerprint(
    definingClass = "Lcom/zing/zalo/ui/chat/chatrow/ChatRow;",
    name = "I",
    returnType = "Z",
    parameters = listOf("Ljug;", "Lvv3;"),
)

internal object ChatRowShareBtnFingerprint : Fingerprint(
    definingClass = "Lcom/zing/zalo/ui/chat/chatrow/ChatRow;",
    name = "R0",
    returnType = "Z",
    parameters = emptyList(),
)

internal object ChatRowAvatarClickFingerprint : Fingerprint(
    definingClass = "Lcom/zing/zalo/ui/chat/chatrow/ChatRow;",
    name = "T1",
    returnType = "Z",
    parameters = listOf("F", "F", "I"),
)

internal object ChatActionBarBtnFingerprint : Fingerprint(
    definingClass = "Lcom/zing/zalo/ui/chat/actionbar/ChatViewActionBarButton;",
    name = "setIconResId",
    returnType = "V",
    parameters = listOf("I"),
)

internal object ChatViewActionBarT6Fingerprint : Fingerprint(
    definingClass = "Lcom/zing/zalo/ui/chat/ChatView;",
    name = "T6",
    returnType = "Lcom/zing/zalo/ui/chat/actionbar/ChatViewActionBarButton;",
    parameters = listOf("Lim4;", "I"),
)

internal object ChatInfoViewCreateFingerprint : Fingerprint(
    definingClass = "Lcom/zing/zalo/ui/chat/rightmenu/ChatInfoView;",
    name = "n5",
    returnType = "Landroid/view/View;",
    parameters = listOf("Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;", "Landroid/os/Bundle;"),
)

internal object SettingHorizontalBindFingerprint : Fingerprint(
    definingClass = "Lcom/zing/zalo/ui/moduleview/chatinfo/ChatInfoModuleViews\$SettingHorizontalModuleView;",
    name = "g",
    returnType = "V",
    parameters = listOf("La04;", "I"),
)

internal object ChatSettingBindFingerprint : Fingerprint(
    definingClass = "Lcom/zing/zalo/ui/moduleview/chatinfo/ChatInfoModuleViews\$ChatSettingModuleView;",
    name = "g",
    returnType = "V",
    parameters = listOf("La04;", "I"),
)

internal object ChatRowOnDrawFingerprint : Fingerprint(
    definingClass = "Lcom/zing/zalo/ui/chat/chatrow/ChatRow;",
    name = "onDraw",
    returnType = "V",
    parameters = listOf("Landroid/graphics/Canvas;"),
)

internal object ChatRowSenderNameFingerprint : Fingerprint(
    definingClass = "Lcom/zing/zalo/ui/chat/chatrow/ChatRow;",
    name = "e0",
    returnType = "V",
    parameters = listOf("Landroid/graphics/Canvas;", "Z"),
)


@Suppress("unused")
val anhpanReadOnlyPatch = bytecodePatch(
    name = "Read-only chats",
    description = "Long-press a chat to lock it so you cannot send messages by mistake.",
    default = true,
) {
    compatibleWith(zaloCompatibility)
    extendWith("extensions/extension.mpe")

    execute {
        // Replace chat input bar with locked banner
        check(ChatInputBarInitFingerprint.matchAll(1..1).size == 1)
        val inputBarInit = ChatInputBarInitFingerprint.method
        val inputBarReturn = inputBarInit.implementation!!.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
        check(inputBarReturn >= 0)
        val inputBarBase = inputBarInit.implementation!!.registerCount - 6
        inputBarInit.addInstructions(
            inputBarReturn,
            """
                move-object/from16 v0, v$inputBarBase
                move-object/from16 v1, v${inputBarBase + 2}
                invoke-static {v0, v1}, $ANHPAN_CHAT_LOCK->applyInputBar(Landroid/view/View;Ljava/lang/String;)V
            """.trimIndent(),
        )

        // Hide emoji reaction picker
        check(ReactionPickerInitFingerprint.matchAll(1..1).size == 1)
        val reactionInit = ReactionPickerInitFingerprint.method
        val reactionReturn = reactionInit.implementation!!.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
        check(reactionReturn >= 0)
        val reactionBase = reactionInit.implementation!!.registerCount - 6
        reactionInit.addInstructions(
            reactionReturn,
            """
                move-object/from16 v0, v$reactionBase
                invoke-static {v0}, $ANHPAN_CHAT_LOCK->applyReactionPicker(Landroid/view/View;)V
            """.trimIndent(),
        )

        // Hide quick heart on media
        check(ChatRowReactionBarFingerprint.matchAll(1..1).size == 1)
        val rowReaction = ChatRowReactionBarFingerprint.method
        val rowReactionFirst = rowReaction.getInstruction(0)
        rowReaction.addInstructionsWithLabels(
            0,
            """
                invoke-static {p0}, $ANHPAN_CHAT_LOCK->shouldHideQuickHeart(Landroid/view/View;)Z
                move-result v0
                if-eqz v0, :anhpan_orig_heart
                const/4 v0, 0x0
                return v0
            """.trimIndent(),
            ExternalLabel("anhpan_orig_heart", rowReactionFirst),
        )

        // Hide share button on media
        check(ChatRowShareBtnFingerprint.matchAll(1..1).size == 1)
        val rowShare = ChatRowShareBtnFingerprint.method
        val rowShareFirst = rowShare.getInstruction(0)
        rowShare.addInstructionsWithLabels(
            0,
            """
                invoke-static {p0}, $ANHPAN_CHAT_LOCK->shouldHideQuickShare(Landroid/view/View;)Z
                move-result v0
                if-eqz v0, :anhpan_orig_share
                const/4 v0, 0x0
                return v0
            """.trimIndent(),
            ExternalLabel("anhpan_orig_share", rowShareFirst),
        )

        // Block avatar tap on chat rows
        check(ChatRowAvatarClickFingerprint.matchAll(1..1).size == 1)
        val rowAvatar = ChatRowAvatarClickFingerprint.method
        val rowAvatarFirst = rowAvatar.getInstruction(0)
        rowAvatar.addInstructionsWithLabels(
            0,
            """
                invoke-static {}, $ANHPAN_CHAT_LOCK->isActiveConvLocked()Z
                move-result v0
                if-eqz v0, :anhpan_orig_avatar
                const/4 v0, 0x0
                return v0
            """.trimIndent(),
            ExternalLabel("anhpan_orig_avatar", rowAvatarFirst),
        )

        // Hide call/video/add action bar buttons
        check(ChatActionBarBtnFingerprint.matchAll(1..1).size == 1)
        ChatActionBarBtnFingerprint.method.addInstructions(
            0,
            "invoke-static {p0, p1}, $ANHPAN_CHAT_LOCK->applyActionBarButton(Landroid/view/View;I)V",
        )

        // Hook T6 to capture and hide buttons
        check(ChatViewActionBarT6Fingerprint.matchAll(1..1).size == 1)
        val t6Method = ChatViewActionBarT6Fingerprint.method
        val t6Ret = t6Method.implementation!!.instructions.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
        check(t6Ret >= 0)
        val t6RetReg = t6Method.getInstruction<OneRegisterInstruction>(t6Ret).registerA
        val t6Base = t6Method.implementation!!.registerCount - 3
        t6Method.addInstructions(
            t6Ret,
            """
                move-object/from16 v0, v$t6RetReg
                invoke-static {v0}, $ANHPAN_CHAT_LOCK->applyCapturedActionBarButton(Landroid/view/View;)V
            """.trimIndent(),
        )
        t6Method.addInstructions(
            0,
            """
                move/from16 v0, v${t6Base + 2}
                invoke-static {v0}, $ANHPAN_CHAT_LOCK->captureActionResId(I)V
            """.trimIndent(),
        )

        // Filter group info panel items
        check(ChatInfoViewCreateFingerprint.matchAll(1..1).size == 1)
        val infoCreate = ChatInfoViewCreateFingerprint.method
        val infoRet = infoCreate.implementation!!.instructions.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
        check(infoRet >= 0)
        val infoRetReg = infoCreate.getInstruction<OneRegisterInstruction>(infoRet).registerA
        infoCreate.addInstructions(
            infoRet,
            "invoke-static {v$infoRetReg}, $ANHPAN_CHAT_LOCK->applyChatInfoView(Landroid/view/View;)V",
        )

        // Tag/filter horizontal setting rows in group info
        check(SettingHorizontalBindFingerprint.matchAll(1..1).size == 1)
        val hBind = SettingHorizontalBindFingerprint.method
        val hBindBase = hBind.implementation!!.registerCount - 3
        hBind.addInstructions(
            0,
            """
                move-object/from16 v0, v${hBindBase + 1}
                invoke-static {v0}, $ANHPAN_CHAT_LOCK->filterHorizontalItems(Ljava/lang/Object;)V
            """.trimIndent(),
        )

        // Tag setting rows for hide
        check(ChatSettingBindFingerprint.matchAll(1..1).size == 1)
        val sBind = ChatSettingBindFingerprint.method
        val sBindBase = sBind.implementation!!.registerCount - 3
        val sBindRet = sBind.implementation!!.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
        check(sBindRet >= 0)
        sBind.addInstructions(
            sBindRet,
            """
                move-object/from16 v0, v$sBindBase
                invoke-static {v0}, $ANHPAN_CHAT_LOCK->applySettingHideTag(Landroid/view/View;)V
            """.trimIndent(),
        )
        sBind.addInstructions(
            0,
            """
                move-object/from16 v0, v$sBindBase
                move-object/from16 v1, v${sBindBase + 1}
                invoke-static {v0, v1}, $ANHPAN_CHAT_LOCK->tagSettingItem(Landroid/view/View;Ljava/lang/Object;)V
            """.trimIndent(),
        )

        // Hide avatar draw on chat rows (read-only hide avatar setting)
        check(ChatRowOnDrawFingerprint.matchAll(1..1).size == 1)
        val rowDraw = ChatRowOnDrawFingerprint.method
        val rowDrawBase = rowDraw.implementation!!.registerCount - 2
        rowDraw.addInstructions(
            0,
            """
                move-object/from16 v0, v$rowDrawBase
                invoke-static {v0}, $ANHPAN_CHAT_LOCK->applyChatRowDraw(Landroid/view/View;)V
            """.trimIndent(),
        )

        // De-color sender names on chat rows
        check(ChatRowSenderNameFingerprint.matchAll(1..1).size == 1)
        val rowName = ChatRowSenderNameFingerprint.method
        val rowNameBase = rowName.implementation!!.registerCount - 3
        rowName.addInstructions(
            0,
            """
                move-object/from16 v0, v$rowNameBase
                invoke-static {v0}, $ANHPAN_CHAT_LOCK->applySenderNameColor(Landroid/view/View;)V
            """.trimIndent(),
        )
    }
}
