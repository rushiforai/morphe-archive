package app.d0nj.extension.niagara;

import org.json.JSONArray;
import org.json.JSONObject;

import java.lang.reflect.Field;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * Encoding and fetch helpers shared by the weather provider adapters. The output
 * shape is the OpenWeatherMap One Call payload Niagara Launcher deserializes.
 */
final class NiagaraWeather {

    private static final long CACHE_MAX_AGE_MS = 3 * 60 * 60 * 1000L;
    private static final double CACHE_COORD_TOLERANCE = 0.01;

    private NiagaraWeather() {
    }

    static double round(double value) {
        return Math.round(value * 10.0) / 10.0;
    }

    /**
     * Reads latitude and longitude from a Niagara coordinates object. Field
     * names are matched first because {@code getDeclaredFields()} order is
     * unspecified and varies between runs; the +/-90 bound is only a fallback
     * for obfuscated fields, and it cannot tell the pair apart when both
     * values fall inside it.
     */
    static float[] latLonOf(Object coordinates) throws Exception {
        Field[] floats = floatFields(coordinates.getClass());
        if (floats.length < 2) {
            return null;
        }
        Field latitude = null;
        Field longitude = null;
        for (Field field : floats) {
            String name = field.getName().toLowerCase(Locale.ROOT);
            if (latitude == null && name.startsWith("lat")) {
                latitude = field;
            } else if (longitude == null && name.startsWith("lon")) {
                longitude = field;
            }
        }
        if (latitude != null && longitude != null) {
            return new float[] { latitude.getFloat(coordinates), longitude.getFloat(coordinates) };
        }
        float first = floats[0].getFloat(coordinates);
        float second = floats[1].getFloat(coordinates);
        return Math.abs(first) > 90f
            ? new float[] { second, first }
            : new float[] { first, second };
    }

    static Field[] floatFields(Class<?> type) {
        List<Field> floats = new ArrayList<>();
        for (Field field : type.getDeclaredFields()) {
            if (field.getType() != float.class) {
                continue;
            }
            field.setAccessible(true);
            floats.add(field);
        }
        return floats.toArray(new Field[0]);
    }

    static JSONArray conditions(int owmId, String description, boolean day) throws Exception {
        return new JSONArray().put(new JSONObject()
            .put("id", owmId)
            .put("description", description)
            .put("icon", day ? "d" : "n"));
    }

    static String payload(String provider, String lat, String lon, JSONObject current,
                          JSONArray hourly, JSONArray daily) throws Exception {
        JSONObject root = new JSONObject();
        root.put("timestamp", Instant.now().getEpochSecond());
        root.put("provider", provider);
        root.put("lat", lat);
        root.put("long", lon);
        root.put("lang", "en");
        root.put("forecast", new JSONObject()
            .put("current", current)
            .put("minutely", new JSONArray())
            .put("hourly", hourly)
            .put("daily", daily));
        return root.toString();
    }

    /**
     * Runs {@code fetch} off the caller's thread. Niagara invokes the provider on
     * a dispatcher that may be main, where blocking network I/O throws, so the
     * work always runs on a short-lived worker.
     *
     * @return the worker's value, or null if it failed or overran {@code timeoutMs}.
     */
    static String offMain(String name, long timeoutMs, Fetcher fetch) {
        final String[] holder = new String[1];
        Thread worker = new Thread(new Runnable() {
            @Override
            public void run() {
                holder[0] = fetch.run();
            }
        }, name);
        worker.setDaemon(true);
        worker.start();
        try {
            worker.join(timeoutMs);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            return null;
        }
        if (worker.isAlive()) {
            worker.interrupt();
            return null;
        }
        return holder[0];
    }

    /**
     * Remembers the last successful payload so a transient upstream failure
     * keeps the tile populated instead of dropping to a placeholder. Also
     * persisted, because the first fetch after a cold start is the one most
     * likely to fail — the provider it reads may not be running yet — and
     * without a stored payload that moment shows a fabricated value.
     */
    static final class Cache {

        private static final String PREFS = "app.d0nj.extension.niagara.weather";

        private final String name;
        private boolean loaded;

        private volatile String payload;
        private volatile float lat;
        private volatile float lon;
        private volatile long atMs;

        Cache(String name) {
            this.name = name;
        }

        String get(float lat, float lon) {
            ensureLoaded();
            String cached = payload;
            if (cached == null) {
                return null;
            }
            if (System.currentTimeMillis() - atMs > CACHE_MAX_AGE_MS) {
                return null;
            }
            if (Math.abs(this.lat - lat) > CACHE_COORD_TOLERANCE
                    || Math.abs(this.lon - lon) > CACHE_COORD_TOLERANCE) {
                return null;
            }
            return cached;
        }

