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

/**
 * Direction-aware runtime for GPS anchored records embedded in road_notices.pb.
 *
 * Segment rules remain authoritative for restrictions which belong to an entire road segment.
 * This repository is deliberately limited to physical points (expressway exits/rest stops),
 * whose approach direction is resolved by the editor/server before publication.
 */
final class RoadPointNoticeRepository {
    private static final String TAG = "WazeGW-RoadPoints";
    private static final String PREFS = "waze_hud_gw";
    private static final String PREF_TTS = "road_notice_tts";
    private static final double EARTH_RADIUS_M = 6371008.8;
    private static final long PROCESS_INTERVAL_MS = 700L;
    private static final long GLOBAL_TTS_GAP_MS = 8000L;

    private static final ScheduledExecutorService WORKER =
            Executors.newSingleThreadScheduledExecutor(new ThreadFactory() {
                @Override public Thread newThread(Runnable runnable) {
                    Thread thread = new Thread(runnable, "WazeGW-road-points");
                    thread.setDaemon(true);
                    return thread;
                }
            });
    private static final Object PENDING_LOCK = new Object();
    private static final ArrayDeque<PointNoticeRepository.PositionSnapshot> samples =
            new ArrayDeque<PointNoticeRepository.PositionSnapshot>();
    private static final Set<String> spokenApproach = new HashSet<String>();
    private static final Set<String> currentEligible = new HashSet<String>();
    private static final Map<String, Long> lastSpokenAt = new HashMap<String, Long>();
    private static final Map<String, Integer> tripRepeats = new HashMap<String, Integer>();

    private static PointNoticeRepository.PositionSnapshot pending;
    private static boolean drainScheduled;
    private static long lastProcessedElapsed;
    private static long lastTtsElapsed;

    private RoadPointNoticeRepository() { }

