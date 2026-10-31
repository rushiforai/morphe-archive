package app.template.extension.niagaralauncher;

import android.content.Context;
import android.content.SharedPreferences;

import org.json.*;

import java.util.*;
import java.util.concurrent.atomic.AtomicLong;

public final class WeatherSources {
    public static final String PREFS = "urro_weather_v2";
    public static final AtomicLong GENERATION = new AtomicLong();

    public static SharedPreferences preferences(Context c) {
        return c.getSharedPreferences(PREFS, 0);
    }

    public static List<WeatherSource> load(Context c) {
        List<WeatherSource> result = new ArrayList<>();
        String text = preferences(c).getString("sources", null);
        if (text == null) {
            result.add(new WeatherSource("met", "MET Norway", "met"));
            result.add(new WeatherSource("open-meteo", "Open-Meteo", "open-meteo"));
            return result;
        }
        try {
            JSONArray a = new JSONArray(text);
            if (a.length() > 16) throw new JSONException("WeatherSource limit");
            for (int i = 0; i < a.length(); i++) result.add(WeatherSource.read(a.getJSONObject(i)));
        } catch (JSONException e) {
            throw new IllegalStateException("Saved weather configuration is invalid", e);
        }
        return result;
    }

    public static void save(Context c, List<WeatherSource> sources) {
        if (sources.size() > 16) throw new IllegalArgumentException("Maximum 16 sources");
        JSONArray a = new JSONArray();
        try {
            for (WeatherSource s : sources) a.put(s.json());
        } catch (JSONException e) {
            throw new IllegalArgumentException(e);
        }
        if (!preferences(c).edit().putInt("schema", 2).putString("sources", a.toString()).commit())
            throw new IllegalStateException("Could not save weather sources");
        GENERATION.incrementAndGet();
        WeatherBridge.invalidate();
    }

    public static boolean aggregate(Context c) {
        return preferences(c).getBoolean("aggregate", false);
    }

    public static void aggregate(Context c, boolean enabled) {
        preferences(c).edit().putBoolean("aggregate", enabled).apply();
        GENERATION.incrementAndGet();
        WeatherBridge.invalidate();
    }

    public static SharedPreferences nativePreferences(Context c) {
        return c.getSharedPreferences("bitpit.launcher_preferences", 0);
    }

    public static boolean shown(Context c) {
        return nativePreferences(c).getBoolean("bitpit.launcher.key.WEATHER_ENABLED", false);
    }
}
