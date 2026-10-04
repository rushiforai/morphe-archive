package app.spicetify.extension.spotify.theme;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;
import java.io.File;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

/** The theme selected in Spicetify settings, saved on this device. */
public final class ThemeState {
    /** Colors picked in settings: a background, surface and accent saved as the main, card and button roles. */
    public static final String CUSTOM = "custom";
    /** A Spicetify color scheme pasted in settings, saved as the role colors it resolved to. */
    public static final String SCHEME = "scheme";
    private static final String FILE = "spicetify_theme";
    /** Where the 1.0 releases saved the theme: a named theme's key, and the colors picked for it. */
    private static final String PREVIOUS_FILE = "spicetify_patch_settings";
    private static final String[] PREVIOUS_KEYS = {"theme_preset", "theme_background", "theme_surface", "theme_accent"};
    /** Where the 1.0 releases wrote their resource tables, in the no-backup files. */
    private static final String PREVIOUS_TABLES = "spicetify-theme";

    public static final class Selection {
        /** One of the {@link ThemePresets} kinds, {@link #CUSTOM} or {@link #SCHEME}. */
        public final String kind;
        public final String label;
        /** Role colors of custom colors or a scheme; empty for presets, which are computed when applied. */
        public final Map<String, Integer> colors;

        public Selection(String kind, String label, Map<String, Integer> colors) {
            this.kind = kind;
            this.label = label;
            this.colors = Collections.unmodifiableMap(new LinkedHashMap<>(colors));
        }

        public static Selection preset(String kind, String label) {
            return new Selection(kind, label, Collections.emptyMap());
        }
    }

    private ThemeState() {}

    public static Selection load(Context context) {
        SharedPreferences preferences = preferences(context);
        Map<String, Integer> colors = new LinkedHashMap<>();
        try {
            JSONObject saved = new JSONObject(preferences.getString("colors", "{}"));
            for (Iterator<String> keys = saved.keys(); keys.hasNext(); ) {
                String key = keys.next();
                colors.put(key, (int) saved.getLong(key));
            }
        } catch (JSONException corrupted) {
            colors.clear();
        }
        return new Selection(preferences.getString("kind", ThemePresets.STOCK),
                preferences.getString("label", "Spotify"), colors);
    }

    /**
     * Moves a theme saved by the 1.0 releases into this state, then removes it there, with the resource
     * tables they wrote. A named theme keeps its kind, and picked colors become custom colors. A theme
     * already chosen here stays.
     */
    static void migrate(Context context) {
        SharedPreferences previous = context.getApplicationContext().getSharedPreferences(PREVIOUS_FILE, Context.MODE_PRIVATE);
        boolean saved = false;
        for (String key : PREVIOUS_KEYS) saved |= previous.contains(key);
        if (saved) {
            try {
                Selection selection = previous(previous);
                if (selection != null && !preferences(context).contains("kind")) save(context, selection);
            } catch (RuntimeException unreadable) {
                // A key of another type: that theme is lost, but its keys still go, so this happens once.
                Log.w("Spicetify", "The theme saved by version 1.0 could not be read", unreadable);
            }
            SharedPreferences.Editor editor = previous.edit();
            for (String key : PREVIOUS_KEYS) editor.remove(key);
            editor.apply();
        }
        // Nothing loads those tables now. The 1.0 releases deleted stale ones the same way.
        File directory = new File(context.getNoBackupFilesDir(), PREVIOUS_TABLES);
        File[] tables = directory.listFiles((dir, name) -> name.startsWith("colors-") && name.endsWith(".arsc"));
        if (tables == null) return;
        for (File table : tables) table.delete();
        directory.delete();
    }

    /** The theme the 1.0 releases saved, or null for Spotify's own colors. */
    private static Selection previous(SharedPreferences previous) {
        String kind = previous.getString("theme_preset", null);
        for (ThemePresets.Preset preset : ThemePresets.ALL) {
            if (preset.kind.equals(kind)) return Selection.preset(preset.kind, preset.name);
        }
        // "custom", a theme this version doesn't know, or colors saved before named themes existed.
        Integer background = color(previous, PREVIOUS_KEYS[1]);
        Integer surface = color(previous, PREVIOUS_KEYS[2]);
        Integer accent = color(previous, PREVIOUS_KEYS[3]);
        // Those releases derived a surface the colors left out from the background.
        if (surface == null && background != null) surface = ArgbColors.lighten(background, 22);
        Map<String, Integer> colors = new LinkedHashMap<>();
        if (background != null) colors.put("main", background);
        if (surface != null) colors.put("card", surface);
        if (accent != null) colors.put("button", accent);
        return colors.isEmpty() ? null : new Selection(CUSTOM, "Custom", colors);
    }

    private static Integer color(SharedPreferences preferences, String key) {
        return preferences.contains(key) ? preferences.getInt(key, 0) : null;
    }

    static void save(Context context, Selection selection) {
        JSONObject colors = new JSONObject();
        try {
            for (Map.Entry<String, Integer> color : selection.colors.entrySet()) {
                colors.put(color.getKey(), color.getValue() & 0xFFFFFFFFL);
            }
        } catch (JSONException impossible) {
            throw new IllegalStateException(impossible);
        }
        preferences(context).edit().putString("kind", selection.kind).putString("label", selection.label)
                .putString("colors", colors.toString()).apply();
    }

    private static SharedPreferences preferences(Context context) {
        return context.getApplicationContext().getSharedPreferences(FILE, Context.MODE_PRIVATE);
    }
}
