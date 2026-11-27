package org.ungoogled.ui;

/**
 * Speeding chime, as Waze has: a short chime the moment the speed passes the speed limit by the
 * chosen margin. Maps itself only turns its speedometer red, at 5 mph / 10 km/h over. The patch
 * reports every change of the navigation speedometer's speed or speed limit here; after a chime it
 * stays quiet until the speed is back down to the limit, and for 20 seconds at least.
 */
public final class SpeedAlerts {
    private SpeedAlerts() {}

    /** When it chimes: never, past the limit, when the speedometer turns red, 10 mph / 20 km/h over. */
    public static final int OFF = 0, AT_LIMIT = 1, RED = 2, FAR = 3;

    /** Over the margin since the last chime. */
    private static boolean over;
    private static long chimedAt;

    /** Rewritten by the patch: the speedometer's speed, in its own units; -1 when unknown. */
    static int speed(Object speedometer) { return -1; }

    /** Rewritten by the patch: the speed limit, in the same units; -1 when there is none. */
    static int limit(Object speedometer) { return -1; }

    /** Rewritten by the patch: whether those units are km/h. */
    static boolean kmh(Object speedometer) { return false; }

    /** From the navigation speedometer, each time its speed or speed limit changes. */
    public static void onSpeedometer(Object speedometer) {
        int mode = Shapes.SPEEDING_CHIME;
        if (mode == OFF || speedometer == null) {
            over = false;
            return;
        }
        try {
            int speed = speed(speedometer), limit = limit(speedometer);
            if (speed < 0 || limit <= 0) {
                over = false;
                return;
            }
            boolean kmh = kmh(speedometer);
            long now = android.os.SystemClock.elapsedRealtime();
            if (!over && speed >= limit + margin(mode, kmh) && now - chimedAt >= 20000L) {
                over = true;
                chimedAt = now;
                android.util.Log.i("UA", "speeding chime: " + speed + " in a " + limit + (kmh ? " km/h" : " mph") + " limit");
                Chime.speeding();
            } else if (over && speed <= limit) {
                over = false;
            }
        } catch (Throwable t) {
            android.util.Log.w("UA", "speeding chime", t);
        }
    }

    /** How far over the limit [mode] chimes, in the speedometer's units. */
    static int margin(int mode, boolean kmh) {
        switch (mode) {
            case AT_LIMIT: return 1;
            case FAR: return kmh ? 20 : 10;
            default: return kmh ? 10 : 5;   // RED: where Maps turns the speedometer red
        }
    }
}
