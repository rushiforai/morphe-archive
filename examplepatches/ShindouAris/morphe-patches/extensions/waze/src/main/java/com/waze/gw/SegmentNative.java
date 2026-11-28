package com.waze.gw;

import android.util.Log;

/** Version-guarded bridge to Waze's current map-matched native segment. */
final class SegmentNative {
    private static final String TAG = "WazeGW";
    private static final boolean LOADED;

    static {
        boolean loaded = false;
        try {
            System.loadLibrary("wazegw");
            loaded = true;
        } catch (Throwable t) {
            Log.w(TAG, "native segment bridge unavailable: " + t.getClass().getSimpleName());
        }
        LOADED = loaded;
    }

    private SegmentNative() {}

    static long currentServerSegmentId() {
        if (!LOADED) return -1L;
        try {
            return getCurrentServerSegmentId();
        } catch (Throwable t) {
            return -1L;
        }
    }

    /** @return 1 for tunnel, 0 for a known non-tunnel segment, -1 when unavailable. */
    static int currentTunnelState() {
        if (!LOADED) return -1;
        try {
            return getCurrentTunnelState();
        } catch (Throwable t) {
            return -1;
        }
    }

    /**
     * Configures Waze's native speed-limit-decrease filter once for this process.
     * @return 1 when configured, 0 when libwaze is not loaded yet, -1 for an unsupported build.
     */
    static int configureSpeedDropFilter(boolean alwaysRead) {
        if (!LOADED) return -1;
        try {
            return configureSpeedDropFilterNative(alwaysRead);
        } catch (Throwable t) {
            Log.w(TAG, "native speed-drop filter unavailable: "
                    + t.getClass().getSimpleName());
            return -1;
        }
    }

    private static boolean trafficLightsDisabled;

    /**
     * Waze's native traffic lights around the car (loaded tiles only).
     * Layout: [schema=2, status, count, seen, carTile, carLine, then per light:
     * tile, id, latE6, lonE6, line]; status 0 ok, 1 unavailable, 2 truncated. Null on failure.
     */
    static long[] nearbyTrafficLights(int latitudeE6, int longitudeE6, int radiusM) {
        if (!LOADED || trafficLightsDisabled) return null;
        try {
            long[] r = nearbyTrafficLightsNative(latitudeE6, longitudeE6, radiusM);
            return r != null && r.length >= 6 && r[0] == 2 ? r : null;
        } catch (Throwable t) {
            trafficLightsDisabled = true;
            Log.w(TAG, "native traffic lights disabled: " + t.getClass().getSimpleName());
            return null;
        }
    }

    private static boolean roadTypeDisabled;

    /**
     * Native road type of the map-matched line (probe). Layout: [result, reason, tile, line, raw,
     * override, ready, totalLines, extCount]; result 1 = freeway, 4 = ramp, 7 = street, -1 unavailable.
     */
    static long[] currentRoadType() {
        if (!LOADED || roadTypeDisabled) return null;
        try {
            long[] r = currentRoadTypeNative();
            return r != null && r.length >= 9 ? r : null;
        } catch (Throwable t) {
            roadTypeDisabled = true;
            Log.w(TAG, "native road type disabled: " + t.getClass().getSimpleName());
            return null;
        }
    }

    private static native long[] currentRoadTypeNative();
    private static native long[] nearbyTrafficLightsNative(int latE6, int lonE6, int radiusM);
    private static native long getCurrentServerSegmentId();
    private static native int getCurrentTunnelState();
    private static native int configureSpeedDropFilterNative(boolean alwaysRead);
}
