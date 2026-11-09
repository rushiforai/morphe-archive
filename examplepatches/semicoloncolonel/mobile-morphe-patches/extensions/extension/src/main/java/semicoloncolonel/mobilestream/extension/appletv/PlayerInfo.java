package semicoloncolonel.mobilestream.extension.appletv;

import android.util.Log;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

/**
 * "Hide player overlays" and "Disable up next" for the Apple TV phone app.
 *
 * Each stream carries its title's details as HLS session data, which the
 * player reads into one object: the rating card's image and advisory lines
 * (shown for a few seconds when a title starts), product placement notices,
 * and photosensitivity and high-motion warnings. decorate() runs at the end
 * of that object's constructor.
 *
 * - Hide player overlays: the chosen overlays' details are cleared, so the
 *   player has nothing to show.
 * - Disable up next: the time the credits start (upNextStart), when the
 *   player shrinks the video into a corner and shows the next episode or a
 *   recommendation, is cleared, and so is the post-play data built from it
 *   (see postPlay).
 */
@SuppressWarnings("unused")
public final class PlayerInfo {
    private static final String TAG = "MSP-ATV-INFO";
    private static volatile Map<String, String> fieldNames;

    private PlayerInfo() {
    }

    // Overwritten by the patches.
    public static boolean hideRatingCard() {
        return false;
    }

    public static boolean hideProductPlacement() {
        return false;
    }

    public static boolean hideHealthWarnings() {
        return false;
    }

    public static boolean disableUpNext() {
        return false;
    }

    /** "label=field;label=field;..." from the details class's toString. */
    public static String fields() {
        return "";
    }

    private static Map<String, String> names() {
        Map<String, String> names = fieldNames;
        if (names == null) {
            names = new HashMap<>();
            for (String pair : fields().split(";")) {
                int eq = pair.indexOf('=');
                if (eq > 0) names.put(pair.substring(0, eq), pair.substring(eq + 1));
            }
            fieldNames = names;
        }
        return names;
    }

    private static Field field(Object details, String label) throws Exception {
        String name = names().get(label);
        if (name == null) return null;
        Field field = details.getClass().getDeclaredField(name);
        field.setAccessible(true);
        return field;
    }

    private static Object get(Object details, String label) throws Exception {
        Field field = field(details, label);
        return field == null ? null : field.get(details);
    }

    private static void clear(Object details, String... labels) throws Exception {
        for (String label : labels) {
            Field field = field(details, label);
            if (field != null && !field.getType().isPrimitive()) field.set(details, null);
        }
    }

    /**
     * Disable up next: the player's post-play data (upNextStart and
     * featureDuration). Without upNextStart the player falls back to 20
     * seconds before the end of the feature, so both are cleared, and the
     * player has no time at which to start the up next screen.
     */
    public static void postPlay(Object data) {
        if (!disableUpNext()) return;
        try {
            for (Field field : data.getClass().getDeclaredFields()) {
                if (field.getType() == Double.class && !java.lang.reflect.Modifier.isStatic(field.getModifiers())) {
                    field.setAccessible(true);
                    field.set(data, null);
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "could not change post-play data", t);
        }
    }

    public static void decorate(Object details) {
        try {
            if (hideRatingCard()) {
                clear(details, "advisoryInfo", "ratingImage");
                Field display = field(details, "displayRatingsOverlay");
                if (display != null && display.getType() == Boolean.class) display.set(details, Boolean.FALSE);
            }
            if (hideProductPlacement()) {
                clear(details, "productPlacementInfoDuration", "productPlacementInfoImage", "productPlacementInfoText");
            }
            if (disableUpNext()) {
                clear(details, "upNextStart");
            }
            if (hideHealthWarnings()) {
                clear(details, "photosensitivityInfoText", "photosensitivityInfoImage", "photosensitivityInfoDuration",
                        "highMotionInfoText", "highMotionInfoImage", "highMotionInfoDuration");
            }
        } catch (Throwable t) {
            Log.w(TAG, "could not change player details", t);
        }
    }
}
