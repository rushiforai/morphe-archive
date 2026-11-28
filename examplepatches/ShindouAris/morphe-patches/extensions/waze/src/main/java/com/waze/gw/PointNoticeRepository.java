package com.waze.gw;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.SystemClock;
import android.util.Log;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.TimeUnit;

/** Spatial lookup, conservative direction matching, HUD publication and Waze TTS. */
final class PointNoticeRepository {
    private static final String TAG = "WazeGW-PointRules";
    private static final String PREFS = "waze_hud_gw";
    private static final String PREF_TTS = "road_notice_tts";
    private static final double EARTH_RADIUS_M = 6371008.8;
    private static final long PROCESS_INTERVAL_MS = 700L;
    private static final long GLOBAL_TTS_GAP_MS = 8000L;
    private static final long NOTICE_COOLDOWN_MS = 10L * 60L * 1000L;

    private static final ScheduledExecutorService WORKER =
            Executors.newSingleThreadScheduledExecutor(new ThreadFactory() {
                @Override public Thread newThread(Runnable runnable) {
                    Thread thread = new Thread(runnable, "WazeGW-point-rules");
                    thread.setDaemon(true);
                    return thread;
                }
            });
    private static final Object PENDING_LOCK = new Object();
    private static final ArrayDeque<PositionSnapshot> samples =
            new ArrayDeque<PositionSnapshot>();
    private static final Set<String> spokenApproach = new HashSet<String>();
    private static final Map<String, Long> lastSpokenAt = new HashMap<String, Long>();
    private static final Set<String> currentEligible = new HashSet<String>();
    private static PositionSnapshot pending;
    private static boolean drainScheduled;
    private static long lastProcessedElapsed;
    private static long lastTtsElapsed;
    private static String nativeResidentialKey = "";

    private PointNoticeRepository() { }

    static final class PositionSnapshot {
        final double latitude;
        final double longitude;
        final int speedKmh;
        final int steeringDeg;
        final double accuracyM;
        final boolean mapMatched;
        final long elapsedMs;

        PositionSnapshot(double latitude, double longitude, int speedKmh,
                         int steeringDeg, double accuracyM, boolean mapMatched,
                         long elapsedMs) {
            this.latitude = latitude;
            this.longitude = longitude;
            this.speedKmh = speedKmh;
            this.steeringDeg = steeringDeg;
            this.accuracyM = accuracyM;
            this.mapMatched = mapMatched;
            this.elapsedMs = elapsedMs;
        }
    }

    static void onPosition(Context context, PositionSnapshot snapshot) {
        if (snapshot == null || context == null) return;
        final Context app = context.getApplicationContext();
        synchronized (PENDING_LOCK) {
            pending = snapshot;
            if (drainScheduled) return;
            drainScheduled = true;
        }
        WORKER.execute(new Runnable() {
            @Override public void run() { drain(app); }
        });
    }

    private static void drain(Context app) {
        for (;;) {
            PositionSnapshot snapshot;
            synchronized (PENDING_LOCK) {
                snapshot = pending;
                pending = null;
                if (snapshot == null) {
                    drainScheduled = false;
                    return;
                }
            }
            long wait = PROCESS_INTERVAL_MS - (snapshot.elapsedMs - lastProcessedElapsed);
            if (wait > 0) {
                try { Thread.sleep(Math.min(wait, PROCESS_INTERVAL_MS)); }
                catch (InterruptedException ignored) { Thread.currentThread().interrupt(); }
            }
            synchronized (PENDING_LOCK) {
                if (pending != null) snapshot = pending;
                pending = null;
            }
            lastProcessedElapsed = snapshot.elapsedMs;
            evaluate(app, snapshot);
        }
    }

