package com.travianpatch.notifier;

import org.json.JSONArray;
import org.json.JSONObject;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

/**
 * Turns the game's incoming-attack movements into alerts. Pure logic (no Android
 * APIs) so it can be checked against sample data off-device.
 *
 * The movement shape matches the game's own query: a village's
 * troops.moving.edges[].node.troopEvent { type, arrivalTime, cellFrom { id x y
 * village { name player { name } } } }.
 */
final class AttackAlerts {

    /**
     * One movement list, aliased so each kind is told apart by which list it came from rather than
     * by guessing at the game's event-type names. Same fields the game's own Rally Point requests.
     */
    private static String moving(String alias, String type, boolean withUnits) {
        return alias + ": moving(first: 20, filter: {types: [" + type + "]}, sortOrder: earliestArrivingFirst) "
                + "{ edges { node { "
                + "troopEvent { type arrivalTime cellFrom { id x y village { name player { name } } } } "
                + (withUnits ? "units { t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 } " : "")
                + "} } } ";
    }

    /** GraphQL selection appended to each village in the poll query: attacks, reinforcements, returning troops. */
    static final String MOVEMENTS_SELECTION = "troops { "
            + moving("attacks", "INCOMING_ATTACK", false)
            + moving("reinforcements", "INCOMING_REINFORCEMENT", true)
            + moving("returning", "INCOMING_RETURNING", true)
            + "}";

    /** Send the "about a minute left" reminder once an attack is this close. */
    static final long REMINDER_LEAD_MS = 90_000L;
    /** Wake this long before arrival so the reminder lands about a minute out. */
    static final long REMINDER_WAKE_BEFORE_MS = 75_000L;

    /** An alert for an attack that arrived this long ago is stale and ignored. */
    private static final long STALE_MS = 60_000L;

    static final class Alert {
        final String key;
        final long arrivalMs;
        final String kind; // "attack" or "raid"
        final String targetVillage;
        final int targetX;
        final int targetY;
        final String originVillage;
        final String originPlayer;
        final int originX;
        final int originY;

        Alert(String key, long arrivalMs, String kind, String targetVillage, int targetX, int targetY,
              String originVillage, String originPlayer, int originX, int originY) {
            this.key = key;
            this.arrivalMs = arrivalMs;
            this.kind = kind;
            this.targetVillage = targetVillage;
            this.targetX = targetX;
            this.targetY = targetY;
            this.originVillage = originVillage;
            this.originPlayer = originPlayer;
            this.originX = originX;
            this.originY = originY;
        }
    }

    private AttackAlerts() {
    }

    /** Incoming attacks found on one village of the poll response (empty if none or not present). */
    static List<Alert> parse(JSONObject village, long nowMs) {
        List<Alert> alerts = new ArrayList<Alert>();
        JSONObject moving = village.optJSONObject("troops") != null
                ? village.optJSONObject("troops").optJSONObject("attacks") : null;
        JSONArray edges = moving != null ? moving.optJSONArray("edges") : null;
        if (edges == null) {
            return alerts;
        }
        String villageId = String.valueOf(village.opt("id"));
        String targetName = village.optString("name", "your village");
        int targetX = village.optInt("x", 0);
        int targetY = village.optInt("y", 0);

        for (int i = 0; i < edges.length(); i++) {
            JSONObject node = edges.optJSONObject(i) != null ? edges.optJSONObject(i).optJSONObject("node") : null;
            JSONObject ev = node != null ? node.optJSONObject("troopEvent") : null;
            if (ev == null) {
                continue;
            }
            long arrivalSec = ev.optLong("arrivalTime", 0);
            long arrivalMs = toMillis(arrivalSec);
            if (arrivalMs <= 0 || arrivalMs < nowMs - STALE_MS) {
                continue;
            }
            JSONObject from = ev.optJSONObject("cellFrom");
            JSONObject fromVillage = from != null ? from.optJSONObject("village") : null;
            JSONObject fromPlayer = fromVillage != null ? fromVillage.optJSONObject("player") : null;
            String originId = from != null ? String.valueOf(from.opt("id")) : "?";
            String key = "atk:" + villageId + ":" + arrivalSec + ":" + originId;
            alerts.add(new Alert(
                    key, arrivalMs, kindOf(ev.optString("type", "")),
                    targetName, targetX, targetY,
                    fromVillage != null ? fromVillage.optString("name", "") : "",
                    fromPlayer != null ? fromPlayer.optString("name", "") : "",
                    from != null ? from.optInt("x", 0) : 0,
                    from != null ? from.optInt("y", 0) : 0));
        }
        return alerts;
    }

