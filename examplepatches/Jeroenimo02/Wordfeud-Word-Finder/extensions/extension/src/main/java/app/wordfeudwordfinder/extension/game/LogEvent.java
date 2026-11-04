package app.wordfeudwordfinder.extension.game;

import org.json.JSONObject;

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
