package com.travianpatch.notifier;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.Map;

/**
 * Builds the exact requests the game's own client sends. Paths and JSON field names are taken from the
 * game's code (its REST models, see the research notes); nothing here spends gold: the "master builder"
 * flag is always false. Pure logic (no Android APIs) so it can be checked off-device.
 */
final class GameActions {

    private GameActions() {
    }

    /** Upgrade the building on this slot, or build type typeId on an empty slot. Uses the game's current village. */
    static GameAction build(String villageId, int slotId, int typeId, String label) throws Exception {
        JSONObject body = new JSONObject().put("action", "build").put("buildingId", typeId).put("masterBuilder", false);
        return new GameAction("BUILD", villageId, "/building/build/" + slotId, body, label,
                "build:" + villageId + ":" + slotId + ":" + typeId);
    }

    /**
     * Like build(), plus what the screen expected: the level on that slot now (0 for an empty slot) and the
     * game's cost, so the send is stopped if the game's fresh village data says otherwise (ActionSteps).
     */
    static GameAction build(String villageId, int slotId, int typeId, String label, int fromLevel,
                            BuildingRules.Level cost) throws Exception {
        GameAction plain = build(villageId, slotId, typeId, label);
        return new GameAction(plain.kind, villageId, plain.path, plain.body, label, plain.dedupeKey, slotId, typeId,
                fromLevel, cost == null ? null : new long[]{cost.lumber, cost.clay, cost.iron, cost.crop});
    }

    /** Train troops in the building on this slot (barracks, stable, ...). Counts of 0 are left out. */
    static GameAction train(String villageId, int slotId, Map<String, Integer> units, String label) throws Exception {
        JSONObject set = new JSONObject();
        StringBuilder key = new StringBuilder("train:" + villageId + ":" + slotId);
        for (Map.Entry<String, Integer> e : units.entrySet()) {
            if (e.getValue() != null && e.getValue() > 0) {
                set.put(e.getKey(), e.getValue().intValue());
                key.append(':').append(e.getKey()).append('=').append(e.getValue());
            }
        }
        JSONObject body = new JSONObject().put("action", "trainTroops").put("units", set);
        return new GameAction("TRAIN", villageId, "/building/" + slotId + "/train", body, label, key.toString());
    }

    /** Research a unit ("t1".."t10") in the village's Academy. */
    static GameAction research(String villageId, String unit, String label) throws Exception {
        JSONObject body = new JSONObject().put("action", "research").put("unit", unit)
                .put("villageId", Integer.parseInt(villageId));
        return new GameAction("RESEARCH", villageId, "/units/research", body, label, "research:" + villageId + ":" + unit);
    }

    /** Improve a unit ("t1".."t8") in the village's Smithy. The game's own request says "research" here too. */
    static GameAction improve(String villageId, String unit, String label) throws Exception {
        JSONObject body = new JSONObject().put("action", "research").put("unit", unit)
                .put("villageId", Integer.parseInt(villageId));
        return new GameAction("IMPROVE", villageId, "/units/improve", body, label, "improve:" + villageId + ":" + unit);
    }

    /** Start these farm lists (all their targets). */
    static GameAction farmSend(long[] listIds, String label) throws Exception {
        JSONArray lists = new JSONArray();
        StringBuilder key = new StringBuilder("farm");
        for (long id : listIds) {
            lists.put(new JSONObject().put("id", id));
            key.append(':').append(id);
        }
        JSONObject body = new JSONObject().put("action", "farmList").put("lists", lists);
        return new GameAction("FARM_SEND", "", "/farm-list/send", body, label, key.toString());
    }

    /** Start a town hall celebration: type SMALL or GREAT (sent as the game's number, see CelebrationPlanner). */
    static GameAction celebrate(String villageId, String type) throws Exception {
        int number = CelebrationPlanner.restType(type);
        if (number == 0) {
            throw new IllegalArgumentException("unknown celebration type: " + type);
        }
        JSONObject body = new JSONObject().put("action", "celebration").put("type", number);
        return new GameAction("CELEBRATE", villageId, "/village/" + Integer.parseInt(villageId) + "/celebrations/start",
                body, (number == CelebrationPlanner.REST_GREAT ? "Great" : "Small") + " celebration",
                "celebrate:" + villageId);
    }

    /** Make this village the game's current village (build and train act on the current village). */
    static GameAction changeVillage(String villageId) throws Exception {
        JSONObject body = new JSONObject().put("newVillageId", Integer.parseInt(villageId));
        return new GameAction("VILLAGE", villageId, "/village/change-current", body, "Switch to village " + villageId,
                "village:" + villageId + ":" + System.nanoTime());
    }
}
