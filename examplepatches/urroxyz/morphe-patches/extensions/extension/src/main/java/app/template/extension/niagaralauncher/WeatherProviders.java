package app.template.extension.niagaralauncher;

import org.json.*;

import java.io.*;
import java.net.*;
import java.time.*;
import java.time.format.DateTimeParseException;
import java.util.*;

/** Network and provider adapters. Does not access Android, preferences, or user credentials. */
public final class WeatherProviders {
    public interface Fetcher {
        Object get(String url) throws Exception;
    }

    public static Object request(String address) throws Exception {
        URL url = new URL(address);
        if (!"https".equals(url.getProtocol()) || url.getUserInfo() != null)
            throw new IOException("HTTPS URL without user-info required");
        for (int redirect = 0; redirect < 4; redirect++) {
            if (Thread.currentThread().isInterrupted())
                throw new InterruptedIOException("Canceled");
            HttpURLConnection c = (HttpURLConnection) url.openConnection();
            c.setConnectTimeout(8000);
            c.setReadTimeout(8000);
            c.setInstanceFollowRedirects(false);
            c.setRequestProperty(
                    "User-Agent", "UrroNiagaraWeather/2.0 github.com/urroxyz/morphe-patches");
            try {
                int code = c.getResponseCode();
                if (code >= 300 && code < 400) {
                    String location = c.getHeaderField("Location");
                    if (location == null) throw new IOException("Redirect without location");
                    URL next = new URL(url, location);
                    if (!"https".equals(next.getProtocol())
                            || !next.getHost().equalsIgnoreCase(url.getHost())
                            || next.getPort() != url.getPort())
                        throw new IOException("Cross-origin redirect rejected");
                    url = next;
                    continue;
                }
                if (code != 200 && code != 203) throw new IOException("HTTP " + code);
                if (c.getContentLengthLong() > 2000000) throw new IOException("Response too large");
                try (InputStream in = c.getInputStream();
                        ByteArrayOutputStream out = new ByteArrayOutputStream()) {
                    byte[] b = new byte[8192];
                    int n;
                    while ((n = in.read(b)) != -1) {
                        if (Thread.currentThread().isInterrupted())
                            throw new InterruptedIOException("Canceled");
                        out.write(b, 0, n);
                        if (out.size() > 2000000) throw new IOException("Response too large");
                    }
                    Object result = new JSONTokener(out.toString("UTF-8")).nextValue();
                    if (result == null || result == JSONObject.NULL)
                        throw new IOException("Empty JSON response");
                    return result;
                }
            } finally {
                c.disconnect();
            }
        }
        throw new IOException("Redirect limit");
    }

    public static WeatherData fetch(
            WeatherSource source, double lat, double lon, long now, ZoneId zone, Fetcher fetcher)
            throws Exception {
        WeatherData d;
        if (source.kind.equals("met")) d = met(lat, lon, now, zone, fetcher);
        else if (source.kind.equals("open-meteo")) d = open(lat, lon, now, zone, fetcher);
        else d = custom(source, lat, lon, now, zone, fetcher);
        d.source =
                WeatherTemplate.render(source.name, new WeatherTemplate.Vars(lat, lon, 0), false);
        d.deriveDays(zone);
        return d;
    }

    public static WeatherData.Point condition(WeatherData.Point p, int code, boolean night) {
        p.condition = code;
        String icon, description;
        if (code >= 200 && code < 300) {
            icon = "11";
            description = "Thunderstorm";
        } else if (code >= 300 && code < 400) {
            icon = "09";
            description = "Drizzle";
        } else if (code >= 500 && code < 600) {
            icon = "10";
            description = "Rain";
        } else if (code >= 600 && code < 700) {
            icon = "13";
            description = "Snow or sleet";
        } else if (code >= 700 && code < 800) {
            icon = "50";
            description = "Fog or reduced visibility";
        } else if (code == 800) {
            icon = "01";
            description = "Clear sky";
        } else if (code == 801) {
            icon = "02";
            description = "Mostly clear";
        } else if (code == 802) {
            icon = "03";
            description = "Partly cloudy";
        } else if (code == 803 || code == 804) {
            icon = "04";
            description = "Cloudy";
        } else {
            p.condition = null;
            return p;
        }
        p.icon = icon + (night ? "n" : "d");
        p.description = description;
        return p;
    }