    private static void evaluate(final Context app, PositionSnapshot snapshot) {
        if (!Gateway.modEnabled(app)) {
            clear();
            return;
        }
        PointNoticeDatabase database = PointNoticeClient.get(app);
        // Raw GPS still needs a trustworthy accuracy value. A map-matched coordinate has already
        // been snapped to Waze's road geometry, so a poor/mock provider accuracy must not disable
        // the point system (WSA commonly reports ~108 m even along an exact simulated route).
        boolean unusableAccuracy = snapshot.accuracyM < 0
                || (!snapshot.mapMatched && snapshot.accuracyM > 25);
        if (database == null || snapshot.speedKmh < 8 || unusableAccuracy) {
            addSample(snapshot, false);
            PointNoticeMapBridge.clear();
            clearPublishedOnly();
            return;
        }
        addSample(snapshot, true);
        Double course = stableCourse(snapshot);
        if (course == null) {
            PointNoticeMapBridge.clear();
            clearPublishedOnly();
            return;
        }
        double heading = course.doubleValue();
        if (snapshot.steeringDeg >= 0 && snapshot.steeringDeg < 360) {
            // Steering is advisory. Some mock providers and older Waze builds publish a stale
            // value; the stable course derived from several map-matched samples remains reliable.
            if (angleDifference(heading, snapshot.steeringDeg) <= 25) {
                heading = circularMean(heading, snapshot.steeringDeg);
            }
        }

        List<PointNoticeDatabase.Notice> nearby =
                database.nearby(snapshot.latitude, snapshot.longitude);
        ArrayList<Candidate> eligible = new ArrayList<Candidate>();
        HashSet<String> stillNear = new HashSet<String>();
        // Residential-area signs beside an expressway belong to the parallel local road.
        boolean onFreeway = Gateway.onFreeway();
        boolean vietnamese = Region.inVietnam();
        for (PointNoticeDatabase.Notice notice : nearby) {
            double distance = distanceM(snapshot.latitude, snapshot.longitude,
                    notice.latitude(), notice.longitude());
            if (distance <= 500) stillNear.add(notice.id);
            // Route guidance already supplies authoritative upcoming speed changes through
            // Waze's native alerter repository. WME-comment speed points are free-drive only.
            if (speedNoticeSuppressed(notice)) continue;
            if (onFreeway && (notice.type == 26 || notice.type == 27)) continue;
            // No-passing (14/15) and residential-area (26/27) signs are Vietnamese: only in Vietnam.
            if (!vietnamese && (notice.type == 14 || notice.type == 15
                    || notice.type == 26 || notice.type == 27)) continue;
            if (distance > notice.triggerDistanceM) continue;
            double toPoint = bearing(snapshot.latitude, snapshot.longitude,
                    notice.latitude(), notice.longitude());
            double sideAngle = signedAngle(heading, toPoint);
            if (sideAngle <= 0 || sideAngle > 70) continue;
            double radians = Math.toRadians(sideAngle);
            double forwardM = distance * Math.cos(radians);
            double rightM = distance * Math.sin(radians);
            double minimumRightM = snapshot.mapMatched ? 3.0
                    : Math.max(3.0, Math.min(8.0, snapshot.accuracyM * 0.25));
            if (forwardM <= 0 || rightM < minimumRightM) continue;
            eligible.add(new Candidate(notice, (int) Math.round(distance)));
        }
        spokenApproach.retainAll(stillNear);
        Collections.sort(eligible, new Comparator<Candidate>() {
            @Override public int compare(Candidate a, Candidate b) {
                if (a.meters != b.meters) return a.meters - b.meters;
                return a.notice.id.compareTo(b.notice.id);
            }
        });

        ArrayList<String> rows = new ArrayList<String>();
        currentEligible.clear();
        for (Candidate candidate : eligible) {
            // A route can start after the spatial lookup but before this snapshot is published.
            if (speedNoticeSuppressed(candidate.notice)) continue;
            currentEligible.add(candidate.notice.id);
            rows.add(row(candidate));
        }
        // Map pins mirror the WME alerts that are actually active, not every notice in range.
        PointNoticeMapBridge.update(app, database, snapshot, heading, currentEligible);
        boolean showUi = app.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                .getBoolean("upcoming_alerts", true);
        Gateway.setPointAlerts(showUi ? rows : new ArrayList<String>());
        syncResidentialNative(app, showUi ? nearestResidential(eligible) : null);

        Candidate voice = null;
        for (Candidate candidate : eligible) {
            if (speedNoticeSuppressed(candidate.notice)) continue;
            if (voiceText(candidate.notice) == null || spokenApproach.contains(candidate.notice.id)) {
                continue;
            }
            Long previous = lastSpokenAt.get(candidate.notice.id);
            if (previous != null
                    && System.currentTimeMillis() - previous.longValue() < NOTICE_COOLDOWN_MS) continue;
            if (voice == null || priority(candidate.notice) > priority(voice.notice)
                    || (priority(candidate.notice) == priority(voice.notice)
                    && candidate.meters < voice.meters)) {
                voice = candidate;
            }
        }
        if (voice != null && snapshot.elapsedMs - lastTtsElapsed >= GLOBAL_TTS_GAP_MS) {
            maybeSpeak(app, voice);
        }
    }

