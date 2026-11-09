package software.santodan.extension.nuviomenu;

import java.util.*;
import org.json.*;

/** Versioned, package-independent settings only. Never copies caches or native account data. */
public final class PatchSettingsBackup {
    public static final int MAX_BYTES = 1024 * 1024;
    private static final String MERGED = "santodan_nuvio_merged_progress";
    public static final String[] SCOPES = {
        MERGED, "santodan_nuvio_remaining_episodes", "santodan_nuvio_airing_series",
        "santodan_nuvio_finale_dates", "santodan_nuvio_movie_release_dates",
        "santodan_nuvio_date_label_style", "santodan_stream_preload", "santodan_current_stream",
        "santodan_playback_buttons", "santodan_introdb"
    };
    private PatchSettingsBackup() {}

    // The expected preference type is also the serialized type; longs stay decimal strings
    // to preserve packed Compose colors without JSON floating-point precision loss.
    public static String type(String scope, String key) {
        if (scope.equals(MERGED)) {
            if (Arrays.asList("enabled", "show_provider", "quick_startup_sync").contains(key)) return "boolean";
            if (key.equals("strategy") || key.matches("snapshot_v2_[0-9]+_main")
                    || key.matches("previous_source_[0-9]+")) return "string";
            if (key.matches("snapshot_v2_[0-9]+_services")) return "set";
        } else if (scope.equals("santodan_nuvio_date_label_style")) {
            if (key.matches("date_label_(position|size|background|font_size|foreground)")) return "int";
            if (key.matches("date_label_(size|font_size)_percent")) return "int";
            if (key.matches("date_label_(background|foreground)_color")) return "long";
        } else if (scope.equals("santodan_playback_buttons")) {
            if (key.equals("enabled")) return "boolean";
            if (Arrays.asList("order", "hidden", "more").contains(key)) return "string";
        } else if (scope.equals("santodan_introdb")) {
            if (key.equals("enabled")) return "boolean";
            if (key.equals("key")) return "string";
        } else if (scope.matches("santodan_preferred_addon_[0-9]+")) {
            if (key.equals("addon")) return "string";
            if (key.equals("autoplay")) return "boolean";
        } else if (scope.matches("santodan_launcher_[0-9]+")) {
            if (key.equals("selected")) return "set";
        } else if (scope.equals("santodan_stream_preload")) {
            if (Arrays.asList("continue_watching", "details", "next_episode").contains(key)) return "boolean";
        } else if (Arrays.asList("santodan_nuvio_remaining_episodes", "santodan_nuvio_airing_series",
                "santodan_current_stream").contains(scope)) {
            if (key.equals("enabled")) return "boolean";
        } else if (Arrays.asList("santodan_nuvio_finale_dates", "santodan_nuvio_movie_release_dates").contains(scope)) {
            if (Arrays.asList("library", "collections").contains(key)) return "boolean";
            if (scope.equals("santodan_nuvio_finale_dates") && key.equals("only_airing")) return "boolean";
        }
        return null;
    }

    public static boolean scope(String name) {
        return Arrays.asList(SCOPES).contains(name) || name.matches("santodan_(preferred_addon|launcher)_[0-9]+");
    }

    public static String encode(Map<String, Map<String, Object>> values) throws JSONException {
        JSONObject stores = new JSONObject();
        for (String scope : new TreeSet<>(values.keySet())) {
            if (!scope(scope)) continue;
            JSONObject entries = new JSONObject();
            for (String key : new TreeSet<>(values.get(scope).keySet())) {
                String type = type(scope, key);
                if (type == null) continue;
                Object value = values.get(scope).get(key);
                Object encoded = value;
                if (type.equals("long")) encoded = value.toString();
                if (type.equals("set")) encoded = new JSONArray(new TreeSet<>((Set<String>) value));
                entries.put(key, new JSONObject().put("type", type).put("value", encoded));
            }
            stores.put(scope, entries);
        }
        String result = new JSONObject().put("format", "santodan-nuviotv-patch-settings")
            .put("version", 1).put("stores", stores).toString(2);
        // Exercise the same validation on exports; do not produce an unusable backup.
        decode(result);
        return result;
    }

