package app.d0nj.extension.niagara;

import android.content.Context;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.net.Uri;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.GZIPInputStream;

/**
 * Reads Breezy Weather's exported ContentProvider and re-encodes the gzipped
 * response as the OpenWeatherMap One Call payload Niagara Launcher
 * already deserializes.
 */
public final class BreezyWeather {

    private static final String BREEZY_PACKAGE = "org.breezyweather";
    private static final String AUTHORITY = BREEZY_PACKAGE + ".provider.weather";
    private static final String READ_PERMISSION = BREEZY_PACKAGE + ".READ_PROVIDER";
    private static final int MAX_BLOB_BYTES = 8 * 1024 * 1024;
    private static final double NEARBY_DEGREES = 0.5;

    /** Sentinel returned when the provider read or decoding fails. */
    public static final String FAILED = "__breezy_failed__";

    /** Last successful payload, reused when a refresh for the same place fails. */
    private static final NiagaraWeather.Cache CACHE = new NiagaraWeather.Cache("breezy");

    private static volatile String lastFailureReason = "Breezy Weather is unavailable";

    private BreezyWeather() {
    }

    /** Fetches a forecast for a Niagara coordinates object, or {@link #FAILED}. Never throws. */
    public static String forecast(Object coordinates) {
        if (coordinates == null) {
            android.util.Log.e("BreezyWeather", "coordinates null");
            lastFailureReason = "Breezy Weather is unavailable";
            return FAILED;
        }
        try {
            float[] latLon = NiagaraWeather.latLonOf(coordinates);
            if (latLon == null) {
                android.util.Log.e("BreezyWeather", "no float fields on " + coordinates.getClass());
                lastFailureReason = "Breezy Weather is unavailable";
                return FAILED;
            }
            final float lat = latLon[0];
            final float lon = latLon[1];
            String result = fetchWithRetry(lat, lon);
            if (result == null) {
                String cached = CACHE.get(lat, lon);
                if (cached != null) {
                    android.util.Log.e("BreezyWeather", "reusing last good payload");
                    return cached;
                }
                return FAILED;
            }
            CACHE.put(result, lat, lon);
            return result;
        } catch (Throwable t) {
            android.util.Log.e("BreezyWeather", "forecast failed", t);
            lastFailureReason = "Breezy Weather is unavailable";
            return FAILED;
        }
    }

    /**
     * The first read after a cold start often loses a race with Breezy Weather's
     * own process spinning up, which is the failure users see as a placeholder
     * until the next refresh. A couple of short retries close that window.
     */
    private static String fetchWithRetry(float lat, float lon) {
        String result = null;
        for (int attempt = 1; attempt <= 3; attempt++) {
            result = NiagaraWeather.offMain("breezy-fetch", 20_000L, () -> fetch(lat, lon));
            if (result != null) {
                return result;
            }
            android.util.Log.e("BreezyWeather", "fetch attempt " + attempt + " failed");
            if (attempt < 3) {
                try {
                    Thread.sleep(1_500L);
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                    return null;
                }
            }
        }
        return result;
    }

    /** Never throws: the patched call site has no catch, so a payload must always come back. */
    public static String requireForecast(String forecast) {
        if (forecast != null && !FAILED.equals(forecast)) {
            return forecast;
        }
        android.util.Log.e("BreezyWeather", "returning fallback payload");
        return fallback();
    }

    private static String fallback() {
        String reason = lastFailureReason;
        if (reason == null || reason.isEmpty()) {
            reason = "Breezy Weather is unavailable";
        }
        long now = Instant.now().getEpochSecond();
        try {
            return NiagaraWeather.payload("breezy-weather", "0", "0",
                new JSONObject()
                    .put("dt", now)
                    .put("temp", 0.0)
                    .put("feels_like", 0.0)
                    .put("weather", NiagaraWeather.conditions(800, reason, true)),
                new JSONArray(),
                new JSONArray());
        } catch (Exception e) {
            return "{}";
        }
    }

