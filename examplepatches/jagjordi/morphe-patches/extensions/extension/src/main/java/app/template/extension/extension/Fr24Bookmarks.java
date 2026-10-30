package app.template.extension.extension;

import android.content.Context;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * Local bookmark store used when no Flightradar24 account is signed in.
 *
 * The app keeps bookmarks on the Flightradar24 server and every request carries the
 * account's login token, so the stock app refuses to bookmark anything without an
 * account. The patch routes the three network calls of the bookmarks feature here
 * whenever the token is empty: the list request, the bulk insert/delete/sort request
 * and the sort request. The store keeps only the identifiers the user chose (a
 * registration, a flight number, an airport code or a saved location) in a JSON file
 * in the app's private files directory and rebuilds the server response shape from
 * them on every request. Flight details the server would add (current flight id,
 * callsign, aircraft type, origin and destination) come from the public search
 * endpoint, and airport details (name, ICAO code, position, time zone) come from the
 * airport list the app itself downloads at startup.
 */
public final class Fr24Bookmarks {
    private static final String TAG = "Fr24Bookmarks";
    private static final String STORE_FILE = "fr24_local_bookmarks.json";
    private static final String AIRPORTS_FILE = "fr24_local_airports.json";
    private static final String SEARCH_URL = "https://mobile.flightradar24.com/v1/search/web/find";
    private static final String AIRPORTS_URL = "https://mobile.flightradar24.com/mobile/airports/format/4";
    private static final String BOOKMARKS_RESPONSE_CLASS = "com.flightradar24free.entity.BookmarksResponse";
    private static final int HTTP_TIMEOUT_MS = 10_000;
    private static final long SEARCH_CACHE_MS = 60_000L;
    private static final long AIRPORTS_MAX_AGE_MS = 30L * 24 * 60 * 60 * 1000;
    private static final long ENRICH_BUDGET_MS = 12_000L;

    private static final String[] TYPES = {"aircraft", "flights", "airports", "locations"};
    private static final String DEFAULT_SORT = "last_added";

    private static volatile Context appContext;
    private static volatile String userAgent;
    private static final Object lock = new Object();
    private static final Map<String, CachedSearch> searchCache = new HashMap<>();
    private static volatile Map<String, JSONObject> airportsByIata;

    private static final class CachedSearch {
        final long fetchedAt;
        final JSONArray results;

        CachedSearch(long fetchedAt, JSONArray results) {
            this.fetchedAt = fetchedAt;
            this.results = results;
        }
    }

    private Fr24Bookmarks() {
    }

    /** Called from FR24Application.onCreate() with the application instance. */
    public static void init(Object application) {
        try {
            if (!(application instanceof Context)) {
                Log.w(TAG, "init called without a Context");
                return;
            }
            appContext = ((Context) application).getApplicationContext();
            Log.i(TAG, "Initialised");
        } catch (Throwable t) {
            Log.w(TAG, "init failed", t);
        }
    }

    /** Body is replaced by the patch with a call to the app's Gson toJson method. */
    public static String toJson(Object gson, Object value) {
        throw new IllegalStateException("Fr24Bookmarks.toJson was not patched");
    }

    /** Body is replaced by the patch with a call to the app's Gson fromJson method. */
    public static Object fromJson(Object gson, Class<?> type, String json) {
        throw new IllegalStateException("Fr24Bookmarks.fromJson was not patched");
    }

    /** Replaces the account check of the bookmarks tab so the tab works without a login. */
    public static boolean bookmarksAvailable(Object user) {
        return true;
    }

    /** Serves the list request of the bookmarks provider when no login token exists. */
    public static Object localList(Object provider) throws Exception {
        synchronized (lock) {
            JSONObject store = loadStore();
            return buildResponse(provider, store);
        }
    }

    /**
     * Serves the bulk request of the bookmarks use case when no login token exists.
     * The actions are the app's own BookmarksBulkAction objects; they are serialised
     * with the app's Gson so the field names match the server protocol exactly.
     */
    public static Object localBulk(Object provider, List<?> actions) throws Exception {
        synchronized (lock) {
            JSONObject store = loadStore();
            JSONArray array = new JSONArray(toJson(gsonOf(provider), actions));
            for (int i = 0; i < array.length(); i++) {
                JSONObject action = array.optJSONObject(i);
                if (action != null) {
                    applyAction(store, action);
                }
            }
            saveStore(store);
            return buildResponse(provider, store);
        }
    }

