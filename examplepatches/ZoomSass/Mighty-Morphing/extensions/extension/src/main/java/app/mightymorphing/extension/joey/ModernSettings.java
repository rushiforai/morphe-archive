package app.mightymorphing.extension.joey;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;

import org.json.JSONObject;

import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/**
 * Modern UI's own copy of Joey's layout settings.
 *
 * Joey opens each settings file once (za.a, mb.o, mb.b, mb.j, mb.i). The patch wraps what it
 * gets back. While Modern is on, the keys listed here are read from and written to Modern's
 * copy; every other key, and every key in Classic, goes to Joey's own file as before. So a
 * setting changed in Modern never changes Classic, and Modern can be reset without touching it.
 *
 * The copy starts as a snapshot of the user's values, so nothing changes on update. After that
 * it stands on its own: a key missing from the copy reads as Joey's default.
 */
public final class ModernSettings {
    static final String COPY = "morphe_modern_joey";
    private static final String MIGRATED = "__copied";
    private static final String KEY_UNDO = "modern_layout_undo";

    /** Joey's layout settings, by file. Immersive and bottom navigation stay shared on purpose. */
    static final Map<String, Set<String>> KEYS = new HashMap<>();

    static {
        KEYS.put("settings", set(
                "RightThumbnail", "showLargeThubmnail", "PREF_SUBMISSION_IMAGE_STYLE",
                "PREF_SUBMISSION_CARD_VIEW_TYPE", "PREF_SUBMISSION_TITLE_ABOVE", "PREF_SHOW_TAB_LAYOUT",
                "firstParaSelftext", "authorInInfo", "domainInInfo", "postSaveAsAction", "PREF_HIDE_AS_ACTION",
                "PREF_SHORT_COMMENT_COUNT", "PREF_SHORT_SCORE", "PREF_SHOW_DOMAIN_IN_PREVIEW",
                "PREF_COMMENT_ACTION_ALWAYS_SHOW", "PREF_SHOW_COMMENT_NAVIGATOR",
                "PREF_SUBMISSION_COLUMN_COUNT_PORTRAIT", "PREF_SUBMISSION_COLUMN_COUNT_LANDSCAPE"));
        KEYS.put("submission_preferences", set(
                "PREF_THUMBNAIL_SIZE", "PREF_THUMBNAIL_ROUND", "SHOW_SUBREDDIT_ICON", "SUBREDDIT_ICON_SIZE",
                "PREF_POST_INFO_ABOVE_IMAGE", "PREF_PREVIEW_TEXT_LINE_COUNT", "PREF_LIST_LAYOUT_GAP",
                "PREF_COMPACT_THUMB_ACTION_BAR", "PREF_SAA_COMMENT_SCREENT_POST_STYLE", "SHOW_POST_FLAIR",
                "SHOW_POST_AUTHOR_FLAIR", "PLAINTEXT_POST_FLAIR", "PLAINTEXT_POST_AUTHOR_FLAIR",
                "PREF_SHOW_CONTENT_TYPE_ICON", "PREF_SHOW_NEW_COMMENT_COUNT", "PREF_SHOW_SHARE_AS_ACTION",
                "PERF_SHOW_SINGLE_COLUMN_BOTTOMSHEET", "SHOULD_DISPLAY_AWARD_ICON", "SHOULD_DISPLAY_AWARD_TOTALS",
                "SHOULD_DISPLAY_COIN_TOTAL_OF_AWARDS", "SHOULD_DISPLAY_NO_AWARDS", "MIN_COIN_VALUE_FOR_AWARDS"));
        KEYS.put("comment_preferences", set(
                "PREF_DEFAULT_INDENT_WIDTH", "COMMENT_PROFILE_PIC_SIZE", "PREF_SHOW_FAB"));
        KEYS.put("link_prefs", set(
                "PREF_ENLARGE_LINKS", "PREF_LINK_DOMAIN_SHOW", "PERF_SHOW_LINK_PREVIEW"));
        KEYS.put("left_drawer_prefs", set(
                "SHOULD_EXPAND_FAVORITES", "SHOULD_EXPAND_GOTO", "SHOULD_EXPAND_MULTIREDDITS",
                "SHOULD_EXPAND_MY_PROFILE", "SHOULD_EXPAND_OC", "SHOULD_EXPAND_PROFILES",
                "SHOULD_HIDE_CHAT", "SHOULD_HIDE_OC", "SHOULD_HIDE_REPORT_BUG"));
    }

