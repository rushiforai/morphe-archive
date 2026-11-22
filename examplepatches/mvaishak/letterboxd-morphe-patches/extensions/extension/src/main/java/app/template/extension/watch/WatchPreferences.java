package app.template.extension.watch;

import android.content.Context;
import android.content.SharedPreferences;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

public final class WatchPreferences {
    private final SharedPreferences preferences;

    WatchPreferences(Context context) {
        preferences = context.getSharedPreferences("morphe_where_to_watch", Context.MODE_PRIVATE);
    }

    String region() {
        return WatchAvailability.region(preferences.getString("region", Locale.getDefault().getCountry()));
    }

    Map<String, Set<Integer>> selections() {
        String region = region();
        Map<String, Set<Integer>> selected = new LinkedHashMap<>();
        Set<Integer> current = services(region);
        if (!current.isEmpty()) selected.put(region, current);
        preferences.getAll().keySet().stream().sorted()
                .filter(key -> key.startsWith("services_") && key.length() == 11)
                .map(key -> key.substring(9))
                .filter(country -> !country.equals(region))
                .forEach(country -> {
                    Set<Integer> services = services(country);
                    if (!services.isEmpty()) selected.put(country, services);
                });
        return selected;
    }

    Set<Integer> services(String region) {
        Set<Integer> ids = new HashSet<>();
        for (String value : preferences.getStringSet("services_" + region, Set.of())) {
            try {
                int id = Integer.parseInt(value);
                if (id > 0) ids.add(id);
            } catch (NumberFormatException ignored) {
                // Ignore malformed preferences.
            }
        }
        return ids;
    }

    void save(String region, Map<String, Set<Integer>> draft) {
        SharedPreferences.Editor editor = preferences.edit().putString("region", region);
        draft.forEach((country, services) -> {
            if (services.isEmpty()) editor.remove("services_" + country);
            else editor.putStringSet("services_" + country, strings(services));
        });
        editor.apply();
    }

    public static JSONObject backup(Context context) throws JSONException {
        WatchPreferences current = new WatchPreferences(context);
        return new JSONObject().put("region", current.region())
                .put("services", encodeServices(current.selections()));
    }

    static JSONObject encodeServices(Map<String, Set<Integer>> regions) throws JSONException {
        JSONObject result = new JSONObject();
        for (var region : regions.entrySet()) {
            ArrayList<Integer> services = new ArrayList<>(region.getValue());
            Collections.sort(services);
            result.put(region.getKey(), new JSONArray(services));
        }
        return result;
    }

    public static Map<String, Set<Integer>> readServices(JSONObject data) throws JSONException {
        Map<String, Set<Integer>> regions = new LinkedHashMap<>();
        for (var keys = data.keys(); keys.hasNext();) {
            String region = readRegion(keys.next());
            JSONArray raw = data.getJSONArray(region);
            Set<Integer> ids = new HashSet<>();
            for (int i = 0; i < raw.length(); i++) {
                Object id = raw.get(i);
                if (!(id instanceof Integer) || (Integer) id <= 0) {
                    throw new JSONException("Invalid streaming service ID");
                }
                ids.add((Integer) id);
            }
            regions.put(region, ids);
        }
        return regions;
    }

    public static Backup readBackup(JSONObject data) throws JSONException {
        return new Backup(readRegion(data.getString("region")), readServices(data.getJSONObject("services")));
    }

    public static final class Backup {
        private final String region;
        private final Map<String, Set<Integer>> services;

        private Backup(String region, Map<String, Set<Integer>> services) {
            this.region = region;
            this.services = services;
        }

        public int restore(Context context) {
            SharedPreferences stored = new WatchPreferences(context).preferences;
            SharedPreferences.Editor edit = stored.edit().putString("region", region);
            for (String key : stored.getAll().keySet()) {
                if (key.startsWith("services_")) edit.remove(key);
            }
            int count = 0;
            for (var country : services.entrySet()) {
                if (country.getValue().isEmpty()) continue;
                edit.putStringSet("services_" + country.getKey(), strings(country.getValue()));
                count += country.getValue().size();
            }
            if (!edit.commit()) throw new IllegalStateException("Couldn’t restore streaming services");
            return count;
        }
    }

    private static String readRegion(String region) throws JSONException {
        if (!region.matches("[A-Z]{2}")) throw new JSONException("Invalid streaming region");
        return region;
    }

    private static Set<String> strings(Set<Integer> ids) {
        Set<String> result = new HashSet<>();
        for (int id : ids) result.add(Integer.toString(id));
        return result;
    }

    void listen(SharedPreferences.OnSharedPreferenceChangeListener listener) {
        preferences.registerOnSharedPreferenceChangeListener(listener);
    }

    void unlisten(SharedPreferences.OnSharedPreferenceChangeListener listener) {
        preferences.unregisterOnSharedPreferenceChangeListener(listener);
    }
}
