package app.unlimited.sportsnet.extension;

import java.lang.reflect.Field;
import java.util.Map;

/**
 * Sportsnet+ saves how far you got only when you pause or close a video, so the place is lost if
 * the app is closed from the recents screen, killed in the background or crashes. This also saves
 * it after you seek and at a fixed interval while you watch.
 */
@SuppressWarnings("unused")
public final class WatchProgress {

    private static final String CURRENT_TIME = "video_current_time";
    private static final String SEEK = "video_seek";
    private static final String OPEN = "video_open";
    private static final String START = "video_start";

    private static Field typeField;
    private static Field argumentsField;
    private static long lastSave;

    private WatchProgress() {
    }

    /**
     * Whether to save the place now, for a player analytics event the app would otherwise only
     * save on pause, close or error.
     */
    public static boolean shouldSave(Object event, int intervalSeconds) {
        try {
            if (typeField == null) {
                typeField = event.getClass().getField("type");
                argumentsField = event.getClass().getField("eventArguments");
            }
            Object arguments = argumentsField.get(event);
            if (!(arguments instanceof Map)) return false;
            Object position = ((Map<?, ?>) arguments).get(CURRENT_TIME);
            Object type = typeField.get(event);
            long now = System.currentTimeMillis();
            // A video reports 0 s, or the place it resumes from, as it opens and starts. Saving then
            // could replace your place with the start, so wait a full interval from there.
            if (OPEN.equals(type) || START.equals(type)) {
                lastSave = now;
                return false;
            }
            if (!(position instanceof Long) || (Long) position <= 0) return false;
            if (SEEK.equals(type) || now - lastSave >= intervalSeconds * 1000L) {
                lastSave = now;
                Logger.info("Saving watch position at " + position + " s ("
                        + type + ")");
                return true;
            }
        } catch (Exception e) {
            Logger.error("Could not check the watch position", e);
        }
        return false;
    }
}
