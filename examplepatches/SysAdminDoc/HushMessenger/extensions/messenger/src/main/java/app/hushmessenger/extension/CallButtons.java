package app.hushmessenger.extension;

import java.util.ArrayList;
import java.util.List;

/**
 * Hide call buttons: takes the audio and video call buttons out of a chat's top bar, so a tap meant for something else
 * can't start a call. Both bars reach it through {@link MarkReadButton}, ahead of that button's placing, so the Mark as
 * read icon sees the room this leaves. Messenger's join a call button is another class with no tag, and it stays.
 */
final class CallButtons {
    static final String KEY = "hide_call_buttons";

    private CallButtons() { }

    /** The older bar's list is padded with nulls that it skips, so a call button's place just goes empty. */
    static void blank(List<Object> buttons) {
        try {
            if (buttons == null || !Settings.enabled(KEY)) return;
            for (int i = 0; i < buttons.size(); i++) {
                Object held = buttons.get(i);
                if (held != null && MarkReadButton.isCall(held)) buttons.set(i, null);
            }
        } catch (Throwable error) {
            Settings.hookFailed(KEY, "Can't hide the call buttons", error);
        }
    }

    /** The newer bar's finished list can't change or hold nulls, so a copy comes back. Without a call button it's the same list. */
    static List<Object> without(List<Object> buttons) {
        try {
            if (buttons == null || !Settings.enabled(KEY)) return buttons;
            List<Object> kept = new ArrayList<>(buttons.size());
            for (Object held : buttons) {
                if (!MarkReadButton.isCall(held)) kept.add(held);
            }
            return kept.size() == buttons.size() ? buttons : kept;
        } catch (Throwable error) {
            Settings.hookFailed(KEY, "Can't hide the call buttons", error);
            return buttons;
        }
    }
}
