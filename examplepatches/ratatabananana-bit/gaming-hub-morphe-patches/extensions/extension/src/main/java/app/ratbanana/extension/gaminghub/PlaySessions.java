package app.ratbanana.extension.gaminghub;

import android.app.usage.UsageEvents;
import android.app.usage.UsageStats;
import android.app.usage.UsageStatsManager;
import android.content.Context;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Game play sessions reconstructed from Android's usage data, the same source Gaming Hub
 * itself uses to record play time on the device.
 */
final class PlaySessions {

    /** Foreground gaps shorter than this, such as a quick notification, continue the session. */
    private static final long SESSION_MERGE_GAP_MILLIS = 60_000L;

    /** A pause followed by a resume of the same game within this time is not a session end. */
    private static final long PAUSE_GRACE_MILLIS = 2_000L;

    /** How far before a range to look for the start of a session that runs into it. */
    private static final long SESSION_LOOKBACK_MILLIS = 12 * 60 * 60_000L;

    private static final int SCREEN_NON_INTERACTIVE = 16;
    private static final int KEYGUARD_SHOWN = 17;
    private static final int DEVICE_SHUTDOWN = 26;

    static final class Session {
        final String packageName;
        final long start;
        final long end;

        Session(String packageName, long start, long end) {
            this.packageName = packageName;
            this.start = start;
            this.end = end;
        }

        long durationMillis() {
            return end - start;
        }
    }

    private final UsageStatsManager usageStats;
    private final Set<String> games;

    PlaySessions(Context context, Set<String> games) {
        this.usageStats = (UsageStatsManager) context.getSystemService(Context.USAGE_STATS_SERVICE);
        this.games = games;
    }

    /** @return Sessions of games in the time range, clipped to it, ordered by start. */
    List<Session> sessions(long rangeStart, long rangeEnd) {
        if (usageStats == null || rangeEnd <= rangeStart) {
            return Collections.emptyList();
        }

        List<Session> raw = new ArrayList<>();
        // A session that started before the range has its start event before the range too.
        UsageEvents events = usageStats.queryEvents(rangeStart - SESSION_LOOKBACK_MILLIS, rangeEnd);
        if (events == null) {
            return raw;
        }

        String foreground = null;
        long foregroundStart = 0;
        long pendingEnd = -1;
        UsageEvents.Event event = new UsageEvents.Event();

        while (events.getNextEvent(event)) {
            String packageName = event.getPackageName();
            long time = event.getTimeStamp();
            int type = event.getEventType();

            if (foreground != null && pendingEnd >= 0 && time - pendingEnd > PAUSE_GRACE_MILLIS) {
                raw.add(new Session(foreground, foregroundStart, pendingEnd));
                foreground = null;
                pendingEnd = -1;
            }

            if (type == UsageEvents.Event.ACTIVITY_RESUMED) {
                if (packageName.equals(foreground)) {
                    pendingEnd = -1;
                } else {
                    if (foreground != null) {
                        raw.add(new Session(foreground, foregroundStart, pendingEnd >= 0 ? pendingEnd : time));
                    }
                    foreground = games.contains(packageName) ? packageName : null;
                    foregroundStart = time;
                    pendingEnd = -1;
                }
            } else if (type == UsageEvents.Event.ACTIVITY_PAUSED || type == UsageEvents.Event.ACTIVITY_STOPPED) {
                if (packageName.equals(foreground) && pendingEnd < 0) {
                    pendingEnd = time;
                }
            } else if (type == SCREEN_NON_INTERACTIVE || type == KEYGUARD_SHOWN || type == DEVICE_SHUTDOWN) {
                if (foreground != null) {
                    raw.add(new Session(foreground, foregroundStart, pendingEnd >= 0 ? pendingEnd : time));
                    foreground = null;
                    pendingEnd = -1;
                }
            }
        }

        if (foreground != null) {
            long end = pendingEnd >= 0 ? pendingEnd : Math.min(System.currentTimeMillis(), rangeEnd);
            raw.add(new Session(foreground, foregroundStart, end));
        }

        return merge(raw, rangeStart, rangeEnd);
    }

    /** Foreground time of one game in one of Android's aggregated usage intervals. */
    static final class UsageTotal {
        final String packageName;
        final long intervalStart;
        final long intervalEnd;
        final long playTime;

        UsageTotal(String packageName, long intervalStart, long intervalEnd, long playTime) {
            this.packageName = packageName;
            this.intervalStart = intervalStart;
            this.intervalEnd = intervalEnd;
            this.playTime = playTime;
        }

        long midpoint() {
            return intervalStart + (intervalEnd - intervalStart) / 2;
        }
    }

    /**
     * Foreground time per game and interval from Android's aggregated usage statistics, which are
     * kept far longer than individual events. Used for the time before events start.
     *
     * @param interval  One of the {@link UsageStatsManager} interval types.
     * @param intervalsEndBy Only intervals that ended by this time are returned, so that they do not
     *                  overlap the time covered by individual events.
     */
    List<UsageTotal> aggregatedPlayTime(int interval, long rangeStart, long intervalsEndBy) {
        List<UsageTotal> totals = new ArrayList<>();
        if (usageStats == null || intervalsEndBy <= rangeStart) {
            return totals;
        }

        List<UsageStats> stats = usageStats.queryUsageStats(interval, rangeStart, intervalsEndBy);
        if (stats == null) {
            return totals;
        }
        for (UsageStats stat : stats) {
            long time = stat.getTotalTimeInForeground();
            if (time > 0
                    && games.contains(stat.getPackageName())
                    && stat.getFirstTimeStamp() >= rangeStart
                    && stat.getLastTimeStamp() <= intervalsEndBy) {
                totals.add(new UsageTotal(stat.getPackageName(), stat.getFirstTimeStamp(), stat.getLastTimeStamp(), time));
            }
        }
        return totals;
    }

    /** @return The time of the oldest usage event still kept by Android. */
    long eventsCoverageStart(long searchStart, long now) {
        if (usageStats == null) {
            return now;
        }
        UsageEvents events = usageStats.queryEvents(searchStart, now);
        UsageEvents.Event event = new UsageEvents.Event();
        return events != null && events.getNextEvent(event) ? event.getTimeStamp() : now;
    }

    private static List<Session> merge(List<Session> raw, long rangeStart, long rangeEnd) {
        Map<String, Session> open = new HashMap<>();
        List<Session> merged = new ArrayList<>();

        for (Session session : raw) {
            long start = Math.max(session.start, rangeStart);
            long end = Math.min(session.end, rangeEnd);
            if (end <= start) {
                continue;
            }

            Session previous = open.get(session.packageName);
            if (previous != null && start - previous.end < SESSION_MERGE_GAP_MILLIS) {
                Session extended = new Session(session.packageName, previous.start, Math.max(previous.end, end));
                merged.set(merged.indexOf(previous), extended);
                open.put(session.packageName, extended);
            } else {
                Session clipped = new Session(session.packageName, start, end);
                merged.add(clipped);
                open.put(session.packageName, clipped);
            }
        }

        Collections.sort(merged, (a, b) -> Long.compare(a.start, b.start));
        return merged;
    }
}
