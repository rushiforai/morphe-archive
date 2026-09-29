/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.navigation;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.os.Bundle;
import android.view.HapticFeedbackConstants;
import android.view.View;
import android.view.ViewGroup;

import java.lang.ref.WeakReference;

import app.morphe.extension.shared.GlobalLayoutHook;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.tiktok.blockauthor.FeedVisibility;
import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.settings.SettingsStatus;
import app.morphe.extension.tiktok.settings.TikTokActivityHook;

/**
 * A long press on the Home tab opens Hushfeed's settings (#45), which otherwise sit behind
 * Profile, the menu and TikTok's settings list.
 *
 * <p>TikTok gives that press nothing of its own: on 47.0.3 a held Home acts as a tap. A tab that
 * is already long-clickable when this first sees it is left alone, so a build that does give Home
 * a long press keeps it. Profile's long press is TikTok's account switcher, so not Profile.
 *
 * <p>The tab bar is rebuilt now and then (a tab filter change, a configuration change), so the
 * listener is checked on each layout pass of the main activity, and switching the setting off
 * takes it away again the next time the feed is laid out.
 */
public final class HomeTabSettingsShortcut {
    private static final GlobalLayoutHook LAYOUT = new GlobalLayoutHook();
    private static WeakReference<Application> followed = new WeakReference<>(null);
    private static WeakReference<Activity> activityReference = new WeakReference<>(null);
    /** The tab the listener is on, so a rebuilt tab gets it again and an old one is let go. */
    private static WeakReference<View> attached = new WeakReference<>(null);
    /** A tab that was long-clickable before this touched it, so it is never taken over. */
    private static WeakReference<View> refused = new WeakReference<>(null);

    private static final View.OnLongClickListener OPEN_SETTINGS = view -> {
        try {
            view.performHapticFeedback(HapticFeedbackConstants.LONG_PRESS);
            TikTokActivityHook.openSettings();
        } catch (Throwable error) {
            Logger.printException(() -> "Could not open Hushfeed settings from the Home tab", error);
        }
        // Handled, so the release that ends the press isn't also a tap that reloads the feed.
        return true;
    };

    private HomeTabSettingsShortcut() {
    }

    /**
     * Called from the patched {@code MainActivity.onCreate}, right after the extension's context
     * and before the host's own onCreate: nothing here may touch the window, which would build
     * the decor before the host asks for its window features. Views wait for the first resume.
     */
    public static void install(Context context) {
        try {
            if (!(context instanceof Activity) || !SettingsStatus.feedNavigationEnabled) return;
            Activity activity = (Activity) context;
            activityReference = new WeakReference<>(activity);
            follow(activity.getApplication());
        } catch (Throwable error) {
            Logger.printException(() -> "Could not follow the Home tab", error);
        }
    }

    private static void follow(Application application) {
        if (application == null || followed.get() == application) return;
        followed = new WeakReference<>(application);
        application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            // The main activity alone has the tab bar; a creator's video opens in another one.
            @Override public void onActivityResumed(Activity resumed) {
                if (activityReference.get() != resumed) return;
                ViewGroup root = resumed.findViewById(android.R.id.content);
                if (root != null) LAYOUT.install(root, HomeTabSettingsShortcut::apply);
                apply();
            }

            @Override public void onActivityDestroyed(Activity destroyed) {
                if (activityReference.get() == destroyed) LAYOUT.detach();
            }

            @Override public void onActivityCreated(Activity created, Bundle state) { }
            @Override public void onActivityStarted(Activity started) { }
            @Override public void onActivityPaused(Activity paused) { }
            @Override public void onActivityStopped(Activity stopped) { }
            @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) { }
        });
    }

    static void apply() {
        try {
            Activity activity = activityReference.get();
            if (activity == null || activity.isFinishing()) {
                LAYOUT.detach();
                return;
            }
            View home = FeedVisibility.homeTabView(activity);
            View current = attached.get();
            boolean wanted = Settings.HOME_TAB_OPENS_SETTINGS.get();
            if (current != null && (current != home || !wanted)) {
                current.setOnLongClickListener(null);
                current.setLongClickable(false);
                attached = new WeakReference<>(null);
            }
            if (!wanted || home == null || attached.get() == home || refused.get() == home) return;
            if (home.isLongClickable()) {
                refused = new WeakReference<>(home);
                Logger.printInfo(() -> "The Home tab has a long press of its own; leaving it to TikTok");
                return;
            }
            // A view that isn't the one taking the tap would take the whole press once it is
            // long-clickable, and the tap its parent handles would be lost.
            if (!home.isClickable()) {
                refused = new WeakReference<>(home);
                Logger.printInfo(() -> "The Home tab view doesn't take the tap itself; no long press");
                return;
            }
            home.setOnLongClickListener(OPEN_SETTINGS);
            attached = new WeakReference<>(home);
        } catch (Throwable error) {
            Logger.printException(() -> "Could not set the Home tab's long press", error);
        }
    }

    static void resetForTests() {
        LAYOUT.detach();
        followed = new WeakReference<>(null);
        activityReference = new WeakReference<>(null);
        attached = new WeakReference<>(null);
        refused = new WeakReference<>(null);
    }
}
