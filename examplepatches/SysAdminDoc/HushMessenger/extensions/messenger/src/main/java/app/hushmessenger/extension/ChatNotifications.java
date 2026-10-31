package app.hushmessenger.extension;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.RemoteInput;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.os.Parcelable;
import android.service.notification.StatusBarNotification;

/**
 * Messenger's own chat notifications, read back from inside its process. Messenger tags each one with the chat's
 * ThreadKey text, the same string the notification hook hands over, so a captured message can be matched to what its
 * notification showed: who sent it, the group's name, and the Reply action. Only public notification extras are read.
 */
final class ChatNotifications {
    private ChatNotifications() {}

    /** The newest notification Messenger has up for this chat, or null when there's none (the chat was open, say). */
    static StatusBarNotification find(Context context, String thread) {
        if (context == null || thread == null || thread.isEmpty()) return null;
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        if (manager == null) return null;
        StatusBarNotification newest = null;
        for (StatusBarNotification shown : manager.getActiveNotifications()) {
            if (!thread.equals(shown.getTag())) continue;
            if (newest == null || shown.getPostTime() > newest.getPostTime()) newest = shown;
        }
        return newest;
    }

    /**
     * The chat and text of the notification line showing message [id], found the way Messenger's own recaller looks for
     * it: by the "msgId" a line carries in its extras, or by the notification's own "msgId", which names its newest
     * line. Null when no notification shows that message.
     */
    @SuppressWarnings("deprecation")
    static String[] showing(Context context, String id) {
        if (context == null || id == null || id.isEmpty()) return null;
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        if (manager == null) return null;
        for (StatusBarNotification shown : manager.getActiveNotifications()) {
            Bundle extras = shown.getNotification().extras;
            if (extras == null || shown.getTag() == null) continue;
            Parcelable[] messages = extras.getParcelableArray(Notification.EXTRA_MESSAGES);
            CharSequence text = null;
            CharSequence newest = null;
            if (messages != null) {
                for (Parcelable item : messages) {
                    if (!(item instanceof Bundle)) continue;
                    Bundle message = (Bundle) item;
                    newest = message.getCharSequence("text");
                    Bundle lineExtras = message.getBundle("extras");
                    Object lineId = lineExtras == null ? null : lineExtras.get("msgId");
                    if (lineId != null && id.equals(String.valueOf(lineId))) text = newest;
                }
            }
            Object notificationId = extras.get("msgId");
            if (text == null && notificationId != null && id.equals(String.valueOf(notificationId))) {
                text = newest != null ? newest : extras.getCharSequence(Notification.EXTRA_TEXT);
            }
            if (text != null) return new String[] {shown.getTag(), text.toString()};
        }
        return null;
    }

    /**
     * Who sent [text] in [thread]: the sender of the notification's lines with that text, when they all name the same
     * person. Two people sending the same words leaves it unknown. So does a group chat whose notification doesn't show
     * the text, since its newest sender could be someone else. A one-to-one chat has only one other person, so there the
     * lines' only sender, else the title, stands in. Null when that leaves nobody. Your own lines never count.
     */
    static String sender(Notification notification, String text, String thread) {
        Bundle extras = notification.extras;
        if (extras == null) return null;
        Parcelable[] messages = extras.getParcelableArray(Notification.EXTRA_MESSAGES);
        String self = selfName(extras);
        String matched = null;
        boolean disagree = false;
        String only = null;
        boolean several = false;
        if (messages != null) {
            for (Parcelable item : messages) {
                if (!(item instanceof Bundle)) continue;
                Bundle message = (Bundle) item;
                String name = senderOf(message);
                if (name == null || name.equals(self)) continue;
                CharSequence body = message.getCharSequence("text");
                if (text != null && body != null && text.contentEquals(body)) {
                    if (matched == null) matched = name;
                    else if (!matched.equals(name)) disagree = true;
                }
                if (only == null) only = name;
                else if (!only.equals(name)) several = true;
            }
        }
        // Lines that disagree leave a group unknown, but a one-to-one chat still has only one other person.
        if (matched != null && !disagree) return matched;
        if (thread == null || !oneToOne(thread)) return null;
        if (only != null && !several) return only;
        CharSequence title = extras.getCharSequence(Notification.EXTRA_TITLE);
        return title == null || title.length() == 0 ? null : title.toString();
    }

    /** One-to-one chats, encrypted or not. Messenger's key names the chat type first. */
    static boolean oneToOne(String thread) {
        int colon = thread.indexOf(':');
        return (colon < 0 ? thread : thread.substring(0, colon)).contains("ONE_TO_ONE");
    }

    /** The group's name for a group chat's notification, null for a one-to-one chat. */
    static String conversation(Notification notification) {
        Bundle extras = notification.extras;
        CharSequence title = extras == null ? null : extras.getCharSequence(Notification.EXTRA_CONVERSATION_TITLE);
        return title == null || title.length() == 0 ? null : title.toString();
    }

    /** The name the notification gives you, the person reading it. */
    @SuppressWarnings("deprecation")
    private static String selfName(Bundle extras) {
        Object person = extras.get(Notification.EXTRA_MESSAGING_PERSON);
        CharSequence name = null;
        if (Build.VERSION.SDK_INT >= 28 && person instanceof android.app.Person) name = ((android.app.Person) person).getName();
        if (name == null) name = extras.getCharSequence(Notification.EXTRA_SELF_DISPLAY_NAME);
        return name == null || name.length() == 0 ? null : name.toString();
    }

    private static String senderOf(Bundle message) {
        Object person = message.get("sender_person");
        CharSequence name = null;
        if (Build.VERSION.SDK_INT >= 28 && person instanceof android.app.Person) name = ((android.app.Person) person).getName();
        else if (person instanceof Bundle) name = ((Bundle) person).getCharSequence("name");
        if (name == null) name = message.getCharSequence("sender");
        return name == null || name.length() == 0 ? null : name.toString();
    }

    /**
     * Sends [reply] through the notification's own Reply action, the same way a reply typed into the notification shade
     * goes, so Messenger handles the chat, encrypted or not. Returns false when the notification has no reply action.
     */
    static boolean reply(Context context, Notification notification, String reply) throws PendingIntent.CanceledException {
        if (notification.actions == null) return false;
        Notification.Action chosen = null;
        for (Notification.Action action : notification.actions) {
            if (action.actionIntent == null || !acceptsText(action.getRemoteInputs())) continue;
            if (chosen == null || (Build.VERSION.SDK_INT >= 28 && action.getSemanticAction() == Notification.Action.SEMANTIC_ACTION_REPLY)) {
                chosen = action;
            }
        }
        if (chosen == null) return false;
        RemoteInput[] inputs = chosen.getRemoteInputs();
        Bundle results = new Bundle();
        for (RemoteInput input : inputs) if (input.getAllowFreeFormInput()) results.putCharSequence(input.getResultKey(), reply);
        Intent fill = new Intent();
        RemoteInput.addResultsToIntent(inputs, fill, results);
        chosen.actionIntent.send(context, 0, fill);
        return true;
    }

    private static boolean acceptsText(RemoteInput[] inputs) {
        if (inputs == null) return false;
        for (RemoteInput input : inputs) if (input.getAllowFreeFormInput()) return true;
        return false;
    }
}
