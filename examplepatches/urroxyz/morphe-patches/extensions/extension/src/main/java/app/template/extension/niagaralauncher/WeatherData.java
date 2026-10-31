package app.template.extension.niagaralauncher;

import org.json.*;

import java.time.*;
import java.util.*;

/** Missing values stay missing until the native presentation boundary. */
public final class WeatherData {
    public static final String[] CURRENT = {
        "dt", "temp", "feels_like", "id", "description", "icon"
    };
    public static final String[] HOURLY = {
        "dt", "temp", "feels_like", "pop", "id", "description", "icon"
    };
    public static final String[] DAILY = {
        "dt",
        "sunrise",
        "sunset",
        "day",
        "min",
        "max",
        "night",
        "eve",
        "morn",
        "pop",
        "id",
        "description",
        "icon"
    };

    public static final class Point {
        public long time;
        public final Map<String, Double> numbers = new LinkedHashMap<>();
        public Integer condition;
        public String description, icon;

        public Point(long t) {
            time = t;
        }

        public Point copy() {
            Point p = new Point(time);
            p.numbers.putAll(numbers);
            p.condition = condition;
            p.description = description;
            p.icon = icon;
            return p;
        }

        public boolean temperature() {
            return numbers.containsKey("temp");
        }
    }

    public Point current;
    public final TreeMap<Long, Point> hourly = new TreeMap<>(), daily = new TreeMap<>();
    public String source = "";
    public final List<String> warnings = new ArrayList<>();

    public boolean available() {
        return current != null && current.temperature() || !hourly.isEmpty() || !daily.isEmpty();
    }

    public static long day(long sec, ZoneId zone) {
        return Instant.ofEpochSecond(sec)
                .atZone(zone)
                .toLocalDate()
                .atStartOfDay(zone)
                .toEpochSecond();
    }

    public void addHour(Point p) {
        if (p != null && !p.numbers.isEmpty()) hourly.put(Math.floorDiv(p.time, 3600) * 3600, p);
    }

    public void addDay(Point p, ZoneId zone) {
        if (p != null && !p.numbers.isEmpty()) daily.put(day(p.time, zone), p);
    }

    private static Point combine(List<Point> points, boolean average) {
        if (points.isEmpty()) return null;
        Point result = new Point(points.get(0).time);
        Map<String, List<Double>> values = new LinkedHashMap<>();
        for (Point p : points) {
            result.time = Math.max(result.time, p.time);
            for (Map.Entry<String, Double> v : p.numbers.entrySet())
                if (Double.isFinite(v.getValue()))
                    values.computeIfAbsent(v.getKey(), k -> new ArrayList<>()).add(v.getValue());
        }
        for (Map.Entry<String, List<Double>> v : values.entrySet()) {
            double n = v.getValue().get(0);
            if (average && !v.getKey().equals("sunrise") && !v.getKey().equals("sunset")) {
                n = 0;
                for (double x : v.getValue()) n += x;
                n /= v.getValue().size();
            }
            result.numbers.put(v.getKey(), n);
        }
        Point selected = null;
        if (average) {
            Map<Integer, Integer> votes = new LinkedHashMap<>();
            for (Point p : points)
                if (p.condition != null)
                    votes.put(p.condition, votes.getOrDefault(p.condition, 0) + 1);
            int count = 0;
            for (Point p : points)
                if (p.condition != null && votes.get(p.condition) > count) {
                    selected = p;
                    count = votes.get(p.condition);
                }
        } else
            for (Point p : points)
                if (p.condition != null || p.description != null) {
                    selected = p;
                    break;
                }
        if (selected != null) {
            result.condition = selected.condition;
            result.icon = selected.icon;
            result.description = selected.description;
        }
        return result;
    }

    public static WeatherData merge(List<WeatherData> sources, boolean average) {
        WeatherData out = new WeatherData();
        List<Point> current = new ArrayList<>();
        TreeSet<Long> hs = new TreeSet<>(), ds = new TreeSet<>();
        List<String> names = new ArrayList<>();
        for (WeatherData d : sources) {
            if (d.current != null) current.add(d.current);
            hs.addAll(d.hourly.keySet());
            ds.addAll(d.daily.keySet());
            if (d.available()) names.add(d.source);
            out.warnings.addAll(d.warnings);
        }
        out.current = combine(current, average);
        for (long t : hs) {
            List<Point> ps = new ArrayList<>();
            for (WeatherData d : sources) if (d.hourly.containsKey(t)) ps.add(d.hourly.get(t));
            out.hourly.put(t, combine(ps, average));
        }
        for (long t : ds) {
            List<Point> ps = new ArrayList<>();
            for (WeatherData d : sources) if (d.daily.containsKey(t)) ps.add(d.daily.get(t));
            out.daily.put(t, combine(ps, average));
        }
        out.source = (average ? "Aggregate: " : "Sources: ") + String.join(", ", names);
        return out;
    }

