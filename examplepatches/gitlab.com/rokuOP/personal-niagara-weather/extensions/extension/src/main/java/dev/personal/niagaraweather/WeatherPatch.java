package dev.personal.niagaraweather;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.security.keystore.KeyGenParameterSpec;
import android.security.keystore.KeyProperties;
import android.util.Base64;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.KeyStore;
import java.util.Locale;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.GCMParameterSpec;
import javax.net.ssl.HttpsURLConnection;
import org.json.JSONObject;

public final class WeatherPatch {
  public static final String READY = "personal.weather.READY";
  public static final String ENABLED = "bitpit.launcher.key.WEATHER_ENABLED";
  private static final String KEY_ALIAS = "personal-niagara-openweather-v1";
  private static volatile SharedPreferences boundPreferences;
  private static java.lang.ref.WeakReference<Object> weatherService =
      new java.lang.ref.WeakReference<>(null);

  private WeatherPatch() {}

  public static void bind(Context context, SharedPreferences preferences) {
    boundPreferences = preferences;
  }

  public static void bindService(Context context, SharedPreferences preferences, Object service) {
    bind(context, preferences);
    recoverRestoredKey(context, preferences);
    weatherService = new java.lang.ref.WeakReference<>(service);
  }

  static void refresh() {
    Object service = weatherService.get();
    if (service == null) return;
    try {
      service
          .getClass()
          .getMethod("nDwBWVONWzRLhBBZ", boolean.class, long.class)
          .invoke(service, true, System.currentTimeMillis());
    } catch (Exception ignored) {
      /* Native resume/update listeners remain the fallback. */
    }
  }

  static void validatePayload(String payload) throws Exception {
    Class<?> json = Class.forName("b.sA7HZO4tu1HGRf0NeGKrc5");
    Object decoder = json.getField("fO7AVUsg59FX0xLNkI8hhXD2").get(null);
    Object serializer =
        Class.forName("bitpit.launcher.backend.weather.model.WeatherResponse$$serializer")
            .getField("INSTANCE")
            .get(null);
    json.getMethod(
            "scSVXSelHn0vGdEhMIkeOConMr",
            String.class,
            Class.forName("kotlinx.serialization.KSerializer"))
        .invoke(decoder, payload, serializer);
  }

  static boolean publish(String payload) throws Exception {
    Object service = weatherService.get();
    if (service == null) return false;
    Object model =
        service
            .getClass()
            .getMethod("RABvSkqAo10GtuvvLvFAVN", String.class, long.class)
            .invoke(service, payload, System.currentTimeMillis());
    service.getClass().getMethod("Pal87xbGc5Cfza87pL0exy0k4", Object.class).invoke(service, model);
    return true;
  }

  static void recoverRestoredKey(Context context, SharedPreferences preferences) {
    if (!configured(preferences)) return;
    try {
      if (!readKey(context).isEmpty()) return;
    } catch (Exception ignored) {
      /* Keystore material is specific to this installation. */
    }
    preferences.edit().putBoolean(READY, false).putBoolean(ENABLED, false).apply();
    secrets(context).edit().remove("encrypted_key").apply();
    new java.io.File(context.getCacheDir(), "weather2").delete();
  }

  public static boolean allowWeather(SharedPreferences preferences, boolean original) {
    return original || configured(preferences);
  }

  public static boolean configured(SharedPreferences preferences) {
    return preferences.getBoolean(READY, false);
  }

  public static void openSettings(Context context, SharedPreferences preferences) {
    bind(context, preferences);
    Intent intent = new Intent(context, WeatherSettingsActivity.class);
    if (!(context instanceof android.app.Activity)) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
    context.startActivity(intent);
  }

  public static SharedPreferences nativePreferences(Context context) {
    if (boundPreferences != null) return boundPreferences;
    return context.getSharedPreferences("bitpit.launcher_preferences", Context.MODE_PRIVATE);
  }

  static SharedPreferences secrets(Context context) {
    return context.getSharedPreferences("personal_weather_secrets", Context.MODE_PRIVATE);
  }

  public static String payload(
      Context context,
      SharedPreferences preferences,
      float latitude,
      float longitude,
      String language)
      throws IOException {
    try {
      String key = readKey(context);
      if (key.isEmpty())
        throw new IOException("Enter your OpenWeather API key in Weather settings");
      JSONObject current =
          request("weather", "lat=" + latitude + "&lon=" + longitude, key, language);
      return complete(current, key, language);
    } catch (IOException error) {
      throw error;
    } catch (Exception error) {
      throw new IOException("Personal weather could not be loaded");
    }
  }

  /** Morphe's small bytecode hook keeps network work inside Niagara's existing IO coroutine. */
  public static Object fetchIfConfigured(Object service, Object coordinates, String language)
      throws Exception {
    Context context = (Context) service.getClass().getField("kEHhMh5WXvE").get(service);
    SharedPreferences preferences =
        (SharedPreferences) service.getClass().getField("CCnwOKjCwIiCs").get(service);
    if (!configured(preferences)) return null;
    try {
      float latitude =
          coordinates.getClass().getField("scSVXSelHn0vGdEhMIkeOConMr").getFloat(coordinates);
      float longitude =
          coordinates.getClass().getField("lJFNcBQHCClkpT8l7Xkn8v").getFloat(coordinates);
      String response = payload(context, preferences, latitude, longitude, language);
      Object model =
          service
              .getClass()
              .getMethod("RABvSkqAo10GtuvvLvFAVN", String.class, long.class)
              .invoke(service, response, System.currentTimeMillis());
      service
          .getClass()
          .getMethod("PIFjKdTFx4bkGdxkn5oksjktQ8eg", String.class)
          .invoke(service, response);
      return model;
    } catch (Exception error) {
      Exception safe =
          error instanceof IOException
              ? error
              : new IOException("Personal weather could not be updated");
      Exception nativeError;
      try {
        nativeError =
            (Exception)
                Class.forName("bitpit.launcher.weather.NoWeatherDataException")
                    .getConstructor(int.class, Exception.class, String.class)
                    .newInstance(5, safe, null);
      } catch (Exception unavailable) {
        nativeError = safe;
      }
      throw nativeError;
    }
  }