    public static int wmo(int c) {
        switch (c) {
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
                return 301;
            case 56:
            case 57:
                return 311;
            case 61:
            case 63:
            case 65:
            case 80:
            case 81:
            case 82:
                return 501;
            case 66:
            case 67:
                return 511;
            case 71:
            case 73:
            case 75:
            case 77:
            case 85:
            case 86:
                return 601;
            case 95:
            case 96:
            case 99:
                return 211;
            default:
                return 0;
        }
    }

    static WeatherData.Point metCondition(WeatherData.Point p, String symbol) {
        String s = symbol.toLowerCase(Locale.ROOT);
        int c =
                s.contains("thunder")
                        ? 211
                        : s.contains("sleet")
                                ? 611
                                : s.contains("snow")
                                        ? 601
                                        : s.contains("rain")
                                                ? 501
                                                : s.contains("fog")
                                                        ? 741
                                                        : s.contains("partlycloudy")
                                                                ? 802
                                                                : s.contains("fair")
                                                                        ? 801
                                                                        : s.contains("cloudy")
                                                                                ? 804
                                                                                : s.contains(
                                                                                                "clearsky")
                                                                                        ? 800
                                                                                        : 0;
        return condition(p, c, s.contains("night"));
    }

    static double valid(double t) {
        if (!Double.isFinite(t) || t < -100 || t > 70)
            throw new IllegalArgumentException("Invalid temperature");
        return t;
    }

    static WeatherData met(double lat, double lon, long now, ZoneId zone, Fetcher f)
            throws Exception {
        JSONArray series =
                ((JSONObject)
                                f.get(
                                        "https://api.met.no/weatherapi/locationforecast/2.0/compact?lat="
                                                + lat
                                                + "&lon="
                                                + lon))
                        .getJSONObject("properties")
                        .getJSONArray("timeseries");
        WeatherData d = new WeatherData();
        for (int i = 0; i < series.length(); i++) {
            JSONObject item = series.getJSONObject(i), data = item.getJSONObject("data");
            long t = Instant.parse(item.getString("time")).getEpochSecond();
            WeatherData.Point p = new WeatherData.Point(t);
            p.numbers.put(
                    "temp",
                    valid(
                            data.getJSONObject("instant")
                                    .getJSONObject("details")
                                    .getDouble("air_temperature")));
            JSONObject next = data.optJSONObject("next_1_hours");
            if (next == null) next = data.optJSONObject("next_6_hours");
            if (next != null) {
                metCondition(p, next.getJSONObject("summary").optString("symbol_code"));
                JSONObject details = next.optJSONObject("details");
                if (details != null && details.has("probability_of_precipitation"))
                    p.numbers.put("pop", details.getDouble("probability_of_precipitation") / 100);
            }
            if (t <= now && now - t < 7200 && (d.current == null || d.current.time < t))
                d.current = p.copy();
            d.addHour(p);
        }
        d.warnings.add(
                "MET day extrema/period temperatures are derived from available forecast samples;"
                    + " unavailable feels-like/probability stay missing.");
        return d;
    }

