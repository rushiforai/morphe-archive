package app.template.extension.aare;

/**
 * The tunnel estimate's maths and decisions, with no Android in it so it can be unit-tested
 * (TunnelMathTest). TunnelNavigation feeds it the car's data and pushes the result.
 */
final class TunnelMath {
    /** Past this distance without GPS an estimate is too far off to help: it stops. */
    static final double MAX_DISTANCE_M = 5000;
    /** Past this much driving (not standing) without GPS it stops too. */
    static final long MAX_MOVING_MS = 5 * 60_000;
    /**
     * Honest accuracy: the error grows by about 6 % of the distance driven without GPS (heading a
     * few degrees off, speed a few percent), on top of the last fix's own accuracy.
     */
    static final double ERROR_PER_M = 0.06;
    /** A compass that hasn't moved for this long is frozen (cars that derive it from their GPS). */
    static final long COMPASS_FROZEN_MS = 2500;

    private static final double EARTH_RADIUS_M = 6_371_000.0;

    private TunnelMath() {
    }

    /** What to do with a fix the car sends. */
    enum FixAction {
        /** A real fix: record it, and drop any estimate. */
        USE,
        /** A repeat of the last fix while driving, before any estimate: let it through, don't record it. */
        PASS,
        /** A repeat while estimating, moving or standing (a queue in the tunnel): keep the estimate. */
        DROP,
    }

    /**
     * [sameSpot]: the fix is where the last one was. While estimating, such a fix is always the
     * car's stale one: standing in a queue in the tunnel it used to reset the estimate back to the
     * tunnel's entrance.
     */
    static FixAction fixAction(boolean sameSpot, boolean moving, boolean estimating) {
        if (!sameSpot) return FixAction.USE;
        if (estimating) return FixAction.DROP;
        return moving ? FixAction.PASS : FixAction.USE;
    }

    static boolean withinLimits(double travelledM, long movingMs) {
        return travelledM <= MAX_DISTANCE_M && movingMs <= MAX_MOVING_MS;
    }

    /** The accuracy of an estimate [travelledM] metres from a fix of accuracy [start]. */
    static float accuracy(float start, double travelledM) {
        return (float) (Math.max(start, 3f) + ERROR_PER_M * travelledM);
    }

    /** The heading after [dtS] seconds turning at [yawRadS], the gyroscope's sign learned as [sign]. */
    static double turn(double bearingDeg, double yawRadS, double sign, double dtS) {
        return normalize(bearingDeg + sign * Math.toDegrees(yawRadS) * dtS);
    }

    /** {latitude, longitude} [meters] from (lat, lon) towards [bearingDeg] on a sphere. */
    static double[] destination(double lat, double lon, double bearingDeg, double meters) {
        double lat1 = Math.toRadians(lat);
        double lon1 = Math.toRadians(lon);
        double b = Math.toRadians(bearingDeg);
        double d = meters / EARTH_RADIUS_M;
        double lat2 = Math.asin(Math.sin(lat1) * Math.cos(d) + Math.cos(lat1) * Math.sin(d) * Math.cos(b));
        double lon2 = lon1 + Math.atan2(Math.sin(b) * Math.sin(d) * Math.cos(lat1), Math.cos(d) - Math.sin(lat1) * Math.sin(lat2));
        return new double[] {Math.toDegrees(lat2), Math.toDegrees(lon2)};
    }

    /** -180..180 */
    static double wrap(double deg) {
        double d = deg % 360;
        if (d > 180) d -= 360;
        if (d < -180) d += 360;
        return d;
    }

    /** 0..360 */
    static double normalize(double deg) {
        double d = deg % 360;
        return d < 0 ? d + 360 : d;
    }

    /** Tells a live compass from one frozen on the tunnel's entrance heading. */
    static final class CompassWatch {
        private Float last;
        private long changedAt;

        /** The compass reading if it is live, null if it hasn't moved for COMPASS_FROZEN_MS. */
        Float update(float bearingDeg, long nowMs) {
            Float prev = last;
            last = bearingDeg;
            if (prev == null || Math.abs(wrap(bearingDeg - prev)) >= 0.01) changedAt = nowMs;
            return nowMs - changedAt > COMPASS_FROZEN_MS ? null : bearingDeg;
        }
    }
}
