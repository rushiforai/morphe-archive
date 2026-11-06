package app.d0nj.extension.niagara;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TreeMap;

/**
 * Fetches MET Norway's Locationforecast and re-encodes the result as the
 * OpenWeatherMap One Call payload Niagara Launcher already deserializes.
 *
 * <p>The upstream publishes no feels-like value and no precipitation
 * probability, so feels-like is derived here and {@code pop} is pinned to zero
 * rather than invented.
 */
public final class MetNorwayWeather {

    private static final String ENDPOINT = "https://api.met.no/weatherapi/locationforecast/2.0/compact";
    private static final int CONNECT_TIMEOUT_MS = 5_000;
    private static final int READ_TIMEOUT_MS = 10_000;
    private static final int MAX_RESPONSE_BYTES = 4 * 1024 * 1024;
    private static final int FORECAST_DAYS = 7;
    private static final int MAX_HOURLY_POINTS = 72;

    /**
     * MET Norway answers 403 to anonymous and library-default agents, and
     * {@code HttpURLConnection} sends {@code Dalvik/…} by default. The address
     * keeps the traffic attributable as their terms require.
     */
    private static final String USER_AGENT =
        "niagara-metno-patch/1.0 (https://github.com/d0nj/morphe-patches)";

    /** Sentinel returned when the upstream call or decoding fails. */
    public static final String FAILED = "__metno_failed__";

    private static final NiagaraWeather.Cache CACHE = new NiagaraWeather.Cache("metno");

    private MetNorwayWeather() {
    }

    /** Fetches a forecast for a Niagara coordinates object, or {@link #FAILED}. Never throws. */
    public static String forecast(Object coordinates) {
        if (coordinates == null) {
            android.util.Log.e("MetNorwayWeather", "coordinates null");
            return FAILED;
        }
        try {
            float[] latLon = NiagaraWeather.latLonOf(coordinates);
            if (latLon == null) {
                android.util.Log.e("MetNorwayWeather", "no float fields on " + coordinates.getClass());
                return FAILED;
            }
            final float lat = latLon[0];
            final float lon = latLon[1];
            String result = NiagaraWeather.offMain("metno-fetch", 20_000L,
                () -> fetch(lat, lon));
            if (result == null) {
                String cached = CACHE.get(lat, lon);
                if (cached != null) {
                    android.util.Log.e("MetNorwayWeather", "reusing last good payload");
                    return cached;
                }
                return FAILED;
            }
            CACHE.put(result, lat, lon);
            return result;
        } catch (Throwable t) {
            android.util.Log.e("MetNorwayWeather", "forecast failed", t);
            return FAILED;
        }
    }

    /** Never throws: the patched call site has no catch, so a payload must always come back. */
    public static String requireForecast(String forecast) {
        if (forecast != null && !FAILED.equals(forecast)) {
            return forecast;
        }
        android.util.Log.e("MetNorwayWeather", "returning fallback payload");
        return fallback();
    }

    private static String fallback() {
        long now = Instant.now().getEpochSecond();
        try {
            return NiagaraWeather.payload("met-norway", "0", "0",
                new JSONObject()
                    .put("dt", now)
                    .put("temp", 0.0)
                    .put("feels_like", 0.0)
                    .put("weather", NiagaraWeather.conditions(800, "Weather unavailable", true)),
                new JSONArray(),
                new JSONArray());
        } catch (Exception e) {
            return "{}";
        }
    }

    /**
     * @return Niagara-compatible forecast JSON, or null when the upstream call
     *         fails so the caller can surface a real error.
     */
    public static String fetch(float lat, float lon) {
        String body = request(lat, lon);
        if (body == null) {
            return null;
        }
        try {
            return encode(body, lat, lon);
        } catch (Exception e) {
            android.util.Log.e("MetNorwayWeather", "fetch failed", e);
            return null;
        }
    }

