package app.template.extension.niagaralauncher;

import android.content.Context;

import org.json.*;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.time.*;
import java.util.*;
import java.util.concurrent.*;

public final class WeatherEngine {
    private static final long FRESH = 3600000, STALE = 10800000;
    private static final Map<String, Long> RETRY = new ConcurrentHashMap<>();
    public static final Map<String, String> STATUS = new ConcurrentHashMap<>();

    static String sha(String s) throws Exception {
        byte[] b = MessageDigest.getInstance("SHA-256").digest(s.getBytes(StandardCharsets.UTF_8));
        StringBuilder out = new StringBuilder();
        for (byte x : b) out.append(String.format(Locale.ROOT, "%02x", x & 255));
        return out.toString();
    }

    static JSONObject read(File f) throws Exception {
        if (f.length() > 2000000) throw new IOException("Cache limit");
        try (InputStream in = new FileInputStream(f);
                ByteArrayOutputStream out = new ByteArrayOutputStream()) {
            byte[] b = new byte[8192];
            int n;
            while ((n = in.read(b)) != -1) out.write(b, 0, n);
            return new JSONObject(out.toString("UTF-8"));
        }
    }

    static void write(File dest, JSONObject o) throws Exception {
        File temp = File.createTempFile("forecast-", ".tmp", dest.getParentFile());
        try {
            try (FileOutputStream out = new FileOutputStream(temp)) {
                out.write(o.toString().getBytes(StandardCharsets.UTF_8));
                out.getFD().sync();
            }
            if (!temp.renameTo(dest)) throw new IOException("Cache commit failed");
        } finally {
            if (temp.exists()) temp.delete();
        }
    }

    public static WeatherData source(
            Context c,
            WeatherSource s,
            double lat,
            double lon,
            ZoneId zone,
            long generation,
            boolean test)
            throws Exception {
        long now = System.currentTimeMillis();
        String key = sha(s.json().toString() + "|" + lat + "|" + lon + "|" + zone.getId());
        File folder = new File(c.getCacheDir(), "urro-weather-v2");
        if (!folder.isDirectory() && !folder.mkdirs()) throw new IOException("Cache directory");
        File file = new File(folder, key + ".json");
        JSONObject cache = null;
        try {
            cache = read(file);
        } catch (Exception ignored) {
        }
        if (!test && cache != null && now - cache.optLong("saved") < FRESH) {
            STATUS.put(
                    s.id,
                    "Cached · " + Math.max(0, (now - cache.optLong("saved")) / 60000) + " min");
            return WeatherData.read(cache.getJSONObject("data"));
        }
        if (!test && RETRY.getOrDefault(key, 0L) > now) {
            if (cache != null && now - cache.optLong("saved") < STALE)
                return WeatherData.read(cache.getJSONObject("data"));
            throw new IOException("Retry backoff");
        }
        try {
            WeatherData d =
                    WeatherProviders.fetch(
                            s, lat, lon, now / 1000, zone, WeatherProviders::request);
            if (!d.available()) throw new IOException("No mapped weather values");
            if (!test && generation != WeatherSources.GENERATION.get())
                throw new CancellationException("Settings changed");
            write(file, new JSONObject().put("saved", now).put("data", d.json()));
            RETRY.remove(key);
            STATUS.put(s.id, "Updated just now");
            return d;
        } catch (CancellationException e) {
            throw e;
        } catch (Exception e) {
            RETRY.put(key, now + 60000);
            if (!test && cache != null && now - cache.optLong("saved") < STALE) {
                WeatherData d = WeatherData.read(cache.getJSONObject("data"));
                d.warnings.add(s.name + ": using older cached forecast");
                STATUS.put(
                        s.id, "Older cache · " + ((now - cache.optLong("saved")) / 60000) + " min");
                return d;
            }
            STATUS.put(s.id, "Unavailable · " + e.getClass().getSimpleName());
            throw e;
        }
    }

    public static WeatherData load(Context c, double lat, double lon) throws Exception {
        long generation = WeatherSources.GENERATION.get(), now = System.currentTimeMillis() / 1000;
        ZoneId zone = ZoneId.systemDefault();
        if (!WeatherSources.shown(c)) throw new IOException("Weather is off");
        WeatherData merged =
                WeatherSelection.select(
                        WeatherSources.load(c),
                        WeatherSources.aggregate(c),
                        source -> source(c, source, lat, lon, zone, generation, false),
                        now,
                        zone,
                        25000,
                        () -> {
                            if (generation != WeatherSources.GENERATION.get())
                                throw new CancellationException("Settings changed");
                        });
        if (merged.current == null || !merged.current.temperature())
            throw new IOException("No current temperature from enabled sources");
        return merged;
    }
}
