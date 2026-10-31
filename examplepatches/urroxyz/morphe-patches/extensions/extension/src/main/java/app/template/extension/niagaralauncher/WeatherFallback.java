package app.template.extension.niagaralauncher;

import android.content.Context;
import android.util.Log;

import org.json.*;

import java.io.*;
import java.lang.reflect.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;

/** Version-specific adapter. Runs on Niagara's existing weather IO coroutine. */
public final class WeatherFallback {
    static final String TAG = "UrroWeather";

    static Object field(Object o, String n) throws Exception {
        Field f = o.getClass().getDeclaredField(n);
        f.setAccessible(true);
        return f.get(o);
    }

    static Object call(Object o, String n, Class<?>[] types, Object... args) throws Exception {
        Method m = o.getClass().getDeclaredMethod(n, types);
        m.setAccessible(true);
        return m.invoke(o, args);
    }

    public static Object intercept(Object coroutine) {
        try {
            if (((Integer) field(coroutine, "aF9kXAxTizk9j")) != 13) return null;
            Object manager = field(coroutine, "fZSnYsn7yeHN0ufn7zjP2WfakeUJj");
            Object loc = field(coroutine, "jxBDvowjIhv6OeFMIFeBEx4BvC");
            double lat = Math.rint(((Float) field(loc, "aJjcCDwdQ7n")) * 100) / 100;
            double lon = Math.rint(((Float) field(loc, "cileMK8iL9T")) * 100) / 100;
            if (!Double.isFinite(lat)
                    || !Double.isFinite(lon)
                    || Math.abs(lat) > 90
                    || Math.abs(lon) > 180) throw new IOException("Invalid location");
            Context ctx = (Context) field(manager, "W25MCjjv17pEZfZmd2om7Cw0o5");
            String json = load(ctx, lat, lon);
            Object result =
                    call(
                            manager,
                            "tGxuW2FhK5LXFnPrr4plnTpS",
                            new Class[] {String.class, long.class},
                            json,
                            System.currentTimeMillis());
            call(manager, "UztznoJ3Uzs44xWBGv2j6WRw8Rs", new Class[] {String.class}, json);
            Log.i(
                    TAG,
                    "Native weather model accepted; provider="
                            + new JSONObject(json).getString("provider"));
            return result;
        } catch (Throwable e) {
            Log.w(TAG, "Fallback unavailable: " + e.getClass().getSimpleName());
            return null;
        }
    }

    static synchronized String load(Context c, double lat, double lon) throws Exception {
        File cache = new File(c.getCacheDir(), "urro-weather-v1.json");
        JSONObject cached = null;
        try {
            cached = new JSONObject(read(new FileInputStream(cache)));
        } catch (Exception ignored) {
        }
        long now = System.currentTimeMillis();
        String cell = lat + "," + lon;
        if (cached != null
                && cell.equals(cached.optString("cell"))
                && now - cached.optLong("saved") < 3600000) {
            Log.i(TAG, "cache hit");
            return cached.getString("data");
        }
        String data = null;
        Exception error = null;
        try {
            data = met(lat, lon);
        } catch (Exception e) {
            error = e;
            Log.i(TAG, "MET unavailable: " + e.getClass().getSimpleName());
        }
        if (data == null)
            try {
                data = openMeteo(lat, lon);
            } catch (Exception e) {
                error = e;
                Log.i(TAG, "Open-Meteo unavailable: " + e.getClass().getSimpleName());
            }
        if (data == null) {
            if (cached != null
                    && cell.equals(cached.optString("cell"))
                    && now - cached.optLong("saved") < 10800000) return cached.getString("data");
            throw error == null ? new IOException("No provider") : error;
        }
        File tmp = new File(c.getCacheDir(), "urro-weather-v1.tmp");
        try (FileOutputStream out = new FileOutputStream(tmp)) {
            out.write(
                    new JSONObject()
                            .put("cell", cell)
                            .put("saved", now)
                            .put("data", data)
                            .toString()
                            .getBytes(StandardCharsets.UTF_8));
        }
        if (!tmp.renameTo(cache)) throw new IOException("Cache rename");
        return data;
    }

    static String read(InputStream in) throws IOException {
        try (InputStream s = in;
                ByteArrayOutputStream out = new ByteArrayOutputStream()) {
            byte[] b = new byte[8192];
            int n;
            while ((n = s.read(b)) != -1) {
                out.write(b, 0, n);
                if (out.size() > 2000000) throw new IOException("Response too large");
            }
            return out.toString("UTF-8");
        }
    }

    static JSONObject get(String url) throws Exception {
        HttpURLConnection c = (HttpURLConnection) new URL(url).openConnection();
        c.setConnectTimeout(8000);
        c.setReadTimeout(8000);
        c.setRequestProperty("User-Agent", "UrroNiagaraWeather/1.0 github.com/urroxyz");
        try {
            int code = c.getResponseCode();
            if (code != 200 && code != 203) throw new IOException("HTTP " + code);
            return new JSONObject(read(c.getInputStream()));
        } finally {
            c.disconnect();
        }
    }

