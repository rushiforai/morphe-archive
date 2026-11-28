package com.waze.gw;

import android.content.Context;
import android.os.SystemClock;
import android.util.Log;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * "Traffic light ahead" warning from Waze's own native traffic-light insights
 * (SegmentNative.nearbyTrafficLights). A light record belongs to the line that approaches the
 * intersection, so a light on the car's map-matched line and in front of the car is the one it
 * is driving towards. Runs on Waze's native position-callback thread.
 */
final class TrafficLightAlerts {
    private static final String TAG = "WazeGW-TL";
    private static final String PREFS = "waze_hud_gw";
    static final String PREF_VOICE = "traffic_light_voice";
    static final String ICON = "traffic_signal";

    private static final long QUERY_INTERVAL_MS = 2_500L;
    private static final int QUERY_RADIUS_M = 400;
    private static final int MIN_AHEAD_M = 12;
    private static final int FALLBACK_MAX_M = 250;
    private static final int STRAIGHT_MAX_M = 200;
    private static final int VOICE_MAX_M = 200;
    private static final long VOICE_COOLDOWN_MS = 120_000L;

    private static final long VOICE_DEBOUNCE_MS = 12_000L;

    private static long lastQueryMs;
    private static long lastSpokenMs;
    private static int prevLatE6, prevLonE6;
    private static boolean hasPrev;
    private static String shownKey = "";
    private static final Map<String, Long> announced = new HashMap<String, Long>();

    private TrafficLightAlerts() {}

    static void onPosition(Context context, int latE6, int lonE6, int speedKmh, int steering) {
        if (context == null || !Gateway.modEnabled(context) || (latE6 == 0 && lonE6 == 0)) {
            clear();
            return;
        }
        long now = SystemClock.elapsedRealtime();
        if (now - lastQueryMs < QUERY_INTERVAL_MS) return;
        // Waiting at a red light keeps the current warning; nothing to recompute while stopped.
        if (speedKmh < 5) return;
        lastQueryMs = now;
        // Controlled-access roads have no signals for the car to stop at; lights seen from them belong to
        // the crossing streets below and would only produce false warnings.
        if (Gateway.onFreeway()) {
            publish(null, 0);
            return;
        }

        double heading = steering >= 0 && steering < 360 ? steering : Double.NaN;
        if (Double.isNaN(heading) && hasPrev
                && distanceM(prevLatE6, prevLonE6, latE6, lonE6) >= 8) {
            heading = bearing(prevLatE6, prevLonE6, latE6, lonE6);
        }
        prevLatE6 = latE6;
        prevLonE6 = lonE6;
        hasPrev = true;
        if (Double.isNaN(heading)) return;

        long[] r = SegmentNative.nearbyTrafficLights(latE6, lonE6, QUERY_RADIUS_M);
        if (r == null || r[1] == 1) return;   // unavailable: keep whatever is shown
        long carTile = r[4], carLine = r[5];
        boolean lineKnown = carTile >= 0 && carLine >= 0;

        int bestMeters = Integer.MAX_VALUE;
        String bestKey = null;
        for (int i = 0; i < r[2]; i++) {
            int o = 6 + i * 5;
            int lat = (int) r[o + 2], lon = (int) r[o + 3];
            int meters = (int) Math.round(distanceM(latE6, lonE6, lat, lon));
            if (meters < MIN_AHEAD_M) continue;
            double offset = Math.abs(angleDiff(heading, bearing(latE6, lonE6, lat, lon)));
            // The light record sits on the short last line before the stop bar, so a line match
            // alone warns late; a light almost straight ahead counts too (earlier warning).
            boolean onCarLine = lineKnown && r[o] == carTile && r[o + 4] == carLine
                    && offset <= 70;
            boolean straightAhead = offset <= (lineKnown ? 20 : 25)
                    && meters <= (lineKnown ? STRAIGHT_MAX_M : FALLBACK_MAX_M);
            boolean ahead = onCarLine || straightAhead;
            if (!ahead || meters >= bestMeters) continue;
            bestMeters = meters;
            bestKey = lat + "," + lon;   // one intersection = one position shared by its approaches
        }

        if (bestKey == null) {
            publish(null, 0);
            return;
        }
        publish(bestKey, bestMeters);
        maybeSpeak(context, bestKey, bestMeters, now);
    }

    private static void maybeSpeak(Context context, String key, int meters, long now) {
        if (meters > VOICE_MAX_M) return;
        if (!context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                .getBoolean(PREF_VOICE, true)) return;
        for (Iterator<Map.Entry<String, Long>> it = announced.entrySet().iterator(); it.hasNext();) {
            if (now - it.next().getValue() > VOICE_COOLDOWN_MS) it.remove();
        }
        if (announced.containsKey(key)) return;
        // Dense intersections are only a few seconds apart; don't chain announcements.
        if (lastSpokenMs != 0 && now - lastSpokenMs < VOICE_DEBOUNCE_MS) return;
        announced.put(key, now);
        lastSpokenMs = now;
        boolean spoken = WazeTtsBridge.speak("tts.watch_out_for_the_traffic_light");
        Log.i(TAG, "traffic light ahead " + meters + "m at " + key + " voice=" + spoken);
    }

    private static void publish(String key, int meters) {
        if (key == null) {
            if (shownKey.length() == 0) return;
            shownKey = "";
            Gateway.setTrafficLightAlerts(null);
            return;
        }
        shownKey = key;
        List<String> rows = new ArrayList<String>(1);
        rows.add(ICON + "\t" + I18n.tr("road.traffic_light") + "\t" + formatDistance(meters) + "\t" + meters
                + "\t" + ICON + "\ttl:" + key);
        Gateway.setTrafficLightAlerts(rows);
    }

    static void clear() {
        hasPrev = false;
        if (shownKey.length() == 0) return;
        shownKey = "";
        Gateway.setTrafficLightAlerts(null);
    }

    private static String formatDistance(int meters) {
        String imperial = Units.imperialDistance(meters, false);
        if (imperial != null) return imperial;
        if (meters >= 1000) return String.format(java.util.Locale.US, "%.1f km", meters / 1000.0);
        return (Math.round(meters / 10.0) * 10) + " m";
    }

    private static double distanceM(int lat1, int lon1, int lat2, int lon2) {
        double p1 = Math.toRadians(lat1 / 1e6), p2 = Math.toRadians(lat2 / 1e6);
        double dp = p2 - p1, dl = Math.toRadians((lon2 - lon1) / 1e6);
        double a = Math.sin(dp / 2) * Math.sin(dp / 2)
                + Math.cos(p1) * Math.cos(p2) * Math.sin(dl / 2) * Math.sin(dl / 2);
        return 2 * 6371008.8 * Math.asin(Math.min(1, Math.sqrt(a)));
    }

    private static double bearing(int lat1, int lon1, int lat2, int lon2) {
        double p1 = Math.toRadians(lat1 / 1e6), p2 = Math.toRadians(lat2 / 1e6);
        double dl = Math.toRadians((lon2 - lon1) / 1e6);
        double y = Math.sin(dl) * Math.cos(p2);
        double x = Math.cos(p1) * Math.sin(p2) - Math.sin(p1) * Math.cos(p2) * Math.cos(dl);
        return (Math.toDegrees(Math.atan2(y, x)) + 360) % 360;
    }

    private static double angleDiff(double a, double b) {
        double d = (b - a + 540) % 360 - 180;
        return d;
    }
}
