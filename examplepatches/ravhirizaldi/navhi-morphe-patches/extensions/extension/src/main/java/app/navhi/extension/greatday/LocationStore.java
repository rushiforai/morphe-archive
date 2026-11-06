package app.navhi.extension.greatday;

import android.content.Context;
import android.location.Location;
import android.os.Environment;
import android.os.SystemClock;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

/**
 * Coordinate store behind the manual location override.
 *
 * <p>The pinned point lives in {@code fakeloc.txt} in the app's external files
 * directory as {@code lat,lng}. A missing file, an empty file or the content
 * {@code off} all mean "no override, use the real provider".
 */
@SuppressWarnings("unused")
public final class LocationStore {
    private static final String FILE_NAME = "fakeloc.txt";

    private LocationStore() {
    }

    private static File fileFor(Context context) {
        File dir = context.getExternalFilesDir(null);
        if (dir == null) {
            dir = Environment.getExternalStorageDirectory();
        }
        return new File(dir, FILE_NAME);
    }

    private static String read(Context context) {
        File file = fileFor(context);
        if (!file.exists()) {
            return null;
        }
        try (FileInputStream in = new FileInputStream(file)) {
            byte[] buffer = new byte[128];
            int length = in.read(buffer);
            if (length <= 0) {
                return null;
            }
            return new String(buffer, 0, length);
        } catch (Exception e) {
            return null;
        }
    }

    /** The pinned {@code {lat, lng}}, or {@code null} when the override is off. */
    public static double[] get(Context context) {
        String raw = read(context);
        if (raw == null) {
            return null;
        }
        raw = raw.trim();
        if (raw.isEmpty() || raw.equalsIgnoreCase("off")) {
            return null;
        }
        String[] parts = raw.split(",");
        if (parts.length < 2) {
            return null;
        }
        try {
            return new double[]{
                    Double.parseDouble(parts[0].trim()),
                    Double.parseDouble(parts[1].trim()),
            };
        } catch (Exception e) {
            return null;
        }
    }

    /** A synthetic fix carrying the pinned coordinates, or {@code null} when off. */
    public static Location fakeLocation(Context context) {
        double[] pinned = get(context);
        return pinned == null ? null : makeLocation(pinned);
    }

    private static Location makeLocation(double[] pinned) {
        Location location = new Location("gps");
        location.setLatitude(pinned[0]);
        location.setLongitude(pinned[1]);
        location.setTime(System.currentTimeMillis());
        location.setElapsedRealtimeNanos(SystemClock.elapsedRealtimeNanos());
        location.setAccuracy(5.0f);
        return location;
    }

    public static void save(Context context, double latitude, double longitude) {
        try {
            File file = fileFor(context);
            File parent = file.getParentFile();
            if (parent != null) {
                parent.mkdirs();
            }
            try (FileOutputStream out = new FileOutputStream(file)) {
                out.write((latitude + "," + longitude).getBytes());
                out.flush();
            }
        } catch (Exception ignored) {
        }
    }

    public static void clear(Context context) {
        try {
            fileFor(context).delete();
        } catch (Exception ignored) {
        }
    }

    /** The pinned point as JSON for the web layer: {@code {"enabled":...}}. */
    public static String locJson(Context context) {
        double[] pinned = get(context);
        if (pinned == null) {
            return "{\"enabled\":false}";
        }
        return "{\"enabled\":true,\"lat\":" + pinned[0] + ",\"lng\":" + pinned[1] + "}";
    }
}