    public static Map<String, Map<String, Object>> decode(String json) throws JSONException {
        if (json.getBytes(java.nio.charset.StandardCharsets.UTF_8).length > MAX_BYTES)
            throw new IllegalArgumentException("Backup is larger than 1 MiB");
        JSONObject root = new JSONObject(json);
        if (!"santodan-nuviotv-patch-settings".equals(root.get("format")) || !Integer.valueOf(1).equals(root.get("version")))
            throw new IllegalArgumentException("Unsupported settings backup format or version");
        JSONObject stores = root.getJSONObject("stores");
        if (stores.length() > 256) throw new IllegalArgumentException("Too many profiles in backup");
        Map<String, Map<String, Object>> result = new LinkedHashMap<>();
        for (Iterator<String> scopes = stores.keys(); scopes.hasNext();) {
            String scope = scopes.next();
            if (!scope(scope)) throw new IllegalArgumentException("Unknown settings group");
            JSONObject entries = stores.getJSONObject(scope);
            if (entries.length() > 256) throw new IllegalArgumentException("Too many settings");
            Map<String, Object> values = new LinkedHashMap<>();
            for (Iterator<String> keys = entries.keys(); keys.hasNext();) {
                String key = keys.next(), expected = type(scope, key);
                JSONObject entry = entries.getJSONObject(key);
                if (expected == null || !expected.equals(entry.getString("type")))
                    throw new IllegalArgumentException("Unknown setting or invalid type");
                Object value = entry.get("value");
                switch (expected) {
                    case "boolean": if (!(value instanceof Boolean)) throw invalid(); break;
                    case "int": if (!(value instanceof Integer)) throw invalid(); break;
                    case "string": if (!(value instanceof String) || ((String) value).length() > 32768) throw invalid(); break;
                    case "long": if (!(value instanceof String)) throw invalid(); value = Long.parseLong((String) value); break;
                    case "set":
                        if (!(value instanceof JSONArray) || ((JSONArray) value).length() > 256) throw invalid();
                        Set<String> set = new LinkedHashSet<>();
                        JSONArray array = (JSONArray) value;
                        for (int i = 0; i < array.length(); i++) {
                            Object item = array.get(i);
                            if (!(item instanceof String) || ((String) item).length() > 32768) throw invalid();
                            set.add((String) item);
                        }
                        value = set; break;
                    default: throw invalid();
                }
                if (key.equals("strategy") && !Arrays.asList("highest", "recent").contains(value)) throw invalid();
                if (scope.equals(MERGED)) {
                    List<String> providers = Arrays.asList("NUVIO_SYNC", "TRAKT", "SIMKL", "MDBLIST");
                    if ((key.endsWith("_main") || key.startsWith("previous_source_")) && !providers.contains(value)) throw invalid();
                    if (key.endsWith("_services") && !providers.containsAll((Set<String>) value)) throw invalid();
                }
                values.put(key, value);
            }
            result.put(scope, values);
        }
        return result;
    }
    public interface Store {
        Map<String, Map<String, Object>> read() throws java.io.IOException;
        void replace(String scope, Map<String, Object> values) throws java.io.IOException;
    }
    /** Restore only included groups. Roll back every touched group on a failed commit. */
    public static void restore(Store store, Map<String, Map<String, Object>> values) throws java.io.IOException {
        Map<String, Map<String, Object>> old = store.read();
        List<String> touched = new ArrayList<>();
        try {
            for (String scope : values.keySet()) {
                touched.add(scope);
                store.replace(scope, values.get(scope));
            }
        } catch (java.io.IOException failure) {
            for (String scope : touched) try { store.replace(scope, old.getOrDefault(scope, Collections.emptyMap())); }
            catch (java.io.IOException rollback) { failure.addSuppressed(rollback); }
            throw failure;
        }
    }
    private static IllegalArgumentException invalid() { return new IllegalArgumentException("Invalid setting value"); }
}
