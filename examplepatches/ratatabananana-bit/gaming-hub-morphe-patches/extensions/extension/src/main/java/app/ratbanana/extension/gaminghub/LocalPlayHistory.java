package app.ratbanana.extension.gaminghub;

import android.app.usage.UsageStatsManager;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.util.Log;

import java.lang.reflect.Method;
import java.lang.reflect.Type;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * Answers Gaming Hub's play history endpoints on the device, from Android's usage data,
 * in the same shape as Samsung's server.
 * <p>
 * Samsung computes play history on its server from play time uploaded under the user's account.
 * Without an account nothing is uploaded, so the same statistics are computed here instead.
 * Comparisons with other players need Samsung's data and stay empty.
 */
final class LocalPlayHistory {

    private static final String SUMMARY_PATH = "/gotcha/v1/dashboard/summary";
    private static final String PLAY_LOG_PATH = "/gotcha/v1/dashboard/my-play-log";
    private static final String RANK_PATH = "/gotcha/v1/dashboard/rank";
    /**
     * Today's play summary. The app adds the play time it records on the device itself, which
     * needs a Samsung account to run, so the whole of today's play is answered here.
     */
    private static final String TODAY_SUMMARY_PATH = "/gotcha/v1/users/playtime/summary/ip";

    // Statistic types, as named by Gaming Hub.
    private static final String TOTAL_PLAY_TIME = "GAME_TOTAL_PLAYTIME";
    private static final String TOTAL_COUNT = "GAME_TOTAL_COUNT";
    private static final String TOP_PLAY_HOUR = "GAME_TOP_PLAYHOUR_IN_DAY";
    private static final String CONSECUTIVE_DAYS = "GAME_CONSECUTIVE_DAYS_PLAYED";
    private static final String LONGEST_IN_DAY = "GAME_LONGEST_PLAYTIME_IN_DAY";
    private static final String LONGEST_SESSION = "GAME_LONGEST_PLAYTIME_IN_ONE_PLAY";

    // Rankings, as named by Gaming Hub.
    private static final String RANK_PLAY_TIME = "PLAYTIME";
    private static final String RANK_PLAY_COUNT = "PLAYCOUNT";
    private static final String RANK_SESSION_TIME = "SESSIONTIME";

    private static final long MINUTE_MILLIS = 60_000L;

    private LocalPlayHistory() {
    }

    /**
     * @return The local response for a play history endpoint, or null for any other endpoint.
     */
    static Object respond(Context context, String path, Method method, Object[] args, Type responseType) {
        try {
            switch (path) {
                case SUMMARY_PATH:
                    return summary(context, stringArg(args, 0), responseType);
                case PLAY_LOG_PATH:
                    return playLog(context, stringArg(args, 0), responseType);
                case RANK_PATH:
                    return rank(context, stringArg(args, 0), stringArg(args, 1), responseType);
                case TODAY_SUMMARY_PATH:
                    return todaySummary(context, responseType);
                default:
                    return null;
            }
        } catch (ReflectiveOperationException | RuntimeException ex) {
            Log.e(SamsungAccount.TAG, "Failed to build local play history for " + path, ex);
            return null;
        }
    }

    private static Object summary(Context context, String period, Type responseType)
            throws ReflectiveOperationException {
        History history = History.load(context, Period.of(period));
        HistoryModels models = models(responseType);

        List<Object> userStats = new ArrayList<>();
        userStats.add(models.dashBoardItem(TOTAL_PLAY_TIME, minutes(history.totalPlayTime()), "", 0, "", ""));
        userStats.add(models.dashBoardItem(TOTAL_COUNT, String.valueOf(history.sessions.size()), "", 0, "", ""));
        userStats.add(models.dashBoardItem(CONSECUTIVE_DAYS, String.valueOf(history.longestStreakDays()), "", 0, "", ""));
        userStats.add(models.dashBoardItem(LONGEST_IN_DAY, minutes(history.longestDay()), "", 0, "", ""));
        userStats.add(models.dashBoardItem(LONGEST_SESSION, minutes(history.longestSession()), "", 0, "", ""));
        int topHour = history.topPlayHour();
        if (topHour >= 0) {
            userStats.add(models.dashBoardItem(TOP_PLAY_HOUR, String.valueOf(topHour), "", 0, "", ""));
        }

        List<Object> rankings = new ArrayList<>();
        for (String rankType : new String[]{RANK_PLAY_TIME, RANK_PLAY_COUNT, RANK_SESSION_TIME}) {
            rankings.add(rankItem(context, models, history, rankType));
        }

        return HistoryModels.response(responseType,
                "", HistoryModels.SUCCESS_RESULT_CODE, history.period.apiName,
                userStats, Collections.emptyList(), rankings);
    }

