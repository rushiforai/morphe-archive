package com.travianpatch.notifier;

import org.json.JSONObject;

import java.util.Random;

/**
 * When a farm list's timer is due: every intervalMinutes plus a random spread (stable for one send, so it
 * doesn't change between checks), never in quiet hours, not while its raids are still out unless the user
 * allows it, never when off or paused. A list missed while the phone slept is sent once, not "caught up".
 * Pure logic (no Android APIs).
 */
final class FarmScheduler {

    private FarmScheduler() {
    }

    static final class Plan {
        final long listId;
        final boolean enabled;
        final int intervalMinutes;
        final int spreadMinutes;
        final boolean sendWhileRunning;
        final boolean paused;

        Plan(long listId, boolean enabled, int intervalMinutes, int spreadMinutes, boolean sendWhileRunning,
             boolean paused) {
            this.listId = listId;
            this.enabled = enabled;
            this.intervalMinutes = intervalMinutes;
            this.spreadMinutes = spreadMinutes;
            this.sendWhileRunning = sendWhileRunning;
            this.paused = paused;
        }

        String toJson() {
            try {
                return new JSONObject().put("id", listId).put("on", enabled).put("every", intervalMinutes)
                        .put("spread", spreadMinutes).put("whileRunning", sendWhileRunning).put("paused", paused)
                        .toString();
            } catch (Exception e) {
                return "{}";
            }
        }

        /** Off, every 60 min, 10 min spread, not while raids are out: the defaults for a new timer. */
        static Plan defaults(long listId) {
            return new Plan(listId, false, 60, 10, false, false);
        }

        static Plan fromJson(String json) {
            try {
                JSONObject o = new JSONObject(json);
                return new Plan(o.getLong("id"), o.optBoolean("on", false), Math.max(5, o.optInt("every", 60)),
                        Math.max(0, o.optInt("spread", 10)), o.optBoolean("whileRunning", false),
                        o.optBoolean("paused", false));
            } catch (Exception e) {
                return null;
            }
        }
    }

    /** The random extra wait for the send after lastSentMs; the same inputs always give the same answer. */
    static long spreadMs(Plan p, long lastSentMs) {
        if (p.spreadMinutes <= 0) {
            return 0;
        }
        Random r = new Random(p.listId * 31 + lastSentMs);
        return (long) (r.nextDouble() * p.spreadMinutes * 60_000L);
    }

    static boolean due(FarmLists.FarmList list, Plan p, long lastSentMs, long nowMs, boolean quiet) {
        if (p == null || !p.enabled || p.paused || quiet) {
            return false;
        }
        if (list.running > 0 && !p.sendWhileRunning) {
            return false;
        }
        if (lastSentMs <= 0) {
            return true;
        }
        return nowMs >= lastSentMs + p.intervalMinutes * 60_000L + spreadMs(p, lastSentMs);
    }
}
