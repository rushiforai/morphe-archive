package app.template.extension.extension;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Looper;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.zip.GZIPInputStream;

/**
 * Fills Flightradar24 aircraft panel fields that the server withholds from
 * non-subscribers, using open data sources:
 *
 * <ul>
 *   <li>Extended Mode S values (IAS, TAS, Mach, outside air temperature, GPS altitude
 *       and wind) from the adsb.lol public API, with opendata.adsb.fi as fallback.
 *       Both aggregate the same ADS-B broadcasts Flightradar24 receives.</li>
 *   <li>Serial number and build date from a weekly SQLite bundle built from the
 *       OpenSky Network aircraft database and tar1090-db.</li>
 *   <li>Flight information region from the VATSpy boundary set in the same bundle.</li>
 * </ul>
 *
 * Only fields that the server left empty are written. All work is wrapped so a
 * failure can never propagate into the app.
 */
public final class Fr24OpenData {
    private static final String TAG = "Fr24OpenData";
    private static final String DATA_DIR = "fr24opendata";
    private static final long DATA_MAX_AGE_MS = 30L * 24 * 60 * 60 * 1000;
    private static final long ADSB_CACHE_TTL_MS = 30_000L;
    private static final long ADSB_MIN_INTERVAL_MS = 1_100L;
    private static final int HTTP_TIMEOUT_MS = 4_000;
    private static final String FALLBACK_ADSB_URL = "https://opendata.adsb.fi/api/v2/hex/";

    private static volatile Context appContext;
    private static final ExecutorService executor = Executors.newSingleThreadExecutor();
    private static final AtomicBoolean refreshRunning = new AtomicBoolean(false);

    private static final Object adsbLock = new Object();
    private static final Map<String, AdsbEntry> adsbCache = new HashMap<>();
    private static long lastAdsbRequestMs = 0L;
    private static final Map<String, Boolean> adsbPending = new HashMap<>();

    private static volatile SQLiteDatabase aircraftDb;
    private static volatile List<Fir> firs;
    private static volatile int[][] countryRanges;
    private static volatile int[] countryIds;

    private Fr24OpenData() {
    }

    /** Replaced by the patch when the openDataBaseUrl option is set. */
    public static String getDataBaseUrl() {
        return "https://github.com/jagjordi/morphe-patches/releases/download/open-data/";
    }

    /** Replaced by the patch when the adsbApiUrl option is set. */
    public static String getAdsbApiUrl() {
        return "https://api.adsb.lol/v2/hex/";
    }

    /** Called from FR24Application.onCreate() with the application instance. */
    public static void init(Object application) {
        try {
            if (!(application instanceof Context)) {
                Log.w(TAG, "init called without a Context");
                return;
            }
            appContext = ((Context) application).getApplicationContext();
            executor.execute(Fr24OpenData::loadLocalData);
            executor.execute(Fr24OpenData::refreshDataIfStale);
            Log.i(TAG, "Initialised");
        } catch (Throwable t) {
            Log.w(TAG, "init failed", t);
        }
    }

    /** Called at the end of ClickhandlerData.<init>. */
    public static void enrich(Object clickhandlerData) {
        try {
            if (clickhandlerData == null) {
                return;
            }
            Object flightInfo = getField(clickhandlerData, "flightInfo");
            Object aircraftInfo = getField(clickhandlerData, "aircraftInfo");
            if (flightInfo == null) {
                return;
            }
            String hex = normalizeHex(asString(aircraftInfo == null ? null : getField(aircraftInfo, "icaoAddress")));
            String reg = normalizeReg(asString(aircraftInfo == null ? null : getField(aircraftInfo, "reg")));
            Log.d(TAG, "enrich reg=" + reg + " hex=" + hex + " thread=" + Thread.currentThread().getName());

            enrichEms(flightInfo, hex);
            enrichTransponder(flightInfo, hex);
            enrichAirspace(flightInfo);
            if (aircraftInfo != null) {
                enrichAircraft(aircraftInfo, reg, hex);
            }
        } catch (Throwable t) {
            Log.w(TAG, "enrich failed", t);
        }
    }

