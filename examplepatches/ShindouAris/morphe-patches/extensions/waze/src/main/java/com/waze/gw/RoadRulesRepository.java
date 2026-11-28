package com.waze.gw;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.TimeUnit;

/** Local segment lookup, rule publication and enter-segment voice policy. */
public final class RoadRulesRepository {
    private static final String TAG = "WazeGW-Rules";
    private static final String MOD_PREFS = "waze_hud_gw";
    private static final String PREF_TTS = "road_notice_tts";
    private static final TimeZone VIETNAM = TimeZone.getTimeZone("Asia/Ho_Chi_Minh");

    private static final ScheduledExecutorService WORKER =
            Executors.newSingleThreadScheduledExecutor(new ThreadFactory() {
                @Override public Thread newThread(Runnable runnable) {
                    Thread thread = new Thread(runnable, "WazeGW-road-rules");
                    thread.setDaemon(true);
                    return thread;
                }
            });

    /** Accessed on WORKER except for the volatile current identity/generation. */
    private static final Map<String, Integer> tripRepeats = new HashMap<String, Integer>();
    private static final Map<String, Long> lastSpokenAt = new HashMap<String, Long>();
    private static volatile long currentSegmentId = -1L;
    private static volatile long segmentGeneration;

    private RoadRulesRepository() { }

    /** Immutable snapshot: no worker reads Gateway's changing node and route fields. */
    public static final class SegmentSnapshot {
        public final long segmentId;
        public final long nodePair;
        public final int routeIndex;
        public final int tileId;
        public final int clientId;
        public final String streetName;
        public final String source;

        public SegmentSnapshot(long segmentId, long nodePair, int routeIndex, int tileId,
                               int clientId, String streetName, String source) {
            this.segmentId = segmentId;
            this.nodePair = nodePair;
            this.routeIndex = routeIndex;
            this.tileId = tileId;
            this.clientId = clientId;
            this.streetName = streetName == null ? "" : streetName;
            this.source = source == null ? "" : source;
        }

        public long fromNodeId() { return nodePair > 0 ? nodePair >>> 32 : -1L; }
        public long toNodeId() { return nodePair > 0 ? nodePair & 0xFFFFFFFFL : -1L; }
    }

    static void onSegmentChanged(Context context, final SegmentSnapshot segment) {
        if (segment == null || segment.segmentId <= 0) return;
        currentSegmentId = segment.segmentId;
        final long generation = ++segmentGeneration;

        // Do not retain a previous road's restriction while the local lookup is queued.
        Gateway.parkingRestriction = 0;
        MinimumSpeedPolicy.publishBackendMinimumSpeed(segment.segmentId, null);

        final Context app = context == null ? null : context.getApplicationContext();
        WORKER.execute(new Runnable() {
            @Override public void run() {
                if (!stillCurrent(segment.segmentId, generation)) return;
                RoadNoticeDatabase data = RoadNoticeClient.get(app);
                RoadNoticeDatabase.SegmentRecord record = data == null
                        ? null : data.find(segment.segmentId);
                Evaluation evaluation = evaluate(record, segment, System.currentTimeMillis());
                applyIfCurrent(segment.segmentId, generation, evaluation);
                maybeSpeak(app, segment.segmentId, generation, evaluation.voice);
                Log.i(TAG, "segment=" + segment.segmentId + " dataset="
                        + (data == null ? "none" : Long.toString(data.datasetVersion))
                        + " notices=" + (record == null ? 0 : record.notices.size()));
            }
        });
    }

    static void onSegmentCleared(long previousSegmentId) {
        currentSegmentId = -1L;
        ++segmentGeneration;
        Gateway.parkingRestriction = 0;
        MinimumSpeedPolicy.clearBackendState();
        Log.i(TAG, "segment cleared previous=" + previousSegmentId);
    }

    /** A new route/cleared route starts a fresh repeat budget. Free-drive keeps app-lifetime state. */
    static void onTripReset() {
        RoadPointNoticeRepository.onTripReset();
        WORKER.execute(new Runnable() {
            @Override public void run() {
                tripRepeats.clear();
                Log.i(TAG, "road notice trip counters reset");
            }
        });
    }

