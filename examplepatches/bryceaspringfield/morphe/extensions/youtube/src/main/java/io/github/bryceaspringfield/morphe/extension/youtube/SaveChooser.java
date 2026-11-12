package io.github.bryceaspringfield.morphe.extension.youtube;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;

import java.util.Locale;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * Makes the action bar's Save button open the Save to... sheet. A tap on a video not yet saved saves it to Watch
 * later at once, and a tap on a saved video opens the sheet; so a short tap on the unsaved button is turned into
 * those two taps, and the Watch later row the first one checked is unchecked again in the sheet, leaving the choice
 * to the user. The button is found by its description (English and Spanish), each time the window lays out.
 * The Save row of the player's More actions sheet (classic action bar) also saves to Watch later at once and shows a
 * snackbar whose Change button opens the sheet: a tap on that row taps Change for the user, then unchecks Watch later.
 * The sheet is a window of its own, so every window the app opens is scanned too.
 */
public final class SaveChooser {

    private static final String[] UNSAVED = {"save to playlist", "guardar en playlist", "guardar en una playlist", "guardar",
            "add to playlist", "añadir a lista de reproducción", "añadir a una lista", "agregar a lista", "agregar a una lista"};
    /** The More actions sheet's row (its description names a playlist; the action bar's button says Save). */
    private static final String[] MENU_ROW = {"add to playlist", "añadir a", "agregar a"};
    private static final String[] SAVED = {"saved", "guardado", "guardada"};
    private static final String[] WATCH_LATER = {"watch later", "ver más tarde"};
    private static final String[] CHANGE = {"change", "cambiar"};
    /** Views already hooked; a view tag needs an app resource ID, which this extension has none of. */
    private static final java.util.Set<View> HOOKED = java.util.Collections.newSetFromMap(new java.util.WeakHashMap<>());

    private static boolean registered;
    private static long lastScan;
    /** The resumed activity's window, to tell its buttons from the rows of a sheet window. */
    private static View activityRoot;
    private static int windowCount;

    private SaveChooser() {
    }

    static synchronized void register() {
        if (registered) return;
        registered = true;
        try {
            ((Application) Utils.getContext().getApplicationContext()).registerActivityLifecycleCallbacks(new Callbacks());
        } catch (Throwable t) {
            Logger.printException(() -> "YouTube Extras: Save chooser not registered", t);
        }
    }

    private static String desc(View v) {
        CharSequence d = v.getContentDescription();
        return d == null ? "" : d.toString().toLowerCase(Locale.ROOT).trim();
    }

    private static boolean isOneOf(String d, String[] options, boolean prefix) {
        for (String o : options) if (prefix ? d.startsWith(o) : d.equals(o)) return true;
        return false;
    }

    private static void scan(View v) {
        if (v.isClickable() && !HOOKED.contains(v)) {
            String d = desc(v);
            if (isOneOf(d, UNSAVED, true) || isOneOf(d, SAVED, false)) {
                HOOKED.add(v);
                v.setOnTouchListener(SaveChooser::onTouch);
            }
        }
        if (v instanceof ViewGroup g) for (int i = 0; i < g.getChildCount(); i++) scan(g.getChildAt(i));
    }

    private static boolean onTouch(View v, MotionEvent e) {
        if (!XSettings.SAVE_OPENS_CHOOSER.get()) return false;
        String d = desc(v);
        if (!isOneOf(d, UNSAVED, true) || isOneOf(d, SAVED, false)) return false;
        if (e.getActionMasked() == MotionEvent.ACTION_DOWN) return true;
        if (e.getActionMasked() != MotionEvent.ACTION_UP) return true;
        if (e.getEventTime() - e.getDownTime() > 500) return false;
        boolean menuRow = v.getRootView() != activityRoot || isOneOf(d, MENU_ROW, true);
        Logger.printDebug(() -> "YouTube Extras: Save tapped (" + (menuRow ? "More actions row" : "button") + "), opening the playlist sheet");
        View any = activityRoot != null ? activityRoot : v.getRootView();
        v.performClick();
        if (menuRow) clickChangeThenUncheck(any, 0);
        else waitSavedThenOpen(v, 0);
        return true;
    }