    public static boolean complete(WeatherData d, long now, ZoneId zone) {
        if (d.current == null
                || !d.current.temperature()
                || !d.current.numbers.containsKey("feels_like")
                || d.current.condition == null) return false;
        long start = Math.floorDiv(now, 3600) * 3600;
        for (int i = 1; i <= 24; i++) {
            Point p = d.hourly.get(start + i * 3600);
            if (p == null
                    || !p.temperature()
                    || p.condition == null
                    || !p.numbers.containsKey("feels_like")
                    || !p.numbers.containsKey("pop")) return false;
        }
        LocalDate date = Instant.ofEpochSecond(now).atZone(zone).toLocalDate();
        for (int i = 0; i < 7; i++) {
            Point p = d.daily.get(date.plusDays(i).atStartOfDay(zone).toEpochSecond());
            if (p == null
                    || !p.numbers
                            .keySet()
                            .containsAll(
                                    Arrays.asList(
                                            "min", "max", "morn", "day", "eve", "night", "pop"))
                    || p.condition == null) return false;
        }
        return true;
    }

    public void deriveDays(ZoneId zone) {
        Map<Long, List<Point>> days = new TreeMap<>();
        for (Point p : hourly.values())
            days.computeIfAbsent(day(p.time, zone), k -> new ArrayList<>()).add(p);
        for (Map.Entry<Long, List<Point>> item : days.entrySet()) {
            List<Point> ps = item.getValue();
            Point d = daily.get(item.getKey());
            if (d == null) d = new Point(item.getKey());
            double min = Double.POSITIVE_INFINITY, max = Double.NEGATIVE_INFINITY;
            for (Point p : ps)
                if (p.temperature()) {
                    min = Math.min(min, p.numbers.get("temp"));
                    max = Math.max(max, p.numbers.get("temp"));
                }
            // Sampled extrema are only derived when the date has near-complete time coverage.
            long first = ps.get(0).time, last = ps.get(ps.size() - 1).time;
            if (last - first >= 18 * 3600 && Double.isFinite(min)) {
                d.numbers.putIfAbsent("min", min);
                d.numbers.putIfAbsent("max", max);
            }
            for (int i = 0; i < 4; i++) {
                String key = new String[] {"night", "morn", "day", "eve"}[i];
                int hour = new int[] {0, 6, 12, 18}[i];
                long target =
                        Instant.ofEpochSecond(item.getKey())
                                .atZone(zone)
                                .withHour(hour)
                                .toEpochSecond();
                Point nearest = null;
                long distance = Long.MAX_VALUE;
                for (Point p : ps)
                    if (p.temperature() && Math.abs(p.time - target) < distance) {
                        nearest = p;
                        distance = Math.abs(p.time - target);
                    }
                if (nearest != null && distance <= 3 * 3600)
                    d.numbers.putIfAbsent(key, nearest.numbers.get("temp"));
            }
            if (d.condition == null) {
                List<Point> noon = new ArrayList<>();
                for (Point p : ps)
                    if (Instant.ofEpochSecond(p.time).atZone(zone).getHour() >= 9
                            && Instant.ofEpochSecond(p.time).atZone(zone).getHour() <= 18)
                        noon.add(p);
                Point c = combine(noon, true);
                if (c != null) {
                    d.condition = c.condition;
                    d.icon = c.icon;
                    d.description = c.description;
                }
            }
            if (!d.numbers.isEmpty()) daily.put(item.getKey(), d);
        }
    }

    static JSONArray condition(Point p) throws JSONException {
        JSONArray a = new JSONArray();
        if (p.condition != null && p.icon != null && !p.icon.isEmpty())
            a.put(
                    new JSONObject()
                            .put("id", p.condition)
                            .put("description", p.description == null ? "" : p.description)
                            .put("icon", p.icon));
        return a;
    }

