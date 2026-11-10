/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.extension;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/**
 * Inbox and chat hooks: sponsored conversations in the list, plus the two ghost mode intercepts
 * (typing indicators and automatic read receipts).
 */
@SuppressWarnings("unused")
public final class MessagingPatch {
    /** Home of LinkedIn's own isSpInMail(message) helper. */
    private static final String MESSAGE_UTILS = "com.linkedin.android.messenger.data.extensions.MessageItemKt";
    /** The open chat screen lives here; read marks from it are the automatic ones. */
    private static final String CHAT_SCREEN_PREFIX = "com.linkedin.android.messaging.messagelist.";
    /** Frames above ours: the helper itself, the hook, and updateConversationReadStatus. */
    private static final int FRAMES_ABOVE_HOOK = 3;
    /** How far up the stack an automatic caller is looked for. */
    private static final int STACK_DEPTH = 12;

    /** Cached Method for isSpInMail(MessageItem); a build without it simply never resolves one. */
    private static volatile Method sponsoredInMailCheck;

    /**
     * The conversation list without its sponsored entries. Mirrors LinkedIn's own
     * isSpInMailOrSpMessage(): sponsored when the conversation's content metadata says so, or when
     * its latest message is a Sponsored InMail.
     */
    public static List<Object> filterSponsoredConversations(List<Object> conversations) {
        boolean nothingToDo = conversations == null || conversations.isEmpty();
        if (nothingToDo || !Settings.hideSponsoredMessages()) return conversations;
        try {
            List<Object> ordinary = new ArrayList<>(conversations.size());
            for (int i = 0; i < conversations.size(); i++) {
                Object conversation = conversations.get(i);
                boolean sponsored = isSponsored(conversation);
                if (sponsored) continue;
                ordinary.add(conversation);
            }
            int hidden = conversations.size() - ordinary.size();
            if (hidden > 0) Settings.debugLog("hide sponsored conversations: " + hidden);
            return ordinary;
        } catch (Throwable failure) {
            Diagnostics.error("filterSponsoredConversations failed", failure);
            return conversations;
        }
    }

    private static boolean isSponsored(Object conversation) {
        Object entityData = Reflect.get(conversation, "entityData");
        Object contentMetadata = Reflect.get(entityData, "contentMetadata");
        if (Boolean.TRUE.equals(Reflect.get(contentMetadata, "hasConversationAdContentValue"))) return true;

        Object latestMessage = Reflect.get(conversation, "latestMessage");
        if (latestMessage == null) return false;
        try {
            Method check = sponsoredInMailCheck;
            if (check == null) {
                Class<?> utils = Class.forName(MESSAGE_UTILS);
                check = utils.getMethod("isSpInMail", latestMessage.getClass());
                sponsoredInMailCheck = check;
            }
            Object result = check.invoke(null, latestMessage);
            return Boolean.TRUE.equals(result);
        } catch (Throwable unavailable) {
            // Not this build, or not a Sponsored InMail: treat it as ordinary mail.
            return false;
        }
    }

    /** Ghost mode: ConversationWriteNetworkStoreImpl.sendTypingIndicator returns early. */
    public static boolean blockTypingIndicator() {
        if (!Settings.ghostMode()) return false;
        Settings.debugLog("ghost mode: typing indicator not sent");
        return true;
    }

    /**
     * Ghost mode: MessagingSdkWriteFlowFeatureImpl.updateConversationReadStatus(list, read) does
     * nothing when this returns true.
     *
     * <p>Only automatic read marks are blocked — the open chat screen marks a chat read when it is
     * left or when a message arrives. Marking a chat read by hand from the chat list (swipe,
     * options, multi select) still works, and so does marking one unread.
     */
    public static boolean blockMarkAsRead(boolean read) {
        if (!read) return false;
        if (!Settings.ghostMode()) return false;
        boolean automatic = fromOpenChatScreen();
        String note = automatic
                ? "ghost mode: automatic read mark blocked"
                : "ghost mode: manual read mark allowed";
        Settings.debugLog(note);
        return automatic;
    }

    /** Whether the read status change came from the open chat screen. */
    private static boolean fromOpenChatScreen() {
        StackTraceElement[] frames = new Throwable().getStackTrace();
        int usable = Math.min(frames.length, STACK_DEPTH);
        for (int i = FRAMES_ABOVE_HOOK; i < usable; i++) {
            String owner = frames[i].getClassName();
            if (owner.startsWith(CHAT_SCREEN_PREFIX)) return true;
        }
        return false;
    }
}