    static void onPosition(Context context, PointNoticeRepository.PositionSnapshot snapshot) {
        if (context == null || snapshot == null) return;
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
            PointNoticeRepository.PositionSnapshot snapshot;
            synchronized (PENDING_LOCK) {
                snapshot = pending;
                pending = null;
                if (snapshot == null) {
                    drainScheduled = false;
                    return;
                }
            }
            long wait = PROCESS_INTERVAL_MS - (snapshot.elapsedMs - lastProcessedElapsed);
            if (wait > 0L) {
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

    private static void evaluate(final Context app,
                                 PointNoticeRepository.PositionSnapshot snapshot) {
        if (!Gateway.modEnabled(app)) {
            clear();
            return;
        }
        RoadNoticeDatabase database = RoadNoticeClient.get(app);
        boolean unusableAccuracy = snapshot.accuracyM < 0
                || (!snapshot.mapMatched && snapshot.accuracyM > 25);
        if (database == null || database.pointOffsets.length == 0
                || snapshot.speedKmh < 8 || unusableAccuracy) {
            addSample(snapshot, false);
            clearPublishedOnly();
            return;
        }

        addSample(snapshot, true);
        Double course = stableCourse(snapshot);
        if (course == null) {
            clearPublishedOnly();
            return;
        }
        double heading = course.doubleValue();
        if (snapshot.steeringDeg >= 0 && snapshot.steeringDeg < 360
                && angleDifference(heading, snapshot.steeringDeg) <= 25.0) {
            heading = circularMean(heading, snapshot.steeringDeg);
        }

        long nowMs = System.currentTimeMillis();
        List<RoadNoticeDatabase.PointRecord> nearby =
                database.nearbyPoints(snapshot.latitude, snapshot.longitude);
        ArrayList<Candidate> eligible = new ArrayList<Candidate>();
        HashSet<String> stillNear = new HashSet<String>();
        for (RoadNoticeDatabase.PointRecord point : nearby) {
            RoadNoticeDatabase.Notice notice = point.notice;
            double distance = distanceM(snapshot.latitude, snapshot.longitude,
                    point.latitude(), point.longitude());
            if (distance <= 500.0) stillNear.add(notice.noticeId);
            if (!supported(notice) || !active(notice, nowMs)) continue;
            if (point.routeOnly && !Gateway.hudNavigating) continue;
            if (distance > point.triggerDistanceM) continue;
            boolean segmentKnown = Gateway.hudRoadSegmentId > 0L;
            boolean segmentMatched = point.hasApproachSegment(Gateway.hudRoadSegmentId);
            if (point.approachSegmentIds.length > 0 && segmentKnown && !segmentMatched) continue;
            // Segment identity is authoritative on divided highways. Bearing is only the
            // fail-closed fallback for builds/devices which cannot publish a server segment id.
            if (!segmentMatched && (point.approachBearingCdeg < 0
                    || angleDifference(heading, point.approachBearing()) > 35.0)) continue;
            double toPoint = bearing(snapshot.latitude, snapshot.longitude,
                    point.latitude(), point.longitude());
            if (angleDifference(heading, toPoint) > 70.0) continue;
            eligible.add(new Candidate(point, (int) Math.round(distance)));
        }
        spokenApproach.retainAll(stillNear);
        Collections.sort(eligible, new Comparator<Candidate>() {
            @Override public int compare(Candidate left, Candidate right) {
                if (left.point.notice.priority != right.point.notice.priority) {
                    return right.point.notice.priority - left.point.notice.priority;
                }
                if (left.meters != right.meters) return left.meters - right.meters;
                return left.point.notice.noticeId.compareTo(right.point.notice.noticeId);
            }
        });

        currentEligible.clear();
        ArrayList<String> rows = new ArrayList<String>();
        for (Candidate candidate : eligible) {
            currentEligible.add(candidate.point.notice.noticeId);
            rows.add(row(candidate));
        }
        boolean showUi = app.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                .getBoolean("upcoming_alerts", true);
        Gateway.setRoadPointAlerts(showUi ? rows : new ArrayList<String>());

        Candidate voice = null;
        for (Candidate candidate : eligible) {
            RoadNoticeDatabase.Notice notice = candidate.point.notice;
            if (RoadRulesRepository.voiceText(notice) == null
                    || spokenApproach.contains(notice.noticeId)
                    || !maySpeak(notice, nowMs)) continue;
            voice = candidate;
            break;
        }
        if (voice != null && snapshot.elapsedMs - lastTtsElapsed >= GLOBAL_TTS_GAP_MS) {
            maybeSpeak(app, voice);
        }
    }

    private static boolean supported(RoadNoticeDatabase.Notice notice) {
        return notice != null && (notice.type == RoadNoticeDatabase.TYPE_REST_STOP
                || notice.type == RoadNoticeDatabase.TYPE_EXPRESSWAY_REST_STOP
                || notice.type == RoadNoticeDatabase.TYPE_EXPRESSWAY_EXIT);
    }

    private static boolean active(RoadNoticeDatabase.Notice notice, long nowMs) {
        if (!notice.enabled) return false;
        if (notice.hasValidFrom && nowMs < notice.validFromMs) return false;
        if (notice.hasValidUntil && nowMs >= notice.validUntilMs) return false;
        return RoadRulesRepository.scheduleActive(notice.schedule, nowMs);
    }

    private static void addSample(PointNoticeRepository.PositionSnapshot snapshot,
                                  boolean valid) {
        if (!valid || (!samples.isEmpty()
                && snapshot.elapsedMs - samples.peekLast().elapsedMs > 5000L)) {
            samples.clear();
        }
        if (valid) {
            samples.addLast(snapshot);
            while (samples.size() > 5) samples.removeFirst();
        }
    }

    private static Double stableCourse(PointNoticeRepository.PositionSnapshot current) {
        if (samples.size() < 3) return null;
        PointNoticeRepository.PositionSnapshot first = samples.peekFirst();
        double span = distanceM(first.latitude, first.longitude,
                current.latitude, current.longitude);
        if (span < 12.0) return null;
        double whole = bearing(first.latitude, first.longitude,
                current.latitude, current.longitude);
        PointNoticeRepository.PositionSnapshot middle = null;
        int index = 0;
        for (PointNoticeRepository.PositionSnapshot sample : samples) {
            if (index++ == samples.size() / 2) {
                middle = sample;
                break;
            }
        }
        if (middle == null) return null;
        double tail = bearing(middle.latitude, middle.longitude,
                current.latitude, current.longitude);
        return angleDifference(whole, tail) <= 15.0 ? Double.valueOf(whole) : null;
    }

    private static String row(Candidate candidate) {
        String icon = rawIcon(candidate.point.notice);
        String semantic = candidate.point.notice.type == RoadNoticeDatabase.TYPE_EXPRESSWAY_EXIT
                ? "roadpoint:exit"
                : candidate.point.notice.type == RoadNoticeDatabase.TYPE_EXPRESSWAY_REST_STOP
                ? "roadpoint:expressway_rest" : "roadpoint:rest";
        return icon + "\t" + label(candidate.point.notice) + "\t"
                + formatDistance(candidate.meters) + "\t" + candidate.meters
                + "\t" + icon + "\t" + semantic;
    }

    private static String rawIcon(RoadNoticeDatabase.Notice notice) {
        if (notice.type == RoadNoticeDatabase.TYPE_EXPRESSWAY_EXIT) {
            return "roadpoint_exit";
        }
        if (notice.type == RoadNoticeDatabase.TYPE_EXPRESSWAY_REST_STOP) {
            return "roadpoint_expressway_rest";
        }
        return "roadpoint_rest";
    }

    private static String label(RoadNoticeDatabase.Notice notice) {
        String title = notice.title == null ? "" : notice.title.trim();
        if (!title.isEmpty()) return title;
        if (notice.type == RoadNoticeDatabase.TYPE_EXPRESSWAY_EXIT) {
            return I18n.tr("road.expressway_exit");
        }
        if (notice.type == RoadNoticeDatabase.TYPE_EXPRESSWAY_REST_STOP) {
            return I18n.tr("road.expressway_rest_area");
        }
        return I18n.tr("road.rest_area");
    }

    private static void maybeSpeak(final Context app, final Candidate candidate) {
        SharedPreferences preferences = app.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        if (!preferences.getBoolean(PREF_TTS, true)) return;
        final RoadNoticeDatabase.Notice notice = candidate.point.notice;
        final String text = RoadRulesRepository.voiceText(notice);
        if (text == null) return;
        if (WazeTtsBridge.speak(text, RoadRulesRepository.voiceArgs(notice))) {
            markSpoken(notice, System.currentTimeMillis());
            return;
        }
        WORKER.schedule(new Runnable() {
            @Override public void run() {
                if (!currentEligible.contains(notice.noticeId)
                        || spokenApproach.contains(notice.noticeId)
                        || !Gateway.modEnabled(app)
                        || !app.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                        .getBoolean(PREF_TTS, true)) return;
                long now = System.currentTimeMillis();
                if (maySpeak(notice, now)
                        && WazeTtsBridge.speak(text, RoadRulesRepository.voiceArgs(notice))) {
                    markSpoken(notice, now);
                }
            }
        }, 1L, TimeUnit.SECONDS);
    }

    private static boolean maySpeak(RoadNoticeDatabase.Notice notice, long nowMs) {
        Integer repeats = tripRepeats.get(notice.noticeId);
        if (notice.maxRepeatsPerTrip > 0 && repeats != null
                && repeats.intValue() >= notice.maxRepeatsPerTrip) return false;
        Long previous = lastSpokenAt.get(notice.noticeId);
        long cooldown = Math.max(0L, (long) notice.cooldownSeconds) * 1000L;
        return cooldown == 0L || previous == null || nowMs - previous.longValue() >= cooldown;
    }

    private static void markSpoken(RoadNoticeDatabase.Notice notice, long nowMs) {
        String id = notice.noticeId;
        spokenApproach.add(id);
        lastSpokenAt.put(id, Long.valueOf(nowMs));
        Integer repeats = tripRepeats.get(id);
        tripRepeats.put(id, Integer.valueOf(repeats == null ? 1 : repeats.intValue() + 1));
        lastTtsElapsed = SystemClock.elapsedRealtime();
        Log.i(TAG, "TTS point=" + id);
    }

    static void onTripReset() {
        WORKER.execute(new Runnable() {
            @Override public void run() {
                spokenApproach.clear();
                currentEligible.clear();
                tripRepeats.clear();
            }
        });
    }

    private static void clearPublishedOnly() {
        currentEligible.clear();
        Gateway.setRoadPointAlerts(new ArrayList<String>());
    }

    private static void clear() {
        samples.clear();
        clearPublishedOnly();
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

    private static double normalize(double degrees) {
        double result = degrees % 360.0;
        return result < 0.0 ? result + 360.0 : result;
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
        double a = Math.sin(dLat / 2.0) * Math.sin(dLat / 2.0)
                + Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2))
                * Math.sin(dLon / 2.0) * Math.sin(dLon / 2.0);
        return 2.0 * EARTH_RADIUS_M * Math.atan2(Math.sqrt(a), Math.sqrt(1.0 - a));
    }

    private static final class Candidate {
        final RoadNoticeDatabase.PointRecord point;
        final int meters;

        Candidate(RoadNoticeDatabase.PointRecord point, int meters) {
            this.point = point;
            this.meters = meters;
        }
    }
}