    static WeatherData open(double lat, double lon, long now, ZoneId zone, Fetcher f)
            throws Exception {
        String tz = URLEncoder.encode(zone.getId(), "UTF-8");
        JSONObject r =
                (JSONObject)
                        f.get(
                                "https://api.open-meteo.com/v1/forecast?latitude="
                                        + lat
                                        + "&longitude="
                                        + lon
                                        + "&current=temperature_2m,apparent_temperature,weather_code,is_day&hourly=temperature_2m,apparent_temperature,weather_code,precipitation_probability,is_day&daily=weather_code,temperature_2m_max,temperature_2m_min,precipitation_probability_max,sunrise,sunset&timeformat=unixtime&forecast_days=7&timezone="
                                        + tz);
        WeatherData out = new WeatherData();
        JSONObject c = r.optJSONObject("current");
        if (c != null) {
            WeatherData.Point p = new WeatherData.Point(c.getLong("time"));
            p.numbers.put("temp", valid(c.getDouble("temperature_2m")));
            if (!c.isNull("apparent_temperature"))
                p.numbers.put("feels_like", valid(c.getDouble("apparent_temperature")));
            condition(p, wmo(c.optInt("weather_code", -1)), c.optInt("is_day", 1) == 0);
            out.current = p;
        }
        JSONObject h = r.optJSONObject("hourly");
        if (h != null) {
            JSONArray t = h.getJSONArray("time");
            for (int i = 0; i < t.length(); i++) {
                WeatherData.Point p = new WeatherData.Point(t.getLong(i));
                if (value(h, "temperature_2m", i) != null)
                    p.numbers.put("temp", valid(value(h, "temperature_2m", i)));
                if (value(h, "apparent_temperature", i) != null)
                    p.numbers.put("feels_like", valid(value(h, "apparent_temperature", i)));
                if (value(h, "precipitation_probability", i) != null)
                    p.numbers.put("pop", value(h, "precipitation_probability", i) / 100);
                Double code = value(h, "weather_code", i), day = value(h, "is_day", i);
                if (code != null) condition(p, wmo(code.intValue()), day != null && day == 0);
                out.addHour(p);
            }
        }
        JSONObject daily = r.optJSONObject("daily");
        if (daily != null) {
            JSONArray t = daily.getJSONArray("time");
            for (int i = 0; i < t.length(); i++) {
                WeatherData.Point p = new WeatherData.Point(t.getLong(i));
                for (String[] pair :
                        new String[][] {
                            {"min", "temperature_2m_min"},
                            {"max", "temperature_2m_max"},
                            {"pop", "precipitation_probability_max"},
                            {"sunrise", "sunrise"},
                            {"sunset", "sunset"}
                        }) {
                    Double x = value(daily, pair[1], i);
                    if (x != null) p.numbers.put(pair[0], pair[0].equals("pop") ? x / 100 : x);
                }
                Double code = value(daily, "weather_code", i);
                if (code != null) condition(p, wmo(code.intValue()), false);
                out.addDay(p, zone);
            }
        }
        return out;
    }

    static Double value(JSONObject o, String name, int i) {
        JSONArray a = o.optJSONArray(name);
        if (a == null || i >= a.length() || a.isNull(i)) return null;
        double n = a.optDouble(i, Double.NaN);
        return Double.isFinite(n) ? n : null;
    }

    public static long timestamp(Object o, String format, ZoneId zone) {
        if (o instanceof Number) {
            double n = ((Number) o).doubleValue();
            if (!Double.isFinite(n)) throw new IllegalArgumentException("Invalid time");
            return format.equals("milliseconds") ? (long) (n / 1000) : (long) n;
        }
        String s = String.valueOf(o);
        if (format.equals("seconds") || format.equals("milliseconds"))
            return timestamp(Double.valueOf(s), format, zone);
        try {
            return Instant.parse(s).getEpochSecond();
        } catch (DateTimeParseException e) {
            try {
                return OffsetDateTime.parse(s).toEpochSecond();
            } catch (DateTimeParseException e2) {
                try {
                    return LocalDateTime.parse(s).atZone(zone).toEpochSecond();
                } catch (DateTimeParseException e3) {
                    return LocalDate.parse(s).atStartOfDay(zone).toEpochSecond();
                }
            }
        }
    }

    static void warning(WeatherData d, String s) {
        if (d.warnings.size() < 12 && !d.warnings.contains(s)) d.warnings.add(s);
    }