    private static void waitSavedThenOpen(View v, int tries) {
        Utils.runOnMainThreadDelayed(() -> {
            if (isOneOf(desc(v), SAVED, false)) {
                v.performClick();
                uncheckWatchLater(v.getRootView(), 0);
            } else if (tries < 15) {
                waitSavedThenOpen(v, tries + 1);
            }
        }, 150);
    }

    /** After a More actions Save, taps the snackbar's Change button, which opens the sheet, then unchecks Watch later. */
    private static void clickChangeThenUncheck(View anyView, int tries) {
        Utils.runOnMainThreadDelayed(() -> {
            View change = null;
            for (View root : rootViews(anyView)) {
                change = findNamed(root, CHANGE);
                if (change != null) break;
            }
            if (change != null) {
                Logger.printDebug(() -> "YouTube Extras: tapping the snackbar's Change button");
                change.performClick();
                uncheckWatchLater(anyView, 0);
            } else if (tries < 20) {
                clickChangeThenUncheck(anyView, tries + 1);
            } else {
                Logger.printDebug(() -> "YouTube Extras: no Change button after the More actions Save");
            }
        }, 150);
    }

    /** The clickable view (or the clickable parent of a view) whose description or text equals one of the names. */
    private static View findNamed(View v, String[] names) {
        if (v == null || !v.isShown()) return null;
        String text = v instanceof android.widget.TextView tv && tv.getText() != null ? tv.getText().toString().toLowerCase(Locale.ROOT).trim() : "";
        if (isOneOf(desc(v), names, false) || isOneOf(text, names, false)) {
            View c = v;
            while (c != null && !c.isClickable()) c = c.getParent() instanceof View p ? p : null;
            if (c != null) return c;
        }
        if (v instanceof ViewGroup g) {
            for (int i = 0; i < g.getChildCount(); i++) {
                View r = findNamed(g.getChildAt(i), names);
                if (r != null) return r;
            }
        }
        return null;
    }

    /** Unchecks the Watch later row of the sheet, which the first tap checked. */
    private static void uncheckWatchLater(View anyView, int tries) {
        Utils.runOnMainThreadDelayed(() -> {
            View row = null;
            View[] roots = rootViews(anyView);
            for (View root : roots) {
                row = findRow(root);
                if (row != null) break;
            }
            // The sheet draws its rows' text itself (no TextView or description): Watch later is the first row of
            // the newest window's list, the one the first tap checked.
            if (row == null && roots.length > 1 && roots[roots.length - 1] != anyView.getRootView()) {
                row = firstListRow(roots[roots.length - 1]);
            }
            if (row != null) {
                Logger.printDebug(() -> "YouTube Extras: unchecking Watch later in the sheet");
                row.performClick();
            } else if (tries < 20) {
                uncheckWatchLater(anyView, tries + 1);
            }
        }, 200);
    }

    private static View[] rootViews(View anyView) {
        try {
            Class<?> wmg = Class.forName("android.view.WindowManagerGlobal");
            Object g = wmg.getMethod("getInstance").invoke(null);
            String[] names = (String[]) wmg.getMethod("getViewRootNames").invoke(g);
            View[] out = new View[names.length];
            for (int i = 0; i < names.length; i++) out[i] = (View) wmg.getMethod("getRootView", String.class).invoke(g, names[i]);
            return out;
        } catch (Throwable t) {
            return new View[]{anyView.getRootView()};
        }
    }

    private static View firstListRow(View v) {
        if (v instanceof ViewGroup g) {
            if (g.getClass().getName().endsWith("RecyclerView")) {
                for (int i = 0; i < g.getChildCount(); i++) {
                    View c = clickableWithoutDescription(g.getChildAt(i));
                    if (c != null) return c;
                }
                return null;
            }
            for (int i = 0; i < g.getChildCount(); i++) {
                View r = firstListRow(g.getChildAt(i));
                if (r != null) return r;
            }
        }
        return null;
    }

    private static View clickableWithoutDescription(View v) {
        if (v.isClickable()) return desc(v).isEmpty() ? v : null;
        if (v instanceof ViewGroup g) {
            for (int i = 0; i < g.getChildCount(); i++) {
                View c = clickableWithoutDescription(g.getChildAt(i));
                if (c != null) return c;
            }
        }
        return null;
    }