    private static String request(float lat, float lon) {
        // Their terms ask for at most four decimals; lopping them off also
        // widens cache sharing between nearby installs.
        String url = ENDPOINT
            + "?lat=" + coordinate(lat)
            + "&lon=" + coordinate(lon);

        // The upstream answers 5xx under load; a short retry keeps the tile
        // from dropping to the placeholder on a blip.
        for (int attempt = 1; attempt <= 3; attempt++) {
            if (attempt > 1) {
                try {
                    Thread.sleep(1_000L);
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                    return null;
                }
            }
            HttpURLConnection connection = null;
            try {
                connection = (HttpURLConnection) new URL(url).openConnection();
                connection.setConnectTimeout(CONNECT_TIMEOUT_MS);
                connection.setReadTimeout(READ_TIMEOUT_MS);
                connection.setRequestProperty("Accept", "application/json");
                connection.setRequestProperty("User-Agent", USER_AGENT);
                int status = connection.getResponseCode();
                if (status == 200) {
                    return read(connection.getInputStream());
                }
                android.util.Log.e(
                    "MetNorwayWeather", "http " + status + " (attempt " + attempt + ")");
                if (status < 500) {
                    return null;
                }
            } catch (Exception e) {
                android.util.Log.e("MetNorwayWeather", "request attempt " + attempt + " failed", e);
            } finally {
                if (connection != null) {
                    connection.disconnect();
                }
            }
        }
        return null;
    }

    private static String coordinate(float value) {
        return String.format(Locale.ROOT, "%.4f", value);
    }

    private static String read(InputStream stream) throws Exception {
        try (InputStream in = stream; ByteArrayOutputStream out = new ByteArrayOutputStream()) {
            byte[] buffer = new byte[8192];
            int count;
            while ((count = in.read(buffer)) != -1) {
                out.write(buffer, 0, count);
                if (out.size() > MAX_RESPONSE_BYTES) {
                    throw new IllegalStateException("response exceeds " + MAX_RESPONSE_BYTES + " bytes");
                }
            }
            return out.toString(StandardCharsets.UTF_8.name());
        }
    }

    private static String encode(String body, float lat, float lon) throws Exception {
        JSONObject source = new JSONObject(body);
        JSONArray timeseries = source.getJSONObject("properties").getJSONArray("timeseries");
        List<Point> points = readPoints(timeseries);
        if (points.isEmpty()) {
            return null;
        }

        ZoneId zone = ZoneId.systemDefault();
        long now = Instant.now().getEpochSecond();
        Point current = nearest(points, now);
        return NiagaraWeather.payload("met-norway", coordinate(lat), coordinate(lon),
            current(current, zone),
            encodeHourly(hourlyPoints(points), zone),
            encodeDaily(points, lat, lon, zone));
    }

    private static List<Point> readPoints(JSONArray timeseries) {
        List<Point> points = new ArrayList<>();
        for (int i = 0; i < timeseries.length(); i++) {
            JSONObject entry = timeseries.optJSONObject(i);
            Point point = entry == null ? null : Point.of(entry);
            if (point != null) {
                points.add(point);
            }
        }
        return points;
    }

    /**
     * Hourly resolution only covers the next couple of days; the series then
     * steps to six-hourly. Only the leading contiguous run is kept so the
     * tile never draws a straight line across an upstream gap.
     */
    private static List<Point> hourlyPoints(List<Point> points) {
        List<Point> hourly = new ArrayList<>();
        long expected = Long.MIN_VALUE;
        for (Point point : points) {
            if (!hourly.isEmpty() && point.dt != expected) {
                break;
            }
            hourly.add(point);
            expected = point.dt + 3600L;
            if (hourly.size() == MAX_HOURLY_POINTS) {
                break;
            }
        }
        return hourly;
    }

    private static Point nearest(List<Point> points, long now) {
        Point best = points.get(0);
        long bestDelta = Long.MAX_VALUE;
        for (Point point : points) {
            long delta = Math.abs(point.dt - now);
            if (delta < bestDelta) {
                bestDelta = delta;
                best = point;
            }
        }
        return best;
    }

    private static JSONObject current(Point point, ZoneId zone) throws Exception {
        boolean day = daylight(point, zone);
        return new JSONObject()
            .put("dt", point.dt)
            .put("temp", NiagaraWeather.round(point.temperature))
            .put("feels_like", NiagaraWeather.round(point.feelsLike()))
            .put("weather", NiagaraWeather.conditions(
                owmId(point.symbol), description(point.symbol), day));
    }

