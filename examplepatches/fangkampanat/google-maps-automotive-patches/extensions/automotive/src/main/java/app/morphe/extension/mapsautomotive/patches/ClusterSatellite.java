package app.morphe.extension.mapsautomotive.patches;

import org.json.JSONException;
import org.json.JSONObject;

/**
 * Satellite on the cluster map (core patch, switch "cluster_satellite").
 * <p>
 * The cluster map (the map Maps draws for the instrument cluster) uses the same map layers as the main map, but its
 * map controller adds "satellite off" on top whenever its "satellite allowed" value is false, which it is for the
 * cluster. The patch passes that value through {@link #allowed}: true while the switch is on, so the saved satellite
 * choice applies on the cluster map too; Maps' value when the switch is off. The main map has the value true already.
 * <p>
 * The switch is read once per process, at Maps' first read; a switch change applies after a restart.
 */
@SuppressWarnings("unused")
public final class ClusterSatellite {
    private static final String TAG = "MorpheClusterSatellite";
    private static final int UNSET = -1;

    /** Whether this process allows satellite on every map, null before Maps' first read. */
    private static volatile Boolean on;
    /** Maps' own value at its last read (0 or 1), UNSET before Maps read it. */
    private static volatile int mapsAllowed = UNSET;
    /** Maps' reads that said "not allowed". */
    private static volatile int notAllowedReads;

    private ClusterSatellite() {
    }

    /** Injection point: Maps' "satellite allowed" value where a map controller builds its layer overrides. */
    public static boolean allowed(boolean maps) {
        try {
            int value = maps ? 1 : 0;
            if (!maps) notAllowedReads++;
            Boolean feature = on;
            if (feature == null) feature = decide();
            if (mapsAllowed != value) {
                mapsAllowed = value;
                ReportLog.i(TAG, "Maps' satellite allowed " + maps + (maps || !feature ? "" : ", allowed (cluster_satellite on)"));
            }
            return feature || maps;
        } catch (Throwable error) {
            return maps;
        }
    }

    private static synchronized boolean decide() {
        Boolean feature = on;
        if (feature == null) {
            feature = SafeMode.on(SafeMode.CLUSTER_SATELLITE);
            on = feature;
            ReportLog.i(TAG, "Satellite on the cluster map " + (feature ? "on" : "off (switched off)"));
        }
        return feature;
    }

    /** For the problem report (main process): Maps' value at its last read, its "not allowed" reads and the switch. */
    static JSONObject report() throws JSONException {
        int maps = mapsAllowed;
        Boolean feature = on;
        return new JSONObject()
                .put("maps_allowed", maps == UNSET ? JSONObject.NULL : maps == 1)
                .put("not_allowed_reads", notAllowedReads)
                .put("on", feature != null ? feature : JSONObject.NULL);
    }
}