    /** Joey 2.1.6.5's own defaults for these keys, read from its code. Used only to label the report. */
    private static final Map<String, String> JOEY_DEFAULTS = new HashMap<>();

    static {
        JOEY_DEFAULTS.put("RightThumbnail", "true");
        JOEY_DEFAULTS.put("showLargeThubmnail", "false");
        JOEY_DEFAULTS.put("PREF_SUBMISSION_IMAGE_STYLE", "FULL_HEIGHT");
        JOEY_DEFAULTS.put("PREF_SUBMISSION_CARD_VIEW_TYPE", "LIST");
        JOEY_DEFAULTS.put("PREF_SUBMISSION_TITLE_ABOVE", "false");
        JOEY_DEFAULTS.put("PREF_SHOW_TAB_LAYOUT", "true");
        JOEY_DEFAULTS.put("firstParaSelftext", "false");
        JOEY_DEFAULTS.put("authorInInfo", "true");
        JOEY_DEFAULTS.put("domainInInfo", "true");
        JOEY_DEFAULTS.put("postSaveAsAction", "false");
        JOEY_DEFAULTS.put("PREF_HIDE_AS_ACTION", "false");
        JOEY_DEFAULTS.put("PREF_SHORT_COMMENT_COUNT", "true");
        JOEY_DEFAULTS.put("PREF_SHORT_SCORE", "true");
        JOEY_DEFAULTS.put("PREF_SHOW_DOMAIN_IN_PREVIEW", "false");
        JOEY_DEFAULTS.put("PREF_COMMENT_ACTION_ALWAYS_SHOW", "false");
        JOEY_DEFAULTS.put("PREF_SHOW_COMMENT_NAVIGATOR", "true");
        JOEY_DEFAULTS.put("PREF_SUBMISSION_COLUMN_COUNT_PORTRAIT", "set by screen size");
        JOEY_DEFAULTS.put("PREF_SUBMISSION_COLUMN_COUNT_LANDSCAPE", "set by screen size");
        JOEY_DEFAULTS.put("PREF_THUMBNAIL_SIZE", "64");
        JOEY_DEFAULTS.put("PREF_THUMBNAIL_ROUND", "24");
        JOEY_DEFAULTS.put("SHOW_SUBREDDIT_ICON", "true");
        JOEY_DEFAULTS.put("SUBREDDIT_ICON_SIZE", "32");
        JOEY_DEFAULTS.put("PREF_POST_INFO_ABOVE_IMAGE", "false");
        JOEY_DEFAULTS.put("PREF_PREVIEW_TEXT_LINE_COUNT", "-1");
        JOEY_DEFAULTS.put("PREF_LIST_LAYOUT_GAP", "12");
        JOEY_DEFAULTS.put("PREF_COMPACT_THUMB_ACTION_BAR", "true");
        JOEY_DEFAULTS.put("PREF_SAA_COMMENT_SCREENT_POST_STYLE", "false");
        JOEY_DEFAULTS.put("SHOW_POST_FLAIR", "true");
        JOEY_DEFAULTS.put("SHOW_POST_AUTHOR_FLAIR", "true");
        JOEY_DEFAULTS.put("PLAINTEXT_POST_FLAIR", "false");
        JOEY_DEFAULTS.put("PLAINTEXT_POST_AUTHOR_FLAIR", "false");
        JOEY_DEFAULTS.put("PREF_SHOW_CONTENT_TYPE_ICON", "true");
        JOEY_DEFAULTS.put("PREF_SHOW_NEW_COMMENT_COUNT", "true");
        JOEY_DEFAULTS.put("PREF_SHOW_SHARE_AS_ACTION", "false");
        JOEY_DEFAULTS.put("PERF_SHOW_SINGLE_COLUMN_BOTTOMSHEET", "false");
        JOEY_DEFAULTS.put("SHOULD_DISPLAY_AWARD_ICON", "false");
        JOEY_DEFAULTS.put("SHOULD_DISPLAY_AWARD_TOTALS", "true");
        JOEY_DEFAULTS.put("SHOULD_DISPLAY_COIN_TOTAL_OF_AWARDS", "false");
        JOEY_DEFAULTS.put("SHOULD_DISPLAY_NO_AWARDS", "false");
        JOEY_DEFAULTS.put("MIN_COIN_VALUE_FOR_AWARDS", "0");
        JOEY_DEFAULTS.put("PREF_DEFAULT_INDENT_WIDTH", "3");
        JOEY_DEFAULTS.put("COMMENT_PROFILE_PIC_SIZE", "18");
        JOEY_DEFAULTS.put("PREF_SHOW_FAB", "false");
        JOEY_DEFAULTS.put("PREF_ENLARGE_LINKS", "false");
        JOEY_DEFAULTS.put("PREF_LINK_DOMAIN_SHOW", "true");
        JOEY_DEFAULTS.put("PERF_SHOW_LINK_PREVIEW", "false");
        JOEY_DEFAULTS.put("SHOULD_EXPAND_FAVORITES", "false");
        JOEY_DEFAULTS.put("SHOULD_EXPAND_GOTO", "false");
        JOEY_DEFAULTS.put("SHOULD_EXPAND_MULTIREDDITS", "false");
        JOEY_DEFAULTS.put("SHOULD_EXPAND_MY_PROFILE", "false");
        JOEY_DEFAULTS.put("SHOULD_EXPAND_OC", "false");
        JOEY_DEFAULTS.put("SHOULD_EXPAND_PROFILES", "false");
        JOEY_DEFAULTS.put("SHOULD_HIDE_CHAT", "false");
        JOEY_DEFAULTS.put("SHOULD_HIDE_OC", "false");
        JOEY_DEFAULTS.put("SHOULD_HIDE_REPORT_BUG", "false");
    }

