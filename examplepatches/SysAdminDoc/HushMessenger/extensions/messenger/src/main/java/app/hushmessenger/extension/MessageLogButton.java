package app.hushmessenger.extension;

import android.content.Context;
import android.content.SharedPreferences;
import android.view.View;
import java.util.List;
import java.util.function.Function;

/**
 * Message log button: a clock in the Chats tab's top bar, next to Messenger's new message button, that opens the
 * message log. It shows while Keep a message log and this switch are both on.
 */
public final class MessageLogButton {
    static final String KEY = "message_log_button";
    /** The button's id in the top bar. Messenger hands it back on every tap, which is how ours is told apart. */
    static final String ID = "HushMessageLog";
    /** The id Messenger gives its new message button, which this one goes in front of. The patch checks the build uses it. */
    static final String COMPOSER = "ComposerButton";

    private MessageLogButton() { }

    /** Whether the button shows: both switches on, and not paused or in safe mode. */
    static boolean shown() {
        SharedPreferences prefs = Settings.preferences;
        return Settings.wouldUse(MessageLog.KEY) && prefs != null && prefs.getBoolean(KEY, false);
    }

    /**
     * The Chats tab's top bar calls this right before it hands over its button list. The button goes just in front of
     * the new message button, or in front of the padding the bar leaves at the end when that button is off.
     */
    public static void add(List<Object> buttons, Context context, Object session) {
        try {
            if (buttons == null || context == null || !shown()) return;
            Object button = button(context, session, label(context));
            if (button != null) place(buttons, button, MessageLogButton::buttonId);
        } catch (Throwable error) {
            Settings.hookFailed(MessageLog.KEY, "Can't add the message log button", error);
        }
    }

    /** Puts the button in front of the one ids names the new message button, else in front of the first padding. */
    static void place(List<Object> buttons, Object button, Function<Object, String> ids) {
        int at = buttons.size();
        for (int i = 0; i < buttons.size(); i++) {
            Object held = buttons.get(i);
            if (held == null) { at = Math.min(at, i); continue; }
            if (COMPOSER.equals(ids.apply(held))) { at = i; break; }
        }
        buttons.add(at, button);
    }

    /** The button's label, which TalkBack reads out. */
    static String label(Context context) {
        return new SettingsText(context).get("message_log_title");
    }

    /** Messenger's top bar listener asks this first. False for Messenger's own buttons, which it handles as before. */
    public static boolean clicked(View view, String id) {
        if (!ID.equals(id) || view == null) return false;
        try {
            Context context = view.getContext();
            context.startActivity(HostScreens.intentFor(context, HostScreens.SETTINGS).putExtra(MessageLogSheet.OPEN_EXTRA, true));
        } catch (Throwable error) {
            Settings.hookFailed(MessageLog.KEY, "Can't open the message log", error);
        }
        return true;
    }

    /** Builds the button from this Messenger's own top bar classes, or null. The patch writes its body. */
    static Object button(Context context, Object session, String label) { return null; }

    /** A top bar button's id, or null for anything else. The patch writes its body. */
    static String buttonId(Object button) { return null; }
}
