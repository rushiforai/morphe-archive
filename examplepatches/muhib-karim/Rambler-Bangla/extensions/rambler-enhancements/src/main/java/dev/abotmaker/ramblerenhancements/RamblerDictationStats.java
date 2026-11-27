package dev.abotmaker.ramblerenhancements;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.SystemClock;
import android.util.Log;

import org.json.JSONObject;

import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Private, 100% on-device dictation statistics tracker for Gboard Rambler.
 *
 * <p>Tracks cumulative and daily counts of words dictated, completed sessions, weighted average
 * speaking WPM (measured from {@code AgenticDictationExtension.onVoiceStart} to
 * {@code onListeningStop}), average cloud commit latency (measured from {@code onListeningStop}
 * to commit, matching Gboard's own {@code Duration.between(this.D, Instant.now())}), peak WPM,
 * and estimated time saved versus typing.</p>
 *
 * <p>Stores only aggregate numeric counters in local {@link SharedPreferences} — never stores
 * dictated text and is intentionally excluded from JSON settings backups.</p>
 */
public final class RamblerDictationStats {
    private static final String TAG = "RamblerEnhancements";
    public static final String PREF_KEY_STATS_JSON = "pref_rambler_stats_v1";

    private static final long MIN_SPEAKING_MS = 200L;
    private static final long MAX_SPEAKING_MS = 3_600_000L; // 1 hour
    private static final long MAX_FALLBACK_SPEAKING_MS = 300_000L; // 5 minutes
    private static final long MIN_LATENCY_MS = 10L;
    private static final long MAX_LATENCY_MS = 30_000L; // 30s outlier ceiling
    private static final int MIN_PEAK_WPM_WORDS = 5;
    private static final long MIN_PEAK_WPM_SPEAKING_MS = 1500L;
    private static final int MAX_SANE_PEAK_WPM = 400;
    private static final double UNTIMED_FALLBACK_DICTATION_WPM = 150.0;
    private static final long DEDUP_COMMIT_WINDOW_MS = 1200L;

    // Matches Latin/Cyrillic/Arabic/etc. word tokens (keeping apostrophes & hyphens inside words)
    // and individual CJK ideographs/kana so multilingual dictation counts accurately.
    private static final Pattern WORD_TOKEN_PATTERN = Pattern.compile(
            "[\\p{IsHan}\\p{IsHiragana}\\p{IsKatakana}]"
                    + "|[\\p{L}\\p{N}]+(?:['\\u2019\\-][\\p{L}\\p{N}]+)*");

    interface Clock {
        long elapsedRealtime();

        long currentTimeMillis();
    }

    private static final Clock SYSTEM_CLOCK = new Clock() {
        @Override
        public long elapsedRealtime() {
            return SystemClock.elapsedRealtime();
        }

        @Override
        public long currentTimeMillis() {
            return System.currentTimeMillis();
        }
    };

    public static final class StatsSnapshot {
        public final long totalWords;
        public final long totalSessions;
        public final long timedWords;
        public final long totalSpeakingMs;
        public final long totalLatencyMs;
        public final long latencySamples;
        public final long lastLatencyMs;
        public final int bestWpm;
        public final String todayKey;
        public final long todayWords;
        public final long todaySessions;
        public final long firstRecordedMs;

        public StatsSnapshot(
                long totalWords,
                long totalSessions,
                long timedWords,
                long totalSpeakingMs,
                long totalLatencyMs,
                long latencySamples,
                long lastLatencyMs,
                int bestWpm,
                String todayKey,
                long todayWords,
                long todaySessions,
                long firstRecordedMs) {
            this.totalWords = Math.max(0L, totalWords);
            this.totalSessions = Math.max(0L, totalSessions);
            this.timedWords = Math.max(0L, timedWords);
            this.totalSpeakingMs = Math.max(0L, totalSpeakingMs);
            this.totalLatencyMs = Math.max(0L, totalLatencyMs);
            this.latencySamples = Math.max(0L, latencySamples);
            this.lastLatencyMs = Math.max(0L, lastLatencyMs);
            this.bestWpm = Math.max(0, bestWpm);
            this.todayKey = todayKey == null ? "" : todayKey;
            this.todayWords = Math.max(0L, todayWords);
            this.todaySessions = Math.max(0L, todaySessions);
            this.firstRecordedMs = Math.max(0L, firstRecordedMs);
        }

        public static StatsSnapshot empty() {
            return new StatsSnapshot(0L, 0L, 0L, 0L, 0L, 0L, 0L, 0, "", 0L, 0L, 0L);
        }

        public boolean isEmpty() {
            return totalSessions == 0L && totalWords == 0L;
        }

        /** Weighted average speaking WPM across all timed sessions, or 0 if unavailable. */
        public int averageWpm() {
            if (timedWords <= 0L || totalSpeakingMs < 1000L) {
                return 0;
            }
            return (int) Math.round((timedWords * 60_000.0) / totalSpeakingMs);
        }

        /** Average cloud commit latency in ms across timed commits, or 0 if unavailable. */
        public long averageLatencyMs() {
            if (latencySamples <= 0L || totalLatencyMs <= 0L) {
                return 0L;
            }
            return Math.round((double) totalLatencyMs / (double) latencySamples);
        }

        /**
         * Honest estimated time saved vs. manual typing at {@code typingBaselineWpm}, subtracting
         * both actual speaking time and actual cloud processing wait time.
         */
        public long estimatedTimeSavedMs(int typingBaselineWpm) {
            if (totalWords <= 0L) {
                return 0L;
            }
            int baseline = RamblerEnhancementsSettings.clampTypingBaselineWpm(typingBaselineWpm);
            double typingMs = (totalWords * 60_000.0) / baseline;
            long untimedWords = Math.max(0L, totalWords - timedWords);
            double actualMs = totalSpeakingMs
                    + totalLatencyMs
                    + (untimedWords * 60_000.0 / UNTIMED_FALLBACK_DICTATION_WPM);
            long saved = Math.round(typingMs - actualMs);
            return Math.max(0L, saved);
        }

        /** Speed multiplier vs. baseline typing WPM (e.g. 3.6 means 3.6x faster), or 0f. */
        public float speedMultiplier(int typingBaselineWpm) {
            int wpm = averageWpm();
            if (wpm <= 0) {
                return 0f;
            }
            int baseline = RamblerEnhancementsSettings.clampTypingBaselineWpm(typingBaselineWpm);
            return (float) wpm / (float) baseline;
        }

        public long todayWordsFor(String currentDayKey) {
            return currentDayKey != null && currentDayKey.equals(todayKey) ? todayWords : 0L;
        }

        public long todaySessionsFor(String currentDayKey) {
            return currentDayKey != null && currentDayKey.equals(todayKey) ? todaySessions : 0L;
        }
    }

    private static final Object STATS_LOCK = new Object();
    private static volatile Clock clock = SYSTEM_CLOCK;
    private static long activeVoiceStartElapsedMs = 0L;
    private static long activeListeningStopElapsedMs = 0L;
    private static long lastCommitWallMs = 0L;
    private static String lastCommittedText = null;

    private RamblerDictationStats() {
    }

    static void setClockForTesting(Clock testClock) {
        synchronized (STATS_LOCK) {
            clock = testClock == null ? SYSTEM_CLOCK : testClock;
        }
    }

    static void clearForTesting() {
        synchronized (STATS_LOCK) {
            clock = SYSTEM_CLOCK;
            activeVoiceStartElapsedMs = 0L;
            activeListeningStopElapsedMs = 0L;
            lastCommitWallMs = 0L;
            lastCommittedText = null;
        }
    }

    /**
     * Hook called at entry of {@code AgenticDictationExtension.onVoiceStart}.
     * Uses 0 parameters so bytecode injection needs zero extra registers.
     */
    public static void onVoiceStart() {
        try {
            long now = clock.elapsedRealtime();
            synchronized (STATS_LOCK) {
                activeVoiceStartElapsedMs = now;
                activeListeningStopElapsedMs = 0L;
            }
        } catch (Throwable throwable) {
            logWarningSafely("onVoiceStart stats hook failed", throwable);
        }
    }

    /**
     * Hook called at entry of {@code AgenticDictationExtension.onListeningStop}.
     * Uses 0 parameters so bytecode injection needs zero extra registers.
     */
    public static void onListeningStop() {
        try {
            long now = clock.elapsedRealtime();
            synchronized (STATS_LOCK) {
                activeListeningStopElapsedMs = now;
            }
        } catch (Throwable throwable) {
            logWarningSafely("onListeningStop stats hook failed", throwable);
        }
    }

    /**
     * Records a completed dictation commit into the private local stats store.
     */
    public static void onDictationCommitted(Context context, String committedText) {
        if (context == null || committedText == null || !RamblerDynamicConfig.FEATURE_PRODUCTIVITY_TOOLS) {
            return;
        }
        try {
            if (!RamblerEnhancementsSettings.readStatsEnabled(context)) {
                consumeSessionTimestamps();
                return;
            }
            String trimmed = committedText.trim();
            int words = countWords(trimmed);
            if (words <= 0) {
                consumeSessionTimestamps();
                return;
            }

            long commitElapsed = clock.elapsedRealtime();
            long commitWall = clock.currentTimeMillis();

            synchronized (STATS_LOCK) {
                // Guard against back-to-back duplicate commits with identical text and no new start.
                if (activeVoiceStartElapsedMs == 0L
                        && activeListeningStopElapsedMs == 0L
                        && trimmed.equals(lastCommittedText)
                        && Math.abs(commitWall - lastCommitWallMs) <= DEDUP_COMMIT_WINDOW_MS) {
                    return;
                }

                long startElapsed = activeVoiceStartElapsedMs;
                long stopElapsed = activeListeningStopElapsedMs;
                activeVoiceStartElapsedMs = 0L;
                activeListeningStopElapsedMs = 0L;
                lastCommitWallMs = commitWall;
                lastCommittedText = trimmed;

                long speakingMs = 0L;
                long latencyMs = 0L;

                if (startElapsed > 0L && stopElapsed >= startElapsed) {
                    long candidateSpeak = stopElapsed - startElapsed;
                    if (candidateSpeak >= MIN_SPEAKING_MS && candidateSpeak <= MAX_SPEAKING_MS) {
                        speakingMs = candidateSpeak;
                    }
                } else if (startElapsed > 0L && stopElapsed == 0L && commitElapsed >= startElapsed) {
                    long candidateSpeak = commitElapsed - startElapsed;
                    if (candidateSpeak >= MIN_SPEAKING_MS
                            && candidateSpeak <= MAX_FALLBACK_SPEAKING_MS) {
                        speakingMs = candidateSpeak;
                    }
                }

                if (stopElapsed > 0L && commitElapsed >= stopElapsed) {
                    long candidateLatency = commitElapsed - stopElapsed;
                    if (candidateLatency >= MIN_LATENCY_MS && candidateLatency <= MAX_LATENCY_MS) {
                        latencyMs = candidateLatency;
                    }
                }

                SharedPreferences prefs = RamblerEnhancementsSettings.preferencesOrNull(context);
                if (prefs == null) {
                    return;
                }
                StatsSnapshot prev = parseJson(prefs.getString(PREF_KEY_STATS_JSON, null));
                String dayKey = formatDayKey(commitWall);
                boolean sameDay = dayKey.equals(prev.todayKey);

                long newTotalWords = prev.totalWords + words;
                long newTotalSessions = prev.totalSessions + 1L;
                long newTimedWords = prev.timedWords + (speakingMs > 0L ? words : 0L);
                long newTotalSpeakingMs = prev.totalSpeakingMs + speakingMs;
                long newTotalLatencyMs = prev.totalLatencyMs + latencyMs;
                long newLatencySamples = prev.latencySamples + (latencyMs > 0L ? 1L : 0L);
                long newLastLatencyMs = latencyMs > 0L ? latencyMs : prev.lastLatencyMs;

                int newBestWpm = prev.bestWpm;
                if (words >= MIN_PEAK_WPM_WORDS && speakingMs >= MIN_PEAK_WPM_SPEAKING_MS) {
                    int sessionWpm = (int) Math.round((words * 60_000.0) / speakingMs);
                    if (sessionWpm > newBestWpm && sessionWpm <= MAX_SANE_PEAK_WPM) {
                        newBestWpm = sessionWpm;
                    }
                }

                long newTodayWords = (sameDay ? prev.todayWords : 0L) + words;
                long newTodaySessions = (sameDay ? prev.todaySessions : 0L) + 1L;
                long newFirstRecordedMs = prev.firstRecordedMs > 0L
                        ? prev.firstRecordedMs
                        : commitWall;

                StatsSnapshot updated = new StatsSnapshot(
                        newTotalWords,
                        newTotalSessions,
                        newTimedWords,
                        newTotalSpeakingMs,
                        newTotalLatencyMs,
                        newLatencySamples,
                        newLastLatencyMs,
                        newBestWpm,
                        dayKey,
                        newTodayWords,
                        newTodaySessions,
                        newFirstRecordedMs);
                prefs.edit().putString(PREF_KEY_STATS_JSON, serializeJson(updated)).commit();
            }
        } catch (Throwable throwable) {
            logWarningSafely("onDictationCommitted stats recording failed", throwable);
        }
    }

    private static void consumeSessionTimestamps() {
        synchronized (STATS_LOCK) {
            activeVoiceStartElapsedMs = 0L;
            activeListeningStopElapsedMs = 0L;
        }
    }

    public static StatsSnapshot readSnapshot(Context context) {
        synchronized (STATS_LOCK) {
            SharedPreferences prefs = RamblerEnhancementsSettings.preferencesOrNull(context);
            if (prefs == null) {
                return StatsSnapshot.empty();
            }
            return parseJson(prefs.getString(PREF_KEY_STATS_JSON, null));
        }
    }

    public static boolean resetStats(Context context) {
        if (context == null) {
            return false;
        }
        synchronized (STATS_LOCK) {
            activeVoiceStartElapsedMs = 0L;
            activeListeningStopElapsedMs = 0L;
            lastCommitWallMs = 0L;
            lastCommittedText = null;
            SharedPreferences prefs = RamblerEnhancementsSettings.preferencesOrNull(context);
            return prefs != null && prefs.edit().remove(PREF_KEY_STATS_JSON).commit();
        }
    }

    public static String currentDayKey() {
        return formatDayKey(clock.currentTimeMillis());
    }

    static String formatDayKey(long wallTimeMs) {
        return new SimpleDateFormat("yyyyMMdd", Locale.US).format(new Date(wallTimeMs));
    }

    /** Counts words across both space-delimited scripts and CJK scripts. */
    public static int countWords(String text) {
        if (text == null || text.trim().isEmpty()) {
            return 0;
        }
        Matcher matcher = WORD_TOKEN_PATTERN.matcher(text);
        int count = 0;
        while (matcher.find()) {
            count++;
        }
        return count;
    }

    public static String formatCount(long count) {
        return NumberFormat.getIntegerInstance(Locale.getDefault()).format(Math.max(0L, count));
    }

    public static String formatWpm(int wpm) {
        return wpm <= 0 ? "—" : (formatCount(wpm) + " WPM");
    }

    public static String formatLatency(long latencyMs) {
        if (latencyMs <= 0L) {
            return "—";
        }
        if (latencyMs < 1000L) {
            return latencyMs + " ms";
        }
        return String.format(Locale.US, "%.2fs", latencyMs / 1000.0);
    }

    public static String formatTimeSaved(long savedMs, boolean hasAnySessions) {
        if (!hasAnySessions) {
            return "—";
        }
        if (savedMs <= 0L) {
            return "0s";
        }
        if (savedMs < 1000L) {
            return "< 1s";
        }
        long totalSeconds = Math.round(savedMs / 1000.0);
        if (totalSeconds < 60L) {
            return totalSeconds + "s";
        }
        long totalMinutes = totalSeconds / 60L;
        long remSeconds = totalSeconds % 60L;
        if (totalMinutes < 60L) {
            return remSeconds == 0L
                    ? (totalMinutes + "m")
                    : (totalMinutes + "m " + remSeconds + "s");
        }
        long hours = totalMinutes / 60L;
        long remMinutes = totalMinutes % 60L;
        return remMinutes == 0L
                ? (hours + "h")
                : (hours + "h " + remMinutes + "m");
    }

    public static String formatSpeedBadge(float multiplier) {
        if (multiplier < 1.05f) {
            return "Private · Local";
        }
        return String.format(Locale.US, "%.1f× faster", multiplier);
    }

    static StatsSnapshot parseJson(String raw) {
        if (raw == null || raw.trim().isEmpty()) {
            return StatsSnapshot.empty();
        }
        try {
            JSONObject obj = new JSONObject(raw);
            return new StatsSnapshot(
                    obj.optLong("totalWords", 0L),
                    obj.optLong("totalSessions", 0L),
                    obj.optLong("timedWords", 0L),
                    obj.optLong("totalSpeakingMs", 0L),
                    obj.optLong("totalLatencyMs", 0L),
                    obj.optLong("latencySamples", 0L),
                    obj.optLong("lastLatencyMs", 0L),
                    obj.optInt("bestWpm", 0),
                    obj.optString("todayKey", ""),
                    obj.optLong("todayWords", 0L),
                    obj.optLong("todaySessions", 0L),
                    obj.optLong("firstRecordedMs", 0L));
        } catch (Throwable err) {
            logWarningSafely("Failed to parse dictation stats JSON", err);
            return StatsSnapshot.empty();
        }
    }

    static String serializeJson(StatsSnapshot stats) {
        JSONObject obj = new JSONObject();
        try {
            obj.put("totalWords", stats.totalWords);
            obj.put("totalSessions", stats.totalSessions);
            obj.put("timedWords", stats.timedWords);
            obj.put("totalSpeakingMs", stats.totalSpeakingMs);
            obj.put("totalLatencyMs", stats.totalLatencyMs);
            obj.put("latencySamples", stats.latencySamples);
            obj.put("lastLatencyMs", stats.lastLatencyMs);
            obj.put("bestWpm", stats.bestWpm);
            obj.put("todayKey", stats.todayKey);
            obj.put("todayWords", stats.todayWords);
            obj.put("todaySessions", stats.todaySessions);
            obj.put("firstRecordedMs", stats.firstRecordedMs);
        } catch (Throwable ignored) {
            // Return best-effort JSON.
        }
        return obj.toString();
    }

    private static void logWarningSafely(String message, Throwable throwable) {
        try {
            Log.w(TAG, message, throwable);
        } catch (Throwable ignored) {
            // Never propagate stats logging errors into Gboard.
        }
    }
}
