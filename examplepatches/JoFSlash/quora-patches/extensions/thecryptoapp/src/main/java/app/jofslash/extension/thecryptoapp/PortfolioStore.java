package app.jofslash.extension.thecryptoapp;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/** SharedPreferences-backed CRUD for portfolio {@link Holding}s. Own prefs file/key. */
public final class PortfolioStore {

    static final String TAG = CustomAlerts.TAG;
    private static final String PREFS = "jofslash_crypto_portfolio";
    private static final String KEY = "holdings";

    private PortfolioStore() {
    }

    private static SharedPreferences prefs(Context ctx) {
        return ctx.getApplicationContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    public static synchronized List<Holding> load(Context ctx) {
        List<Holding> list = new ArrayList<>();
        try {
            JSONArray arr = new JSONArray(prefs(ctx).getString(KEY, "[]"));
            for (int i = 0; i < arr.length(); i++) {
                JSONObject o = arr.optJSONObject(i);
                if (o != null) list.add(Holding.fromJson(o));
            }
        } catch (Throwable t) {
            Log.e(TAG, "portfolio: load failed", t);
        }
        return list;
    }

    public static synchronized void save(Context ctx, List<Holding> list) {
        try {
            JSONArray arr = new JSONArray();
            for (Holding h : list) arr.put(h.toJson());
            prefs(ctx).edit().putString(KEY, arr.toString()).apply();
        } catch (Throwable t) {
            Log.e(TAG, "portfolio: save failed", t);
        }
    }

    public static synchronized void add(Context ctx, String symbol, String displayName, double amount) {
        List<Holding> list = load(ctx);
        list.add(new Holding(UUID.randomUUID().toString(), symbol, displayName, amount));
        save(ctx, list);
        Log.i(TAG, "portfolio: added " + displayName + " x" + amount);
    }

    public static synchronized void delete(Context ctx, String id) {
        List<Holding> list = load(ctx);
        List<Holding> kept = new ArrayList<>();
        for (Holding h : list) if (h.id == null || !h.id.equals(id)) kept.add(h);
        save(ctx, kept);
    }
}
