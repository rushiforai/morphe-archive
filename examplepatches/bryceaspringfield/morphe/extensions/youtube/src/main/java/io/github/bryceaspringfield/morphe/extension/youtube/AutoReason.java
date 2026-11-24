package io.github.bryceaspringfield.morphe.extension.youtube;

import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.widget.RadioButton;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;

import app.morphe.extension.shared.Logger;

/**
 * The reason after a hand-made Not interested (Bryce, 2026-11-23): when the user picks Not interested on a feed video,
 * the feed shows "Video removed" with Undo and Tell us why. With the option on, and 5 seconds gone without the user
 * choosing, the app taps Tell us why and then I don't like the video, as the user would.
 *
 * The notice is an Android view (video_dismissed_entry: success_response_text, undo_text, dismissal_reasons_text) whose
 * presenter reports its view here once (onNotice); the notice is taken out of its frame and put back at every binding,
 * so each showing attaches the view again and starts the wait. The reasons list opens as a dialog whose rows are
 * RadioButtons (dismissal_reason_list_item), each labeled with its reason; after the tap on Tell us why they are found
 * in the app's open windows. The tap is skipped where the notice has left the screen (Undo, a scroll), where Tell us why
 * is no longer shown (a reason was sent), or where the window lost focus (the user opened the reasons themself).
 */
public final class AutoReason {

    private static final long WAIT_MS = 5000;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Map<View, Runnable> WAITING = new WeakHashMap<>();
    /** Notices already answered here, by their text ("Video removed: TITLE"), so a notice scrolled back is left alone. */
    private static final Set<String> ANSWERED = ConcurrentHashMap.newKeySet();

    private AutoReason() {
    }

    /** From the constructor of the notice's presenter: its view, kept for every later showing. */
    public static void onNotice(View root) {
        try {
            if (root == null) return;
            root.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
                @Override
                public void onViewAttachedToWindow(View v) {
                    arm(v);
                }

                @Override
                public void onViewDetachedFromWindow(View v) {
                    disarm(v);
                }
            });
            if (root.isAttachedToWindow()) arm(root);
        } catch (Throwable t) {
            Logger.printException(() -> "YouTube Extras: automatic reason, notice not watched", t);
        }
    }

    private static void arm(View root) {
        disarm(root);
        if (!XSettings.AUTO_REASON.get()) return;
        Runnable r = () -> fire(root);
        WAITING.put(root, r);
        MAIN.postDelayed(r, WAIT_MS);
    }

    private static void disarm(View root) {
        Runnable r = WAITING.remove(root);
        if (r != null) MAIN.removeCallbacks(r);
    }

    private static void fire(View root) {
        try {
            WAITING.remove(root);
            if (!XSettings.AUTO_REASON.get() || !root.isAttachedToWindow() || !root.isShown()) return;
            View why = byName(root, "dismissal_reasons_text");
            View notice = byName(root, "success_response_text");
            String key = notice == null || notice.getContentDescription() == null ? null : notice.getContentDescription().toString();
            if (why == null || !why.isShown() || !why.isEnabled()) {
                Logger.printDebug(() -> "YouTube Extras: automatic reason skipped, Tell us why is not shown");
                return;
            }
            if (!root.hasWindowFocus()) {
                Logger.printDebug(() -> "YouTube Extras: automatic reason skipped, another window is open");
                return;
            }
            if (key != null && !ANSWERED.add(key)) return;
            Logger.printDebug(() -> "YouTube Extras: automatic reason, tapping Tell us why after " + WAIT_MS + " ms (" + key + ")");
            why.performClick();
            MAIN.postDelayed(() -> pick(0), 600);
        } catch (Throwable t) {
            Logger.printException(() -> "YouTube Extras: automatic reason failed", t);
        }
    }

    /** Taps "I don't like the video" among the rows the list showed: by its text in English or Spanish, else the second row. */
    private static void pick(int attempt) {
        try {
            List<RadioButton> shown = new ArrayList<>();
            for (View w : windows()) collect(w, shown);
            if (shown.isEmpty()) {
                if (attempt < 4) MAIN.postDelayed(() -> pick(attempt + 1), 500);
                else Logger.printDebug(() -> "YouTube Extras: automatic reason, no reasons list appeared");
                return;
            }
            RadioButton choice = null;
            for (RadioButton b : shown) {
                if (dontLike(label(b))) {
                    choice = b;
                    break;
                }
            }
            if (choice == null && shown.size() >= 2) choice = shown.get(1);
            if (choice == null) {
                Logger.printDebug(() -> "YouTube Extras: automatic reason, no matching reason among " + shown.size());
                return;
            }
            final CharSequence text = label(choice);
            Logger.printDebug(() -> "YouTube Extras: automatic reason sent: " + text + " (of " + shown.size() + " reasons)");
            choice.performClick();
        } catch (Throwable t) {
            Logger.printException(() -> "YouTube Extras: automatic reason, pick failed", t);
        }
    }

    /** "I don't like the video" / "No me gusta el video", and not the already-watched reason. */
    static boolean dontLike(CharSequence reason) {
        if (reason == null) return false;
        String t = reason.toString().toLowerCase(Locale.ROOT);
        boolean watched = t.contains("watched") || t.contains("miré") || t.contains("vi el") || t.contains("visto");
        return !watched && (t.contains("like") || t.contains("gusta"));
    }

    private static CharSequence label(RadioButton b) {
        CharSequence d = b.getContentDescription();
        return d != null && d.length() > 0 ? d : b.getText();
    }

    private static View byName(View root, String name) {
        int id = root.getResources().getIdentifier(name, "id", root.getContext().getPackageName());
        return id == 0 ? null : root.findViewById(id);
    }

    /** The root views of the app's open windows (the reasons list opens as a dialog, a window of its own). */
    @SuppressWarnings("unchecked")
    private static List<View> windows() {
        try {
            Class<?> g = Class.forName("android.view.WindowManagerGlobal");
            Object inst = g.getMethod("getInstance").invoke(null);
            Field f = g.getDeclaredField("mViews");
            f.setAccessible(true);
            return new ArrayList<>((List<View>) f.get(inst));
        } catch (Throwable t) {
            Logger.printException(() -> "YouTube Extras: automatic reason, windows not read", t);
            return new ArrayList<>();
        }
    }

    /** Every shown RadioButton under a view: the rows of the reasons list. */
    private static void collect(View v, List<RadioButton> out) {
        if (v == null || !v.isShown()) return;
        if (v instanceof RadioButton) {
            out.add((RadioButton) v);
            return;
        }
        if (v instanceof android.view.ViewGroup) {
            android.view.ViewGroup g = (android.view.ViewGroup) v;
            for (int i = 0; i < g.getChildCount(); i++) collect(g.getChildAt(i), out);
        }
    }
}
