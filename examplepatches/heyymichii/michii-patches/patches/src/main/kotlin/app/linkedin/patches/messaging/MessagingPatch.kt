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

/** MessagingSdkWriteFlowFeatureImpl.updateConversationReadStatus(List, boolean): LiveData. */
private object UpdateReadStatusFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/messaging/sdk/MessagingSdkWriteFlowFeatureImpl;",
    name = "updateConversationReadStatus",
    returnType = "Landroidx/lifecycle/LiveData;",
    parameters = listOf("Ljava/util/List;", "Z"),
)

@Suppress("unused")
val messagingPatch = bytecodePatch(
    name = "Messaging",
    description = "Hides sponsored messages, and adds an optional ghost mode that does not send " +
        "typing indicators or read status.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    dependsOn(settingsPatch)

    execute {
        markIncluded("isMessagingIncluded")

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

        // Ghost mode: opening a chat no longer marks it as read on the server.
        UpdateReadStatusFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static/range { p2 .. p2 }, $EXTENSION_CLASS->blockMarkAsRead(Z)Z
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