    private static Object todaySummary(Context context, Type responseType) throws ReflectiveOperationException {
        long now = System.currentTimeMillis();
        long startOfToday = Period.DAY_7.boundaries(now)[Period.DAY_7.bucketCount - 1];
        PlaySessions source = new PlaySessions(context, new HashSet<>(AndroidGameList.getInstalledGames(context)));

        List<String> gamesPlayedToday = new ArrayList<>();
        long playTimeToday = 0;
        for (PlaySessions.Session session : source.sessions(startOfToday, now)) {
            playTimeToday += session.durationMillis();
            if (!gamesPlayedToday.contains(session.packageName)) {
                gamesPlayedToday.add(session.packageName);
            }
        }

        // Play time in milliseconds, as the app adds it to its own millisecond total.
        return HistoryModels.response(responseType, HistoryModels.SUCCESS_RESULT_CODE,
                gamesPlayedToday.size(), (int) Math.min(playTimeToday, Integer.MAX_VALUE), "",
                gamesPlayedToday, Collections.emptyList());
    }

    private static Object playLog(Context context, String period, Type responseType)
            throws ReflectiveOperationException {
        History history = History.load(context, Period.of(period));
        HistoryModels models = models(responseType);

        List<Object> playTimes = new ArrayList<>();
        List<Object> counts = new ArrayList<>();
        List<Object> topHours = new ArrayList<>();
        for (Bucket bucket : history.buckets) {
            String date = history.period.format(bucket.start);
            playTimes.add(models.dashBoardItem(TOTAL_PLAY_TIME, minutes(bucket.playTime), date, 0, "", ""));
            counts.add(models.dashBoardItem(TOTAL_COUNT, String.valueOf(bucket.sessionCount), date, 0, "", ""));
            if (bucket.topPlayHour >= 0) {
                topHours.add(models.dashBoardItem(TOP_PLAY_HOUR, String.valueOf(bucket.topPlayHour), date, 0, "", ""));
            }
        }

        List<Object> playLogs = new ArrayList<>();
        playLogs.add(models.playLog(TOTAL_PLAY_TIME,
                models.dashBoardItem(TOTAL_PLAY_TIME, minutes(history.totalPlayTime()), "", 0, "", ""),
                playTimes, Collections.emptyList()));
        playLogs.add(models.playLog(TOTAL_COUNT,
                models.dashBoardItem(TOTAL_COUNT, String.valueOf(history.sessions.size()), "", 0, "", ""),
                counts, Collections.emptyList()));
        playLogs.add(models.playLog(TOP_PLAY_HOUR,
                models.dashBoardItem(TOP_PLAY_HOUR, String.valueOf(history.topPlayHour()), "", 0, "", ""),
                topHours, Collections.emptyList()));

        return HistoryModels.response(responseType,
                HistoryModels.SUCCESS_RESULT_CODE, history.period.apiName, playLogs);
    }

    private static Object rank(Context context, String rankType, String period, Type responseType)
            throws ReflectiveOperationException {
        History history = History.load(context, Period.of(period));
        HistoryModels models = models(responseType);
        return HistoryModels.response(responseType,
                HistoryModels.SUCCESS_RESULT_CODE, rankItem(context, models, history, rankType));
    }

    private static Object rankItem(Context context, HistoryModels models, History history, String rankType)
            throws ReflectiveOperationException {
        Map<String, Long> values;
        switch (rankType) {
            case RANK_PLAY_COUNT:
                values = history.sessionCountPerGame();
                break;
            case RANK_SESSION_TIME:
                values = history.longestSessionPerGame();
                break;
            default:
                values = history.playTimePerGame();
        }

        List<Map.Entry<String, Long>> ranked = new ArrayList<>(values.entrySet());
        Collections.sort(ranked, (a, b) -> Long.compare(b.getValue(), a.getValue()));

        List<Object> items = new ArrayList<>();
        int rank = 1;
        for (Map.Entry<String, Long> entry : ranked) {
            if (entry.getValue() <= 0) {
                continue;
            }
            String value = RANK_PLAY_COUNT.equals(rankType)
                    ? String.valueOf(entry.getValue())
                    : minutes(entry.getValue());
            items.add(models.dashBoardItem(rankType, value, "", rank++,
                    label(context, entry.getKey()), entry.getKey()));
        }
        return models.rankItem(rankType, items);
    }

    private static HistoryModels models(Type responseType) {
        ClassLoader loader = responseType instanceof Class
                ? ((Class<?>) responseType).getClassLoader()
                : LocalPlayHistory.class.getClassLoader();
        return new HistoryModels(loader);
    }

    private static String minutes(long millis) {
        return String.valueOf(millis / MINUTE_MILLIS);
    }