    // ── Extended Mode S ────────────────────────────────────────────────────────

    private static void enrichEms(Object flightInfo, String hex) throws Exception {
        if (hex == null) {
            return;
        }
        Field emsField = findField(flightInfo.getClass(), "ems");
        if (emsField == null) {
            return;
        }
        emsField.setAccessible(true);
        Object ems = emsField.get(flightInfo);
        boolean missing = ems == null
            || getField(ems, "ias") == null
            || getField(ems, "tas") == null
            || getField(ems, "mach") == null
            || getField(ems, "oat") == null
            || getField(ems, "agps") == null
            || getField(ems, "windSpeed") == null;
        if (!missing) {
            return;
        }
        AdsbEntry entry = lookupAdsb(hex);
        if (entry == null || entry.values == null) {
            Log.d(TAG, "no ADS-B data for " + hex + (entry == null ? " (pending)" : ""));
            return;
        }
        Log.d(TAG, "ADS-B data for " + hex + ": " + entry.values);
        if (ems == null) {
            ems = emsField.getType().getDeclaredConstructor().newInstance();
            emsField.set(flightInfo, ems);
        }
        JSONObject ac = entry.values;
        fillInteger(ems, "ias", "hasIas", ac, "ias", 1.0);
        fillInteger(ems, "tas", "hasTas", ac, "tas", 1.0);
        fillInteger(ems, "oat", "hasOat", ac, "oat", 1.0);
        fillInteger(ems, "agps", "hasAgps", ac, "alt_geom", 1.0);
        if (getField(ems, "mach") == null && ac.has("mach") && !ac.isNull("mach")) {
            int mach = (int) Math.round(ac.optDouble("mach") * 1000.0);
            if (mach >= 100 && mach < 1000) {
                setField(ems, "mach", mach);
                setBoolean(ems, "hasMach", true);
            }
        }
        if ((getField(ems, "windSpeed") == null || getField(ems, "windDirection") == null)
            && ac.has("wd") && ac.has("ws") && !ac.isNull("wd") && !ac.isNull("ws")) {
            setField(ems, "windDirection", (int) Math.round(ac.optDouble("wd")));
            setField(ems, "windSpeed", (int) Math.round(ac.optDouble("ws")));
            setBoolean(ems, "hasWind", true);
        }
    }

    /** Squawk and vertical speed live on the flight info object rather than on EmsData. */
    private static void enrichTransponder(Object flightInfo, String hex) throws Exception {
        if (hex == null) {
            return;
        }
        String squawk = asString(getField(flightInfo, "squawk"));
        boolean needSquawk = squawk == null || squawk.isEmpty() || "0000".equals(squawk) || "N/A".equals(squawk);
        boolean needVspeed = getField(flightInfo, "vspeed") == null;
        if (!needSquawk && !needVspeed) {
            return;
        }
        AdsbEntry entry;
        synchronized (adsbLock) {
            entry = adsbCache.get(hex);
        }
        if (entry == null || entry.values == null) {
            return;
        }
        JSONObject ac = entry.values;
        if (needSquawk && ac.has("squawk") && !ac.isNull("squawk")) {
            String value = ac.optString("squawk", "").trim();
            if (value.length() == 4 && !"0000".equals(value)) {
                setField(flightInfo, "squawk", value);
                setField(flightInfo, "squawkAvailability", Boolean.TRUE);
            }
        }
        if (needVspeed && ac.has("baro_rate") && !ac.isNull("baro_rate")) {
            setField(flightInfo, "vspeed", (int) Math.round(ac.optDouble("baro_rate")));
            setField(flightInfo, "vspeedAvailability", Boolean.TRUE);
        }
    }

    private static void fillInteger(Object ems, String field, String flag, JSONObject ac, String key, double scale) throws Exception {
        if (getField(ems, field) != null || !ac.has(key) || ac.isNull(key)) {
            return;
        }
        setField(ems, field, (int) Math.round(ac.optDouble(key) * scale));
        setBoolean(ems, flag, true);
    }

