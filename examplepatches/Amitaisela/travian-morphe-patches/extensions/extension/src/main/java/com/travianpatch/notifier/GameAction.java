package com.travianpatch.notifier;

import org.json.JSONObject;

/** One request that changes something in the game: where it goes, what it sends, and how it is shown. */
final class GameAction {
    /** BUILD, TRAIN, RESEARCH, IMPROVE, FARM_SEND, VILLAGE, CELEBRATE, TROOPS, BID or SELL. */
    final String kind;
    final String villageId;
    /** Path under the game world's API base, e.g. /building/build/26. */
    final String path;
    final JSONObject body;
    /** Plain words for the log and the screen, e.g. "Main Building to 4". */
    final String label;
    /** The same key twice within a minute is refused (ActionGuard). */
    final String dedupeKey;

    /** For BUILD: the slot and type, the level the screen expected there (-1 = don't check) and the cost (or null). */
    final int slotId;
    final int typeId;
    final int expectFromLevel;
    final long[] cost;

    GameAction(String kind, String villageId, String path, JSONObject body, String label, String dedupeKey) {
        this(kind, villageId, path, body, label, dedupeKey, 0, 0, -1, null);
    }

    GameAction(String kind, String villageId, String path, JSONObject body, String label, String dedupeKey,
               int slotId, int typeId, int expectFromLevel, long[] cost) {
        this.kind = kind;
        this.villageId = villageId;
        this.path = path;
        this.body = body;
        this.label = label;
        this.dedupeKey = dedupeKey;
        this.slotId = slotId;
        this.typeId = typeId;
        this.expectFromLevel = expectFromLevel;
        this.cost = cost;
    }
}
