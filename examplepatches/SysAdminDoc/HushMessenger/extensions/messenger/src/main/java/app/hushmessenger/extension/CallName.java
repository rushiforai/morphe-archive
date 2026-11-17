package app.hushmessenger.extension;

import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.List;

/**
 * Who a call is with, so a recording can be named after them (#193). Messenger hands Java nothing about the other side
 * of a call, so this reads the call screen itself: the name stands in the largest text on it, above the state of the
 * call and the time it's run for. An incoming call that rang leaves its name in a notification as well, which is what
 * {@link QuietCalls} keeps, and that's the fallback for a screen with nothing to go on. Neither is certain, so a
 * recording with no name to use keeps the plain one.
 */
final class CallName {
    /** Longer than any name Messenger shows on a call, and short enough to leave a sentence out. */
    static final int LONGEST = 60;

    private CallName() {}

    /** The person or group the call on [screen] is with, or null when there's nothing to go on. */
    static String of(View screen) {
        String shown = onScreen(screen);
        return shown != null ? shown : QuietCalls.lastCallerName();
    }

    /** The name the call screen shows, or null. Main thread only, like every other read of a view. */
    static String onScreen(View screen) {
        if (screen == null) return null;
        List<TextView> texts = new ArrayList<>();
        collect(screen, texts);
        TextView biggest = null;
        for (TextView view : texts) {
            String name = nameIn(view.getText());
            // The first of two at the same size, since the call screen puts the name above the rest.
            if (name != null && (biggest == null || view.getTextSize() > biggest.getTextSize())) biggest = view;
        }
        return biggest == null ? null : nameIn(biggest.getText());
    }

    /** Every text on the screen that's being shown, leaving out the ones this patch put there. */
    private static void collect(View view, List<TextView> into) {
        if (view.getVisibility() != View.VISIBLE) return;
        Object tag = view.getTag();
        if (tag instanceof String && (((String) tag).startsWith("call_recording") || ((String) tag).startsWith("call_captions"))) return;
        if (view instanceof TextView) {
            into.add((TextView) view);
            return;
        }
        if (!(view instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) collect(group.getChildAt(i), into);
    }

    /**
     * [text] as a name on one line, or null when it reads as something else: the time a call has run for, a count, or a
     * line long enough to be the state of the call rather than who it's with.
     */
    static String nameIn(CharSequence text) {
        if (TextUtils.isEmpty(text)) return null;
        String one = text.toString().replace('\n', ' ').replace('\r', ' ').trim();
        while (one.contains("  ")) one = one.replace("  ", " ");
        if (one.isEmpty() || one.codePointCount(0, one.length()) > LONGEST) return null;
        boolean letters = false;
        for (int i = 0; i < one.length(); ) {
            int point = one.codePointAt(i);
            i += Character.charCount(point);
            if (Character.isLetter(point)) letters = true;
        }
        return letters ? one : null;
    }
}
