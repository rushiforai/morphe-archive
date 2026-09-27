package com.travianpatch.notifier;

import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Troop escape: shortly before an attack lands on a village, raid the nearest empty oasis with the troops
 * at home so they are away when it hits and come back by themselves. Decides when to act, which troops
 * go, and (from the game's own step-1 preview) whether they will still be away when the last attack of
 * the wave lands. Travel times come only from the game (troops[0].arrivalIn); nothing is computed from
 * speeds. Pure logic (no Android APIs).
 */
final class EscapePlanner {

    /** Switches and numbers, kept in ActionSender.PREFS. */
    static final String KEY_ON = "escape_on";
    static final String KEY_LEAD_MIN = "escape_lead_min";
    static final String KEY_HERO = "escape_hero";
    static final String KEY_MIN_ATTACK = "escape_min_attack";
    /** Impact times already handled (escaped or given up), so one wave is acted on once. */
    static final String KEY_DONE = "escape_done";

    static final int DEFAULT_LEAD_MIN = 5;
    /** Attacks landing within this long after the first one count as the same wave. */
    static final long WAVE_MS = 10 * 60_000L;
    /** Troops must still be away this long after the wave's last attack. */
    static final long SAFETY_MS = 60_000L;
    /** The nearest empty oases tried, one step-1 preview each (step 1 sends nothing). */
    static final int MAX_TRIES = 3;
    /** Unit slots moved; t10 (settlers) stays home. t11 is the hero. */
    static final String[] MOVED = {"t1", "t2", "t3", "t4", "t5", "t6", "t7", "t8", "t9"};

    private EscapePlanner() {
    }

    static final class Settings {
        final boolean on;
        final int leadMinutes;
        final boolean includeHero;
        /** Act only when the game's total incoming attack power on the village is at least this (0 = always). */
        final int minAttackPower;

        Settings(boolean on, int leadMinutes, boolean includeHero, int minAttackPower) {
            this.on = on;
            this.leadMinutes = leadMinutes;
            this.includeHero = includeHero;
            this.minAttackPower = minAttackPower;
        }
    }

    /** What the worker should do for one village now. */
    static final class Plan {
        /** "none", "wait" or "go". */
        final String step;
        /** For "wait": when to check again (epoch ms). */
        final long wakeAtMs;
        /** The wave: first and last landing (epoch ms). */
        final long firstImpactMs;
        final long lastImpactMs;
        final String reason;

        Plan(String step, long wakeAtMs, long firstImpactMs, long lastImpactMs, String reason) {
            this.step = step;
            this.wakeAtMs = wakeAtMs;
            this.firstImpactMs = firstImpactMs;
            this.lastImpactMs = lastImpactMs;
            this.reason = reason;
        }
    }

    /**
     * arrivals: landing times (epoch ms) of attacks and raids on this village. handled: first-impact times
     * already acted on.
     */
    static Plan plan(Settings s, List<Long> arrivals, long nowMs, List<Long> handled) {
        if (s == null || !s.on) {
            return new Plan("none", 0, 0, 0, "escape is off");
        }
        List<Long> ahead = new ArrayList<Long>();
        for (Long t : arrivals) {
            if (t != null && t > nowMs) {
                ahead.add(t);
            }
        }
        if (ahead.isEmpty()) {
            return new Plan("none", 0, 0, 0, "no attack coming");
        }
        Collections.sort(ahead);
        long first = ahead.get(0);
        long last = first;
        for (Long t : ahead) {
            if (t - first <= WAVE_MS) {
                last = Math.max(last, t);
            }
        }
        if (handled != null && handled.contains(first)) {
            return new Plan("none", 0, first, last, "this attack was already handled");
        }
        long leadMs = Math.max(1, s.leadMinutes) * 60_000L;
        if (first - nowMs > leadMs) {
            return new Plan("wait", first - leadMs, first, last, "attack lands in " + ((first - nowMs) / 60_000L)
                    + " min; acting " + s.leadMinutes + " min before");
        }
        return new Plan("go", 0, first, last, "attack lands in " + Math.max(0, (first - nowMs) / 1000) + " s");
    }

    /**
     * The units to move from the game's ownTroopsAtTown.units: t1..t9 as they are, plus the hero (t11) when
     * asked. Empty when there is nothing to move.
     */
    static Map<String, Integer> unitsToMove(JSONObject units, boolean includeHero) {
        Map<String, Integer> out = new LinkedHashMap<String, Integer>();
        if (units == null) {
            return out;
        }
        for (String u : MOVED) {
            int n = units.optInt(u, 0);
            if (n > 0) {
                out.put(u, n);
            }
        }
        if (includeHero && units.optInt("t11", 0) > 0) {
            out.put("t11", 1);
        }
        return out;
    }

    static int total(Map<String, Integer> units) {
        int n = 0;
        for (Integer v : units.values()) {
            n += v == null ? 0 : v;
        }
        return n;
    }

    /**
     * Checks the game's step-1 preview before confirming: the troops must be back no earlier than the wave's
     * last attack plus a safety minute (they return after twice the one-way time). Returns null when fine,
     * else the reason not to confirm this oasis.
     */
    static String previewProblem(String previewBody, long nowMs, long lastImpactMs) {
        long oneWaySec;
        try {
            JSONObject t = new JSONObject(previewBody).getJSONArray("troops").getJSONObject(0);
            if (!t.has("arrivalIn") || t.isNull("arrivalIn")) {
                return "the game's preview has no travel time";
            }
            oneWaySec = t.getLong("arrivalIn");
        } catch (Exception e) {
            return "the game's preview couldn't be read";
        }
        long backMs = nowMs + 2 * oneWaySec * 1000L;
        if (backMs < lastImpactMs + SAFETY_MS) {
            return "too close: back " + ((lastImpactMs + SAFETY_MS - backMs) / 1000) + " s before it's safe";
        }
        return null;
    }

    /** Parses the handled list ("123,456"); keeps only times from the last day. */
    static List<Long> handled(String saved, long nowMs) {
        List<Long> out = new ArrayList<Long>();
        if (saved == null || saved.isEmpty()) {
            return out;
        }
        for (String part : saved.split(",")) {
            try {
                long t = Long.parseLong(part.trim());
                if (nowMs - t < 24 * 3_600_000L) {
                    out.add(t);
                }
            } catch (NumberFormatException ignored) {
                // skip a damaged entry
            }
        }
        return out;
    }

    static String withHandled(List<Long> handled, long impactMs) {
        StringBuilder b = new StringBuilder();
        for (Long t : handled) {
            b.append(t).append(',');
        }
        return b.append(impactMs).toString();
    }
}
