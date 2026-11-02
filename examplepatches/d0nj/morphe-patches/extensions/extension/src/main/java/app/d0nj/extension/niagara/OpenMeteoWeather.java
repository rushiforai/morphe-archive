package app.d0nj.extension.niagara;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;

/**
 * Fetches Open-Meteo and re-encodes the result as the OpenWeatherMap One Call
 * payload Niagara Launcher already deserializes.
 */
public final class OpenMeteoWeather {

    private static final String ENDPOINT = "https://api.open-meteo.com/v1/forecast";
    private static final int CONNECT_TIMEOUT_MS = 10_000;
    private static final int READ_TIMEOUT_MS = 15_000;
    private static final DateTimeFormatter LOCAL = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
    private static final String USER_AGENT = "niagara-openmeteo-patch/1.0";

    /** Sentinel returned when the upstream call or decoding fails. */
    public static final String FAILED = "__openmeteo_failed__";

    /** Last successful payload, reused when a refresh fails. Process-lifetime only. */
    private static volatile String lastGood;

    private OpenMeteoWeather() {
    }

    /** Fetches a forecast for a Niagara coordinates object, or {@link #FAILED}. Never throws. */
    public static String forecast(Object coordinates) {
        android.util.Log.i("OpenMeteoWeather", "forecast enter: " + coordinates);
        if (coordinates == null) {
            android.util.Log.e("OpenMeteoWeather", "coordinates null");
            return FAILED;
        }
        try {
            Field[] floats = floatFields(coordinates.getClass());
            if (floats.length < 2) {
                android.util.Log.e("OpenMeteoWeather", "no float fields on " + coordinates.getClass());
                return FAILED;
            }
            float first = floats[0].getFloat(coordinates);
            float second = floats[1].getFloat(coordinates);
            // getDeclaredFields() order is unspecified; latitude is bounded to
            // +/-90 so a swap is detectable.
            final float lat = Math.abs(first) > 90f ? second : first;
            final float lon = Math.abs(first) > 90f ? first : second;
            android.util.Log.i("OpenMeteoWeather", "coords " + lat + "," + lon);
            String result = fetchOffMain(lat, lon);
            android.util.Log.i("OpenMeteoWeather", "result length: " + (result == null ? -1 : result.length()));
            if (result == null) {
                return FAILED;
            }
            lastGood = result;
            return result;
        } catch (Throwable t) {
            android.util.Log.e("OpenMeteoWeather", "forecast failed", t);
            return FAILED;
        }
    }

    // The call site's dispatcher may be main; blocking HTTP there throws.
    private static String fetchOffMain(final float lat, final float lon) throws Exception {
        final String[] holder = new String[1];
        Thread worker = new Thread(new Runnable() {
            @Override
            public void run() {
                holder[0] = fetch(lat, lon);
            }
        }, "openmeteo-fetch");
        worker.start();
        worker.join(20_000L);
        return holder[0];
    }

    /** Never throws: the patched call site has no catch, so a payload must always come back. */
    public static String requireForecast(String forecast) {
        if (forecast != null && !FAILED.equals(forecast)) {
            return forecast;
        }
        String cached = lastGood;
        if (cached != null) {
            android.util.Log.e("OpenMeteoWeather", "reusing last good payload");
            return cached;
        }
        android.util.Log.e("OpenMeteoWeather", "returning fallback payload");
        return fallback();
    }

    private static String fallback() {
        long now = Instant.now().getEpochSecond();
        try {
            return new JSONObject()
                .put("timestamp", now)
                .put("provider", "open-meteo")
                .put("lat", "0")
                .put("long", "0")
                .put("lang", "en")
                .put("forecast", new JSONObject()
                    .put("current", new JSONObject()
                        .put("dt", now)
                        .put("temp", 0.0)
                        .put("feels_like", 0.0)
                        .put("weather", conditions(0, now, 0, Long.MAX_VALUE)))
                    .put("minutely", new JSONArray())
                    .put("hourly", new JSONArray())
                    .put("daily", new JSONArray()))
                .toString();
        } catch (Exception e) {
            return "{}";
        }
    }

    private static Field[] floatFields(Class<?> type) {
        Field[] all = type.getDeclaredFields();
        Field first = null;
        Field second = null;
        for (Field field : all) {
            if (field.getType() != float.class) {
                continue;
            }
            field.setAccessible(true);
            if (first == null) {
                first = field;
            } else if (second == null) {
                second = field;
            }
        }
        return first == null || second == null ? new Field[0] : new Field[] { first, second };
    }

    /**
     * @return Niagara-compatible forecast JSON, or null when the upstream call
     *         fails so the caller can surface a real error.
     */
    public static String fetch(float lat, float lon) {
        try {
            return request(lat, lon);
        } catch (Exception e) {
            return null;
        }
    }

