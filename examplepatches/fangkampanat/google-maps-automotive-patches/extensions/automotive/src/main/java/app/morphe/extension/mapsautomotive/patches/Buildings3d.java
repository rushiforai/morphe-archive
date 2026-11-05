package app.morphe.extension.mapsautomotive.patches;

import org.json.JSONException;
import org.json.JSONObject;

/**
 * 3D buildings in Maps' map layers (patch "3D buildings").
 * <p>
 * Maps for Android Automotive can draw buildings in 3D and has a "3D buildings" (or "Raised
 * buildings") row in its map layers. One flag of Google's client parameters hides that row and keeps
 * the map setup, the renderer and the layer rules flat; Google keeps it off for this app. The patch
 * passes every read of that flag through {@link #flag}: true while the feature is on, else Maps'
 * value. Maps' own layer row and preference then turn the buildings on or off.
 * <p>
 * Whether the feature is on is decided once per process, at Maps' first read, so the renderer and
 * the layer rules agree; a switch change applies after a restart.
 */
@SuppressWarnings("unused")
public final class Buildings3d {
    private static final String TAG = "MorpheBuildings3d";
    private static final int UNSET = -1;

    /** Whether this process gives Maps the flag, null before Maps' first read. */
    private static volatile Boolean on;
    /** Maps' own value at its last read (0 or 1), UNSET before Maps read it. */
    private static volatile int mapsFlag = UNSET;

    private Buildings3d() {
    }

    /** Injection point: Maps' 3D buildings flag at each of its reads. True while the feature is on, else Maps' value. */
    public static boolean flag(boolean maps) {
        int value = maps ? 1 : 0;
        if (mapsFlag != value) {
            mapsFlag = value;
            ReportLog.i(TAG, "Maps' 3D buildings flag " + maps);
        }
        Boolean feature = on;
        if (feature == null) feature = decide();
        return feature || maps;
    }

    private static synchronized boolean decide() {
        Boolean feature = on;
        if (feature == null) {
            feature = SafeMode.on(SafeMode.BUILDINGS_3D);
            on = feature;
            ReportLog.i(TAG, "3D buildings " + (feature ? "on" : "off (switched off)"));
        }
        return feature;
    }

    /** For the problem report (main process): Maps' flag and whether this process turns it on, null before Maps read it. */
    static JSONObject report() throws JSONException {
        int maps = mapsFlag;
        Boolean feature = on;
        return new JSONObject()
                .put("maps_flag", maps == UNSET ? JSONObject.NULL : maps == 1)
                .put("on", feature != null ? feature : JSONObject.NULL);
    }
}
