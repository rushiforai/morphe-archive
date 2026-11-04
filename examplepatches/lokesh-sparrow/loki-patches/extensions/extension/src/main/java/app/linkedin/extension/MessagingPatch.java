package app.linkedin.extension;


import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/** Messaging (native UI, Messenger SDK): sponsored conversations and ghost mode. */
@SuppressWarnings("unused")
public final class MessagingPatch {
    private static final String MESSAGE_ITEM_KT = "com.linkedin.android.messenger.data.extensions.MessageItemKt";
    private static volatile Method isSpInMail;

    /**
     * Injected into ConversationListItemTransformer.TransformerInput's constructor.
     * Mirrors LinkedIn's own isSpInMailOrSpMessage(ConversationItem): a conversation is sponsored
     * when entityData.contentMetadata.hasConversationAdContentValue is set or its latest message
     * is a Sponsored InMail.
     */
    public static List<Object> filterSponsoredConversations(List<Object> conversations) {
        if (conversations == null || conversations.isEmpty() || !Settings.hideSponsoredMessages()) {
            return conversations;
        }
        try {
            List<Object> result = new ArrayList<>(conversations.size());
            for (Object conversation : conversations) {
                if (!isSponsored(conversation)) result.add(conversation);
            }
            int removed = conversations.size() - result.size();
            if (removed > 0) Settings.debugLog("hide sponsored conversations: " + removed);
            return result;
        } catch (Throwable t) {
            Diagnostics.error("filterSponsoredConversations failed", t);
            return conversations;
        }
    }

    private static boolean isSponsored(Object conversationItem) {
        Object contentMetadata = Reflect.get(Reflect.get(conversationItem, "entityData"), "contentMetadata");
        if (Boolean.TRUE.equals(Reflect.get(contentMetadata, "hasConversationAdContentValue"))) return true;

        Object latestMessage = Reflect.get(conversationItem, "latestMessage");
        if (latestMessage == null) return false;
        try {
            Method method = isSpInMail;
            if (method == null) {
                method = Class.forName(MESSAGE_ITEM_KT).getMethod("isSpInMail", latestMessage.getClass());
                isSpInMail = method;
            }
            return Boolean.TRUE.equals(method.invoke(null, latestMessage));
        } catch (Throwable t) {
            return false;
        }
    }

    /** Ghost mode: ConversationWriteNetworkStoreImpl.sendTypingIndicator returns early when true. */
    public static boolean blockTypingIndicator() {
        boolean block = Settings.ghostMode();
        if (block) Settings.debugLog("ghost mode: typing indicator not sent");
        return block;
    }

    /** Package of the open chat screen (MessageListFragment, MessagingSpInMailFragment). */
    private static final String CHAT_SCREEN_PACKAGE = "com.linkedin.android.messaging.messagelist.";

    /**
     * Ghost mode: MessagingSdkWriteFlowFeatureImpl.updateConversationReadStatus(list, read)
     * does nothing when this returns true.
     *
     * Only automatic read marks are blocked: the open chat screen marks a chat read when it is
     * left or a message arrives. Marking a chat read by hand from the chat list (swipe, options,
     * multi select) still works, and so does marking unread.
     */
    public static boolean blockMarkAsRead(boolean read) {
        if (!read || !Settings.ghostMode()) return false;
        boolean automatic = calledFrom(CHAT_SCREEN_PACKAGE);
        Settings.debugLog(automatic ? "ghost mode: automatic read mark blocked" : "ghost mode: manual read mark allowed");
        return automatic;
    }

    private static boolean calledFrom(String packagePrefix) {
        StackTraceElement[] stack = new Throwable().getStackTrace();
        // [0] calledFrom, [1] blockMarkAsRead, [2] updateConversationReadStatus, then its callers.
        for (int i = 3; i < Math.min(stack.length, 12); i++) {
            if (stack[i].getClassName().startsWith(packagePrefix)) return true;
        }
        return false;
    }
}
