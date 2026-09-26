package com.travianpatch.notifier;

import org.json.JSONObject;

/** One request that changes something in the game: where it goes, what it sends, and how it is shown. */
final class GameAction {
    /** BUILD, TRAIN, RESEARCH, IMPROVE, FARM_SEND or VILLAGE. */
    final String kind;
    final String villageId;
    /** Path under the game world's API base, e.g. /building/build/26. */
    final String path;
    final JSONObject body;
    /** Plain words for the log and the screen, e.g. "Main Building to 4". */
    final String label;
    /** The same key twice within a minute is refused (ActionGuard). */
    final String dedupeKey;

    GameAction(String kind, String villageId, String path, JSONObject body, String label, String dedupeKey) {
        this.kind = kind;
        this.villageId = villageId;
        this.path = path;
        this.body = body;
        this.label = label;
        this.dedupeKey = dedupeKey;
    }
}