    /** Serves the sort request of the bookmarks provider when no login token exists. */
    public static void localSort(Object provider, Object bookmarkType, Object sortType) throws Exception {
        synchronized (lock) {
            JSONObject store = loadStore();
            Object gson = gsonOf(provider);
            String type = enumName(toJson(gson, bookmarkType));
            String sort = enumName(toJson(gson, sortType));
            if (type != null && sort != null) {
                JSONObject option = new JSONObject();
                option.put("type", sort);
                store.getJSONObject("sort").put(type, option);
                saveStore(store);
            }
        }
    }

    // ── store ──────────────────────────────────────────────────────────────────────

    private static JSONObject loadStore() {
        JSONObject store = null;
        File file = storeFile();
        if (file != null && file.isFile()) {
            try {
                store = new JSONObject(readFile(file));
            } catch (Throwable t) {
                Log.w(TAG, "Unreadable bookmark store, starting empty", t);
            }
        }
        if (store == null) {
            store = new JSONObject();
        }
        try {
            for (String type : TYPES) {
                if (!store.has(type)) {
                    store.put(type, new JSONArray());
                }
            }
            if (!store.has("sort")) {
                store.put("sort", new JSONObject());
            }
            JSONObject sort = store.getJSONObject("sort");
            for (String type : TYPES) {
                if (!sort.has(type)) {
                    JSONObject option = new JSONObject();
                    option.put("type", DEFAULT_SORT);
                    sort.put(type, option);
                }
            }
            if (!store.has("nextLocationId")) {
                store.put("nextLocationId", 1L);
            }
        } catch (Throwable t) {
            Log.w(TAG, "Failed to normalise the bookmark store", t);
        }
        return store;
    }

    private static void saveStore(JSONObject store) {
        File file = storeFile();
        if (file == null) {
            Log.w(TAG, "No files directory, bookmarks are not persisted");
            return;
        }
        try {
            writeFile(file, store.toString());
        } catch (Throwable t) {
            Log.w(TAG, "Failed to save the bookmark store", t);
        }
    }

    private static File storeFile() {
        Context context = appContext;
        return context == null ? null : new File(context.getFilesDir(), STORE_FILE);
    }

    private static void applyAction(JSONObject store, JSONObject action) throws Exception {
        String method = action.optString("method", "");
        JSONObject payload = action.optJSONObject("payload");
        if (payload == null) {
            return;
        }
        if ("SORT".equalsIgnoreCase(method)) {
            String type = normaliseType(payload.optString("bookmark_type", payload.optString("type", "")));
            String sort = payload.optString("sort_type", "");
            if (type == null || sort.isEmpty()) {
                return;
            }
            JSONObject option = new JSONObject();
            option.put("type", sort);
            JSONArray customIds = payload.optJSONArray("custom_ids");
            if (customIds != null) {
                option.put("custom_ids", customIds);
            }
            store.getJSONObject("sort").put(type, option);
            return;
        }
        String type = normaliseType(payload.optString("type", ""));
        if (type == null) {
            return;
        }
        JSONArray list = store.getJSONArray(type);
        if ("INSERT".equalsIgnoreCase(method)) {
            if ("locations".equals(type)) {
                JSONObject location = payload.optJSONObject("location");
                if (location == null) {
                    return;
                }
                long id = store.optLong("nextLocationId", 1L);
                store.put("nextLocationId", id + 1);
                JSONObject entry = new JSONObject();
                entry.put("id", id);
                entry.put("name", location.optString("name", ""));
                entry.put("lat", location.optDouble("lat", 0));
                entry.put("lon", location.optDouble("lon", 0));
                entry.put("zoomF", location.optDouble("zoomF", 0));
                entry.put("created_at", System.currentTimeMillis());
                list.put(entry);
                return;
            }
            String identifier = payload.optString("identifier", "").trim();
            if (identifier.isEmpty() || indexOf(list, identifier) >= 0) {
                return;
            }
            JSONObject entry = new JSONObject();
            entry.put("id", identifier);
            entry.put("created_at", System.currentTimeMillis());
            list.put(entry);
            return;
        }
        if ("DELETE".equalsIgnoreCase(method)) {
            String identifier = String.valueOf(payload.opt("identifier"));
            int index = indexOf(list, identifier);
            if (index >= 0) {
                list.remove(index);
            }
        }
    }

