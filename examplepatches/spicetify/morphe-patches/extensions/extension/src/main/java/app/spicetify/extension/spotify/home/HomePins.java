package app.spicetify.extension.spotify.home;

import android.content.Context;
import android.content.SharedPreferences;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/** Reorders only shortcuts supplied by Spotify; it never creates or retains native tile objects. */
public final class HomePins {
    private static final int MAX_SHORTCUTS = 64;
    private static SharedPreferences preferences;
    private static final LinkedHashMap<String, String> pins = new LinkedHashMap<>();
    private static final LinkedHashMap<String, String> observed = new LinkedHashMap<>();
    private static final LinkedHashMap<String, String> offered = new LinkedHashMap<>();

    private HomePins() {}

    public static final class Choice {
        public final String id;
        public final String label;
        public final boolean pinned;

        private Choice(String id, String label, boolean pinned) {
            this.id = id;
            this.label = label;
            this.pinned = pinned;
        }
    }

    public static synchronized void initialize(Context context) {
        preferences = context.getApplicationContext().getSharedPreferences("spicetify_home_pins", Context.MODE_PRIVATE);
        observed.clear();
        offered.clear();
        pins.clear();
        try {
            JSONArray saved = new JSONArray(preferences.getString("pins", "[]"));
            for (int i = 0; i < Math.min(saved.length(), MAX_SHORTCUTS); i++) {
                JSONObject pin = saved.getJSONObject(i);
                String id = pin.getString("id");
                if (validId(id)) pins.put(id, label(pin.optString("label"), id));
            }
        } catch (JSONException ignored) {
            pins.clear();
        }
    }

    public static synchronized List<Choice> choices() {
        List<Choice> result = new ArrayList<>();
        for (Map.Entry<String, String> pin : pins.entrySet()) {
            result.add(new Choice(pin.getKey(), observed.containsKey(pin.getKey())
                    ? observed.get(pin.getKey()) : pin.getValue(), true));
        }
        for (Map.Entry<String, String> item : observed.entrySet()) {
            if (!pins.containsKey(item.getKey())) result.add(new Choice(item.getKey(), item.getValue(), false));
        }
        offered.clear();
        for (Choice choice : result) offered.put(choice.id, choice.label);
        return Collections.unmodifiableList(result);
    }

    /** Selection order becomes pin order. Absent pins remain selectable until explicitly removed. */
    public static synchronized void setPinned(List<String> ids) {
        if (preferences == null) throw new IllegalStateException("Home pins are not initialized.");
        if (ids == null || ids.size() > MAX_SHORTCUTS) throw new IllegalArgumentException("Too many Home pins.");
        LinkedHashMap<String, String> selected = new LinkedHashMap<>();
        for (String id : ids) {
            String title = observed.containsKey(id) ? observed.get(id) : pins.get(id);
            if (title == null) title = offered.get(id);
            if (title == null) throw new IllegalArgumentException("Choose a shortcut shown in Home pins.");
            selected.put(id, title);
        }
        JSONArray saved = new JSONArray();
        try {
            for (Map.Entry<String, String> pin : selected.entrySet()) {
                JSONObject item = new JSONObject();
                item.put("id", pin.getKey());
                item.put("label", pin.getValue());
                saved.put(item);
            }
        } catch (JSONException impossible) {
            throw new IllegalStateException(impossible);
        }
        preferences.edit().putString("pins", saved.toString()).apply();
        pins.clear();
        pins.putAll(selected);
    }

    /** Field names and the constructor call site are checked against the stock DEX before patching. */
    public static ArrayList<?> reorder(ArrayList<?> input) {
        if (input == null || input.size() > MAX_SHORTCUTS) return input;
        try {
            String[] ids = new String[input.size()];
            String[] titles = new String[input.size()];
            for (int i = 0; i < input.size(); i++) {
                Object row = input.get(i);
                if (row == null || !row.getClass().getName().equals("p.goz0")) return input;
                Field itemField = row.getClass().getField("a");
                Object item = itemField.get(row);
                if (item == null || !item.getClass().getName().equals("p.nnz0")) return input;
                ids[i] = (String) item.getClass().getField("d").get(item);
                titles[i] = (String) item.getClass().getField("b").get(item);
            }
            int[] order = captureAndOrder(ids, titles);
            ArrayList<Object> result = new ArrayList<>(input.size());
            for (int index : order) result.add(input.get(index));
            return result;
        } catch (ReflectiveOperationException | ClassCastException | SecurityException changedNativeModel) {
            return input;
        }
    }

    static synchronized int[] captureAndOrder(String[] ids, String[] titles) {
        int[] result = new int[ids.length];
        if (preferences == null) {
            for (int i = 0; i < ids.length; i++) result[i] = i;
            return result;
        }
        observed.clear();
        for (int i = 0; i < ids.length; i++) {
            if (validId(ids[i])) observed.put(ids[i], label(titles[i], ids[i]));
        }
        int cursor = 0;
        for (String pin : pins.keySet()) {
            for (int i = 0; i < ids.length; i++) if (pin.equals(ids[i])) result[cursor++] = i;
        }
        for (int i = 0; i < ids.length; i++) if (!pins.containsKey(ids[i])) result[cursor++] = i;
        return result;
    }

    private static boolean validId(String id) {
        return id != null && id.startsWith("spotify:") && id.length() > 8 && id.length() <= 2048
                && id.indexOf('\n') < 0 && id.indexOf('\r') < 0;
    }

    private static String label(String title, String id) {
        return title == null || title.trim().isEmpty() ? id : title;
    }
}