    private static String stringArg(Object[] args, int index) {
        return args != null && args.length > index && args[index] instanceof String ? (String) args[index] : "";
    }

    private static String label(Context context, String packageName) {
        try {
            PackageManager packageManager = context.getPackageManager();
            ApplicationInfo app = packageManager.getApplicationInfo(packageName, 0);
            return packageManager.getApplicationLabel(app).toString();
        } catch (PackageManager.NameNotFoundException ex) {
            return packageName;
        }
    }

    /** The periods Gaming Hub offers, mapped to time buckets in local time. */
    enum Period {
        DAY_7(Calendar.DAY_OF_YEAR, 1, 7, "yyyy.MM.dd", UsageStatsManager.INTERVAL_DAILY),
        WEEK_4(Calendar.DAY_OF_YEAR, 7, 4, "yyyy.MM.dd", UsageStatsManager.INTERVAL_WEEKLY),
        MONTH_6(Calendar.MONTH, 1, 6, "yyyy.MM", UsageStatsManager.INTERVAL_MONTHLY),
        ALL(Calendar.MONTH, 1, 12, "yyyy.MM", UsageStatsManager.INTERVAL_MONTHLY);

        final String apiName;
        private final int calendarField;
        private final int bucketLength;
        final int bucketCount;
        private final String datePattern;
        /** Android's aggregated usage interval closest to one bucket of this period. */
        final int usageStatsInterval;

        Period(int calendarField, int bucketLength, int bucketCount, String datePattern, int usageStatsInterval) {
            this.apiName = name();
            this.calendarField = calendarField;
            this.bucketLength = bucketLength;
            this.bucketCount = bucketCount;
            this.datePattern = datePattern;
            this.usageStatsInterval = usageStatsInterval;
        }

        static Period of(String name) {
            for (Period period : values()) {
                if (period.apiName.equalsIgnoreCase(name)) {
                    return period;
                }
            }
            return DAY_7;
        }

        String format(long time) {
            return new SimpleDateFormat(datePattern, Locale.US).format(time);
        }

        /** @return Bucket start times from oldest to newest, followed by the end of the newest. */
        long[] boundaries(long now) {
            Calendar calendar = Calendar.getInstance();
            calendar.setTimeInMillis(now);
            calendar.set(Calendar.HOUR_OF_DAY, 0);
            calendar.set(Calendar.MINUTE, 0);
            calendar.set(Calendar.SECOND, 0);
            calendar.set(Calendar.MILLISECOND, 0);
            if (calendarField == Calendar.MONTH) {
                calendar.set(Calendar.DAY_OF_MONTH, 1);
            }

            // Start of the newest bucket: today, the last 7 days, or this month.
            calendar.add(calendarField, 1 - bucketLength);

            long[] boundaries = new long[bucketCount + 1];
            boundaries[bucketCount] = now;
            for (int i = bucketCount - 1; i >= 0; i--) {
                boundaries[i] = calendar.getTimeInMillis();
                calendar.add(calendarField, -bucketLength);
            }
            return boundaries;
        }
    }

    private static final class Bucket {
        final long start;
        long playTime;
        int sessionCount;
        int topPlayHour = -1;

        Bucket(long start) {
            this.start = start;
        }
    }

    /** Play statistics of one period. */
    private static final class History {
        final Period period;
        final List<Bucket> buckets = new ArrayList<>();
        final List<PlaySessions.Session> sessions;
        private final Map<String, Long> playTimePerGame = new HashMap<>();

        private History(Period period, List<PlaySessions.Session> sessions) {
            this.period = period;
            this.sessions = sessions;
        }

        static History load(Context context, Period period) {
            long now = System.currentTimeMillis();
            long[] boundaries = period.boundaries(now);
            long start = boundaries[0];

            PlaySessions source = new PlaySessions(context, new HashSet<>(AndroidGameList.getInstalledGames(context)));
            History history = new History(period, source.sessions(start, now));

            // Individual events are kept only for a limited time; older buckets use the
            // aggregated statistics Android keeps for months. Each aggregated interval is counted
            // once, in the bucket holding its midpoint, and only if it ended before the events
            // start, so no play time is counted twice.
            long eventsCoverage = source.eventsCoverageStart(start, now);
            List<PlaySessions.UsageTotal> olderTotals =
                    source.aggregatedPlayTime(period.usageStatsInterval, start, eventsCoverage);

            for (int i = 0; i < boundaries.length - 1; i++) {
                Bucket bucket = new Bucket(boundaries[i]);
                long bucketEnd = boundaries[i + 1];

                if (bucketEnd > eventsCoverage) {
                    long[] playByHour = new long[24];
                    for (PlaySessions.Session session : history.sessions) {
                        long overlap = overlap(session.start, session.end, bucket.start, bucketEnd);
                        if (overlap <= 0) {
                            continue;
                        }
                        bucket.playTime += overlap;
                        history.addPlayTime(session.packageName, overlap);
                        if (session.start >= bucket.start && session.start < bucketEnd) {
                            bucket.sessionCount++;
                        }
                        addByHour(playByHour, Math.max(session.start, bucket.start), Math.min(session.end, bucketEnd));
                    }
                    bucket.topPlayHour = maxIndex(playByHour);
                } else {
                    for (PlaySessions.UsageTotal total : olderTotals) {
                        if (total.midpoint() >= bucket.start && total.midpoint() < bucketEnd) {
                            bucket.playTime += total.playTime;
                            history.addPlayTime(total.packageName, total.playTime);
                        }
                    }
                }
                history.buckets.add(bucket);
            }
            return history;
        }