    private static Evaluation evaluate(RoadNoticeDatabase.SegmentRecord record,
                                       SegmentSnapshot segment, long nowMs) {
        Evaluation result = new Evaluation();
        if (record == null) return result;
        for (RoadNoticeDatabase.Notice notice : record.notices) {
            if (!applies(record, notice, segment, nowMs)) continue;
            if (notice.type == RoadNoticeDatabase.TYPE_MINIMUM_SPEED
                    && notice.hasValueKmh && notice.valueKmh >= 0
                    && better(notice, result.minimumNotice)) {
                result.minimumNotice = notice;
                result.minimumSpeed = Integer.valueOf(notice.valueKmh);
            }
            if ((notice.type == RoadNoticeDatabase.TYPE_NO_PARKING
                    || notice.type == RoadNoticeDatabase.TYPE_NO_STOPPING)
                    && scheduleActive(notice.schedule, nowMs)
                    && better(notice, result.parkingNotice)) {
                result.parkingNotice = notice;
                result.parkingRestriction = notice.type == RoadNoticeDatabase.TYPE_NO_STOPPING
                        ? 2 : 1;
            }
            if (notice.triggerMode == RoadNoticeDatabase.TRIGGER_ENTER_SEGMENT
                    && voiceText(notice) != null && better(notice, result.voice)) {
                result.voice = notice;
            }
        }
        return result;
    }

    static boolean applies(RoadNoticeDatabase.SegmentRecord record,
                           RoadNoticeDatabase.Notice notice,
                           SegmentSnapshot segment, long nowMs) {
        if (!notice.enabled) return false;
        if (notice.hasValidFrom && nowMs < notice.validFromMs) return false;
        if (notice.hasValidUntil && nowMs >= notice.validUntilMs) return false;
        if (notice.direction == RoadNoticeDatabase.DIRECTION_BOTH) return true;
        long from = segment.fromNodeId();
        long to = segment.toNodeId();
        if (from < 0 || to < 0 || record.fromNodeId < 0 || record.toNodeId < 0) return false;
        if (notice.direction == RoadNoticeDatabase.DIRECTION_FORWARD) {
            return from == record.fromNodeId && to == record.toNodeId;
        }
        if (notice.direction == RoadNoticeDatabase.DIRECTION_REVERSE) {
            return from == record.toNodeId && to == record.fromNodeId;
        }
        return false;
    }

    static boolean better(RoadNoticeDatabase.Notice candidate,
                          RoadNoticeDatabase.Notice selected) {
        if (selected == null) return true;
        if (candidate.priority != selected.priority) return candidate.priority > selected.priority;
        return candidate.noticeId.compareTo(selected.noticeId) < 0;
    }

    static boolean scheduleActive(RoadNoticeDatabase.RestrictionSchedule schedule,
                                  long nowMs) {
        if (schedule == null) return true;
        Calendar calendar = Calendar.getInstance(VIETNAM);
        calendar.setTimeInMillis(nowMs);
        int day = calendar.get(Calendar.DAY_OF_MONTH);
        if (schedule.dayRule == RoadNoticeDatabase.DAY_ODD && (day & 1) == 0) return false;
        if (schedule.dayRule == RoadNoticeDatabase.DAY_EVEN && (day & 1) != 0) return false;
        if (schedule.dayRule != 0 && schedule.dayRule != RoadNoticeDatabase.DAY_EVERY
                && schedule.dayRule != RoadNoticeDatabase.DAY_ODD
                && schedule.dayRule != RoadNoticeDatabase.DAY_EVEN) return false;

        int minute = calendar.get(Calendar.HOUR_OF_DAY) * 60 + calendar.get(Calendar.MINUTE);
        List<RoadNoticeDatabase.TimeRange> ranges = schedule.ranges;
        if (!ranges.isEmpty()) {
            for (RoadNoticeDatabase.TimeRange range : ranges) {
                if (inRange(minute, range.startMinute, range.endMinute)) return true;
            }
            return false;
        }
        return !schedule.hasLegacyRange
                || inRange(minute, schedule.startMinute, schedule.endMinute);
    }

    static boolean inRange(int minute, int start, int end) {
        if (start < 0 || start > 1439 || end < 0 || end > 1439 || start == end) return false;
        return start < end ? minute >= start && minute < end
                : minute >= start || minute < end;
    }

    private static void applyIfCurrent(long segmentId, long generation, Evaluation evaluation) {
        if (!stillCurrent(segmentId, generation) || Gateway.hudRoadSegmentId != segmentId) return;
        MinimumSpeedPolicy.publishBackendMinimumSpeed(segmentId, evaluation.minimumSpeed);
        Gateway.parkingRestriction = evaluation.parkingRestriction;
    }

