package com.travianpatch.notifier;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.Random;

/**
 * The steps before an action, in the order a player goes through them in the game: open the village (the
 * game client's own village read, answered fresh by the game), open the building, press the button. The
 * village read is also checked: a build is only sent when the slot still holds what the screen showed, at
 * the level it showed, and the stock still covers the cost. Pure logic (no Android APIs).
 */
final class ActionSteps {

    private ActionSteps() {
    }

    /**
     * The selection the game client itself asks for when it opens a village (literal in the 4.0.2 client
     * metadata): buildings, resources, the build queue and researched units.
     */
    static final String VILLAGE_VIEW_SELECTION = "id,buildings{id,buildingTypeId,slotId,level,levelUpdateTimestamp,},"
            + "resources{lumberProduction,clayProduction,ironProduction,cropProduction,netCropProduction,freeCrop,"
            + "cropBalance,lumberStock,clayStock,ironStock,cropStock,maxStorageCapacity,maxCropStorageCapacity,},"
            + "buildEvents{id,buildingTypeId,slotId,type,aspiredLevel,timestamp,status,isActive,},"
            + "researchedUnits{id,level,},";

    /** GraphQL request body for "open this village". */
    static String villageViewBody(String villageId) throws Exception {
        long id = Long.parseLong(villageId);
        return new JSONObject().put("query", "query { ownVillage( id: " + id + " ) { " + VILLAGE_VIEW_SELECTION + " } }")
                .toString();
    }

    /** Actions done inside one village (build, train, research, improve): they go through the village steps. */
    static boolean inVillage(String kind) {
        return "BUILD".equals(kind) || "TRAIN".equals(kind) || "RESEARCH".equals(kind) || "IMPROVE".equals(kind)
                || "CELEBRATE".equals(kind) || TroopSend.KIND.equals(kind)
                || TroopSend.ESCAPE_KIND.equals(kind);
    }

    /** Pause ranges in ms: after switching village, after opening the village (opening the building), before pressing. */
    static final long[][] PAUSES = {{1000, 2500}, {1500, 4000}, {600, 1800}};
    static final int AFTER_SWITCH = 0, OPEN_BUILDING = 1, PRESS = 2;

    static long pauseMs(Random random, int step) {
        long[] r = PAUSES[step];
        return r[0] + (long) (random.nextDouble() * (r[1] - r[0]));
    }

    /**
     * Checks the game's fresh answer to the village read. Returns null when the action may go on, else a
     * short reason. Builds are checked against what the screen expected; other actions only need the read to
     * have worked.
     */
    static String check(String responseJson, GameAction action) {
        JSONObject village;
        try {
            JSONObject root = new JSONObject(responseJson);
            JSONObject data = root.optJSONObject("data");
            village = data == null ? null : data.optJSONObject("ownVillage");
            if (village == null) {
                JSONArray errors = root.optJSONArray("errors");
                String msg = errors != null && errors.length() > 0 && errors.optJSONObject(0) != null
                        ? errors.optJSONObject(0).optString("message", "") : "";
                return "the game didn't open the village" + (msg.isEmpty() ? "" : " (" + msg + ")");
            }
        } catch (Exception e) {
            return "the game's answer couldn't be read";
        }
        if (!"BUILD".equals(action.kind) || action.expectFromLevel < 0) {
            return null;
        }
        int typeThere = 0, level = 0;
        JSONArray buildings = village.optJSONArray("buildings");
        for (int i = 0; buildings != null && i < buildings.length(); i++) {
            JSONObject b = buildings.optJSONObject(i);
            if (b != null && b.optInt("slotId") == action.slotId) {
                typeThere = b.optInt("buildingTypeId");
                level = b.optInt("level");
            }
        }
        JSONArray events = village.optJSONArray("buildEvents");
        for (int i = 0; events != null && i < events.length(); i++) {
            JSONObject e = events.optJSONObject(i);
            if (e != null && e.optInt("slotId") == action.slotId) {
                level = Math.max(level, e.optInt("aspiredLevel"));
                if (typeThere == 0) {
                    typeThere = e.optInt("buildingTypeId");
                }
            }
        }
        if (typeThere != 0 && typeThere != action.typeId) {
            return "slot " + action.slotId + " now holds " + GameData.buildingName(typeThere);
        }
        if (level != action.expectFromLevel) {
            return "it is at level " + level + " now, not " + action.expectFromLevel;
        }
        if (action.cost != null) {
            JSONObject r = village.optJSONObject("resources");
            if (r == null) {
                return "the game didn't send the village's resources";
            }
            String miss = Costs.missing(r.optLong("lumberStock"), r.optLong("clayStock"), r.optLong("ironStock"),
                    r.optLong("cropStock"), action.cost[0], action.cost[1], action.cost[2], action.cost[3], 0);
            if (!miss.isEmpty()) {
                return miss;
            }
        }
        return null;
    }
}