    private static String fetch(float lat, float lon) {
        try {
            Context context = applicationContext();
            if (context == null) {
                return fail("Breezy Weather is not ready");
            }
            if (context.getPackageManager().checkPermission(READ_PERMISSION, context.getPackageName())
                    != PackageManager.PERMISSION_GRANTED) {
                return fail("Grant Niagara the Breezy Weather read permission");
            }
            Integer major = readMajor(context);
            if (major == null) {
                return null;
            }
            if (major != 0) {
                return fail("Unsupported Breezy Weather version");
            }
            Location target = locations(context, lat, lon);
            if (target == null) {
                return null;
            }
            return weather(context, target);
        } catch (SecurityException e) {
            android.util.Log.e("BreezyWeather", "fetch denied", e);
            return fail("Grant Niagara the Breezy Weather read permission");
        } catch (Exception e) {
            android.util.Log.e("BreezyWeather", "fetch failed", e);
            return fail("Breezy Weather is unavailable");
        }
    }

    private static Context applicationContext() {
        Context context = NiagaraWeather.applicationContext();
        if (context == null) {
            lastFailureReason = "Breezy Weather is not ready";
        }
        return context;
    }

    private static Cursor query(Context context, Uri uri, String selection) {
        try {
            Cursor cursor = context.getContentResolver().query(uri, null, selection, null, null);
            if (cursor == null) {
                lastFailureReason = "Breezy Weather is not installed";
            }
            return cursor;
        } catch (SecurityException e) {
            android.util.Log.e("BreezyWeather", "query denied: " + uri, e);
            lastFailureReason = "Grant Niagara the Breezy Weather read permission";
            return null;
        } catch (IllegalArgumentException e) {
            android.util.Log.e("BreezyWeather", "provider missing: " + uri, e);
            lastFailureReason = "Breezy Weather is not installed";
            return null;
        } catch (Exception e) {
            android.util.Log.e("BreezyWeather", "query failed: " + uri, e);
            lastFailureReason = "Breezy Weather is unavailable";
            return null;
        }
    }

    private static Integer readMajor(Context context) {
        Cursor cursor = query(context, Uri.parse("content://" + AUTHORITY + "/version"), null);
        if (cursor == null) {
            return null;
        }
        try {
            if (!cursor.moveToFirst()) {
                lastFailureReason = "Breezy Weather is not installed";
                return null;
            }
            return cursor.getInt(cursor.getColumnIndexOrThrow("major"));
        } catch (SecurityException e) {
            android.util.Log.e("BreezyWeather", "version denied", e);
            lastFailureReason = "Grant Niagara the Breezy Weather read permission";
            return null;
        } catch (Exception e) {
            android.util.Log.e("BreezyWeather", "version read failed", e);
            lastFailureReason = "Unsupported Breezy Weather version";
            return null;
        } finally {
            cursor.close();
        }
    }

    private static Location locations(Context context, float lat, float lon) {
        Uri uri = Uri.parse("content://" + AUTHORITY + "/locations").buildUpon()
            .appendQueryParameter("limit", "50")
            .build();
        Cursor cursor = query(context, uri, null);
        if (cursor == null) {
            return null;
        }
        List<Location> found = new ArrayList<>();
        try {
            int idIndex = cursor.getColumnIndexOrThrow("id");
            int latIndex = cursor.getColumnIndexOrThrow("latitude");
            int lonIndex = cursor.getColumnIndexOrThrow("longitude");
            int currentIndex = cursor.getColumnIndex("is_current_position");
            while (cursor.moveToNext()) {
                String id = cursor.getString(idIndex);
                if (id == null) {
                    continue;
                }
                Location location = new Location();
                location.id = id;
                location.lat = cursor.getDouble(latIndex);
                location.lon = cursor.getDouble(lonIndex);
                location.currentPosition = currentIndex >= 0 && cursor.getInt(currentIndex) == 1;
                found.add(location);
            }
        } catch (SecurityException e) {
            android.util.Log.e("BreezyWeather", "locations denied", e);
            lastFailureReason = "Grant Niagara the Breezy Weather read permission";
            return null;
        } catch (Exception e) {
            android.util.Log.e("BreezyWeather", "locations read failed", e);
            lastFailureReason = "Breezy Weather is unavailable";
            return null;
        } finally {
            cursor.close();
        }
        if (found.isEmpty()) {
            lastFailureReason = "Add a location in Breezy Weather";
            return null;
        }
        Location nearest = null;
        double best = Double.MAX_VALUE;
        for (Location location : found) {
            double distance = Math.abs(location.lat - lat) + Math.abs(location.lon - lon);
            if (distance < best) {
                best = distance;
                nearest = location;
            }
        }
        if (nearest != null && best <= NEARBY_DEGREES) {
            return nearest;
        }
        for (Location location : found) {
            if (location.currentPosition) {
                return location;
            }
        }
        lastFailureReason = "No Breezy Weather location near this one";
        return null;
    }

