/*
 * Based on Michii Patches by heyymichii, GPLv3:
 * https://github.com/heyymichii/michii-patches
 *
 * Modifications copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.linkedin.messaging

import app.fakh.patches.linkedin.shared.Constants.COMPATIBILITY_LINKEDIN
import app.fakh.patches.linkedin.shared.Constants.EXTENSION_PACKAGE
import app.fakh.patches.linkedin.shared.Constants.GHOST_MODE
import app.fakh.patches.linkedin.shared.Constants.HIDE_SPONSORED_MESSAGES
import app.fakh.patches.linkedin.shared.Constants.MARK_READ_AFTER_REPLY
import app.fakh.patches.linkedin.shared.settingsPatch
import app.fakh.patches.shared.register
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.smali.ExternalLabel

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/MessagingPatch;"
private const val RESOURCE = "Lcom/linkedin/android/architecture/data/Resource;"

/** ConversationListItemTransformer.TransformerInput(List conversationItems, List, ArrayList, boolean, Urn). */
private object ConversationListInputFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/messaging/conversationlist/ConversationListItemTransformer\$TransformerInput;",
    name = "<init>",
    parameters = listOf("Ljava/util/List;", "Ljava/util/List;", "Ljava/util/ArrayList;", "Z", "L"),
)

/** ConversationWriteNetworkStoreImpl.sendTypingIndicator(Urn, Continuation): POSTs the "typing" action. */
private object SendTypingIndicatorFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/messenger/data/networking/impl/ConversationWriteNetworkStoreImpl;",
    name = "sendTypingIndicator",
    returnType = "Ljava/lang/Object;",
)

/** DeliveryHelperImpl.sendMessage(MessageToSend, ContinuationImpl): delivers a message the user wrote. */
private object DeliverMessageFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/messenger/data/repository/DeliveryHelperImpl;",
    name = "sendMessage",
    parameters = listOf("Lcom/linkedin/android/messenger/data/local/room/model/MessageToSend;", "L"),
)

/** MessagingSdkWriteFlowFeatureImpl.updateConversationReadStatus(List, boolean): LiveData. */
private object UpdateReadStatusFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/messaging/sdk/MessagingSdkWriteFlowFeatureImpl;",
    name = "updateConversationReadStatus",
    returnType = "Landroidx/lifecycle/LiveData;",
    parameters = listOf("Ljava/util/List;", "Z"),
)

@Suppress("unused")
val messagingPatch = patch(
    name = "Messaging",
    description = "Hides sponsored messages, and adds an optional ghost mode that does not send " +
        "typing indicators or read status.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Privacy")
    dependsOn(settingsPatch)

    execute {
        register(HIDE_SPONSORED_MESSAGES, GHOST_MODE, MARK_READ_AFTER_REPLY)

        // Filter the conversation list before it is transformed. Range form: p1 can be above v15.
        ConversationListInputFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->filterSponsoredConversations(Ljava/util/List;)Ljava/util/List;
                move-result-object p1
            """
        )

        // Ghost mode: report success without sending the typing request.
        SendTypingIndicatorFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $EXTENSION_CLASS->blockTypingIndicator()Z
                    move-result v0
                    if-eqz v0, :send
                    const/4 v0, 0x0
                    invoke-static { v0 }, $RESOURCE->success(Ljava/lang/Object;)${RESOURCE.dropLast(1)}${'$'}Success;
                    move-result-object v0
                    return-object v0
                """,
                ExternalLabel("send", getInstruction(0))
            )
        }

        // Ghost mode: remember a replied conversation, so it can be marked as read.
        DeliverMessageFingerprint.method.addInstructions(
            0,
            "invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->messageSent(Ljava/lang/Object;)V"
        )

        // Ghost mode: opening a chat no longer marks it as read on the server.
        UpdateReadStatusFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static/range { p1 .. p2 }, $EXTENSION_CLASS->blockMarkAsRead(Ljava/util/List;Z)Z
                    move-result v0
                    if-eqz v0, :update
                    new-instance v0, Landroidx/lifecycle/MutableLiveData;
                    invoke-direct { v0 }, Landroidx/lifecycle/MutableLiveData;-><init>()V
                    return-object v0
                """,
                ExternalLabel("update", getInstruction(0))
            )
        }
    }
}
