package org.ungoogled.car;

import android.os.Bundle;
import android.os.Parcelable;

/** What the overlay shows of a Waze Mod Data API snapshot (the keys of its Bundle). */
final class WazeData {
    /** km/h; -1 when unknown. */
    final int speed;
    /** km/h; 0 when none. */
    final int limit;
    final boolean overspeed;
    /** In an average speed zone. */
    final boolean averageZone;
    /** The nearest alert ahead, or null. */
    final Alert alert;

    static final class Alert {
        final int type;
        final int distance;   // meters
        final int value;      // the new limit of a speed limit alert (type 8); 0 otherwise
        final int severity;   // of a traffic jam (type 6), 1 to 5; 0 otherwise

        Alert(int type, int distance, int value, int severity) {
            this.type = type;
            this.distance = distance;
            this.value = value;
            this.severity = severity;
        }
    }

    private WazeData(int speed, int limit, boolean overspeed, boolean averageZone, Alert alert) {
        this.averageZone = averageZone;
        this.speed = speed;
        this.limit = limit;
        this.overspeed = overspeed;
        this.alert = alert;
    }

    /** No Waze Mod data: the overlay then draws only what other sources (xADAS) give. */
    static final WazeData NONE = new WazeData(-1, 0, false, false, null);

    static WazeData from(Bundle snapshot) {
        int speed = snapshot.containsKey("speed") ? Math.max(0, snapshot.getInt("speed")) : -1;
        Alert nearest = null;
        Parcelable[] alerts = snapshot.getParcelableArray("alerts");
        if (alerts != null) {
            for (Parcelable item : alerts) {
                if (!(item instanceof Bundle)) continue;
                Bundle alert = (Bundle) item;
                int type = alert.getInt("type", 0);
                int distance = alert.getInt("distance_m", -1);
                if (type <= 0 || distance < 0) continue;
                if (nearest == null || distance < nearest.distance) {
                    nearest = new Alert(type, distance, alert.getInt("value", 0), alert.getInt("jam_severity", 0));
                }
            }
        }
        return new WazeData(speed, snapshot.getInt("speed_limit", 0), snapshot.getBoolean("overspeed", false),
                snapshot.getBoolean("avg_zone", false), nearest);
    }
}
