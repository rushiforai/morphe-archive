package semicoloncolonel.mobilestream.extension.hbomax;

import android.os.SystemClock;
import android.util.Log;

import java.lang.reflect.Method;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Picks the video rendition HBO Max plays, by resolution.
 *
 * Every track selection in HBO Max's player (Media3's adaptive selection and
 * Discovery's BOLA and hybrid selections) extends Media3's BaseTrackSelection,
 * whose getFormat(int), length(), and isTrackExcluded(int, long) keep their
 * names. The patch keeps each original getSelectedIndex() as
 * getSelectedIndex$msp() and makes getSelectedIndex() return {@link #index}.
 *
 * The rendition chosen is the one at the target height with the highest
 * bitrate. When the title has none at that height, it is the highest rendition
 * below it, and when every rendition is above it, the lowest one. Renditions
 * the player excluded after a load error are skipped. Audio and text
 * selections are left to the app's own choice.
 */
public final class HboQuality {
    private static final String TAG = "MspHboQuality";

    // Media3 Format.toString(): "Format(id, label, container, sample, codecs,
    // bitrate, language, [width, height, frameRate, colorInfo], [channels, rate])".
    private static final Pattern SIZE = Pattern.compile(", \\[(-?\\d+), (-?\\d+), ");
    private static final Pattern BITRATE = Pattern.compile("^Format\\((?:[^,]*, ){5}(-?\\d+), ");

    private static Method getFormat;
    private static Method length;
    private static Method isTrackExcluded;
    private static boolean failed;
    private static int lastHeight = -1;
    private static final java.util.Map<Class<?>, Method> ORIGINAL = new java.util.concurrent.ConcurrentHashMap<>();

    private HboQuality() {
    }

    /** Overwritten by the patch with the chosen height: "480", "720", "1080", or "2160". */
    public static String targetHeight() {
        return "2160";
    }

    /** The index getSelectedIndex() returns. */
    public static int index(Object selection) {
        int target;
        try {
            target = Integer.parseInt(targetHeight());
        } catch (NumberFormatException e) {
            target = 2160;
        }
        int chosen = choose(selection, target);
        return chosen >= 0 ? chosen : original(selection);
    }

    private static int original(Object selection) {
        try {
            Class<?> type = selection.getClass();
            Method method = ORIGINAL.get(type);
            if (method == null) {
                for (Class<?> c = type; c != null && method == null; c = c.getSuperclass()) {
                    method = find(c, "getSelectedIndex$msp");
                }
                if (method == null) {
                    return 0;
                }
                ORIGINAL.put(type, method);
            }
            return (Integer) method.invoke(selection);
        } catch (Throwable t) {
            Log.w(TAG, "Could not read the app's own choice", t);
            return 0;
        }
    }

    /** The index to play for a target height, or -1 to keep the app's choice. */
    private static int choose(Object selection, int targetHeight) {
        if (failed || selection == null) {
            return -1;
        }
        try {
            if (getFormat == null) {
                Class<?> base = selection.getClass();
                while (base != null && find(base, "isTrackExcluded", int.class, long.class) == null) {
                    base = base.getSuperclass();
                }
                if (base == null) {
                    failed = true;
                    return -1;
                }
                getFormat = find(base, "getFormat", int.class);
                length = find(base, "length");
                isTrackExcluded = find(base, "isTrackExcluded", int.class, long.class);
                if (getFormat == null || length == null) {
                    failed = true;
                    return -1;
                }
            }
            int count = (Integer) length.invoke(selection);
            long now = SystemClock.elapsedRealtime();
            int exact = -1, exactBitrate = -1;
            int below = -1, belowHeight = -1, belowBitrate = -1;
            int lowest = -1, lowestHeight = Integer.MAX_VALUE;
            for (int i = 0; i < count; i++) {
                if ((Boolean) isTrackExcluded.invoke(selection, i, now)) {
                    continue;
                }
                String format = String.valueOf(getFormat.invoke(selection, i));
                Matcher size = SIZE.matcher(format);
                if (!size.find()) {
                    return -1;
                }
                int height = Integer.parseInt(size.group(2));
                if (height <= 0) {
                    // Not a video track.
                    return -1;
                }
                Matcher rate = BITRATE.matcher(format);
                int bitrate = rate.find() ? Integer.parseInt(rate.group(1)) : 0;
                if (height == targetHeight) {
                    if (bitrate > exactBitrate) {
                        exact = i;
                        exactBitrate = bitrate;
                    }
                } else if (height < targetHeight) {
                    if (height > belowHeight || (height == belowHeight && bitrate > belowBitrate)) {
                        below = i;
                        belowHeight = height;
                        belowBitrate = bitrate;
                    }
                }
                if (height < lowestHeight) {
                    lowest = i;
                    lowestHeight = height;
                }
            }
            int chosen = exact != -1 ? exact : below != -1 ? below : lowest;
            if (chosen != -1) {
                Matcher size = SIZE.matcher(String.valueOf(getFormat.invoke(selection, chosen)));
                int height = size.find() ? Integer.parseInt(size.group(2)) : -1;
                if (height != lastHeight) {
                    lastHeight = height;
                    Log.i(TAG, "Playing " + height + "p (target " + targetHeight + "p, " + count + " renditions)");
                }
            }
            return chosen;
        } catch (Throwable t) {
            failed = true;
            Log.w(TAG, "Video quality selection is off", t);
            return -1;
        }
    }

    /**
     * The display size the player's track selector uses as its viewport.
     * Renditions larger than the viewport are passed over, and the Android TV
     * app reads its 1920x1080 interface size on a 4K Shield. For 2160 it is at
     * least 3840x2160.
     */
    public static android.graphics.Point viewport(android.graphics.Point size) {
        int target;
        try {
            target = Integer.parseInt(targetHeight());
        } catch (NumberFormatException e) {
            return size;
        }
        if (target < 2160 || size == null) {
            return size;
        }
        boolean portrait = size.y > size.x;
        int longSide = Math.max(3840, Math.max(size.x, size.y));
        int shortSide = Math.max(2160, Math.min(size.x, size.y));
        return portrait ? new android.graphics.Point(shortSide, longSide) : new android.graphics.Point(longSide, shortSide);
    }

    private static Method find(Class<?> type, String name, Class<?>... parameters) {
        try {
            Method method = type.getDeclaredMethod(name, parameters);
            method.setAccessible(true);
            return method;
        } catch (NoSuchMethodException e) {
            return null;
        }
    }
}