    private static String weather(Context context, Location target) {
        Uri uri = Uri.parse("content://" + AUTHORITY + "/weather").buildUpon()
            .appendQueryParameter("withDaily", "true")
            .appendQueryParameter("withHourly", "true")
            .appendQueryParameter("withMinutely", "false")
            .appendQueryParameter("withAlerts", "false")
            .appendQueryParameter("withNormals", "false")
            .appendQueryParameter("temperatureUnit", "c")
            .build();
        // The provider parses raw ids such as "CURRENT_POSITION" or "lat&lon&source".
        Cursor cursor = query(context, uri, "id=" + target.id);
        if (cursor == null) {
            return null;
        }
        try {
            if (!cursor.moveToFirst()) {
                return fail("Open Breezy Weather and refresh its weather");
            }
            byte[] blob = cursor.getBlob(cursor.getColumnIndexOrThrow("weather"));
            if (blob == null) {
                return fail("Open Breezy Weather and refresh its weather");
            }
            if (blob.length > MAX_BLOB_BYTES) {
                return fail("Breezy Weather data is corrupt");
            }
            double lat = cursor.getDouble(cursor.getColumnIndexOrThrow("latitude"));
            double lon = cursor.getDouble(cursor.getColumnIndexOrThrow("longitude"));
            String timezone = cursor.getString(cursor.getColumnIndexOrThrow("timezone"));
            return convert(blob, lat, lon, timezone);
        } catch (SecurityException e) {
            android.util.Log.e("BreezyWeather", "weather denied", e);
            return fail("Grant Niagara the Breezy Weather read permission");
        } catch (Exception e) {
            android.util.Log.e("BreezyWeather", "weather read failed", e);
            return fail("Breezy Weather data is corrupt");
        } finally {
            cursor.close();
        }
    }

    private static JSONObject readJson(byte[] blob) throws Exception {
        try (InputStream in = new GZIPInputStream(new ByteArrayInputStream(blob));
             ByteArrayOutputStream out = new ByteArrayOutputStream()) {
            byte[] buffer = new byte[8192];
            int total = 0;
            int count;
            while ((count = in.read(buffer)) != -1) {
                total += count;
                if (total > MAX_BLOB_BYTES) {
                    throw new IllegalStateException("blob exceeds " + MAX_BLOB_BYTES + " bytes");
                }
                out.write(buffer, 0, count);
            }
            String body = out.toString(StandardCharsets.UTF_8.name()).trim();
            // Breezy exports JSON null until it has fetched weather of its own,
            // which is the ordinary state right after installing it.
            if (body.isEmpty() || "null".equals(body)) {
                return null;
            }
            return new JSONObject(body);
        }
    }

    private static String convert(byte[] blob, double lat, double lon, String timezone) {
        JSONObject root;
        try {
            root = readJson(blob);
        } catch (Exception e) {
            android.util.Log.e("BreezyWeather", "decompress failed", e);
            return fail("Breezy Weather data is corrupt");
        }
        if (root == null) {
            return fail("Open Breezy Weather and refresh its weather");
        }
        ZoneId zone = NiagaraWeather.zoneOf(timezone);
        JSONObject current;
        JSONArray hourly;
        JSONArray daily;
        try {
            current = current(root, lat, lon, zone);
            if (current == null) {
                return null;
            }
            hourly = hourly(root);
            daily = daily(root, lat, lon, zone);
        } catch (Exception e) {
            android.util.Log.e("BreezyWeather", "conversion failed", e);
            return fail("Breezy Weather data is corrupt");
        }
        try {
            return NiagaraWeather.payload("breezy-weather", String.valueOf(lat), String.valueOf(lon),
                current, hourly, daily);
        } catch (Exception e) {
            android.util.Log.e("BreezyWeather", "encode failed", e);
            return fail("Breezy Weather data is corrupt");
        }
    }

