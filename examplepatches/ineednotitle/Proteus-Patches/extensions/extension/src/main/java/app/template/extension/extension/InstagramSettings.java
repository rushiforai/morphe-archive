/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * Adapted from https://github.com/crimera/piko (GPL-3.0).
 * See META-INF/PROTEUS-NOTICE.txt for GPLv3 §7(b) terms.
 */

package app.template.extension.extension;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;

import java.lang.reflect.Method;
import java.util.Collections;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

/**
 * Small, self-contained preference store used by the Instagram patches.
 *
 * <p>The extension is loaded into Instagram's process before any activity is
 * created, so the application context is captured opportunistically from the
 * first action-bar/dialog call. A best-effort reflective lookup of
 * {@code ActivityThread.currentApplication()} covers hooks that run earlier
 * (for example feed requests and DM seen requests).</p>
 */
@SuppressWarnings("unused")
public final class InstagramSettings {
    public static final String PREFS_NAME = "proteus_instagram_settings";

    public static final String KEY_CHRONOLOGICAL_FEED = "chronological_feed";
    public static final String KEY_GHOST_MODE = "ghost_mode";
    public static final String KEY_GHOST_HIDE_TYPING = "ghost_hide_typing";
    public static final String KEY_GHOST_HIDE_DM_SEEN = "ghost_hide_dm_seen";
    public static final String KEY_GHOST_HIDE_STORY_SEEN = "ghost_hide_story_seen";
    public static final String KEY_REELS_PLAYBACK_SPEED = "reels_playback_speed";
    public static final String KEY_REELS_SEEK_CONTROLS = "reels_seek_controls";
    public static final String KEY_LIKE_ANIMATION = "like_animation";

    private static final Map<String, Boolean> DEFAULTS;

    static {
        Map<String, Boolean> defaults = new java.util.HashMap<>();
        defaults.put(KEY_CHRONOLOGICAL_FEED, true);
        defaults.put(KEY_GHOST_MODE, false);
        defaults.put(KEY_GHOST_HIDE_TYPING, true);
        defaults.put(KEY_GHOST_HIDE_DM_SEEN, true);
        defaults.put(KEY_GHOST_HIDE_STORY_SEEN, true);
        defaults.put(KEY_REELS_PLAYBACK_SPEED, true);
        defaults.put(KEY_REELS_SEEK_CONTROLS, true);
        DEFAULTS = Collections.unmodifiableMap(defaults);
    }

    private static final Set<Runnable> LISTENERS =
            Collections.newSetFromMap(new WeakHashMap<Runnable, Boolean>());

    private static volatile Context applicationContext;
    private static volatile SharedPreferences preferences;

    private InstagramSettings() {
    }

    /**
     * Stores the application context. Safe to call repeatedly.
     */
    public static void initialize(Context context) {
        if (context == null) {
            return;
        }
        try {
            Context application = context.getApplicationContext();
            applicationContext = application != null ? application : context;
            SharedPreferences current = applicationContext.getSharedPreferences(
                    PREFS_NAME, Context.MODE_PRIVATE);
            preferences = current;
            refreshRuntimeFlags(current);
        } catch (Throwable ignored) {
            // Preferences are optional. Hooks fall back to their defaults.
        }
    }

    public static SharedPreferences getPreferences() {
        SharedPreferences current = preferences;
        if (current != null) {
            return current;
        }
        Context context = applicationContext;
        if (context == null) {
            context = currentApplication();
            if (context != null) {
                applicationContext = context;
            }
        }
        if (context == null) {
            return null;
        }
        synchronized (InstagramSettings.class) {
            if (preferences == null) {
                preferences = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
                refreshRuntimeFlags(preferences);
            }
            return preferences;
        }
    }

    public static boolean getBoolean(String key) {
        Boolean defaultValue = DEFAULTS.get(key);
        boolean fallback = defaultValue != null && defaultValue;
        SharedPreferences current = getPreferences();
        if (current == null) {
            return fallback;
        }
        try {
            return current.getBoolean(key, fallback);
        } catch (Throwable ignored) {
            return fallback;
        }
    }

    public static void setBoolean(String key, boolean value) {
        SharedPreferences current = getPreferences();
        if (current != null) {
            current.edit().putBoolean(key, value).apply();
            refreshRuntimeFlags(current);
        }
        notifyListeners();
    }

    public static String getString(String key, String defaultValue) {
        SharedPreferences current = getPreferences();
        if (current == null) {
            return defaultValue;
        }
        try {
            return current.getString(key, defaultValue);
        } catch (Throwable ignored) {
            return defaultValue;
        }
    }

    public static void setString(String key, String value) {
        SharedPreferences current = getPreferences();
        if (current != null) {
            current.edit().putString(key, value).apply();
            refreshRuntimeFlags(current);
        }
        notifyListeners();
    }

    public static void resetToDefaults() {
        SharedPreferences current = getPreferences();
        if (current != null) {
            current.edit().clear().apply();
            refreshRuntimeFlags(current);
        }
        notifyListeners();
    }

    public static void addListener(Runnable listener) {
        if (listener != null) {
            LISTENERS.add(listener);
        }
    }

    public static void removeListener(Runnable listener) {
        LISTENERS.remove(listener);
    }

    private static void notifyListeners() {
        for (Runnable listener : LISTENERS) {
            try {
                listener.run();
            } catch (Throwable ignored) {
                // A broken listener must not break the setting change.
            }
        }
    }

    public static boolean isChronologicalFeedEnabled() {
        return getBoolean(KEY_CHRONOLOGICAL_FEED);
    }

    public static boolean isGhostModeEnabled() {
        return getBoolean(KEY_GHOST_MODE);
    }

    public static boolean isReelsPlaybackSpeedEnabled() {
        return getBoolean(KEY_REELS_PLAYBACK_SPEED);
    }

    public static boolean isReelsSeekControlsEnabled() {
        return getBoolean(KEY_REELS_SEEK_CONTROLS);
    }

    public static String getLikeAnimation() {
        return getString(KEY_LIKE_ANIMATION, InstagramLikeAnimations.DEFAULT);
    }

    /**
     * Re-reads every preference into the Android-free runtime snapshot.
     */
    private static void refreshRuntimeFlags(SharedPreferences current) {
        if (current == null) {
            return;
        }
        InstagramRuntimeFlags.update(
                current.getBoolean(KEY_CHRONOLOGICAL_FEED, true),
                current.getBoolean(KEY_GHOST_MODE, false),
                current.getBoolean(KEY_GHOST_HIDE_TYPING, true),
                current.getBoolean(KEY_GHOST_HIDE_DM_SEEN, true),
                current.getBoolean(KEY_GHOST_HIDE_STORY_SEEN, true),
                current.getBoolean(KEY_REELS_PLAYBACK_SPEED, true),
                current.getBoolean(KEY_REELS_SEEK_CONTROLS, true),
                current.getString(KEY_LIKE_ANIMATION, InstagramLikeAnimations.DEFAULT));
        InstagramGhostMode.refreshRequestFilter();
    }

    private static Context currentApplication() {
        try {
            Class<?> activityThread = Class.forName("android.app.ActivityThread");
            Method currentApplication = activityThread.getMethod("currentApplication");
            Object application = currentApplication.invoke(null);
            if (application instanceof Application) {
                return (Application) application;
            }
            if (application instanceof Context) {
                return (Context) application;
            }
        } catch (Throwable ignored) {
            // Hidden API access is best effort only.
        }
        return null;
    }
}
