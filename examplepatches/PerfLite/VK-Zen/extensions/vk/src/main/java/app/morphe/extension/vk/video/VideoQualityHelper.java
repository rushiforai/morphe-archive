package app.morphe.extension.vk.video;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.morphe.extension.vk.layout.NavigationFilter;

public class VideoQualityHelper {

    private static final String TAG = "VideoQualityHelper";
    public static final String KEY_VIDEO_QUALITY = "pref_video_quality";
    public static final String DEFAULT_QUALITY = "auto";

    public static final String[] QUALITY_VALUES = {
        "auto", "1080", "720", "480", "360"
    };

    public static final String[] QUALITY_TITLES = {
        "Авто (по умолчанию)",
        "1080p Full HD",
        "720p HD",
        "480p",
        "360"
    };

    public static final String[] QUALITY_SUBTITLES = {
        "Стандартное поведение VK (адаптивный битрейт)",
        "Максимальная четкость",
        "Оптимальный баланс качества и трафика",
        "Среднее качество",
        "Базовое качество (экономия трафика)"
    };

    private static final Pattern HEIGHT_PATTERN = Pattern.compile("height:\\s*(\\d+)");

    public static String getPreferredQualitySetting() {
        try {
            SharedPreferences prefs = NavigationFilter.getPrefs(null);
            if (prefs != null) {
                return prefs.getString(KEY_VIDEO_QUALITY, DEFAULT_QUALITY);
            }
        } catch (Throwable t) {
            Log.e(TAG, "Error getting preferred quality setting", t);
        }
        return DEFAULT_QUALITY;
    }

    public static void savePreferredQuality(Context context, String quality) {
        try {
            SharedPreferences prefs = NavigationFilter.getPrefs(context);
            if (prefs != null) {
                prefs.edit().putString(KEY_VIDEO_QUALITY, quality).commit();
            }
        } catch (Throwable t) {
            Log.e(TAG, "Error saving preferred quality setting", t);
        }
    }

    public static String getQualityTitle(String value) {
        for (int i = 0; i < QUALITY_VALUES.length; i++) {
            if (QUALITY_VALUES[i].equalsIgnoreCase(value)) {
                return QUALITY_TITLES[i];
            }
        }
        return QUALITY_TITLES[0];
    }

    public static String getQualitySubtitle(String value) {
        for (int i = 0; i < QUALITY_VALUES.length; i++) {
            if (QUALITY_VALUES[i].equalsIgnoreCase(value)) {
                return QUALITY_SUBTITLES[i];
            }
        }
        return QUALITY_SUBTITLES[0];
    }

    /**
     * Intercepts player quality selection in xsna.ilg0.c(OneVideoPlayer, int).
     * If originalQuality <= 0 (i.e. -2 or -4 representing auto / initial startup),
     * it resolves and applies the best matching track resolution according to user preference.
     * If user explicitly selected a positive resolution in UI, it is preserved.
     */
    public static int getPreferredQuality(Object player, int originalQuality) {
        try {
            // Do not override explicit user selection during active playback
            if (originalQuality > 0) {
                return originalQuality;
            }

            String pref = getPreferredQualitySetting();
            if (DEFAULT_QUALITY.equals(pref) || pref == null || pref.isEmpty()) {
                return originalQuality;
            }

            int targetHeight;
            try {
                targetHeight = Integer.parseInt(pref);
            } catch (NumberFormatException e) {
                return originalQuality;
            }

            if (player == null) {
                return originalQuality;
            }

            // Retrieve available tracks: try player.i0() or fallback e0()/z()
            List<?> tracks = getPlayerTracks(player);

            if (tracks == null || tracks.isEmpty()) {
                // Video is just starting; tracks have not loaded yet.
                // Attach a listener to apply preferred quality as soon as tracks load.
                attachTrackReadyListener(player, targetHeight);
                return targetHeight;
            }

            List<Integer> availableHeights = new ArrayList<>();
            for (Object track : tracks) {
                int h = extractTrackHeight(track);
                if (h > 0 && !availableHeights.contains(h)) {
                    availableHeights.add(h);
                }
            }

            if (availableHeights.isEmpty()) {
                attachTrackReadyListener(player, targetHeight);
                return targetHeight;
            }

            // 1. Exact match available
            if (availableHeights.contains(targetHeight)) {
                Log.d(TAG, "Exact preferred quality match: " + targetHeight);
                return targetHeight;
            }

            // 2. Best available <= targetHeight
            int best = -1;
            for (int h : availableHeights) {
                if (h <= targetHeight && h > best) {
                    best = h;
                }
            }

            // 3. If target is lower than all available, pick lowest available
            if (best == -1) {
                best = Collections.min(availableHeights);
            }

            if (best > 0) {
                Log.d(TAG, "Applying preferred quality: " + best + " (target was: " + targetHeight + ")");
                return best;
            }
        } catch (Throwable t) {
            Log.e(TAG, "Error in getPreferredQuality", t);
        }
        return originalQuality;
    }