    /** Values a reset puts in place of Joey's defaults, where Modern needs something specific. */
    private static final Map<String, Object> RESET = new HashMap<>();

    static {
        RESET.put("settings:RightThumbnail", Boolean.TRUE);
        RESET.put("settings:PREF_SUBMISSION_CARD_VIEW_TYPE", "COMPACT");
    }

    private static Set<String> set(String... keys) {
        return new HashSet<>(Arrays.asList(keys));
    }

    private ModernSettings() {
    }

    // ---------------------------------------------------------------------
    // Hooks
    // ---------------------------------------------------------------------

    /** Called where Joey opens a settings file. Files with no layout keys come back unchanged. */
    public static SharedPreferences wrap(SharedPreferences joey, String name) {
        if (joey == null || name == null || joey instanceof Split) return joey;
        Set<String> keys = KEYS.get(name);
        return keys == null ? joey : new Split(joey, name, keys);
    }

    /** The same view for Modern's own code that reads one of Joey's files. */
    static SharedPreferences prefs(Context context, String name) {
        return wrap(context.getApplicationContext().getSharedPreferences(name, Context.MODE_PRIVATE), name);
    }

    private static boolean modern() {
        try {
            return ModernUi.isModernUiEnabled(ModernUi.getContext());
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static SharedPreferences copy() {
        Context context = ModernUi.getContext();
        if (context == null) return null;
        SharedPreferences copy = context.getSharedPreferences(COPY, Context.MODE_PRIVATE);
        if (!copy.getBoolean(MIGRATED, false)) migrate(context, copy);
        return copy;
    }

    /** First run in Modern: take the user's current values so nothing changes. */
    private static synchronized void migrate(Context context, SharedPreferences copy) {
        if (copy.getBoolean(MIGRATED, false)) return;
        SharedPreferences.Editor editor = copy.edit();
        for (Map.Entry<String, Set<String>> file : KEYS.entrySet()) {
            Map<String, ?> joey = context.getSharedPreferences(file.getKey(), Context.MODE_PRIVATE).getAll();
            for (String key : file.getValue()) {
                if (joey.containsKey(key)) put(editor, file.getKey() + ":" + key, joey.get(key));
            }
        }
        editor.putBoolean(MIGRATED, true).commit();
    }

    private static void put(SharedPreferences.Editor editor, String key, Object value) {
        if (value instanceof Boolean) editor.putBoolean(key, (Boolean) value);
        else if (value instanceof Integer) editor.putInt(key, (Integer) value);
        else if (value instanceof Long) editor.putLong(key, (Long) value);
        else if (value instanceof Float) editor.putFloat(key, (Float) value);
        else if (value instanceof String) editor.putString(key, (String) value);
        else if (value instanceof Set) {
            @SuppressWarnings("unchecked")
            Set<String> strings = (Set<String>) value;
            editor.putStringSet(key, strings);
        }
    }

    // ---------------------------------------------------------------------
    // Reset and undo
    // ---------------------------------------------------------------------

    static boolean canUndo(Context context) {
        return state(context).contains(KEY_UNDO);
    }

    private static SharedPreferences state(Context context) {
        return context.getApplicationContext().getSharedPreferences("mighty_morphing", Context.MODE_PRIVATE);
    }

    /** Saves the copy for undo, puts Joey's defaults (and Modern's few) back, then restarts. */
    static void reset(Activity activity) {
        SharedPreferences copy = copy();
        if (copy == null) return;
        JSONObject saved = new JSONObject();
        for (Map.Entry<String, ?> entry : copy.getAll().entrySet()) {
            if (MIGRATED.equals(entry.getKey())) continue;
            try {
                saved.put(entry.getKey(), typed(entry.getValue()));
            } catch (Throwable ignored) {
            }
        }
        state(activity).edit().putString(KEY_UNDO, saved.toString()).commit();
        SharedPreferences.Editor editor = copy.edit().clear().putBoolean(MIGRATED, true);
        for (Map.Entry<String, Object> entry : RESET.entrySet()) put(editor, entry.getKey(), entry.getValue());
        editor.commit();
        ModernUi.restartApp(activity);
    }

    static void undo(Activity activity) {
        SharedPreferences copy = copy();
        String raw = state(activity).getString(KEY_UNDO, null);
        if (copy == null || raw == null) return;
        SharedPreferences.Editor editor = copy.edit().clear().putBoolean(MIGRATED, true);
        try {
            JSONObject saved = new JSONObject(raw);
            for (Iterator<String> keys = saved.keys(); keys.hasNext(); ) {
                String key = keys.next();
                put(editor, key, untyped(saved.getJSONObject(key)));
            }
        } catch (Throwable ignored) {
        }
        editor.commit();
        state(activity).edit().remove(KEY_UNDO).commit();
        ModernUi.restartApp(activity);
    }

    private static JSONObject typed(Object value) throws Exception {
        JSONObject out = new JSONObject();
        if (value instanceof Boolean) out.put("t", "b");
        else if (value instanceof Integer) out.put("t", "i");
        else if (value instanceof Long) out.put("t", "l");
        else if (value instanceof Float) out.put("t", "f");
        else out.put("t", "s");
        out.put("v", value instanceof Set ? String.valueOf(value) : value);
        return out;
    }

    private static Object untyped(JSONObject json) {
        switch (json.optString("t")) {
            case "b": return json.optBoolean("v");
            case "i": return json.optInt("v");
            case "l": return json.optLong("v");
            case "f": return (float) json.optDouble("v");
            default: return json.optString("v");
        }
    }

    /** For the problem report: the value Modern sees for each layout key, and Classic's. */
    static void describe(Context context, StringBuilder out) {
        SharedPreferences copy = copy();
        for (Map.Entry<String, Set<String>> file : KEYS.entrySet()) {
            Map<String, ?> joey = context.getSharedPreferences(file.getKey(), Context.MODE_PRIVATE).getAll();
            Map<String, ?> mine = copy == null ? new HashMap<String, Object>() : copy.getAll();
            for (String key : new java.util.TreeSet<>(file.getValue())) {
                Object classic = joey.get(key);
                Object modernValue = mine.get(file.getKey() + ":" + key);
                if (classic == null && modernValue == null) continue;
                out.append(key).append(": modern ").append(shown(key, modernValue))
                        .append(", classic ").append(shown(key, classic)).append('\n');
            }
        }
    }

    private static String shown(String key, Object value) {
        if (value != null) return String.valueOf(value);
        String joey = JOEY_DEFAULTS.get(key);
        return joey == null ? "default" : joey + " (default)";
    }

    // ---------------------------------------------------------------------
    // The wrapper
    // ---------------------------------------------------------------------

    private static final class Split implements SharedPreferences {
        private final SharedPreferences joey;
        private final String file;
        private final Set<String> keys;
        /** SharedPreferences keeps listeners weakly, so the relays are held here. */
        private final Map<OnSharedPreferenceChangeListener, OnSharedPreferenceChangeListener> relays = new HashMap<>();

        Split(SharedPreferences joey, String file, Set<String> keys) {
            this.joey = joey;
            this.file = file;
            this.keys = keys;
        }

        private SharedPreferences route(String key) {
            if (key == null || !keys.contains(key) || !modern()) return null;
            return copy();
        }

        private String ns(String key) {
            return file + ":" + key;
        }

        @Override
        public Map<String, ?> getAll() {
            Map<String, Object> all = new HashMap<>(joey.getAll());
            SharedPreferences copy = modern() ? copy() : null;
            if (copy == null) return all;
            for (String key : keys) all.remove(key);
            String prefix = file + ":";
            for (Map.Entry<String, ?> entry : copy.getAll().entrySet()) {
                if (entry.getKey().startsWith(prefix)) all.put(entry.getKey().substring(prefix.length()), entry.getValue());
            }
            return all;
        }

        @Override
        public String getString(String key, String fallback) {
            SharedPreferences copy = route(key);
            return copy != null ? copy.getString(ns(key), fallback) : joey.getString(key, fallback);
        }

        @Override
        public Set<String> getStringSet(String key, Set<String> fallback) {
            SharedPreferences copy = route(key);
            return copy != null ? copy.getStringSet(ns(key), fallback) : joey.getStringSet(key, fallback);
        }

        @Override
        public int getInt(String key, int fallback) {
            SharedPreferences copy = route(key);
            return copy != null ? copy.getInt(ns(key), fallback) : joey.getInt(key, fallback);
        }

        @Override
        public long getLong(String key, long fallback) {
            SharedPreferences copy = route(key);
            return copy != null ? copy.getLong(ns(key), fallback) : joey.getLong(key, fallback);
        }

        @Override
        public float getFloat(String key, float fallback) {
            SharedPreferences copy = route(key);
            return copy != null ? copy.getFloat(ns(key), fallback) : joey.getFloat(key, fallback);
        }

        @Override
        public boolean getBoolean(String key, boolean fallback) {
            SharedPreferences copy = route(key);
            return copy != null ? copy.getBoolean(ns(key), fallback) : joey.getBoolean(key, fallback);
        }

        @Override
        public boolean contains(String key) {
            SharedPreferences copy = route(key);
            return copy != null ? copy.contains(ns(key)) : joey.contains(key);
        }

        @Override
        public Editor edit() {
            return new SplitEditor(this);
        }

        @Override
        public void registerOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener listener) {
            joey.registerOnSharedPreferenceChangeListener(listener);
            Context context = ModernUi.getContext();
            if (context == null || listener == null) return;
            String prefix = file + ":";
            OnSharedPreferenceChangeListener relay = (prefs, key) -> {
                if (key != null && key.startsWith(prefix)) listener.onSharedPreferenceChanged(this, key.substring(prefix.length()));
            };
            synchronized (relays) {
                relays.put(listener, relay);
            }
            context.getSharedPreferences(COPY, Context.MODE_PRIVATE).registerOnSharedPreferenceChangeListener(relay);
        }

        @Override
        public void unregisterOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener listener) {
            joey.unregisterOnSharedPreferenceChangeListener(listener);
            OnSharedPreferenceChangeListener relay;
            synchronized (relays) {
                relay = relays.remove(listener);
            }
            Context context = ModernUi.getContext();
            if (relay != null && context != null) {
                context.getSharedPreferences(COPY, Context.MODE_PRIVATE).unregisterOnSharedPreferenceChangeListener(relay);
            }
        }
    }