    private static String request(float lat, float lon) throws Exception {
        String url = ENDPOINT
            + "?latitude=" + URLEncoder.encode(String.valueOf(lat), "UTF-8")
            + "&longitude=" + URLEncoder.encode(String.valueOf(lon), "UTF-8")
            + "&current=temperature_2m,apparent_temperature,weather_code"
            + "&hourly=temperature_2m,apparent_temperature,precipitation_probability,weather_code"
            + "&daily=temperature_2m_max,temperature_2m_min,sunrise,sunset,precipitation_probability_max,weather_code"
            + "&timezone=auto&forecast_days=7";

        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
        connection.setConnectTimeout(CONNECT_TIMEOUT_MS);
        connection.setReadTimeout(READ_TIMEOUT_MS);
        connection.setRequestProperty("Accept", "application/json");
        connection.setRequestProperty("User-Agent", USER_AGENT);
        try {
            if (connection.getResponseCode() != 200) {
                return null;
            }
            return encode(read(connection.getInputStream()), lat, lon);
        } finally {
            connection.disconnect();
        }
    }

    private static String read(InputStream stream) throws Exception {
        try (InputStream in = stream; ByteArrayOutputStream out = new ByteArrayOutputStream()) {
            byte[] buffer = new byte[8192];
            int count;
            while ((count = in.read(buffer)) != -1) {
                out.write(buffer, 0, count);
            }
            return out.toString(StandardCharsets.UTF_8.name());
        }
    }

    private static String encode(String body, float lat, float lon) throws Exception {
        JSONObject source = new JSONObject(body);
        long utcOffsetSeconds = source.optLong("utc_offset_seconds", 0L);
        JSONObject dailySource = source.optJSONObject("daily");
        long sunriseToday = firstTime(dailySource, "sunrise", utcOffsetSeconds);
        long sunsetToday = firstTime(dailySource, "sunset", utcOffsetSeconds);

        JSONObject root = new JSONObject();
        root.put("timestamp", Instant.now().getEpochSecond());
        root.put("provider", "open-meteo");
        root.put("lat", String.valueOf(lat));
        root.put("long", String.valueOf(lon));
        root.put("lang", "en");
        root.put("forecast", new JSONObject()
            .put("current", current(source, utcOffsetSeconds, sunriseToday, sunsetToday))
            .put("minutely", new JSONArray())
            .put("hourly", hourly(source, utcOffsetSeconds, sunriseToday, sunsetToday))
            .put("daily", daily(source, utcOffsetSeconds)));
        return root.toString();
    }

    private static JSONObject current(
        JSONObject source,
        long utcOffsetSeconds,
        long sunrise,
        long sunset
    ) throws Exception {
        JSONObject current = source.getJSONObject("current");
        int code = current.getInt("weather_code");
        long dt = toEpochSeconds(current.getString("time"), utcOffsetSeconds);
        return new JSONObject()
            .put("dt", dt)
            .put("temp", round(current.getDouble("temperature_2m")))
            .put("feels_like", round(current.getDouble("apparent_temperature")))
            .put("weather", conditions(code, dt, sunrise, sunset));
    }

    private static JSONArray hourly(
        JSONObject source,
        long utcOffsetSeconds,
        long sunrise,
        long sunset
    ) throws Exception {
        JSONObject hourly = source.getJSONObject("hourly");
        JSONArray time = hourly.getJSONArray("time");
        JSONArray temp = hourly.getJSONArray("temperature_2m");
        JSONArray feels = hourly.getJSONArray("apparent_temperature");
        JSONArray pop = hourly.optJSONArray("precipitation_probability");
        JSONArray code = hourly.getJSONArray("weather_code");

        JSONArray points = new JSONArray();
        for (int i = 0; i < time.length(); i++) {
            long dt = toEpochSeconds(time.getString(i), utcOffsetSeconds);
            points.put(new JSONObject()
                .put("dt", dt)
                .put("temp", round(temp.getDouble(i)))
                .put("feels_like", round(feels.getDouble(i)))
                .put("pop", pop == null ? 0.0 : round(pop.optDouble(i, 0.0) / 100.0))
                .put("weather", conditions(code.optInt(i, 0), dt, sunrise, sunset)));
        }
        return points;
    }

