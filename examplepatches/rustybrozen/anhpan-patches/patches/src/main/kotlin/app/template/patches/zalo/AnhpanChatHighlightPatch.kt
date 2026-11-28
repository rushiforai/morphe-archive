package app.template.patches.zalo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction


internal object TabMsgUnreadHighlightFingerprint : Fingerprint(
    definingClass = "Lcom/zing/zalo/ui/moduleview/message/TabMsgCommonItemModuleView;",
    name = "Z",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf("Lpup;", "I"),
)

internal object NormalMsgUnreadHighlightFingerprint : Fingerprint(
    definingClass = "Lcom/zing/zalo/ui/moduleview/message/NormalMsgModuleView;",
    name = "Z",
    returnType = "Z",
    parameters = listOf("Lpup;", "I"),
)

internal object NormalMsgUnreadBadgeFingerprint : Fingerprint(
    definingClass = "Lcom/zing/zalo/ui/moduleview/message/NormalMsgModuleView;",
    name = "T",
    returnType = "V",
    parameters = listOf("Lpup;", "Z", "I"),
)


@Suppress("unused")
val anhpanChatHighlightPatch = bytecodePatch(
    name = "Highlight chats",
    description = "Long-press a chat to highlight it as unread.",
    default = true,
) {
    compatibleWith(zaloCompatibility)
    extendWith("extensions/extension.mpe")

    execute {
        // Base class: TabMsgCommonItemModuleView.Z
        check(TabMsgUnreadHighlightFingerprint.matchAll(1..1).size == 1)
        val unreadMethod = TabMsgUnreadHighlightFingerprint.method
        val firstInstruction = unreadMethod.getInstruction(0)
        unreadMethod.addInstructionsWithLabels(
            0,
            """
                invoke-static {p0, p1}, $ANHPAN_SETTINGS->shouldDisableUnreadHighlight(Landroid/view/View;Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :anhpan_original_unread
                const/4 v0, 0x0
                return v0
            """.trimIndent(),
            ExternalLabel("anhpan_original_unread", firstInstruction),
        )

        // Subclass override: NormalMsgModuleView.Z (actual render path)
        check(NormalMsgUnreadHighlightFingerprint.matchAll(1..1).size == 1)
        val normalUnread = NormalMsgUnreadHighlightFingerprint.method
        val normalUnreadBase = normalUnread.implementation!!.registerCount - 3
        val normalUnreadFirst = normalUnread.getInstruction(0)
        normalUnread.addInstructionsWithLabels(
            0,
            """
                move-object/from16 v0, v$normalUnreadBase
                move-object/from16 v1, v${normalUnreadBase + 1}
                invoke-static {v0, v1}, $ANHPAN_SETTINGS->shouldDisableUnreadHighlight(Landroid/view/View;Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :anhpan_normal_unread
                const/4 v0, 0x0
                return v0
            """.trimIndent(),
            ExternalLabel("anhpan_normal_unread", normalUnreadFirst),
        )

        // NormalMsgModuleView.T: suppress unread badge when highlight disabled
        check(NormalMsgUnreadBadgeFingerprint.matchAll(1..1).size == 1)
        val normalBadge = NormalMsgUnreadBadgeFingerprint.method
        val normalBadgeBase = normalBadge.implementation!!.registerCount - 4
        val normalBadgeFirst = normalBadge.getInstruction(0)
        normalBadge.addInstructionsWithLabels(
            0,
            """
                move-object/from16 v0, v$normalBadgeBase
                move-object/from16 v1, v${normalBadgeBase + 1}
                invoke-static {v0, v1}, $ANHPAN_SETTINGS->shouldDisableUnreadHighlight(Landroid/view/View;Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :anhpan_normal_badge
                move-object/from16 v0, v$normalBadgeBase
                invoke-static {v0}, $ANHPAN_CHAT_LOCK->hideUnreadBadge(Landroid/view/View;)V
                return-void
            """.trimIndent(),
            ExternalLabel("anhpan_normal_badge", normalBadgeFirst),
        )
    }
}