    private static AdsbEntry lookupAdsb(String hex) {
        long now = System.currentTimeMillis();
        synchronized (adsbLock) {
            AdsbEntry cached = adsbCache.get(hex);
            if (cached != null && now - cached.fetchedAt < ADSB_CACHE_TTL_MS) {
                return cached;
            }
        }
        boolean mainThread = Looper.getMainLooper().isCurrentThread();
        if (mainThread) {
            scheduleAdsbFetch(hex);
            synchronized (adsbLock) {
                return adsbCache.get(hex);
            }
        }
        return fetchAdsb(hex);
    }

    private static void scheduleAdsbFetch(final String hex) {
        synchronized (adsbLock) {
            if (Boolean.TRUE.equals(adsbPending.get(hex))) {
                return;
            }
            adsbPending.put(hex, Boolean.TRUE);
        }
        executor.execute(() -> {
            try {
                fetchAdsb(hex);
            } finally {
                synchronized (adsbLock) {
                    adsbPending.remove(hex);
                }
            }
        });
    }

    private static AdsbEntry fetchAdsb(String hex) {
        synchronized (adsbLock) {
            long wait = lastAdsbRequestMs + ADSB_MIN_INTERVAL_MS - System.currentTimeMillis();
            if (wait > 0) {
                try {
                    Thread.sleep(wait);
                } catch (InterruptedException ignored) {
                    Thread.currentThread().interrupt();
                }
            }
            lastAdsbRequestMs = System.currentTimeMillis();
        }
        JSONObject ac = null;
        String[] bases = {getAdsbApiUrl(), FALLBACK_ADSB_URL};
        for (String base : bases) {
            try {
                String body = httpGet(base + hex);
                if (body == null) {
                    continue;
                }
                JSONObject root = new JSONObject(body);
                JSONArray list = root.optJSONArray("ac");
                if (list != null && list.length() > 0) {
                    ac = list.getJSONObject(0);
                }
                break;
            } catch (Throwable t) {
                Log.d(TAG, "ADS-B lookup failed at " + base + ": " + t);
            }
        }
        AdsbEntry entry = new AdsbEntry(ac, System.currentTimeMillis());
        synchronized (adsbLock) {
            adsbCache.put(hex, entry);
            if (adsbCache.size() > 200) {
                adsbCache.clear();
                adsbCache.put(hex, entry);
            }
        }
        return entry;
    }

    private static final class AdsbEntry {
        final JSONObject values;
        final long fetchedAt;

        AdsbEntry(JSONObject values, long fetchedAt) {
            this.values = values;
            this.fetchedAt = fetchedAt;
        }
    }

    // ── Flight information region ─────────────────────────────────────────────

    private static void enrichAirspace(Object flightInfo) throws Exception {
        List<Fir> list = firs;
        if (list == null) {
            return;
        }
        Object ems = getField(flightInfo, "ems");
        if (ems == null) {
            return;
        }
        String current = asString(getField(ems, "airspace"));
        if (current != null && !current.trim().isEmpty()) {
            return;
        }
        Object latObj = getField(flightInfo, "lat");
        Object lonObj = getField(flightInfo, "lon");
        if (!(latObj instanceof Number) || !(lonObj instanceof Number)) {
            return;
        }
        double lat = ((Number) latObj).doubleValue();
        double lon = ((Number) lonObj).doubleValue();
        if (lat == 0.0 && lon == 0.0) {
            return;
        }
        Fir match = findFir(list, lat, lon);
        Log.d(TAG, "FIR for " + lat + "," + lon + ": " + (match == null ? "none" : match.id));
        if (match == null) {
            return;
        }
        String label = match.name == null || match.name.isEmpty() ? match.id : match.id + " " + match.name;
        setField(ems, "airspace", label);
        setBoolean(ems, "hasAirspace", true);
        Field airspaceField = findField(flightInfo.getClass(), "airspace");
        if (airspaceField != null) {
            airspaceField.setAccessible(true);
            if (airspaceField.get(flightInfo) == null) {
                airspaceField.set(flightInfo, label);
            }
        }
    }