    private static final class SplitEditor implements SharedPreferences.Editor {
        private final Split split;
        private final SharedPreferences.Editor joey;
        private SharedPreferences.Editor copy;

        SplitEditor(Split split) {
            this.split = split;
            this.joey = split.joey.edit();
        }

        private SharedPreferences.Editor to(String key) {
            SharedPreferences target = split.route(key);
            if (target == null) return null;
            if (copy == null) copy = target.edit();
            return copy;
        }

        @Override
        public SharedPreferences.Editor putString(String key, String value) {
            SharedPreferences.Editor editor = to(key);
            if (editor != null) editor.putString(split.ns(key), value);
            else joey.putString(key, value);
            return this;
        }

        @Override
        public SharedPreferences.Editor putStringSet(String key, Set<String> values) {
            SharedPreferences.Editor editor = to(key);
            if (editor != null) editor.putStringSet(split.ns(key), values);
            else joey.putStringSet(key, values);
            return this;
        }

        @Override
        public SharedPreferences.Editor putInt(String key, int value) {
            SharedPreferences.Editor editor = to(key);
            if (editor != null) editor.putInt(split.ns(key), value);
            else joey.putInt(key, value);
            return this;
        }

        @Override
        public SharedPreferences.Editor putLong(String key, long value) {
            SharedPreferences.Editor editor = to(key);
            if (editor != null) editor.putLong(split.ns(key), value);
            else joey.putLong(key, value);
            return this;
        }

        @Override
        public SharedPreferences.Editor putFloat(String key, float value) {
            SharedPreferences.Editor editor = to(key);
            if (editor != null) editor.putFloat(split.ns(key), value);
            else joey.putFloat(key, value);
            return this;
        }

        @Override
        public SharedPreferences.Editor putBoolean(String key, boolean value) {
            SharedPreferences.Editor editor = to(key);
            if (editor != null) editor.putBoolean(split.ns(key), value);
            else joey.putBoolean(key, value);
            return this;
        }

        @Override
        public SharedPreferences.Editor remove(String key) {
            SharedPreferences.Editor editor = to(key);
            if (editor != null) editor.remove(split.ns(key));
            else joey.remove(key);
            return this;
        }

        /** Joey's own clear only. Modern's copy is cleared by its reset. */
        @Override
        public SharedPreferences.Editor clear() {
            joey.clear();
            return this;
        }

        @Override
        public boolean commit() {
            boolean done = joey.commit();
            if (copy != null) done &= copy.commit();
            return done;
        }

        @Override
        public void apply() {
            joey.apply();
            if (copy != null) copy.apply();
        }
    }
}