    static JSONArray condition(String symbol) {
        String s = symbol.toLowerCase(Locale.ROOT);
        int id = 800;
        String icon = "01";
        String desc = "Clear sky";
        if (s.contains("thunder")) {
            id = 211;
            icon = "11";
            desc = "Thunderstorm";
        } else if (s.contains("snow") || s.contains("sleet")) {
            id = 601;
            icon = "13";
            desc = "Snow or sleet";
        } else if (s.contains("rain") || s.contains("drizzle")) {
            id = 501;
            icon = "10";
            desc = "Rain";
        } else if (s.contains("fog")) {
            id = 741;
            icon = "50";
            desc = "Fog";
        } else if (s.contains("partlycloudy")) {
            id = 802;
            icon = "03";
            desc = "Partly cloudy";
        } else if (s.contains("fair")) {
            id = 801;
            icon = "02";
            desc = "Mostly clear";
        } else if (s.contains("cloudy")) {
            id = 804;
            icon = "04";
            desc = "Cloudy";
        }
        try {
            return new JSONArray()
                    .put(
                            new JSONObject()
                                    .put("id", id)
                                    .put("icon", icon + (s.contains("night") ? "n" : "d"))
                                    .put("description", desc));
        } catch (JSONException e) {
            throw new IllegalStateException(e);
        }
    }

    static JSONObject point(long time, double temp, double feels, JSONArray cond) throws Exception {
        if (!Double.isFinite(temp) || temp < -100 || temp > 70 || !Double.isFinite(feels))
            throw new IOException("Invalid temperatures");
        return new JSONObject()
                .put("dt", time)
                .put("temp", temp)
                .put("feels_like", feels)
                .put("weather", cond);
    }

    static String wrap(
            double lat,
            double lon,
            String provider,
            JSONObject current,
            JSONArray hourly,
            JSONArray daily)
            throws Exception {
        if (hourly.length() < 2) throw new IOException("Insufficient hourly coverage");
        long age = System.currentTimeMillis() / 1000 - current.getLong("dt");
        if (age > 10800 || age < -7200) throw new IOException("Stale forecast");
        return new JSONObject()
                .put("timestamp", System.currentTimeMillis() / 1000)
                .put("provider", provider)
                .put("lat", String.valueOf(lat))
                .put("long", String.valueOf(lon))
                .put("lang", "en")
                .put(
                        "forecast",
                        new JSONObject()
                                .put("current", current)
                                .put("hourly", hourly)
                                .put("daily", daily))
                .toString();
    }

    static String met(double lat, double lon) throws Exception {
        JSONArray series =
                get("https://api.met.no/weatherapi/locationforecast/2.0/compact?lat="
                                + lat
                                + "&lon="
                                + lon)
                        .getJSONObject("properties")
                        .getJSONArray("timeseries");
        JSONArray hourly = new JSONArray();
        JSONObject current = null;
        SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'", Locale.ROOT);
        fmt.setTimeZone(TimeZone.getTimeZone("UTC"));
        long now = System.currentTimeMillis() / 1000;
        for (int i = 0; i < series.length(); i++) {
            JSONObject item = series.getJSONObject(i);
            long t = fmt.parse(item.getString("time")).getTime() / 1000;
            JSONObject d = item.getJSONObject("data");
            double temp =
                    d.getJSONObject("instant")
                            .getJSONObject("details")
                            .getDouble("air_temperature");
            JSONObject next = d.optJSONObject("next_1_hours");
            if (next == null) next = d.optJSONObject("next_6_hours");
            String symbol =
                    next == null
                            ? "cloudy"
                            : next.getJSONObject("summary").getString("symbol_code");
            JSONObject p = point(t, temp, temp, condition(symbol));
            if (t <= now && now - t < 7200) current = p;
            if (t > now) hourly.put(p.put("pop", 0));
        }
        if (current == null) throw new IOException("No recent MET data");
        return wrap(lat, lon, "MET Norway (CC BY 4.0)", current, hourly, new JSONArray());
    }

    static String openMeteo(double lat, double lon) throws Exception {
        JSONObject r =
                get(
                        "https://api.open-meteo.com/v1/forecast?latitude="
                                + lat
                                + "&longitude="
                                + lon
                                + "&current=temperature_2m,apparent_temperature,weather_code,is_day&hourly=temperature_2m,apparent_temperature,weather_code,precipitation_probability&timeformat=unixtime&forecast_days=3");
        JSONObject c = r.getJSONObject("current"), h = r.getJSONObject("hourly");
        JSONArray ts = h.getJSONArray("time"),
                temps = h.getJSONArray("temperature_2m"),
                feels = h.getJSONArray("apparent_temperature"),
                codes = h.getJSONArray("weather_code"),
                pop = h.getJSONArray("precipitation_probability");
        JSONArray hourly = new JSONArray();
        for (int i = 0; i < ts.length(); i++)
            hourly.put(
                    point(
                                    ts.getLong(i),
                                    temps.getDouble(i),
                                    feels.getDouble(i),
                                    condition(wmo(codes.getInt(i))))
                            .put("pop", pop.isNull(i) ? 0 : pop.getDouble(i) / 100));
        JSONObject current =
                point(
                        c.getLong("time"),
                        c.getDouble("temperature_2m"),
                        c.getDouble("apparent_temperature"),
                        condition(
                                wmo(c.getInt("weather_code"))
                                        + (c.optInt("is_day", 1) == 0 ? "_night" : "_day")));
        return wrap(lat, lon, "Open-Meteo (CC BY 4.0)", current, hourly, new JSONArray());
    }

    static String wmo(int code) {
        if (code == 0) return "clearsky";
        if (code == 1) return "fair";
        if (code == 2) return "partlycloudy";
        if (code == 3) return "cloudy";
        if (code == 45 || code == 48) return "fog";
        if (code >= 95) return "thunder";
        if (code >= 71 && code <= 86) return "snow";
        if (code >= 51 && code <= 67 || code >= 80 && code <= 82) return "rain";
        return "cloudy";
    }
}