    /**
     * Intercepts OneVideoPlayerQualityExt.a(OneVideoPlayer) -> Integer.
     * Overrides the quality returned to player UI so it displays 1080p instead of "Авто"
     * when the player is initialized with the user's preferred resolution.
     */
    public static Integer getForcedQualityDisplay(Object player) {
        try {
            String pref = getPreferredQualitySetting();
            if (DEFAULT_QUALITY.equals(pref) || pref == null || pref.isEmpty()) {
                return null;
            }

            int targetHeight;
            try {
                targetHeight = Integer.parseInt(pref);
            } catch (NumberFormatException e) {
                return null;
            }

            if (player != null) {
                // If player already has an explicitly selected track, let original logic read its height
                try {
                    Method hMethod = player.getClass().getMethod("H");
                    Object track = hMethod.invoke(player);
                    if (track != null) {
                        return null;
                    }
                } catch (Throwable ignored) {}
            }

            // In Auto mode or initial startup: report user's target quality
            return Integer.valueOf(targetHeight);
        } catch (Throwable t) {
            return null;
        }
    }

    private static List<?> getPlayerTracks(Object player) {
        if (player == null) return null;
        try {
            Method i0 = player.getClass().getMethod("i0");
            Object res = i0.invoke(player);
            if (res instanceof List) {
                return (List<?>) res;
            }
        } catch (Throwable ignored) {}

        try {
            Method e0 = player.getClass().getMethod("e0");
            Object res = e0.invoke(player);
            if (res instanceof List) {
                return (List<?>) res;
            }
        } catch (Throwable ignored) {}

        return null;
    }

    public static void attachTrackReadyListener(final Object player, final int targetHeight) {
        if (player == null) return;
        try {
            final ClassLoader cl = player.getClass().getClassLoader();
            final Class<?> listenerClass = Class.forName("one.video.player.OneVideoPlayer$c", false, cl);
            final Object[] proxyRef = new Object[1];

            InvocationHandler handler = new InvocationHandler() {
                private boolean applied = false;

                @Override
                public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                    if (!applied) {
                        try {
                            List<?> tracks = getPlayerTracks(player);
                            if (tracks != null && !tracks.isEmpty()) {
                                applied = true;
                                // Unregister proxy listener
                                try {
                                    Method b0 = player.getClass().getMethod("b0", listenerClass);
                                    b0.invoke(player, proxyRef[0]);
                                } catch (Throwable ignored) {}

                                // Invoke OneVideoPlayerQualityExt.c(player, targetHeight)
                                Class<?> extClass = Class.forName("xsna.ilg0", false, cl);
                                Method cMethod = extClass.getMethod("c", player.getClass(), int.class);
                                cMethod.invoke(null, player, targetHeight);
                                Log.d(TAG, "Applied preferred quality on track load: " + targetHeight);
                            }
                        } catch (Throwable t) {
                            Log.e(TAG, "Error applying preferred quality in listener", t);
                        }
                    }

                    Class<?> ret = method.getReturnType();
                    if (ret == void.class) return null;
                    if (ret == boolean.class) return false;
                    if (ret == int.class) return 0;
                    if (ret == long.class) return 0L;
                    if (ret == float.class) return 0.0f;
                    if (ret == double.class) return 0.0;
                    return null;
                }
            };

            Object proxy = Proxy.newProxyInstance(cl, new Class<?>[] { listenerClass }, handler);
            proxyRef[0] = proxy;

            Method a0 = player.getClass().getMethod("a0", listenerClass);
            a0.invoke(player, proxy);
            Log.d(TAG, "Registered track-ready listener for preferred quality " + targetHeight);
        } catch (Throwable t) {
            Log.e(TAG, "Failed to attach track ready listener", t);
        }
    }

    public static int extractTrackHeight(Object track) {
        if (track == null) return -1;
        try {
            Field cField = null;
            Class<?> clazz = track.getClass();
            while (clazz != null && clazz != Object.class) {
                try {
                    cField = clazz.getDeclaredField("c");
                    break;
                } catch (NoSuchFieldException ignored) {
                    clazz = clazz.getSuperclass();
                }
            }

            if (cField != null) {
                cField.setAccessible(true);
                Object format = cField.get(track);
                if (format != null) {
                    // Try method b() -> FrameSize -> getHeight()
                    try {
                        Method bMethod = format.getClass().getMethod("b");
                        Object frameSize = bMethod.invoke(format);
                        if (frameSize != null) {
                            Method getHeight = frameSize.getClass().getMethod("getHeight");
                            return (Integer) getHeight.invoke(frameSize);
                        }
                    } catch (Throwable ignored) {}

                    // Try method c() -> android.util.Size -> getHeight()
                    try {
                        Method cMethod = format.getClass().getMethod("c");
                        Object size = cMethod.invoke(format);
                        if (size instanceof android.util.Size) {
                            return ((android.util.Size) size).getHeight();
                        }
                    } catch (Throwable ignored) {}

                    // Try regex from format.toString()
                    try {
                        String s = format.toString();
                        Matcher m = HEIGHT_PATTERN.matcher(s);
                        if (m.find()) {
                            return Integer.parseInt(m.group(1));
                        }
                    } catch (Throwable ignored) {}
                }
            }

            // Fallback: check track.toString()
            String ts = track.toString();
            Matcher m = HEIGHT_PATTERN.matcher(ts);
            if (m.find()) {
                return Integer.parseInt(m.group(1));
            }
        } catch (Throwable t) {
            Log.e(TAG, "Failed to extract track height from " + track, t);
        }
        return -1;
    }
}