    private static int indexOf(JSONArray list, String identifier) {
        for (int i = 0; i < list.length(); i++) {
            JSONObject entry = list.optJSONObject(i);
            if (entry != null && identifier.equalsIgnoreCase(String.valueOf(entry.opt("id")))) {
                return i;
            }
        }
        return -1;
    }

    private static String normaliseType(String raw) {
        String value = raw == null ? "" : raw.trim().toLowerCase(Locale.US);
        for (String type : TYPES) {
            if (type.equals(value)) {
                return type;
            }
        }
        return null;
    }

    private static String enumName(String json) {
        if (json == null) {
            return null;
        }
        String value = json.trim();
        if (value.startsWith("\"") && value.endsWith("\"") && value.length() >= 2) {
            value = value.substring(1, value.length() - 1);
        }
        return value.isEmpty() || "null".equals(value) ? null : value;
    }

    // ── response ───────────────────────────────────────────────────────────────────

    private static Object buildResponse(Object provider, JSONObject store) throws Exception {
        long deadline = System.currentTimeMillis() + ENRICH_BUDGET_MS;
        JSONObject data = new JSONObject();
        data.put("aircraft", buildAircraft(store.getJSONArray("aircraft"), deadline));
        data.put("flights", buildFlights(store.getJSONArray("flights"), deadline));
        data.put("airports", buildAirports(store.getJSONArray("airports"), deadline));
        data.put("locations", buildLocations(store.getJSONArray("locations")));
        JSONObject meta = new JSONObject();
        meta.put("sort", store.getJSONObject("sort"));
        JSONObject response = new JSONObject();
        response.put("data", data);
        response.put("meta", meta);
        Class<?> responseClass = Class.forName(BOOKMARKS_RESPONSE_CLASS, true, provider.getClass().getClassLoader());
        return fromJson(gsonOf(provider), responseClass, response.toString());
    }

    private static JSONArray buildAircraft(JSONArray entries, long deadline) throws Exception {
        JSONArray out = new JSONArray();
        for (int i = 0; i < entries.length(); i++) {
            JSONObject entry = entries.optJSONObject(i);
            if (entry == null) {
                continue;
            }
            String registration = entry.optString("id", "");
            JSONObject item = new JSONObject();
            item.put("registration", registration);
            item.put("created_at", formatDate(entry.optLong("created_at", 0)));
            JSONArray results = search(registration, deadline);
            JSONObject live = findResult(results, "live", "reg", registration);
            JSONObject aircraft = findResult(results, "aircraft", null, registration);
            String type = null;
            if (live != null) {
                JSONObject detail = live.optJSONObject("detail");
                item.put("flight_id", live.optString("id", null));
                if (detail != null) {
                    putIfPresent(item, "callsign", detail.optString("callsign", null));
                    putIfPresent(item, "flight_number", detail.optString("flight", null));
                    type = detail.optString("ac_type", null);
                    item.put("airport", airportInfo(detail.optString("schd_from", null), detail.optString("schd_to", null)));
                }
            }
            if ((type == null || type.isEmpty()) && aircraft != null) {
                JSONObject detail = aircraft.optJSONObject("detail");
                if (detail != null) {
                    type = detail.optString("equip", null);
                }
            }
            putIfPresent(item, "type", type);
            out.put(item);
        }
        return out;
    }

