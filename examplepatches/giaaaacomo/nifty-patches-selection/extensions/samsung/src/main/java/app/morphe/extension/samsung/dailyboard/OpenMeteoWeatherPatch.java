/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */
package app.morphe.extension.samsung.dailyboard;

import android.Manifest;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.location.Address;
import android.location.Geocoder;
import android.location.Location;
import android.location.LocationManager;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Locale;

public final class OpenMeteoWeatherPatch {
    private static final String CACHE = "morphe_open_meteo";
    private static final String PROVIDER = "OPEN_METEO";
    private static final long CACHE_LIFETIME_MS = 30L * 60L * 1000L;

    private OpenMeteoWeatherPatch() {
    }

    public static void updateWeather(Context context) {
        SharedPreferences cache = context.getSharedPreferences(CACHE, Context.MODE_PRIVATE);
        WeatherResult result = null;

        if (System.currentTimeMillis() - cache.getLong("fetchedAt", 0L) < CACHE_LIFETIME_MS) {
            result = WeatherResult.fromCache(cache);
        }

        if (result == null) {
            Location location = lastLocation(context);
            if (location != null) {
                try {
                    result = fetch(context, location.getLatitude(), location.getLongitude());
                    result.save(cache);
                } catch (Exception ignored) {
                    result = WeatherResult.fromCache(cache);
                }
            } else {
                result = WeatherResult.fromCache(cache);
            }
        }

        if (result != null) installWeatherData(result);
    }

    public static boolean bindWeatherSource(TextView view, Object weatherData) {
        try {
            if (!PROVIDER.equals(getField(weatherData, "f"))) return false;
            view.setCompoundDrawablesWithIntrinsicBounds(null, null, null, null);
            view.setText("Open-Meteo");
            view.setContentDescription("Open-Meteo");
            return true;
        } catch (ReflectiveOperationException ignored) {
            return false;
        }
    }

    private static WeatherResult fetch(Context context, double latitude, double longitude)
            throws Exception {
        String endpoint = String.format(
                Locale.US,
                "https://api.open-meteo.com/v1/forecast?latitude=%.5f&longitude=%.5f" +
                        "&current=temperature_2m,weather_code,is_day" +
                        "&daily=sunrise,sunset&timeformat=unixtime&timezone=auto&forecast_days=1",
                latitude,
                longitude
        );

        HttpURLConnection connection = (HttpURLConnection) new URL(endpoint).openConnection();
        connection.setConnectTimeout(5000);
        connection.setReadTimeout(5000);
        connection.setRequestProperty("Accept", "application/json");
        try {
            if (connection.getResponseCode() != HttpURLConnection.HTTP_OK) {
                throw new IllegalStateException("Open-Meteo HTTP " + connection.getResponseCode());
            }

            JSONObject root = new JSONObject(read(connection.getInputStream()));
            JSONObject current = root.getJSONObject("current");
            JSONObject daily = root.getJSONObject("daily");
            WeatherResult result = new WeatherResult();
            result.latitude = latitude;
            result.longitude = longitude;
            result.temperature = (float) current.getDouble("temperature_2m");
            result.weatherCode = current.getInt("weather_code");
            result.isDay = current.optInt("is_day", 1) == 1;
            result.updatedAt = current.getLong("time") * 1000L;
            result.sunrise = firstLong(daily.getJSONArray("sunrise")) * 1000L;
            result.sunset = firstLong(daily.getJSONArray("sunset")) * 1000L;
            result.locationName = locationName(context, latitude, longitude);
            result.description = description(result.weatherCode);
            return result;
        } finally {
            connection.disconnect();
        }
    }

    private static void installWeatherData(WeatherResult result) {
        try {
            Class<?> weatherClass = Class.forName("w0.b");
            Constructor<?> constructor = weatherClass.getDeclaredConstructor();
            constructor.setAccessible(true);
            Object weather = constructor.newInstance();

            setField(weather, "a", "open-meteo:current");
            setField(weather, "b", result.locationName);
            setField(weather, "c", result.locationName);
            setField(weather, "d", "");
            setField(weather, "e", 1);
            setField(weather, "f", PROVIDER);
            setField(weather, "g", result.updatedAt);
            setField(weather, "h", result.updatedAt);
            setField(weather, "i", result.isDay ? result.sunrise : 0L);
            setField(weather, "j", result.isDay ? result.sunset : 1L);
            setField(weather, "k", result.isDay ? 0 : 1);
            setField(weather, "l", result.temperature);
            setField(weather, "m", samsungIcon(result.weatherCode));
            setField(weather, "n", result.description);
            setField(weather, "o", "https://open-meteo.com/");
            setField(weather, "p", 10);
            setField(weather, "q", "");
            setField(weather, "r", 0.0f);
            setField(weather, "s", 0);

            Class<?> repositoryClass = Class.forName("k1.c");
            Field dataField = repositoryClass.getDeclaredField("g");
            dataField.setAccessible(true);
            dataField.set(null, weather);
        } catch (ReflectiveOperationException ignored) {
            // Exact class and field names are guarded by the patch compatibility version.
        }
    }

