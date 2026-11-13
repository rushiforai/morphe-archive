package io.github.bryceaspringfield.morphe.extension.youtube;

import android.app.Activity;
import android.app.Application;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.Typeface;
import android.os.Bundle;
import android.os.SystemClock;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.util.Collections;
import java.util.Set;
import java.util.WeakHashMap;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * "Audio only" as a row of the video quality sheet, above the resolutions. The sheet's rows are drawn by Litho, so the
 * extension adds a real row to the sheet's own column (its drag handle, header, and list sit in one vertical layout)
 * in the half second after the Litho filter sees the sheet's content: a tap turns YouTube's audio-only mode on
 * ({@link AudioOnly}) and closes the sheet, and the next resolution the user picks (Morphe's userChangedQuality, hooked
 * by the patch) turns it off again.
 */
public final class QualityAudioRow {

    /** How long after the sheet's content is seen the sheet's window is searched, in ms. */
    private static final long SEARCH_MS = 3000;
    private static final long SEARCH_STEP_MS = 60;

    private static final Set<View> DONE = Collections.newSetFromMap(new WeakHashMap<>());
    private static volatile long openedAt;
    private static boolean registered;
    private static boolean searching;
    private static Activity current;

    private QualityAudioRow() {
    }

    static synchronized void register() {
        if (registered) return;
        registered = true;
        try {
            ((Application) Utils.getContext().getApplicationContext()).registerActivityLifecycleCallbacks(new Callbacks());
        } catch (Throwable t) {
            Logger.printException(() -> "YouTube Extras: quality sheet row not registered", t);
        }
    }

    /** The Litho filter saw the quality sheet's content: looks for the sheet's window for the next few seconds. */
    static void sheetOpened() {
        if (!XSettings.AUDIO_ONLY_ROW.get() || !AudioOnly.available()) return;
        openedAt = SystemClock.uptimeMillis();
        Utils.runOnMainThread(() -> {
            if (searching) return;
            searching = true;
            search();
        });
    }

    /** Injection point: the user picked a resolution in a quality menu. */
    public static void resolutionPicked() {
        try {
            if (AudioOnly.isOn() && !XSettings.AUDIO_ONLY.get() && !pickedByRow) {
                AudioOnly.set(false, "resolution picked");
            }
        } catch (Throwable t) {
            Logger.printDebug(() -> "YouTube Extras: resolution pick not handled: " + t);
        }
    }

    /** True while the row's own tap runs, since a tap may also reach the quality code. */
    private static volatile boolean pickedByRow;

    private static void search() {
        try {
            for (View root : roots()) {
                if (root == null || !root.isShown()) continue;
                ViewGroup column = findColumn(root);
                if (column != null && DONE.add(column)) inject(column, root);
            }
        } catch (Throwable t) {
            Logger.printDebug(() -> "YouTube Extras: quality sheet search failed: " + t);
        }
        if (SystemClock.uptimeMillis() - openedAt < SEARCH_MS) {
            Utils.runOnMainThreadDelayed(QualityAudioRow::search, SEARCH_STEP_MS);
        } else {
            searching = false;
        }
    }

    private static View[] roots() {
        try {
            Class<?> wmg = Class.forName("android.view.WindowManagerGlobal");
            Object g = wmg.getMethod("getInstance").invoke(null);
            String[] names = (String[]) wmg.getMethod("getViewRootNames").invoke(g);
            View[] out = new View[names.length];
            for (int i = 0; i < names.length; i++) out[i] = (View) wmg.getMethod("getRootView", String.class).invoke(g, names[i]);
            return out;
        } catch (Throwable t) {
            return current == null ? new View[0] : new View[]{current.getWindow().getDecorView()};
        }
    }