    private static JSONArray buildFlights(JSONArray entries, long deadline) throws Exception {
        JSONArray out = new JSONArray();
        for (int i = 0; i < entries.length(); i++) {
            JSONObject entry = entries.optJSONObject(i);
            if (entry == null) {
                continue;
            }
            String flightNumber = entry.optString("id", "");
            JSONObject item = new JSONObject();
            item.put("flight_number", flightNumber);
            item.put("created_at", formatDate(entry.optLong("created_at", 0)));
            JSONArray results = search(flightNumber, deadline);
            JSONObject live = findResult(results, "live", "flight", flightNumber);
            if (live != null) {
                JSONObject detail = live.optJSONObject("detail");
                item.put("flight_id", live.optString("id", null));
                if (detail != null) {
                    putIfPresent(item, "registration", detail.optString("reg", null));
                    putIfPresent(item, "type", detail.optString("ac_type", null));
                    item.put("airport", airportInfo(detail.optString("schd_from", null), detail.optString("schd_to", null)));
                }
            }
            out.put(item);
        }
        return out;
    }

    private static JSONArray buildAirports(JSONArray entries, long deadline) throws Exception {
        JSONArray out = new JSONArray();
        for (int i = 0; i < entries.length(); i++) {
            JSONObject entry = entries.optJSONObject(i);
            if (entry == null) {
                continue;
            }
            String iata = entry.optString("id", "").toUpperCase(Locale.US);
            JSONObject airport = airport(iata);
            JSONObject item = new JSONObject();
            JSONObject code = new JSONObject();
            code.put("iata", iata);
            String name = null;
            String icao = null;
            double latitude = 0;
            double longitude = 0;
            String timezone = null;
            if (airport != null) {
                name = airport.optString("name", null);
                icao = airport.optString("icao", null);
                latitude = airport.optDouble("lat", 0);
                longitude = airport.optDouble("lon", 0);
                JSONObject zone = airport.optJSONObject("timezone");
                if (zone != null) {
                    timezone = zone.optString("name", null);
                }
            } else {
                JSONObject result = findResult(search(iata, deadline), "airport", null, iata);
                if (result != null) {
                    String label = result.optString("label", "");
                    int open = label.lastIndexOf(" (");
                    name = open > 0 ? label.substring(0, open) : label;
                    int slash = label.lastIndexOf(" / ");
                    if (slash > 0 && label.endsWith(")")) {
                        icao = label.substring(slash + 3, label.length() - 1);
                    }
                    JSONObject detail = result.optJSONObject("detail");
                    if (detail != null) {
                        latitude = detail.optDouble("lat", 0);
                        longitude = detail.optDouble("lon", 0);
                    }
                }
            }
            code.put("icao", icao == null ? "" : icao);
            item.put("code", code);
            item.put("name", name == null ? iata : name);
            item.put("latitude", latitude);
            item.put("longitude", longitude);
            JSONObject zone = new JSONObject();
            zone.put("name", timezone == null ? "UTC" : timezone);
            item.put("timezone", zone);
            item.put("created_at", formatDate(entry.optLong("created_at", 0)));
            out.put(item);
        }
        return out;
    }

    private static JSONArray buildLocations(JSONArray entries) throws Exception {
        JSONArray out = new JSONArray();
        for (int i = 0; i < entries.length(); i++) {
            JSONObject entry = entries.optJSONObject(i);
            if (entry == null) {
                continue;
            }
            JSONObject item = new JSONObject();
            item.put("id", entry.optLong("id", 0));
            item.put("name", entry.optString("name", ""));
            item.put("lat", entry.optDouble("lat", 0));
            item.put("lon", entry.optDouble("lon", 0));
            item.put("zoomF", entry.optDouble("zoomF", 0));
            item.put("created_at", formatDate(entry.optLong("created_at", 0)));
            out.put(item);
        }
        return out;
    }

    private static JSONObject airportInfo(String originIata, String destinationIata) throws Exception {
        JSONObject info = new JSONObject();
        JSONObject origin = airportInfoItem(originIata);
        JSONObject destination = airportInfoItem(destinationIata);
        if (origin != null) {
            info.put("origin", origin);
        }
        if (destination != null) {
            info.put("destination", destination);
        }
        return info;
    }

