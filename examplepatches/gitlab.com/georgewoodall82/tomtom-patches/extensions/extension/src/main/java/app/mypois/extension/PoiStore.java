package app.mypois.extension;

import android.content.Context;
import android.content.SharedPreferences;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

/**
 * Folder and place storage for "My POIs".
 * <p>
 * Everything lives in this app's own SharedPreferences and is completely separate from
 * "My Places": nothing here ever writes to TomTom's location storage.
 */
@SuppressWarnings("WeakerAccess")
public final class PoiStore {

    public static final class Place {
        public final String name;
        public final double lat;
        public final double lon;

        public Place(String name, double lat, double lon) {
            this.name = name;
            this.lat = lat;
            this.lon = lon;
        }

        public boolean sameSpot(Place other) {
            return Math.abs(lat - other.lat) < 0.00002 && Math.abs(lon - other.lon) < 0.00002;
        }

        JSONObject toJson() throws JSONException {
            return new JSONObject().put("n", name).put("la", lat).put("lo", lon);
        }

        static Place fromJson(JSONObject o) {
            return new Place(o.optString("n"), o.optDouble("la"), o.optDouble("lo"));
        }
    }

    public static final class Folder {
        public String name;
        public final List<Place> places = new ArrayList<>();

        public Folder(String name) {
            this.name = name;
        }
    }

    private static final String PREFS = "mypois";
    private static final String KEY_FOLDERS = "folders";
    private static final String KEY_CACHE = "myplaces_cache";

    private PoiStore() {
    }

    private static SharedPreferences prefs(Context context) {
        return context.getApplicationContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    // ---- Folders ----------------------------------------------------------------------------

    public static synchronized List<Folder> load(Context context) {
        List<Folder> folders = new ArrayList<>();
        try {
            JSONArray array = new JSONArray(prefs(context).getString(KEY_FOLDERS, "[]"));
            for (int i = 0; i < array.length(); i++) {
                JSONObject fo = array.getJSONObject(i);
                Folder folder = new Folder(fo.optString("name"));
                JSONArray places = fo.optJSONArray("places");
                if (places != null) {
                    for (int j = 0; j < places.length(); j++) {
                        folder.places.add(Place.fromJson(places.getJSONObject(j)));
                    }
                }
                folders.add(folder);
            }
        } catch (JSONException ignored) {
            // Corrupt data: start empty rather than crash the navigation app.
        }
        sortFolders(folders);
        return folders;
    }

    public static synchronized void save(Context context, List<Folder> folders) {
        try {
            JSONArray array = new JSONArray();
            for (Folder folder : folders) {
                JSONArray places = new JSONArray();
                for (Place place : folder.places) {
                    places.put(place.toJson());
                }
                array.put(new JSONObject().put("name", folder.name).put("places", places));
            }
            prefs(context).edit().putString(KEY_FOLDERS, array.toString()).apply();
        } catch (JSONException ignored) {
        }
    }

    public static void sortFolders(List<Folder> folders) {
        Collections.sort(folders, (a, b) -> a.name.toLowerCase(Locale.ROOT).compareTo(b.name.toLowerCase(Locale.ROOT)));
    }

    public static void sortPlaces(List<Place> places) {
        Collections.sort(places, (a, b) -> a.name.toLowerCase(Locale.ROOT).compareTo(b.name.toLowerCase(Locale.ROOT)));
    }

    public static Folder find(List<Folder> folders, String name) {
        for (Folder folder : folders) {
            if (folder.name.equalsIgnoreCase(name)) return folder;
        }
        return null;
    }

    /** Adds a place to the named folder, creating the folder if needed. Returns false if it was already there. */
    public static boolean addPlace(Context context, String folderName, Place place) {
        List<Folder> folders = load(context);
        Folder folder = find(folders, folderName);
        if (folder == null) {
            folder = new Folder(folderName);
            folders.add(folder);
        }
        for (Place existing : folder.places) {
            if (existing.sameSpot(place)) return false;
        }
        folder.places.add(place);
        save(context, folders);
        return true;
    }

    // ---- Cache of "My Places" ---------------------------------------------------------------

    /** Replaces the cached copy of My Places (captured read-only whenever the My Places list loads). */
    public static void saveMyPlacesCache(Context context, List<Place> places) {
        try {
            JSONArray array = new JSONArray();
            for (Place place : places) array.put(place.toJson());
            prefs(context).edit().putString(KEY_CACHE, array.toString()).apply();
        } catch (JSONException ignored) {
        }
    }

    public static List<Place> loadMyPlacesCache(Context context) {
        List<Place> places = new ArrayList<>();
        try {
            JSONArray array = new JSONArray(prefs(context).getString(KEY_CACHE, "[]"));
            for (int i = 0; i < array.length(); i++) places.add(Place.fromJson(array.getJSONObject(i)));
        } catch (JSONException ignored) {
        }
        sortPlaces(places);
        return places;
    }
}
