/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.feed;

import android.app.Activity;
import android.app.Application;
import android.content.res.Resources;
import android.os.Build;
import android.os.Bundle;
import android.view.DisplayCutout;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowInsetsController;
import android.view.WindowManager;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.tiktok.settings.Settings;
import java.lang.ref.WeakReference;
import java.util.ArrayDeque;
import java.util.WeakHashMap;

/**
 * Hide the status bar in LIVE rooms (#38). A LIVE room is an activity of its own,
 * {@code LivePlayActivity}, so Hide the status bar, which works on the main activity's window,
 * never reached it. Each time a LIVE room comes to the front with the switch on, its status bar
 * is hidden and its window allowed into the display cutout, and the strip TikTok keeps for the
 * bar is taken away so the stream reaches the top edge; all of it goes back as the room leaves,
 * so switching apps or rotating starts again from TikTok's own state.
 */
public final class LiveStatusBar {
    /** TikTok's LIVE room, real-named on 47.0.3 and 47.1.3 (read off the S22, 2026-09-27). */
    static final String LIVE_ROOM = "com.ss.android.ugc.aweme.live.LivePlayActivity";

    private static final String HOOK_FAMILY = "LIVE status bar";
    private static final int LEGACY_FLAGS = View.SYSTEM_UI_FLAG_FULLSCREEN | View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY;
    /** How deep the strip is looked for; on 47.1.3 it sits three levels under the content view. */
    private static final int MAX_DEPTH = 12;
    /** Containers looked into on one pass, so a deep room can't make a layout pass slow. */
    private static final int MAX_VISITS = 200;
    /** Layout passes that look for the strip before giving up on a room that has none. */
    private static final int MAX_SEARCHES = 40;
    /** Times the strip is taken away again after TikTok puts it back, so the two can't fight. */
    private static final int MAX_RELIFTS = 6;

    private static WeakReference<Application> followed = new WeakReference<>(null);
    /** The rooms whose bar this hid. */
    private static final WeakHashMap<Activity, Room> HIDDEN = new WeakHashMap<>();

    private LiveStatusBar() {
    }

