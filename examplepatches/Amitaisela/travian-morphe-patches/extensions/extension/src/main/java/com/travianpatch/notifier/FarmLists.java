package com.travianpatch.notifier;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

/**
 * The player's farm lists as the game reports them (field names from the game's own FarmList type).
 * lastStartedTime is read as epoch seconds (an int in the game's type). Pure logic (no Android APIs).
 */
final class FarmLists {

    static final String QUERY = "query { ownPlayer { farmLists { id name ownerVillage { id } slotsAmount "
            + "runningRaidsAmount isExpanded sortIndex lastStartedTime useShip onlyLosses } } }";

    private FarmLists() {
    }

    static final class FarmList {
        final long id;
        final String name;
        final String villageId;
        final int slots;
        final int running;
        /** 0 = never started. */
        final long lastStartedMs;
        final boolean onlyLosses;

        FarmList(long id, String name, String villageId, int slots, int running, long lastStartedMs, boolean onlyLosses) {
            this.id = id;
            this.name = name;
            this.villageId = villageId;
            this.slots = slots;
            this.running = running;
            this.lastStartedMs = lastStartedMs;
            this.onlyLosses = onlyLosses;
        }
    }

    /** Reads the ownPlayer object's JSON text; empty for null or unreadable input, never throws. */
    static List<FarmList> parse(String ownPlayerJson) {
        List<FarmList> out = new ArrayList<FarmList>();
        if (ownPlayerJson == null) {
            return out;
        }
        try {
            JSONArray lists = new JSONObject(ownPlayerJson).optJSONArray("farmLists");
            if (lists == null) {
                return out;
            }
            for (int i = 0; i < lists.length(); i++) {
                JSONObject l = lists.optJSONObject(i);
                if (l == null || !l.has("id")) {
                    continue;
                }
                JSONObject village = l.optJSONObject("ownerVillage");
                long started = l.isNull("lastStartedTime") ? 0 : l.optLong("lastStartedTime", 0);
                out.add(new FarmList(l.optLong("id"), l.optString("name", "Farm list"),
                        village == null ? "" : String.valueOf(village.opt("id")), l.optInt("slotsAmount", 0),
                        l.optInt("runningRaidsAmount", 0), started * 1000L,
                        !l.isNull("onlyLosses") && l.optBoolean("onlyLosses", false)));
            }
        } catch (Exception e) {
            return new ArrayList<FarmList>();
        }
        return out;
    }
}
