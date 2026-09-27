package com.travianpatch.notifier;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

/**
 * Decides whether to start a town hall celebration now, using only what the game says: the celebrations
 * it lists (type, culture points, cost, "can be started"), the ones already running, and the village's
 * stock. Starts the chosen size only when the game allows it, nothing is running, the stock covers the
 * cost plus the buffer, and the village's own build queue isn't waiting for resources (buildings come
 * first). Pure logic (no Android APIs).
 */
final class CelebrationPlanner {

    /** The game's REST numbers for a celebration start (its GraphQL says SMALL=0, GREAT=1). */
    static final int REST_SMALL = 1;
    static final int REST_GREAT = 2;

    /** Switches, kept in ActionSender.PREFS: auto celebrations on (default off), great instead of small. */
    static final String KEY_ON = "celebrate_on";
    static final String KEY_GREAT = "celebrate_great";
    /** Per-village status line for the screen. */
    static String notesKey(String villageId) {
        return "celebrate_notes_" + villageId;
    }

    /** The read the worker sends for one village (field names from the game's GraphQL types). */
    static String query(String villageId) {
        return "query { ownVillage(id: " + Integer.parseInt(villageId) + ") { townHall { celebrations { type cp "
                + "canBeStarted celebrationCost { lumber clay iron crop } } ongoingCelebrations { type finishedAt } } } }";
    }

    private CelebrationPlanner() {
    }

    static final class Option {
        /** The game's type name: SMALL or GREAT. */
        final String type;
        final int cp;
        final boolean canBeStarted;
        final BuildQueueAutomation.Resources cost;

        Option(String type, int cp, boolean canBeStarted, BuildQueueAutomation.Resources cost) {
            this.type = type;
            this.cp = cp;
            this.canBeStarted = canBeStarted;
            this.cost = cost;
        }
    }

    static final class TownHall {
        final List<Option> options;
        /** Latest end (epoch seconds) of a running celebration, 0 if none. */
        final long runningUntilSec;

        TownHall(List<Option> options, long runningUntilSec) {
            this.options = options;
            this.runningUntilSec = runningUntilSec;
        }
    }

    static final class Decision {
        /** SMALL or GREAT to start now, or null. */
        final String start;
        final String reason;

        Decision(String start, String reason) {
            this.start = start;
            this.reason = reason;
        }
    }

    /** Reads ownVillage.townHall from the game's answer; null when the village has no town hall. */
    static TownHall parse(JSONObject townHall) {
        if (townHall == null) {
            return null;
        }
        List<Option> options = new ArrayList<Option>();
        JSONArray list = townHall.optJSONArray("celebrations");
        for (int i = 0; list != null && i < list.length(); i++) {
            JSONObject c = list.optJSONObject(i);
            if (c == null) {
                continue;
            }
            JSONObject cost = c.optJSONObject("celebrationCost");
            options.add(new Option(c.optString("type", ""), c.optInt("cp", 0), c.optBoolean("canBeStarted", false),
                    cost == null ? null : new BuildQueueAutomation.Resources(cost.optLong("lumber"),
                            cost.optLong("clay"), cost.optLong("iron"), cost.optLong("crop"))));
        }
        long until = 0;
        JSONArray running = townHall.optJSONArray("ongoingCelebrations");
        for (int i = 0; running != null && i < running.length(); i++) {
            JSONObject r = running.optJSONObject(i);
            if (r != null) {
                until = Math.max(until, r.optLong("finishedAt", 0));
            }
        }
        return new TownHall(options, until);
    }

    /**
     * wanted: SMALL or GREAT (the user's choice). buildQueueWaiting: the village's automatic build queue is on
     * and waiting for resources.
     */
    static Decision decide(TownHall hall, String wanted, BuildQueueAutomation.Resources stock, int bufferPercent,
                           boolean buildQueueWaiting, long nowMs) {
        if (hall == null) {
            return new Decision(null, "no town hall");
        }
        if (hall.runningUntilSec * 1000L > nowMs) {
            return new Decision(null, "a celebration is running");
        }
        Option pick = null;
        for (Option o : hall.options) {
            if (o.type.equalsIgnoreCase(wanted)) {
                pick = o;
            }
        }
        if (pick == null) {
            return new Decision(null, "the game doesn't offer a " + wanted.toLowerCase() + " celebration here");
        }
        if (!pick.canBeStarted) {
            return new Decision(null, "the game says it can't start yet");
        }
        if (pick.cost == null || stock == null) {
            return new Decision(null, "cost or stock not known");
        }
        if (buildQueueWaiting) {
            return new Decision(null, "the build queue is waiting for resources");
        }
        if (!BuildQueueAutomation.affordable(stock, pick.cost, bufferPercent)) {
            return new Decision(null, "not enough resources (with " + bufferPercent + "% buffer)");
        }
        return new Decision(pick.type.toUpperCase(), "start " + pick.type.toLowerCase() + " (+" + pick.cp + " CP)");
    }

    /** The REST number for a type name, or 0 if unknown. */
    static int restType(String type) {
        if ("SMALL".equalsIgnoreCase(type)) {
            return REST_SMALL;
        }
        if ("GREAT".equalsIgnoreCase(type)) {
            return REST_GREAT;
        }
        return 0;
    }
}