    static JSONObject nativePoint(Point p) throws JSONException {
        JSONObject o =
                new JSONObject()
                        .put("dt", p.time)
                        .put("temp", p.numbers.get("temp"))
                        .put(
                                "feels_like",
                                p.numbers.getOrDefault("feels_like", p.numbers.get("temp")))
                        .put("weather", condition(p));
        o.put("pop", p.numbers.getOrDefault("pop", -1.0));
        return o;
    }

    public JSONObject nativeJson(double lat, double lon, long now, ZoneId zone)
            throws JSONException {
        if (current == null || !current.temperature())
            throw new IllegalArgumentException("No current temperature from enabled sources");
        JSONArray h = new JSONArray(), days = new JSONArray();
        long end =
                Instant.ofEpochSecond(now)
                        .atZone(zone)
                        .toLocalDate()
                        .plusDays(7)
                        .atStartOfDay(zone)
                        .toEpochSecond();
        for (Point p : hourly.values())
            if (p.temperature() && p.time > now && p.time < end) h.put(nativePoint(p));
        for (Point p : daily.values())
            if (p.time >= day(now, zone)
                    && p.time < end
                    && p.numbers
                            .keySet()
                            .containsAll(
                                    Arrays.asList("day", "min", "max", "night", "eve", "morn"))) {
                JSONObject t = new JSONObject();
                for (String key : new String[] {"day", "min", "max", "night", "eve", "morn"})
                    t.put(key, p.numbers.get(key));
                JSONObject v =
                        new JSONObject()
                                .put("dt", p.time)
                                .put("temp", t)
                                .put("weather", condition(p));
                for (String key : new String[] {"sunrise", "sunset"})
                    if (p.numbers.containsKey(key)) v.put(key, p.numbers.get(key));
                v.put("pop", p.numbers.getOrDefault("pop", -1.0));
                days.put(v);
            }
        return new JSONObject()
                .put("timestamp", now)
                .put("provider", source)
                .put("lat", String.valueOf(lat))
                .put("long", String.valueOf(lon))
                .put("lang", "en")
                .put(
                        "forecast",
                        new JSONObject()
                                .put("current", nativePoint(current))
                                .put("hourly", h)
                                .put("daily", days));
    }

    public JSONObject json() throws JSONException {
        JSONObject o = new JSONObject().put("source", source);
        if (current != null) o.put("current", pointJson(current));
        JSONArray h = new JSONArray(), d = new JSONArray();
        for (Point p : hourly.values()) h.put(pointJson(p));
        for (Point p : daily.values()) d.put(pointJson(p));
        return o.put("hourly", h).put("daily", d).put("warnings", new JSONArray(warnings));
    }

    private static JSONObject pointJson(Point p) throws JSONException {
        JSONObject o =
                new JSONObject().put("time", p.time).put("numbers", new JSONObject(p.numbers));
        if (p.condition != null) o.put("condition", p.condition);
        if (p.description != null) o.put("description", p.description);
        if (p.icon != null) o.put("icon", p.icon);
        return o;
    }

    private static Point readPoint(JSONObject o) throws JSONException {
        Point p = new Point(o.getLong("time"));
        JSONObject n = o.getJSONObject("numbers");
        Iterator<String> it = n.keys();
        while (it.hasNext()) {
            String k = it.next();
            p.numbers.put(k, n.getDouble(k));
        }
        if (o.has("condition")) p.condition = o.getInt("condition");
        p.description = o.optString("description", null);
        p.icon = o.optString("icon", null);
        return p;
    }

    public static WeatherData read(JSONObject o) throws JSONException {
        WeatherData d = new WeatherData();
        d.source = o.optString("source");
        if (o.has("current")) d.current = readPoint(o.getJSONObject("current"));
        for (int i = 0; i < o.getJSONArray("hourly").length(); i++) {
            Point p = readPoint(o.getJSONArray("hourly").getJSONObject(i));
            d.addHour(p);
        }
        for (int i = 0; i < o.getJSONArray("daily").length(); i++) {
            Point p = readPoint(o.getJSONArray("daily").getJSONObject(i));
            d.daily.put(p.time, p);
        }
        JSONArray w = o.optJSONArray("warnings");
        if (w != null) for (int i = 0; i < w.length(); i++) d.warnings.add(w.getString(i));
        return d;
    }
}
