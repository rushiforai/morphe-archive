package app.hushmessenger.extension;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.view.View;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Function;

/**
 * Message log button: a clock in the Chats tab's top bar, next to Messenger's new message button, that opens the
 * message log. It shows while Keep a message log and this switch are both on. A second switch puts a Message log row
 * in the Menu tab instead, or as well, and a third puts one in the menu a chat opens on a long press, which opens the
 * log on just that chat.
 */
public final class MessageLogButton {
    static final String KEY = "message_log_button";
    /** The Menu tab row, which Settings.addMenuSettingsEntry copies from Messenger's own Settings row. */
    static final String MENU_KEY = "message_log_menu_row";
    /** The chat menu row, which ChatHiding builds next to Hide from chat list. */
    static final String CHAT_KEY = "message_log_chat_row";
    /** Our chat menu row's id. Messenger hands it back on the tap, so it can't be one of Messenger's own. */
    static final int CHAT_ROW_ID = 0x48550003;
    private static final String CHAT_ROW_NAME = "hush_message_log";
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

    /** The same for the Menu tab row. */
    static boolean inMenu() {
        SharedPreferences prefs = Settings.preferences;
        return Settings.wouldUse(MessageLog.KEY) && prefs != null && prefs.getBoolean(MENU_KEY, false);
    }

    /** The same for the chat menu row. */
    static boolean inChatMenu() {
        SharedPreferences prefs = Settings.preferences;
        return Settings.wouldUse(MessageLog.KEY) && prefs != null && prefs.getBoolean(CHAT_KEY, false);
    }

    /** Adds Message log to the menu a long press on [chat] opens, when its switch is on. */
    static void chatRow(ChatHiding.Route target, Object chat, ArrayList<Object> rows) {
        try {
            Context context = Settings.appContext;
            if (context == null || !inChatMenu()) return;
            Object row = target.row(CHAT_ROW_ID, CHAT_ROW_NAME, label(context), "CLOCK", "TIMER");
            if (row == null) return;
            ChatHiding.place(rows, row);
            Settings.enabled(MessageLog.KEY);
        } catch (Throwable error) {
            Settings.hookFailed(MessageLog.KEY, "Can't add Message log to the chat menu", error);
        }
    }

    /** Opens the message log on the chat whose menu was tapped. */
    static void chatTapped(ChatHiding.Route target, Object menu) {
        try {
            Context context = Settings.appContext;
            if (context == null || !target.menu.isInstance(menu) || !Settings.enabled(MessageLog.KEY)) return;
            Object chat = target.menuSummary.get(menu);
            if (!target.summary.isInstance(chat)) return;
            open(context, target.key(chat));
        } catch (Throwable error) {
            Settings.hookFailed(MessageLog.KEY, "Can't open the message log", error);
        }
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
        open(view.getContext());
        return true;
    }

    /** Opens settings with the message log already showing, for the clock and the Menu tab row. */
    static void open(Context context) {
        open(context, null);
    }

    /** The same, narrowed to one chat's messages when [thread] names one. */
    static void open(Context context, String thread) {
        try {
            Intent intent = HostScreens.intentFor(context, HostScreens.SETTINGS).putExtra(MessageLogSheet.OPEN_EXTRA, true);
            if (thread != null && !thread.isEmpty()) intent.putExtra(MessageLogSheet.THREAD_EXTRA, thread);
            context.startActivity(intent);
        } catch (Throwable error) {
            Settings.hookFailed(MessageLog.KEY, "Can't open the message log", error);
        }
    }

    /** Builds the button from this Messenger's own top bar classes, or null. The patch writes its body. */
    static Object button(Context context, Object session, String label) { return null; }

    /** A top bar button's id, or null for anything else. The patch writes its body. */
    static String buttonId(Object button) { return null; }
}
