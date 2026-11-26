/*
 * Based on Michii Patches by heyymichii, GPLv3:
 * https://github.com/heyymichii/michii-patches
 *
 * Modifications copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.linkedin;


import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/** Messaging (native UI, Messenger SDK): sponsored conversations and ghost mode. */
@SuppressWarnings("unused")
public final class MessagingPatch {
    private static final String MESSAGE_ITEM_KT = "com.linkedin.android.messenger.data.extensions.MessageItemKt";
    private static volatile Method isSpInMail;
    /** Conversations with a reply whose next automatic read mark goes through (Mark as read when you reply). */
    private static final Set<String> repliedConversations = ConcurrentHashMap.newKeySet();

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
     * Injected at the start of DeliveryHelperImpl.sendMessage(MessageToSend, continuation), which sends every message
     * the user writes. The argument is null when the suspended call resumes.
     */
    public static void messageSent(Object messageToSend) {
        if (messageToSend == null || !Settings.ghostMode() || !Settings.markReadAfterReply()) return;
        try {
            Object conversation = Reflect.get(Reflect.get(messageToSend, "message"), "conversationUrn");
            if (conversation != null) repliedConversations.add(conversation.toString());
        } catch (Throwable t) {
            Diagnostics.error("messageSent failed", t);
        }
    }

    /**
     * Ghost mode: MessagingSdkWriteFlowFeatureImpl.updateConversationReadStatus(list, read)
     * does nothing when this returns true.
     *
     * Only automatic read marks are blocked: the open chat screen marks a chat read when it is
     * left or a message arrives. Marking a chat read by hand from the chat list (swipe, options,
     * multi select) still works, and so does marking unread. The first automatic mark after a reply
     * goes through when Mark as read when you reply is on.
     */
    public static boolean blockMarkAsRead(List<?> conversations, boolean read) {
        if (!read || !Settings.ghostMode()) return false;
        if (!calledFrom(CHAT_SCREEN_PACKAGE)) {
            Settings.debugLog("ghost mode: manual read mark allowed");
            return false;
        }
        boolean replied = false;
        if (conversations != null && Settings.markReadAfterReply()) {
            for (Object conversation : conversations) {
                replied |= repliedConversations.remove(String.valueOf(conversation));
            }
        }
        Settings.debugLog(replied ? "ghost mode: read mark after a reply allowed"
                : "ghost mode: automatic read mark blocked");
        return !replied;
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