    private static void maybeSpeak(final Context app, final long segmentId, final long generation,
                                   final RoadNoticeDatabase.Notice notice) {
        if (notice == null || app == null || !Gateway.modEnabled(app)) return;
        SharedPreferences preferences = app.getSharedPreferences(MOD_PREFS, Context.MODE_PRIVATE);
        if (!preferences.getBoolean(PREF_TTS, true)) return;
        final String text = voiceText(notice);
        if (text == null || !maySpeak(segmentId, notice, System.currentTimeMillis())) return;
        if (WazeTtsBridge.speak(text, voiceArgs(notice))) {
            markSpoken(segmentId, notice, System.currentTimeMillis());
            Log.i(TAG, "TTS segment=" + segmentId + " notice=" + notice.noticeId);
            return;
        }
        WORKER.schedule(new Runnable() {
            @Override public void run() {
                if (!stillCurrent(segmentId, generation) || Gateway.hudRoadSegmentId != segmentId
                        || !Gateway.modEnabled(app)) return;
                if (!app.getSharedPreferences(MOD_PREFS, Context.MODE_PRIVATE)
                        .getBoolean(PREF_TTS, true)) return;
                long now = System.currentTimeMillis();
                if (maySpeak(segmentId, notice, now) && WazeTtsBridge.speak(text, voiceArgs(notice))) {
                    markSpoken(segmentId, notice, now);
                    Log.i(TAG, "TTS retry segment=" + segmentId + " notice=" + notice.noticeId);
                }
            }
        }, 1L, TimeUnit.SECONDS);
    }

    /**
     * The spoken line as a Vietnamese template ({0} = the notice title, see {@link #voiceArgs}); it is the key
     * WazeTtsBridge translates for the voice that is selected, so it must not go through I18n.tr.
     */
    static String voiceText(RoadNoticeDatabase.Notice notice) {
        if (notice.type == RoadNoticeDatabase.TYPE_EXPRESSWAY_EXIT) {
            String title = notice.title == null ? "" : notice.title.trim();
            if (title.isEmpty()) return null;
            return title.toLowerCase(Locale.ROOT).startsWith("lối ra") // i18n:skip (matches server data)
                    ? "Sắp đến {0}" : "Sắp đến lối ra {0}";
        }
        if (notice.type == RoadNoticeDatabase.TYPE_EXPRESSWAY_REST_STOP) {
            return "road.expressway_rest_area_ahead";
        }
        if (notice.type == RoadNoticeDatabase.TYPE_REST_STOP) {
            return "road.rest_area_ahead";
        }
        if (notice.type == RoadNoticeDatabase.TYPE_VOICE_NOTICE) {
            String voice = notice.voiceText == null ? "" : notice.voiceText.trim();
            return voice.isEmpty() ? null : voice;
        }
        return null;
    }

    /** Arguments for the {0}... placeholders of {@link #voiceText}. */
    static Object[] voiceArgs(RoadNoticeDatabase.Notice notice) {
        if (notice.type == RoadNoticeDatabase.TYPE_EXPRESSWAY_EXIT) {
            return new Object[]{notice.title == null ? "" : notice.title.trim()};
        }
        return new Object[0];
    }

    static boolean maySpeak(long segmentId, RoadNoticeDatabase.Notice notice, long now) {
        String key = key(segmentId, notice.noticeId);
        Integer repeats = tripRepeats.get(key);
        if (notice.maxRepeatsPerTrip > 0 && repeats != null
                && repeats.intValue() >= notice.maxRepeatsPerTrip) return false;
        Long previous = lastSpokenAt.get(key);
        long cooldownMs = Math.max(0L, (long) notice.cooldownSeconds) * 1000L;
        return cooldownMs == 0L || previous == null || now - previous.longValue() >= cooldownMs;
    }

    static void markSpoken(long segmentId, RoadNoticeDatabase.Notice notice, long now) {
        String key = key(segmentId, notice.noticeId);
        Integer repeats = tripRepeats.get(key);
        tripRepeats.put(key, Integer.valueOf(repeats == null ? 1 : repeats.intValue() + 1));
        lastSpokenAt.put(key, Long.valueOf(now));
    }

    private static String key(long segmentId, String noticeId) {
        return segmentId + ":" + (noticeId == null ? "" : noticeId);
    }

    private static boolean stillCurrent(long segmentId, long generation) {
        return currentSegmentId == segmentId && segmentGeneration == generation;
    }

    private static final class Evaluation {
        Integer minimumSpeed;
        int parkingRestriction;
        RoadNoticeDatabase.Notice minimumNotice;
        RoadNoticeDatabase.Notice parkingNotice;
        RoadNoticeDatabase.Notice voice;
    }
}
