package io.github.bryceaspringfield.morphe.extension.youtube;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.youtube.shared.PlayerType;

/**
 * The player's end screen with autoplay off shows one "Suggested video" ("Video sugerido") card with a close button.
 * When the watched-video option is on and the card's video was watched (the account's history or this app's plays,
 * by title), the card is closed. The card is found by its header text each time the window lays out, at most every
 * 500 ms, with the player maximized.
 */
final class SuggestedCard {

    private static final String[] HEADERS = {"suggested video", "video sugerido", "vídeo sugerido"};
    private static final String[] CLOSE = {"close", "cerrar", "dismiss", "descartar"};
    private static final java.util.Set<View> HOOKED = java.util.Collections.newSetFromMap(new java.util.WeakHashMap<>());
    private static boolean registered;
    private static long lastScan;
    private static String lastClosed = "";

    private SuggestedCard() {
    }

    static synchronized void register() {
        if (registered) return;
        registered = true;
        try {
            ((Application) Utils.getContext().getApplicationContext()).registerActivityLifecycleCallbacks(new Callbacks());
        } catch (Throwable t) {
            Logger.printException(() -> "YouTube Extras: suggested card hook not registered", t);
        }
    }

    private static String norm(CharSequence s) {
        return s == null ? "" : s.toString().toLowerCase(Locale.ROOT).trim();
    }

    private static boolean oneOf(String s, String[] options) {
        for (String o : options) if (s.equals(o) || s.startsWith(o + " ") || s.startsWith(o + ",")) return true;
        return false;
    }

    /** The view showing the header text, by a TextView's text or any view's description. */
    private static View findHeader(View v) {
        if (v.getVisibility() != View.VISIBLE) return null;
        if (v instanceof TextView t && oneOf(norm(t.getText()), HEADERS)) return v;
        if (oneOf(norm(v.getContentDescription()), HEADERS)) return v;
        if (v instanceof ViewGroup g) {
            for (int i = 0; i < g.getChildCount(); i++) {
                View h = findHeader(g.getChildAt(i));
                if (h != null) return h;
            }
        }
        return null;
    }

    private static void texts(View v, List<String> out) {
        if (v instanceof TextView t && t.getText() != null) out.add(t.getText().toString().trim());
        if (v.getContentDescription() != null) out.add(v.getContentDescription().toString().trim());
        if (v instanceof ViewGroup g) for (int i = 0; i < g.getChildCount(); i++) texts(g.getChildAt(i), out);
    }

    private static View findClose(View v) {
        if (v.isClickable() && oneOf(norm(v.getContentDescription()), CLOSE)) return v;
        if (v instanceof ViewGroup g) {
            for (int i = 0; i < g.getChildCount(); i++) {
                View c = findClose(g.getChildAt(i));
                if (c != null) return c;
            }
        }
        return null;
    }

    /** Percent watched of the title, read whole or before a " - " (descriptions add the length and channel). */
    private static int watched(String text) {
        if (text.length() < 3) return -1;
        int best = Math.max(AccountHistory.percentByTitle(text), WatchHistory.percentByTitle(text));
        int dash = text.indexOf(" - ");
        while (dash > 0) {
            String head = text.substring(0, dash);
            best = Math.max(best, Math.max(AccountHistory.percentByTitle(head), WatchHistory.percentByTitle(head)));
            dash = text.indexOf(" - ", dash + 3);
        }
        return best;
    }

    private static void check(View decor) {
        String mode = XSettings.AUTO_WATCHED.get();
        if ("off".equals(mode) || !PlayerType.getCurrent().isMaximizedOrFullscreen()) return;
        View header = findHeader(decor);
        if (header == null) return;
        // The card is the smallest ancestor of the header which also holds the close button and a title.
        View box = header;
        View close = null;
        for (int up = 0; up < 6 && box.getParent() instanceof View p; up++) {
            box = p;
            close = findClose(box);
            if (close != null) break;
        }
        List<String> all = new ArrayList<>();
        texts(box, all);
        int need = "fully".equals(mode) ? 90 : 1;
        String hit = null;
        for (String s : all) {
            if (oneOf(norm(s), HEADERS) || oneOf(norm(s), CLOSE)) continue;
            if (watched(s) >= need) {
                hit = s;
                break;
            }
        }
        if (XSettings.DEBUG.get()) {
            final String h = hit;
            final View c = close;
            Logger.printDebug(() -> "YouTube Extras: suggested card texts " + all + " watched " + h + " close " + (c != null));
        }
        if (hit == null || close == null || hit.equals(lastClosed)) return;
        lastClosed = hit;
        final String closed = hit;
        Logger.printDebug(() -> "YouTube Extras: closing the suggested card of a watched video: " + closed);
        close.performClick();
    }

    private static final class Callbacks implements Application.ActivityLifecycleCallbacks {
        @Override
        public void onActivityResumed(Activity a) {
            try {
                View decor = a.getWindow().getDecorView();
                if (!HOOKED.add(decor)) return;
                decor.getViewTreeObserver().addOnGlobalLayoutListener(() -> {
                    long now = android.os.SystemClock.uptimeMillis();
                    if (now - lastScan < 500) return;
                    lastScan = now;
                    try {
                        check(decor);
                    } catch (Throwable t) {
                        Logger.printDebug(() -> "YouTube Extras: suggested card check failed: " + t);
                    }
                });
            } catch (Throwable t) {
                Logger.printException(() -> "YouTube Extras: suggested card hook failed", t);
            }
        }

        @Override public void onActivityCreated(Activity a, Bundle b) {}
        @Override public void onActivityStarted(Activity a) {}
        @Override public void onActivityPaused(Activity a) {}
        @Override public void onActivityStopped(Activity a) {}
        @Override public void onActivitySaveInstanceState(Activity a, Bundle b) {}
        @Override public void onActivityDestroyed(Activity a) {}
    }
}
