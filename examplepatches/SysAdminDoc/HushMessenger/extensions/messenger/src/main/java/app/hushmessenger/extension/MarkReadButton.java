package app.hushmessenger.extension;

import android.content.Context;
import android.view.View;
import android.widget.Toast;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Mark as read button: while Hide read receipts holds a chat's Seen back, the chat's top bar gets Messenger's own Mark as
 * read icon. Opening the chat still sends nothing. A tap sends the Seen Messenger was about to send, once, through
 * Messenger's own read job, so the sender sees Seen and the chat turns read here.
 */
public final class MarkReadButton {
    static final String KEY = "mark_read_button";
    /** Messenger shows the first three buttons of a chat's top bar. The patch refuses a build with a different limit. */
    static final int MOST_BUTTONS = 3;
    /** Chats whose held Seen is kept. The one used least recently is dropped first. */
    static final int MOST_HELD = 32;
    /** The button's id in the top bar, where Messenger keeps its own buttons' ids. */
    static final String VIEW_TAG = "hush_mark_read_button";

    private MarkReadButton() { }

    /** The chat a button belongs to. Weak, so a closed chat isn't kept alive by its button. */
    static final class Tag {
        final WeakReference<Object> session;
        final WeakReference<Object> thread;

        Tag(Object session, Object thread) {
            this.session = new WeakReference<>(session);
            this.thread = new WeakReference<>(thread);
        }
    }

    /** A Seen that Hide read receipts held back: Messenger's read handler for the chat and the message it was marking. */
    static final class HeldSeen {
        final WeakReference<Object> session;
        final WeakReference<Object> handler;
        final String messageId;

        HeldSeen(Object session, Object handler, String messageId) {
            this.session = new WeakReference<>(session);
            this.handler = new WeakReference<>(handler);
            this.messageId = messageId;
        }
    }

    /** Held Seens by chat. Messenger's thread key compares by value, so a reopened chat finds its entry. */
    static final Map<Object, HeldSeen> held = new LinkedHashMap<Object, HeldSeen>(16, 0.75f, true) {
        @Override protected boolean removeEldestEntry(Map.Entry<Object, HeldSeen> eldest) { return size() > MOST_HELD; }
    };
    private static final ThreadLocal<Boolean> replaying = new ThreadLocal<>();

    /** Whether the button shows: both switches on, and not paused or in safe mode. */
    static boolean shown() { return Settings.wouldUse("hide_read_receipts") && Settings.enabled(KEY); }

    /** True while a tap is sending the held Seen, so Hide read receipts lets that one call through. */
    static boolean replaying() { return Boolean.TRUE.equals(replaying.get()); }

    /** Hide read receipts kept this Seen from going out. The latest one per chat is kept for the button. */
    static void hold(Object session, Object thread, Object handler, String messageId) {
        if (session == null || thread == null || handler == null || !shown()) return;
        synchronized (held) { held.put(thread, new HeldSeen(session, handler, messageId)); }
    }

    /**
     * Messenger's older chat top bar calls this right before it shows its buttons, padded with nulls, of which it shows
     * the first three. The button goes where the chat details button sits, taking its place when the bar is full, since
     * tapping the chat's name opens the same page. A full bar that doesn't show a details button gives up its last button
     * that isn't for calls, such as Add friend, so no chat goes without it and no call button is ever pushed out or moved.
     */
    public static void add(List<Object> buttons, Object socket) {
        CallButtons.blank(buttons);
        try {
            if (buttons != null && shown()) place(buttons, build(socket));
        } catch (Throwable error) {
            Settings.hookFailed(KEY, "Can't add the Mark as read button", error);
        }
    }

    /**
     * Messenger's newer chat top bar hands over its finished, unchangeable button list here and shows the list this
     * returns. The button goes in by the same rule as {@link #add}, in a copy; the list comes back as it was otherwise.
     */
    public static List<Object> addTo(List<Object> buttons, Object session, Object thread, Object mig) {
        buttons = CallButtons.without(buttons);
        try {
            if (buttons == null || !shown()) return buttons;
            Object button = button(session, thread, mig);
            if (button == null) return buttons;
            List<Object> copy = new ArrayList<>(buttons);
            return place(copy, button) ? copy : buttons;
        } catch (Throwable error) {
            Settings.hookFailed(KEY, "Can't add the Mark as read button", error);
            return buttons;
        }
    }