    private static Location lastLocation(Context context) {
        if (context.checkSelfPermission(Manifest.permission.ACCESS_COARSE_LOCATION) !=
                PackageManager.PERMISSION_GRANTED) return null;

        LocationManager manager = context.getSystemService(LocationManager.class);
        if (manager == null) return null;

        Location best = null;
        for (String provider : manager.getProviders(true)) {
            try {
                Location candidate = manager.getLastKnownLocation(provider);
                if (candidate != null && (best == null || candidate.getTime() > best.getTime())) {
                    best = candidate;
                }
            } catch (SecurityException ignored) {
                // A fine-only provider can still appear with approximate location access.
            }
        }
        return best;
    }

    @SuppressWarnings("deprecation")
    private static String locationName(Context context, double latitude, double longitude) {
        try {
            if (!Geocoder.isPresent()) return "Current location";
            List<Address> addresses = new Geocoder(context, Locale.getDefault())
                    .getFromLocation(latitude, longitude, 1);
            if (addresses == null || addresses.isEmpty()) return "Current location";
            Address address = addresses.get(0);
            if (address.getLocality() != null) return address.getLocality();
            if (address.getAdminArea() != null) return address.getAdminArea();
            if (address.getCountryName() != null) return address.getCountryName();
        } catch (Exception ignored) {
            // The weather remains useful without reverse geocoding.
        }
        return "Current location";
    }

    private static int samsungIcon(int code) {
        if (code == 0) return 0;
        if (code <= 2) return 1;
        if (code == 3) return 2;
        if (code == 45 || code == 48) return 3;
        if (code >= 51 && code <= 65) return code == 65 ? 21 : 4;
        if (code == 66 || code == 67) return 15;
        if (code == 71 || code == 77) return 10;
        if (code == 73 || code == 75) return 13;
        if (code == 80 || code == 81) return 5;
        if (code == 82) return 21;
        if (code == 85) return 11;
        if (code == 86) return 26;
        if (code == 95) return 8;
        if (code == 96 || code == 99) return 28;
        return 1;
    }

    private static String description(int code) {
        boolean italian = Locale.getDefault().getLanguage().equals(Locale.ITALIAN.getLanguage());
        if (code == 0) return italian ? "Sereno" : "Clear";
        if (code <= 2) return italian ? "Parzialmente nuvoloso" : "Partly cloudy";
        if (code == 3) return italian ? "Coperto" : "Overcast";
        if (code == 45 || code == 48) return italian ? "Nebbia" : "Fog";
        if (code >= 51 && code <= 67) return italian ? "Pioggia" : "Rain";
        if (code >= 71 && code <= 77) return italian ? "Neve" : "Snow";
        if (code >= 80 && code <= 82) return italian ? "Rovesci" : "Showers";
        if (code == 85 || code == 86) return italian ? "Rovesci di neve" : "Snow showers";
        if (code >= 95) return italian ? "Temporale" : "Thunderstorm";
        return italian ? "Meteo" : "Weather";
    }

    private static long firstLong(JSONArray values) throws Exception {
        return values.getLong(0);
    }

    private static String read(InputStream stream) throws Exception {
        StringBuilder result = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(
                new InputStreamReader(stream, StandardCharsets.UTF_8))) {
            String line;
            while ((line = reader.readLine()) != null) result.append(line);
        }
        return result.toString();
    }

    private static Object getField(Object target, String name) throws ReflectiveOperationException {
        Field field = target.getClass().getDeclaredField(name);
        field.setAccessible(true);
        return field.get(target);
    }

    private static void setField(Object target, String name, Object value)
            throws ReflectiveOperationException {
        Field field = target.getClass().getDeclaredField(name);
        field.setAccessible(true);
        field.set(target, value);
    }

    private static final class WeatherResult {
        double latitude;
        double longitude;
        float temperature;
        int weatherCode;
        boolean isDay;
        long updatedAt;
        long sunrise;
        long sunset;
        String locationName;
        String description;

        void save(SharedPreferences preferences) {
            preferences.edit()
                    .putLong("fetchedAt", System.currentTimeMillis())
                    .putLong("latitude", Double.doubleToRawLongBits(latitude))
                    .putLong("longitude", Double.doubleToRawLongBits(longitude))
                    .putFloat("temperature", temperature)
                    .putInt("weatherCode", weatherCode)
                    .putBoolean("isDay", isDay)
                    .putLong("updatedAt", updatedAt)
                    .putLong("sunrise", sunrise)
                    .putLong("sunset", sunset)
                    .putString("locationName", locationName)
                    .putString("description", description)
                    .apply();
        }

        static WeatherResult fromCache(SharedPreferences preferences) {
            if (!preferences.contains("updatedAt")) return null;
            WeatherResult result = new WeatherResult();
            result.latitude = Double.longBitsToDouble(preferences.getLong("latitude", 0L));
            result.longitude = Double.longBitsToDouble(preferences.getLong("longitude", 0L));
            result.temperature = preferences.getFloat("temperature", 0.0f);
            result.weatherCode = preferences.getInt("weatherCode", 0);
            result.isDay = preferences.getBoolean("isDay", true);
            result.updatedAt = preferences.getLong("updatedAt", 0L);
            result.sunrise = preferences.getLong("sunrise", 0L);
            result.sunset = preferences.getLong("sunset", 0L);
            result.locationName = preferences.getString("locationName", "Current location");
            result.description = preferences.getString("description", "Weather");
            return result;
        }
    }
}
