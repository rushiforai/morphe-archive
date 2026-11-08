package semicoloncolonel.mobilestream.extension.tubi;

import android.util.Log;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Orders a title's or live channel's versions from the highest resolution
 * down, so Tubi plays the best one the server offers.
 *
 * Tubi's server lists several versions per title (for example 1080p H.265
 * beside 720p H.264), and the app plays the first one the phone can use. The
 * sort is stable: versions with the same resolution keep the server's order,
 * which already puts DRM and H.265 versions first.
 */
@SuppressWarnings("unused")
public final class TubiQuality {
    private static final String TAG = "MSP-TUBI-QUALITY";
    private static final Pattern HEIGHT = Pattern.compile("(\\d{3,4})P");

    private TubiQuality() {
    }

    /** Called with the list each getVideoResources() is about to return. */
    public static List<Object> sorted(List<Object> resources) {
        try {
            if (resources == null || resources.size() < 2) return resources;
            List<Object> copy = new ArrayList<>(resources);
            Collections.sort(copy, (a, b) -> Integer.compare(height(b), height(a)));
            return copy;
        } catch (Throwable t) {
            Log.w(TAG, "could not sort versions", t);
            return resources;
        }
    }

    private static int height(Object resource) {
        try {
            Method getter = resource.getClass().getMethod("getResolution");
            Object value = getter.invoke(resource);
            if (value == null) return 0;
            Matcher m = HEIGHT.matcher(value.toString().toUpperCase());
            return m.find() ? Integer.parseInt(m.group(1)) : 0;
        } catch (Throwable t) {
            return 0;
        }
    }
}