    private static JSONArray encodeHourly(List<Point> points, ZoneId zone) throws Exception {
        JSONArray encoded = new JSONArray();
        for (Point point : points) {
            boolean day = daylight(point, zone);
            encoded.put(new JSONObject()
                .put("dt", point.dt)
                .put("temp", NiagaraWeather.round(point.temperature))
                .put("feels_like", NiagaraWeather.round(point.feelsLike()))
                .put("pop", 0.0)
                .put("weather", NiagaraWeather.conditions(
                    owmId(point.symbol), description(point.symbol), day)));
        }
        return encoded;
    }

    /**
     * The upstream has no daily block, so each local day is aggregated from the
     * points inside it: min/max are the extremes and the condition is the one
     * forecast nearest local noon.
     */
    private static JSONArray encodeDaily(List<Point> points, double lat, double lon, ZoneId zone)
            throws Exception {
        Map<LocalDate, List<Point>> byDay = new TreeMap<>();
        for (Point point : points) {
            LocalDate date = Instant.ofEpochSecond(point.dt).atZone(zone).toLocalDate();
            byDay.computeIfAbsent(date, key -> new ArrayList<>()).add(point);
        }

        JSONArray encoded = new JSONArray();
        for (Map.Entry<LocalDate, List<Point>> entry : byDay.entrySet()) {
            if (encoded.length() == FORECAST_DAYS) {
                break;
            }
            LocalDate date = entry.getKey();
            List<Point> day = entry.getValue();
            long dayStart = date.atStartOfDay(zone).toEpochSecond();
            long noon = dayStart + 12 * 3600L;

            double min = Double.MAX_VALUE;
            double max = -Double.MAX_VALUE;
            for (Point point : day) {
                min = Math.min(min, point.temperature);
                max = Math.max(max, point.temperature);
            }
            String symbol = nearest(day, noon).symbol;
            long[] sun = NiagaraWeather.sunTimes(date, lat, lon, zone);

            encoded.put(new JSONObject()
                .put("dt", noon)
                .put("sunrise", sun[0])
                .put("sunset", sun[1])
                .put("temp", new JSONObject()
                    .put("day", NiagaraWeather.round((min + max) / 2.0))
                    .put("max", NiagaraWeather.round(max))
                    .put("min", NiagaraWeather.round(min))
                    .put("night", NiagaraWeather.round(min))
                    .put("eve", NiagaraWeather.round(max))
                    .put("morn", NiagaraWeather.round(min)))
                .put("pop", 0.0)
                .put("weather", NiagaraWeather.conditions(
                    owmId(symbol), description(symbol), true)));
        }
        return encoded;
    }

    /**
     * MET Norway only marks day/night in the symbol suffix for some codes, so
     * the suffix decides when present and the decoded local hour otherwise.
     */
    private static boolean daylight(Point point, ZoneId zone) {
        if (point.symbol.endsWith("_day")) {
            return true;
        }
        if (point.symbol.endsWith("_night")) {
            return false;
        }
        int hour = Instant.ofEpochSecond(point.dt).atZone(zone).getHour();
        return hour >= 6 && hour <= 17;
    }

    /** One upstream timeseries entry, flattened to the fields the tile needs. */
    private static final class Point {

        private long dt;
        private double temperature;
        private double humidity;
        private double windSpeed;
        private String symbol;

        static Point of(JSONObject entry) {
            JSONObject data = entry.optJSONObject("data");
            if (data == null) {
                return null;
            }
            JSONObject instant = data.optJSONObject("instant");
            JSONObject details = instant == null ? null : instant.optJSONObject("details");
            if (details == null || details.isNull("air_temperature")) {
                return null;
            }
            Point point = new Point();
            long dt;
            try {
                dt = Instant.parse(entry.optString("time", "")).getEpochSecond();
            } catch (DateTimeParseException e) {
                return null;
            }
            point.dt = dt;
            point.temperature = details.optDouble("air_temperature", 0.0);
            point.humidity = details.optDouble("relative_humidity", 60.0);
            point.windSpeed = details.optDouble("wind_speed", 0.0);

            JSONObject next = null;
            for (String block : new String[] { "next_1_hours", "next_6_hours", "next_12_hours" }) {
                JSONObject candidate = data.optJSONObject(block);
                if (candidate != null) {
                    next = candidate;
                    break;
                }
            }
            JSONObject summary = next == null ? null : next.optJSONObject("summary");
            point.symbol = summary == null
                ? "clearsky_day"
                : summary.optString("symbol_code", "clearsky_day");
            return point;
        }