    /**
     * True if this village of the poll response carries the attack list at all. When it doesn't (the
     * game answered without the movements), "no attacks listed" must not be read as "they are gone".
     */
    static boolean hasMovementData(JSONObject village) {
        JSONObject troops = village.optJSONObject("troops");
        return troops != null && troops.optJSONObject("attacks") != null;
    }

    /** "Home (1|2)": the attacked village. */
    static String targetLabel(Alert a) {
        return a.targetVillage + " (" + a.targetX + "|" + a.targetY + ")";
    }

    /** "Bob — Enemy (5|6)": who is attacking and from where. */
    static String originLabel(Alert a) {
        String who = a.originPlayer.length() > 0 ? a.originPlayer : "an unknown player";
        return who + (a.originVillage.length() > 0 ? " — " + a.originVillage : "")
                + " (" + a.originX + "|" + a.originY + ")";
    }

    /** "raid" if the game's movement type says so, otherwise "attack". */
    static String kindOf(String type) {
        return type.toUpperCase(Locale.ROOT).contains("RAID") ? "raid" : "attack";
    }

    static String title(Alert a) {
        return "Incoming " + a.kind + "!";
    }

    static String describe(Alert a, long nowMs) {
        String who = a.originPlayer.length() > 0 ? a.originPlayer : "an unknown player";
        StringBuilder sb = new StringBuilder();
        sb.append("On ").append(a.targetVillage).append(" (").append(a.targetX).append('|').append(a.targetY)
                .append(") from ").append(who);
        if (a.originVillage.length() > 0) {
            sb.append(" — ").append(a.originVillage);
        }
        sb.append(" (").append(a.originX).append('|').append(a.originY).append("). Arrives ")
                .append(new SimpleDateFormat("HH:mm:ss", Locale.US).format(new Date(a.arrivalMs)))
                .append(" (in ").append(minutesUntil(a.arrivalMs, nowMs)).append(" min)");
        return sb.toString();
    }

    /** True once the attack is close enough (and not long gone) for the "about a minute left" reminder. */
    static boolean reminderDue(Alert a, long nowMs) {
        long left = a.arrivalMs - nowMs;
        return left <= REMINDER_LEAD_MS && left > -STALE_MS / 2;
    }

    static String reminderTitle(Alert a) {
        return "Incoming " + a.kind + " almost here!";
    }

    static String reminderText(Alert a, long nowMs) {
        long secs = Math.max(0L, (a.arrivalMs - nowMs) / 1000L);
        String who = a.originPlayer.length() > 0 ? a.originPlayer : "an unknown player";
        return "Lands in about " + secs + " s on " + a.targetVillage + " (" + a.targetX + "|" + a.targetY
                + ") — from " + who + (a.originVillage.length() > 0 ? ", " + a.originVillage : "")
                + " (" + a.originX + "|" + a.originY + ")";
    }

    private static long minutesUntil(long arrivalMs, long nowMs) {
        long ms = arrivalMs - nowMs;
        return ms <= 0 ? 0 : (ms + 59_999L) / 60_000L; // round up so "in 0 min" only means arriving now
    }

    /** The API's timestamps are epoch seconds; tolerate milliseconds too. */
    static long toMillis(long ts) {
        if (ts <= 0) {
            return 0;
        }
        return ts > 100_000_000_000L ? ts : ts * 1000L;
    }

    /** When the soonest incoming attack that hasn't landed yet will land (epoch ms), or 0 if none. */
    static long nextArrivalMs(List<Alert> alerts, long nowMs) {
        long best = 0;
        for (Alert a : alerts) {
            if (a.arrivalMs > nowMs && (best == 0 || a.arrivalMs < best)) {
                best = a.arrivalMs;
            }
        }
        return best;
    }
}
