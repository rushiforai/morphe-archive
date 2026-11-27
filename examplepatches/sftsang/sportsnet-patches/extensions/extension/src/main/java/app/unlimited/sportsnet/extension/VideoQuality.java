package app.unlimited.sportsnet.extension;

import java.lang.reflect.Constructor;

/**
 * Builds the Sportsnet+ player's bitrate preferences, which the app leaves unset, from the
 * values the patch was given: "max,min,start" in kbps, where -1 means no preference.
 */
@SuppressWarnings("unused")
public final class VideoQuality {
    private static final String PREFERENCES_CLASS =
            "com.deltatre.divacorelib.domain.shared.BitratePreferences";

    private static Object preferences;
    private static boolean built;

    private VideoQuality() {
    }

    /** Called in place of the player configuration's bitrate preferences. */
    public static synchronized Object bitratePreferences(String values) {
        if (built) return preferences;
        built = true;
        try {
            String[] parts = values.split(",");
            Integer max = preference(parts[0]);
            Integer min = preference(parts[1]);
            Integer start = preference(parts[2]);
            Constructor<?> constructor = Class.forName(PREFERENCES_CLASS).getConstructor(
                    Integer.class, Integer.class, Integer.class, Boolean.class);
            preferences = constructor.newInstance(max, min, start, Boolean.FALSE);
            Logger.info("Video quality: max " + max + ", min " + min + ", start " + start + " kbps");
        } catch (Exception e) {
            Logger.error("Could not set the video quality", e);
        }
        return preferences;
    }

    private static Integer preference(String value) {
        int kbps = Integer.parseInt(value.trim());
        return kbps < 0 ? null : kbps;
    }
}