    private static void addSample(PositionSnapshot snapshot, boolean valid) {
        if (!valid || (!samples.isEmpty()
                && snapshot.elapsedMs - samples.peekLast().elapsedMs > 5000)) {
            samples.clear();
        }
        if (valid) {
            samples.addLast(snapshot);
            while (samples.size() > 5) samples.removeFirst();
        }
    }

    private static Double stableCourse(PositionSnapshot current) {
        if (samples.size() < 3) return null;
        PositionSnapshot first = samples.peekFirst();
        double span = distanceM(first.latitude, first.longitude,
                current.latitude, current.longitude);
        if (span < 12) return null;
        double whole = bearing(first.latitude, first.longitude,
                current.latitude, current.longitude);
        PositionSnapshot middle = null;
        int index = 0;
        for (PositionSnapshot sample : samples) {
            if (index++ == samples.size() / 2) {
                middle = sample;
                break;
            }
        }
        if (middle == null) return null;
        double tail = bearing(middle.latitude, middle.longitude,
                current.latitude, current.longitude);
        return angleDifference(whole, tail) <= 15 ? Double.valueOf(whole) : null;
    }

    private static String row(Candidate candidate) {
        PointNoticeDatabase.Notice notice = candidate.notice;
        String icon = rawIcon(notice);
        return icon + "\t" + label(notice) + "\t" + formatDistance(candidate.meters)
                + "\t" + candidate.meters + "\t" + icon + "\twme:" + notice.type;
    }

    private static String rawIcon(PointNoticeDatabase.Notice notice) {
        if ((notice.type == 12 || notice.type == 13) && notice.hasValueKmh) {
            return "speeddrop_" + notice.valueKmh;
        }
        return "wme_" + notice.type;
    }

    private static String label(PointNoticeDatabase.Notice notice) {
        switch (notice.type) {
            case 1: return I18n.tr("point.no_straight_ahead_or_right_turn");
            case 2: return I18n.tr("point.no_left_turn_or_u_turn");
            case 3: return I18n.tr("point.no_straight_ahead_or_left_turn");
            case 4: return I18n.tr("point.no_left_or_right_turn");
            case 5: return I18n.tr("point.cars_no_left_turn_or_u");
            case 6: return I18n.tr("point.cars_no_right_turn_or_u");
            case 7: return I18n.tr("point.no_right_turn_or_u_turn");
            case 8: return I18n.tr("point.no_left_turn");
            case 9: return I18n.tr("point.no_right_turn");
            case 10: return I18n.tr("point.no_straight_ahead");
            case 11: return I18n.tr("point.no_u_turn");
            case 12: return I18n.f("point.end_of_speed_limit_0", notice.valueKmh);
            case 13: return I18n.f("point.speed_limit_0", notice.valueKmh);
            case 14: return I18n.tr("point.no_overtaking");
            case 15: return I18n.tr("point.end_of_no_overtaking");
            case 16: return I18n.tr("point.cars_no_left_turn");
            case 17: return I18n.tr("point.cars_no_right_turn");
            case 18: return I18n.tr("point.cars_no_u_turn");
            case 19: return I18n.tr("point.no_cars");
            case 20: return I18n.tr("point.no_motorcycles");
            case 21: return I18n.tr("point.straight_ahead");
            case 22: return I18n.tr("point.turn_right");
            case 23: return I18n.tr("point.turn_left");
            case 24: return I18n.tr("point.car_lane");
            case 25: return I18n.tr("point.motorcycle_lane");
            case 26: return I18n.tr("point.built_up_area_starts");
            case 27: return I18n.tr("point.built_up_area_ends");
            case 32: return I18n.tr("point.road_closed_to_traffic");
            case 33: return I18n.tr("point.one_way_road");
            case 35: return I18n.tr("point.end_of_all_restrictions");
            default: return I18n.tr("point.sign_ahead");
        }
    }

