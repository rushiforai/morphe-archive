package app.jofslash.extension.thecryptoapp;

import org.json.JSONException;
import org.json.JSONObject;

/** One manually-entered portfolio holding. Local only; no wallet/exchange connection. */
public final class Holding {
    public String id;
    public String symbol;       // Binance symbol, e.g. BTCUSDT
    public String displayName;  // e.g. BTC
    public double amount;

    public Holding() {
    }

    public Holding(String id, String symbol, String displayName, double amount) {
        this.id = id;
        this.symbol = symbol;
        this.displayName = displayName;
        this.amount = amount;
    }

    public JSONObject toJson() throws JSONException {
        JSONObject o = new JSONObject();
        o.put("id", id);
        o.put("symbol", symbol);
        o.put("displayName", displayName);
        o.put("amount", amount);
        return o;
    }

    public static Holding fromJson(JSONObject o) {
        Holding h = new Holding();
        h.id = o.optString("id", null);
        h.symbol = o.optString("symbol", "");
        h.displayName = o.optString("displayName", h.symbol);
        h.amount = o.optDouble("amount", 0d);
        return h;
    }
}