    private static Fir findFir(List<Fir> list, double lat, double lon) {
        Fir oceanic = null;
        for (Fir fir : list) {
            if (!fir.contains(lon, lat)) {
                continue;
            }
            if (fir.oceanic) {
                if (oceanic == null) {
                    oceanic = fir;
                }
            } else {
                return fir;
            }
        }
        return oceanic;
    }

    private static final class Fir {
        final String id;
        final String name;
        final boolean oceanic;
        final List<double[]> rings;
        final double minLon;
        final double maxLon;
        final double minLat;
        final double maxLat;

        Fir(String id, String name, boolean oceanic, List<double[]> rings) {
            this.id = id;
            this.name = name;
            this.oceanic = oceanic;
            this.rings = rings;
            double a = Double.MAX_VALUE, b = -Double.MAX_VALUE, c = Double.MAX_VALUE, d = -Double.MAX_VALUE;
            for (double[] ring : rings) {
                for (int i = 0; i + 1 < ring.length; i += 2) {
                    a = Math.min(a, ring[i]);
                    b = Math.max(b, ring[i]);
                    c = Math.min(c, ring[i + 1]);
                    d = Math.max(d, ring[i + 1]);
                }
            }
            minLon = a;
            maxLon = b;
            minLat = c;
            maxLat = d;
        }

        boolean contains(double x, double y) {
            if (x < minLon || x > maxLon || y < minLat || y > maxLat) {
                return false;
            }
            for (double[] ring : rings) {
                if (pointInRing(ring, x, y)) {
                    return true;
                }
            }
            return false;
        }

        private static boolean pointInRing(double[] ring, double x, double y) {
            boolean inside = false;
            int n = ring.length / 2;
            for (int i = 0, j = n - 1; i < n; j = i++) {
                double xi = ring[2 * i], yi = ring[2 * i + 1];
                double xj = ring[2 * j], yj = ring[2 * j + 1];
                if ((yi > y) != (yj > y) && x < (xj - xi) * (y - yi) / (yj - yi) + xi) {
                    inside = !inside;
                }
            }
            return inside;
        }
    }

    // ── Serial number and age ─────────────────────────────────────────────────

    private static void enrichAircraft(Object aircraftInfo, String reg, String hex) throws Exception {
        enrichCountry(aircraftInfo, hex);
        SQLiteDatabase db = aircraftDb;
        if (db == null) {
            return;
        }
        // The server sends empty strings rather than nulls for withheld values.
        boolean needMsn = isBlank(getField(aircraftInfo, "msn"));
        boolean needAge = getField(aircraftInfo, "acAge") == null;
        if (!needMsn && !needAge) {
            return;
        }
        String[] row = queryAircraft(db, reg, hex);
        Log.d(TAG, "aircraft row for " + reg + "/" + hex + ": " + (row == null ? "none" : row[0] + " " + row[1]));
        if (row == null) {
            return;
        }
        if (needMsn && row[0] != null && !row[0].isEmpty()) {
            setField(aircraftInfo, "msn", row[0]);
            setField(aircraftInfo, "msnAvailable", Boolean.TRUE);
        }
        if (needAge && row[1] != null && row[1].length() >= 4) {
            Integer age = ageFromBuilt(row[1]);
            if (age != null) {
                setField(aircraftInfo, "acAge", age);
                setField(aircraftInfo, "ageAvailable", Boolean.TRUE);
                if (isBlank(getField(aircraftInfo, "acBirthDate"))) {
                    setField(aircraftInfo, "acBirthDate", row[1]);
                }
            }
        }
    }

    /** Country of registration from the ICAO 24-bit address allocation blocks. */
    private static void enrichCountry(Object aircraftInfo, String hex) throws Exception {
        int[][] ranges = countryRanges;
        int[] ids = countryIds;
        if (ranges == null || ids == null || hex == null) {
            return;
        }
        if (getField(aircraftInfo, "countryOfReg") != null) {
            return;
        }
        int address = Integer.parseInt(hex, 16);
        int lo = 0;
        int hi = ranges.length - 1;
        while (lo <= hi) {
            int mid = (lo + hi) >>> 1;
            if (address < ranges[mid][0]) {
                hi = mid - 1;
            } else if (address > ranges[mid][1]) {
                lo = mid + 1;
            } else {
                setField(aircraftInfo, "countryOfReg", ids[mid]);
                setField(aircraftInfo, "isCountryOfRegAvailable", Boolean.TRUE);
                return;
            }
        }
    }

