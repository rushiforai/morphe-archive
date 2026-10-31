package app.tikkamasalla.stremio.introskip;

import android.app.Application;
import android.content.SharedPreferences;

import androidx.preference.PreferenceManager;

import java.lang.reflect.Method;
import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;

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

    private SpoilerHide() {
    }

    public static boolean isEnabled() {
        try {
            Class<?> thread = Class.forName("android.app.ActivityThread");
            Method current = thread.getMethod("currentApplication");
            Application app = (Application) current.invoke(null);
            if (app == null) return false;
            SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(app);
            if (prefs == null) return false;
            return prefs.getBoolean(KEY, false);
        } catch (Throwable ignored) {
            return false;
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