    /** Spoken line as a Vietnamese template ({0} = km/h): the key WazeTtsBridge translates for the selected voice. */
    private static String voiceText(PointNoticeDatabase.Notice notice) {
        switch (notice.type) {
            case 12:
                return notice.hasValueKmh ? "point.end_of_speed_limit_0_ahead" : null;
            case 13:
                return notice.hasValueKmh ? "core.speed_limit_ahead_0_kilometers_per" : null;
            case 14: return "point.no_overtaking_ahead";
            case 15: return "point.end_of_no_overtaking_ahead";
            case 24: return "point.car_lane_ahead";
            case 25: return "point.motorcycle_lane_ahead";
            case 26: return "point.built_up_area_starts_ahead";
            case 27: return "point.built_up_area_ends_ahead";
            case 33: return "point.one_way_road_ahead";
            case 35: return "point.end_of_all_restrictions_ahead";
            default: return null;
        }
    }

    private static int priority(PointNoticeDatabase.Notice notice) {
        return notice.type == 12 || notice.type == 13
                || notice.type == 26 || notice.type == 27 ? 100 : 50;
    }

    private static void maybeSpeak(final Context app, final Candidate candidate) {
        SharedPreferences preferences = app.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        if (!preferences.getBoolean(PREF_TTS, true)) return;
        if (speedNoticeSuppressed(candidate.notice)) return;
        final String text = voiceText(candidate.notice);
        if (text == null) return;
        if (speak(candidate.notice, text)) {
            markSpoken(candidate.notice.id);
            return;
        }
        WORKER.schedule(new Runnable() {
            @Override public void run() {
                if (!currentEligible.contains(candidate.notice.id)
                        || spokenApproach.contains(candidate.notice.id)
                        || !Gateway.modEnabled(app)
                        || !app.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                        .getBoolean(PREF_TTS, true)) return;
                if (speedNoticeSuppressed(candidate.notice)) return;
                if (speak(candidate.notice, text)) markSpoken(candidate.notice.id);
            }
        }, 1L, TimeUnit.SECONDS);
    }

    private static boolean isSpeedNotice(PointNoticeDatabase.Notice notice) {
        return notice.type == 12 || notice.type == 13;
    }

    /**
     * Waze raises speed-limit-decrease alerts itself while roaming (SegmentNative roaming SLD patch), so the WME-comment
     * speed points are off in free drive unless the "wme_speed_points" switch is on. With a route they are always off.
     */
    private static boolean speedNoticeSuppressed(PointNoticeDatabase.Notice notice) {
        return isSpeedNotice(notice) && (Gateway.hudNavigating || !Gateway.pref("wme_speed_points", false));
    }

    private static Candidate nearestResidential(List<Candidate> eligible) {
        for (Candidate candidate : eligible) {
            if (candidate.notice.type == 26 || candidate.notice.type == 27) return candidate;
        }
        return null;
    }

    private static void syncResidentialNative(Context app, Candidate candidate) {
        if (candidate == null) {
            if (!nativeResidentialKey.isEmpty()) {
                CustomNativeAlerts.dismiss(nativeResidentialKey);
                nativeResidentialKey = "";
            }
            return;
        }
        PointNoticeDatabase.Notice notice = candidate.notice;
        String key = "residential:" + notice.id;
        if (!nativeResidentialKey.isEmpty() && !nativeResidentialKey.equals(key)) {
            CustomNativeAlerts.dismiss(nativeResidentialKey);
            nativeResidentialKey = "";
        }
        String title = notice.type == 27
                ? I18n.tr("point.built_up_area_ends") : I18n.tr("point.built_up_area");
        String icon = notice.type == 27
                ? "mod_report_icon_residential_area_end"
                : "mod_report_icon_residential_area_start";
        if (CustomNativeAlerts.showPositioned(app, key, title, icon,
                (int) Math.round(notice.latitude() * 1000000.0),
                (int) Math.round(notice.longitude() * 1000000.0),
                candidate.meters, notice.triggerDistanceM)) {
            nativeResidentialKey = key;
        }
    }