        long totalPlayTime() {
            long total = 0;
            for (Bucket bucket : buckets) {
                total += bucket.playTime;
            }
            return total;
        }

        int topPlayHour() {
            long[] playByHour = new long[24];
            for (PlaySessions.Session session : sessions) {
                addByHour(playByHour, session.start, session.end);
            }
            return maxIndex(playByHour);
        }

        long longestSession() {
            long longest = 0;
            for (PlaySessions.Session session : sessions) {
                longest = Math.max(longest, session.durationMillis());
            }
            return longest;
        }

        long longestDay() {
            long longest = 0;
            for (long dayTotal : playTimePerDay().values()) {
                longest = Math.max(longest, dayTotal);
            }
            return longest;
        }

        int longestStreakDays() {
            List<Long> days = new ArrayList<>(playTimePerDay().keySet());
            Collections.sort(days);
            int longest = 0;
            int current = 0;
            long previous = Long.MIN_VALUE;
            for (long day : days) {
                current = day == previous + 1 ? current + 1 : 1;
                longest = Math.max(longest, current);
                previous = day;
            }
            return longest;
        }

        Map<String, Long> playTimePerGame() {
            return playTimePerGame;
        }

        Map<String, Long> sessionCountPerGame() {
            Map<String, Long> counts = new HashMap<>();
            for (PlaySessions.Session session : sessions) {
                Long count = counts.get(session.packageName);
                counts.put(session.packageName, count == null ? 1L : count + 1);
            }
            return counts;
        }

        Map<String, Long> longestSessionPerGame() {
            Map<String, Long> longest = new HashMap<>();
            for (PlaySessions.Session session : sessions) {
                Long current = longest.get(session.packageName);
                if (current == null || session.durationMillis() > current) {
                    longest.put(session.packageName, session.durationMillis());
                }
            }
            return longest;
        }

        private void addPlayTime(String packageName, long time) {
            Long current = playTimePerGame.get(packageName);
            playTimePerGame.put(packageName, current == null ? time : current + time);
        }

        /** @return Play time per local day, keyed by days since the epoch. */
        private Map<Long, Long> playTimePerDay() {
            Map<Long, Long> perDay = new HashMap<>();
            Calendar calendar = Calendar.getInstance();
            for (PlaySessions.Session session : sessions) {
                calendar.setTimeInMillis(session.start);
                long offset = calendar.get(Calendar.ZONE_OFFSET) + calendar.get(Calendar.DST_OFFSET);
                long day = (session.start + offset) / (24 * 60 * MINUTE_MILLIS);
                Long current = perDay.get(day);
                perDay.put(day, current == null ? session.durationMillis() : current + session.durationMillis());
            }
            return perDay;
        }
    }

    private static long overlap(long start, long end, long rangeStart, long rangeEnd) {
        return Math.min(end, rangeEnd) - Math.max(start, rangeStart);
    }

    /** Spreads a time range over the local hours of the day it covers. */
    private static void addByHour(long[] playByHour, long start, long end) {
        Calendar calendar = Calendar.getInstance();
        long time = start;
        while (time < end) {
            calendar.setTimeInMillis(time);
            int hour = calendar.get(Calendar.HOUR_OF_DAY);
            calendar.set(Calendar.MINUTE, 0);
            calendar.set(Calendar.SECOND, 0);
            calendar.set(Calendar.MILLISECOND, 0);
            calendar.add(Calendar.HOUR_OF_DAY, 1);
            long hourEnd = Math.min(calendar.getTimeInMillis(), end);
            playByHour[hour] += hourEnd - time;
            time = hourEnd;
        }
    }

    private static int maxIndex(long[] values) {
        int index = -1;
        long max = 0;
        for (int i = 0; i < values.length; i++) {
            if (values[i] > max) {
                max = values[i];
                index = i;
            }
        }
        return index;
    }
}