        void put(String payload, float lat, float lon) {
            this.payload = payload;
            this.lat = lat;
            this.lon = lon;
            this.atMs = System.currentTimeMillis();
            persist();
        }

        private synchronized void ensureLoaded() {
            if (loaded) {
                return;
            }
            loaded = true;
            try {
                android.content.SharedPreferences prefs = preferences();
                if (prefs == null) {
                    return;
                }
                String stored = prefs.getString(name + ".payload", null);
                if (stored == null) {
                    return;
                }
                payload = stored;
                lat = prefs.getFloat(name + ".lat", 0f);
                lon = prefs.getFloat(name + ".lon", 0f);
                atMs = prefs.getLong(name + ".at", 0L);
            } catch (Throwable t) {
                android.util.Log.e("NiagaraWeather", "cache load failed", t);
            }
        }

        private synchronized void persist() {
            try {
                android.content.SharedPreferences prefs = preferences();
                if (prefs == null) {
                    return;
                }
                prefs.edit()
                    .putString(name + ".payload", payload)
                    .putFloat(name + ".lat", lat)
                    .putFloat(name + ".lon", lon)
                    .putLong(name + ".at", atMs)
                    .apply();
            } catch (Throwable t) {
                android.util.Log.e("NiagaraWeather", "cache save failed", t);
            }
        }

        private static android.content.SharedPreferences preferences() {
            android.content.Context context = applicationContext();
            if (context == null) {
                return null;
            }
            return context.getSharedPreferences(PREFS, android.content.Context.MODE_PRIVATE);
        }
    }

    static android.content.Context applicationContext() {
        android.content.Context cached = appContext;
        if (cached != null) {
            return cached;
        }
        try {
            Class<?> threadClass = Class.forName("android.app.ActivityThread");
            Object thread = threadClass.getMethod("currentActivityThread").invoke(null);
            android.content.Context context =
                (android.content.Context) threadClass.getMethod("getApplication").invoke(thread);
            if (context != null) {
                appContext = context;
            }
            return context;
        } catch (Throwable t) {
            android.util.Log.e("NiagaraWeather", "no application context", t);
            return null;
        }
    }

    private static volatile android.content.Context appContext;

    interface Fetcher {
        String run();
    }

    /**
     * Sunrise and sunset for a local date at a place, as epoch seconds. NOAA
     * fractional-year approximation; a minute of drift is irrelevant for a
     * weather tile. Polar day and night fall back to 06:00/18:00 local so the
     * downstream day/night logic still has a usable window.
     */
    static long[] sunTimes(LocalDate date, double lat, double lon, ZoneId zone) {
        double g = 2.0 * Math.PI / 365.0 * (date.getDayOfYear() - 1 + 0.5);
        double eqtime = 229.18 * (0.000075 + 0.001868 * Math.cos(g) - 0.032077 * Math.sin(g)
                - 0.014615 * Math.cos(2 * g) - 0.040849 * Math.sin(2 * g));
        double decl = 0.006918 - 0.399912 * Math.cos(g) + 0.070257 * Math.sin(g)
                - 0.006758 * Math.cos(2 * g) + 0.000907 * Math.sin(2 * g)
                - 0.002697 * Math.cos(3 * g) + 0.00148 * Math.sin(3 * g);
        double cosHa = Math.cos(Math.toRadians(90.833))
                / (Math.cos(Math.toRadians(lat)) * Math.cos(decl))
                - Math.tan(Math.toRadians(lat)) * Math.tan(decl);
        if (cosHa < -1.0 || cosHa > 1.0) {
            return new long[] {
                date.atTime(6, 0).atZone(zone).toEpochSecond(),
                date.atTime(18, 0).atZone(zone).toEpochSecond(),
            };
        }
        double haDeg = Math.toDegrees(Math.acos(cosHa));
        long utcMidnight = date.atTime(12, 0).toEpochSecond(ZoneOffset.UTC) - 43_200L;
        long sunrise = utcMidnight + (long) ((720 - 4.0 * (lon + haDeg) - eqtime) * 60.0);
        long sunset = utcMidnight + (long) ((720 - 4.0 * (lon - haDeg) - eqtime) * 60.0);
        return new long[] { sunrise, sunset };
    }

    static ZoneId zoneOf(String timezone) {
        if (timezone == null || timezone.isEmpty()) {
            return ZoneId.systemDefault();
        }
        try {
            return ZoneId.of(timezone);
        } catch (Exception e) {
            return ZoneId.systemDefault();
        }
    }
}
