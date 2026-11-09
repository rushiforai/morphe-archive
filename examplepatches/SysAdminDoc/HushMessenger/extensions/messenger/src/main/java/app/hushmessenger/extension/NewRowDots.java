package app.hushmessenger.extension;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.ColorStateList;
import android.graphics.drawable.GradientDrawable;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

/**
 * A small dot after a switch this build added since settings were last opened, after the heading of the section it's
 * in and on the tab of its page, so a long list shows what's new (#149). HushFacebook's dots, on these hand-built rows.
 *
 * <p>There is no list of which release added what. The keys of the switches already shown are kept in a file of their
 * own, apart from the settings, so a backup neither exports nor imports them. The first time settings open with none
 * stored, every switch built then counts as seen: a fresh install never shows a dot. A switch whose key isn't in the
 * set is new. A switch on show when its section closes, the page changes, the search changes or settings close counts
 * as seen, so its dot stays for the visit that reveals it and is gone by the next.
 *
 * <p>A switch for a chat that called lately comes and goes on its own and would read as new each time, so it never
 * counts. Anything that goes wrong shows no dot.
 */
final class NewRowDots {
    static final String FILE = "hushmessenger_new_dots";
    static final String SEEN = "seen";

    private final SharedPreferences store;
    private final Set<String> seen = new HashSet<>();
    private final boolean first;
    /** Each new switch's title and key, so leaving it on show marks it seen. A rebuilt row lets its old title go. */
    private final Map<TextView, String> titles = new WeakHashMap<>();
    private boolean dirty;

    NewRowDots(Context context) {
        store = context.getApplicationContext().getSharedPreferences(FILE, Context.MODE_PRIVATE);
        Set<String> stored = null;
        try {
            stored = store.getStringSet(SEEN, null);
        } catch (RuntimeException unreadable) {
            // A value of another kind is no set: start again, as on a first open.
        }
        first = stored == null;
        if (stored != null) seen.addAll(stored);
        // A first open stores its set even with nothing in it, so the next open isn't a first one too.
        dirty = first;
    }

    static boolean counts(String key) {
        return key != null && !key.startsWith(QuietCalls.CHAT_PREFIX);
    }

    /** Whether [key]'s switch is new. On a first open it counts as seen instead. */
    boolean fresh(String key) {
        if (!counts(key)) return false;
        if (first) {
            if (seen.add(key)) dirty = true;
            return false;
        }
        return !seen.contains(key);
    }

    /** Puts the dot after a new switch's [title], which counts as seen once it has been on show. */
    void mark(TextView title, String key, int accent) {
        paint(title, ColorStateList.valueOf(accent));
        titles.put(title, key);
    }

    /** The new switches on show now are seen. Their dots stay for this visit. */
    void markShown() {
        for (Map.Entry<TextView, String> entry : titles.entrySet()) {
            if (entry.getKey().isShown() && seen.add(entry.getValue())) dirty = true;
        }
    }

    void save() {
        if (!dirty) return;
        try {
            store.edit().putStringSet(SEEN, new HashSet<>(seen)).apply();
            dirty = false;
        } catch (RuntimeException ignored) {
            // The dot comes back next time.
        }
    }

    /**
     * The dot after [view]'s text, in [color] (a tab's changes with its selection). Part of the text's line, so it
     * follows the reading direction and grows nothing but the line.
     */
    static void paint(TextView view, ColorStateList color) {
        try {
            float density = view.getResources().getDisplayMetrics().density;
            int size = Math.round(8 * density);
            Dot dot = new Dot();
            dot.setShape(GradientDrawable.OVAL);
            dot.setColor(color);
            dot.setBounds(0, 0, size, size);
            view.setCompoundDrawablesRelative(null, null, dot, null);
            view.setCompoundDrawablePadding(Math.round(8 * density));
        } catch (RuntimeException ignored) {
            // No dot.
        }
    }

    /** The dot's own kind, which says a view has one without taking its tag (the tabs and rows are found by theirs). */
    static final class Dot extends GradientDrawable {}

    static boolean dotted(View view) {
        return view instanceof TextView && ((TextView) view).getCompoundDrawablesRelative()[2] instanceof Dot;
    }

    /** Whether a dot is anywhere under [view]. */
    static boolean anyDot(View view) {
        if (dotted(view)) return true;
        if (!(view instanceof ViewGroup)) return false;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) if (anyDot(group.getChildAt(i))) return true;
        return false;
    }

    static NewRowDots create(Context context) {
        try {
            return new NewRowDots(context);
        } catch (RuntimeException unavailable) {
            return null;
        }
    }
}