    private static JSONObject current(JSONObject root, double lat, double lon, ZoneId zone)
            throws Exception {
        JSONObject current = root.optJSONObject("current");
        Double temp = current == null ? null : temperature(current);
        if (temp == null) {
            lastFailureReason = "Open Breezy Weather and refresh its weather";
            return null;
        }
        long now = Instant.now().getEpochSecond();
        long refresh = root.optLong("refreshTime", 0L) / 1000L;
        String code = current.optString("weatherCode", "");
        Double feels = feelsLike(current);
        return new JSONObject()
            .put("dt", refresh > 0L ? refresh : now)
            .put("temp", NiagaraWeather.round(temp))
            .put("feels_like", NiagaraWeather.round(feels != null ? feels : temp))
            .put("weather", NiagaraWeather.conditions(
                owmId(code),
                text(code, current.optString("weatherText", "")),
                daylight(root, now, lat, lon, zone)));
    }

    private static JSONArray hourly(JSONObject root) throws Exception {
        JSONArray points = new JSONArray();
        JSONArray hourly = root.optJSONArray("hourly");
        if (hourly == null) {
            return points;
        }
        for (int i = 0; i < hourly.length(); i++) {
            JSONObject entry = hourly.optJSONObject(i);
            if (entry == null) {
                continue;
            }
            Double temp = temperature(entry);
            if (temp == null) {
                continue;
            }
            String code = entry.optString("weatherCode", "");
            Double precipitation = precipitation(entry.optJSONObject("precipitationProbability"));
            Double feels = feelsLike(entry);
            points.put(new JSONObject()
                .put("dt", entry.optLong("date", 0L) / 1000L)
                .put("temp", NiagaraWeather.round(temp))
                .put("feels_like", NiagaraWeather.round(feels != null ? feels : temp))
                .put("pop", precipitation == null ? 0.0 : NiagaraWeather.round(precipitation / 100.0))
                .put("weather", NiagaraWeather.conditions(
                    owmId(code),
                    text(code, entry.optString("weatherText", "")),
                    entry.optBoolean("isDaylight", true))));
        }
        return points;
    }

    private static JSONArray daily(JSONObject root, double lat, double lon, ZoneId zone)
            throws Exception {
        JSONArray points = new JSONArray();
        JSONArray daily = root.optJSONArray("daily");
        if (daily == null) {
            return points;
        }
        for (int i = 0; i < daily.length(); i++) {
            JSONObject entry = daily.optJSONObject(i);
            if (entry == null) {
                continue;
            }
            JSONObject day = entry.optJSONObject("day");
            JSONObject night = entry.optJSONObject("night");
            Double dayTemp = temperature(day);
            Double nightTemp = temperature(night);
            if (dayTemp == null && nightTemp == null) {
                continue;
            }
            if (dayTemp == null) {
                dayTemp = nightTemp;
            }
            if (nightTemp == null) {
                nightTemp = dayTemp;
            }
            long date = entry.optLong("date", 0L);
            LocalDate localDate = Instant.ofEpochMilli(date).atZone(zone).toLocalDate();
            long[] sun = NiagaraWeather.sunTimes(localDate, lat, lon, zone);
            Double dayPop = day == null ? null
                : precipitation(day.optJSONObject("precipitationProbability"));
            Double nightPop = night == null ? null
                : precipitation(night.optJSONObject("precipitationProbability"));
            double pop = 0.0;
            if (dayPop != null || nightPop != null) {
                pop = NiagaraWeather.round(Math.max(dayPop == null ? 0.0 : dayPop,
                    nightPop == null ? 0.0 : nightPop) / 100.0);
            }
            JSONObject half = day != null ? day : night;
            String code = half == null ? "" : half.optString("weatherCode", "");
            String weatherText = half == null ? "" : half.optString("weatherText", "");
            points.put(new JSONObject()
                .put("dt", date / 1000L + 12 * 3600L)
                .put("sunrise", sun[0])
                .put("sunset", sun[1])
                .put("temp", new JSONObject()
                    .put("day", NiagaraWeather.round(dayTemp))
                    .put("max", NiagaraWeather.round(Math.max(dayTemp, nightTemp)))
                    .put("min", NiagaraWeather.round(Math.min(dayTemp, nightTemp)))
                    .put("night", NiagaraWeather.round(nightTemp))
                    .put("eve", NiagaraWeather.round(dayTemp))
                    .put("morn", NiagaraWeather.round(nightTemp)))
                .put("pop", pop)
                .put("weather", NiagaraWeather.conditions(owmId(code), text(code, weatherText), true)));
        }
        return points;
    }