    private static JSONObject airportInfoItem(String iata) throws Exception {
        if (iata == null || iata.isEmpty()) {
            return null;
        }
        String upper = iata.toUpperCase(Locale.US);
        JSONObject airport = airport(upper);
        JSONObject item = new JSONObject();
        JSONObject code = new JSONObject();
        code.put("iata", upper);
        code.put("icao", airport == null ? "" : airport.optString("icao", ""));
        item.put("code", code);
        item.put("name", airport == null ? upper : airport.optString("name", upper));
        JSONObject zone = airport == null ? null : airport.optJSONObject("timezone");
        if (zone != null && zone.optString("name", null) != null) {
            JSONObject timezone = new JSONObject();
            timezone.put("name", zone.optString("name"));
            item.put("timezone", timezone);
        }
        return item;
    }

    private static void putIfPresent(JSONObject target, String key, String value) throws Exception {
        if (value != null && !value.isEmpty()) {
            target.put(key, value);
        }
    }

    private static JSONObject findResult(JSONArray results, String type, String detailKey, String expected) {
        if (results == null) {
            return null;
        }
        for (int i = 0; i < results.length(); i++) {
            JSONObject result = results.optJSONObject(i);
            if (result == null || !type.equalsIgnoreCase(result.optString("type", ""))) {
                continue;
            }
            String actual;
            if (detailKey == null) {
                actual = result.optString("id", "");
            } else {
                JSONObject detail = result.optJSONObject("detail");
                actual = detail == null ? "" : detail.optString(detailKey, "");
            }
            if (expected.equalsIgnoreCase(actual)) {
                return result;
            }
        }
        return null;
    }

    /**
     * Formats a timestamp the way the app's Gson parses dates: Gson tries the device's
     * default date and time format for the US locale first, so the same formatter is
     * used here and the value always round trips on the device that produced it.
     */
    private static String formatDate(long millis) {
        long value = millis > 0 ? millis : System.currentTimeMillis();
        return DateFormat.getDateTimeInstance(DateFormat.DEFAULT, DateFormat.DEFAULT, Locale.US).format(new Date(value));
    }

    // ── search endpoint ─────────────────────────────────────────────────────────────

    private static JSONArray search(String query, long deadline) {
        if (query == null || query.trim().isEmpty()) {
            return null;
        }
        String key = query.trim().toUpperCase(Locale.US);
        long now = System.currentTimeMillis();
        synchronized (searchCache) {
            CachedSearch cached = searchCache.get(key);
            if (cached != null && now - cached.fetchedAt < SEARCH_CACHE_MS) {
                return cached.results;
            }
        }
        if (now > deadline) {
            synchronized (searchCache) {
                CachedSearch cached = searchCache.get(key);
                return cached == null ? null : cached.results;
            }
        }
        try {
            String url = SEARCH_URL + "?query=" + URLEncoder.encode(key, "UTF-8") + "&limit=10";
            JSONObject body = new JSONObject(httpGet(url));
            JSONArray results = body.optJSONArray("results");
            if (results == null) {
                results = new JSONArray();
            }
            synchronized (searchCache) {
                searchCache.put(key, new CachedSearch(System.currentTimeMillis(), results));
            }
            return results;
        } catch (Throwable t) {
            Log.w(TAG, "Search failed for " + key + ": " + t);
            synchronized (searchCache) {
                CachedSearch cached = searchCache.get(key);
                return cached == null ? null : cached.results;
            }
        }
    }

    // ── airport list ────────────────────────────────────────────────────────────────

    private static JSONObject airport(String iata) {
        if (iata == null || iata.isEmpty()) {
            return null;
        }
        Map<String, JSONObject> airports = airportsByIata;
        if (airports == null) {
            airports = loadAirports();
        }
        return airports == null ? null : airports.get(iata.toUpperCase(Locale.US));
    }

