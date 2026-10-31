package app.morphe.extension.vkvideo.video;

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

/**
 * Applies the quality chosen in the "Video quality preference" patch option. The option value is
 * baked into the injected call as the method name suffix, because the hooked player method may not
 * have a free register to carry a string constant.
 */
public class VideoQualityHelper {

    private static final String TAG = "VideoQualityHelper";

    private static final Pattern HEIGHT_PATTERN = Pattern.compile("height:\\s*(\\d+)");

    public static int getPreferredQualityAuto(Object player, int originalQuality) {
        return getPreferredQuality(player, originalQuality, "auto");
    }

    public static int getPreferredQuality1080(Object player, int originalQuality) {
        return getPreferredQuality(player, originalQuality, "1080");
    }

    public static int getPreferredQuality720(Object player, int originalQuality) {
        return getPreferredQuality(player, originalQuality, "720");
    }

    public static int getPreferredQuality480(Object player, int originalQuality) {
        return getPreferredQuality(player, originalQuality, "480");
    }

    public static int getPreferredQuality360(Object player, int originalQuality) {
        return getPreferredQuality(player, originalQuality, "360");
    }

    public static Integer getForcedQualityDisplayAuto(Object player) {
        return getForcedQualityDisplay(player, "auto");
    }

    public static Integer getForcedQualityDisplay1080(Object player) {
        return getForcedQualityDisplay(player, "1080");
    }

    public static Integer getForcedQualityDisplay720(Object player) {
        return getForcedQualityDisplay(player, "720");
    }

    public static Integer getForcedQualityDisplay480(Object player) {
        return getForcedQualityDisplay(player, "480");
    }

    public static Integer getForcedQualityDisplay360(Object player) {
        return getForcedQualityDisplay(player, "360");
    }

    /**
     * Intercepts player quality selection in OneVideoPlayerQualityExt.
     * If originalQuality <= 0 (representing auto / initial startup),
     * it resolves and applies the best matching track resolution according to the preference.
     * If user explicitly selected a positive resolution in UI, it is preserved.
     */
    private static int getPreferredQuality(Object player, int originalQuality, String preference) {
        try {
            if (originalQuality > 0) {
                return originalQuality;
            }

            if ("auto".equalsIgnoreCase(preference)) {
                return originalQuality;
            }

            int targetHeight;
            try {
                targetHeight = Integer.parseInt(preference);
            } catch (NumberFormatException e) {
                return originalQuality;
            }

            if (player == null) {
                return originalQuality;
            }

            List<?> tracks = getPlayerTracks(player);
            if (tracks == null || tracks.isEmpty()) {
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

            Collections.sort(availableHeights);
            int chosen = availableHeights.get(0);
            for (int h : availableHeights) {
                if (h <= targetHeight) {
                    chosen = h;
                }
            }

            Log.d(TAG, "Preferred: " + targetHeight + "p, available: " + availableHeights + ", selected: " + chosen + "p");
            return chosen;
        } catch (Throwable t) {
            Log.e(TAG, "Error in getPreferredQuality", t);
            return originalQuality;
        }
    }

    private static Integer getForcedQualityDisplay(Object player, String preference) {
        try {
            if ("auto".equalsIgnoreCase(preference)) {
                return null;
            }
            return Integer.parseInt(preference);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static List<?> getPlayerTracks(Object player) {
        if (player == null) return null;
        String[] methodCandidates = { "i0", "e0", "z", "getTracks", "getAvailableTracks" };
        for (String mName : methodCandidates) {
            try {
                Method m = player.getClass().getMethod(mName);
                Object res = m.invoke(player);
                if (res instanceof List) {
                    return (List<?>) res;
                }
            } catch (Throwable ignored) {}
        }
        return null;
    }

    private static void attachTrackReadyListener(final Object player, final int targetHeight) {
        if (player == null) return;
        try {
            ClassLoader cl = player.getClass().getClassLoader();
            Class<?> listenerClass = null;

            for (Method m : player.getClass().getMethods()) {
                if (("a0".equals(m.getName()) || "addListener".equals(m.getName()))
                        && m.getParameterTypes().length == 1
                        && m.getParameterTypes()[0].isInterface()) {
                    listenerClass = m.getParameterTypes()[0];
                    break;
                }
            }

            if (listenerClass == null) {
                return;
            }

            final Object[] proxyRef = new Object[1];
            final Class<?> finalListenerClass = listenerClass;

            InvocationHandler handler = new InvocationHandler() {
                private boolean applied = false;

                @Override
                public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                    if (!applied) {
                        try {
                            List<?> tracks = getPlayerTracks(player);
                            if (tracks != null && !tracks.isEmpty()) {
                                applied = true;
                                try {
                                    Method b0 = player.getClass().getMethod("b0", finalListenerClass);
                                    b0.invoke(player, proxyRef[0]);
                                } catch (Throwable ignored) {}

                                // Find quality setter extension
                                for (Method m : player.getClass().getMethods()) {
                                    if (m.getParameterTypes().length == 1 && m.getParameterTypes()[0] == int.class) {
                                        m.invoke(player, targetHeight);
                                        break;
                                    }
                                }
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
                    try {
                        Method bMethod = format.getClass().getMethod("b");
                        Object frameSize = bMethod.invoke(format);
                        if (frameSize != null) {
                            Method getHeight = frameSize.getClass().getMethod("getHeight");
                            return (Integer) getHeight.invoke(frameSize);
                        }
                    } catch (Throwable ignored) {}

                    try {
                        Method cMethod = format.getClass().getMethod("c");
                        Object size = cMethod.invoke(format);
                        if (size instanceof android.util.Size) {
                            return ((android.util.Size) size).getHeight();
                        }
                    } catch (Throwable ignored) {}

                    try {
                        String s = format.toString();
                        Matcher m = HEIGHT_PATTERN.matcher(s);
                        if (m.find()) {
                            return Integer.parseInt(m.group(1));
                        }
                    } catch (Throwable ignored) {}
                }
            }

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