    /** Puts a built button into the bar's list by the rule {@link #add} describes. False when it changed nothing. */
    static boolean place(List<Object> buttons, Object button) throws IllegalAccessException {
        if (button == null) return false;
        int count = 0, details = -1, spare = -1;
        for (int i = 0; i < buttons.size(); i++) {
            Object held = buttons.get(i);
            if (held == null) continue;
            // Only the buttons the bar shows count: a place past its cut wouldn't show this one either.
            if (++count > MOST_BUTTONS) continue;
            if (details < 0 && isDetails(held)) details = i;
            // Messenger's join a call button is a class of its own, so another class is never given up.
            else if (held.getClass() == button.getClass() && !isCall(held)) spare = i;
        }
        if (details >= 0 && count >= MOST_BUTTONS) buttons.set(details, button);
        else if (details >= 0) buttons.add(details, button);
        else if (count < MOST_BUTTONS) buttons.add(button);
        else if (spare >= 0) buttons.set(spare, button);
        else return false;
        return true;
    }

    /** The test tag Messenger gives the chat details button in both top bars. The patch checks the build sets it. */
    static final String DETAILS_TAG = "settings_button";
    /** The test tags of the call buttons in either top bar, which stay put. The patch checks the build sets the first and last. */
    static final String[] CALL_TAGS = {
        "audio_call_button", "audio_call_button_green_dot", "audio_call_button_green_icon_and_subheader", "call_request_button", "video_call_button",
    };

    /** Whether a top bar button is the chat details one, by the test tag the button keeps. */
    static boolean isDetails(Object button) throws IllegalAccessException {
        return hasTag(button, DETAILS_TAG);
    }

    /** Whether a top bar button starts a call, by the test tag the button keeps. */
    static boolean isCall(Object button) throws IllegalAccessException {
        for (String tag : CALL_TAGS) {
            if (hasTag(button, tag)) return true;
        }
        return false;
    }

    private static boolean hasTag(Object button, String tag) throws IllegalAccessException {
        for (Class<?> type = button.getClass(); type != null && type != Object.class; type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) || field.getType() != String.class) continue;
                field.setAccessible(true);
                if (tag.equals(field.get(button))) return true;
            }
        }
        return false;
    }

    /** Reads the older bar's chat, account and colors from its plugin socket and builds the button, or null. The patch writes its body. */
    static Object build(Object socket) { return null; }

    /** Builds the button from this Messenger's own top bar classes, or null. The patch writes its body. */
    static Object button(Object session, Object thread, Object mig) { return null; }

    /** What the button's listener holds, or null when the chat isn't known yet. Called by the patched button(). */
    public static Object tag(Object session, Object thread) {
        return session == null || thread == null ? null : new Tag(session, thread);
    }

    /** The button's label, which TalkBack reads out. */
    public static String label() {
        Context context = Settings.appContext;
        return context == null ? SettingsText.ENGLISH.get("mark_read") : new SettingsText(context).get("mark_read");
    }

    /**
     * Messenger's shared top bar listener asks this first. False for any of Messenger's own buttons, which it then
     * handles as before. For ours it sends the held Seen and says so.
     */
    public static boolean clicked(Object tag, View view) {
        if (!(tag instanceof Tag)) return false;
        try {
            boolean sent = markRead((Tag) tag);
            Context context = view == null ? Settings.appContext : view.getContext();
            if (context != null) Toast.makeText(context, new SettingsText(context).get(sent ? "mark_read_done" : "mark_read_nothing"),
                Toast.LENGTH_SHORT).show();
        } catch (Throwable error) {
            Settings.hookFailed(KEY, "Can't mark the chat read", error);
        }
        return true;
    }

    /** Sends the chat's held Seen through Messenger's own read job. False when nothing was held for it. */
    static boolean markRead(Tag tag) throws ReflectiveOperationException {
        Object session = tag.session.get(), thread = tag.thread.get();
        if (session == null || thread == null) return false;
        HeldSeen seen;
        synchronized (held) { seen = held.get(thread); }
        Object handler = seen == null ? null : seen.handler.get();
        // The bar and the read hook read the session from different places, so an equal one counts as the same account.
        if (handler == null || !session.equals(seen.session.get())) return false;
        Method send = readJob(handler.getClass(), session);
        if (send == null) return false;
        replaying.set(Boolean.TRUE);
        try {
            send.invoke(null, session, handler, seen.messageId);
        } finally {
            replaying.remove();
        }
        synchronized (held) { held.remove(thread, seen); }
        return true;
    }

    /** The handler's one static (account, handler, message id) method, which the read receipt hook sits in. */
    static Method readJob(Class<?> handler, Object session) {
        Method found = null;
        for (Method method : handler.getDeclaredMethods()) {
            Class<?>[] parameters = method.getParameterTypes();
            if (!Modifier.isStatic(method.getModifiers()) || method.getReturnType() != void.class || parameters.length != 3
                    || !parameters[0].isInstance(session) || parameters[1] != handler || parameters[2] != String.class) continue;
            if (found != null) return null;
            found = method;
        }
        if (found != null) found.setAccessible(true);
        return found;
    }
}
