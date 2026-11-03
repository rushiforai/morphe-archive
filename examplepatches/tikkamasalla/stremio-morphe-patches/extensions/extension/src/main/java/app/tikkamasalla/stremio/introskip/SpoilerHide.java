package app.tikkamasalla.stremio.introskip;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;


import java.lang.reflect.Method;
import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Hide spoilers logic. Mirrors the hand made SpoilerPrefs smali:
 * default OFF, hides only unwatched episodes, filters only at display time.
 * The real Video objects are never copied or changed, so season pills
 * and scroll behave exactly as with the setting OFF.
 */
public final class SpoilerHide {
    public static final String KEY = "prefs_hide_spoilers";

    private static final Map<Object, Boolean> REFRESH_CACHE =
            Collections.synchronizedMap(new WeakHashMap<Object, Boolean>());

    /** Setting cache, kept current by {@link #LISTENER}. Set once the application is available. */
    private static volatile boolean setupDone = false;
    private static volatile boolean enabled = false;

    /** Strong reference: SharedPreferences holds its listeners weakly. */
    private static SharedPreferences.OnSharedPreferenceChangeListener listener;

    /** Reflection handles of one Video / SeriesInfo class (Method may be null when absent). */
    private static final class Shape {
        final Method watched;
        final Method seriesInfo;

        Shape(Method watched, Method seriesInfo) {
            this.watched = watched;
            this.seriesInfo = seriesInfo;
        }
    }

    private static final class MethodRef {
        final Method method;

        MethodRef(Method method) {
            this.method = method;
        }
    }

    private static final ConcurrentHashMap<Class<?>, Shape> VIDEO_SHAPES =
            new ConcurrentHashMap<Class<?>, Shape>();
    private static final ConcurrentHashMap<Class<?>, MethodRef> EPISODE_METHODS =
            new ConcurrentHashMap<Class<?>, MethodRef>();

    private SpoilerHide() {
    }

    /**
     * The default preferences file by name (what androidx PreferenceManager would open, and what
     * the Mod settings screen writes), so builds without androidx.preference work too.
     */
    private static SharedPreferences prefsOf(Application app) {
        return app.getSharedPreferences(app.getPackageName() + "_preferences", Context.MODE_PRIVATE);
    }

    /** The setting, read fresh from the preferences (legacy paths, unchanged). */
    public static boolean isEnabled() {
        try {
            Class<?> thread = Class.forName("android.app.ActivityThread");
            Method current = thread.getMethod("currentApplication");
            Application app = (Application) current.invoke(null);
            if (app == null) return false;
            SharedPreferences prefs = prefsOf(app);
            if (prefs == null) return false;
            return prefs.getBoolean(KEY, false);
        } catch (Throwable ignored) {
            return false;
        }
    }

    /**
     * The setting for the hot getter path: cached after the first successful call, a change
     * listener on the default SharedPreferences keeps it current. Before the application exists
     * it returns false and tries again on the next call.
     */
    private static boolean cachedEnabled() {
        if (!setupDone) setup();
        return enabled;
    }

    private static synchronized void setup() {
        if (setupDone) return;
        try {
            Class<?> thread = Class.forName("android.app.ActivityThread");
            Method current = thread.getMethod("currentApplication");
            Application app = (Application) current.invoke(null);
            if (app == null) return;
            SharedPreferences prefs = prefsOf(app);
            if (prefs == null) return;
            enabled = prefs.getBoolean(KEY, false);
            listener = new SharedPreferences.OnSharedPreferenceChangeListener() {
                @Override
                public void onSharedPreferenceChanged(SharedPreferences sharedPreferences, String key) {
                    if (key == null || KEY.equals(key)) {
                        enabled = sharedPreferences.getBoolean(KEY, false);
                    }
                }
            };
            prefs.registerOnSharedPreferenceChangeListener(listener);
            setupDone = true;
        } catch (Throwable ignored) {
            // Retry on the next call.
        }
    }

    private static Shape shapeOf(Class<?> type) {
        Shape shape = VIDEO_SHAPES.get(type);
        if (shape == null) {
            Method watched = null;
            Method seriesInfo = null;
            try {
                watched = type.getMethod("getWatched");
            } catch (Throwable ignored) {
            }
            try {
                seriesInfo = type.getMethod("getSeriesInfo");
            } catch (Throwable ignored) {
            }
            shape = new Shape(watched, seriesInfo);
            Shape raced = VIDEO_SHAPES.putIfAbsent(type, shape);
            if (raced != null) shape = raced;
        }
        return shape;
    }

    private static Method episodeMethodOf(Class<?> type) {
        MethodRef ref = EPISODE_METHODS.get(type);
        if (ref == null) {
            Method method = null;
            try {
                method = type.getMethod("getEpisode");
            } catch (Throwable ignored) {
            }
            ref = new MethodRef(method);
            MethodRef raced = EPISODE_METHODS.putIfAbsent(type, ref);
            if (raced != null) ref = raced;
        }
        return ref.method;
    }

