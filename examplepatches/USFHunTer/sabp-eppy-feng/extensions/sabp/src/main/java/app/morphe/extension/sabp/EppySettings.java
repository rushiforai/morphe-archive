package app.morphe.extension.sabp;

import android.content.Context;
import android.content.SharedPreferences;

import org.json.JSONObject;

import java.util.Iterator;
import java.util.Map;

/**
 * eppy's own settings as a unit: schema version and migration, backup to / restore from a JSON
 * file, and reset. SABP's data (library, positions, bookmarks, its settings) is never touched.
 */
public final class EppySettings {
    /** Bump when a stored key changes meaning; {@link #migrate} upgrades older stores. */
    public static final int SCHEMA = 2;

    /** Preference files that hold eppy settings (not caches). */
    private static final String[] FILES = {"eppy_ui", "eppy_flags", "eppy_bookinfo", "eppy_readalong"};

    private EppySettings() {
    }

    /**
     * Runs once per start. Migrations only add or rename keys; they never overwrite a value the
     * user set, and defaults are applied at read time rather than written, so an update can't
     * reset anyone's choices.
     */
    public static void migrate(Context c) {
        SharedPreferences ui = c.getSharedPreferences("eppy_ui", Context.MODE_PRIVATE);
        int from = ui.getInt("schema", 1);
        if (from >= SCHEMA) return;
        SharedPreferences.Editor e = ui.edit();
        // 1 → 2: nothing renamed; the mini-player swipe and double-tap settings are new keys
        // that default at read time.
        e.putInt("schema", SCHEMA).apply();
        EppyDiag.log("settings", "migrated eppy settings " + from + " → " + SCHEMA);
    }

    private static boolean isCache(String file, String key) {
        // Book information cache entries and per-book read-along pairings are data, not settings.
        return (file.equals("eppy_bookinfo") && key.startsWith("book:"))
                || (file.equals("eppy_readalong") && (key.startsWith("doc:") || key.startsWith("name:")))
                || key.equals("job") || key.equals("errors");
    }

    /** All eppy settings as JSON: {"eppy": {"schema": n, "files": {file: {key: {t, v}}}}}. */
    public static String export(Context c) throws Exception {
        JSONObject files = new JSONObject();
        for (String f : FILES) {
            JSONObject o = new JSONObject();
            for (Map.Entry<String, ?> en : c.getSharedPreferences(f, Context.MODE_PRIVATE).getAll().entrySet()) {
                if (isCache(f, en.getKey())) continue;
                Object v = en.getValue();
                String type = v instanceof Boolean ? "b" : v instanceof Integer ? "i" : v instanceof Long ? "l"
                        : v instanceof Float ? "f" : v instanceof String ? "s" : null;
                if (type == null) continue;
                o.put(en.getKey(), new JSONObject().put("t", type).put("v", v));
            }
            files.put(f, o);
        }
        JSONObject root = new JSONObject();
        root.put("eppy", new JSONObject()
                .put("schema", SCHEMA)
                .put("version", EppyTheme.configString(c, "eppy_version", "?"))
                .put("files", files));
        return root.toString(2);
    }

    /** Restores settings from {@link #export} output. Returns the number of values restored. */
    public static int restore(Context c, String json) throws Exception {
        JSONObject eppy = new JSONObject(json).getJSONObject("eppy");
        JSONObject files = eppy.getJSONObject("files");
        int n = 0;
        for (String f : FILES) {
            if (!files.has(f)) continue;
            JSONObject o = files.getJSONObject(f);
            SharedPreferences.Editor e = c.getSharedPreferences(f, Context.MODE_PRIVATE).edit();
            for (Iterator<String> it = o.keys(); it.hasNext(); ) {
                String k = it.next();
                if (isCache(f, k)) continue;
                JSONObject en = o.getJSONObject(k);
                switch (en.getString("t")) {
                    case "b": e.putBoolean(k, en.getBoolean("v")); break;
                    case "i": e.putInt(k, en.getInt("v")); break;
                    case "l": e.putLong(k, en.getLong("v")); break;
                    case "f": e.putFloat(k, (float) en.getDouble("v")); break;
                    case "s": e.putString(k, en.getString("v")); break;
                    default: continue;
                }
                n++;
            }
            e.commit();
        }
        migrate(c);
        EppyDiag.log("settings", "restored " + n + " eppy settings from a backup");
        return n;
    }

    /** Resets appearance, behaviour and feature switches; keeps the player-interface choice. */
    public static void reset(Context c) {
        SharedPreferences ui = c.getSharedPreferences("eppy_ui", Context.MODE_PRIVATE);
        String iface = ui.getString("interface", null);
        ui.edit().clear().putInt("schema", SCHEMA).apply();
        if (iface != null) ui.edit().putString("interface", iface).apply();
        c.getSharedPreferences("eppy_flags", Context.MODE_PRIVATE).edit().clear().apply();
        EppyDiag.log("settings", "eppy settings reset (SABP data untouched)");
    }
}