    /** Prefer the packaged voice clip where one exists; keep TTS for dynamic/non-asset text. */
    private static boolean speak(PointNoticeDatabase.Notice notice, String text) {
        if (notice.type == 13 && notice.hasValueKmh
                && Gateway.playNextSpeedAsset(notice.valueKmh)) return true;
        return WazeTtsBridge.speak(text, notice.valueKmh);
    }

    private static void markSpoken(String id) {
        spokenApproach.add(id);
        lastSpokenAt.put(id, System.currentTimeMillis());
        lastTtsElapsed = SystemClock.elapsedRealtime();
        Log.i(TAG, "TTS point=" + id);
    }

    static void onTripReset() {
        WORKER.execute(new Runnable() {
            @Override public void run() {
                spokenApproach.clear();
                currentEligible.clear();
            }
        });
    }

    private static void clearPublishedOnly() {
        currentEligible.clear();
        Gateway.setPointAlerts(new ArrayList<String>());
        syncResidentialNative(null, null);
    }

    private static void clear() {
        samples.clear();
        clearPublishedOnly();
        PointNoticeMapBridge.clear();
    }

    private static String formatDistance(int meters) {
        String imperial = Units.imperialDistance(meters, false);
        if (imperial != null) return imperial;
        if (meters < 1000) return meters + " m";
        return String.format(Locale.US, "%.1f km", meters / 1000f);
    }

    private static double circularMean(double left, double right) {
        double x = Math.sin(Math.toRadians(left)) + Math.sin(Math.toRadians(right));
        double y = Math.cos(Math.toRadians(left)) + Math.cos(Math.toRadians(right));
        return normalize(Math.toDegrees(Math.atan2(x, y)));
    }

    private static double angleDifference(double left, double right) {
        double difference = Math.abs(normalize(left) - normalize(right));
        return Math.min(difference, 360.0 - difference);
    }

    /** Clockwise angle from heading to target in the range [-180, 180]. */
    private static double signedAngle(double heading, double target) {
        double difference = normalize(target) - normalize(heading);
        if (difference > 180.0) difference -= 360.0;
        if (difference <= -180.0) difference += 360.0;
        return difference;
    }

    private static double normalize(double degrees) {
        double result = degrees % 360.0;
        return result < 0 ? result + 360.0 : result;
    }

    private static double bearing(double lat1, double lon1, double lat2, double lon2) {
        double phi1 = Math.toRadians(lat1);
        double phi2 = Math.toRadians(lat2);
        double lambda = Math.toRadians(lon2 - lon1);
        double y = Math.sin(lambda) * Math.cos(phi2);
        double x = Math.cos(phi1) * Math.sin(phi2)
                - Math.sin(phi1) * Math.cos(phi2) * Math.cos(lambda);
        return normalize(Math.toDegrees(Math.atan2(y, x)));
    }

    private static double distanceM(double lat1, double lon1, double lat2, double lon2) {
        double dLat = Math.toRadians(lat2 - lat1);
        double dLon = Math.toRadians(lon2 - lon1);
        double a = Math.sin(dLat / 2) * Math.sin(dLat / 2)
                + Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2))
                * Math.sin(dLon / 2) * Math.sin(dLon / 2);
        return 2 * EARTH_RADIUS_M * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    }

    private static final class Candidate {
        final PointNoticeDatabase.Notice notice;
        final int meters;
        Candidate(PointNoticeDatabase.Notice notice, int meters) {
            this.notice = notice;
            this.meters = meters;
        }
    }
}