        /**
         * Upstream publishes no apparent temperature. Wind chill below 10 °C
         * and the NWS heat index above 26 °C cover the cases a tile actually
         * shows; between them the dry-bulb temperature is the honest answer.
         */
        double feelsLike() {
            if (temperature <= 10.0 && windSpeed > 0.0) {
                double windKmh = windSpeed * 3.6;
                return 13.12 + 0.6215 * temperature
                    - 11.37 * Math.pow(windKmh, 0.16)
                    + 0.3965 * temperature * Math.pow(windKmh, 0.16);
            }
            if (temperature >= 26.0) {
                return heatIndex(temperature, humidity);
            }
            return temperature;
        }

        private static double heatIndex(double temperature, double humidity) {
            double t = temperature * 9.0 / 5.0 + 32.0;
            double r = humidity;
            double hi = -42.379 + 2.04901523 * t + 10.14333127 * r
                - 0.22475541 * t * r - 0.00683783 * t * t
                - 0.05481717 * r * r + 0.00122874 * t * t * r
                + 0.00085282 * t * r * r - 0.00000199 * t * t * r * r;
            return (hi - 32.0) * 5.0 / 9.0;
        }
    }

    private static int owmId(String symbol) {
        switch (base(symbol)) {
            case "clearsky":
                return 800;
            case "fair":
                return 801;
            case "partlycloudy":
                return 802;
            case "cloudy":
                return 804;
            case "fog":
                return 741;
            case "lightrain":
                return 500;
            case "rain":
                return 501;
            case "heavyrain":
                return 502;
            case "lightrainshowers":
                return 520;
            case "rainshowers":
                return 521;
            case "heavyrainshowers":
                return 522;
            case "lightsleet":
                return 611;
            case "sleet":
                return 612;
            case "heavysleet":
                return 613;
            case "lightsnow":
                return 600;
            case "snow":
                return 601;
            case "heavysnow":
                return 602;
            case "lightsnowshowers":
                return 620;
            case "snowshowers":
                return 621;
            case "heavysnowshowers":
                return 622;
            case "lightrainandthunder":
            case "rainandthunder":
            case "heavyrainandthunder":
            case "lightsleetandthunder":
            case "sleetandthunder":
            case "heavysleetandthunder":
            case "lightsnowandthunder":
            case "snowandthunder":
            case "heavysnowandthunder":
                return 211;
            default:
                return 800;
        }
    }

    private static String description(String symbol) {
        switch (base(symbol)) {
            case "fair":
                return "mainly clear";
            case "partlycloudy":
                return "partly cloudy";
            case "cloudy":
                return "overcast";
            case "fog":
                return "fog";
            case "lightrain":
                return "light rain";
            case "rain":
                return "rain";
            case "heavyrain":
                return "heavy rain";
            case "lightrainshowers":
                return "light rain showers";
            case "rainshowers":
                return "rain showers";
            case "heavyrainshowers":
                return "heavy rain showers";
            case "lightsleet":
                return "light sleet";
            case "sleet":
                return "sleet";
            case "heavysleet":
                return "heavy sleet";
            case "lightsnow":
                return "light snow";
            case "snow":
                return "snow";
            case "heavysnow":
                return "heavy snow";
            case "lightsnowshowers":
                return "light snow showers";
            case "snowshowers":
                return "snow showers";
            case "heavysnowshowers":
                return "heavy snow showers";
            case "lightrainandthunder":
                return "light rain and thunder";
            case "rainandthunder":
                return "rain and thunder";
            case "heavyrainandthunder":
                return "heavy rain and thunder";
            case "lightsleetandthunder":
                return "light sleet and thunder";
            case "sleetandthunder":
                return "sleet and thunder";
            case "heavysleetandthunder":
                return "heavy sleet and thunder";
            case "lightsnowandthunder":
                return "light snow and thunder";
            case "snowandthunder":
                return "snow and thunder";
            case "heavysnowandthunder":
                return "heavy snow and thunder";
            default:
                return "clear sky";
        }
    }

    /** Strips the trailing {@code _day}/{@code _night} marker from a symbol code. */
    private static String base(String symbol) {
        if (symbol.endsWith("_day")) {
            return symbol.substring(0, symbol.length() - 4);
        }
        if (symbol.endsWith("_night")) {
            return symbol.substring(0, symbol.length() - 6);
        }
        return symbol;
    }
}