    /** The clickable row whose subtree names Watch later (by text or description). */
    private static View findRow(View v) {
        if (v == null) return null;
        String d = desc(v);
        String text = v instanceof android.widget.TextView tv && tv.getText() != null ? tv.getText().toString().toLowerCase(Locale.ROOT) : "";
        boolean names = isOneOf(d, WATCH_LATER, true) || isOneOf(text, WATCH_LATER, false);
        if (names) {
            View c = v;
            while (c != null && !c.isClickable()) c = c.getParent() instanceof View p ? p : null;
            return c;
        }
        if (v instanceof ViewGroup g) {
            for (int i = 0; i < g.getChildCount(); i++) {
                View r = findRow(g.getChildAt(i));
                if (r != null) return r;
            }
        }
        return null;
    }

    /**
     * Injection point, on the command Morphe's feed card save button runs (the menu's Save to Watch later): with the
     * option on, the button opens Save to... for the card's video instead.
     */
    public static Object cardSaveCommand(Object command) {
        try {
            if (!XSettings.SAVE_OPENS_CHOOSER.get()
                    || !(command instanceof app.morphe.extension.youtube.innertube.queue.PlaylistQueueRenderer.NavigationEndpoint e)) {
                return command;
            }
            var edit = e.getPlaylistEditEndpoint();
            String id = edit.getActionsCount() > 0 ? edit.getActions(0).getAddedVideoId() : null;
            if (id == null || id.isEmpty()) return command;
            if (XSettings.DEBUG.get()) Logger.printDebug(() -> "YouTube Extras: card save button opens Save to... for " + id);
            return app.morphe.extension.youtube.innertube.queue.PlaylistQueueRenderer.NavigationEndpoint.newBuilder()
                    .setAddToPlaylistEndpoint(app.morphe.extension.youtube.innertube.queue.PlaylistQueueRenderer
                            .AddToPlaylistEndpoint.newBuilder().setVideoId(id))
                    .build();
        } catch (Throwable t) {
            Logger.printDebug(() -> "YouTube Extras: card save command kept: " + t);
            return command;
        }
    }

    private static final class Callbacks implements Application.ActivityLifecycleCallbacks {
        @Override
        public void onActivityResumed(Activity a) {
            try {
                hook(a);
            } catch (Throwable t) {
                Logger.printException(() -> "YouTube Extras: Save chooser hook failed", t);
            }
        }

        private void hook(Activity a) {
            View decor = a.getWindow().getDecorView();
            activityRoot = decor;
            watchWindows(decor);
            listen(decor);
        }

        /** Every 500 ms while the activity runs, listens on any new window (a sheet or dialog) the app opened. */
        private void watchWindows(View decor) {
            if (decor != activityRoot) return;
            if (XSettings.SAVE_OPENS_CHOOSER.get()) {
                View[] roots = rootViews(decor);
                if (roots.length != windowCount) {
                    windowCount = roots.length;
                    for (View r : roots) if (r != null) listen(r);
                }
            }
            Utils.runOnMainThreadDelayed(() -> watchWindows(decor), 500);
        }

        private void listen(View decor) {
            if (!HOOKED.add(decor)) return;
            if (decor != activityRoot) scan(decor);
            decor.getViewTreeObserver().addOnGlobalLayoutListener(() -> {
                // Also on feed cards, whose bookmark saves to Watch later at once; scans at most every 300 ms.
                if (!XSettings.SAVE_OPENS_CHOOSER.get()) return;
                long now = android.os.SystemClock.uptimeMillis();
                // A sheet's window is small and scanned at each layout; the activity's at most every 300 ms.
                if (decor == activityRoot) {
                    if (now - lastScan < 300) return;
                    lastScan = now;
                }
                scan(decor);
            });
        }

        @Override public void onActivityCreated(Activity a, Bundle b) {}
        @Override public void onActivityStarted(Activity a) {}
        @Override public void onActivityPaused(Activity a) {
            if (activityRoot == a.getWindow().getDecorView()) activityRoot = null;
        }
        @Override public void onActivityStopped(Activity a) {}
        @Override public void onActivitySaveInstanceState(Activity a, Bundle b) {}
        @Override public void onActivityDestroyed(Activity a) {}
    }
}
