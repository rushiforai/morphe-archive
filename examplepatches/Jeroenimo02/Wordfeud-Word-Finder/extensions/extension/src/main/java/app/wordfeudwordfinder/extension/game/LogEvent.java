package app.wordfeudwordfinder.extension.game;

import org.json.JSONObject;

/**
 * One entry of a game's {@code game_log} (games/detail with {@code game_format=log}): its {@code type} (start,
 * packed_move, swap, pass, resign, timeout) and the raw JSON, interpreted by {@link GameReplay}.
 */
public final class LogEvent {
    private final String type;
    private final JSONObject raw;

    public LogEvent(String type, JSONObject raw) {
        this.type = type;
        this.raw = raw;
    }

    public String getType() { return type; }
    public JSONObject getRaw() { return raw; }
}
