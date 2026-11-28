package com.waze.gw;

/**
 * Resolves the minimum legal speed shown by the mod.
 *
 * The automatic rule is intentionally independent of Android/UI code so it can be shared by the
 * floating speedometer, HUD and bubble through Gateway.minimumSpeedLimit. A future backend may
 * publish a segment-specific value; that value wins when it is available, otherwise the automatic
 * rule remains the safe fallback.
 */
public final class MinimumSpeedPolicy {
    /** No minimum-speed sign should be shown. */
    public static final int NONE = -1;
    private static final int BACKEND_NOT_LOADED = Integer.MIN_VALUE;

    /** Immutable publication prevents a torn read between segmentId and minimumSpeed. */
    private static final class BackendSnapshot {
        final long segmentId;
        final int minimumSpeed;

        BackendSnapshot(long segmentId, int minimumSpeed) {
            this.segmentId = segmentId;
            this.minimumSpeed = minimumSpeed;
        }
    }

    private static volatile BackendSnapshot backend =
            new BackendSnapshot(-1L, BACKEND_NOT_LOADED);

    private MinimumSpeedPolicy() { }

    /**
     * Local motorway rule, in km/h:
     * 120+ -> 80; 80..119 -> 60; below 80 (or unknown) -> no minimum.
     */
    public static int inferFromMaximum(int maximumSpeed) {
        // Vietnam Do not have speed over 120
        // Fixed, now 60 doesn't display 80 anymore
        if (maximumSpeed == 120) return 80;
        if (maximumSpeed >= 80) return 60;
        return NONE;
    }

    /**
     * Backend data has priority only when it belongs to the current real server segment. Automatic
     * For 80/90 km/h, inference is restricted to a segment positively classified as a freeway;
     * HIGHWAY also includes national roads and must not receive a minimum-speed sign. A 120 km/h
     * maximum is itself accepted as high-confidence motorway evidence so a transient street/segment
     * metadata change while rerouting cannot make the 80 km/h minimum sign disappear — unless the
     * native tile road type is known (roadTypeKnown), since editors do set 120+ on non-freeways.
     */
    public static int resolve(int maximumSpeed, long segmentId, boolean confirmedFreeway,
                              boolean roadTypeKnown) {
        BackendSnapshot snapshot = backend;
        if (segmentId > 0 && snapshot.segmentId == segmentId) {
            int value = snapshot.minimumSpeed;
            if (value == NONE) return NONE; // backend explicitly says this segment has no minimum
            if (value > 0 && (maximumSpeed <= 0 || value <= maximumSpeed)) return value;
        }
        return (confirmedFreeway || (!roadTypeKnown && maximumSpeed >= 120))
                ? inferFromMaximum(maximumSpeed)
                : NONE;
    }

    /**
     * Publishes an async backend response atomically.
     * minimumSpeed == null: backend has no usable data, keep automatic inference.
     * minimumSpeed <= 0: backend explicitly disables the minimum for this segment.
     */
    public static void publishBackendMinimumSpeed(long segmentId, Integer minimumSpeed) {
        if (segmentId <= 0) return;
        int value = minimumSpeed == null
                ? BACKEND_NOT_LOADED
                : (minimumSpeed.intValue() > 0 ? minimumSpeed.intValue() : NONE);
        backend = new BackendSnapshot(segmentId, value);
    }

    /** Clears backend state, useful after logout/service reconfiguration. */
    public static void clearBackendState() {
        backend = new BackendSnapshot(-1L, BACKEND_NOT_LOADED);
    }
}
