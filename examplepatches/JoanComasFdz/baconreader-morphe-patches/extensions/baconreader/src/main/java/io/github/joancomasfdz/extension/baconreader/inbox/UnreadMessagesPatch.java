// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.inbox;

import android.app.NotificationManager;
import android.content.Context;
import android.widget.ArrayAdapter;

import com.onelouder.baconreader.connectivity.Tasks;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import io.github.joancomasfdz.extension.baconreader.chat.InboxChats;
import io.github.joancomasfdz.extension.baconreader.errors.ErrorDialog;
import app.morphe.extension.shared.Utils;

/**
 * Fixes the unread state of inbox messages.
 * <ul>
 * <li>The orange inbox envelope of the drawer follows "Mark read": the app only updated it when the inbox or the
 * background check loaded the messages, so it stayed orange after the last unread message was marked as read.</li>
 * <li>Chat messages don't count while the Reddit chat patch keeps them apart from the inbox.</li>
 * <li>"Mark unread" is removed: Reddit no longer keeps messages unread (api/unread_message answers 404 for comment
 * replies, and old.reddit.com's "mark unread" does not stick either), so it did nothing.</li>
 * </ul>
 */
@SuppressWarnings("unused")
public final class UnreadMessagesPatch {
    /** The app's notification of new messages (CheckMessagesExecutor). */
    private static final int NOTIFICATION_ID = 1;
    /** The "Mark unread" item of the inbox menu (InboxHelper.onOpen). */
    private static final int MENU_MARK_UNREAD = 4;

    private UnreadMessagesPatch() {
    }

    // region Hooks

    /** Injected before the inbox menu is shown: removes "Mark unread". */
    public static void removeMarkUnread(ArrayAdapter<?> menu) {
        try {
            for (int i = menu.getCount() - 1; i >= 0; i--) {
                Object item = menu.getItem(i);
                Field type = item.getClass().getDeclaredField("type");
                type.setAccessible(true);
                if (type.getInt(item) == MENU_MARK_UNREAD) {
                    removeItem(menu, item);
                }
            }
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not remove \"Mark unread\"", ex);
        }
    }

    @SuppressWarnings("unchecked")
    private static <T> void removeItem(ArrayAdapter<T> menu, Object item) {
        menu.remove((T) item);
    }

    /**
     * Replaces InboxHelper.setPostStatus ("Mark read"): marks the message as read on Reddit, then asks Reddit whether
     * unread messages are left, and updates the envelope.
     */
    public static void setPostStatus(Object message) {
        try {
            if (!Boolean.TRUE.equals(message.getClass().getMethod("getNew").invoke(message))) return;
            message.getClass().getMethod("setNew", Boolean.class).invoke(message, Boolean.FALSE);
            Map<String, String> params = new HashMap<>();
            params.put("id", (String) message.getClass().getField("name").get(message));
            post("api/read_message", params);
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not mark the message as read", cause(ex));
        }
    }

    // endregion

    /** A POST through the app's own request code (as its "Mark read"), then the unread check. */
    private static void post(final String path, Map<String, String> params) throws Exception {
        Method redditPost = null;
        for (Method method : api().getDeclaredMethods()) {
            if (method.getName().equals("redditPost") && method.getParameterTypes().length == 5) redditPost = method;
        }
        if (redditPost == null) throw new NoSuchMethodException("RedditApi.redditPost");
        redditPost.setAccessible(true);
        redditPost.invoke(null, Utils.getContext(), path, params, null, new Tasks.OnCompleteListener<Object>() {
            @Override
            public void onComplete(Object result) {
                checkUnread();
            }

            @Override
            public void onCancel(String error) {
                ErrorDialog.printException(() -> "Could not mark the message as read (" + path + "): " + error);
                checkUnread();
            }
        });
    }

    /**
     * Asks Reddit for the unread messages, with the app's request of the background check (message/unread), and
     * updates the envelope. While chat messages are kept apart from the inbox, up to 100 messages are requested, so
     * an unread inbox message is found behind unread chat messages.
     */
    private static void checkUnread() {
        try {
            Method getMessages = null;
            for (Method method : api().getMethods()) {
                if (method.getName().equals("getMessages") && method.getParameterTypes().length == 6) getMessages = method;
            }
            if (getMessages == null) throw new NoSuchMethodException("RedditApi.getMessages");
            int limit = InboxChats.separate() ? 100 : 1;
            getMessages.invoke(null, Utils.getContext(), "unread", null, null, limit, new Tasks.OnCompleteListener<Object>() {
                @Override
                public void onComplete(Object listing) {
                    try {
                        Class<?> messageClass = Class.forName("com.onelouder.baconreader.reddit.Message");
                        Class<?> commentClass = Class.forName("com.onelouder.baconreader.reddit.Comment");
                        Field subject = messageClass.getField("subject");
                        List<?> children = (List<?>) listing.getClass().getMethod("getChildren", Class.class)
                                .invoke(listing, messageClass);
                        boolean hasUnread = false;
                        for (Object child : children) {
                            if (!InboxChats.isChat((String) subject.get(child), commentClass.isInstance(child))) {
                                hasUnread = true;
                                break;
                            }
                        }
                        setNewMessages(hasUnread);
                        if (!hasUnread) {
                            NotificationManager notifications = (NotificationManager)
                                    Utils.getContext().getSystemService(Context.NOTIFICATION_SERVICE);
                            notifications.cancel(NOTIFICATION_ID);
                        }
                    } catch (Exception ex) {
                        ErrorDialog.printException(() -> "Could not read the unread messages", ex);
                    }
                }

                @Override
                public void onCancel(String error) {
                    ErrorDialog.printException(() -> "Could not check the unread messages: " + error);
                }
            });
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not check the unread messages", cause(ex));
        }
    }

    /** MessageManager.setNewMessages: saves the flag and tells the drawer to update the envelope. */
    private static void setNewMessages(boolean hasNew) {
        try {
            Class.forName("com.onelouder.baconreader.data.MessageManager")
                    .getMethod("setNewMessages", boolean.class).invoke(null, hasNew);
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not update the inbox envelope", ex);
        }
    }

    private static Class<?> api() throws ClassNotFoundException {
        return Class.forName("com.onelouder.baconreader.reddit.RedditApi");
    }

    /** The error inside a reflection call. */
    private static Exception cause(Exception ex) {
        Throwable cause = ex instanceof java.lang.reflect.InvocationTargetException ? ex.getCause() : ex;
        return cause instanceof Exception ? (Exception) cause : ex;
    }
}