    private static JSONArray daily(JSONObject source, long utcOffsetSeconds) throws Exception {
        JSONObject daily = source.getJSONObject("daily");
        JSONArray time = daily.getJSONArray("time");
        JSONArray max = daily.getJSONArray("temperature_2m_max");
        JSONArray min = daily.getJSONArray("temperature_2m_min");
        JSONArray sunrise = daily.optJSONArray("sunrise");
        JSONArray sunset = daily.optJSONArray("sunset");
        JSONArray pop = daily.optJSONArray("precipitation_probability_max");
        JSONArray code = daily.getJSONArray("weather_code");

        JSONArray points = new JSONArray();
        for (int i = 0; i < time.length(); i++) {
            long dayStart = toEpochSeconds(time.getString(i) + "T00:00", utcOffsetSeconds);
            long noon = dayStart + 12 * 3600L;
            long daySunrise = sunrise == null ? noon : toEpochSeconds(sunrise.optString(i, ""), utcOffsetSeconds);
            long daySunset = sunset == null ? noon : toEpochSeconds(sunset.optString(i, ""), utcOffsetSeconds);
            points.put(new JSONObject()
                .put("dt", noon)
                .put("sunrise", daySunrise)
                .put("sunset", daySunset)
                .put("temp", new JSONObject()
                    .put("day", round((max.optDouble(i, 0) + min.optDouble(i, 0)) / 2.0))
                    .put("min", round(min.optDouble(i, 0)))
                    .put("max", round(max.optDouble(i, 0)))
                    .put("night", round(min.optDouble(i, 0)))
                    .put("eve", round(max.optDouble(i, 0)))
                    .put("morn", round(min.optDouble(i, 0))))
                .put("pop", pop == null ? 0.0 : round(pop.optDouble(i, 0.0) / 100.0))
                .put("weather", conditions(code.optInt(i, 0), noon, daySunrise, daySunset)));
        }
        return points;
    }

    private static JSONArray conditions(int wmo, long dt, long sunrise, long sunset) throws Exception {
        String icon = dt >= sunrise && dt < sunset ? "d" : "n";
        return new JSONArray().put(new JSONObject()
            .put("id", openWeatherMapId(wmo))
            .put("description", description(wmo))
            .put("icon", icon));
    }

    private static long firstTime(JSONObject daily, String key, long utcOffsetSeconds) {
        if (daily == null) {
            return 0L;
        }
        JSONArray values = daily.optJSONArray(key);
        return values == null || values.length() == 0
            ? 0L
            : toEpochSeconds(values.optString(0, ""), utcOffsetSeconds);
    }

    private static int openWeatherMapId(int wmo) {
        switch (wmo) {
            case 0:
                return 800;
            case 1:
                return 801;
            case 2:
                return 802;
            case 3:
                return 804;
            case 45:
            case 48:
                return 741;
            case 51:
            case 53:
            case 55:
            case 56:
            case 57:
                return 300;
            case 61:
                return 500;
            case 63:
                return 501;
            case 65:
                return 502;
            case 66:
            case 67:
                return 511;
            case 71:
            case 77:
                return 600;
            case 73:
                return 601;
            case 75:
                return 602;
            case 80:
                return 520;
            case 81:
                return 521;
            case 82:
                return 522;
            case 85:
            case 86:
                return 621;
            case 95:
                return 200;
            case 96:
            case 99:
                return 202;
            default:
                return 800;
        }
    }

    private static String description(int wmo) {
        switch (wmo) {
            case 0:
                return "clear sky";
            case 1:
                return "mainly clear";
            case 2:
                return "partly cloudy";
            case 3:
                return "overcast";
            case 45:
            case 48:
                return "fog";
            case 51:
            case 53:
            case 55:
                return "drizzle";
            case 56:
            case 57:
                return "freezing drizzle";
            case 61:
            case 80:
                return "light rain";
            case 63:
            case 81:
                return "rain";
            case 65:
            case 82:
                return "heavy rain";
            case 66:
            case 67:
                return "freezing rain";
            case 71:
            case 77:
                return "light snow";
            case 73:
                return "snow";
            case 75:
                return "heavy snow";
            case 85:
            case 86:
                return "snow showers";
            case 95:
                return "thunderstorm";
            case 96:
            case 99:
                return "thunderstorm with hail";
            default:
                return "unknown";
        }
    }

    private static long toEpochSeconds(String localIso, long utcOffsetSeconds) {
        if (localIso == null || localIso.isEmpty()) {
            return Instant.now().getEpochSecond();
        }
        try {
            return LocalDateTime.parse(localIso, LOCAL).toEpochSecond(ZoneOffset.UTC) - utcOffsetSeconds;
        } catch (Exception e) {
            try {
                return LocalDate.parse(localIso).atStartOfDay().toEpochSecond(ZoneOffset.UTC) - utcOffsetSeconds;
            } catch (Exception ignored) {
                return Instant.now().getEpochSecond();
            }
        }
    }

    private static double round(double value) {
        return Math.round(value * 10.0) / 10.0;
    }
}