    static WeatherData.Point map(
            Object root,
            String group,
            WeatherSource source,
            WeatherTemplate.Vars vars,
            long now,
            ZoneId zone,
            WeatherData result) {
        String[] fields =
                group.equals("current")
                        ? WeatherData.CURRENT
                        : group.equals("hourly") ? WeatherData.HOURLY : WeatherData.DAILY;
        WeatherData.Point p = new WeatherData.Point(group.equals("current") ? now : 0);
        boolean explicitTime = false;
        for (String field : fields) {
            String key = group + "." + field;
            String path = source.mappings.optString(key, "");
            Object v;
            try {
                v = WeatherTemplate.resolve(root, path, vars);
                if (v == null) continue;
                if (field.equals("dt")) {
                    long t = timestamp(v, source.time, zone);
                    if (group.equals("current")
                            && path.isEmpty()
                            && (t > now + 7200 || t < now - 10800)) continue;
                    p.time = t;
                    explicitTime = true;
                    continue;
                }
                if (field.equals("description") || field.equals("icon")) {
                    if (!(v instanceof String)) throw new IllegalArgumentException("Expected text");
                    if (field.equals("description")) p.description = (String) v;
                    else p.icon = (String) v;
                    continue;
                }
                if (v instanceof JSONObject || v instanceof JSONArray || v instanceof Boolean)
                    throw new IllegalArgumentException("Expected number");
                double n =
                        v instanceof Number
                                ? ((Number) v).doubleValue()
                                : Double.parseDouble(v.toString());
                if (!Double.isFinite(n)) throw new IllegalArgumentException("Nonfinite number");
                if (field.equals("id")) {
                    if (n != Math.rint(n))
                        throw new IllegalArgumentException("Condition code must be an integer");
                    condition(p, source.codes.equals("WMO") ? wmo((int) n) : (int) n, false);
                    continue;
                }
                if (field.equals("sunrise") || field.equals("sunset"))
                    n = timestamp(v, source.time, zone);
                else if (field.equals("pop")) {
                    if (source.probability.equals("percent")) n /= 100;
                    if (n < 0 || n > 1)
                        throw new IllegalArgumentException("Probability outside range");
                } else {
                    if (source.temperature.equals("F")) n = (n - 32) * 5 / 9;
                    else if (source.temperature.equals("K")) n -= 273.15;
                    valid(n);
                }
                p.numbers.put(field, n);
            } catch (Exception e) {
                if (!path.isEmpty())
                    warning(
                            result,
                            key
                                    + ": "
                                    + (e instanceof IllegalArgumentException
                                            ? e.getMessage()
                                            : "Invalid value"));
            }
        }
        if (!group.equals("current") && !explicitTime) return null;
        if (group.equals("current") && (p.time > now + 7200 || p.time < now - 10800)) {
            warning(result, "Current data timestamp is stale or invalid");
            return null;
        }
        return p;
    }

    static WeatherData custom(
            WeatherSource source, double lat, double lon, long now, ZoneId zone, Fetcher f)
            throws Exception {
        if (source.url.trim().isEmpty()) throw new IOException("Custom URL is empty");
        WeatherData result = new WeatherData();
        int requests = source.mode.equals("once") ? 1 : source.count;
        long deadline = System.nanoTime() + 20_000_000_000L;
        for (int request = 0; request < requests; request++) {
            if (Thread.currentThread().isInterrupted() || System.nanoTime() > deadline) break;
            WeatherTemplate.Vars vars = new WeatherTemplate.Vars(lat, lon, request);
            String url = WeatherTemplate.render(source.url, vars, true);
            Object root = f.get(url);
            if (request == 0)
                result.current = map(root, "current", source, vars, now, zone, result);
            if (source.mode.equals("once")) {
                for (int n = 0; n < 192; n++) {
                    WeatherData.Point p =
                            map(
                                    root,
                                    "hourly",
                                    source,
                                    new WeatherTemplate.Vars(lat, lon, n),
                                    now,
                                    zone,
                                    result);
                    if (p != null) result.addHour(p);
                }
                for (int n = 0; n < 14; n++) {
                    WeatherData.Point p =
                            map(
                                    root,
                                    "daily",
                                    source,
                                    new WeatherTemplate.Vars(lat, lon, n),
                                    now,
                                    zone,
                                    result);
                    if (p != null) result.addDay(p, zone);
                }
            } else if (source.mode.equals("daily"))
                result.addDay(map(root, "daily", source, vars, now, zone, result), zone);
            else result.addHour(map(root, "hourly", source, vars, now, zone, result));
        }
        return result;
    }
}