    /** Registered once per application, from the main activity the overlay hider installs on. */
    public static void follow(Activity activity) {
        Application application = activity == null ? null : activity.getApplication();
        if (application == null || followed.get() == application) return;
        followed = new WeakReference<>(application);
        application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override public void onActivityResumed(Activity resumed) {
                if (isLiveRoom(resumed) && Settings.HIDE_STATUS_BAR_IN_LIVE.get()) hide(resumed);
            }

            @Override public void onActivityPaused(Activity paused) {
                if (HIDDEN.containsKey(paused)) show(paused);
            }

            @Override public void onActivityCreated(Activity created, Bundle state) { }
            @Override public void onActivityStarted(Activity started) { }
            @Override public void onActivityStopped(Activity stopped) { }
            @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) { }
            @Override public void onActivityDestroyed(Activity destroyed) { HIDDEN.remove(destroyed); }
        });
    }

    static boolean isLiveRoom(Activity activity) {
        return activity != null && LIVE_ROOM.equals(activity.getClass().getName());
    }

    static boolean isHidden(Activity activity) {
        return HIDDEN.containsKey(activity);
    }

    static void hide(Activity activity) {
        try {
            Window window = activity.getWindow();
            if (window == null || HIDDEN.containsKey(activity)) return;
            WindowManager.LayoutParams attributes = window.getAttributes();
            int cutout = Build.VERSION.SDK_INT >= 28 ? attributes.layoutInDisplayCutoutMode : 0;
            View decor = window.getDecorView();
            Room room = new Room(activity, decor, cutout);
            HIDDEN.put(activity, room);
            // Only a room that stays out of the cutout is let in. 47.1.3's LIVE window already
            // asks for ALWAYS (read off the S22), which SHORT_EDGES would narrow in landscape.
            if (Build.VERSION.SDK_INT >= 28
                    && (cutout == WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_DEFAULT
                    || cutout == WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_NEVER)) {
                attributes.layoutInDisplayCutoutMode =
                        WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES;
                window.setAttributes(attributes);
            }
            if (Build.VERSION.SDK_INT >= 30) {
                WindowInsetsController controller = decor.getWindowInsetsController();
                if (controller != null) {
                    controller.setSystemBarsBehavior(WindowInsetsController.BEHAVIOR_SHOW_TRANSIENT_BARS_BY_SWIPE);
                    controller.hide(WindowInsets.Type.statusBars());
                }
            } else {
                decor.setSystemUiVisibility(decor.getSystemUiVisibility() | LEGACY_FLAGS);
            }
            // The room's views are laid out after it resumes, and its insets are only known once
            // the window is attached, so the strip is looked for on the layout passes that follow.
            decor.getViewTreeObserver().addOnGlobalLayoutListener(room);
            HookStatus.bound(HOOK_FAMILY, "LIVE room status bar hidden");
        } catch (Throwable failure) {
            HookStatus.threw(HOOK_FAMILY, "hide", failure);
            Logger.printException(() -> "Could not hide the status bar in a LIVE room", failure);
        }
    }

    static void show(Activity activity) {
        Room room = HIDDEN.remove(activity);
        if (room == null) return;
        try {
            Window window = activity.getWindow();
            if (window == null) return;
            View decor = window.getDecorView();
            decor.getViewTreeObserver().removeOnGlobalLayoutListener(room);
            room.putBack();
            if (Build.VERSION.SDK_INT >= 28) {
                WindowManager.LayoutParams attributes = window.getAttributes();
                if (attributes.layoutInDisplayCutoutMode != room.cutout) {
                    attributes.layoutInDisplayCutoutMode = room.cutout;
                    window.setAttributes(attributes);
                }
            }
            if (Build.VERSION.SDK_INT >= 30) {
                WindowInsetsController controller = decor.getWindowInsetsController();
                if (controller != null) controller.show(WindowInsets.Type.statusBars());
            } else {
                decor.setSystemUiVisibility(decor.getSystemUiVisibility() & ~LEGACY_FLAGS);
            }
        } catch (Throwable failure) {
            Logger.printException(() -> "Could not bring the status bar back after a LIVE room", failure);
        }
    }

    /**
     * The heights TikTok could have kept a strip for: the status bar as it is when shown, the
     * cutout's safe inset, and the platform's own status bar height. On the S22 the room's content
     * starts 75 px down with the bar hidden, a fixed offset TikTok never takes back.
     */
    static int[] barHeights(View decor) {
        int shown = 0, cutout = 0;
        WindowInsets insets = decor.getRootWindowInsets();
        if (insets != null && Build.VERSION.SDK_INT >= 30) {
            shown = insets.getInsetsIgnoringVisibility(WindowInsets.Type.statusBars()).top;
        }
        if (insets != null && Build.VERSION.SDK_INT >= 28) {
            DisplayCutout displayCutout = insets.getDisplayCutout();
            if (displayCutout != null) cutout = displayCutout.getSafeInsetTop();
        }
        int platform = 0;
        Resources resources = Resources.getSystem();
        int id = resources.getIdentifier("status_bar_height", "dimen", "android");
        if (id != 0) platform = resources.getDimensionPixelSize(id);
        return new int[] {shown, cutout, platform};
    }

    private static boolean isBar(int offset, int[] bars) {
        if (offset <= 0) return false;
        for (int bar : bars) if (bar == offset) return true;
        return false;
    }

    /**
     * The first padding or top margin under the content view that is exactly a status bar tall,
     * level by level. Each container's own padding is checked, then its children's top margins
     * (the tallest child first), and every child that still starts at the top is looked into next.
     * One path isn't enough: on 47.1.3 the content view holds AppCompat's empty frame and TikTok's
     * room side by side, both full screen, and the room is the second.
     */
    static Offset findOffset(View content, int[] bars) {
        ArrayDeque<View> level = new ArrayDeque<>();
        level.add(content);
        int visited = 0;
        for (int depth = 0; depth < MAX_DEPTH && !level.isEmpty(); depth++) {
            ArrayDeque<View> next = new ArrayDeque<>();
            for (View at : level) {
                if (!(at instanceof ViewGroup) || visited++ >= MAX_VISITS) continue;
                ViewGroup group = (ViewGroup) at;
                if (isBar(group.getPaddingTop(), bars)) return new Offset(group, true, group.getPaddingTop());
                View margined = null;
                for (int i = 0; i < group.getChildCount(); i++) {
                    View child = group.getChildAt(i);
                    if (child.getVisibility() != View.VISIBLE) continue;
                    ViewGroup.LayoutParams params = child.getLayoutParams();
                    if (params instanceof ViewGroup.MarginLayoutParams
                            && isBar(((ViewGroup.MarginLayoutParams) params).topMargin, bars)
                            && (margined == null || child.getHeight() > margined.getHeight())) {
                        margined = child;
                    }
                    if (child instanceof ViewGroup && child.getTop() == group.getPaddingTop()) next.add(child);
                }
                if (margined != null) {
                    return new Offset(margined, false, ((ViewGroup.MarginLayoutParams) margined.getLayoutParams()).topMargin);
                }
            }
            level = next;
        }
        return null;
    }

    /** A padding or margin this took away, with the height it had. */
    static final class Offset {
        final WeakReference<View> view;
        final boolean padding;
        final int value;

        Offset(View view, boolean padding, int value) {
            this.view = new WeakReference<>(view);
            this.padding = padding;
            this.value = value;
        }

        int current(View target) {
            if (padding) return target.getPaddingTop();
            ViewGroup.LayoutParams params = target.getLayoutParams();
            return params instanceof ViewGroup.MarginLayoutParams ? ((ViewGroup.MarginLayoutParams) params).topMargin : -1;
        }

        void set(View target, int top) {
            if (padding) {
                target.setPadding(target.getPaddingLeft(), top, target.getPaddingRight(), target.getPaddingBottom());
            } else {
                ViewGroup.MarginLayoutParams params = (ViewGroup.MarginLayoutParams) target.getLayoutParams();
                params.topMargin = top;
                target.setLayoutParams(params);
            }
        }
    }

    /** One visit to a LIVE room with its bar hidden. It holds its views weakly. */
    private static final class Room implements ViewTreeObserver.OnGlobalLayoutListener {
        final int cutout;
        private final WeakReference<Activity> activity;
        private final WeakReference<View> decor;
        private Offset lifted;
        private int searches, relifts;

        Room(Activity activity, View decor, int cutout) {
            this.activity = new WeakReference<>(activity);
            this.decor = new WeakReference<>(decor);
            this.cutout = cutout;
        }

        @Override public void onGlobalLayout() {
            try {
                if (lifted != null) {
                    View target = lifted.view.get();
                    // TikTok put the strip back, on a relayout of its own.
                    if (target != null && lifted.current(target) == lifted.value && relifts++ < MAX_RELIFTS) {
                        lifted.set(target, 0);
                    }
                    return;
                }
                Activity room = activity.get();
                View window = decor.get();
                if (room == null || window == null || searches >= MAX_SEARCHES) return;
                View content = room.findViewById(android.R.id.content);
                if (content == null || content.getHeight() == 0) return;
                searches++;
                Offset offset = findOffset(content, barHeights(window));
                if (offset == null) return;
                View target = offset.view.get();
                if (target == null) return;
                lifted = offset;
                offset.set(target, 0);
                HookStatus.bound(HOOK_FAMILY, "LIVE room top strip taken away");
            } catch (Throwable failure) {
                searches = MAX_SEARCHES;
                HookStatus.threw(HOOK_FAMILY, "top strip", failure);
                Logger.printException(() -> "Could not take away the LIVE room's top strip", failure);
            }
        }

        /** Gives the strip back unless TikTok has already set one of its own. */
        void putBack() {
            if (lifted == null) return;
            View target = lifted.view.get();
            if (target != null && lifted.current(target) == 0) lifted.set(target, lifted.value);
            lifted = null;
        }
    }
}
