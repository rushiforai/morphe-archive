package app.jofslash.extension.thecryptoapp;

import org.json.JSONException;
import org.json.JSONObject;

/**
 * One user-defined price-alert rule. Fully self-contained; carries no reference to any host-app
 * type. Serialized to/from plain JSON for SharedPreferences storage.
 */
public final class AlertRule {

    public static final String ABOVE = "ABOVE";
    public static final String BELOW = "BELOW";
    /** 24h change rose to at least +target %. */
    public static final String PCT_UP = "PCT_UP";
    /** 24h change fell to at least -target %. */
    public static final String PCT_DOWN = "PCT_DOWN";

    /** Stable id for the notification id and for CRUD by id. */
    public String id;
    /** Binance symbol, e.g. "BTCUSDT". Also used to derive a CoinGecko id for the fallback. */
    public String symbol;
    /** Human label shown in the UI and notification, e.g. "BTC". */
    public String displayName;
    /** For ABOVE/BELOW this is a USD price; for PCT_UP/PCT_DOWN it is a percent magnitude. */
    public double targetPrice;
    /** {@link #ABOVE}, {@link #BELOW}, {@link #PCT_UP} or {@link #PCT_DOWN}. */
    public String direction = ABOVE;
    /** Optional free-text note shown in the row and the notification. */
    public String note = "";
    /** true = fire repeatedly (with cooldown); false = one-time (auto-disables after firing). */
    public boolean repeat = true;
    public boolean enabled = true;
    /** Epoch millis of the last time this rule fired; 0 means armed. Used for the cooldown. */
    public long lastTriggeredAt = 0L;
    /** Last observed price for this rule's symbol. Valid only when {@link #hasLastPrice}. */
    public double lastPrice = 0d;
    public boolean hasLastPrice = false;
    /** Last observed 24h change percent. Valid only when {@link #hasLastPct}. */
    public double lastPct = 0d;
    public boolean hasLastPct = false;
    /** Epoch millis the price was last checked; 0 means never. */
    public long lastCheckedAt = 0L;

    public AlertRule() {
    }

    public AlertRule(String id, String symbol, String displayName, double targetPrice,
                     String direction, boolean enabled) {
        this.id = id;
        this.symbol = symbol;
        this.displayName = displayName;
        this.targetPrice = targetPrice;
        this.direction = direction;
        this.enabled = enabled;
    }

    public boolean isPercent() {
        return PCT_UP.equals(direction) || PCT_DOWN.equals(direction);
    }

    public boolean isUpward() {
        return ABOVE.equals(direction) || PCT_UP.equals(direction);
    }

    /** Whether the rule's condition is met, given the latest price and 24h change percent. */
    public boolean conditionMet(double price, Double pct) {
        switch (direction) {
            case BELOW:
                return price <= targetPrice;
            case PCT_UP:
                return pct != null && pct >= targetPrice;
            case PCT_DOWN:
                return pct != null && pct <= -targetPrice;
            case ABOVE:
            default:
                return price >= targetPrice;
        }
    }

    public JSONObject toJson() throws JSONException {
        JSONObject o = new JSONObject();
        o.put("id", id);
        o.put("symbol", symbol);
        o.put("displayName", displayName);
        o.put("targetPrice", targetPrice);
        o.put("direction", direction);
        o.put("note", note);
        o.put("repeat", repeat);
        o.put("enabled", enabled);
        o.put("lastTriggeredAt", lastTriggeredAt);
        o.put("lastPrice", lastPrice);
        o.put("hasLastPrice", hasLastPrice);
        o.put("lastPct", lastPct);
        o.put("hasLastPct", hasLastPct);
        o.put("lastCheckedAt", lastCheckedAt);
        return o;
    }

    public static AlertRule fromJson(JSONObject o) {
        AlertRule r = new AlertRule();
        r.id = o.optString("id", null);
        r.symbol = o.optString("symbol", "");
        r.displayName = o.optString("displayName", r.symbol);
        r.targetPrice = o.optDouble("targetPrice", 0d);
        r.direction = o.optString("direction", ABOVE);
        r.note = o.optString("note", "");
        r.repeat = o.optBoolean("repeat", true);
        r.enabled = o.optBoolean("enabled", true);
        r.lastTriggeredAt = o.optLong("lastTriggeredAt", 0L);
        r.lastPrice = o.optDouble("lastPrice", 0d);
        r.hasLastPrice = o.optBoolean("hasLastPrice", false);
        r.lastPct = o.optDouble("lastPct", 0d);
        r.hasLastPct = o.optBoolean("hasLastPct", false);
        r.lastCheckedAt = o.optLong("lastCheckedAt", 0L);
        return r;
    }
}
