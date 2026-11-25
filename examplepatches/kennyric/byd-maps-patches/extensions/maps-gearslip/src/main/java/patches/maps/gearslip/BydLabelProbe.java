package patches.maps.gearslip;

import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Anchor-verification build: names every text of the navigation card, so one look at the head unit
 * says which view the battery figures belong on.
 *
 * <p>Each labelled text reads {@code ~A~ status_text 17 min · 14 mi}: a token that is short enough
 * to survive a narrow card, then the view's own resource id, then the text Maps meant to show. The
 * token-to-id map is logged once per id, so a screenshot and a logcat line can be checked against
 * each other.
 *
 * <p>The labels are tags, not translatable strings. This class is deleted once the anchor is known
 * and {@link BydEtaText} decides what to write instead.
 */
public final class BydLabelProbe {
    private static final String TAG = "BydLabelProbe";
    private static final int MAX_DEPTH = 40;
    /** Assigned in the order the ids are first seen; A, B, C, ... then AA. */
    private static final Map<String, String> TOKENS = new LinkedHashMap<>();
    private static final List<String> LABELS = new ArrayList<>();

    private BydLabelProbe() {
    }

    /** Clears the accumulated labels; the token per id is kept so a repaint keeps its letter. */
    public static void beginPass() {
        LABELS.clear();
    }

    /** What has been painted, in order, for reading a screenshot against the log. */
    public static List<String> describe() {
        return new ArrayList<>(LABELS);
    }

    /**
     * The single hook every navigation-card text goes through: prefixes {@code text} with a token
     * and the view's resource id. Returns {@link String} because the original call sites type the
     * register as String, and the verifier rejects a wider CharSequence.
     */
    public static String label(TextView view, CharSequence text) {
        if (text == null) return null;
        if (text.length() == 0) return "";
        String name = idOf(view);
        String token = tokenFor(name);
        String value = text.toString();
        if (value.startsWith(token)) return value;
        String labelled = token + " " + name + " " + value;
        if (!LABELS.contains(token + " " + name)) {
            LABELS.add(token + " " + name);
            Log.i(TAG, "labelled " + token + " = " + name);
        }
        return labelled;
    }

    /** The token for {@code name}, allocating the next free one on first sight. */
    private static synchronized String tokenFor(String name) {
        String existing = TOKENS.get(name);
        if (existing != null) return existing;
        String token = token(TOKENS.size());
        TOKENS.put(name, token);
        return token;
    }

    /** "~A~", "~B~", ... "~Z~", "~AA~". */
    private static String token(int index) {
        StringBuilder out = new StringBuilder();
        int value = index;
        do {
            out.insert(0, (char) ('A' + value % 26));
            value = value / 26 - 1;
        } while (value >= 0);
        return "~" + out + "~";
    }

    /** The resource entry name, or the simple class name when the view carries no id. */
    private static String idOf(View view) {
        try {
            if (view.getId() != View.NO_ID) return view.getResources().getResourceEntryName(view.getId());
        } catch (RuntimeException unnamed) {
            // Fall through to the class name.
        }
        return view.getClass().getSimpleName();
    }

    /**
     * Names every visible text under {@code root}. Used for the car surface, where Maps' own views
     * are not reached by the call-site hooks.
     */
    public static List<String> markHierarchy(View root) {
        if (root == null) return describe();
        try {
            walk(root, 0);
        } catch (RuntimeException unreadable) {
            // A half-walked tree is still a readable screenshot.
        }
        return describe();
    }

    private static void walk(View view, int depth) {
        if (view == null || depth > MAX_DEPTH || view.getVisibility() != View.VISIBLE) return;
        if (view instanceof TextView) {
            TextView text = (TextView) view;
            CharSequence labelled = label(text, text.getText());
            if (labelled != text.getText()) text.setText(labelled);
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) walk(group.getChildAt(i), depth + 1);
        }
    }

    /** Marks the tree the caller holds, walking up one level to reach the decor view. */
    public static List<String> markRoot(View decor) {
        if (decor == null) return describe();
        ViewParent parent = decor.getParent();
        return markHierarchy(parent instanceof View ? (View) parent : decor);
    }

    /** True when the text already carries any token, so callers can skip a redundant write. */
    static boolean labelled(CharSequence text) {
        return !TextUtils.isEmpty(text) && text.charAt(0) == '~';
    }

    // ---- value probe: one distinctive number per injection point -------------------------------

    private static String number(CharSequence text, String value) {
        if (text == null) return null;
        String prefix = value + "% ";
        String existing = text.toString();
        return existing.startsWith(prefix) ? existing : prefix + existing;
    }

    /** Turn-card distance line. */
    public static String number999(TextView view, CharSequence text) {
        return number(text, "999");
    }

    /** Turn-card road/cue line. */
    public static String number998(TextView view, CharSequence text) {
        return number(text, "998");
    }

    /** "Then …" next-step line. */
    public static String number997(TextView view, CharSequence text) {
        return number(text, "997");
    }

    /** The status binder that fills @id/status_text (both ETA lines). */
    public static String number996(TextView view, CharSequence text) {
        return number(text, "996");
    }

    /** The status value object, i.e. upstream of every view hook. */
    public static String number995(String text) {
        return number(text, "995");
    }
}
