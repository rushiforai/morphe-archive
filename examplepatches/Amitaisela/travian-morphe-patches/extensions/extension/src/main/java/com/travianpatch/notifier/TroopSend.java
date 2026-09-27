package com.travianpatch.notifier;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.Map;

/**
 * Builds the game's own troop send request (/troop/send, a two-step send: see ActionClient.sendTwoStep).
 * Field names and numbers come from the game's code (RestAPI SendTroopsRequestBody / TroopsDataRequest,
 * RallyPoint.AttackType: Raid = 4). Pure logic (no Android APIs).
 */
final class TroopSend {

    static final String KIND = "TROOPS";
    /** Troop escape: the same send, allowed through the attack pause (ActionGuard). */
    static final String ESCAPE_KIND = "ESCAPE";
    static final String PATH = "/troop/send";
    /** The game's event type for a raid (RallyPoint.AttackType.Raid). */
    static final int RAID = 4;
    /** The game's troopType for attack, raid and reinforcement (2 is only for send-home and forward). */
    static final int TROOP_TYPE_DEFAULT = 1;
    static final String[] UNITS = {"t1", "t2", "t3", "t4", "t5", "t6", "t7", "t8", "t9", "t10", "t11"};
    /**
     * Stop after step 1 and show what the game answered. Off since the watched test of 2026-09-26 showed
     * step 1 (PUT) answers 200 with the token in the x-nonce header.
     */
    static final boolean STEP_ONE_ONLY = false;

    private TroopSend() {
    }

    /**
     * Raid a map cell from this village with these units ("t1".."t11", hero = t11). The body is exactly what
     * the game's own rally point sends (SendTroopsCheckout.SendTroops): the target is only the map cell id
     * (MapCell.id), troopType 1 (GetTroopType: 1 for attack/raid/reinforce), and each troop entry holds just
     * the 11 unit counts and useShip. x and y are only for the label and the dedupe key.
     */
    static GameAction raid(String villageId, int targetCellId, int x, int y, Map<String, Integer> units, String label)
            throws Exception {
        return build(KIND, villageId, targetCellId, x, y, units, label, "troops:" + villageId + ":" + x + "|" + y);
    }

    /** Troop escape: a raid on an empty oasis before the attack landing at impactMs (one escape per wave). */
    static GameAction escape(String villageId, int targetCellId, int x, int y, Map<String, Integer> units,
                             long impactMs) throws Exception {
        return build(ESCAPE_KIND, villageId, targetCellId, x, y, units, "Escape to (" + x + "|" + y + ")",
                "escape:" + villageId + ":" + impactMs + ":" + x + "|" + y);
    }

    private static GameAction build(String kind, String villageId, int targetCellId, int x, int y,
                                    Map<String, Integer> units, String label, String dedupeKey) throws Exception {
        if (targetCellId <= 0) {
            throw new IllegalArgumentException("target map cell not known");
        }
        JSONObject troop = new JSONObject();
        int total = 0;
        for (String u : UNITS) {
            Integer n = units.get(u);
            int count = n == null ? 0 : Math.max(0, n);
            troop.put(u, count);
            total += count;
        }
        if (total == 0) {
            throw new IllegalArgumentException("no troops chosen");
        }
        troop.put("useShip", false);
        JSONObject body = new JSONObject()
                .put("action", "troopsSend")
                .put("villageId", Integer.parseInt(villageId))
                .put("troopType", TROOP_TYPE_DEFAULT)
                .put("target", new JSONObject().put("mapId", targetCellId))
                .put("redeployHero", false)
                .put("eventType", RAID)
                .put("troops", new JSONArray().put(troop));
        return new GameAction(kind, villageId, PATH, body, label, dedupeKey);
    }

    /** "arrives in 12 min" from the game's send answer (troops[0].arrivalIn, seconds), or "" if missing. */
    static String arrivalText(String responseBody) {
        try {
            JSONObject t = new JSONObject(responseBody).getJSONArray("troops").getJSONObject(0);
            if (!t.has("arrivalIn") || t.isNull("arrivalIn")) {
                return "";
            }
            long sec = t.getLong("arrivalIn");
            return sec < 60 ? "arrives in " + sec + " s" : "arrives in " + Math.round(sec / 60.0) + " min";
        } catch (Exception e) {
            return "";
        }
    }
}