    private static Double temperature(JSONObject block) {
        if (block == null) {
            return null;
        }
        JSONObject node = block.optJSONObject("temperature");
        if (node == null) {
            return null;
        }
        JSONObject inner = node.optJSONObject("temperature");
        if (inner == null || inner.isNull("value")) {
            return null;
        }
        return celsius(inner.optDouble("value", 0.0), inner.optString("unit", "c"));
    }

    /**
     * Provider's feels-like, if present. Falls back to {@code temp} at the
     * call sites; never null on its own terms so absence stays visible.
     */
    private static Double feelsLike(JSONObject block) {
        if (block == null) {
            return null;
        }
        JSONObject node = block.optJSONObject("temperature");
        if (node == null) {
            return null;
        }
        JSONObject inner = node.optJSONObject("sourceFeelsLike");
        if (inner == null || inner.isNull("value")) {
            return null;
        }
        return celsius(inner.optDouble("value", 0.0), inner.optString("unit", "c"));
    }

    private static double celsius(double value, String unit) {
        if ("f".equalsIgnoreCase(unit)) {
            return (value - 32.0) * 5.0 / 9.0;
        }
        if ("k".equalsIgnoreCase(unit)) {
            return value - 273.15;
        }
        return value;
    }

    private static Double precipitation(JSONObject block) {
        if (block == null) {
            return null;
        }
        // BreezyPrecipitationProbability wraps the value in a "total" unit.
        JSONObject total = block.optJSONObject("total");
        if (total == null || total.isNull("value")) {
            return null;
        }
        return total.optDouble("value", 0.0);
    }

    private static int owmId(String breezyCode) {
        switch (breezyCode) {
            case "clear":
                return 800;
            case "partly_cloudy":
                return 801;
            case "cloudy":
                return 804;
            case "rain":
                return 501;
            case "snow":
                return 601;
            case "wind":
                return 771;
            case "fog":
                return 741;
            case "haze":
                return 721;
            case "sleet":
                return 616;
            case "hail":
                return 906;
            case "thunder":
            case "thunderstorm":
                return 211;
            default:
                return 800;
        }
    }

    private static String text(String breezyCode, String weatherText) {
        if (weatherText != null && !weatherText.isEmpty()) {
            return weatherText;
        }
        switch (breezyCode) {
            case "clear":
                return "clear sky";
            case "partly_cloudy":
                return "partly cloudy";
            case "cloudy":
                return "overcast";
            case "rain":
                return "rain";
            case "snow":
                return "snow";
            case "wind":
                return "windy";
            case "fog":
                return "fog";
            case "haze":
                return "haze";
            case "sleet":
                return "sleet";
            case "hail":
                return "hail";
            case "thunder":
                return "thunder";
            case "thunderstorm":
                return "thunderstorm";
            default:
                return "unknown";
        }
    }

    private static boolean daylight(JSONObject root, long now, double lat, double lon, ZoneId zone) {
        JSONArray hourly = root.optJSONArray("hourly");
        if (hourly != null) {
            long nowMillis = now * 1000L;
            long bestDelta = Long.MAX_VALUE;
            Boolean closest = null;
            for (int i = 0; i < hourly.length(); i++) {
                JSONObject entry = hourly.optJSONObject(i);
                if (entry == null || !entry.has("isDaylight")) {
                    continue;
                }
                long delta = Math.abs(entry.optLong("date", 0L) - nowMillis);
                if (delta < bestDelta) {
                    bestDelta = delta;
                    closest = entry.optBoolean("isDaylight", true);
                }
            }
            if (closest != null && bestDelta <= 2 * 3600_000L) {
                return closest;
            }
        }
        LocalDate today = Instant.ofEpochSecond(now).atZone(zone).toLocalDate();
        long[] sun = NiagaraWeather.sunTimes(today, lat, lon, zone);
        if (now >= sun[0] && now <= sun[1]) {
            return true;
        }
        int hour = Instant.ofEpochSecond(now).atZone(zone).getHour();
        return hour >= 6 && hour <= 17;
    }

    private static String fail(String reason) {
        lastFailureReason = reason;
        android.util.Log.e("BreezyWeather", reason);
        return null;
    }

    private static final class Location {

        private String id;
        private double lat;
        private double lon;
        private boolean currentPosition;
    }
}
