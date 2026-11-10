/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.patches.messaging

import app.linkedin.patches.shared.Constants.COMPATIBILITY_LINKEDIN
import app.linkedin.patches.shared.Constants.EXTENSION_PACKAGE
import app.linkedin.patches.shared.markIncluded
import app.linkedin.patches.shared.settingsPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel

private const val MESSAGING_PATCH = "$EXTENSION_PACKAGE/MessagingPatch;"
private const val RESULT_TYPE = "Lcom/linkedin/android/architecture/data/Resource;"
private val SUCCESS = "${RESULT_TYPE.dropLast(1)}${'$'}Success;"

/** ConversationListItemTransformer.TransformerInput(List conversationItems, List, ArrayList, boolean, Urn). */
private val conversationListInput = Fingerprint(
    definingClass = "Lcom/linkedin/android/messaging/conversationlist/ConversationListItemTransformer\$TransformerInput;",
    name = "<init>",
    parameters = listOf("Ljava/util/List;", "Ljava/util/List;", "Ljava/util/ArrayList;", "Z", "L"),
)

/** ConversationWriteNetworkStoreImpl.sendTypingIndicator(Urn, Continuation): the "typing" POST. */
private val typingIndicator = Fingerprint(
    definingClass = "Lcom/linkedin/android/messenger/data/networking/impl/ConversationWriteNetworkStoreImpl;",
    name = "sendTypingIndicator",
    returnType = "Ljava/lang/Object;",
)

/** MessagingSdkWriteFlowFeatureImpl.updateConversationReadStatus(List, boolean): LiveData. */
private val readStatusUpdate = Fingerprint(
    definingClass = "Lcom/linkedin/android/messaging/sdk/MessagingSdkWriteFlowFeatureImpl;",
    name = "updateConversationReadStatus",
    returnType = "Landroidx/lifecycle/LiveData;",
    parameters = listOf("Ljava/util/List;", "Z"),
)

@Suppress("unused")
val messagingPatch = bytecodePatch(
    name = "Messaging",
    description = "Drops sponsored messages from the inbox, and adds an optional ghost mode that sends no " +
        "typing indicators and no read receipts.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    dependsOn(settingsPatch)

    execute {
        markIncluded("isMessagingIncluded")

        // Filter the inbox before its items are transformed. Range form, since p1 can be above v15.
        conversationListInput.method.addInstructions(
            0,
            """
                invoke-static/range { p1 .. p1 }, $MESSAGING_PATCH->filterSponsoredConversations(Ljava/util/List;)Ljava/util/List;
                move-result-object p1
            """
        )

        // Ghost mode: answer the typing request with an empty success instead of sending it.
        with(typingIndicator.method) {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $MESSAGING_PATCH->blockTypingIndicator()Z
                    move-result v0
                    if-eqz v0, :let_typing_through
                    const/4 v0, 0x0
                    invoke-static { v0 }, $RESULT_TYPE->success(Ljava/lang/Object;)$SUCCESS
                    move-result-object v0
                    return-object v0
                """,
                ExternalLabel("let_typing_through", getInstruction(0))
            )
        }

        // Ghost mode: opening a conversation no longer reports it as read, so no read receipt is sent.
        with(readStatusUpdate.method) {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static/range { p2 .. p2 }, $MESSAGING_PATCH->blockMarkAsRead(Z)Z
                    move-result v0
                    if-eqz v0, :let_read_through
                    new-instance v0, Landroidx/lifecycle/MutableLiveData;
                    invoke-direct { v0 }, Landroidx/lifecycle/MutableLiveData;-><init>()V
                    return-object v0
                """,
                ExternalLabel("let_read_through", getInstruction(0))
            )
        }
    }
}
