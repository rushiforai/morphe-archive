package dev.personal.niagaraweather;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/** Converts the standard OpenWeather APIs to the shipped Niagara 1.16.28 schema. */
public final class ForecastAdapter {
  private ForecastAdapter() {}

  public static String convert(JSONObject current, JSONObject forecast, String language)
      throws JSONException {
    JSONObject main = current.getJSONObject("main");
    JSONObject now =
        new JSONObject()
            .put("dt", current.getLong("dt"))
            .put("temp", main.getDouble("temp"))
            .put("feels_like", main.getDouble("feels_like"))
            .put("weather", conditions(current.getJSONArray("weather")));
    JSONArray hours = new JSONArray();
    Map<Long, List<JSONObject>> days = new TreeMap<>();
    JSONObject city = forecast.getJSONObject("city");
    int offset = city.getInt("timezone");
    JSONArray samples = forecast.getJSONArray("list");
    for (int i = 0; i < samples.length(); i++) {
      JSONObject sample = samples.getJSONObject(i);
      long time = sample.getLong("dt");
      JSONObject temperatures = sample.getJSONObject("main");
      hours.put(
          new JSONObject()
              .put("dt", time)
              .put("temp", temperatures.getDouble("temp"))
              .put("feels_like", temperatures.getDouble("feels_like"))
              .put("pop", probability(sample))
              .put("weather", conditions(sample.getJSONArray("weather"))));
      long day = Math.floorDiv(time + offset, 86400L);
      List<JSONObject> group = days.get(day);
      if (group == null) {
        group = new ArrayList<>();
        days.put(day, group);
      }
      group.add(sample);
    }
    JSONArray daily = new JSONArray();
    for (Map.Entry<Long, List<JSONObject>> entry : days.entrySet()) {
      List<JSONObject> group = entry.getValue();
      double min = Double.POSITIVE_INFINITY;
      double max = Double.NEGATIVE_INFINITY;
      double pop = 0;
      for (JSONObject sample : group) {
        JSONObject t = sample.getJSONObject("main");
        min = Math.min(min, t.optDouble("temp_min", t.getDouble("temp")));
        max = Math.max(max, t.optDouble("temp_max", t.getDouble("temp")));
        pop = Math.max(pop, probability(sample));
      }
      JSONObject midday = nearest(group, offset, 12);
      JSONObject temperatures =
          new JSONObject()
              .put("day", temperature(midday))
              .put("min", min)
              .put("max", max)
              .put("night", temperature(nearest(group, offset, 0)))
              .put("eve", temperature(nearest(group, offset, 18)))
              .put("morn", temperature(nearest(group, offset, 6)));
      // Keep actual three-hour samples. Daily ranges cover available samples only.
      // Sunrise/sunset for future dates are not supplied by forecast5; leave optional fields
      // absent.
      daily.put(
          new JSONObject()
              .put("dt", entry.getKey() * 86400L + 43200L - offset)
              .put("temp", temperatures)
              .put("pop", pop)
              .put("weather", conditions(midday.getJSONArray("weather"))));
    }
    if (hours.length() == 0) throw new JSONException("Forecast has no samples");
    JSONObject coordinates = current.getJSONObject("coord");
    return new JSONObject()
        .put("timestamp", System.currentTimeMillis() / 1000L)
        .put("provider", "openweathermap")
        .put("lat", String.valueOf(coordinates.getDouble("lat")))
        .put("long", String.valueOf(coordinates.getDouble("lon")))
        .put("lang", language)
        .put(
            "forecast",
            new JSONObject()
                .put("current", now)
                .put("minutely", new JSONArray())
                .put("hourly", hours)
                .put("daily", daily))
        .toString();
  }

  private static double temperature(JSONObject sample) throws JSONException {
    return sample.getJSONObject("main").getDouble("temp");
  }

  private static JSONObject nearest(List<JSONObject> samples, int offset, int hour)
      throws JSONException {
    JSONObject result = samples.get(0);
    long best = Long.MAX_VALUE;
    for (JSONObject sample : samples) {
      long second = Math.floorMod(sample.getLong("dt") + offset, 86400L);
      long distance = Math.abs(second - hour * 3600L);
      distance = Math.min(distance, 86400L - distance);
      if (distance < best) {
        best = distance;
        result = sample;
      }
    }
    return result;
  }

  private static double probability(JSONObject sample) {
    double value = sample.optDouble("pop", 0);
    return Double.isFinite(value) ? Math.max(0, Math.min(1, value)) : 0;
  }

  private static JSONArray conditions(JSONArray original) throws JSONException {
    JSONArray result = new JSONArray();
    for (int i = 0; i < original.length(); i++) {
      JSONObject condition = original.getJSONObject(i);
      result.put(
          new JSONObject()
              .put("id", condition.getInt("id"))
              .put("description", condition.optString("description", ""))
              .put("icon", condition.optString("icon", "")));
    }
    if (result.length() == 0) throw new JSONException("Weather condition missing");
    return result;
  }
}