    /**
     * The sheet's column: a vertical layout that has a list (RecyclerView) and a small clickable image (the drag
     * handle) among its children, in a window smaller than the activity's.
     */
    private static ViewGroup findColumn(View v) {
        if (v instanceof ViewGroup g) {
            boolean list = false;
            boolean handle = false;
            for (int i = 0; i < g.getChildCount(); i++) {
                View c = g.getChildAt(i);
                if (c.getClass().getName().endsWith("RecyclerView")) list = true;
                if (c instanceof android.widget.ImageView && c.isClickable() && c.getHeight() < dp(c, 48)) handle = true;
            }
            if (list && handle && g.getChildCount() >= 3) return g;
            for (int i = 0; i < g.getChildCount(); i++) {
                ViewGroup found = findColumn(g.getChildAt(i));
                if (found != null) return found;
            }
        }
        return null;
    }

    private static int dp(View v, float dp) {
        return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, dp, v.getResources().getDisplayMetrics()));
    }

    private static boolean dark(View v) {
        try {
            return (Boolean) Class.forName("app.morphe.extension.shared.Utils").getMethod("isDarkModeEnabled").invoke(null);
        } catch (Throwable t) {
            return (v.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
        }
    }

    private static void inject(ViewGroup column, View root) {
        int at = -1;
        for (int i = 0; i < column.getChildCount(); i++) {
            if (column.getChildAt(i).getClass().getName().endsWith("RecyclerView")) {
                at = i;
                break;
            }
        }
        if (at < 0) return;
        boolean on = AudioOnly.isOn();
        int height = dp(column, 48);
        LinearLayout row = new LinearLayout(column.getContext());
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setClickable(true);
        row.setFocusable(true);
        row.setContentDescription(Strings.get("audio_only"));
        int ink = dark(column) ? Color.WHITE : Color.BLACK;
        TextView mark = new TextView(column.getContext());
        mark.setText(on ? "✓" : "");
        mark.setTextColor(ink);
        mark.setTextSize(TypedValue.COMPLEX_UNIT_SP, 18);
        mark.setGravity(Gravity.CENTER);
        row.addView(mark, new LinearLayout.LayoutParams(dp(column, 24), height));
        TextView label = new TextView(column.getContext());
        label.setText(Strings.get("audio_only"));
        label.setTextColor(ink);
        label.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        label.setTypeface(Typeface.DEFAULT);
        label.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, height, 1f);
        lp.leftMargin = dp(column, 12);
        row.addView(label, lp);
        row.setPadding(dp(column, 16), 0, dp(column, 16), 0);
        row.setOnClickListener(v -> {
            pickedByRow = true;
            AudioOnly.set(!AudioOnly.isOn(), "quality sheet");
            Utils.runOnMainThreadDelayed(() -> pickedByRow = false, 1500);
            close(root);
        });
        LinearLayout.LayoutParams rowParams = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, height);
        // The list below starts with 26 dp of padding of its own, so the row overlaps it to sit one row apart.
        rowParams.bottomMargin = -dp(column, 22);
        column.addView(row, at, rowParams);
        Logger.printDebug(() -> "YouTube Extras: quality sheet row added, audio only " + on);
    }

    /** Closes the sheet's window with the back key, which its dialog dismisses on. */
    private static void close(View root) {
        long now = SystemClock.uptimeMillis();
        root.dispatchKeyEvent(new KeyEvent(now, now, KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_BACK, 0));
        root.dispatchKeyEvent(new KeyEvent(now, now, KeyEvent.ACTION_UP, KeyEvent.KEYCODE_BACK, 0));
    }

    private static final class Callbacks implements Application.ActivityLifecycleCallbacks {
        @Override public void onActivityResumed(Activity a) { current = a; }
        @Override public void onActivityPaused(Activity a) { if (current == a) current = null; }
        @Override public void onActivityCreated(Activity a, Bundle b) {}
        @Override public void onActivityStarted(Activity a) {}
        @Override public void onActivityStopped(Activity a) {}
        @Override public void onActivitySaveInstanceState(Activity a, Bundle b) {}
        @Override public void onActivityDestroyed(Activity a) {}
    }
}