    private static String[] queryAircraft(SQLiteDatabase db, String reg, String hex) {
        String[] result = null;
        if (reg != null) {
            result = queryOne(db, "SELECT msn, built FROM aircraft WHERE reg = ? LIMIT 1", reg);
        }
        if (result == null && hex != null) {
            result = queryOne(db, "SELECT msn, built FROM aircraft WHERE hex = ? LIMIT 1", hex);
        }
        return result;
    }

    private static String[] queryOne(SQLiteDatabase db, String sql, String arg) {
        try (Cursor cursor = db.rawQuery(sql, new String[]{arg})) {
            if (cursor.moveToFirst()) {
                return new String[]{cursor.isNull(0) ? null : cursor.getString(0), cursor.isNull(1) ? null : cursor.getString(1)};
            }
        } catch (Throwable t) {
            Log.d(TAG, "aircraft query failed: " + t);
        }
        return null;
    }

    private static Integer ageFromBuilt(String built) {
        try {
            int year = Integer.parseInt(built.substring(0, 4));
            Calendar now = Calendar.getInstance();
            int age = now.get(Calendar.YEAR) - year;
            if (built.length() >= 10 && !built.endsWith("-00-00")) {
                int month = Integer.parseInt(built.substring(5, 7));
                int day = Integer.parseInt(built.substring(8, 10));
                if (month >= 1 && month <= 12) {
                    int nowMonth = now.get(Calendar.MONTH) + 1;
                    int nowDay = now.get(Calendar.DAY_OF_MONTH);
                    if (nowMonth < month || (nowMonth == month && nowDay < day)) {
                        age -= 1;
                    }
                }
            }
            if (age < 0 || age > 120) {
                return null;
            }
            return age;
        } catch (Throwable t) {
            return null;
        }
    }

    // ── Data bundle management ────────────────────────────────────────────────

    private static File dataDir() {
        Context context = appContext;
        if (context == null) {
            return null;
        }
        File dir = new File(context.getFilesDir(), DATA_DIR);
        if (!dir.isDirectory() && !dir.mkdirs()) {
            return null;
        }
        return dir;
    }

    private static void loadLocalData() {
        try {
            File dir = dataDir();
            if (dir == null) {
                return;
            }
            File db = new File(dir, "aircraft.db");
            if (db.isFile() && aircraftDb == null) {
                openAircraftDb(db);
            }
            File firFile = new File(dir, "firs.json.gz");
            if (firFile.isFile() && firs == null) {
                loadFirs(firFile);
            }
            File countryFile = new File(dir, "countries.json");
            if (countryFile.isFile() && countryRanges == null) {
                loadCountries(countryFile);
            }
        } catch (Throwable t) {
            Log.w(TAG, "loading local data failed", t);
        }
    }

    private static void loadCountries(File file) {
        try (InputStream in = new java.io.FileInputStream(file)) {
            JSONArray array = new JSONObject(readAll(in)).getJSONArray("ranges");
            int[][] ranges = new int[array.length()][];
            int[] ids = new int[array.length()];
            for (int i = 0; i < array.length(); i++) {
                JSONArray item = array.getJSONArray(i);
                ranges[i] = new int[]{item.getInt(0), item.getInt(1)};
                ids[i] = item.getInt(2);
            }
            for (int i = 1; i < ranges.length; i++) {
                if (ranges[i][0] <= ranges[i - 1][1]) {
                    throw new IllegalStateException("country ranges are not sorted");
                }
            }
            countryRanges = ranges;
            countryIds = ids;
            Log.i(TAG, "Country blocks ready: " + ranges.length);
        } catch (Throwable t) {
            Log.w(TAG, "loading country blocks failed", t);
        }
    }

