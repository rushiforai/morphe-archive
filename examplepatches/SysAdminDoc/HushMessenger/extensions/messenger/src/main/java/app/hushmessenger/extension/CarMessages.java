package app.hushmessenger.extension;

import android.app.PendingIntent;
import android.os.Bundle;
import android.os.Parcelable;

/**
 * Android Auto messages (#75). Messenger's message notifications carry only AndroidX's old car bundle: the chat, its
 * messages, and a reply and mark-as-read intent for a car. Android Auto reads a notification through its MessagingStyle
 * path, the one with readout, replies and the messaging screen, only when one of its actions is a mark-as-read action.
 * Messenger has none, so Auto falls back to the old bundle. AndroidX's car extender hands its bundle here once it's in
 * the notification's extras, and this adds Messenger's own car mark-as-read intent as an invisible mark-as-read action,
 * written exactly the way NotificationCompat writes invisible actions. The phone shows nothing new. Messenger's visible
 * Reply already has the reply semantics Auto wants.
 */
public final class CarMessages {
    static final String KEY = "car_messages";
    /** NotificationCompat.CarExtender's keys. */
    static final String CONVERSATION = "car_conversation";
    static final String ON_READ = "on_read";
    static final String INVISIBLE_ACTIONS = "invisible_actions";
    /** NotificationCompat's action bundle keys, as NotificationCompatJellybean reads them back. */
    static final String ICON = "icon";
    static final String TITLE = "title";
    static final String INTENT = "actionIntent";
    static final String EXTRAS = "extras";
    static final String ALLOW_GENERATED_REPLIES = "android.support.allowGeneratedReplies";
    static final String SHOWS_USER_INTERFACE = "showsUserInterface";
    static final String SEMANTIC_ACTION = "semanticAction";
    /** NotificationCompat.Action.SEMANTIC_ACTION_MARK_AS_READ. */
    static final int MARK_AS_READ = 2;

    private CarMessages() {}

    /** Called by the car extender right after it stores [car] in the notification's extras. */
    public static void markRead(Bundle car) {
        if (car == null || !Settings.enabled(KEY)) return;
        try {
            Bundle conversation = car.getBundle(CONVERSATION);
            Parcelable read = conversation == null ? null : conversation.getParcelable(ON_READ);
            if (!(read instanceof PendingIntent)) return;
            Bundle actions = car.getBundle(INVISIBLE_ACTIONS);
            if (actions == null) actions = new Bundle();
            // NotificationCompat reads the list back as "0", "1", ... up to its size.
            for (int i = 0; i < actions.size(); i++) {
                Bundle action = actions.getBundle(Integer.toString(i));
                if (action == null) return;
                if (action.getInt(SEMANTIC_ACTION) == MARK_AS_READ) return;
            }
            actions.putBundle(Integer.toString(actions.size()), action((PendingIntent) read));
            car.putBundle(INVISIBLE_ACTIONS, actions);
        } catch (RuntimeException error) {
            Settings.hookFailed(KEY, "Couldn't add the Android Auto mark-as-read action", error);
        }
    }

    /** A mark-as-read action that opens nothing on the phone and takes no typed reply. */
    static Bundle action(PendingIntent read) {
        Bundle extras = new Bundle();
        extras.putBoolean(ALLOW_GENERATED_REPLIES, false);
        Bundle action = new Bundle();
        action.putInt(ICON, 0);
        action.putCharSequence(TITLE, "Mark as read");
        action.putParcelable(INTENT, read);
        action.putBundle(EXTRAS, extras);
        action.putBoolean(SHOWS_USER_INTERFACE, false);
        action.putInt(SEMANTIC_ACTION, MARK_AS_READ);
        return action;
    }
}
