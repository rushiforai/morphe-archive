/*
 * Copyright 2026 Nyandex contributors.
 *
 * Nyandex: Yandex Music patches for Morphe Patcher.
 * Licensed under the GNU General Public License v3.0; see LICENSE and NOTICE.
 */

package app.nyandex.extension.yandexmusic.settings;

import android.content.SharedPreferences;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/**
 * Called by the bottom bar right after it collected the tabs to show.
 */
@SuppressWarnings("unused")
public final class BottomTabsHook {
    /** The app's tab row is 56dp high, at the top of the bar; the system inset is below it. */
    private static final float ROW_HEIGHT_DP = 56f;

    /** Tabs the bar shows after filtering (0 until the bar has collected them). */
    private static volatile int visibleTabs;

    /** The bottom bar view that collected the tabs last (the patch registers it on every collect). */
    private static volatile WeakReference<View> bar;

    private static float savedX;
    private static float savedY;
    private static boolean saved;

    private BottomTabsHook() {
    }

    /** Called by the bar every time it collects its tabs, so a change can be applied right away. */
    public static void register(View view) {
        bar = new WeakReference<>(view);
    }

    /**
     * Make the bar collect its tabs again, so tabs hidden or shown on the settings page change
     * at once. The patch adds {@code nyandexRefreshTabs()} to the bar, which runs its own
     * tab collection (and so {@link #filterTabs}) on the main thread.
     */
    static void refreshTabs() {
        try {
            WeakReference<View> reference = bar;
            final View view = reference == null ? null : reference.get();
            if (view == null) return;
            view.post(() -> {
                try {
                    view.getClass().getMethod("nyandexRefreshTabs").invoke(view);
                } catch (Throwable throwable) {
                    Log.e(NyandexSettings.TAG, "Failed to refresh the bottom bar tabs", throwable);
                }
            });
        } catch (Throwable throwable) {
            Log.e(NyandexSettings.TAG, "Failed to refresh the bottom bar tabs", throwable);
        }
    }

    /**
     * Called before the bar dispatches a touch. The tab icons are small boxes spread over the full
     * bar width, so with few tabs most of the bar did nothing. A touch in the tab row is moved to
     * the center of the icon of the slot it is in (the bar's width split evenly between the visible
     * tabs, which is where the bar's even spacing puts them), so the whole slot works as the tab.
     */
    public static void beforeTouch(View bar, MotionEvent event) {
        saved = false;
        try {
            int count = visibleTabs;
            if (count <= 0 || !NyandexSettings.tabTouchArea()) return;
            int width = bar.getWidth();
            float rowHeight = ROW_HEIGHT_DP * bar.getResources().getDisplayMetrics().density;
            float x = event.getX();
            float y = event.getY();
            if (width <= 0 || bar.getHeight() < rowHeight
                    || x < 0 || x >= width || y < 0 || y > rowHeight) {
                return;
            }
            int slot = Math.min(count - 1, (int) (x * count / width));
            savedX = x;
            savedY = y;
            saved = true;
            event.setLocation((slot + 0.5f) * width / count, rowHeight / 2f);
        } catch (Throwable throwable) {
            Log.e(NyandexSettings.TAG, "Failed to widen the tab touch area", throwable);
        }
    }

    /** Called after the bar dispatched the touch: gives the event its real position back. */
    public static void afterTouch(MotionEvent event) {
        if (!saved) return;
        saved = false;
        try {
            event.setLocation(savedX, savedY);
        } catch (Throwable throwable) {
            Log.e(NyandexSettings.TAG, "Failed to restore the touch position", throwable);
        }
    }

    /**
     * Remove the tabs hidden on the Nyandex settings page from the bar's tab set.
     * At least one tab always stays, so the bar can never become empty.
     */
    public static void filterTabs(Set<?> tabs) {
        try {
            if (tabs == null) return;
            visibleTabs = tabs.size();
            if (tabs.size() <= 1) return;
            SharedPreferences preferences = NyandexSettings.preferences();
            if (preferences == null) return;

            List<Object> hidden = new ArrayList<>();
            for (Object tab : tabs) {
                if (tab instanceof Enum && NyandexSettings.isTabHidden(preferences, ((Enum<?>) tab).name())) {
                    hidden.add(tab);
                }
            }
            if (hidden.isEmpty()) return;
            if (hidden.size() >= tabs.size()) {
                hidden.remove(hidden.size() - 1); // keep the last tab (Collection)
            }

            Iterator<?> iterator = tabs.iterator();
            while (iterator.hasNext()) {
                if (hidden.contains(iterator.next())) iterator.remove();
            }
            visibleTabs = tabs.size();
        } catch (Throwable throwable) {
            Log.e(NyandexSettings.TAG, "Failed to filter bottom bar tabs", throwable);
        }
    }
}
