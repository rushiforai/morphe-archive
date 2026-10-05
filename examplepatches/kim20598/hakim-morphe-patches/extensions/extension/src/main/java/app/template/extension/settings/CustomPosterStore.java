package app.template.extension.settings;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

/**
 * Local store of `filmSlug -> imageUrl` overrides for the "Custom poster" patch.
 *
 * <p>Posters and backdrops are two separate JSON maps under two SharedPreferences keys.
 */
public final class CustomPosterStore {

    private CustomPosterStore() {}

    // --- posters --------------------------------------------------------

    public static String getOverride(String filmSlug) {
        return getFromMap(Prefs.KEY_CUSTOM_POSTERS, filmSlug);
    }

    public static boolean hasOverride(String filmSlug) {
        return getOverride(filmSlug) != null;
    }

    public static void setOverride(String filmSlug, String url) {
        putInMap(Prefs.KEY_CUSTOM_POSTERS, filmSlug, url);
    }

    public static void clearOverride(String filmSlug) {
        setOverride(filmSlug, null);
    }

    public static List<String> listSlugs() {
        return listKeys(Prefs.KEY_CUSTOM_POSTERS);
    }

    public static JSONObject snapshot() {
        return snapshotMap(Prefs.KEY_CUSTOM_POSTERS);
    }

    public static void replaceAll(JSONObject map) {
        replaceMap(Prefs.KEY_CUSTOM_POSTERS, map);
    }

    public static int size() {
        return countEntries(Prefs.KEY_CUSTOM_POSTERS);
    }

    // --- backdrops ------------------------------------------------------

    public static String getBackdropOverride(String filmSlug) {
        return getFromMap(Prefs.KEY_CUSTOM_BACKDROPS, filmSlug);
    }

    public static boolean hasBackdropOverride(String filmSlug) {
        return getBackdropOverride(filmSlug) != null;
    }

    public static void setBackdropOverride(String filmSlug, String url) {
        putInMap(Prefs.KEY_CUSTOM_BACKDROPS, filmSlug, url);
    }

    public static void clearBackdropOverride(String filmSlug) {
        setBackdropOverride(filmSlug, null);
    }

    public static int backdropSize() {
        return countEntries(Prefs.KEY_CUSTOM_BACKDROPS);
    }

    public static JSONObject snapshotBackdrops() {
        return snapshotMap(Prefs.KEY_CUSTOM_BACKDROPS);
    }

    public static void replaceAllBackdrops(JSONObject map) {
        replaceMap(Prefs.KEY_CUSTOM_BACKDROPS, map);
    }

    // --- shared ---------------------------------------------------------

    private static String getFromMap(String prefsKey, String filmSlug) {
        if (filmSlug == null || filmSlug.isEmpty()) return null;
        try {
            JSONObject map = readMap(prefsKey);
            if (map == null) return null;
            String url = map.optString(filmSlug, null);
            return (url == null || url.isEmpty()) ? null : url;
        } catch (Throwable t) {
            return null;
        }
    }

    private static void putInMap(String prefsKey, String filmSlug, String url) {
        if (filmSlug == null || filmSlug.isEmpty()) return;
        try {
            JSONObject map = readMap(prefsKey);
            if (map == null) map = new JSONObject();
            if (url == null || url.isEmpty()) map.remove(filmSlug);
            else map.put(filmSlug, url);
            Prefs.putString(prefsKey, map.toString());
        } catch (Throwable ignored) {}
    }

    private static List<String> listKeys(String prefsKey) {
        try {
            JSONObject map = readMap(prefsKey);
            if (map == null) return Collections.emptyList();
            List<String> out = new ArrayList<>();
            Iterator<String> it = map.keys();
            while (it.hasNext()) out.add(it.next());
            return out;
        } catch (Throwable t) {
            return Collections.emptyList();
        }
    }

    private static JSONObject snapshotMap(String prefsKey) {
        try {
            JSONObject map = readMap(prefsKey);
            return map != null ? map : new JSONObject();
        } catch (Throwable t) {
            return new JSONObject();
        }
    }

    private static void replaceMap(String prefsKey, JSONObject map) {
        try {
            Prefs.putString(prefsKey, map == null ? "{}" : map.toString());
        } catch (Throwable ignored) {}
    }

    private static int countEntries(String prefsKey) {
        try {
            JSONObject map = readMap(prefsKey);
            return map == null ? 0 : map.length();
        } catch (Throwable t) {
            return 0;
        }
    }

    private static JSONObject readMap(String prefsKey) {
        try {
            String raw = Prefs.getString(prefsKey, "{}");
            if (raw == null || raw.isEmpty()) return new JSONObject();
            return new JSONObject(raw);
        } catch (JSONException e) {
            return new JSONObject();
        } catch (Throwable t) {
            return null;
        }
    }
}