    /**
     * Compose builds, called from the patched Video.getThumbnail / getOverview: true when the
     * setting is ON and this is an UNWATCHED EPISODE (watched=false and seriesInfo present).
     * Watched episodes and movies (no seriesInfo) are never hidden. Fail soft: false.
     */
    public static boolean hidesEpisode(Object video) {
        if (video == null || !cachedEnabled()) return false;
        try {
            Shape shape = shapeOf(video.getClass());
            if (shape.watched == null || shape.seriesInfo == null) return false;
            if (Boolean.TRUE.equals(shape.watched.invoke(video))) return false;
            return shape.seriesInfo.invoke(video) != null;
        } catch (Throwable ignored) {
            return false;
        }
    }

    /**
     * Compose builds, called from the patched Video.getTitle: "Episode N" for a hidden episode,
     * else null (the getter then returns the real title).
     */
    public static String hiddenTitle(Object video) {
        if (!hidesEpisode(video)) return null;
        try {
            Object info = shapeOf(video.getClass()).seriesInfo.invoke(video);
            if (info == null) return null;
            Method getter = episodeMethodOf(info.getClass());
            if (getter == null) return null;
            Object value = getter.invoke(info);
            long episode = value instanceof Number ? ((Number) value).longValue() : 0L;
            return episode > 0 ? "Episode " + episode : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    /** True when this video should show no thumbnail and no overview. */
    public static boolean hides(Object video) {
        if (video == null) return false;
        try {
            Method watched = video.getClass().getMethod("getWatched");
            Object value = watched.invoke(video);
            if (Boolean.TRUE.equals(value)) return false;
            return isEnabled();
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static String overviewOf(Object video) {
        if (video == null) return null;
        try {
            if (hides(video)) return null;
            Method getter = video.getClass().getMethod("getOverview");
            Object value = getter.invoke(video);
            return (String) value;
        } catch (Throwable ignored) {
            return null;
        }
    }

    public static String thumbnailOf(Object video) {
        if (video == null) return null;
        try {
            if (hides(video)) return null;
            Method getter = video.getClass().getMethod("getThumbnail");
            Object value = getter.invoke(video);
            return (String) value;
        } catch (Throwable ignored) {
            return null;
        }
    }

    /**
     * Hidden label for unwatched episodes when spoiler mode is ON, else null
     * (caller runs the original label). Watched episodes and movies return null.
     */
    public static String episodeLabel(Object video) {
        if (video == null) return null;
        try {
            if (!hides(video)) return null;
            Method seriesInfo = video.getClass().getMethod("getSeriesInfo");
            Object info = seriesInfo.invoke(video);
            if (info == null) return null;
            Object ep;
            try {
                ep = info.getClass().getMethod("getEpisode").invoke(info);
            } catch (NoSuchMethodException missing) {
                return null;
            }
            long episode = ep instanceof Number ? ((Number) ep).longValue() : 0L;
            if (episode <= 0) return null;
            return "Episode " + episode;
        } catch (Throwable ignored) {
            return null;
        }
    }

    /**
     * Redraws the episode row when the setting changed, matching the hand made
     * VideosController.refreshSpoilers. Fail soft: any problem does nothing.
     * Only parameter and result registers are used by the call sites.
     */
    public static void refresh(Object controller) {
        if (controller == null) return;
        try {
            boolean current = isEnabled();
            Boolean last = REFRESH_CACHE.get(controller);
            boolean previous = last == null ? false : last;
            if (last != null && previous == current) return;
            REFRESH_CACHE.put(controller, current);
            if (last == null && !current) return;
            if (last != null && previous == current) return;
            Method getAdapter = controller.getClass().getMethod("getRowAdapter");
            Object adapter = getAdapter.invoke(controller);
            if (adapter == null) return;
            Method sizeMethod = adapter.getClass().getMethod("size");
            Object sizeValue = sizeMethod.invoke(adapter);
            if (!(sizeValue instanceof Integer)) return;
            int size = (Integer) sizeValue;
            if (size <= 0) return;
            Method notifyMethod = adapter.getClass().getMethod(
                    "notifyArrayItemRangeChanged", int.class, int.class);
            notifyMethod.invoke(adapter, 0, size);
        } catch (Throwable ignored) {
            // Refresh is optional; the list keeps working with old rows.
        }
    }

    /**
     * onResume entry: takes the fragment (p0) so the hook needs no new
     * registers, then resolves the controller and refreshes it.
     */
    public static void refreshFragment(Object fragment) {
        if (fragment == null) return;
        try {
            Method getter;
            try {
                getter = fragment.getClass().getDeclaredMethod("getController");
            } catch (NoSuchMethodException missing) {
                getter = fragment.getClass().getMethod("getController");
            }
            getter.setAccessible(true);
            Object controller = getter.invoke(fragment);
            refresh(controller);
        } catch (Throwable ignored) {
            // Refresh is optional.
        }
    }
}
