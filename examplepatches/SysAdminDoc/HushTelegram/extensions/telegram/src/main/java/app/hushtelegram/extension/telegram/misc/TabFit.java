/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.view.View;
import android.view.ViewGroup;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Shrinks the folder tab strip above the chat list until every tab fits on the screen. The strip
 * is laid out as wide as all its tabs need and drawn scaled down to the screen's width, so Telegram
 * still sees a strip that doesn't scroll and every tab stays where it draws. Nothing is written to
 * Telegram's folders. With only a few folders the strip already fits and isn't touched.
 */
public final class TabFit {
    private TabFit() {}

    /** What the diagnostic report counts each time the strip is shrunk. */
    static final String FITTED = "folder tab strip shrunk to fit";

    /** The smallest the strip gets. Below this the tabs are unreadable, so the last ones scroll instead. */
    static final float SMALLEST = 0.55f;

    /** Telegram's side, through the stubs below. A test answers it itself. */
    static Telegram telegram = new Stubs();

    /** The strips being watched, each with the chat list it belongs to. */
    private static final Map<View, WeakReference<Object>> watched = new WeakHashMap<>();

    /** Set while this class changes a strip, so the layout it causes doesn't start another change. */
    private static boolean busy;

    /**
     * Injected where the chat list builds its folder tabs. Starts watching the strip, which fits
     * itself to every layout from then on.
     */
    public static void update(Object list) {
        try {
            Object found = telegram.strip(list);
            if (!(found instanceof View)) return;
            View strip = (View) found;
            if (!watched.containsKey(strip)) {
                watched.put(strip, new WeakReference<>(list));
                strip.addOnLayoutChangeListener((view, l, t, r, b, ol, ot, or, ob) -> fit(view));
            }
            fit(strip);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, "fit all tabs", failure);
        }
    }

    /** Fits every strip again, after the switch flips. Main thread only. */
    public static void refreshAll() {
        List<View> strips = new ArrayList<>(watched.keySet());
        for (View strip : strips) fit(strip);
    }

    /** Whether the fitting is on in this build and in the settings. */
    static boolean available() {
        try {
            return Utils.settingsReady() && Settings.FIT_ALL_TABS.get() && PatchFamily.Capability.FIT_TABS.installed();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, "fit all tabs", failure);
            return false;
        }
    }

    /** How far the strip is scaled down for tabs [range] wide on a screen [available] wide: 1 when they fit. */
    static float scaleFor(int range, int available) {
        if (range <= available || available <= 0) return 1f;
        return Math.max(SMALLEST, available / (float) range);
    }

    /** The width the strip is laid out at for [scale]: MATCH_PARENT unscaled, else as wide as the screen needs. */
    static int widthFor(float scale, int available) {
        return scale >= 1f ? ViewGroup.LayoutParams.MATCH_PARENT : Math.round(available / scale);
    }

    private static void fit(View strip) {
        if (busy) return;
        try {
            WeakReference<Object> owner = watched.get(strip);
            Object list = owner == null ? null : owner.get();
            View parent = strip.getParent() instanceof View ? (View) strip.getParent() : null;
            ViewGroup.LayoutParams params = strip.getLayoutParams();
            if (list == null || parent == null || params == null) return;
            int available = parent.getWidth() - parent.getPaddingLeft() - parent.getPaddingRight();
            if (available <= 0) return;
            float scale = available() ? scaleFor(telegram.range(list), available) : 1f;
            int width = widthFor(scale, available);
            boolean changed = params.width != width || Math.abs(strip.getScaleX() - scale) > 0.001f;
            if (!changed) return;
            busy = true;
            try {
                params.width = width;
                strip.setLayoutParams(params);
                strip.setPivotX(0f);
                strip.setPivotY(strip.getHeight() / 2f);
                strip.setScaleX(scale);
                strip.setScaleY(scale);
            } finally {
                busy = false;
            }
            if (scale < 1f) HookStatus.counted(FamilyNames.HIDE_FOLDER_COUNTERS, FITTED);
        } catch (Throwable failure) {
            busy = false;
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, "fit all tabs", failure);
        }
    }

    /** What this needs from Telegram. */
    interface Telegram {
        /** The chat list's folder tab strip, or null before it exists. */
        Object strip(Object list);

        /** How wide all the strip's tabs are together, in pixels. */
        int range(Object list);
    }

    private static final class Stubs implements Telegram {
        @Override public Object strip(Object list) { return TabFit.tabStrip(list); }

        @Override public int range(Object list) { return TabFit.tabsRange(list); }
    }

    // Stubs. The patch gives each one Telegram's code; until then they do nothing.

    /** {@code list.filterTabsView}. */
    public static Object tabStrip(Object list) { return null; }

    /** {@code list.filterTabsView.listView.computeHorizontalScrollRange()}, 0 without a strip. */
    public static int tabsRange(Object list) { return 0; }
}