    private static Map<String, JSONObject> loadAirports() {
        Context context = appContext;
        if (context == null) {
            return null;
        }
        synchronized (Fr24Bookmarks.class) {
            if (airportsByIata != null) {
                return airportsByIata;
            }
            File file = new File(context.getFilesDir(), AIRPORTS_FILE);
            boolean stale = !file.isFile() || System.currentTimeMillis() - file.lastModified() > AIRPORTS_MAX_AGE_MS;
            if (stale) {
                try {
                    String json = httpGet(AIRPORTS_URL);
                    new JSONObject(json).getJSONArray("rows");
                    writeFile(file, json);
                } catch (Throwable t) {
                    Log.w(TAG, "Airport list download failed: " + t);
                }
            }
            if (!file.isFile()) {
                return null;
            }
            try {
                JSONArray rows = new JSONObject(readFile(file)).getJSONArray("rows");
                Map<String, JSONObject> map = new HashMap<>(rows.length() * 2);
                for (int i = 0; i < rows.length(); i++) {
                    JSONObject row = rows.optJSONObject(i);
                    if (row == null) {
                        continue;
                    }
                    String code = row.optString("iata", "");
                    if (!code.isEmpty()) {
                        map.put(code.toUpperCase(Locale.US), row);
                    }
                }
                airportsByIata = map;
                Log.i(TAG, "Loaded " + map.size() + " airports");
                return map;
            } catch (Throwable t) {
                Log.w(TAG, "Airport list unreadable: " + t);
                file.delete();
                return null;
            }
        }
    }

    // ── helpers ─────────────────────────────────────────────────────────────────────

    private static Object gsonOf(Object provider) throws Exception {
        Class<?> clazz = provider.getClass();
        while (clazz != null && clazz != Object.class) {
            for (java.lang.reflect.Field field : clazz.getDeclaredFields()) {
                if ("com.google.gson.Gson".equals(field.getType().getName())) {
                    field.setAccessible(true);
                    Object gson = field.get(provider);
                    if (gson != null) {
                        return gson;
                    }
                }
            }
            clazz = clazz.getSuperclass();
        }
        throw new IllegalStateException("No Gson field on " + provider.getClass().getName());
    }

    private static String httpGet(String url) throws Exception {
        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
        connection.setConnectTimeout(HTTP_TIMEOUT_MS);
        connection.setReadTimeout(HTTP_TIMEOUT_MS);
        connection.setRequestProperty("User-Agent", userAgent());
        connection.setRequestProperty("Accept", "application/json");
        try {
            int code = connection.getResponseCode();
            if (code != HttpURLConnection.HTTP_OK) {
                throw new IllegalStateException("HTTP " + code);
            }
            try (InputStream in = connection.getInputStream()) {
                return readAll(in);
            }
        } finally {
            connection.disconnect();
        }
    }

    /**
     * The search and airport endpoints answer 403 to generic clients, so requests carry
     * the same User-Agent the app builds: its version code followed by the system agent.
     */
    private static String userAgent() {
        String agent = userAgent;
        if (agent != null) {
            return agent;
        }
        long versionCode = 0;
        Context context = appContext;
        if (context != null) {
            try {
                android.content.pm.PackageInfo info =
                    context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
                versionCode = android.os.Build.VERSION.SDK_INT >= 28 ? info.getLongVersionCode() : info.versionCode;
            } catch (Throwable t) {
                Log.w(TAG, "Package info unavailable: " + t);
            }
        }
        String system;
        try {
            system = System.getProperty("http.agent");
        } catch (Throwable t) {
            system = null;
        }
        agent = "Flightradar24/" + versionCode + " " + (system == null ? "Android unknown device" : system);
        userAgent = agent;
        return agent;
    }

    private static String readFile(File file) throws Exception {
        try (InputStream in = new FileInputStream(file)) {
            return readAll(in);
        }
    }

    private static void writeFile(File file, String content) throws Exception {
        File temp = new File(file.getPath() + ".tmp");
        try (OutputStream out = new FileOutputStream(temp)) {
            out.write(content.getBytes(StandardCharsets.UTF_8));
            out.flush();
        }
        if (!temp.renameTo(file)) {
            temp.delete();
            throw new IllegalStateException("Could not replace " + file.getName());
        }
    }

    private static String readAll(InputStream in) throws Exception {
        java.io.ByteArrayOutputStream buffer = new java.io.ByteArrayOutputStream();
        byte[] chunk = new byte[16384];
        int read;
        while ((read = in.read(chunk)) != -1) {
            buffer.write(chunk, 0, read);
        }
        return new String(buffer.toByteArray(), StandardCharsets.UTF_8);
    }
}