    private static void openAircraftDb(File db) {
        try {
            SQLiteDatabase opened = SQLiteDatabase.openDatabase(db.getPath(), null, SQLiteDatabase.OPEN_READONLY);
            SQLiteDatabase previous = aircraftDb;
            aircraftDb = opened;
            if (previous != null) {
                previous.close();
            }
            Log.i(TAG, "Aircraft database ready: " + db.length() / 1048576 + " MB");
        } catch (Throwable t) {
            Log.w(TAG, "opening aircraft database failed", t);
        }
    }

    private static void loadFirs(File file) {
        try (InputStream in = new GZIPInputStream(new java.io.FileInputStream(file))) {
            String json = readAll(in);
            JSONObject root = new JSONObject(json);
            JSONArray array = root.getJSONArray("firs");
            List<Fir> list = new ArrayList<>(array.length());
            for (int i = 0; i < array.length(); i++) {
                JSONObject item = array.getJSONObject(i);
                JSONArray ringsJson = item.getJSONArray("rings");
                List<double[]> rings = new ArrayList<>(ringsJson.length());
                for (int r = 0; r < ringsJson.length(); r++) {
                    JSONArray flat = ringsJson.getJSONArray(r);
                    double[] ring = new double[flat.length()];
                    for (int k = 0; k < flat.length(); k++) {
                        ring[k] = flat.getDouble(k);
                    }
                    rings.add(ring);
                }
                list.add(new Fir(item.getString("id"), item.optString("name", ""), item.optInt("oceanic", 0) == 1, rings));
            }
            firs = list;
            Log.i(TAG, "FIR boundaries ready: " + list.size());
        } catch (Throwable t) {
            Log.w(TAG, "loading FIR boundaries failed", t);
        }
    }

    private static void refreshDataIfStale() {
        if (!refreshRunning.compareAndSet(false, true)) {
            return;
        }
        try {
            File dir = dataDir();
            if (dir == null) {
                return;
            }
            long now = System.currentTimeMillis();
            File db = new File(dir, "aircraft.db");
            if (!db.isFile() || now - db.lastModified() > DATA_MAX_AGE_MS) {
                File tmp = new File(dir, "aircraft.db.tmp");
                if (downloadGzip(getDataBaseUrl() + "aircraft.db.gz", tmp) && tmp.renameTo(db)) {
                    openAircraftDb(db);
                }
            }
            File firFile = new File(dir, "firs.json.gz");
            if (!firFile.isFile() || now - firFile.lastModified() > DATA_MAX_AGE_MS) {
                File tmp = new File(dir, "firs.json.gz.tmp");
                if (downloadRaw(getDataBaseUrl() + "firs.json.gz", tmp) && tmp.renameTo(firFile)) {
                    loadFirs(firFile);
                }
            }
            File countryFile = new File(dir, "countries.json");
            if (!countryFile.isFile() || now - countryFile.lastModified() > DATA_MAX_AGE_MS) {
                File tmp = new File(dir, "countries.json.tmp");
                if (downloadRaw(getDataBaseUrl() + "countries.json", tmp) && tmp.renameTo(countryFile)) {
                    loadCountries(countryFile);
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "data refresh failed", t);
        } finally {
            refreshRunning.set(false);
        }
    }

    private static boolean downloadGzip(String url, File target) {
        try {
            HttpURLConnection connection = open(url);
            try (InputStream in = new GZIPInputStream(connection.getInputStream());
                 OutputStream out = new FileOutputStream(target)) {
                copy(in, out);
            } finally {
                connection.disconnect();
            }
            Log.i(TAG, "Downloaded " + url);
            return target.length() > 0;
        } catch (Throwable t) {
            Log.w(TAG, "download failed: " + url + ": " + t);
            target.delete();
            return false;
        }
    }

    private static boolean downloadRaw(String url, File target) {
        try {
            HttpURLConnection connection = open(url);
            try (InputStream in = connection.getInputStream();
                 OutputStream out = new FileOutputStream(target)) {
                copy(in, out);
            } finally {
                connection.disconnect();
            }
            Log.i(TAG, "Downloaded " + url);
            return target.length() > 0;
        } catch (Throwable t) {
            Log.w(TAG, "download failed: " + url + ": " + t);
            target.delete();
            return false;
        }
    }

    private static HttpURLConnection open(String url) throws Exception {
        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
        connection.setConnectTimeout(15_000);
        connection.setReadTimeout(60_000);
        connection.setRequestProperty("User-Agent", "Fr24OpenData/1.0 (+https://github.com/jagjordi/morphe-patches)");
        connection.setInstanceFollowRedirects(true);
        int code = connection.getResponseCode();
        if (code == HttpURLConnection.HTTP_MOVED_PERM || code == HttpURLConnection.HTTP_MOVED_TEMP
            || code == HttpURLConnection.HTTP_SEE_OTHER || code == 307 || code == 308) {
            String location = connection.getHeaderField("Location");
            connection.disconnect();
            if (location == null) {
                throw new IllegalStateException("redirect without location");
            }
            return open(location);
        }
        if (code != HttpURLConnection.HTTP_OK) {
            connection.disconnect();
            throw new IllegalStateException("HTTP " + code);
        }
        return connection;
    }

    /** Small JSON GET shared with the weather helper. */
    public static String httpGetPublic(String url) throws Exception {
        return httpGet(url);
    }

    private static String httpGet(String url) throws Exception {
        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
        connection.setConnectTimeout(HTTP_TIMEOUT_MS);
        connection.setReadTimeout(HTTP_TIMEOUT_MS);
        connection.setRequestProperty("User-Agent", "Fr24OpenData/1.0 (+https://github.com/jagjordi/morphe-patches)");
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

    private static String readAll(InputStream in) throws Exception {
        StringBuilder builder = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(in, StandardCharsets.UTF_8))) {
            char[] buffer = new char[8192];
            int read;
            while ((read = reader.read(buffer)) != -1) {
                builder.append(buffer, 0, read);
            }
        }
        return builder.toString();
    }