  static JSONObject current(String city, String key, String language) throws IOException {
    return request("weather", "q=" + encode(city), key, language);
  }

  static JSONObject current(float latitude, float longitude, String key, String language)
      throws IOException {
    return request("weather", "lat=" + latitude + "&lon=" + longitude, key, language);
  }

  static String complete(JSONObject current, String key, String language) throws IOException {
    try {
      JSONObject coordinates = current.getJSONObject("coord");
      JSONObject forecast =
          request(
              "forecast",
              "lat=" + coordinates.getDouble("lat") + "&lon=" + coordinates.getDouble("lon"),
              key,
              language);
      return ForecastAdapter.convert(current, forecast, language);
    } catch (IOException error) {
      throw error;
    } catch (Exception error) {
      throw new IOException("OpenWeather returned an incomplete forecast");
    }
  }

  private static JSONObject request(String endpoint, String location, String key, String language)
      throws IOException {
    HttpsURLConnection connection = null;
    try {
      URL url =
          new URL(
              "https://api.openweathermap.org/data/2.5/"
                  + endpoint
                  + "?"
                  + location
                  + "&appid="
                  + encode(key)
                  + "&units=metric&lang="
                  + encode(language));
      connection = (HttpsURLConnection) url.openConnection();
      connection.setInstanceFollowRedirects(false);
      connection.setConnectTimeout(12000);
      connection.setReadTimeout(12000);
      connection.setRequestProperty("Accept", "application/json");
      int status = connection.getResponseCode();
      if (status == 401)
        throw new IOException("OpenWeather rejected the API key. Check that it is active.");
      if (status == 404) throw new IOException("Location not found. Try City, country code.");
      if (status == 429)
        throw new IOException("OpenWeather request limit reached. Try again later.");
      if (status != 200) throw new IOException("OpenWeather is unavailable (HTTP " + status + ")");
      try (InputStream stream = connection.getInputStream();
          ByteArrayOutputStream output = new ByteArrayOutputStream()) {
        byte[] buffer = new byte[8192];
        int count;
        while ((count = stream.read(buffer)) != -1) {
          if (output.size() + count > 2 * 1024 * 1024)
            throw new IOException("Weather response too large");
          output.write(buffer, 0, count);
        }
        return new JSONObject(output.toString(StandardCharsets.UTF_8.name()));
      }
    } catch (IOException error) {
      // Never retain the URL, response body or exception cause: each can contain the API key.
      String message = error.getMessage();
      if (message != null
          && (message.startsWith("OpenWeather ")
              || message.startsWith("Location ")
              || message.equals("Weather response too large"))) throw new IOException(message);
      throw new IOException("Could not reach OpenWeather. Check your connection.");
    } catch (Exception error) {
      throw new IOException("OpenWeather returned an invalid response");
    } finally {
      if (connection != null) connection.disconnect();
    }
  }

  private static String encode(String value) throws IOException {
    return URLEncoder.encode(value, StandardCharsets.UTF_8.name());
  }

  static String readKey(Context context) throws Exception {
    String saved = secrets(context).getString("encrypted_key", "");
    if (saved.isEmpty()) return "";
    String[] parts = saved.split(":", -1);
    if (parts.length != 2) return "";
    Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
    cipher.init(
        Cipher.DECRYPT_MODE,
        encryptionKey(),
        new GCMParameterSpec(128, Base64.decode(parts[0], Base64.NO_WRAP)));
    return new String(
        cipher.doFinal(Base64.decode(parts[1], Base64.NO_WRAP)), StandardCharsets.UTF_8);
  }

  static void saveKey(Context context, String key) throws Exception {
    Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
    cipher.init(Cipher.ENCRYPT_MODE, encryptionKey());
    String saved =
        Base64.encodeToString(cipher.getIV(), Base64.NO_WRAP)
            + ":"
            + Base64.encodeToString(
                cipher.doFinal(key.getBytes(StandardCharsets.UTF_8)), Base64.NO_WRAP);
    if (!secrets(context).edit().putString("encrypted_key", saved).commit())
      throw new IOException("Could not save the API key");
  }

  private static synchronized SecretKey encryptionKey() throws Exception {
    KeyStore store = KeyStore.getInstance("AndroidKeyStore");
    store.load(null);
    if (!store.containsAlias(KEY_ALIAS)) {
      KeyGenerator generator =
          KeyGenerator.getInstance(KeyProperties.KEY_ALGORITHM_AES, "AndroidKeyStore");
      generator.init(
          new KeyGenParameterSpec.Builder(
                  KEY_ALIAS, KeyProperties.PURPOSE_ENCRYPT | KeyProperties.PURPOSE_DECRYPT)
              .setBlockModes(KeyProperties.BLOCK_MODE_GCM)
              .setEncryptionPaddings(KeyProperties.ENCRYPTION_PADDING_NONE)
              .build());
      generator.generateKey();
    }
    return ((KeyStore.SecretKeyEntry) store.getEntry(KEY_ALIAS, null)).getSecretKey();
  }

  static String language() {
    return Locale.getDefault().getLanguage();
  }
}