    private static void copy(InputStream in, OutputStream out) throws Exception {
        byte[] buffer = new byte[65536];
        int read;
        while ((read = in.read(buffer)) != -1) {
            out.write(buffer, 0, read);
        }
        out.flush();
    }

    // ── Reflection helpers ────────────────────────────────────────────────────

    private static Field findField(Class<?> clazz, String name) {
        Class<?> current = clazz;
        while (current != null && current != Object.class) {
            try {
                return current.getDeclaredField(name);
            } catch (NoSuchFieldException ignored) {
                current = current.getSuperclass();
            }
        }
        return null;
    }

    private static Object getField(Object target, String name) throws Exception {
        Field field = findField(target.getClass(), name);
        if (field == null) {
            return null;
        }
        field.setAccessible(true);
        return field.get(target);
    }

    private static void setField(Object target, String name, Object value) throws Exception {
        Field field = findField(target.getClass(), name);
        if (field == null) {
            return;
        }
        field.setAccessible(true);
        field.set(target, value);
    }

    private static void setBoolean(Object target, String name, boolean value) throws Exception {
        Field field = findField(target.getClass(), name);
        if (field == null) {
            return;
        }
        field.setAccessible(true);
        field.setBoolean(target, value);
    }

    private static boolean isBlank(Object value) {
        return value == null || value.toString().trim().isEmpty();
    }

    private static String asString(Object value) {
        return value == null ? null : value.toString();
    }

    private static String normalizeHex(String hex) {
        if (hex == null) {
            return null;
        }
        String value = hex.trim().toLowerCase(Locale.US);
        if (value.length() != 6) {
            return null;
        }
        for (int i = 0; i < 6; i++) {
            if (Character.digit(value.charAt(i), 16) < 0) {
                return null;
            }
        }
        return value;
    }

    private static String normalizeReg(String reg) {
        if (reg == null) {
            return null;
        }
        String value = reg.trim().toUpperCase(Locale.US).replace(" ", "");
        return value.isEmpty() ? null : value;
    }
}
